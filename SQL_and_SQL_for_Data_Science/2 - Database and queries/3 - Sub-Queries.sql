-- YOU HAVE THREE WAYS TO WORK WITH MULTIPLE TABLES (Sub-queries, Implicit joins, JOIN operators)

-- 1 - TRAINNING SUB-QUERIES------------------------------------------------------------------

-- 1.1 - Execute a failing query (i.e. one which gives an error) to retrieve all employees records whose salary is lower than the average salary.
SELECT F_NAME, L_NAME
  FROM EMPLOYEES
  WHERE SALARY < AVG(SALARY); 
  
 -- YOU'LL GET AN ERRO MSG. YOU'RE USING A AGREGATION FUNCTION WITHOUT THE GROUP BY
-- 1.2 - Execute a working query using a sub-select to retrieve all employees records whose salary is lower than the average salary.
SELECT F_NAME, L_NAME, SALARY
  FROM EMPLOYEES
  WHERE SALARY < (
  SELECT AVG(SALARY)
  FROM EMPLOYEES); 
  
 -- IN THIS CASE IS BETTER TO USE A SUB-QUERY BECAUSE THE OUTPUT OF THIS SUB-QUERY IS A UNIQUE ELEMENT
-- 1.3 - Execute a failing query (i.e. one which gives an error) to retrieve all employees records with EMP_ID, SALARY and maximum salary as MAX_SALARY in every row.
SELECT EMP_ID, SALARY, MAX(SALARY) AS MAX_SALARY
  FROM EMPLOYEES;
  
-- 1.4 - Execute a Column Expression that retrieves all employees records with EMP_ID, SALARY and maximum salary as MAX_SALARY in every row.
SELECT EMP_ID, SALARY, (
  SELECT MAX(SALARY)
  FROM EMPLOYEES) AS MAX_SALARY
  FROM EMPLOYEES;
  
-- 1.5 - Execute a Table Expression for the EMPLOYEES table that excludes columns with sensitive employee data (i.e. does not include columns: SSN, B_DATE, SEX, ADDRESS, SALARY).
SELECT *
  FROM (
  SELECT EMP_ID, F_NAME, L_NAME, JOB_ID, MANAGER_ID, DEP_ID
  FROM EMPLOYEES);

-- 2 - SUB-QUERIES WITH MULTIPLE TABLES ------------------------------------------------------
-- In other words: you'll create a query with a subquery inside using a different table to get the data but both have a relation (a link between two columnn  from different tables)
-- this is good to make a request using two tables and make some kind of joins

-- 2.1 - Retrieve only the EMPLOYEES records that correspond to jobs in the JOBS table.
SELECT *
  FROM EMPLOYEES
  WHERE JOB_ID IN (
  SELECT JOB_IDENT
  FROM JOBS);
-- 2.2 - Retrieve only the list of employees whose JOB_TITLE is Jr. Designer.
SELECT *
  FROM EMPLOYEES
  WHERE JOB_ID IN (
  SELECT JOB_IDENT
  FROM JOBS
  WHERE JOB_TITLE = 'Jr. Designer');
-- 2.3 - Retrieve JOB information and who earn more than $70,000.
SELECT *
  FROM JOBS
  WHERE JOB_IDENT IN (
  SELECT JOB_ID
  FROM EMPLOYEES
  WHERE SALARY > 70000);
-- 2.4 - Retrieve JOB information and whose birth year is after 1976.
SELECT *
  FROM JOBS
  WHERE JOB_IDENT IN (
  SELECT JOB_ID
  FROM EMPLOYEES
  WHERE YEAR(B_DATE) > 1976);
-- 2.5 - Retrieve JOB information for female employees whose birth year is after 1976.
SELECT *
  FROM JOBS
  WHERE JOB_IDENT IN (
  SELECT JOB_ID
  FROM EMPLOYEES
  WHERE YEAR(B_DATE)> 1976 AND SEX = 'F');

-- 3 - IMPLICIT JOINS ---------------------------------------------------------------------------

-- 3.1 - Perform an implicit cartesian/cross join between EMPLOYEES and JOBS tables.
SELECT *
  FROM EMPLOYEES, JOBS; 
  
 --  MAKE A RIGHT JOIN (PUT THE COLUMNS TOGETHER)
-- 3.2 - Retrieve only the EMPLOYEES records that correspond to jobs in the JOBS table.
SELECT *
  FROM EMPLOYEES, JOBS
  WHERE JOBS.JOB_IDENT = EMPLOYEES.JOB_ID;
  
 -- INNER JOIN (ONLY SHOW THE ROWS THAT MATCH)
-- 3.3 - Redo the previous query, using shorter aliases for table names.
SELECT *
  FROM EMPLOYEES E, JOBS J
  WHERE J.JOB_IDENT = E.JOB_ID;
  
 -- YOU CAN USE 'AS' TO CREATE A ALIAS OR JUST MAKE SHORTER HIDDING THE 'AS'
-- 3.4 - Redo the previous query, but retrieve only the Employee ID, Employee Name and Job Title.
SELECT EMP_ID, F_NAME, L_NAME, JOB_TITLE
  FROM EMPLOYEES E, JOBS J
  WHERE J.JOB_IDENT = E.JOB_ID;
  
-- 3.5 - Redo the previous query, but specify the fully qualified column names with aliases in the SELECT clause.
SELECT E.EMP_ID, E.F_NAME, E.L_NAME, J.JOB_TITLE
  FROM EMPLOYEES E, JOBS J
  WHERE J.JOB_IDENT = E.JOB_ID;
