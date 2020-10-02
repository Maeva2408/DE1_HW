CREATE SCHEMA firstdb4;
USE firstdb4
CREATE TABLE HTF
(id INTEGER NOT NULL,
aircraft VARCHAR(32),
flight_date DATE NOT NULL,
damage VARCHAR(16) NOT NULL,
airline VARCHAR(255) NOT NULL,
state VARCHAR(255),
phase_of_flight VARCHAR(32),
reported_date DATE,
bird_size VARCHAR(16),
cost INTEGER NOT NULL,
speed INTEGER,PRIMARY KEY(id));

SHOW VARIABLES LIKE "secure_file_priv";
LOAD DATA INFILE 'c:/ProgramData/MySQL/MySQL Server 8.0/Uploads/birdstrikes_small.csv' 
INTO TABLE HTF
FIELDS TERMINATED BY ';' 
LINES TERMINATED BY '\r\n' 
IGNORE 1 LINES 
(id, aircraft, flight_date, damage, airline, state, phase_of_flight, @v_reported_date, bird_size, cost, @v_speed)
SET
reported_date = nullif(@v_reported_date, ''),
speed = nullif(@v_speed, '');
-- Exercice 1 : What state figures in the 145th line of our database?
SELECT state FROM htf LIMIT 144,1;
-- Tennessee
-- Exercice 2 : What is flight_date of the latest birstrike in this database?
select Flight_date from htf order by flight_date desc; 
-- 18/04/2000
-- Exercice 3 : What was the cost of the 50th most expensive damage?
select distinct cost from htf order by cost desc limit 49,1; 
-- 5345
-- Exercice 4 : What state figures in the 2nd record, if you filter out all records which have no state and no bird_size specified?
select state from htf where state is not null and bird_size is not null;
-- state not specified (blank)
-- Exercise 5: How many days elapsed between the current date and the flights happening in week 52, for incidents from Colorado? (Hint: use NOW, DATEDIFF, WEEKOFYEAR) - 7579
SELECT flight_date FROM htf WHERE WEEKOFYEAR(flight_date) = '52' AND state = 'Colorado';
-- 01/01/200
SELECT DATEDIFF(NOW(), "2000-01-01");
-- 7580 (one day more than the answer found during the class because today is the 02/10/2020


