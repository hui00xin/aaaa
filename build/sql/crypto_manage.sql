

-- BEGIN generate DDL --

DROP DATABASE IF EXISTS crypto_manage;

CREATE DATABASE crypto_manage;

CREATE USER IF NOT EXISTS crypto_rw@'%' IDENTIFIED BY 'crypto_rw_password';

CREATE USER IF NOT EXISTS crypto_ro@'%' IDENTIFIED BY 'crypto_ro_password';

GRANT SELECT,INSERT,DELETE,UPDATE ON crypto_manage.* TO crypto_rw@'%' WITH GRANT OPTION;

GRANT SELECT ON crypto_manage.* TO crypto_ro@'%' WITH GRANT OPTION;

FLUSH PRIVILEGES;

USE crypto_manage;

CREATE TABLE manager_operation_logs (
  id BIGINT AUTO_INCREMENT NOT NULL,
  ok BOOL NOT NULL,
  createdAt BIGINT NOT NULL,
  managerId BIGINT NOT NULL,
  destination VARCHAR(50) NOT NULL,
  managerEmail VARCHAR(50) NOT NULL,
  scope VARCHAR(50) NOT NULL,
  requestData VARCHAR(1000) NOT NULL,
  responseData VARCHAR(1000) NOT NULL,
  url VARCHAR(1000) NOT NULL,
  INDEX IDX_CREATEDAT (createdAt),
  PRIMARY KEY(id)
) Engine=INNODB AUTO_INCREMENT=10000 DEFAULT CHARSET=UTF8;

-- END generate DDL --
