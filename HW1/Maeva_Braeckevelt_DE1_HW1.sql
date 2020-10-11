Create schema TBI;
Use TBI;
create table tbiyear
(injury_mechanism varchar(250),
`type` varchar(250),
`year` integer,
rate_est float,
number_est bigint,
primary key (injury_mechanism, `type`, `year`));
SHOW VARIABLES LIKE "secure_file_priv";
LOAD DATA INFILE 'c:/ProgramData/MySQL/MySQL Server 8.0/Uploads/tbi_year.csv'
INTO TABLE TBIyear
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n' 
IGNORE 1 LINES
(injury_mechanism,`type`,`year`,rate_est,@v_number_est)
SET number_est = NULLIF(@v_number_est,'NA');

Use TBI;
create table tbiage
(age_group varchar(50),
`type` varchar(250),
injury_mechanism varchar(250),
number_est bigint,
rate_est float,
primary key (injury_mechanism, `type`, age_group));
SHOW VARIABLES LIKE "secure_file_priv";
LOAD DATA INFILE 'c:/ProgramData/MySQL/MySQL Server 8.0/Uploads/tbi_year.txt'
INTO TABLE tbiage
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n' 
IGNORE 1 LINES
(age_group,`type`, injury_mechanism,rate_est,@v_number_est)
SET number_est = NULLIF(@v_number_est,'NA');


Use TBI;
create table tbimilitary
(diagnosed integer,
`year` integer,
`component` varchar(250),
service varchar(250),
severity varchar(250),
primary key (severity, service, `component`,diagnosed,`year`));
SHOW VARIABLES LIKE "secure_file_priv";
LOAD DATA INFILE 'c:/ProgramData/MySQL/MySQL Server 8.0/Uploads/tbi_military.txt'
INTO TABLE tbimilitary
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n' 
IGNORE 1 LINES
(service,`component`,severity,diagnosed,`year`);


