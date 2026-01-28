DROP DATABASE IF EXISTS bd_empresa_rural_teste;
CREATE DATABASE bd_empresa_rural_teste;
USE bd_empresa_rural_teste;

DROP TABLE IF EXISTS `tb_cliente`;

CREATE TABLE `tb_cliente` (
  `cli_codigo` int NOT NULL AUTO_INCREMENT,
  `cli_nome` varchar(80) NOT NULL,
  PRIMARY KEY (`cli_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `tb_insumo`;

CREATE TABLE `tb_insumo` (
  `ins_codigo` int NOT NULL AUTO_INCREMENT,
  `ins_nome` varchar(50) NOT NULL,
  PRIMARY KEY (`ins_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `tb_producao`;

CREATE TABLE `tb_producao` (
  `prod_codigo` int NOT NULL AUTO_INCREMENT,
  `prod_data_inicio` date NOT NULL,
  `prod_data_fim` date NOT NULL,
  PRIMARY KEY (`prod_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `tb_unidade_medida`;

CREATE TABLE `tb_unidade_medida` (
  `uni_codigo` int NOT NULL AUTO_INCREMENT,
  `uni_unidade` varchar(40) NOT NULL,
  PRIMARY KEY (`uni_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `tb_venda`;

CREATE TABLE `tb_venda` (
  `ven_codigo` int NOT NULL AUTO_INCREMENT,
  `ven_data` date NOT NULL,
  `ven_cli_codigo` int NOT NULL,
  PRIMARY KEY (`ven_codigo`),
  KEY `ven_cli_codigo` (`ven_cli_codigo`),
  CONSTRAINT `fk_ven_cli_codigo` FOREIGN KEY (`ven_cli_codigo`) REFERENCES `tb_cliente` (`cli_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `tb_gasto_insumos`;

CREATE TABLE `tb_gasto_insumos` (
  `gas_codigo` int NOT NULL AUTO_INCREMENT,
  `gas_ins_codigo` int NOT NULL,
  `gas_qtd_insumo` int NOT NULL,
  `gas_preco_unitario` decimal(10,2) NOT NULL,
  `gas_data` date NOT NULL,
  `gas_valor_total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`gas_codigo`),
  KEY `fk_gas_ins_codigo` (`gas_ins_codigo`),
  CONSTRAINT `fk_gas_ins_codigo` FOREIGN KEY (`gas_ins_codigo`) REFERENCES `tb_insumo` (`ins_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `tb_produto`;

CREATE TABLE `tb_produto` (
  `pro_codigo` int NOT NULL AUTO_INCREMENT,
  `pro_nome` varchar(80) NOT NULL,
  `pro_uni_codigo` int NOT NULL,
  `pro_preco` decimal(10,2) NOT NULL,
  PRIMARY KEY (`pro_codigo`),
  KEY `pro_uni_codigo` (`pro_uni_codigo`),
  CONSTRAINT `fk_pro_uni_codigo` FOREIGN KEY (`pro_uni_codigo`) REFERENCES `tb_unidade_medida` (`uni_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `tb_itens_vendidos`;

CREATE TABLE `tb_itens_vendidos` (
  `it_pro_codigo` int NOT NULL,
  `it_ven_codigo` int NOT NULL,
  `it_quantidade` int NOT NULL,
  `it_valor_total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`it_pro_codigo`,`it_ven_codigo`),
  KEY `fk_it_ven_cod` (`it_ven_codigo`),
  CONSTRAINT `fk_it_pro_cod` FOREIGN KEY (`it_pro_codigo`) REFERENCES `tb_produto` (`pro_codigo`),
  CONSTRAINT `fk_it_ven_cod` FOREIGN KEY (`it_ven_codigo`) REFERENCES `tb_venda` (`ven_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `tb_producao_produto`;

CREATE TABLE `tb_producao_produto` (
  `pp_codigo` int NOT NULL AUTO_INCREMENT,
  `pp_prod_codigo` int NOT NULL,
  `pp_pro_codigo` int NOT NULL,
  `pp_quantidade` int NOT NULL,
  PRIMARY KEY (`pp_codigo`),
  KEY `fk_pp_prod_codigo` (`pp_prod_codigo`),
  KEY `fk_pp_pro_codigo` (`pp_pro_codigo`),
  CONSTRAINT `fk_pp_pro_codigo` FOREIGN KEY (`pp_pro_codigo`) REFERENCES `tb_produto` (`pro_codigo`),
  CONSTRAINT `fk_pp_prod_codigo` FOREIGN KEY (`pp_prod_codigo`) REFERENCES `tb_producao` (`prod_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO `tb_unidade_medida` VALUES (1,'KG'),(2,'UNI');
INSERT INTO `tb_cliente` VALUES (1,'Antonio'),(2,'Pedro'),(3,'Fernanda');
INSERT INTO `tb_insumo` VALUES (1,'Lenha'),(2,'Mandioca');
INSERT INTO `tb_produto` VALUES (1,'Farinha',2,50.00),(2,'Goma',1,100.00);
INSERT INTO `tb_producao` VALUES (1,'2026-01-25','2026-01-29');
INSERT INTO `tb_venda` VALUES (1,'2026-01-25',1),(2,'2026-01-26',3);



INSERT INTO `tb_itens_vendidos` VALUES (1,1,10,500.00),(2,2,5,500.00);
INSERT INTO `tb_producao_produto` VALUES (1,1,2,5000),(2,1,2,100),(3,1,1,80);
INSERT INTO `tb_gasto_insumos` VALUES (1,2,5000,0.80,'2026-01-25',4000.00),(2,1,4000,1.00,'2026-01-25',4000.00);

