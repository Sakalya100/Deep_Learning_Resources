# CROSS JOIN - solution 2

SELECT

    e.*, d.*

FROM

    employees e

        CROSS JOIN

    departments d

WHERE

    e.emp_no < 10011

ORDER BY e.emp_no, d.dept_name;