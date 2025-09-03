CREATE DATABASE  IF NOT EXISTS `camp_data` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `camp_data`;
-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: camp_data
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Temporary view structure for view `averge_report_time`
--

DROP TABLE IF EXISTS `averge_report_time`;
/*!50001 DROP VIEW IF EXISTS `averge_report_time`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `averge_report_time` AS SELECT 
 1 AS `Average Time Taken to Report Transaction In Days`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `entity_summaries`
--

DROP TABLE IF EXISTS `entity_summaries`;
/*!50001 DROP VIEW IF EXISTS `entity_summaries`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `entity_summaries` AS SELECT 
 1 AS `Payee Type`,
 1 AS `Average Spent`,
 1 AS `Total Spent`,
 1 AS `Highest Spent`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `ex_description`
--

DROP TABLE IF EXISTS `ex_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ex_description` (
  `description_id` int NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`description_id`),
  UNIQUE KEY `description_UNIQUE` (`description`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ex_description`
--

LOCK TABLES `ex_description` WRITE;
/*!40000 ALTER TABLE `ex_description` DISABLE KEYS */;
INSERT INTO `ex_description` VALUES (0,'ACCOUNT | Quickbooks subscription fees'),(1,'Accounting/Banking'),(2,'Accounting/Banking | accounting/banking monthly service fee'),(3,'Accounting/Banking | Merchant Fees'),(4,'ADVERTISE'),(5,'ADVERTISE | Digital advertising'),(6,'ADVERTISE | Signs'),(7,'ADVERTISE | Video production'),(8,'ADVERTISE | Yard Signs/Printing'),(9,'Advertising Expense | ad'),(10,'Advertising Expense | Advertising Expense'),(11,'Advertising Expense | Digital advertising'),(12,'Advertising Expense | Facebook ad'),(13,'Advertising Expense | Google Suite'),(14,'Advertising Expense | Monthly Website Expense, Paid with Personal Funds, Reimbursed 10/01/18'),(15,'Advertising Expense | Website Development'),(16,'Bank Fee'),(17,'Campaign Contribution'),(18,'CONSULT | Consulting Services'),(19,'CONSULT | Fundraising & compliance consulting'),(20,'CONSULT | Petitioning'),(21,'CONSULT | Signature Collection'),(22,'Consulting Expense | Contract labor'),(23,'Consulting Expense | Robo Calls'),(24,'Consulting Expense | Video production and editing'),(25,'DONATIONS | Campaing Contribution'),(26,'Event Expense | Event Expense'),(27,'Event Expense | Space rental for PAC membership event'),(28,'Fees | Bank Fees'),(29,'Fees | Campaign donor website donation processing/handling fee'),(30,'Fees | Campaign Manager Salary'),(31,'Fees | Checks'),(32,'Fees | Credit Card Processing fees'),(33,'FEES | Fees'),(34,'Fees | Monthly Service Charge'),(35,'FEES | Payroll fee'),(36,'Fees | Transaction Fee'),(37,'FEES | Website service fee'),(38,'Food/Beverage Expense | Food'),(39,'Food/Beverage Expense | for petitioners'),(40,'Gift/Awards/Memorials Expense | 20161107'),(41,'Loan Repayment/Reimbursement | Repayment'),(42,'Office Overhead/Rental Expense | BANK FEE'),(43,'Office Overhead/Rental Expense | Campaign Email'),(44,'Office Overhead/Rental Expense | Data storage'),(45,'Office Overhead/Rental Expense | Database software'),(46,'Office Overhead/Rental Expense | Google Drive'),(47,'Office Overhead/Rental Expense | postage'),(48,'Office Overhead/Rental Expense | QuickBooks Subscription'),(49,'OTHER | Mail Production, Postage and Shipping/Taxes | Mail Production, Postage and Shipping/Taxes'),(50,'OVERHEAD | Database software'),(51,'OVERHEAD | Office Supplies'),(52,'OVERHEAD | ride share'),(53,'Polling Expense | District 8 polling for PAC'),(54,'Polling Expense | Polling Expense'),(57,'Printing Expense'),(58,'Printing Expense | Banners'),(59,'Printing Expense | Mail'),(60,'Printing Expense | Printing'),(61,'Printing Expense | road sign additions'),(55,'PRINTING | Printing, Mail, Postage'),(56,'PRINTING | stickers'),(62,'SALARIES | Campaign Manager salary'),(63,'SALARIES | Canvassing'),(64,'SALARIES | Contract services'),(65,'SALARIES | Field'),(66,'SALARIES | Net Pay'),(67,'SALARIES | Payroll'),(68,'SALARIES | Payroll fee'),(69,'SALARIES | Payroll taxes'),(70,'Salaries/Wages/Contract Labor'),(71,'Salaries/Wages/Contract Labor | Consulting Work'),(72,'Salaries/Wages/Contract Labor | contract labor'),(73,'Salaries/Wages/Contract Labor | Contract work'),(74,'Salaries/Wages/Contract Labor | Field Organizer'),(75,'Salaries/Wages/Contract Labor | Petition Manager'),(76,'Salaries/Wages/Contract Labor | Petitioning'),(77,'Salaries/Wages/Contract Labor | Web mgmt'),(78,'Solicitation/Fundraising Expense | Canvassing'),(79,'Transportation Equipment & Related Expense | Parking');
/*!40000 ALTER TABLE `ex_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ex_type`
--

DROP TABLE IF EXISTS `ex_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ex_type` (
  `ex_type_id` int NOT NULL,
  `ex_type` varchar(65) NOT NULL,
  PRIMARY KEY (`ex_type_id`),
  UNIQUE KEY `ex_type_UNIQUE` (`ex_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ex_type`
--

LOCK TABLES `ex_type` WRITE;
/*!40000 ALTER TABLE `ex_type` DISABLE KEYS */;
INSERT INTO `ex_type` VALUES (0,'Expenditure Made by Credit Card'),(1,'Non-political Expenditure Made From Political Contributions'),(2,'Political Expenditure from Political Contributions'),(3,'Political Expenditure Made from Personal Funds'),(4,'Unpaid Incurred Obligation');
/*!40000 ALTER TABLE `ex_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expenditures`
--

DROP TABLE IF EXISTS `expenditures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expenditures` (
  `description_id` int NOT NULL,
  `ex_type_id` int NOT NULL,
  PRIMARY KEY (`description_id`,`ex_type_id`),
  KEY `fk_expenditures_ex_type1_idx` (`ex_type_id`),
  CONSTRAINT `fk_expenditures_ex_description1` FOREIGN KEY (`description_id`) REFERENCES `ex_description` (`description_id`),
  CONSTRAINT `fk_expenditures_ex_type1` FOREIGN KEY (`ex_type_id`) REFERENCES `ex_type` (`ex_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expenditures`
--

LOCK TABLES `expenditures` WRITE;
/*!40000 ALTER TABLE `expenditures` DISABLE KEYS */;
INSERT INTO `expenditures` VALUES (44,0),(2,1),(31,1),(1,2),(3,2),(4,2),(5,2),(6,2),(8,2),(9,2),(10,2),(11,2),(12,2),(13,2),(15,2),(16,2),(17,2),(18,2),(19,2),(20,2),(21,2),(22,2),(23,2),(24,2),(25,2),(26,2),(27,2),(28,2),(29,2),(30,2),(32,2),(33,2),(34,2),(35,2),(36,2),(37,2),(38,2),(39,2),(40,2),(41,2),(42,2),(43,2),(45,2),(46,2),(47,2),(49,2),(50,2),(51,2),(52,2),(53,2),(54,2),(55,2),(56,2),(57,2),(58,2),(59,2),(60,2),(61,2),(62,2),(63,2),(64,2),(65,2),(66,2),(67,2),(68,2),(69,2),(70,2),(71,2),(72,2),(73,2),(74,2),(75,2),(76,2),(77,2),(78,2),(79,2),(14,3),(0,4),(7,4),(48,4);
/*!40000 ALTER TABLE `expenditures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `non_political_transactions`
--

DROP TABLE IF EXISTS `non_political_transactions`;
/*!50001 DROP VIEW IF EXISTS `non_political_transactions`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `non_political_transactions` AS SELECT 
 1 AS `Payer Name`,
 1 AS `Amount Paid`,
 1 AS `Payee`,
 1 AS `Expense Type`,
 1 AS `Description`,
 1 AS `Date Paid`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `number_of_transactions_made`
--

DROP TABLE IF EXISTS `number_of_transactions_made`;
/*!50001 DROP VIEW IF EXISTS `number_of_transactions_made`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `number_of_transactions_made` AS SELECT 
 1 AS `Payer`,
 1 AS `Number Of Transactions`,
 1 AS `Max Paid`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `office_holder_transactions`
--

DROP TABLE IF EXISTS `office_holder_transactions`;
/*!50001 DROP VIEW IF EXISTS `office_holder_transactions`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `office_holder_transactions` AS SELECT 
 1 AS `Payer`,
 1 AS `Payee`,
 1 AS `Amount Paid`,
 1 AS `description`,
 1 AS `Political Obligation`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `payee`
--

DROP TABLE IF EXISTS `payee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payee` (
  `payee_id` int NOT NULL,
  `payee_name` varchar(60) NOT NULL,
  `payee_address` varchar(60) DEFAULT NULL,
  `city` varchar(45) NOT NULL,
  `state` varchar(45) NOT NULL,
  `zip` varchar(45) NOT NULL,
  `type_id` int unsigned NOT NULL,
  PRIMARY KEY (`payee_id`),
  KEY `fk_payee_payee_type1_idx` (`type_id`),
  CONSTRAINT `fk_payee_payee_type1` FOREIGN KEY (`type_id`) REFERENCES `payee_type` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payee`
--

LOCK TABLES `payee` WRITE;
/*!40000 ALTER TABLE `payee` DISABLE KEYS */;
INSERT INTO `payee` VALUES (0,'ADP','6500 River Pl Blvd Building 7,  Suite. 150','Austin',' TX','78730',0),(1,'American Printing & Mailing','1606 Headway Circle','Austin',' TX','78754',0),(2,'Anedot','4017 Buena Vista St., #109','Dallas',' TX','75204',0),(3,'Anedot','PO Box 84314','Baton Rouge',' LA','70884',0),(4,'Apple Itunes','One Infinite Loop','Cupertino',' CA','95014',0),(5,'Arellano Edna','2900 Cole St, #308','Austin',' TX','78705',1),(6,'Avery Ranch Golf Club','10500 Avery Club Dr.','Cedar Park',' TX','78717',0),(7,'Bar Chi','206 Colorado St','Austin',' TX','78701',0),(8,'Barshop Noah','15715 Thrush Gate Lane','San Antonio',' TX','78248',1),(9,'Beadit','2058 S. Lamar Blvd.','Austin',' TX','78704',0),(10,'BumperActive','5907 Burnet Rd','Austin',' TX','78757',0),(11,'Burdick  Lucas','7002 Bennett Ave, Apt #B','Austin',' TX','78752',1),(12,'Butts David','1914 Patton Ln','Austin',' TX','78723',1),(13,'Canyon View Event Center','4800 Spicewood Springs','Austin',' TX','78759',0),(14,'Central Market','4001 N Lamar Blvd','Austin',' TX','78756',0),(15,'CFO Shield LLC dba Red Elephant Reports','PO Box 953','Colleyville',' TX','76034',0),(16,'Chase Bank','2414 Guadalupe','Austin',' TX','78705',0),(17,'CheckMark Typesetting','3217 N Interstate 35 Frontage Rd','Austin',' TX','78722',0),(18,'City of Austin','301 W. 2nd St','Austin',' TX','78701',0),(19,'Collective Campaigns','3607 Greystone, #2024','Austin',' TX','78731',0),(20,'Collective Campaigns','9901 Brodie Lane Ste 160 #1143','Austin',' TX','78748',0),(21,'Contreras Victoria','1975 Aquarena Springs Dr. #334C','San Marcos',' TX','78666',1),(22,'Creative Civilization','1412 W 6th St','Austin',' TX','78703',0),(23,'Datafinder.ciom','7530 164th Ave. NE, Suite A204','Redmond',' WA','98052',0),(24,'DonateWay','P.O. Box 301267','Austin',' TX','78703',0),(25,'Egolinsky Raime','2903 E 12th Street','Austin',' TX','78702',1),(26,'Elleh Mojana','7330 Bluff Springs Dr. #4301','Austin',' TX','78744',1),(27,'Facebook','1 Facebook Way','Menlo Park',' CA','94025',0),(28,'Facebook','1 Hacker Way','Menlo Park',' CA','94025',0),(29,'Farasat Romteen','1401 Meadgreen Cir.','Austin',' TX','78758',1),(30,'Fast Signs','8820 Burnet Road, Suite 504','Austin',' TX','78750',0),(31,'FedEx Office Print & Ship Centers','327 Congress Ave','Austin',' TX','78701',0),(32,'Frost','401 Congress Ave Austin','Austin',' TX','78701',0),(33,'Frost Bank','P.O. Box 1600','San Antonio',' TX','78296',0),(34,'Gomez Cristina','PO Box 300146','Austin',' TX','78703',1),(35,'Gonzalez Sabrina','520 Woodward St., Apt. #1315','Austin',' TX','78704',0),(36,'Google','1600 Amphitheatre Pkwy','Mountain View',' CA','94043',0),(37,'Gryphon Group','30 N. Gould St., Ste. R','Sheridan',' WY','82801',0),(38,'Gusto','525 20th Street','San Francisco',' CA','94107',0),(39,'Haensgen Carissa','2207 Nueces St, Unit 603','Austin',' TX','78705',1),(40,'Harland Clarke','15955 La Cantera Parkway','San Antonio',' TX','78256',0),(41,'Haubolt Christopher','529 Old Goliad Road','Victoria',' TX','77905',1),(42,'Heinrich Allison','2301 Ohlen Rd. #107','Austin',' TX','78766',1),(43,'Holts Jovon','1401 AW Grimes Boulevard, Apt #637','Round Rock',' TX','78664',1),(44,'Jake Webber','1201 Columbia #A','San Marcos',' TX','78666',0),(45,'Kelly Graphics','1409 Quaker Ridge','Austin',' TX','78746',0),(46,'Krakauer Ganz Zachary','1706 W 32nd St','Austin',' TX','78703',1),(47,'Langmore Grant','1408 Preston Ave','Austin',' TX','78703',1),(48,'Lars Max','2223 Waterloo City Ln, Apt 342','Austin',' TX','78741',1),(49,'Last Lomas','730 W Stassney Lane, Suite 130','Austin',' TX','78745',0),(50,'Littlefield consulting','PO Box 90591','Austin',' TX','78709',0),(51,'Marshall\'s','1201 Barbara Jordan Blvd.','Austin',' TX','78723',0),(52,'McKinney James','6917 Langston Dr.','Austin',' TX','78723',1),(53,'Nationbuilder','520 S. Grand Ave., 2nd Floor, #200','Los Angeles',' GA','90071',0),(54,'NGP Van','655 15th St NW, Ste 650','Washington',' DC','20005',0),(55,'Office Depot','2620 W. Anderson LN','Austin',' TX','78757',0),(56,'Office Max Inc.','4615 North Lamar','Austin',' TX','78710',0),(57,'Owens Alejandro','1400 Green Downs Dr.','Round Rock',' TX','78664',1),(58,'PAYA (fka Sage Payment Solutions)','12120 Sunset Hills Rd, Ste 500','Reston',' VA','20190',0),(59,'PlainsCapital Bank','2323 Victory Ave','Dallas',' TX','75219',0),(60,'Postmaster','6104 Old Fredercksburg Rd.','Austin',' TX','78749',0),(61,'Roberton Jessica','10403 Golden Meadow Dr, Unit A, Unit A','Austin',' TX','78758',1),(62,'SAGE PAYMENT SOLUTION','1750 OLD MESDOW ROAD','Mclean',' VA','22102',0),(63,'Siever Michael','9508 Meadowheath Dr.','Austin',' TX','78729',1),(64,'Solidarity Strategies LLC','P.O. Box 15260','Washington',' DC','20003',0),(65,'Squarespace','225 Varick Street, 12th Floor','New York',' NY','10014',0),(66,'SquareSpace Inc.','8 Clarkson St.','New York',' NY','10014',0),(67,'Steeg Susan','8702 El Rey Blvd','Austin',' TX','78737',1),(68,'Steve Mims Films','4606 Rosedale Ave','Austin',' TX','78756',0),(69,'Susan Harry Consulting LLC','PO Box 301074','Austin',' TX','78703',0),(70,'Tacodeli','Rosedale 4200 N. Lamar Blvd','Austin',' TX','78756',0),(71,'Tesmer Darrell','6836 Austin Center Blvd, Building 1 Suite 280','Austin',' TX','78731',1),(72,'Turner Andrew','5304 Woodrow Ave #B','Austin',' TX','78756',1),(73,'Uber','1455 Market St','San Francisco',' CA','94103',0),(74,'United State Postal Service','3507 N Lamar Blvd','Austin',' TX','78705',0),(75,'Warren Kimie','4501 E Riverside Dr, Apt 3028','Austin',' TX','78741',1),(76,'Wells Fargo','1601 West 35th Street','Austin',' TX','78703',0),(77,'Will Conley Campaign','701 Mountain Crest','Wimberley',' TX','78676',0),(78,'Wix.com','2601 Mission Street','San Francisco',' CA','94110',0),(79,'Worley Printing','3217 N Interstate 35','Austin',' TX','78722',0),(80,'Y Strategy','3110 Manor Rd, Ste H','Austin',' TX','78723',0);
/*!40000 ALTER TABLE `payee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payee_type`
--

DROP TABLE IF EXISTS `payee_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payee_type` (
  `type_id` int unsigned NOT NULL,
  `payee_type` varchar(45) NOT NULL,
  PRIMARY KEY (`type_id`),
  UNIQUE KEY `payee_type_UNIQUE` (`payee_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payee_type`
--

LOCK TABLES `payee_type` WRITE;
/*!40000 ALTER TABLE `payee_type` DISABLE KEYS */;
INSERT INTO `payee_type` VALUES (0,'ENTITIY'),(1,'INDIVIDUAL');
/*!40000 ALTER TABLE `payee_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payer`
--

DROP TABLE IF EXISTS `payer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payer` (
  `payer_id` int NOT NULL,
  `payer_name` varchar(80) NOT NULL,
  PRIMARY KEY (`payer_id`),
  UNIQUE KEY `payer_name_UNIQUE` (`payer_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payer`
--

LOCK TABLES `payer` WRITE;
/*!40000 ALTER TABLE `payer` DISABLE KEYS */;
INSERT INTO `payer` VALUES (0,'Adler Stephen'),(1,'Austin Apartment Association PAC'),(2,'Austin Board of Realtors PAC'),(3,'Austin Forward'),(4,'Austin United PAC'),(5,'Austinites for Progressive Reform'),(6,'Bazan Stephanie'),(7,'Casar Gregorio E. \"Greg\"\"\"'),(8,'Chincanchan David'),(9,'DePalma Richard \"Rich\"\"\"'),(10,'Ellis Paige'),(11,'Equity Action'),(12,'Fair Play Austin PAC'),(13,'Faulkner Wesley E.'),(14,'Flannigan James T. \"Jimmy\"\"\"'),(15,'Gallo Sheri P.'),(16,'Garza Delia'),(17,'Gauldin Natalie B.'),(18,'Had Enough Austin?'),(19,'Harper-Madison Natasha N.'),(20,'Home Builders Association of Greater Austin HOME-PAC Personal'),(21,'Honest Transportation Solutions'),(22,'Houston Ora'),(23,'Indy Austin'),(24,'Israel Celia M.'),(25,'Keep Austin Affordable'),(26,'Let Us Vote Austin'),(27,'Morrison Laura'),(28,'Our City Our Safety Our Choice PAC'),(29,'Our Rail'),(30,'People\'s PAC'),(31,'Qadri Zohaib'),(32,'Renteria Sabino \"Pio\"\"\"'),(33,'Silva Daniela M.'),(34,'Skidmore Danielle M.'),(35,'Spearman Joah'),(36,'Texas Vote Environment PAC'),(37,'Tovo Kathryne Beth'),(38,'Troxclair Ellen'),(39,'Velasquez Jose'),(40,'Virden Jennifer M'),(41,'Ward III Frank P.'),(42,'Watson Kirk P.'),(43,'Zimmerman Donald S. \"Don\"\"\"');
/*!40000 ALTER TABLE `payer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_info`
--

DROP TABLE IF EXISTS `report_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report_info` (
  `report_id` int NOT NULL,
  `report_filed` varchar(80) NOT NULL,
  PRIMARY KEY (`report_id`),
  UNIQUE KEY `report_filed_UNIQUE` (`report_filed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_info`
--

LOCK TABLES `report_info` WRITE;
/*!40000 ALTER TABLE `report_info` DISABLE KEYS */;
INSERT INTO `report_info` VALUES (0,': Monthly Filing General-Purpose Committee Campaign Finance Report'),(1,'COH: Candidate /Officeholder Campaign Finance Report'),(2,'CORCOH: Correction Affidavit For Candidate/Officeholder'),(3,'GPAC: General-Purpose Committee Campaign Finance Report'),(4,'SPAC: Specific-Purpose Committee Campaign Finance Report');
/*!40000 ALTER TABLE `report_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `transaction_id` varchar(80) NOT NULL,
  `payment_amount` decimal(8,2) unsigned NOT NULL,
  `payment_date` date NOT NULL,
  `pol_obligation` varchar(45) NOT NULL,
  `date_reported` date NOT NULL,
  `payer_id` int NOT NULL,
  `report_id` int NOT NULL,
  `description_id` int NOT NULL,
  `ex_type_id` int NOT NULL,
  `payee_id` int NOT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `fk_transactions_payee_idx` (`payee_id`),
  KEY `fk_transactions_payer1_idx` (`payer_id`),
  KEY `fk_transactions_report_info1_idx` (`report_id`),
  KEY `fk_transactions_expenditures1_idx` (`description_id`,`ex_type_id`),
  CONSTRAINT `fk_transactions_expenditures1` FOREIGN KEY (`description_id`, `ex_type_id`) REFERENCES `expenditures` (`description_id`, `ex_type_id`),
  CONSTRAINT `fk_transactions_payee` FOREIGN KEY (`payee_id`) REFERENCES `payee` (`payee_id`),
  CONSTRAINT `fk_transactions_payer1` FOREIGN KEY (`payer_id`) REFERENCES `payer` (`payer_id`),
  CONSTRAINT `fk_transactions_report_info1` FOREIGN KEY (`report_id`) REFERENCES `report_info` (`report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES ('R20160715181404-F0001',1.30,'2016-07-12','Yes','2016-07-15',13,1,29,2,24),('R20160718160828-F0013',2175.37,'2016-05-03','Yes','2016-07-18',28,4,23,2,80),('R20161011160205-F0093',22.82,'2016-09-13','Yes','2016-10-11',43,1,38,2,6),('R20161011171040-F0008',222.28,'2016-07-29','Yes','2016-10-10',29,4,54,2,23),('R20161012170454-F0042',769.66,'2016-09-07','Yes','2016-10-11',14,1,61,2,1),('R20161012171606-F0071',73.61,'2016-09-27','Yes','2016-10-11',17,1,60,2,79),('R20161013171400-F0014',5000.00,'2016-09-25','Yes','2016-10-11',3,4,4,2,22),('R20161031165756-F0019',300.00,'2016-10-14','Yes','2016-10-31',16,1,72,2,26),('R20161031165756-F0023',465.00,'2016-09-30','Yes','2016-10-31',16,1,72,2,21),('R20161102105502-F0026',412.29,'2016-10-13','Yes','2016-10-31',3,4,57,2,31),('R20161102105502-F0030',73.56,'2016-10-12','Yes','2016-10-31',3,4,1,2,40),('R20161102105502-F0148',1315.00,'2016-10-28','Yes','2016-10-31',3,4,70,2,75),('R20170117131213-F0006',375.64,'2016-07-25','Yes','2017-01-17',29,4,54,2,56),('R20170117133145-F0003',200.00,'2016-11-07','Yes','2017-01-17',21,4,40,2,9),('R20170117133514-F0028',200.00,'2016-11-15','Yes','2017-01-17',7,1,22,2,29),('R20170117133615-F0027',105.00,'2016-11-10','Yes','2017-01-17',14,1,72,2,63),('R20170117133916-F0007',47.00,'2016-11-14','Yes','2017-01-17',16,1,47,2,60),('R20170117170642-F0002',901.55,'2016-12-05','Yes','2017-01-17',2,3,27,2,13),('R20170117171045-F0010',295.00,'2016-12-14','Yes','2017-01-17',15,1,73,2,57),('R20170118162844-F0007',2000.00,'2016-08-16','Yes','2017-01-17',28,4,41,2,12),('R20170118162844-F0011',7.00,'2016-08-31','Yes','2017-01-17',28,4,34,2,33),('R20170123091735-F0008',7.00,'2016-04-22','No','2017-01-17',37,1,2,1,76),('R20170123091851-F0013',15.00,'2016-11-02','Yes','2017-01-17',3,4,16,2,32),('R20170717171123-F0017',64.24,'2017-03-03','Yes','2017-07-17',38,1,38,2,7),('R20170717171847-F0033',1.99,'2017-03-29','Yes','2017-07-17',15,1,44,0,4),('R20170717171924-F0025',259.00,'2017-03-29','Yes','2017-07-17',14,1,45,2,53),('R20170717171924-F0032',1500.00,'2017-01-13','Yes','2017-07-17',14,1,30,2,42),('R20180117165224-F0006',2.50,'2017-12-04','Yes','2018-01-12',22,1,42,2,62),('R20180117165313-F0012',12.00,'2017-09-29','Yes','2018-01-16',36,3,28,2,16),('R20180124165608-F0015',192.00,'2017-11-16','Yes','2018-01-18',23,4,75,2,11),('R20180124165608-F0052',716.05,'2017-10-27','Yes','2018-01-18',23,4,12,2,27),('R20180124165608-F0080',396.00,'2017-12-26','Yes','2018-01-18',23,4,76,2,43),('R20180124165608-F0086',33.65,'2017-11-08','Yes','2018-01-18',23,4,39,2,49),('R20180413101438-F0002',500.00,'2018-02-27','Yes','2018-04-13',1,0,25,2,67),('R20180716175357-F0044',110.73,'2018-06-15','Yes','2018-07-13',19,1,58,2,30),('R20180717170937-F0038',568.07,'2018-03-02','Yes','2018-07-16',0,1,32,2,58),('R20180717172252-F0004',5.41,'2018-05-07','Yes','2018-07-16',9,1,43,2,65),('R20180717172814-F0214',500.00,'2018-04-05','Yes','2018-07-16',23,4,77,2,41),('R20180718150912-F0052',21.32,'2018-06-02','Yes','2018-07-16',34,1,46,2,36),('R20180720080454-F0001',300.00,'2018-04-05','Yes','2018-07-16',32,1,71,2,5),('R20180814163119-F0002',99.00,'2016-07-25','Yes','2018-08-13',29,3,54,2,23),('R20181008101235-F0054',7.57,'2018-08-02','Yes','2018-10-05',19,1,26,2,51),('R20181008101235-F0076',2.10,'2018-07-23','Yes','2018-10-05',19,1,3,2,2),('R20181010164003-F0094',14.30,'2018-09-13','Yes','2018-10-09',41,1,36,2,3),('R20181010164003-F0136',28.15,'2018-09-22','Yes','2018-10-09',41,1,14,3,66),('R20181010164856-F0057',7666.87,'2018-09-13','Yes','2018-10-09',27,1,24,2,68),('R20181010165304-F0063',2.95,'2018-08-10','Yes','2018-10-09',9,1,32,2,24),('R20181030171402-F0021',500.00,'2018-10-23','Yes','2018-10-29',25,4,22,2,52),('R20181030173707-F0005',8039.43,'2018-10-18','Yes','2018-10-29',9,1,59,2,45),('R20181030173707-F0020',888.75,'2018-10-02','Yes','2018-10-29',9,1,74,2,35),('R20181030173707-F0038',12.47,'2018-10-21','Yes','2018-10-29',9,1,32,2,24),('R20181030174338-F0014',18.36,'2018-09-04','Yes','2018-10-29',27,1,38,2,14),('R20181030174338-F0069',50.00,'2018-07-10','Yes','2018-10-29',27,1,47,2,74),('R20181030174905-F0013',1.20,'2018-10-04','Yes','2018-10-29',34,1,79,2,18),('R20181031092205-F0049',75.34,'2018-08-12','Yes','2018-10-09',34,1,38,2,70),('R20181204170745-F0003',750.00,'2018-10-31','Yes','2018-12-03',10,1,11,2,28),('R20181204170832-F0011',117.26,'2018-11-01','Yes','2018-12-03',32,1,9,2,28),('R20181204170832-F0101',349.00,'2018-11-26','Yes','2018-12-03',32,1,72,2,8),('R20181221153329-F0016',500.00,'2018-09-14','Yes','2018-12-18',20,3,17,2,77),('R20190116164213-F0005',1350.00,'2018-12-03','Yes','2019-01-14',2,3,53,2,50),('R20190116165231-F0050',975.80,'2018-12-11','Yes','2019-01-15',19,1,78,2,25),('R20190116165931-F0040',30.31,'2018-12-10','Yes','2019-01-15',41,1,48,4,15),('R20190117084205-F0009',249.19,'2018-12-07','Yes','2019-01-15',26,4,9,2,28),('R20190117084244-F0007',496.83,'2018-12-31','Yes','2019-01-15',30,4,9,2,28),('R20190716155613-F0030',2500.00,'2019-04-30','Yes','2019-07-15',12,4,10,2,37),('R20191029170146-F0012',51.98,'2019-10-23','No','2019-10-28',4,4,31,1,40),('R20200116172328-F0002',17.50,'2019-08-11','Yes','2020-01-15',10,1,15,2,78),('R20200629113739-F0007',12.79,'2019-07-01','Yes','2020-06-29',34,1,13,2,36),('R20200701100711026-F00016',2705.24,'2020-09-13','Yes','2020-10-06',8,2,8,2,17),('R20200720100711289-F00069',41458.48,'2020-11-06','Yes','2021-01-15',5,4,20,2,19),('R20200801100711022-F00035',160.33,'2020-09-16','Yes','2020-10-05',40,1,51,2,55),('R20200925100711116-F00034',7111.08,'2020-10-15','Yes','2020-10-26',8,1,55,2,45),('R20201025100711282-F00035',900.00,'2020-10-26','Yes','2021-01-15',14,2,5,2,28),('R20201025100711282-F00064',136.93,'2020-11-14','Yes','2021-01-15',14,2,51,2,55),('R20210701100712779-F00002',53.30,'2021-08-06','Yes','2022-01-14',18,4,0,4,71),('R20210924100712543-F00022',1560.50,'2021-09-30','Yes','2021-10-25',11,3,65,2,72),('R20220101100713860-F00015',513.11,'2022-03-28','Yes','2022-07-15',42,1,56,2,17),('R20220101100713860-F00074',5000.00,'2022-05-16','Yes','2022-07-15',42,1,19,2,69),('R20220101100713882-F00040',7858.58,'2022-06-05','Yes','2022-07-15',11,3,21,2,20),('R20220101100714072-F00097',0.09,'2022-04-18','Yes','2022-07-13',35,1,52,2,73),('R20220101100714176-F00054',152.38,'2022-01-24','Yes','2022-07-13',31,1,66,2,46),('R20220101100714191-F00035',1550.00,'2022-05-03','Yes','2022-07-15',24,1,18,2,34),('R20220101100714211-F00037',3115.33,'2022-06-15','Yes','2022-07-20',42,2,62,2,48),('R20220701100714451-F00027',86.35,'2022-09-02','Yes','2022-10-10',31,1,68,2,38),('R20220701100714451-F00043',305.90,'2022-07-28','Yes','2022-10-10',31,1,69,2,38),('R20220701100714532-F00016',906.10,'2022-09-06','Yes','2022-10-11',42,1,50,2,54),('R20220701100714532-F00072',1000.00,'2022-09-02','Yes','2022-10-11',42,1,64,2,52),('R20220701100714613-F00004',2.06,'2022-08-29','Yes','2022-10-10',6,1,37,2,24),('R20220701100714613-F00017',47.67,'2022-08-31','Yes','2022-10-10',6,1,37,2,24),('R20220701100714613-F00026',750.00,'2022-09-07','Yes','2022-10-10',6,1,67,2,44),('R20220701100714641-F00060',45.70,'2022-08-12','Yes','2022-10-11',24,1,35,2,0),('R20220701100714710-F00009',1.63,'2022-07-30','Yes','2022-10-27',6,2,37,2,24),('R20220930100714720-F00003',17750.00,'2022-10-06','Yes','2022-10-31',31,1,49,2,64),('R20221030100714846-F00111',806.25,'2022-12-02','Yes','2022-12-05',42,1,63,2,47),('R20221030100714846-F00135',125.00,'2022-11-18','Yes','2022-12-05',42,1,63,2,39),('R20221030100714847-F00041',85.47,'2022-12-02','Yes','2022-12-05',6,1,37,2,24),('R20221030100714848-F00028',3763.04,'2022-12-02','Yes','2022-12-05',24,1,6,2,10),('R20221030100714851-F00025',1600.00,'2022-12-03','Yes','2022-12-05',39,1,7,4,80),('R20221030100714858-F00021',400.00,'2022-12-01','Yes','2022-12-05',33,1,66,2,61),('R20221030100714865-F00032',35.00,'2022-11-03','Yes','2022-12-05',31,1,33,2,59);
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `transactions_more_than_100days`
--

DROP TABLE IF EXISTS `transactions_more_than_100days`;
/*!50001 DROP VIEW IF EXISTS `transactions_more_than_100days`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `transactions_more_than_100days` AS SELECT 
 1 AS `Payer`,
 1 AS `Payee`,
 1 AS `Date of Payment`,
 1 AS `Date Reported`,
 1 AS `Time taken to report (Days)`,
 1 AS `Reason for Transaction`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `averge_report_time`
--

/*!50001 DROP VIEW IF EXISTS `averge_report_time`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `averge_report_time` AS select avg(`time_taken`.`time_diff`) AS `Average Time Taken to Report Transaction In Days` from (select (to_days(`transactions`.`date_reported`) - to_days(`transactions`.`payment_date`)) AS `time_diff` from `transactions`) `time_taken` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `entity_summaries`
--

/*!50001 DROP VIEW IF EXISTS `entity_summaries`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `entity_summaries` AS select `payee_type`.`payee_type` AS `Payee Type`,concat('$',convert(format(avg(`transactions`.`payment_amount`),2) using utf8mb4)) AS `Average Spent`,concat('$',sum(`transactions`.`payment_amount`)) AS `Total Spent`,concat('$',max(`transactions`.`payment_amount`)) AS `Highest Spent` from ((`payee` join `payee_type` on((`payee`.`type_id` = `payee_type`.`type_id`))) join `transactions` on((`payee`.`payee_id` = `transactions`.`payee_id`))) group by `payee_type`.`payee_type` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `non_political_transactions`
--

/*!50001 DROP VIEW IF EXISTS `non_political_transactions`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `non_political_transactions` AS select `payer`.`payer_name` AS `Payer Name`,concat('$',`transactions`.`payment_amount`) AS `Amount Paid`,`payee`.`payee_name` AS `Payee`,`ex_info`.`ex_type` AS `Expense Type`,`ex_info`.`description` AS `Description`,`transactions`.`payment_date` AS `Date Paid` from ((((select `ex_type`.`ex_type` AS `ex_type`,`ex_description`.`description` AS `description`,`expenditures`.`ex_type_id` AS `ex_type_id`,`expenditures`.`description_id` AS `description_id` from ((`expenditures` join `ex_type` on((`expenditures`.`ex_type_id` = `ex_type`.`ex_type_id`))) join `ex_description` on((`expenditures`.`description_id` = `ex_description`.`description_id`))) where (`expenditures`.`ex_type_id` = 1)) `ex_info` join `transactions` on(((`ex_info`.`ex_type_id` = `transactions`.`ex_type_id`) and (`ex_info`.`description_id` = `transactions`.`description_id`)))) join `payee` on((`transactions`.`payee_id` = `payee`.`payee_id`))) join `payer` on((`transactions`.`payer_id` = `payer`.`payer_id`))) order by `transactions`.`payment_amount` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `number_of_transactions_made`
--

/*!50001 DROP VIEW IF EXISTS `number_of_transactions_made`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `number_of_transactions_made` AS select `payer`.`payer_name` AS `Payer`,count(`transactions`.`payer_id`) AS `Number Of Transactions`,concat('$',max(`transactions`.`payment_amount`)) AS `Max Paid` from (`transactions` join `payer` on((`transactions`.`payer_id` = `payer`.`payer_id`))) group by `Payer` order by count(`transactions`.`payer_id`) desc,`Payer` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `office_holder_transactions`
--

/*!50001 DROP VIEW IF EXISTS `office_holder_transactions`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `office_holder_transactions` AS select `payer`.`payer_name` AS `Payer`,`payee`.`payee_name` AS `Payee`,`transactions`.`payment_amount` AS `Amount Paid`,`ex_description`.`description` AS `description`,`transactions`.`pol_obligation` AS `Political Obligation` from (((`transactions` join `payer` on((`transactions`.`payer_id` = `payer`.`payer_id`))) join `payee` on((`transactions`.`payee_id` = `payee`.`payee_id`))) join `ex_description` on((`transactions`.`description_id` = `ex_description`.`description_id`))) where (`transactions`.`report_id` = 1) order by `payer`.`payer_name`,`payee`.`payee_name`,`transactions`.`payment_amount` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `transactions_more_than_100days`
--

/*!50001 DROP VIEW IF EXISTS `transactions_more_than_100days`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `transactions_more_than_100days` AS select `payer`.`payer_name` AS `Payer`,`payee`.`payee_name` AS `Payee`,`transactions`.`payment_date` AS `Date of Payment`,`transactions`.`date_reported` AS `Date Reported`,(to_days(`transactions`.`date_reported`) - to_days(`transactions`.`payment_date`)) AS `Time taken to report (Days)`,`ex_description`.`description` AS `Reason for Transaction` from (((`transactions` join `payer` on((`transactions`.`payer_id` = `payer`.`payer_id`))) join `payee` on((`transactions`.`payee_id` = `payee`.`payee_id`))) join `ex_description` on((`transactions`.`description_id` = `ex_description`.`description_id`))) where ((to_days(`transactions`.`date_reported`) - to_days(`transactions`.`payment_date`)) > 100) order by (to_days(`transactions`.`date_reported`) - to_days(`transactions`.`payment_date`)) desc,`payer`.`payer_name`,`payee`.`payee_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-20 11:42:38
