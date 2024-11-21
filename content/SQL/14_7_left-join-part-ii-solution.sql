# LEFT JOIN - Part II - solution

SELECT

    e.emp_no,  

    e.first_name,  

    e.last_name,  

    dm.dept_no,  

    dm.from_date  

FROM  

    employees e  

        LEFT JOIN   

   

dept_manager dm ON e.emp_no = dm.emp_no  

WHERE  

    e.last_name = 'Markovitch'  

ORDER BY dm.dept_no DESC, e.emp_no;