# Tips and tricks for joins - solution

SELECT

    e.gender, COUNT(dm.emp_no)

FROM

    employees e

        JOIN

    dept_manager dm ON e.emp_no = dm.emp_no

GROUP BY gender;