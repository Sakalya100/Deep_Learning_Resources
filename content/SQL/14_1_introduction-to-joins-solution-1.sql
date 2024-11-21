# Intro to JOINs - solution 1

# if you currently have ‘departments_dup’ set up:

ALTER TABLE departments_dup

DROP COLUMN dept_manager;

 

ALTER TABLE departments_dup

CHANGE COLUMN dept_no dept_no CHAR(4) NULL;

 

ALTER TABLE departments_dup

CHANGE COLUMN dept_name dept_name VARCHAR(40) NULL;

 

# if you don’t currently have ‘departments_dup’ set up

DROP TABLE IF EXISTS departments_dup;

CREATE TABLE departments_dup

(

    dept_no CHAR(4) NULL,

    dept_name VARCHAR(40) NULL

);

 

INSERT INTO departments_dup

(

    dept_no,

    dept_name

)SELECT

                *

FROM

                departments;

 

INSERT INTO departments_dup (dept_name)

VALUES                ('Public Relations');

 

DELETE FROM departments_dup

WHERE

    dept_no = 'd002'; 

   

INSERT INTO departments_dup(dept_no) VALUES ('d010'), ('d011');