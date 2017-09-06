CREATE TABLE BULLHORN_ALERTS
(
    ID NUMBER(19) NOT NULL,
    ALERT_TYPE VARCHAR(8) NOT NULL,
    FROM_USER VARCHAR2(99) NOT NULL,
    TO_USER VARCHAR2(99) NOT NULL,
    EVENT VARCHAR2(32) NOT NULL,
    REF VARCHAR2(255) NOT NULL,
    TITLE VARCHAR2(255),
    SITE_ID VARCHAR2(99),
    URL CLOB NOT NULL,
    EVENT_DATE TIMESTAMP NOT NULL,
    IS_READ NUMBER(1,0) NOT NULL DEFAULT 0,
    PRIMARY KEY(ID)
);

CREATE SEQUENCE bullhorn_alerts_seq;

BEGIN
EXECUTE IMMEDIATE 
	'CREATE OR REPLACE TRIGGER bullhorn_alerts_bir
	 BEFORE INSERT ON BULLHORN_ALERTS
	 FOR EACH ROW
	 BEGIN
      SELECT bullhorn_alerts_seq.NEXTVAL
      INTO   :new.id
      FROM   dual; END;'; END;;

CREATE TABLE BULLHORN_COUNTS
(
  USER_ID VARCHAR2(99) NOT NULL,
  ALERT_COUNT INT NOT NULL DEFAULT 0,
  PRIMARY KEY(USER_ID)
);