create or replace TRIGGER orders_before_insert
BEFORE INSERT ON Orders
FOR EACH ROW
BEGIN
  IF :NEW.order_id IS NULL THEN
    SELECT orders_seq.NEXTVAL INTO :NEW.order_id FROM dual;
  END IF;
END;
/