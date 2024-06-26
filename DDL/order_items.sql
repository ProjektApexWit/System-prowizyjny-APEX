
  CREATE TABLE "ORDER_ITEMS" 
   (	"ORDER_ITEM_ID" NUMBER(10,2), 
	"PRODUCT_ID" NUMBER, 
	"ORDER_ID" NUMBER, 
	"QUANTITY" NUMBER, 
	"PRICE" NUMBER, 
	 PRIMARY KEY ("ORDER_ITEM_ID")
  USING INDEX  ENABLE
   ) ;

  ALTER TABLE "ORDER_ITEMS" ADD FOREIGN KEY ("PRODUCT_ID")
	  REFERENCES "PRODUCTS" ("PRODUCT_ID") ENABLE;
  ALTER TABLE "ORDER_ITEMS" ADD FOREIGN KEY ("ORDER_ID")
	  REFERENCES "ORDERS" ("ORDER_ID") ENABLE;

  CREATE OR REPLACE EDITIONABLE TRIGGER "ORDER_ITEMS_BEFORE_INSERT" 
BEFORE INSERT ON Order_Items
FOR EACH ROW
BEGIN
  IF :NEW.order_item_id IS NULL THEN
    SELECT order_items_seq.NEXTVAL INTO :NEW.order_item_id FROM dual;
  END IF;
END;
/
ALTER TRIGGER "ORDER_ITEMS_BEFORE_INSERT" ENABLE;