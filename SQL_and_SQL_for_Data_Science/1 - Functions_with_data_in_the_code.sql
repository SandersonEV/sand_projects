-- USING SOME FUNCTIONS:

-- Here i'll upload some simple data so practice some of learning:

-- Drop the PETRESCUE table in case it exists
DROP TABLE PETRESCUE;
-- Create the PETRESCUE table 
CREATE TABLE PETRESCUE (
    ID INTEGER NOT NULL,
    ANIMAL VARCHAR(20),
    QUANTITY INTEGER,
    COST DECIMAL(6,2),
    RESCUEDATE DATE,
    PRIMARY KEY (ID)
  );
-- Insert sample data into PETRESCUE table
INSERT
  INTO PETRESCUE
  VALUES 
	(1,'Cat',9,450.09,'2018-05-29') ,
	(2,'Dog',3,666.66,'2018-06-01'),
	(3,'Dog',1,100.00,'2018-06-04'),
	(4,'Parrot',2,50.00,'2018-06-04'),
	(5,'Dog',1,75.75,'2018-06-10'),
	(6,'Hamster',6,60.60,'2018-06-11'),
	(7,'Cat',1,44.44,'2018-06-11'),
	(8,'Goldfish',24,48.48,'2018-06-14'),
	(9,'Dog',2,222.22,'2018-06-15');


-- 

-- Query A1: Enter a function that calculates the total cost of all animal rescues in the PETRESCUE table.
SELECT SUM(COST)
  FROM PETRESCUE;

-- Query A2: Enter a function that displays the total cost of all animal rescues in the PETRESCUE table in a column called SUM_OF_COST.
SELECT SUM(COST)AS SUM_OF_COST
  FROM PETRESCUE;
 
-- Query A3: Enter a function that displays the maximum quantity of animals rescued.
SELECT MAX(QUANTITY) AS MAX_ANIMAL_RESCUED
  FROM PETRESCUE; 

-- Query A4: Enter a function that displays the average cost of animals rescued.
SELECT
   TRUNCATE(AVG(COST/QUANTITY),2) AS AVG_RESCUE_COST
  FROM PETRESCUE; 

-- Query A5: Enter a function that displays the average cost of rescuing a dog.
SELECT
   TRUNCATE(AVG(COST/QUANTITY),2) AS AVG_RESCUE_COST
  FROM PETRESCUE
  WHERE UPPER(ANIMAL) = 'DOG'; 

-- Query B1: Enter a function that displays the rounded cost of each rescue.
SELECT ROUND(COST,1) AS ROUND_COST
  FROM PETRESCUE;

-- Query B2: Enter a function that displays the length of each animal name.
SELECT LENGTH(ANIMAL) AS LENGHT_NAME
  FROM PETRESCUE;

-- Query B3: Enter a function that displays the animal name in each rescue in uppercase.
SELECT UPPER(ANIMAL) AS ANIMAL_UP
  FROM PETRESCUE;

-- Query B4: Enter a function that displays the animal name in each rescue in uppercase without duplications.
SELECT DISTINCT(UPPER(ANIMAL)) AS ANIMAL_UP
  FROM PETRESCUE;

-- Query B5: Enter a query that displays all the columns from the PETRESCUE table, where the animal(s) rescued are cats. Use cat in lower case in the query.
SELECT *
  FROM PETRESCUE
  WHERE LOWER(ANIMAL) = 'cat';

-- Query C1: Enter a function that displays the day of the month when cats have been rescued.
SELECT ANIMAL, DAY(RESCUEDATE) AS DAY, MONTH(RESCUEDATE) AS MONTH
  FROM PETRESCUE
  WHERE LOWER(ANIMAL) = 'cat';

-- Query C2: Enter a function that displays the number of rescues on the 5th month.
SELECT SUM(QUANTITY) AS NUM_RESCUES
  FROM PETRESCUE
  WHERE MONTH(RESCUEDATE) = 5;

-- Query C3: Enter a function that displays the number of rescues on the 14th day of the month.
SELECT SUM(QUANTITY) AS NUM_RESCUES
  FROM PETRESCUE
  WHERE DAY(RESCUEDATE) = 14;

-- Query C4: Animals rescued should see the vet within three days of arrivals. Enter a function that displays the third day from each rescue.
SELECT ID, RESCUEDATE + 3 DAYS
  FROM PETRESCUE;

-- Query C5: Enter a function that displays the length of time the animals have been rescued; the difference between today’s date and the rescue date.
SELECT ID, CURRENT_DATE - RESCUEDATE
  FROM PETRESCUE;