create table ipl_matches (match_id int,match_city varchar,match_date date,player_of_match varchar,venue varchar,neutral_venue int,team1 varchar,team2 varchar,toss_winner varchar,toss_decision varchar,winner varchar,result varchar,result_margin int,elimination varchar,method varchar,umpire1 varchar,umpire2 varchar);

create table ipl_balls (match_id int,inning int,over int,ball int,batsman varchar,non_striker varchar,bowler varchar,batsman_runs int,extra_runs int,total_runs int,is_wicket int,dismissal_kind varchar,player_dismissed varchar,fielder varchar,extras_type varchar,batting_team varchar,bowling_team varchar);

select * from Matches;

select * from deliveries limit 500;

copy ipl_matches from 'D:\Internshala Projects\SQL\IPL Dataset\IPL_matches.csv' csv header;

copy ipl_balls from 'D:\Internshala Projects\SQL\IPL Dataset\IPL_Ball.csv' csv header;

select batsman,
sum(batsman_runs) as runs_scored_by_batsman,
count(ball) as balls_faced_by_batsman,
round((sum(batsman_runs)*1.0/count(ball))*100,2) as strike_rate 
from deliveries where extras_type not in ('wides') group by batsman having count(ball) >= 500 order by strike_rate desc limit 10;


select d.batsman,
sum(d.batsman_runs) as runs_scored_by_batsman,
sum(d.is_wicket) as number_of_dismissals,
count(distinct extract(year from m.match_date)) as seasons_played,
round((sum(d.batsman_runs)*1.0/sum(d.is_wicket)),2) as Average_Batsman 
from deliveries as d join matches as m on d.match_id = m.match_id group by batsman having sum(d.is_wicket)>=1 
and count(distinct extract(year from m.match_date))>2 order by Average_Batsman desc limit 10;


select d.batsman,
sum(d.batsman_runs) as runs_scored_by_batsman,
count(distinct extract(year from m.match_date)) as seasons_played,
sum(case when d.batsman_runs = 4 then 1 else 0 end) as number_of_fours,
sum(case when d.batsman_runs = 6 then 1 else 0 end) as number_of_sixes,
sum(case when d.batsman_runs in (4,6) then 1 else 0 end) as total_number_of_boundaries,
sum(case when d.batsman_runs in (4,6) then d.batsman_runs else 0 end) as runs_scored_by_boundaries,
round((sum(case when d.batsman_runs in (4,6) then d.batsman_runs else 0 end)/(sum(d.batsman_runs)*1.0))*100,2) as percentage_of_boundaries
from deliveries as d join matches as m on d.match_id = m.match_id group by d.batsman having count(distinct extract(year from m.match_date))>2 order by percentage_of_boundaries desc limit 10;


select bowler,
count(ball) as total_balls_bowled,
round(count(ball)*1.0/6) as total_overs_bowled,
sum(total_runs) as total_runs_conceded,
round((sum(total_runs)/round(count(ball)*1.0/6)*1.0),2) as bowler_economy
from deliveries group by bowler having count(ball) >= 500 order by bowler_economy limit 10;


select bowler,
count(ball) as total_balls_bowled,
sum(case when dismissal_kind in ('bowled','caught','caught and bowled','lbw','stumped','hit wicket') then 1 else 0 end) as number_of_wickets_taken,
round((count(ball)*1.0/sum(case when dismissal_kind in ('bowled','caught','caught and bowled','lbw','stumped','hit wicket') then 1 else 0 end)),2) as bowler_strike_rate
from deliveries group by bowler having count(ball) >= 500 order by bowler_strike_rate limit 10;


select batting.batsman as allrounder,
batting.runs_scored_by_batsman as total_runs_scored,
batting.balls_faced_by_batsman as balls_faced,
batting.batting_strike_rate as batting_strike_rate,
bowling.total_balls_bowled as balls_bowled,
bowling.number_of_wickets_taken as wickets_taken,
bowling.bowling_strike_rate as bowling_strike_rate
from 
(select batsman,
sum(batsman_runs) as runs_scored_by_batsman,
count(ball) as balls_faced_by_batsman,
round((sum(batsman_runs)*1.0/count(ball))*100,2) as batting_strike_rate 
from deliveries where extras_type not in ('wides') group by batsman having count(ball) >= 500) as batting
join
(select bowler,
count(ball) as total_balls_bowled,
sum(case when dismissal_kind in ('bowled','caught','caught and bowled','lbw','stumped','hit wicket') then 1 else 0 end) as number_of_wickets_taken,
round((count(ball)*1.0/sum(case when dismissal_kind in ('bowled','caught','caught and bowled','lbw','stumped','hit wicket') then 1 else 0 end)),2) as bowling_strike_rate
from deliveries group by bowler having count(ball) >= 300) as bowling
on batting.batsman = bowling.bowler order by batting_strike_rate desc,bowling_strike_rate asc limit 10;

