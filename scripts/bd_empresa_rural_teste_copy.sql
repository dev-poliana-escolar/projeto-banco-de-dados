-- MySQL dump 10.13  Distrib 8.0.44, for Linux (x86_64)
--
-- Host: localhost    Database: bd_empresa_rural_teste
-- ------------------------------------------------------
-- Server version	8.0.44

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tb_cliente`
--

DROP TABLE IF EXISTS `tb_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_cliente` (
  `cli_codigo` int NOT NULL AUTO_INCREMENT,
  `cli_nome` varchar(80) NOT NULL,
  PRIMARY KEY (`cli_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cliente`
--

LOCK TABLES `tb_cliente` WRITE;
/*!40000 ALTER TABLE `tb_cliente` DISABLE KEYS */;
INSERT INTO `tb_cliente` VALUES (1,'Antonio'),(2,'Pedro'),(3,'Fernanda');
/*!40000 ALTER TABLE `tb_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_gasto_insumos`
--

DROP TABLE IF EXISTS `tb_gasto_insumos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_gasto_insumos`
--

LOCK TABLES `tb_gasto_insumos` WRITE;
/*!40000 ALTER TABLE `tb_gasto_insumos` DISABLE KEYS */;
INSERT INTO `tb_gasto_insumos` VALUES (1,2,5000,0.80,'2026-01-25',4000.00),(2,1,4000,1.00,'2026-01-25',4000.00);
/*!40000 ALTER TABLE `tb_gasto_insumos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_insumo`
--

DROP TABLE IF EXISTS `tb_insumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_insumo` (
  `ins_codigo` int NOT NULL AUTO_INCREMENT,
  `ins_nome` varchar(50) NOT NULL,
  PRIMARY KEY (`ins_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_insumo`
--

LOCK TABLES `tb_insumo` WRITE;
/*!40000 ALTER TABLE `tb_insumo` DISABLE KEYS */;
INSERT INTO `tb_insumo` VALUES (1,'Lenha'),(2,'Mandioca');
/*!40000 ALTER TABLE `tb_insumo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_itens_vendidos`
--

DROP TABLE IF EXISTS `tb_itens_vendidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_itens_vendidos`
--

LOCK TABLES `tb_itens_vendidos` WRITE;
/*!40000 ALTER TABLE `tb_itens_vendidos` DISABLE KEYS */;
INSERT INTO `tb_itens_vendidos` VALUES (1,1,10,500.00),(1,3,4,200.00),(2,2,5,500.00);
/*!40000 ALTER TABLE `tb_itens_vendidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_producao`
--

DROP TABLE IF EXISTS `tb_producao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_producao` (
  `prod_codigo` int NOT NULL AUTO_INCREMENT,
  `prod_data_inicio` date NOT NULL,
  `prod_data_fim` date NOT NULL,
  PRIMARY KEY (`prod_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_producao`
--

LOCK TABLES `tb_producao` WRITE;
/*!40000 ALTER TABLE `tb_producao` DISABLE KEYS */;
INSERT INTO `tb_producao` VALUES (1,'2026-01-25','2026-01-29');
/*!40000 ALTER TABLE `tb_producao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_producao_produto`
--

DROP TABLE IF EXISTS `tb_producao_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_producao_produto`
--

LOCK TABLES `tb_producao_produto` WRITE;
/*!40000 ALTER TABLE `tb_producao_produto` DISABLE KEYS */;
INSERT INTO `tb_producao_produto` VALUES (1,1,2,5000),(2,1,2,100),(3,1,1,80);
/*!40000 ALTER TABLE `tb_producao_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_produto`
--

DROP TABLE IF EXISTS `tb_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_produto` (
  `pro_codigo` int NOT NULL AUTO_INCREMENT,
  `pro_nome` varchar(80) NOT NULL,
  `pro_uni_codigo` int NOT NULL,
  `pro_preco` decimal(10,2) NOT NULL,
  PRIMARY KEY (`pro_codigo`),
  KEY `pro_uni_codigo` (`pro_uni_codigo`),
  CONSTRAINT `fk_pro_uni_codigo` FOREIGN KEY (`pro_uni_codigo`) REFERENCES `tb_unidade_medida` (`uni_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_produto`
--

LOCK TABLES `tb_produto` WRITE;
/*!40000 ALTER TABLE `tb_produto` DISABLE KEYS */;
INSERT INTO `tb_produto` VALUES (1,'Farinha',2,50.00),(2,'Goma',1,100.00);
/*!40000 ALTER TABLE `tb_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_unidade_medida`
--

DROP TABLE IF EXISTS `tb_unidade_medida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_unidade_medida` (
  `uni_codigo` int NOT NULL AUTO_INCREMENT,
  `uni_unidade` varchar(40) NOT NULL,
  PRIMARY KEY (`uni_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_unidade_medida`
--

LOCK TABLES `tb_unidade_medida` WRITE;
/*!40000 ALTER TABLE `tb_unidade_medida` DISABLE KEYS */;
INSERT INTO `tb_unidade_medida` VALUES (1,'KG'),(2,'UNI');
/*!40000 ALTER TABLE `tb_unidade_medida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_venda`
--

DROP TABLE IF EXISTS `tb_venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_venda` (
  `ven_codigo` int NOT NULL AUTO_INCREMENT,
  `ven_data` date NOT NULL,
  `ven_cli_codigo` int NOT NULL,
  PRIMARY KEY (`ven_codigo`),
  KEY `ven_cli_codigo` (`ven_cli_codigo`),
  CONSTRAINT `fk_ven_cli_codigo` FOREIGN KEY (`ven_cli_codigo`) REFERENCES `tb_cliente` (`cli_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_venda`
--

LOCK TABLES `tb_venda` WRITE;
/*!40000 ALTER TABLE `tb_venda` DISABLE KEYS */;
INSERT INTO `tb_venda` VALUES (1,'2026-01-25',1),(2,'2026-01-26',3),(3,'2026-01-26',3);
/*!40000 ALTER TABLE `tb_venda` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-31 15:28:29
