create or replace TRIGGER salaries_before_insert
BEFORE INSERT ON salaries
FOR EACH ROW
BEGIN
  IF :NEW.salary_id IS NULL THEN
    SELECT salaries_seq.NEXTVAL INTO :NEW.salary_id FROM dual;
  END IF;
END;
/