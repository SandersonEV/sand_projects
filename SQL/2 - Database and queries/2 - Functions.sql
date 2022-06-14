-- BETWEEN,GROUP BY, ALIAS, %, AND...

-- 1 Retrieve all employees whose address is in Elgin,IL.

SELECT F_NAME, L_NAME
  FROM RCD77343.EMPLOYEES
  WHERE ADDRESS LIKE '%Elgin,IL';

-- 2 Retrieve all employees who were born during the 1970's.

SELECT *
  FROM RCD77343.EMPLOYEES
  WHERE B_DATE LIKE '197%';
-- or 
SELECT *
  FROM RCD77343.EMPLOYEES
  WHERE B_DATE BETWEEN '1969' AND '1980';

-- 3 Retrieve all employees in department 5 whose salary is between 60000 and 70000.

SELECT *
  FROM RCD77343.EMPLOYEES
  WHERE SALARY BETWEEN 60000 AND 70000;

-- 4 Retrieve a list of employees ordered by department ID.

SELECT *
  FROM RCD77343.EMPLOYEES
  ORDER BY DEP_ID;

-- 5 Retrieve a list of employees ordered in descending order by department ID and within each department ordered alphabetically in descending order by last name.

SELECT *
  FROM RCD77343.EMPLOYEES
  ORDER BY DEP_ID DESC,L_NAME DESC;

-- 6 In SQL problem 2 (Exercise 2 Problem 2), use department name instead of department ID. Retrieve a list of employees ordered by department name, and within each department ordered alphabetically in descending order by last name.

SELECT D.DEP_NAME, E.F_NAME, E.L_NAME
  FROM DEPARTMENTS AS D, EMPLOYEES AS E
  WHERE E.DEP_ID = D.DEPT_ID_DEP
  ORDER BY D.DEP_NAME, E.L_NAME DESC;
  
 -- 7  For each department ID retrieve the number of employees in the department.

 
 SELECT E.DEP_ID, D.DEP_NAME, COUNT(E.DEP_ID) AS N_EMPLOYEES
  FROM DEPARTMENTS AS D, EMPLOYEES AS E
  WHERE E.DEP_ID = D.DEPT_ID_DEP
  GROUP BY E. DEP_ID, D. DEP_NAME;
  
-- 8 For each department retrieve the number of employees in the department, and the average employee salary in the department..

SELECT E.DEP_ID, D.DEP_NAME, COUNT(E.DEP_ID) AS NUM_EMPLOYEES, TRUNCATE(AVG(E.SALARY),-1) AS AVG_SALARY
  FROM DEPARTMENTS AS D, EMPLOYEES AS E
  WHERE E.DEP_ID = D.DEPT_ID_DEP
  GROUP BY E. DEP_ID, D. DEP_NAME;
  
-- 9 Label the computed columns in the result set of SQL problem 2 (Exercise 3 Problem 2) as NUM_EMPLOYEES and AVG_SALARY.

  SELECT E.DEP_ID, D.DEP_NAME, COUNT(E.DEP_ID) AS NUM_EMPLOYEES, TRUNCATE(AVG(E.SALARY),-1) AS AVG_SALARY
  FROM DEPARTMENTS AS D, EMPLOYEES AS E
  WHERE E.DEP_ID = D.DEPT_ID_DEP
  GROUP BY E. DEP_ID, D. DEP_NAME;
  
-- 10  In SQL problem 3 (Exercise 3 Problem 3), order the result set by Average Salary..

  SELECT E.DEP_ID, D.DEP_NAME, COUNT(E.DEP_ID) AS NUM_EMPLOYEES, TRUNCATE(AVG(E.SALARY),-1) AS AVG_SALARY
  FROM DEPARTMENTS AS D, EMPLOYEES AS E
  WHERE E.DEP_ID = D.DEPT_ID_DEP
  GROUP BY E. DEP_ID, D. DEP_NAME
  ORDER BY AVG_SALARY;
  
-- 11 In SQL problem 4 (Exercise 3 Problem 4), limit the result to departments with fewer than 4 employees.

  SELECT E.DEP_ID, D.DEP_NAME, COUNT(E.DEP_ID) AS NUM_EMPLOYEES, TRUNCATE(AVG(E.SALARY),-1) AS AVG_SALARY
  FROM DEPARTMENTS AS D, EMPLOYEES AS E
  WHERE E.DEP_ID = D.DEPT_ID_DEP
  GROUP BY E. DEP_ID, D. DEP_NAME
  HAVING COUNT(E.DEP_ID) < 4
  ORDER BY AVG_SALARY;
