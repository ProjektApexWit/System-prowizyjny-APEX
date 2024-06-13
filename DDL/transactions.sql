
  CREATE TABLE "TRANSACTIONS" 
   (	"TRANSACTION_ID" NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  NOT NULL ENABLE, 
	"POLICY_ID" NUMBER NOT NULL ENABLE, 
	"START_DATE" DATE NOT NULL ENABLE, 
	"STATUS" VARCHAR2(20 CHAR), 
	"AGENT_ID" NUMBER, 
	"CUSTOMER_ID" NUMBER NOT NULL ENABLE, 
	 CONSTRAINT "TRANSACIONS_PK" PRIMARY KEY ("TRANSACTION_ID")
  USING INDEX  ENABLE
   ) ;

  ALTER TABLE "TRANSACTIONS" ADD CONSTRAINT "CUSTOMER_ID_FK" FOREIGN KEY ("CUSTOMER_ID")
	  REFERENCES "CUSTOMERS" ("CUSTOMER_ID") ENABLE;
  ALTER TABLE "TRANSACTIONS" ADD CONSTRAINT "AGENTS_ID" FOREIGN KEY ("AGENT_ID")
	  REFERENCES "AGENTS" ("AGENT_ID") ENABLE;
  ALTER TABLE "TRANSACTIONS" ADD CONSTRAINT "POLICY_ID" FOREIGN KEY ("POLICY_ID")
	  REFERENCES "POLICIES" ("POLICY_ID") ENABLE;