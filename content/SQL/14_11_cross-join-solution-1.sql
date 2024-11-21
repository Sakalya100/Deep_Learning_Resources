# CROSS JOIN - solution 1

SELECT

    dm.*, d.*  

FROM  

    departments d  

        CROSS JOIN  

    dept_manager dm  

WHERE  

    d.dept_no = 'd009'  

ORDER BY d.dept_no;