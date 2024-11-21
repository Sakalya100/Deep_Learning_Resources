#  SQL Subqueries with IN nested inside WHERE - solution

SELECT

    *

FROM

    dept_manager

WHERE

    emp_no IN (SELECT

            emp_no

        FROM

            employees

        WHERE

            hire_date BETWEEN '1990-01-01' AND '1995-01-01');