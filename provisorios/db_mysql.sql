-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: bd_projeto4_desenvolve40mais
-- ------------------------------------------------------
-- Server version	8.0.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `aluno`
--

DROP TABLE IF EXISTS `aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aluno` (
  `cpf_aluno` bigint NOT NULL,
  `nome` varchar(40) DEFAULT NULL,
  `endereco` varchar(50) DEFAULT NULL,
  `telefone` char(11) DEFAULT NULL,
  `data_nasc` date DEFAULT NULL,
  PRIMARY KEY (`cpf_aluno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno`
--

LOCK TABLES `aluno` WRITE;
/*!40000 ALTER TABLE `aluno` DISABLE KEYS */;
INSERT INTO `aluno` VALUES (11111111111,'Pedro Ancântara Coelho','Rua das Flores, 1549 bairro Santos Timon-Ma','86985461254','2001-06-27'),(12312312312,'Marta Gonçalves','Rua Anita Cajado, 232 Praia Grande Salvados-BA','99920006578','2001-06-06'),(15915915915,'Fernanda Nobre','Avenida Pedro II, 946 Conjunto B Brasilia-DF','65224567799','1959-05-21'),(32132132132,'José dos Santos e Silva','Rua Anita Garibald, 249 Santo Antônio Manaus-AM','61335078848','1975-03-08'),(35735735735,'Amanda Gonçalves','Avenida Miguel Rosa, 5674 Centro Teresina-PI','33685214578','2000-06-19'),(45645645645,'Manoel Freitas Neto','Rua Anita Ferraz, 208 Sé São Paulo-SP','1433017515','2002-08-02'),(58758758758,'Severino da Silva Moreira','Rua Sem Fim,  1945 Areas Caxias-MA','65986865454','2002-10-19'),(65465465465,'Hugo Pereira do Vale','Rua Condado, 114 Cavalhada Porto Alegre-RS','8840012535','1998-01-15'),(75375375375,'Rosilene do Carmo e Sousa','Avenida Presidente Figueiredo, 6721 Tabosa Codó-MA','48965471235','1999-10-16'),(78978978978,'Cleide Josefina da Silva','Rua Anfibólios, 560 Bonfim Belo Horizonte-MG','11965783265','1995-09-22'),(95195195195,'Claudia Araujo Péricles','Conjunto Calhau Quadra 15 Casa 22 Fortaleza-CE','31955552222','2003-12-18'),(98798798798,'Maria da Cruz dos Santos','Praça Anita Garibaldi, 536 Centro Campinas-SP','77925453578','2003-02-12');
/*!40000 ALTER TABLE `aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compoe`
--

DROP TABLE IF EXISTS `compoe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compoe` (
  `codigo_curso` int DEFAULT NULL,
  `codigo_disciplina` int DEFAULT NULL,
  KEY `codigo_curso` (`codigo_curso`),
  KEY `codigo_disciplina` (`codigo_disciplina`),
  CONSTRAINT `compoe_ibfk_1` FOREIGN KEY (`codigo_curso`) REFERENCES `curso` (`codigo_curso`),
  CONSTRAINT `compoe_ibfk_2` FOREIGN KEY (`codigo_disciplina`) REFERENCES `disciplina` (`codigo_disciplina`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compoe`
--

LOCK TABLES `compoe` WRITE;
/*!40000 ALTER TABLE `compoe` DISABLE KEYS */;
INSERT INTO `compoe` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(4,9),(4,10),(4,11),(4,12),(4,13),(4,14),(4,15),(4,16),(5,17),(5,18),(5,19),(5,20),(5,21),(5,22),(5,23),(5,24),(8,25),(8,26),(8,27),(8,28),(8,29),(8,30),(8,31),(8,32);
/*!40000 ALTER TABLE `compoe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cursa`
--

DROP TABLE IF EXISTS `cursa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cursa` (
  `cpf_aluno` bigint DEFAULT NULL,
  `codigo_disciplina` int DEFAULT NULL,
  KEY `cpf_aluno` (`cpf_aluno`),
  KEY `codigo_disciplina` (`codigo_disciplina`),
  CONSTRAINT `cursa_ibfk_1` FOREIGN KEY (`cpf_aluno`) REFERENCES `aluno` (`cpf_aluno`),
  CONSTRAINT `cursa_ibfk_2` FOREIGN KEY (`codigo_disciplina`) REFERENCES `disciplina` (`codigo_disciplina`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursa`
--

LOCK TABLES `cursa` WRITE;
/*!40000 ALTER TABLE `cursa` DISABLE KEYS */;
INSERT INTO `cursa` VALUES (58758758758,1),(58758758758,2),(58758758758,3),(75375375375,1),(75375375375,2),(75375375375,3),(35735735735,1),(35735735735,2),(35735735735,3),(95195195195,9),(95195195195,10),(95195195195,11),(15915915915,9),(15915915915,10),(15915915915,11),(32132132132,9),(32132132132,10),(32132132132,11),(12312312312,9),(12312312312,10),(12312312312,11),(95195195195,17),(95195195195,18),(95195195195,19),(15915915915,17),(15915915915,18),(15915915915,19),(32132132132,17),(32132132132,18),(32132132132,19),(12312312312,17),(12312312312,18),(12312312312,19),(98798798798,25),(98798798798,26),(98798798798,27),(65465465465,25),(65465465465,26),(65465465465,27),(45645645645,25),(45645645645,26),(45645645645,27),(11111111111,25),(11111111111,26),(11111111111,27),(78978978978,25),(78978978978,26),(78978978978,27);
/*!40000 ALTER TABLE `cursa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curso` (
  `codigo_curso` int NOT NULL AUTO_INCREMENT,
  `nome_curso` char(30) DEFAULT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  `codigo_dpto` int DEFAULT NULL,
  PRIMARY KEY (`codigo_curso`),
  KEY `codigo_dpto` (`codigo_dpto`),
  CONSTRAINT `curso_ibfk_1` FOREIGN KEY (`codigo_dpto`) REFERENCES `departamento` (`codigo_dpto`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso`
--

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
INSERT INTO `curso` VALUES (1,'CIÊNCIAS POLÍTICA','Cria competências técnico-científica sobre o conhecimento das relações políticas.',1),(2,'DIREITO','Aprende tudo sobre leis e normas nacionais e internacionais torna-se apto a aplica-las na sociedade.',1),(3,'ADMINISTRAÇÃO','Gere os recursos de uma organização e atua em diferentes departamentos.',1),(4,'MEDICINA','Diagnostica doenças, receita medicamentos, realiza cirurgias e conduz tratamentos diversos.',5),(5,'ENFERMAGEM','Administram medicamentos , a alimentação e higiene de pessoas em processo de recuperação.',5),(6,'PEDAGOGIA','Profissional especialista em educação, que pode atuar dentro e fora do ambiente escolar.',4),(7,'MUSICA','Atua na produção, regencia, composição em eventos, orquestras, corais, estúdios, etc.',4),(8,'ENGENHARIA CIVIL','Elabora, conduz e realiza obras e projetos como casas, pontes, estradas e grandes edificações.',6),(9,'ZOOTECNIA','Trabalha para que animais vivam em boas condições, cuida da reprodução e melhoramento genético.',3),(10,'MEDICINA VETERINÁRIA','Responsável pela saúde animais domésticos e silvestres.',3);
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamento` (
  `codigo_dpto` int NOT NULL AUTO_INCREMENT,
  `nome` char(5) DEFAULT NULL,
  `descricao` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`codigo_dpto`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES (1,'CCHL','CENTRO DE CIÊNCIAS HUMANAS E LETRAS'),(2,'CCN','CENTRO DE CIÊNCIAS DA NATUREZA'),(3,'CCA','CENTRO DE CIÊNCIAS AGRÁRIAS'),(4,'CCE','CENTRO DE CIÊNCIAS DA EDUCAÇÃO'),(5,'CCS','CENTRO DE CIÊNCIAS DA SAÚDE'),(6,'CT','CENTRO DE TECNOLOGIA');
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disciplina`
--

DROP TABLE IF EXISTS `disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disciplina` (
  `codigo_disciplina` int NOT NULL AUTO_INCREMENT,
  `nome_disciplina` varchar(45) DEFAULT NULL,
  `qtd_creditos` int DEFAULT NULL,
  `matricula_prof` int DEFAULT NULL,
  PRIMARY KEY (`codigo_disciplina`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disciplina`
--

LOCK TABLES `disciplina` WRITE;
/*!40000 ALTER TABLE `disciplina` DISABLE KEYS */;
INSERT INTO `disciplina` VALUES (1,'Pensamento Social e Político Brasileiro',1,1),(2,'Sociologia',1,2),(3,'Introdução à Ciência Política',1,3),(4,'Estudo em Segurança Internacional',1,4),(5,'Antropologia',1,5),(6,'Estatística',1,6),(7,'Relações Internacionais',1,7),(8,'Direito',1,8),(9,'Anatomia Humana ',42,9),(10,'Imagenologia',12,10),(11,'Práticas Integradoras',12,11),(12,'Introdução à Saúde Coletiva',27,12),(13,'Fisiologia Humana I',12,13),(14,'Bioquímica',18,14),(15,'Biofísica',12,15),(16,'Histologia /Embriologia',42,16),(17,'Anatomia Humana',16,9),(18,'Biologia Celular, Histologia e Embriologia',10,10),(19,'Bioquímica',6,11),(20,'História da Enfermagem',6,12),(21,'Lingua Portuguesa',6,13),(22,'Meio Ambiente e Saúde',6,14),(23,'Microbiologia e Imunologia',10,15),(24,'Parasitologia',6,16),(25,'Lingua Portuguesa',6,1),(26,'Bases Matematicas para Engenharia',6,1),(27,'Bases Físicas para Engenharia',16,5),(28,'Introdução à Engenharia',10,3),(29,'Ciências do Ambiente',6,9),(30,'Planejamento de Carreira, Sucesso',6,10),(31,'Probabilidade e Estatística para Engenharia',16,11),(32,'Lógica de Programação',10,7);
/*!40000 ALTER TABLE `disciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matricula`
--

DROP TABLE IF EXISTS `matricula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matricula` (
  `codigo_curso` int DEFAULT NULL,
  `cpf_aluno` bigint DEFAULT NULL,
  `data_matricula` date DEFAULT NULL,
  KEY `codigo_curso` (`codigo_curso`),
  KEY `cpf_aluno` (`cpf_aluno`),
  CONSTRAINT `matricula_ibfk_1` FOREIGN KEY (`codigo_curso`) REFERENCES `curso` (`codigo_curso`),
  CONSTRAINT `matricula_ibfk_2` FOREIGN KEY (`cpf_aluno`) REFERENCES `aluno` (`cpf_aluno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matricula`
--

LOCK TABLES `matricula` WRITE;
/*!40000 ALTER TABLE `matricula` DISABLE KEYS */;
INSERT INTO `matricula` VALUES (1,58758758758,'2022-01-23'),(1,75375375375,'2021-01-27'),(1,35735735735,'2020-06-12'),(4,95195195195,'2022-01-15'),(4,15915915915,'2022-06-30'),(4,32132132132,'2019-01-05'),(4,12312312312,'2021-06-09'),(8,98798798798,'2020-01-16'),(8,65465465465,'2019-01-17'),(8,45645645645,'2022-01-11'),(8,11111111111,'2019-01-17'),(8,78978978978,'2022-01-11'),(5,95195195195,'2022-01-15'),(5,15915915915,'2022-06-30'),(5,32132132132,'2019-01-05'),(5,12312312312,'2021-06-09');
/*!40000 ALTER TABLE `matricula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pre_req`
--

DROP TABLE IF EXISTS `pre_req`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pre_req` (
  `codigo_disciplina` int DEFAULT NULL,
  `codigo_disciplina_dependencia` int DEFAULT NULL,
  KEY `codigo_disciplina` (`codigo_disciplina`),
  KEY `codigo_disciplina_dependencia` (`codigo_disciplina_dependencia`),
  CONSTRAINT `pre_req_ibfk_1` FOREIGN KEY (`codigo_disciplina`) REFERENCES `disciplina` (`codigo_disciplina`),
  CONSTRAINT `pre_req_ibfk_2` FOREIGN KEY (`codigo_disciplina_dependencia`) REFERENCES `disciplina` (`codigo_disciplina`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pre_req`
--

LOCK TABLES `pre_req` WRITE;
/*!40000 ALTER TABLE `pre_req` DISABLE KEYS */;
INSERT INTO `pre_req` VALUES (1,3),(2,3),(3,3),(4,1),(5,3),(6,3),(7,4),(8,1),(9,12),(10,12),(11,11),(12,12),(13,9),(14,12),(15,12),(16,12),(17,20),(18,21),(19,20),(20,20),(21,21),(22,20),(23,21),(24,21),(25,25),(26,28),(27,28),(28,28),(29,25),(30,28),(31,28),(32,25);
/*!40000 ALTER TABLE `pre_req` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor`
--

DROP TABLE IF EXISTS `professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professor` (
  `matricula_prof` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `endereco` varchar(45) DEFAULT NULL,
  `telefone` char(11) DEFAULT NULL,
  `data_nasc` date DEFAULT NULL,
  `codigo_dpto` int DEFAULT NULL,
  `data_contratacao` date DEFAULT NULL,
  PRIMARY KEY (`matricula_prof`),
  KEY `codigo_dpto` (`codigo_dpto`),
  CONSTRAINT `professor_ibfk_1` FOREIGN KEY (`codigo_dpto`) REFERENCES `departamento` (`codigo_dpto`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor`
--

LOCK TABLES `professor` WRITE;
/*!40000 ALTER TABLE `professor` DISABLE KEYS */;
INSERT INTO `professor` VALUES (1,'Agnes Figueiredo','Conjunto Sacy Q-15 C-10 Sacy Teresina-PI','86945458787','1975-01-11',1,'2011-05-22'),(2,'Nicolas Lucas Ricardo Gonçalves','QD QNP 30 Conjunto 442 Sul Brasília-DF','86912345678','2001-02-01',1,'2014-07-22'),(3,'Pietro Thomas Campos','Av. Brasilia, 391 Fazendinha MAcapa-AP','86932146547','2005-05-16',1,'2014-12-22'),(4,'Raimundo Thales Bruno da Luz','Rua São Benedito, 825 São Benedito Cuiabá-MT','88925873698','1995-09-24',1,'2018-11-22'),(5,'Victor Theo Dias','Rua Marte, 270 Parnamirim Teresina-PI','88654132585','1994-11-15',1,'2016-09-22'),(6,'Liz Alessandra Araújo','Rua Plutão Santos Teresina-PI','88912366547','1975-10-18',1,'2015-01-22'),(7,'Eliane Stefany Laís Rezende','Rua das Camélias, 3456 Garagem Teresina-PI','86947891596','1972-09-04',1,'2005-06-22'),(8,'Carolina Aparecida Figueiredo','Rua 100 Parque Alvorada Timon-MA','85915963574','1988-04-16',1,'2021-08-22'),(9,'Lucca Antonio Elias Almada','Rua 200 Parque Alvorada Timon-MA','85945647897','1983-02-19',5,'2020-03-22'),(10,'Juliana Marina Agatha Santos','Quadra 34 Casa 12 Sacy Teresina-PI','86975417541','1959-12-26',5,'2019-04-22'),(11,'Paulo Manoel Ramos','Rua Posto, 6521 Felipe Teresina-PI','86915423256','1977-11-30',5,'2019-10-22'),(12,'Tatiane Analu Elisa Castro','Rua Horizonte, 478 Mocambinho Teresina-PI','86920212122','1965-08-07',5,'2019-11-22'),(13,'Vitor Lucas da Conceição','Rua Campos, 6547 Fatima Teresina-PI','98920202020','1999-07-08',5,'2016-12-22'),(14,'Vera Sophia Viana','Rua dos Idosos, 4565 Areas Teresina-PI','99920001111','2002-09-29',5,'2018-02-22'),(15,'Natália Elaine Nunes','Rua Descente, 65 Centro Teresina-PI','99920002222','1989-03-11',5,'2019-11-22'),(16,'Luiza Isadora Sara Teixeira','Rua 87, 987 Centro Timon-MA','99930002545','1991-04-13',5,'2017-07-22');
/*!40000 ALTER TABLE `professor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'bd_projeto4_desenvolve40mais'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-22  9:26:58
