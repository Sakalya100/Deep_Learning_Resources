
# Stored Procedures
USE employees;

drop procedure if exists select_employees;

# Create the procedure
DELIMITER $$
CREATE procedure select_employees()
BEGIN
		SELECT * FROM employees
        LIMIT 1000;
END $$
DELIMITER ;

# Use procedure
call employees.select_employees();

# drop procedure
DROP PROCEDURE select_employees;

# Parameterised Procedure
DELIMITER $$
USE employees $$
CREATE procedure emp_avg_salary(IN p_emp_no INTEGER)
BEGIN
SELECT
	e.first_name, e.last_name, AVG(s.salary)
FROM
	employees e
		JOIN
	salaries s ON e.emp_no = s.emp_no
WHERE
	e.emp_no = p_emp_no;
END $$
DELIMITER ;

# This can throw some aggregation error
# Use this query first
SET SESSION sql_mode = (SELECT REPLACE(@@sql_mode, 'ONLY_FULL_GROUP_BY', ''));
# Now run this
SET sql_mode = '';

call emp_avg_salary(11300);

# Output params
DELIMITER $$
USE employees $$
CREATE procedure emp_avg_salary_out(IN p_emp_no INTEGER, out p_avg_salary DECIMAL(10,2))
BEGIN
SELECT
	AVG(s.salary)
INTO p_avg_salary FROM
	employees e
		JOIN
	salaries s ON e.emp_no = s.emp_no
WHERE
	e.emp_no = p_emp_no;
END $$
DELIMITER ;


### Using Variables
SET @v_avg_salary = 0;
# Extract the value which will be stored in the above variable
CALL employees.emp_avg_salary_out(11300, @v_avg_salary);

# Display the output of the variable
SELECT @v_avg_salary;



## User defined functions
DELIMITER $$
CREATE FUNCTION f_emp_avg_salary (p_emp_no INTEGER) RETURNS DECIMAL(10,2)
DETERMINISTIC
READS SQL DATA
BEGIN

DECLARE v_avg_salary DECIMAL(10,2);

SELECT 
	AVG(s.salary)
INTO v_avg_salary FROM
	employees e
      JOIN
      salaries s ON e.emp_no = s.emp_no
WHERE
	e.emp_no = p_emp_no;
RETURN v_avg_salary;
END $$
DELIMITER ;

# Calling the function
SELECT f_emp_avg_salary(11300);

