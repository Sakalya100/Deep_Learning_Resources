USE employees;

COMMIT;

# BEFORE INSERT
DELIMITER $$

CREATE TRIGGER before_salaries_insert
BEFORE INSERT ON salaries
FOR EACH ROW
BEGIN
	IF NEW.salary < 0 THEN
		SET NEW.salary = 0;
	END IF;
END $$
DELIMITER ;

SELECT *
FROM salaries
WHERE emp_no = '10001';

INSERT INTO salaries VALUES('10001', -98777, '2010-06-22', '9999-01-01');

SELECT *
FROM salaries
WHERE emp_no = '10001';


# BEFORE UPDATE
DELIMITER $$

CREATE TRIGGER before_salaries_update
BEFORE UPDATE ON salaries
FOR EACH ROW
BEGIN
	IF NEW.salary < 0 THEN
		SET NEW.salary = OLD.salary;
	END IF;
END $$
DELIMITER ;

UPDATE salaries
SET salary = -92200000
where emp_no = '10001' and from_date = '2010-06-22';

SELECT *
FROM salaries
WHERE emp_no = '10001';


SELECT SYSDATE();
SELECT DATE_FORMAT(SYSDATE(), '%y-%m-%d') as today;


# Problem Statement
DROP TRIGGER IF EXISTS trig_ins_dept_mng;
DELIMITER $$
CREATE TRIGGER trig_ins_dept_mng
AFTER INSERT ON dept_manager
FOR EACH ROW
BEGIN
	DECLARE v_curr_salary INTEGER;

SELECT MAX(salary) INTO v_curr_salary
from salaries where emp_no = NEW.emp_no;

	IF v_curr_salary IS NOT NULL THEN
		UPDATE salaries
        SET 
			to_date = SYSDATE()
		WHERE 
        emp_no = NEW.emp_no and to_date = NEW.to_date;
		
        INSERT INTO salaries
        VALUES (NEW.emp_no, v_curr_salary + 20000, NEW.from_date, NEW.to_date);
	END IF;
END $$
DELIMITER ;


INSERT INTO dept_manager VALUES ('111534','d009', date_format(sysdate(),'%Y-%m-%d'), '9999-01-01');

