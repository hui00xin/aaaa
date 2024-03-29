

-- BEGIN generate DDL --

DROP DATABASE IF EXISTS crypto_wallet;

CREATE DATABASE crypto_wallet;

CREATE USER IF NOT EXISTS crypto_rw@'%' IDENTIFIED BY 'crypto_rw_password';

CREATE USER IF NOT EXISTS crypto_ro@'%' IDENTIFIED BY 'crypto_ro_password';

GRANT SELECT,INSERT,DELETE,UPDATE ON crypto_wallet.* TO crypto_rw@'%' WITH GRANT OPTION;

GRANT SELECT ON crypto_wallet.* TO crypto_ro@'%' WITH GRANT OPTION;

FLUSH PRIVILEGES;

USE crypto_wallet;

CREATE TABLE transfer_logs (
  id BIGINT AUTO_INCREMENT NOT NULL,
  done BOOL NOT NULL,
  receiver BOOL NOT NULL,
  success BOOL NOT NULL,
  accountId INTEGER NOT NULL,
  createdAt BIGINT NOT NULL,
  currencyId BIGINT NOT NULL,
  updatedAt BIGINT NOT NULL,
  userId BIGINT NOT NULL,
  amount DECIMAL(36,18) NOT NULL,
  currencyName VARCHAR(32) NOT NULL,
  transferFrom VARCHAR(50) NOT NULL,
  transferId VARCHAR(32) NOT NULL,
  transferTo VARCHAR(50) NOT NULL,
  CONSTRAINT UNI_UID_TID_R UNIQUE (userId,transferId,receiver),
  INDEX IDX_CAT (createdAt),
  PRIMARY KEY(id)
) Engine=INNODB AUTO_INCREMENT=10000 DEFAULT CHARSET=UTF8;


CREATE TABLE transfer_requests (
  transferId VARCHAR(32) NOT NULL,
  done1 BOOL NOT NULL,
  done2 BOOL NOT NULL,
  success1 BOOL NOT NULL,
  success2 BOOL NOT NULL,
  createdAt BIGINT NOT NULL,
  currencyId BIGINT NOT NULL,
  fromUserId BIGINT NOT NULL,
  toUserId BIGINT NOT NULL,
  updatedAt BIGINT NOT NULL,
  amount DECIMAL(36,18) NOT NULL,
  currencyName VARCHAR(32) NOT NULL,
  transferFrom VARCHAR(50) NOT NULL,
  transferTo VARCHAR(50) NOT NULL,
  INDEX IDX_CAT_DONE1 (createdAt,done1),
  INDEX IDX_CAT_DONE2 (createdAt,done2),
  PRIMARY KEY(transferId)
) Engine=INNODB AUTO_INCREMENT=10000 DEFAULT CHARSET=UTF8;


CREATE TABLE wallet_balance_flows (
  id BIGINT AUTO_INCREMENT NOT NULL,
  sign BOOL NOT NULL,
  counterUserId BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  currencyId BIGINT NOT NULL,
  userId BIGINT NOT NULL,
  amount DECIMAL(36,18) NOT NULL,
  flowType VARCHAR(50) NOT NULL,
  transferType VARCHAR(50) NOT NULL,
  INDEX IDX_USER_CURRENCY_ID (userId,currencyId,id),
  INDEX IDX_USER_ID (userId,id),
  PRIMARY KEY(id)
) Engine=INNODB AUTO_INCREMENT=10000 DEFAULT CHARSET=UTF8;


CREATE TABLE wallet_balances (
  id BIGINT AUTO_INCREMENT NOT NULL,
  currencyId BIGINT NOT NULL,
  updatedAt BIGINT NOT NULL,
  userId BIGINT NOT NULL,
  balance DECIMAL(36,18) NOT NULL,
  type VARCHAR(50) NOT NULL,
  CONSTRAINT UNI_USER_CUR_TYPE UNIQUE (userId, currencyId, type),
  PRIMARY KEY(id)
) Engine=INNODB AUTO_INCREMENT=10000 DEFAULT CHARSET=UTF8;


CREATE TABLE wallet_deposit_logs (
  id BIGINT AUTO_INCREMENT NOT NULL,
  removed BOOL NOT NULL,
  blockNumber BIGINT NOT NULL,
  blockTimestamp BIGINT NOT NULL,
  currencyId BIGINT NOT NULL,
  amount DECIMAL(36,18) NOT NULL,
  blockHash VARCHAR(66) NOT NULL,
  depositFor VARCHAR(42) NOT NULL,
  operator VARCHAR(42) NOT NULL,
  token VARCHAR(42) NOT NULL,
  txHash VARCHAR(66) NOT NULL,
  CONSTRAINT UNI_TX UNIQUE (txHash),
  INDEX IDX_ADDR_TS (depositFor,blockTimestamp),
  PRIMARY KEY(id)
) Engine=INNODB AUTO_INCREMENT=10000 DEFAULT CHARSET=UTF8;


CREATE TABLE wallet_locks (
  id VARCHAR(32) NOT NULL,
  expiresAt BIGINT NOT NULL,
  owner VARCHAR(100) NOT NULL,
  PRIMARY KEY(id)
) Engine=INNODB AUTO_INCREMENT=10000 DEFAULT CHARSET=UTF8;


CREATE TABLE wallet_settings (
  id VARCHAR(100) NOT NULL,
  updatedAt BIGINT NOT NULL,
  setting VARCHAR(100) NOT NULL,
  PRIMARY KEY(id)
) Engine=INNODB AUTO_INCREMENT=10000 DEFAULT CHARSET=UTF8;


CREATE TABLE wallet_transfer_results (
  transferId VARCHAR(32) NOT NULL,
  success BOOL NOT NULL,
  createdAt BIGINT NOT NULL,
  currencyId BIGINT NOT NULL,
  fromUserId BIGINT NOT NULL,
  toUserId BIGINT NOT NULL,
  amount DECIMAL(36,18) NOT NULL,
  transferFrom VARCHAR(50) NOT NULL,
  transferTo VARCHAR(50) NOT NULL,
  PRIMARY KEY(transferId)
) Engine=INNODB AUTO_INCREMENT=10000 DEFAULT CHARSET=UTF8;


CREATE TABLE wallet_unreplays (
  uniqueId VARCHAR(32) NOT NULL,
  userId BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  INDEX IDX_CREATEDAT (createdAt),
  PRIMARY KEY(uniqueId, userId)
) Engine=INNODB AUTO_INCREMENT=10000 DEFAULT CHARSET=UTF8;


CREATE TABLE wallet_withdraw_requests (
  id BIGINT AUTO_INCREMENT NOT NULL,
  tokenDecimals INTEGER NOT NULL,
  createdAt BIGINT NOT NULL,
  currencyId BIGINT NOT NULL,
  expiresAt BIGINT NOT NULL,
  updatedAt BIGINT NOT NULL,
  userId BIGINT NOT NULL,
  version BIGINT NOT NULL,
  amount DECIMAL(36,18) NOT NULL,
  operator VARCHAR(42) NOT NULL,
  status VARCHAR(50) NOT NULL,
  token VARCHAR(42) NOT NULL,
  txHash VARCHAR(66) NOT NULL,
  withdrawFor VARCHAR(42) NOT NULL,
  INDEX IDX_ADDR_TS (withdrawFor,createdAt),
  PRIMARY KEY(id)
) Engine=INNODB AUTO_INCREMENT=10000 DEFAULT CHARSET=UTF8;

-- wallet_balance_flows_202103 --
CREATE TABLE wallet_balance_flows_202103 (
  id BIGINT AUTO_INCREMENT NOT NULL,
  sign BOOL NOT NULL,
  counterUserId BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  currencyId BIGINT NOT NULL,
  userId BIGINT NOT NULL,
  amount DECIMAL(36,18) NOT NULL,
  flowType VARCHAR(50) NOT NULL,
  transferType VARCHAR(50) NOT NULL,
  INDEX IDX_USER_CURRENCY_ID (userId,currencyId,id),
  INDEX IDX_USER_ID (userId,id),
  PRIMARY KEY(id)
) Engine=INNODB AUTO_INCREMENT=10000 DEFAULT CHARSET=UTF8;

-- wallet_balance_flows_202104 --
CREATE TABLE wallet_balance_flows_202104 (
  id BIGINT AUTO_INCREMENT NOT NULL,
  sign BOOL NOT NULL,
  counterUserId BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  currencyId BIGINT NOT NULL,
  userId BIGINT NOT NULL,
  amount DECIMAL(36,18) NOT NULL,
  flowType VARCHAR(50) NOT NULL,
  transferType VARCHAR(50) NOT NULL,
  INDEX IDX_USER_CURRENCY_ID (userId,currencyId,id),
  INDEX IDX_USER_ID (userId,id),
  PRIMARY KEY(id)
) Engine=INNODB AUTO_INCREMENT=10000 DEFAULT CHARSET=UTF8;

-- wallet_balance_flows_202105 --
CREATE TABLE wallet_balance_flows_202105 (
  id BIGINT AUTO_INCREMENT NOT NULL,
  sign BOOL NOT NULL,
  counterUserId BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  currencyId BIGINT NOT NULL,
  userId BIGINT NOT NULL,
  amount DECIMAL(36,18) NOT NULL,
  flowType VARCHAR(50) NOT NULL,
  transferType VARCHAR(50) NOT NULL,
  INDEX IDX_USER_CURRENCY_ID (userId,currencyId,id),
  INDEX IDX_USER_ID (userId,id),
  PRIMARY KEY(id)
) Engine=INNODB AUTO_INCREMENT=10000 DEFAULT CHARSET=UTF8;

-- wallet_balance_flows_202106 --
CREATE TABLE wallet_balance_flows_202106 (
  id BIGINT AUTO_INCREMENT NOT NULL,
  sign BOOL NOT NULL,
  counterUserId BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  currencyId BIGINT NOT NULL,
  userId BIGINT NOT NULL,
  amount DECIMAL(36,18) NOT NULL,
  flowType VARCHAR(50) NOT NULL,
  transferType VARCHAR(50) NOT NULL,
  INDEX IDX_USER_CURRENCY_ID (userId,currencyId,id),
  INDEX IDX_USER_ID (userId,id),
  PRIMARY KEY(id)
) Engine=INNODB AUTO_INCREMENT=10000 DEFAULT CHARSET=UTF8;

-- wallet_balance_flows_202107 --
CREATE TABLE wallet_balance_flows_202107 (
  id BIGINT AUTO_INCREMENT NOT NULL,
  sign BOOL NOT NULL,
  counterUserId BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  currencyId BIGINT NOT NULL,
  userId BIGINT NOT NULL,
  amount DECIMAL(36,18) NOT NULL,
  flowType VARCHAR(50) NOT NULL,
  transferType VARCHAR(50) NOT NULL,
  INDEX IDX_USER_CURRENCY_ID (userId,currencyId,id),
  INDEX IDX_USER_ID (userId,id),
  PRIMARY KEY(id)
) Engine=INNODB AUTO_INCREMENT=10000 DEFAULT CHARSET=UTF8;

-- wallet_balance_flows_202108 --
CREATE TABLE wallet_balance_flows_202108 (
  id BIGINT AUTO_INCREMENT NOT NULL,
  sign BOOL NOT NULL,
  counterUserId BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  currencyId BIGINT NOT NULL,
  userId BIGINT NOT NULL,
  amount DECIMAL(36,18) NOT NULL,
  flowType VARCHAR(50) NOT NULL,
  transferType VARCHAR(50) NOT NULL,
  INDEX IDX_USER_CURRENCY_ID (userId,currencyId,id),
  INDEX IDX_USER_ID (userId,id),
  PRIMARY KEY(id)
) Engine=INNODB AUTO_INCREMENT=10000 DEFAULT CHARSET=UTF8;

-- wallet_balance_flows_202109 --
CREATE TABLE wallet_balance_flows_202109 (
  id BIGINT AUTO_INCREMENT NOT NULL,
  sign BOOL NOT NULL,
  counterUserId BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  currencyId BIGINT NOT NULL,
  userId BIGINT NOT NULL,
  amount DECIMAL(36,18) NOT NULL,
  flowType VARCHAR(50) NOT NULL,
  transferType VARCHAR(50) NOT NULL,
  INDEX IDX_USER_CURRENCY_ID (userId,currencyId,id),
  INDEX IDX_USER_ID (userId,id),
  PRIMARY KEY(id)
) Engine=INNODB AUTO_INCREMENT=10000 DEFAULT CHARSET=UTF8;

-- wallet_balance_flows_202110 --
CREATE TABLE wallet_balance_flows_202110 (
  id BIGINT AUTO_INCREMENT NOT NULL,
  sign BOOL NOT NULL,
  counterUserId BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  currencyId BIGINT NOT NULL,
  userId BIGINT NOT NULL,
  amount DECIMAL(36,18) NOT NULL,
  flowType VARCHAR(50) NOT NULL,
  transferType VARCHAR(50) NOT NULL,
  INDEX IDX_USER_CURRENCY_ID (userId,currencyId,id),
  INDEX IDX_USER_ID (userId,id),
  PRIMARY KEY(id)
) Engine=INNODB AUTO_INCREMENT=10000 DEFAULT CHARSET=UTF8;

-- wallet_balance_flows_202111 --
CREATE TABLE wallet_balance_flows_202111 (
  id BIGINT AUTO_INCREMENT NOT NULL,
  sign BOOL NOT NULL,
  counterUserId BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  currencyId BIGINT NOT NULL,
  userId BIGINT NOT NULL,
  amount DECIMAL(36,18) NOT NULL,
  flowType VARCHAR(50) NOT NULL,
  transferType VARCHAR(50) NOT NULL,
  INDEX IDX_USER_CURRENCY_ID (userId,currencyId,id),
  INDEX IDX_USER_ID (userId,id),
  PRIMARY KEY(id)
) Engine=INNODB AUTO_INCREMENT=10000 DEFAULT CHARSET=UTF8;

-- wallet_balance_flows_202112 --
CREATE TABLE wallet_balance_flows_202112 (
  id BIGINT AUTO_INCREMENT NOT NULL,
  sign BOOL NOT NULL,
  counterUserId BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  currencyId BIGINT NOT NULL,
  userId BIGINT NOT NULL,
  amount DECIMAL(36,18) NOT NULL,
  flowType VARCHAR(50) NOT NULL,
  transferType VARCHAR(50) NOT NULL,
  INDEX IDX_USER_CURRENCY_ID (userId,currencyId,id),
  INDEX IDX_USER_ID (userId,id),
  PRIMARY KEY(id)
) Engine=INNODB AUTO_INCREMENT=10000 DEFAULT CHARSET=UTF8;

-- wallet_balance_flows_202201 --
CREATE TABLE wallet_balance_flows_202201 (
  id BIGINT AUTO_INCREMENT NOT NULL,
  sign BOOL NOT NULL,
  counterUserId BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  currencyId BIGINT NOT NULL,
  userId BIGINT NOT NULL,
  amount DECIMAL(36,18) NOT NULL,
  flowType VARCHAR(50) NOT NULL,
  transferType VARCHAR(50) NOT NULL,
  INDEX IDX_USER_CURRENCY_ID (userId,currencyId,id),
  INDEX IDX_USER_ID (userId,id),
  PRIMARY KEY(id)
) Engine=INNODB AUTO_INCREMENT=10000 DEFAULT CHARSET=UTF8;

-- wallet_balance_flows_202202 --
CREATE TABLE wallet_balance_flows_202202 (
  id BIGINT AUTO_INCREMENT NOT NULL,
  sign BOOL NOT NULL,
  counterUserId BIGINT NOT NULL,
  createdAt BIGINT NOT NULL,
  currencyId BIGINT NOT NULL,
  userId BIGINT NOT NULL,
  amount DECIMAL(36,18) NOT NULL,
  flowType VARCHAR(50) NOT NULL,
  transferType VARCHAR(50) NOT NULL,
  INDEX IDX_USER_CURRENCY_ID (userId,currencyId,id),
  INDEX IDX_USER_ID (userId,id),
  PRIMARY KEY(id)
) Engine=INNODB AUTO_INCREMENT=10000 DEFAULT CHARSET=UTF8;

-- END generate DDL --
