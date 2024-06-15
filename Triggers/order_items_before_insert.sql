create or replace TRIGGER order_items_before_insert
BEFORE INSERT ON Order_Items
FOR EACH ROW
BEGIN
  IF :NEW.order_item_id IS NULL THEN
    SELECT order_items_seq.NEXTVAL INTO :NEW.order_item_id FROM dual;
  END IF;
END;
/