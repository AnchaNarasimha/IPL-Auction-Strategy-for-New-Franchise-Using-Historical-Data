create table wicket_keepers (Wicketkeeper varchar,Matches int,Innings int,Total_runs int,Balls_faced int,Batting_strike_rate decimal(5,2),Batting_Average decimal(5,2),Stumpings int,Catches int,Dismissals int,Bowling_strike_rate decimal(5,2),Bowling_economy decimal(5,2),Balls_bowled int,Wickets_taken int);

select * from wicket_keepers;

insert into wicket_keepers values 
('MS Dhoni',250,217,5082,4192,135.96,39.09,42,142,184,0,0,0,0),
('Dinesh Karthik',242,221,4516,3403,132.71,25.81,36,141,177,0,0,0,0),
('Wriddhiman Saha',161,136,2798,2185,128.05,24.98,24,88,112,0,0,0,0),
('Robin Uthappa',205,197,4952,3783,130.35,27.51,32,92,124,0,0,0,0),
('Parthiv Patel',139,137,2848,2248,120.78,22.60,16,69,85,0,0,0,0),
('Naman Ojha',113,94,1554,1313,118.35,20.72,10,64,74,0,0,0,0),
('Rishabh Pant',98,97,2838,1918,147.97,34.61,18,64,82,0,0,0,0),
('Adam Gilchrist',80,80,2069,1479,138.39,27.22,16,51,67,1,0,1,1),
('Quinton Dekock',96,96,2907,2166,134.21,32.30,15,64,79,0,0,0,0),
('KL Rahul',118,109,4163,3983,134.42,46.78,5,61,66,0,0,0,0),
('Sanju Samson',152,148,3888,2713,137.19,29.23,15,76,91,0,0,0,0),
('Kumar Sangakkara',71,51,1687,1330,121.19,25.95,9,33,42,0,0,0,0),
('AB Devilliers',184,52,5162,3323,151.68,39.70,8,118,126,0,0,0,0),
('SP Goswami',31,28,293,227,99.32,14.65,7,17,24,0,0,0,0),
('Jos Buttler',96,95,3223,2171,148.32,37.92,1,52,53,0,0,0,0),
('Jonny Bairstow',39,39,1291,908,142.65,35.86,4,20,24,0,0,0,0),
('Nicholas Pooran',62,59,1270,810,156.79,27.02,4,25,29,0,0,0,0),
('Philip Salt',9,9,218,133,163.91,27.25,0,5,5,0,0,0,0),
('Matthew Wade',13,13,179,171,104.68,13.77,1,7,8,0,0,0,0),
('Rahamanullah Gurbaz',11,11,227,170,133.53,20.64,0,10,10,0,0,0,0),
('Srikar Bharat',10,9,199,163,122.09,28.43,1,4,5,0,0,0,0),
('Jitesh Sharma',26,24,543,198,159.24,25.86,4,12,16,0,0,0,0),
('Dhruv Jurel',13,11,152,127,172.73,21.71,0,1,1,0,0,0,0),
('Heinrich Klassen',19,17,514,297,165.81,36.71,5,6,11,0,0,0,0),
('Glenn Phillips',8,8,65,55,118.18,9.29,0,3,3,15.00,8.00,30,2);
