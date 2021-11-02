

-- BEGIN generate DDL --

DROP DATABASE IF EXISTS crypto_spots;

CREATE DATABASE crypto_spots;

CREATE USER IF NOT EXISTS crypto_rw@'%' IDENTIFIED BY 'crypto_rw_password';

CREATE USER IF NOT EXISTS crypto_ro@'%' IDENTIFIED BY 'crypto_ro_password';

GRANT SELECT,INSERT,DELETE,UPDATE ON crypto_spots.* TO crypto_rw@'%' WITH GRANT OPTION;

GRANT SELECT ON crypto_spots.* TO crypto_ro@'%' WITH GRANT OPTION;

FLUSH PRIVILEGES;

USE crypto_spots;

CREATE TABLE spots_api_post_requests (
  id BIGINT AUTO_INCREMENT NOT NULL,
  createdAt BIGINT NOT NULL,
  apiType VARCHAR(32) NOT NULL,
  apiPath VARCHAR(100) NOT NULL,
  apiBody VARCHAR(1000) NOT NULL,
  PRIMARY KEY(id)
) Engine=INNODB AUTO_INCREMENT=10000 DEFAULT CHARSET=UTF8;


CREATE TABLE spots_events (
  sequenceId BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  previousId BIGINT NOT NULL,
  data VARCHAR(10000) NOT NULL,
  CONSTRAINT UNI_PREV_ID UNIQUE (previousId),
  PRIMARY KEY(sequenceId)
) Engine=INNODB AUTO_INCREMENT=10000 DEFAULT CHARSET=UTF8;


CREATE TABLE spots_locks (
  id VARCHAR(32) NOT NULL,
  expiresAt BIGINT NOT NULL,
  owner VARCHAR(100) NOT NULL,
  PRIMARY KEY(id)
) Engine=INNODB AUTO_INCREMENT=10000 DEFAULT CHARSET=UTF8;


CREATE TABLE spots_match_clearings (
  id BIGINT AUTO_INCREMENT NOT NULL,
  counterOrderId BIGINT NOT NULL,
  counterUserId BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  feeCurrencyId BIGINT NOT NULL,
  orderId BIGINT NOT NULL,
  sequenceId BIGINT NOT NULL,
  symbolId BIGINT NOT NULL,
  userId BIGINT NOT NULL,
  fee DECIMAL(36,18) NOT NULL,
  matchPrice DECIMAL(36,18) NOT NULL,
  matchQuantity DECIMAL(36,18) NOT NULL,
  orderUnfilledQuantityAfterClearing DECIMAL(36,18) NOT NULL,
  rate DECIMAL(36,18) NOT NULL,
  direction VARCHAR(50) NOT NULL,
  orderStatusAfterClearing VARCHAR(50) NOT NULL,
  type VARCHAR(50) NOT NULL,
  CONSTRAINT UNI_SEQ_ORD_COUNTER UNIQUE (sequenceId,orderId,counterOrderId),
  INDEX IDX_UID_ID (userId,id),
  INDEX IDX_UID_SYM_ID (userId,symbolId,id),
  PRIMARY KEY(id)
) Engine=INNODB AUTO_INCREMENT=10000 DEFAULT CHARSET=UTF8;


CREATE TABLE spots_match_details (
  counterOrderId BIGINT NOT NULL,
  orderId BIGINT NOT NULL,
  counterUserId BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  feeCurrencyId BIGINT NOT NULL,
  orderCreatedAt BIGINT NOT NULL,
  sequenceId BIGINT NOT NULL,
  symbolId BIGINT NOT NULL,
  userId BIGINT NOT NULL,
  fee DECIMAL(36,18) NOT NULL,
  price DECIMAL(36,18) NOT NULL,
  quantity DECIMAL(36,18) NOT NULL,
  direction VARCHAR(50) NOT NULL,
  type VARCHAR(50) NOT NULL,
  INDEX IDX_OID_CT (orderId,createdAt),
  PRIMARY KEY(orderId, counterOrderId)
) Engine=INNODB AUTO_INCREMENT=10000 DEFAULT CHARSET=UTF8;


CREATE TABLE spots_orders (
  id BIGINT NOT NULL,
  chargeQuote BOOL NOT NULL,
  features INTEGER NOT NULL,
  baseCurrencyId BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  quoteCurrencyId BIGINT NOT NULL,
  sequenceId BIGINT NOT NULL,
  symbolId BIGINT NOT NULL,
  updatedAt BIGINT NOT NULL,
  userId BIGINT NOT NULL,
  fillPrice DOUBLE NOT NULL,
  fee DECIMAL(36,18) NOT NULL,
  makerFeeRate DECIMAL(36,18) NOT NULL,
  price DECIMAL(36,18) NOT NULL,
  quantity DECIMAL(36,18) NOT NULL,
  takerFeeRate DECIMAL(36,18) NOT NULL,
  unfilledQuantity DECIMAL(36,18) NOT NULL,
  clientOrderId VARCHAR(32) NOT NULL,
  direction VARCHAR(50) NOT NULL,
  status VARCHAR(50) NOT NULL,
  type VARCHAR(50) NOT NULL,
  INDEX IDX_UID_ID (userId,id),
  INDEX IDX_UID_CID (userId,clientOrderId),
  INDEX IDX_UID_SYM_ID (userId,symbolId,id),
  PRIMARY KEY(id)
) Engine=INNODB AUTO_INCREMENT=10000 DEFAULT CHARSET=UTF8;


CREATE TABLE spots_settings (
  id VARCHAR(100) NOT NULL,
  updatedAt BIGINT NOT NULL,
  setting VARCHAR(100) NOT NULL,
  PRIMARY KEY(id)
) Engine=INNODB AUTO_INCREMENT=10000 DEFAULT CHARSET=UTF8;


CREATE TABLE spots_transfer_results (
  transferId VARCHAR(32) NOT NULL,
  success BOOL NOT NULL,
  createdAt BIGINT NOT NULL,
  data VARCHAR(10000) NOT NULL,
  INDEX IDX_CREATED (createdAt),
  PRIMARY KEY(transferId)
) Engine=INNODB AUTO_INCREMENT=10000 DEFAULT CHARSET=UTF8;


CREATE TABLE spots_unique_events (
  uniqueId VARCHAR(50) NOT NULL,
  createdAt BIGINT NOT NULL,
  sequenceId BIGINT NOT NULL,
  PRIMARY KEY(uniqueId)
) Engine=INNODB AUTO_INCREMENT=10000 DEFAULT CHARSET=UTF8;


CREATE TABLE spots_unreplays (
  uniqueId VARCHAR(32) NOT NULL,
  userId BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  INDEX IDX_CREATEDAT (createdAt),
  PRIMARY KEY(uniqueId, userId)
) Engine=INNODB AUTO_INCREMENT=10000 DEFAULT CHARSET=UTF8;

-- spots_events_0 --
CREATE TABLE spots_events_0 (
  sequenceId BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  previousId BIGINT NOT NULL,
  data VARCHAR(10000) NOT NULL,
  CONSTRAINT UNI_PREV_ID UNIQUE (previousId),
  PRIMARY KEY(sequenceId)
) Engine=INNODB AUTO_INCREMENT=10000 DEFAULT CHARSET=UTF8;

-- spots_events_1 --
CREATE TABLE spots_events_1 (
  sequenceId BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  previousId BIGINT NOT NULL,
  data VARCHAR(10000) NOT NULL,
  CONSTRAINT UNI_PREV_ID UNIQUE (previousId),
  PRIMARY KEY(sequenceId)
) Engine=INNODB AUTO_INCREMENT=10000 DEFAULT CHARSET=UTF8;

-- spots_events_2 --
CREATE TABLE spots_events_2 (
  sequenceId BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  previousId BIGINT NOT NULL,
  data VARCHAR(10000) NOT NULL,
  CONSTRAINT UNI_PREV_ID UNIQUE (previousId),
  PRIMARY KEY(sequenceId)
) Engine=INNODB AUTO_INCREMENT=10000 DEFAULT CHARSET=UTF8;

-- spots_events_3 --
CREATE TABLE spots_events_3 (
  sequenceId BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  previousId BIGINT NOT NULL,
  data VARCHAR(10000) NOT NULL,
  CONSTRAINT UNI_PREV_ID UNIQUE (previousId),
  PRIMARY KEY(sequenceId)
) Engine=INNODB AUTO_INCREMENT=10000 DEFAULT CHARSET=UTF8;

-- spots_events_4 --
CREATE TABLE spots_events_4 (
  sequenceId BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  previousId BIGINT NOT NULL,
  data VARCHAR(10000) NOT NULL,
  CONSTRAINT UNI_PREV_ID UNIQUE (previousId),
  PRIMARY KEY(sequenceId)
) Engine=INNODB AUTO_INCREMENT=10000 DEFAULT CHARSET=UTF8;

-- spots_events_5 --
CREATE TABLE spots_events_5 (
  sequenceId BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  previousId BIGINT NOT NULL,
  data VARCHAR(10000) NOT NULL,
  CONSTRAINT UNI_PREV_ID UNIQUE (previousId),
  PRIMARY KEY(sequenceId)
) Engine=INNODB AUTO_INCREMENT=10000 DEFAULT CHARSET=UTF8;

-- spots_events_6 --
CREATE TABLE spots_events_6 (
  sequenceId BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  previousId BIGINT NOT NULL,
  data VARCHAR(10000) NOT NULL,
  CONSTRAINT UNI_PREV_ID UNIQUE (previousId),
  PRIMARY KEY(sequenceId)
) Engine=INNODB AUTO_INCREMENT=10000 DEFAULT CHARSET=UTF8;

-- spots_events_7 --
CREATE TABLE spots_events_7 (
  sequenceId BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  previousId BIGINT NOT NULL,
  data VARCHAR(10000) NOT NULL,
  CONSTRAINT UNI_PREV_ID UNIQUE (previousId),
  PRIMARY KEY(sequenceId)
) Engine=INNODB AUTO_INCREMENT=10000 DEFAULT CHARSET=UTF8;

-- spots_events_8 --
CREATE TABLE spots_events_8 (
  sequenceId BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  previousId BIGINT NOT NULL,
  data VARCHAR(10000) NOT NULL,
  CONSTRAINT UNI_PREV_ID UNIQUE (previousId),
  PRIMARY KEY(sequenceId)
) Engine=INNODB AUTO_INCREMENT=10000 DEFAULT CHARSET=UTF8;

-- spots_events_9 --
CREATE TABLE spots_events_9 (
  sequenceId BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  previousId BIGINT NOT NULL,
  data VARCHAR(10000) NOT NULL,
  CONSTRAINT UNI_PREV_ID UNIQUE (previousId),
  PRIMARY KEY(sequenceId)
) Engine=INNODB AUTO_INCREMENT=10000 DEFAULT CHARSET=UTF8;

-- spots_events_10 --
CREATE TABLE spots_events_10 (
  sequenceId BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  previousId BIGINT NOT NULL,
  data VARCHAR(10000) NOT NULL,
  CONSTRAINT UNI_PREV_ID UNIQUE (previousId),
  PRIMARY KEY(sequenceId)
) Engine=INNODB AUTO_INCREMENT=10000 DEFAULT CHARSET=UTF8;

-- spots_events_11 --
CREATE TABLE spots_events_11 (
  sequenceId BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  previousId BIGINT NOT NULL,
  data VARCHAR(10000) NOT NULL,
  CONSTRAINT UNI_PREV_ID UNIQUE (previousId),
  PRIMARY KEY(sequenceId)
) Engine=INNODB AUTO_INCREMENT=10000 DEFAULT CHARSET=UTF8;

-- spots_match_clearings_202103 --
CREATE TABLE spots_match_clearings_202103 (
  id BIGINT AUTO_INCREMENT NOT NULL,
  counterOrderId BIGINT NOT NULL,
  counterUserId BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  feeCurrencyId BIGINT NOT NULL,
  orderId BIGINT NOT NULL,
  sequenceId BIGINT NOT NULL,
  symbolId BIGINT NOT NULL,
  userId BIGINT NOT NULL,
  fee DECIMAL(36,18) NOT NULL,
  matchPrice DECIMAL(36,18) NOT NULL,
  matchQuantity DECIMAL(36,18) NOT NULL,
  orderUnfilledQuantityAfterClearing DECIMAL(36,18) NOT NULL,
  rate DECIMAL(36,18) NOT NULL,
  direction VARCHAR(50) NOT NULL,
  orderStatusAfterClearing VARCHAR(50) NOT NULL,
  type VARCHAR(50) NOT NULL,
  CONSTRAINT UNI_SEQ_ORD_COUNTER UNIQUE (sequenceId,orderId,counterOrderId),
  INDEX IDX_UID_ID (userId,id),
  INDEX IDX_UID_SYM_ID (userId,symbolId,id),
  PRIMARY KEY(id)
) Engine=INNODB AUTO_INCREMENT=10000 DEFAULT CHARSET=UTF8;

-- spots_match_clearings_202104 --
CREATE TABLE spots_match_clearings_202104 (
  id BIGINT AUTO_INCREMENT NOT NULL,
  counterOrderId BIGINT NOT NULL,
  counterUserId BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  feeCurrencyId BIGINT NOT NULL,
  orderId BIGINT NOT NULL,
  sequenceId BIGINT NOT NULL,
  symbolId BIGINT NOT NULL,
  userId BIGINT NOT NULL,
  fee DECIMAL(36,18) NOT NULL,
  matchPrice DECIMAL(36,18) NOT NULL,
  matchQuantity DECIMAL(36,18) NOT NULL,
  orderUnfilledQuantityAfterClearing DECIMAL(36,18) NOT NULL,
  rate DECIMAL(36,18) NOT NULL,
  direction VARCHAR(50) NOT NULL,
  orderStatusAfterClearing VARCHAR(50) NOT NULL,
  type VARCHAR(50) NOT NULL,
  CONSTRAINT UNI_SEQ_ORD_COUNTER UNIQUE (sequenceId,orderId,counterOrderId),
  INDEX IDX_UID_ID (userId,id),
  INDEX IDX_UID_SYM_ID (userId,symbolId,id),
  PRIMARY KEY(id)
) Engine=INNODB AUTO_INCREMENT=10000 DEFAULT CHARSET=UTF8;

-- spots_match_clearings_202105 --
CREATE TABLE spots_match_clearings_202105 (
  id BIGINT AUTO_INCREMENT NOT NULL,
  counterOrderId BIGINT NOT NULL,
  counterUserId BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  feeCurrencyId BIGINT NOT NULL,
  orderId BIGINT NOT NULL,
  sequenceId BIGINT NOT NULL,
  symbolId BIGINT NOT NULL,
  userId BIGINT NOT NULL,
  fee DECIMAL(36,18) NOT NULL,
  matchPrice DECIMAL(36,18) NOT NULL,
  matchQuantity DECIMAL(36,18) NOT NULL,
  orderUnfilledQuantityAfterClearing DECIMAL(36,18) NOT NULL,
  rate DECIMAL(36,18) NOT NULL,
  direction VARCHAR(50) NOT NULL,
  orderStatusAfterClearing VARCHAR(50) NOT NULL,
  type VARCHAR(50) NOT NULL,
  CONSTRAINT UNI_SEQ_ORD_COUNTER UNIQUE (sequenceId,orderId,counterOrderId),
  INDEX IDX_UID_ID (userId,id),
  INDEX IDX_UID_SYM_ID (userId,symbolId,id),
  PRIMARY KEY(id)
) Engine=INNODB AUTO_INCREMENT=10000 DEFAULT CHARSET=UTF8;

-- spots_match_clearings_202106 --
CREATE TABLE spots_match_clearings_202106 (
  id BIGINT AUTO_INCREMENT NOT NULL,
  counterOrderId BIGINT NOT NULL,
  counterUserId BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  feeCurrencyId BIGINT NOT NULL,
  orderId BIGINT NOT NULL,
  sequenceId BIGINT NOT NULL,
  symbolId BIGINT NOT NULL,
  userId BIGINT NOT NULL,
  fee DECIMAL(36,18) NOT NULL,
  matchPrice DECIMAL(36,18) NOT NULL,
  matchQuantity DECIMAL(36,18) NOT NULL,
  orderUnfilledQuantityAfterClearing DECIMAL(36,18) NOT NULL,
  rate DECIMAL(36,18) NOT NULL,
  direction VARCHAR(50) NOT NULL,
  orderStatusAfterClearing VARCHAR(50) NOT NULL,
  type VARCHAR(50) NOT NULL,
  CONSTRAINT UNI_SEQ_ORD_COUNTER UNIQUE (sequenceId,orderId,counterOrderId),
  INDEX IDX_UID_ID (userId,id),
  INDEX IDX_UID_SYM_ID (userId,symbolId,id),
  PRIMARY KEY(id)
) Engine=INNODB AUTO_INCREMENT=10000 DEFAULT CHARSET=UTF8;

-- spots_match_clearings_202107 --
CREATE TABLE spots_match_clearings_202107 (
  id BIGINT AUTO_INCREMENT NOT NULL,
  counterOrderId BIGINT NOT NULL,
  counterUserId BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  feeCurrencyId BIGINT NOT NULL,
  orderId BIGINT NOT NULL,
  sequenceId BIGINT NOT NULL,
  symbolId BIGINT NOT NULL,
  userId BIGINT NOT NULL,
  fee DECIMAL(36,18) NOT NULL,
  matchPrice DECIMAL(36,18) NOT NULL,
  matchQuantity DECIMAL(36,18) NOT NULL,
  orderUnfilledQuantityAfterClearing DECIMAL(36,18) NOT NULL,
  rate DECIMAL(36,18) NOT NULL,
  direction VARCHAR(50) NOT NULL,
  orderStatusAfterClearing VARCHAR(50) NOT NULL,
  type VARCHAR(50) NOT NULL,
  CONSTRAINT UNI_SEQ_ORD_COUNTER UNIQUE (sequenceId,orderId,counterOrderId),
  INDEX IDX_UID_ID (userId,id),
  INDEX IDX_UID_SYM_ID (userId,symbolId,id),
  PRIMARY KEY(id)
) Engine=INNODB AUTO_INCREMENT=10000 DEFAULT CHARSET=UTF8;

-- spots_match_clearings_202108 --
CREATE TABLE spots_match_clearings_202108 (
  id BIGINT AUTO_INCREMENT NOT NULL,
  counterOrderId BIGINT NOT NULL,
  counterUserId BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  feeCurrencyId BIGINT NOT NULL,
  orderId BIGINT NOT NULL,
  sequenceId BIGINT NOT NULL,
  symbolId BIGINT NOT NULL,
  userId BIGINT NOT NULL,
  fee DECIMAL(36,18) NOT NULL,
  matchPrice DECIMAL(36,18) NOT NULL,
  matchQuantity DECIMAL(36,18) NOT NULL,
  orderUnfilledQuantityAfterClearing DECIMAL(36,18) NOT NULL,
  rate DECIMAL(36,18) NOT NULL,
  direction VARCHAR(50) NOT NULL,
  orderStatusAfterClearing VARCHAR(50) NOT NULL,
  type VARCHAR(50) NOT NULL,
  CONSTRAINT UNI_SEQ_ORD_COUNTER UNIQUE (sequenceId,orderId,counterOrderId),
  INDEX IDX_UID_ID (userId,id),
  INDEX IDX_UID_SYM_ID (userId,symbolId,id),
  PRIMARY KEY(id)
) Engine=INNODB AUTO_INCREMENT=10000 DEFAULT CHARSET=UTF8;

-- spots_match_clearings_202109 --
CREATE TABLE spots_match_clearings_202109 (
  id BIGINT AUTO_INCREMENT NOT NULL,
  counterOrderId BIGINT NOT NULL,
  counterUserId BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  feeCurrencyId BIGINT NOT NULL,
  orderId BIGINT NOT NULL,
  sequenceId BIGINT NOT NULL,
  symbolId BIGINT NOT NULL,
  userId BIGINT NOT NULL,
  fee DECIMAL(36,18) NOT NULL,
  matchPrice DECIMAL(36,18) NOT NULL,
  matchQuantity DECIMAL(36,18) NOT NULL,
  orderUnfilledQuantityAfterClearing DECIMAL(36,18) NOT NULL,
  rate DECIMAL(36,18) NOT NULL,
  direction VARCHAR(50) NOT NULL,
  orderStatusAfterClearing VARCHAR(50) NOT NULL,
  type VARCHAR(50) NOT NULL,
  CONSTRAINT UNI_SEQ_ORD_COUNTER UNIQUE (sequenceId,orderId,counterOrderId),
  INDEX IDX_UID_ID (userId,id),
  INDEX IDX_UID_SYM_ID (userId,symbolId,id),
  PRIMARY KEY(id)
) Engine=INNODB AUTO_INCREMENT=10000 DEFAULT CHARSET=UTF8;

-- spots_match_clearings_202110 --
CREATE TABLE spots_match_clearings_202110 (
  id BIGINT AUTO_INCREMENT NOT NULL,
  counterOrderId BIGINT NOT NULL,
  counterUserId BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  feeCurrencyId BIGINT NOT NULL,
  orderId BIGINT NOT NULL,
  sequenceId BIGINT NOT NULL,
  symbolId BIGINT NOT NULL,
  userId BIGINT NOT NULL,
  fee DECIMAL(36,18) NOT NULL,
  matchPrice DECIMAL(36,18) NOT NULL,
  matchQuantity DECIMAL(36,18) NOT NULL,
  orderUnfilledQuantityAfterClearing DECIMAL(36,18) NOT NULL,
  rate DECIMAL(36,18) NOT NULL,
  direction VARCHAR(50) NOT NULL,
  orderStatusAfterClearing VARCHAR(50) NOT NULL,
  type VARCHAR(50) NOT NULL,
  CONSTRAINT UNI_SEQ_ORD_COUNTER UNIQUE (sequenceId,orderId,counterOrderId),
  INDEX IDX_UID_ID (userId,id),
  INDEX IDX_UID_SYM_ID (userId,symbolId,id),
  PRIMARY KEY(id)
) Engine=INNODB AUTO_INCREMENT=10000 DEFAULT CHARSET=UTF8;

-- spots_match_clearings_202111 --
CREATE TABLE spots_match_clearings_202111 (
  id BIGINT AUTO_INCREMENT NOT NULL,
  counterOrderId BIGINT NOT NULL,
  counterUserId BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  feeCurrencyId BIGINT NOT NULL,
  orderId BIGINT NOT NULL,
  sequenceId BIGINT NOT NULL,
  symbolId BIGINT NOT NULL,
  userId BIGINT NOT NULL,
  fee DECIMAL(36,18) NOT NULL,
  matchPrice DECIMAL(36,18) NOT NULL,
  matchQuantity DECIMAL(36,18) NOT NULL,
  orderUnfilledQuantityAfterClearing DECIMAL(36,18) NOT NULL,
  rate DECIMAL(36,18) NOT NULL,
  direction VARCHAR(50) NOT NULL,
  orderStatusAfterClearing VARCHAR(50) NOT NULL,
  type VARCHAR(50) NOT NULL,
  CONSTRAINT UNI_SEQ_ORD_COUNTER UNIQUE (sequenceId,orderId,counterOrderId),
  INDEX IDX_UID_ID (userId,id),
  INDEX IDX_UID_SYM_ID (userId,symbolId,id),
  PRIMARY KEY(id)
) Engine=INNODB AUTO_INCREMENT=10000 DEFAULT CHARSET=UTF8;

-- spots_match_clearings_202112 --
CREATE TABLE spots_match_clearings_202112 (
  id BIGINT AUTO_INCREMENT NOT NULL,
  counterOrderId BIGINT NOT NULL,
  counterUserId BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  feeCurrencyId BIGINT NOT NULL,
  orderId BIGINT NOT NULL,
  sequenceId BIGINT NOT NULL,
  symbolId BIGINT NOT NULL,
  userId BIGINT NOT NULL,
  fee DECIMAL(36,18) NOT NULL,
  matchPrice DECIMAL(36,18) NOT NULL,
  matchQuantity DECIMAL(36,18) NOT NULL,
  orderUnfilledQuantityAfterClearing DECIMAL(36,18) NOT NULL,
  rate DECIMAL(36,18) NOT NULL,
  direction VARCHAR(50) NOT NULL,
  orderStatusAfterClearing VARCHAR(50) NOT NULL,
  type VARCHAR(50) NOT NULL,
  CONSTRAINT UNI_SEQ_ORD_COUNTER UNIQUE (sequenceId,orderId,counterOrderId),
  INDEX IDX_UID_ID (userId,id),
  INDEX IDX_UID_SYM_ID (userId,symbolId,id),
  PRIMARY KEY(id)
) Engine=INNODB AUTO_INCREMENT=10000 DEFAULT CHARSET=UTF8;

-- spots_match_clearings_202201 --
CREATE TABLE spots_match_clearings_202201 (
  id BIGINT AUTO_INCREMENT NOT NULL,
  counterOrderId BIGINT NOT NULL,
  counterUserId BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  feeCurrencyId BIGINT NOT NULL,
  orderId BIGINT NOT NULL,
  sequenceId BIGINT NOT NULL,
  symbolId BIGINT NOT NULL,
  userId BIGINT NOT NULL,
  fee DECIMAL(36,18) NOT NULL,
  matchPrice DECIMAL(36,18) NOT NULL,
  matchQuantity DECIMAL(36,18) NOT NULL,
  orderUnfilledQuantityAfterClearing DECIMAL(36,18) NOT NULL,
  rate DECIMAL(36,18) NOT NULL,
  direction VARCHAR(50) NOT NULL,
  orderStatusAfterClearing VARCHAR(50) NOT NULL,
  type VARCHAR(50) NOT NULL,
  CONSTRAINT UNI_SEQ_ORD_COUNTER UNIQUE (sequenceId,orderId,counterOrderId),
  INDEX IDX_UID_ID (userId,id),
  INDEX IDX_UID_SYM_ID (userId,symbolId,id),
  PRIMARY KEY(id)
) Engine=INNODB AUTO_INCREMENT=10000 DEFAULT CHARSET=UTF8;

-- spots_match_clearings_202202 --
CREATE TABLE spots_match_clearings_202202 (
  id BIGINT AUTO_INCREMENT NOT NULL,
  counterOrderId BIGINT NOT NULL,
  counterUserId BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  feeCurrencyId BIGINT NOT NULL,
  orderId BIGINT NOT NULL,
  sequenceId BIGINT NOT NULL,
  symbolId BIGINT NOT NULL,
  userId BIGINT NOT NULL,
  fee DECIMAL(36,18) NOT NULL,
  matchPrice DECIMAL(36,18) NOT NULL,
  matchQuantity DECIMAL(36,18) NOT NULL,
  orderUnfilledQuantityAfterClearing DECIMAL(36,18) NOT NULL,
  rate DECIMAL(36,18) NOT NULL,
  direction VARCHAR(50) NOT NULL,
  orderStatusAfterClearing VARCHAR(50) NOT NULL,
  type VARCHAR(50) NOT NULL,
  CONSTRAINT UNI_SEQ_ORD_COUNTER UNIQUE (sequenceId,orderId,counterOrderId),
  INDEX IDX_UID_ID (userId,id),
  INDEX IDX_UID_SYM_ID (userId,symbolId,id),
  PRIMARY KEY(id)
) Engine=INNODB AUTO_INCREMENT=10000 DEFAULT CHARSET=UTF8;

-- spots_match_details_202103 --
CREATE TABLE spots_match_details_202103 (
  counterOrderId BIGINT NOT NULL,
  orderId BIGINT NOT NULL,
  counterUserId BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  feeCurrencyId BIGINT NOT NULL,
  orderCreatedAt BIGINT NOT NULL,
  sequenceId BIGINT NOT NULL,
  symbolId BIGINT NOT NULL,
  userId BIGINT NOT NULL,
  fee DECIMAL(36,18) NOT NULL,
  price DECIMAL(36,18) NOT NULL,
  quantity DECIMAL(36,18) NOT NULL,
  direction VARCHAR(50) NOT NULL,
  type VARCHAR(50) NOT NULL,
  INDEX IDX_OID_CT (orderId,createdAt),
  PRIMARY KEY(orderId, counterOrderId)
) Engine=INNODB AUTO_INCREMENT=10000 DEFAULT CHARSET=UTF8;

-- spots_match_details_202104 --
CREATE TABLE spots_match_details_202104 (
  counterOrderId BIGINT NOT NULL,
  orderId BIGINT NOT NULL,
  counterUserId BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  feeCurrencyId BIGINT NOT NULL,
  orderCreatedAt BIGINT NOT NULL,
  sequenceId BIGINT NOT NULL,
  symbolId BIGINT NOT NULL,
  userId BIGINT NOT NULL,
  fee DECIMAL(36,18) NOT NULL,
  price DECIMAL(36,18) NOT NULL,
  quantity DECIMAL(36,18) NOT NULL,
  direction VARCHAR(50) NOT NULL,
  type VARCHAR(50) NOT NULL,
  INDEX IDX_OID_CT (orderId,createdAt),
  PRIMARY KEY(orderId, counterOrderId)
) Engine=INNODB AUTO_INCREMENT=10000 DEFAULT CHARSET=UTF8;

-- spots_match_details_202105 --
CREATE TABLE spots_match_details_202105 (
  counterOrderId BIGINT NOT NULL,
  orderId BIGINT NOT NULL,
  counterUserId BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  feeCurrencyId BIGINT NOT NULL,
  orderCreatedAt BIGINT NOT NULL,
  sequenceId BIGINT NOT NULL,
  symbolId BIGINT NOT NULL,
  userId BIGINT NOT NULL,
  fee DECIMAL(36,18) NOT NULL,
  price DECIMAL(36,18) NOT NULL,
  quantity DECIMAL(36,18) NOT NULL,
  direction VARCHAR(50) NOT NULL,
  type VARCHAR(50) NOT NULL,
  INDEX IDX_OID_CT (orderId,createdAt),
  PRIMARY KEY(orderId, counterOrderId)
) Engine=INNODB AUTO_INCREMENT=10000 DEFAULT CHARSET=UTF8;

-- spots_match_details_202106 --
CREATE TABLE spots_match_details_202106 (
  counterOrderId BIGINT NOT NULL,
  orderId BIGINT NOT NULL,
  counterUserId BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  feeCurrencyId BIGINT NOT NULL,
  orderCreatedAt BIGINT NOT NULL,
  sequenceId BIGINT NOT NULL,
  symbolId BIGINT NOT NULL,
  userId BIGINT NOT NULL,
  fee DECIMAL(36,18) NOT NULL,
  price DECIMAL(36,18) NOT NULL,
  quantity DECIMAL(36,18) NOT NULL,
  direction VARCHAR(50) NOT NULL,
  type VARCHAR(50) NOT NULL,
  INDEX IDX_OID_CT (orderId,createdAt),
  PRIMARY KEY(orderId, counterOrderId)
) Engine=INNODB AUTO_INCREMENT=10000 DEFAULT CHARSET=UTF8;

-- spots_match_details_202107 --
CREATE TABLE spots_match_details_202107 (
  counterOrderId BIGINT NOT NULL,
  orderId BIGINT NOT NULL,
  counterUserId BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  feeCurrencyId BIGINT NOT NULL,
  orderCreatedAt BIGINT NOT NULL,
  sequenceId BIGINT NOT NULL,
  symbolId BIGINT NOT NULL,
  userId BIGINT NOT NULL,
  fee DECIMAL(36,18) NOT NULL,
  price DECIMAL(36,18) NOT NULL,
  quantity DECIMAL(36,18) NOT NULL,
  direction VARCHAR(50) NOT NULL,
  type VARCHAR(50) NOT NULL,
  INDEX IDX_OID_CT (orderId,createdAt),
  PRIMARY KEY(orderId, counterOrderId)
) Engine=INNODB AUTO_INCREMENT=10000 DEFAULT CHARSET=UTF8;

-- spots_match_details_202108 --
CREATE TABLE spots_match_details_202108 (
  counterOrderId BIGINT NOT NULL,
  orderId BIGINT NOT NULL,
  counterUserId BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  feeCurrencyId BIGINT NOT NULL,
  orderCreatedAt BIGINT NOT NULL,
  sequenceId BIGINT NOT NULL,
  symbolId BIGINT NOT NULL,
  userId BIGINT NOT NULL,
  fee DECIMAL(36,18) NOT NULL,
  price DECIMAL(36,18) NOT NULL,
  quantity DECIMAL(36,18) NOT NULL,
  direction VARCHAR(50) NOT NULL,
  type VARCHAR(50) NOT NULL,
  INDEX IDX_OID_CT (orderId,createdAt),
  PRIMARY KEY(orderId, counterOrderId)
) Engine=INNODB AUTO_INCREMENT=10000 DEFAULT CHARSET=UTF8;

-- spots_match_details_202109 --
CREATE TABLE spots_match_details_202109 (
  counterOrderId BIGINT NOT NULL,
  orderId BIGINT NOT NULL,
  counterUserId BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  feeCurrencyId BIGINT NOT NULL,
  orderCreatedAt BIGINT NOT NULL,
  sequenceId BIGINT NOT NULL,
  symbolId BIGINT NOT NULL,
  userId BIGINT NOT NULL,
  fee DECIMAL(36,18) NOT NULL,
  price DECIMAL(36,18) NOT NULL,
  quantity DECIMAL(36,18) NOT NULL,
  direction VARCHAR(50) NOT NULL,
  type VARCHAR(50) NOT NULL,
  INDEX IDX_OID_CT (orderId,createdAt),
  PRIMARY KEY(orderId, counterOrderId)
) Engine=INNODB AUTO_INCREMENT=10000 DEFAULT CHARSET=UTF8;

-- spots_match_details_202110 --
CREATE TABLE spots_match_details_202110 (
  counterOrderId BIGINT NOT NULL,
  orderId BIGINT NOT NULL,
  counterUserId BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  feeCurrencyId BIGINT NOT NULL,
  orderCreatedAt BIGINT NOT NULL,
  sequenceId BIGINT NOT NULL,
  symbolId BIGINT NOT NULL,
  userId BIGINT NOT NULL,
  fee DECIMAL(36,18) NOT NULL,
  price DECIMAL(36,18) NOT NULL,
  quantity DECIMAL(36,18) NOT NULL,
  direction VARCHAR(50) NOT NULL,
  type VARCHAR(50) NOT NULL,
  INDEX IDX_OID_CT (orderId,createdAt),
  PRIMARY KEY(orderId, counterOrderId)
) Engine=INNODB AUTO_INCREMENT=10000 DEFAULT CHARSET=UTF8;

-- spots_match_details_202111 --
CREATE TABLE spots_match_details_202111 (
  counterOrderId BIGINT NOT NULL,
  orderId BIGINT NOT NULL,
  counterUserId BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  feeCurrencyId BIGINT NOT NULL,
  orderCreatedAt BIGINT NOT NULL,
  sequenceId BIGINT NOT NULL,
  symbolId BIGINT NOT NULL,
  userId BIGINT NOT NULL,
  fee DECIMAL(36,18) NOT NULL,
  price DECIMAL(36,18) NOT NULL,
  quantity DECIMAL(36,18) NOT NULL,
  direction VARCHAR(50) NOT NULL,
  type VARCHAR(50) NOT NULL,
  INDEX IDX_OID_CT (orderId,createdAt),
  PRIMARY KEY(orderId, counterOrderId)
) Engine=INNODB AUTO_INCREMENT=10000 DEFAULT CHARSET=UTF8;

-- spots_match_details_202112 --
CREATE TABLE spots_match_details_202112 (
  counterOrderId BIGINT NOT NULL,
  orderId BIGINT NOT NULL,
  counterUserId BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  feeCurrencyId BIGINT NOT NULL,
  orderCreatedAt BIGINT NOT NULL,
  sequenceId BIGINT NOT NULL,
  symbolId BIGINT NOT NULL,
  userId BIGINT NOT NULL,
  fee DECIMAL(36,18) NOT NULL,
  price DECIMAL(36,18) NOT NULL,
  quantity DECIMAL(36,18) NOT NULL,
  direction VARCHAR(50) NOT NULL,
  type VARCHAR(50) NOT NULL,
  INDEX IDX_OID_CT (orderId,createdAt),
  PRIMARY KEY(orderId, counterOrderId)
) Engine=INNODB AUTO_INCREMENT=10000 DEFAULT CHARSET=UTF8;

-- spots_match_details_202201 --
CREATE TABLE spots_match_details_202201 (
  counterOrderId BIGINT NOT NULL,
  orderId BIGINT NOT NULL,
  counterUserId BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  feeCurrencyId BIGINT NOT NULL,
  orderCreatedAt BIGINT NOT NULL,
  sequenceId BIGINT NOT NULL,
  symbolId BIGINT NOT NULL,
  userId BIGINT NOT NULL,
  fee DECIMAL(36,18) NOT NULL,
  price DECIMAL(36,18) NOT NULL,
  quantity DECIMAL(36,18) NOT NULL,
  direction VARCHAR(50) NOT NULL,
  type VARCHAR(50) NOT NULL,
  INDEX IDX_OID_CT (orderId,createdAt),
  PRIMARY KEY(orderId, counterOrderId)
) Engine=INNODB AUTO_INCREMENT=10000 DEFAULT CHARSET=UTF8;

-- spots_match_details_202202 --
CREATE TABLE spots_match_details_202202 (
  counterOrderId BIGINT NOT NULL,
  orderId BIGINT NOT NULL,
  counterUserId BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  feeCurrencyId BIGINT NOT NULL,
  orderCreatedAt BIGINT NOT NULL,
  sequenceId BIGINT NOT NULL,
  symbolId BIGINT NOT NULL,
  userId BIGINT NOT NULL,
  fee DECIMAL(36,18) NOT NULL,
  price DECIMAL(36,18) NOT NULL,
  quantity DECIMAL(36,18) NOT NULL,
  direction VARCHAR(50) NOT NULL,
  type VARCHAR(50) NOT NULL,
  INDEX IDX_OID_CT (orderId,createdAt),
  PRIMARY KEY(orderId, counterOrderId)
) Engine=INNODB AUTO_INCREMENT=10000 DEFAULT CHARSET=UTF8;

-- spots_orders_202103 --
CREATE TABLE spots_orders_202103 (
  id BIGINT NOT NULL,
  chargeQuote BOOL NOT NULL,
  features INTEGER NOT NULL,
  baseCurrencyId BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  quoteCurrencyId BIGINT NOT NULL,
  sequenceId BIGINT NOT NULL,
  symbolId BIGINT NOT NULL,
  updatedAt BIGINT NOT NULL,
  userId BIGINT NOT NULL,
  fillPrice DOUBLE NOT NULL,
  fee DECIMAL(36,18) NOT NULL,
  makerFeeRate DECIMAL(36,18) NOT NULL,
  price DECIMAL(36,18) NOT NULL,
  quantity DECIMAL(36,18) NOT NULL,
  takerFeeRate DECIMAL(36,18) NOT NULL,
  unfilledQuantity DECIMAL(36,18) NOT NULL,
  clientOrderId VARCHAR(32) NOT NULL,
  direction VARCHAR(50) NOT NULL,
  status VARCHAR(50) NOT NULL,
  type VARCHAR(50) NOT NULL,
  INDEX IDX_UID_ID (userId,id),
  INDEX IDX_UID_CID (userId,clientOrderId),
  INDEX IDX_UID_SYM_ID (userId,symbolId,id),
  PRIMARY KEY(id)
) Engine=INNODB AUTO_INCREMENT=10000 DEFAULT CHARSET=UTF8;

-- spots_orders_202104 --
CREATE TABLE spots_orders_202104 (
  id BIGINT NOT NULL,
  chargeQuote BOOL NOT NULL,
  features INTEGER NOT NULL,
  baseCurrencyId BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  quoteCurrencyId BIGINT NOT NULL,
  sequenceId BIGINT NOT NULL,
  symbolId BIGINT NOT NULL,
  updatedAt BIGINT NOT NULL,
  userId BIGINT NOT NULL,
  fillPrice DOUBLE NOT NULL,
  fee DECIMAL(36,18) NOT NULL,
  makerFeeRate DECIMAL(36,18) NOT NULL,
  price DECIMAL(36,18) NOT NULL,
  quantity DECIMAL(36,18) NOT NULL,
  takerFeeRate DECIMAL(36,18) NOT NULL,
  unfilledQuantity DECIMAL(36,18) NOT NULL,
  clientOrderId VARCHAR(32) NOT NULL,
  direction VARCHAR(50) NOT NULL,
  status VARCHAR(50) NOT NULL,
  type VARCHAR(50) NOT NULL,
  INDEX IDX_UID_ID (userId,id),
  INDEX IDX_UID_CID (userId,clientOrderId),
  INDEX IDX_UID_SYM_ID (userId,symbolId,id),
  PRIMARY KEY(id)
) Engine=INNODB AUTO_INCREMENT=10000 DEFAULT CHARSET=UTF8;

-- spots_orders_202105 --
CREATE TABLE spots_orders_202105 (
  id BIGINT NOT NULL,
  chargeQuote BOOL NOT NULL,
  features INTEGER NOT NULL,
  baseCurrencyId BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  quoteCurrencyId BIGINT NOT NULL,
  sequenceId BIGINT NOT NULL,
  symbolId BIGINT NOT NULL,
  updatedAt BIGINT NOT NULL,
  userId BIGINT NOT NULL,
  fillPrice DOUBLE NOT NULL,
  fee DECIMAL(36,18) NOT NULL,
  makerFeeRate DECIMAL(36,18) NOT NULL,
  price DECIMAL(36,18) NOT NULL,
  quantity DECIMAL(36,18) NOT NULL,
  takerFeeRate DECIMAL(36,18) NOT NULL,
  unfilledQuantity DECIMAL(36,18) NOT NULL,
  clientOrderId VARCHAR(32) NOT NULL,
  direction VARCHAR(50) NOT NULL,
  status VARCHAR(50) NOT NULL,
  type VARCHAR(50) NOT NULL,
  INDEX IDX_UID_ID (userId,id),
  INDEX IDX_UID_CID (userId,clientOrderId),
  INDEX IDX_UID_SYM_ID (userId,symbolId,id),
  PRIMARY KEY(id)
) Engine=INNODB AUTO_INCREMENT=10000 DEFAULT CHARSET=UTF8;

-- spots_orders_202106 --
CREATE TABLE spots_orders_202106 (
  id BIGINT NOT NULL,
  chargeQuote BOOL NOT NULL,
  features INTEGER NOT NULL,
  baseCurrencyId BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  quoteCurrencyId BIGINT NOT NULL,
  sequenceId BIGINT NOT NULL,
  symbolId BIGINT NOT NULL,
  updatedAt BIGINT NOT NULL,
  userId BIGINT NOT NULL,
  fillPrice DOUBLE NOT NULL,
  fee DECIMAL(36,18) NOT NULL,
  makerFeeRate DECIMAL(36,18) NOT NULL,
  price DECIMAL(36,18) NOT NULL,
  quantity DECIMAL(36,18) NOT NULL,
  takerFeeRate DECIMAL(36,18) NOT NULL,
  unfilledQuantity DECIMAL(36,18) NOT NULL,
  clientOrderId VARCHAR(32) NOT NULL,
  direction VARCHAR(50) NOT NULL,
  status VARCHAR(50) NOT NULL,
  type VARCHAR(50) NOT NULL,
  INDEX IDX_UID_ID (userId,id),
  INDEX IDX_UID_CID (userId,clientOrderId),
  INDEX IDX_UID_SYM_ID (userId,symbolId,id),
  PRIMARY KEY(id)
) Engine=INNODB AUTO_INCREMENT=10000 DEFAULT CHARSET=UTF8;

-- spots_orders_202107 --
CREATE TABLE spots_orders_202107 (
  id BIGINT NOT NULL,
  chargeQuote BOOL NOT NULL,
  features INTEGER NOT NULL,
  baseCurrencyId BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  quoteCurrencyId BIGINT NOT NULL,
  sequenceId BIGINT NOT NULL,
  symbolId BIGINT NOT NULL,
  updatedAt BIGINT NOT NULL,
  userId BIGINT NOT NULL,
  fillPrice DOUBLE NOT NULL,
  fee DECIMAL(36,18) NOT NULL,
  makerFeeRate DECIMAL(36,18) NOT NULL,
  price DECIMAL(36,18) NOT NULL,
  quantity DECIMAL(36,18) NOT NULL,
  takerFeeRate DECIMAL(36,18) NOT NULL,
  unfilledQuantity DECIMAL(36,18) NOT NULL,
  clientOrderId VARCHAR(32) NOT NULL,
  direction VARCHAR(50) NOT NULL,
  status VARCHAR(50) NOT NULL,
  type VARCHAR(50) NOT NULL,
  INDEX IDX_UID_ID (userId,id),
  INDEX IDX_UID_CID (userId,clientOrderId),
  INDEX IDX_UID_SYM_ID (userId,symbolId,id),
  PRIMARY KEY(id)
) Engine=INNODB AUTO_INCREMENT=10000 DEFAULT CHARSET=UTF8;

-- spots_orders_202108 --
CREATE TABLE spots_orders_202108 (
  id BIGINT NOT NULL,
  chargeQuote BOOL NOT NULL,
  features INTEGER NOT NULL,
  baseCurrencyId BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  quoteCurrencyId BIGINT NOT NULL,
  sequenceId BIGINT NOT NULL,
  symbolId BIGINT NOT NULL,
  updatedAt BIGINT NOT NULL,
  userId BIGINT NOT NULL,
  fillPrice DOUBLE NOT NULL,
  fee DECIMAL(36,18) NOT NULL,
  makerFeeRate DECIMAL(36,18) NOT NULL,
  price DECIMAL(36,18) NOT NULL,
  quantity DECIMAL(36,18) NOT NULL,
  takerFeeRate DECIMAL(36,18) NOT NULL,
  unfilledQuantity DECIMAL(36,18) NOT NULL,
  clientOrderId VARCHAR(32) NOT NULL,
  direction VARCHAR(50) NOT NULL,
  status VARCHAR(50) NOT NULL,
  type VARCHAR(50) NOT NULL,
  INDEX IDX_UID_ID (userId,id),
  INDEX IDX_UID_CID (userId,clientOrderId),
  INDEX IDX_UID_SYM_ID (userId,symbolId,id),
  PRIMARY KEY(id)
) Engine=INNODB AUTO_INCREMENT=10000 DEFAULT CHARSET=UTF8;

-- spots_orders_202109 --
CREATE TABLE spots_orders_202109 (
  id BIGINT NOT NULL,
  chargeQuote BOOL NOT NULL,
  features INTEGER NOT NULL,
  baseCurrencyId BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  quoteCurrencyId BIGINT NOT NULL,
  sequenceId BIGINT NOT NULL,
  symbolId BIGINT NOT NULL,
  updatedAt BIGINT NOT NULL,
  userId BIGINT NOT NULL,
  fillPrice DOUBLE NOT NULL,
  fee DECIMAL(36,18) NOT NULL,
  makerFeeRate DECIMAL(36,18) NOT NULL,
  price DECIMAL(36,18) NOT NULL,
  quantity DECIMAL(36,18) NOT NULL,
  takerFeeRate DECIMAL(36,18) NOT NULL,
  unfilledQuantity DECIMAL(36,18) NOT NULL,
  clientOrderId VARCHAR(32) NOT NULL,
  direction VARCHAR(50) NOT NULL,
  status VARCHAR(50) NOT NULL,
  type VARCHAR(50) NOT NULL,
  INDEX IDX_UID_ID (userId,id),
  INDEX IDX_UID_CID (userId,clientOrderId),
  INDEX IDX_UID_SYM_ID (userId,symbolId,id),
  PRIMARY KEY(id)
) Engine=INNODB AUTO_INCREMENT=10000 DEFAULT CHARSET=UTF8;

-- spots_orders_202110 --
CREATE TABLE spots_orders_202110 (
  id BIGINT NOT NULL,
  chargeQuote BOOL NOT NULL,
  features INTEGER NOT NULL,
  baseCurrencyId BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  quoteCurrencyId BIGINT NOT NULL,
  sequenceId BIGINT NOT NULL,
  symbolId BIGINT NOT NULL,
  updatedAt BIGINT NOT NULL,
  userId BIGINT NOT NULL,
  fillPrice DOUBLE NOT NULL,
  fee DECIMAL(36,18) NOT NULL,
  makerFeeRate DECIMAL(36,18) NOT NULL,
  price DECIMAL(36,18) NOT NULL,
  quantity DECIMAL(36,18) NOT NULL,
  takerFeeRate DECIMAL(36,18) NOT NULL,
  unfilledQuantity DECIMAL(36,18) NOT NULL,
  clientOrderId VARCHAR(32) NOT NULL,
  direction VARCHAR(50) NOT NULL,
  status VARCHAR(50) NOT NULL,
  type VARCHAR(50) NOT NULL,
  INDEX IDX_UID_ID (userId,id),
  INDEX IDX_UID_CID (userId,clientOrderId),
  INDEX IDX_UID_SYM_ID (userId,symbolId,id),
  PRIMARY KEY(id)
) Engine=INNODB AUTO_INCREMENT=10000 DEFAULT CHARSET=UTF8;

-- spots_orders_202111 --
CREATE TABLE spots_orders_202111 (
  id BIGINT NOT NULL,
  chargeQuote BOOL NOT NULL,
  features INTEGER NOT NULL,
  baseCurrencyId BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  quoteCurrencyId BIGINT NOT NULL,
  sequenceId BIGINT NOT NULL,
  symbolId BIGINT NOT NULL,
  updatedAt BIGINT NOT NULL,
  userId BIGINT NOT NULL,
  fillPrice DOUBLE NOT NULL,
  fee DECIMAL(36,18) NOT NULL,
  makerFeeRate DECIMAL(36,18) NOT NULL,
  price DECIMAL(36,18) NOT NULL,
  quantity DECIMAL(36,18) NOT NULL,
  takerFeeRate DECIMAL(36,18) NOT NULL,
  unfilledQuantity DECIMAL(36,18) NOT NULL,
  clientOrderId VARCHAR(32) NOT NULL,
  direction VARCHAR(50) NOT NULL,
  status VARCHAR(50) NOT NULL,
  type VARCHAR(50) NOT NULL,
  INDEX IDX_UID_ID (userId,id),
  INDEX IDX_UID_CID (userId,clientOrderId),
  INDEX IDX_UID_SYM_ID (userId,symbolId,id),
  PRIMARY KEY(id)
) Engine=INNODB AUTO_INCREMENT=10000 DEFAULT CHARSET=UTF8;

-- spots_orders_202112 --
CREATE TABLE spots_orders_202112 (
  id BIGINT NOT NULL,
  chargeQuote BOOL NOT NULL,
  features INTEGER NOT NULL,
  baseCurrencyId BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  quoteCurrencyId BIGINT NOT NULL,
  sequenceId BIGINT NOT NULL,
  symbolId BIGINT NOT NULL,
  updatedAt BIGINT NOT NULL,
  userId BIGINT NOT NULL,
  fillPrice DOUBLE NOT NULL,
  fee DECIMAL(36,18) NOT NULL,
  makerFeeRate DECIMAL(36,18) NOT NULL,
  price DECIMAL(36,18) NOT NULL,
  quantity DECIMAL(36,18) NOT NULL,
  takerFeeRate DECIMAL(36,18) NOT NULL,
  unfilledQuantity DECIMAL(36,18) NOT NULL,
  clientOrderId VARCHAR(32) NOT NULL,
  direction VARCHAR(50) NOT NULL,
  status VARCHAR(50) NOT NULL,
  type VARCHAR(50) NOT NULL,
  INDEX IDX_UID_ID (userId,id),
  INDEX IDX_UID_CID (userId,clientOrderId),
  INDEX IDX_UID_SYM_ID (userId,symbolId,id),
  PRIMARY KEY(id)
) Engine=INNODB AUTO_INCREMENT=10000 DEFAULT CHARSET=UTF8;

-- spots_orders_202201 --
CREATE TABLE spots_orders_202201 (
  id BIGINT NOT NULL,
  chargeQuote BOOL NOT NULL,
  features INTEGER NOT NULL,
  baseCurrencyId BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  quoteCurrencyId BIGINT NOT NULL,
  sequenceId BIGINT NOT NULL,
  symbolId BIGINT NOT NULL,
  updatedAt BIGINT NOT NULL,
  userId BIGINT NOT NULL,
  fillPrice DOUBLE NOT NULL,
  fee DECIMAL(36,18) NOT NULL,
  makerFeeRate DECIMAL(36,18) NOT NULL,
  price DECIMAL(36,18) NOT NULL,
  quantity DECIMAL(36,18) NOT NULL,
  takerFeeRate DECIMAL(36,18) NOT NULL,
  unfilledQuantity DECIMAL(36,18) NOT NULL,
  clientOrderId VARCHAR(32) NOT NULL,
  direction VARCHAR(50) NOT NULL,
  status VARCHAR(50) NOT NULL,
  type VARCHAR(50) NOT NULL,
  INDEX IDX_UID_ID (userId,id),
  INDEX IDX_UID_CID (userId,clientOrderId),
  INDEX IDX_UID_SYM_ID (userId,symbolId,id),
  PRIMARY KEY(id)
) Engine=INNODB AUTO_INCREMENT=10000 DEFAULT CHARSET=UTF8;

-- spots_orders_202202 --
CREATE TABLE spots_orders_202202 (
  id BIGINT NOT NULL,
  chargeQuote BOOL NOT NULL,
  features INTEGER NOT NULL,
  baseCurrencyId BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  quoteCurrencyId BIGINT NOT NULL,
  sequenceId BIGINT NOT NULL,
  symbolId BIGINT NOT NULL,
  updatedAt BIGINT NOT NULL,
  userId BIGINT NOT NULL,
  fillPrice DOUBLE NOT NULL,
  fee DECIMAL(36,18) NOT NULL,
  makerFeeRate DECIMAL(36,18) NOT NULL,
  price DECIMAL(36,18) NOT NULL,
  quantity DECIMAL(36,18) NOT NULL,
  takerFeeRate DECIMAL(36,18) NOT NULL,
  unfilledQuantity DECIMAL(36,18) NOT NULL,
  clientOrderId VARCHAR(32) NOT NULL,
  direction VARCHAR(50) NOT NULL,
  status VARCHAR(50) NOT NULL,
  type VARCHAR(50) NOT NULL,
  INDEX IDX_UID_ID (userId,id),
  INDEX IDX_UID_CID (userId,clientOrderId),
  INDEX IDX_UID_SYM_ID (userId,symbolId,id),
  PRIMARY KEY(id)
) Engine=INNODB AUTO_INCREMENT=10000 DEFAULT CHARSET=UTF8;

-- END generate DDL --
