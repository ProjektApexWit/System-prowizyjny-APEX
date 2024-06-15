create or replace TRIGGER employees_before_insert
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN
  IF :NEW.EMPLOYEE_ID IS NULL THEN
    SELECT employees_seq.NEXTVAL INTO :NEW.EMPLOYEE_ID FROM dual;
  END IF;
END;
/