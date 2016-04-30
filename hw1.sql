create or replace PROCEDURE replace_id
(pr_did NUMBER,
pr_mid NUMBER)

AS BEGIN 

UPDATE dept
SET manager_id = pr_mid
WHERE department_id = pr_did;

END;


create or replace FUNCTION who_is_mngr (f_did IN NUMBER)
RETURN VARCHAR2  AS 
f_name VARCHAR2(50);

BEGIN 
  SELECT CONCAT(first_name, last_name) INTO f_name
  FROM   emp_table
  WHERE manager_id = (  SELECT manager_id 
                        FROM dept
                        WHERE department_id = f_did);
                       
RETURN f_name;

END who_is_mngr;