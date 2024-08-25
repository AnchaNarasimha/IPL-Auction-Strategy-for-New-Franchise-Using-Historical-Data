select * from Matches;

select * from Deliveries where match_id = 335982 and inning = 1 order by over;

select distinct match_city from Matches;

select count(distinct match_city) as cities_count from Matches;

create table deliveries_v02 as select *, 
case when total_runs >= 4 then 'Boundary' when total_runs = 0 then 'Dot' else 'Other' end as ball_result 
from deliveries;


select * from deliveries_v02 limit 1000;

select ball_result,count(*) from deliveries_v02 where ball_result in ('Boundary','Dot') group by ball_result;

select batting_team,count(ball_result) as boundaries_scored_by_each_team from deliveries_v02 where ball_result = 'Boundary' group by batting_team order by boundaries_scored_by_each_team desc;

select bowling_team,count(ball_result) as dotballs_bowled_by_each_team from deliveries_v02 where ball_result = 'Dot' group by bowling_team order by dotballs_bowled_by_each_team desc;

select dismissal_kind,count(*) as total_dismissals_not_as_NA from deliveries_v02 where dismissal_kind not in ('NA') group by dismissal_kind;

select bowler,sum(extra_runs) as total_extra_runs_concedded_by_bowler from deliveries group by bowler order by total_extra_runs_concedded_by_bowler desc limit 5;

create table deliveries_v03 as select d2.*,m.venue,m.match_date from deliveries_v02 as d2 inner join matches as m on d2.match_id = m.match_id;

select * from deliveries_v03 limit 1000;

select venue,sum(total_runs) as runs_scored_in_each_venue from deliveries_v03 group by venue order by runs_scored_in_each_venue desc;

select extract(year from match_date) as ipl_year, sum(total_runs) as runs_scored_in_each_year from deliveries_v03 where venue = 'Eden Gardens' group by ipl_year order by runs_scored_in_each_year desc;