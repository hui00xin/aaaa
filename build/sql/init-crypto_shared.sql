

-- BEGIN generate INSERTS --

USE crypto_shared;

INSERT INTO `users` (`type`, `address`, `level`, `internal`, `id`, `createdAt`, `updatedAt`, `version`) VALUES ('MANAGE', '0x0000000000000000000000000000000000000100', 0, 1, 100, 1546963210600, 1546963210600, 0);
INSERT INTO `users` (`type`, `address`, `level`, `internal`, `id`, `createdAt`, `updatedAt`, `version`) VALUES ('UI', '0x0000000000000000000000000000000000000101', 0, 1, 101, 1546963231080, 1546963231080, 0);
INSERT INTO `users` (`type`, `address`, `level`, `internal`, `id`, `createdAt`, `updatedAt`, `version`) VALUES ('WALLET', '0x0000000000000000000000000000000000000102', 0, 1, 102, 1546963272040, 1546963272040, 0);
INSERT INTO `users` (`type`, `address`, `level`, `internal`, `id`, `createdAt`, `updatedAt`, `version`) VALUES ('TRADING_API', '0x0000000000000000000000000000000000000103', 0, 1, 103, 1546963288424, 1546963288424, 0);
INSERT INTO `users` (`type`, `address`, `level`, `internal`, `id`, `createdAt`, `updatedAt`, `version`) VALUES ('WALLET_DEBT', '0x0000000000000000000000000000000000000104', 0, 1, 104, 1546963321192, 1546963321192, 0);
INSERT INTO `users` (`type`, `address`, `level`, `internal`, `id`, `createdAt`, `updatedAt`, `version`) VALUES ('TRANSFER_HOLDER', '0x0000000000000000000000000000000000000105', 0, 1, 105, 1546963321192, 1546963321192, 0);
INSERT INTO `users` (`type`, `address`, `level`, `internal`, `id`, `createdAt`, `updatedAt`, `version`) VALUES ('FEE', '0x0000000000000000000000000000000000000106', 0, 1, 106, 1546963321192, 1546963321192, 0);
INSERT INTO `currencies` (`id`, `name`) VALUES (456, 'ETH');
INSERT INTO `currency_deposit_configs` (`chainId`, `address`, `currencyId`, `name`, `symbol`, `decimals`) VALUES (4, '0xeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee', 456, 'Ether', 'ETH', 18);
INSERT INTO `currencies` (`id`, `name`) VALUES (362, 'WBTC');
INSERT INTO `currency_deposit_configs` (`chainId`, `address`, `currencyId`, `name`, `symbol`, `decimals`) VALUES (4, '0x11ae93e32bdafa411c023238ffd46679e03bf014', 362, 'Fake WBTC', 'WBTC', 8);
INSERT INTO `currencies` (`id`, `name`) VALUES (260, 'USDT');
INSERT INTO `currency_deposit_configs` (`chainId`, `address`, `currencyId`, `name`, `symbol`, `decimals`) VALUES (4, '0x27478c96c00e8a593cc86e51f24aa296f73b4923', 260, 'Fake USDT', 'USDT', 6);
INSERT INTO `currencies` (`id`, `name`) VALUES (378, 'BNB');
INSERT INTO `currency_deposit_configs` (`chainId`, `address`, `currencyId`, `name`, `symbol`, `decimals`) VALUES (4, '0xc329f6cd62b93bf4eced8af43813e323e8f41e72', 378, 'Fake BNB', 'BNB', 18);
INSERT INTO `spots_symbols` (`baseId`, `quoteId`, `alwaysChargeQuote`, `baseMinimumIncrement`, `baseMinimumQuantity`, `baseMaximumQuantity`, `quoteMinimumIncrement`, `id`, `name`, `startTime`, `endTime`, `displayOrder`) VALUES (362, 260, 1, 0.01, 0.01, 10, 0.1, 10036200260, 'WBTC_USDT', 0, 5995814400000, 1);
INSERT INTO `spots_symbols` (`baseId`, `quoteId`, `alwaysChargeQuote`, `baseMinimumIncrement`, `baseMinimumQuantity`, `baseMaximumQuantity`, `quoteMinimumIncrement`, `id`, `name`, `startTime`, `endTime`, `displayOrder`) VALUES (456, 260, 1, 0.01, 0.01, 10, 0.1, 10045600260, 'ETH_USDT', 0, 5995814400000, 2);
INSERT INTO `spots_symbols` (`baseId`, `quoteId`, `alwaysChargeQuote`, `baseMinimumIncrement`, `baseMinimumQuantity`, `baseMaximumQuantity`, `quoteMinimumIncrement`, `id`, `name`, `startTime`, `endTime`, `displayOrder`) VALUES (378, 260, 1, 0.01, 0.01, 10, 0.1, 10037800260, 'BNB_USDT', 0, 5995814400000, 3);
INSERT INTO `users` (`type`, `address`, `level`, `internal`, `id`, `createdAt`, `updatedAt`, `version`) VALUES ('ROOT', '0xf3ed01645b34f13b0922c3dacfc229d9761bf603', 0, 0, 500, 1614528000000, 1614528000000, 0);
INSERT INTO `users` (`type`, `address`, `level`, `internal`, `id`, `createdAt`, `updatedAt`, `version`) VALUES ('MANAGER', '0x1ac2305b2f4a3d1c26930d4438cffae1e36d9966', 0, 0, 501, 1614528000000, 1614528000000, 0);
INSERT INTO `users` (`type`, `address`, `level`, `internal`, `id`, `createdAt`, `updatedAt`, `version`) VALUES ('MANAGER', '0x9caaada8a34133b19f92a16b07b2a74bb415cb2c', 0, 0, 502, 1614528000000, 1614528000000, 0);
UPDATE users SET id = 100 WHERE type = 'MANAGE';
UPDATE users SET id = 101 WHERE type = 'UI';
UPDATE users SET id = 102 WHERE type = 'WALLET';
UPDATE users SET id = 103 WHERE type = 'TRADING_API';
UPDATE users SET id = 104 WHERE type = 'WALLET_DEBT';
UPDATE users SET id = 105 WHERE type = 'TRANSFER_HOLDER';
UPDATE users SET id = 106 WHERE type = 'FEE';


-- END generate INSERTS --

