SELECT 
    *
FROM
    employees
WHERE
    hire_date > '2000-01-01';
    
# create index
CREATE INDEX i_hire_date ON employees(hire_date);

# create composite index

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Georgi'
        AND last_name = 'Facello';
        
# Create composite index
CREATE INDEX i_composite ON employees(first_name, last_name);