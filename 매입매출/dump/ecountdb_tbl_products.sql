-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: ecountdb
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `tbl_products`
--

DROP TABLE IF EXISTS `tbl_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_products` (
  `p_code` varchar(6) NOT NULL,
  `p_name` varchar(50) NOT NULL,
  `p_item` varchar(20) DEFAULT NULL,
  `p_std` varchar(50) DEFAULT NULL,
  `p_comp` varchar(50) DEFAULT NULL,
  `p_iprice` int DEFAULT NULL,
  `p_oprice` int DEFAULT NULL,
  PRIMARY KEY (`p_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_products`
--

LOCK TABLES `tbl_products` WRITE;
/*!40000 ALTER TABLE `tbl_products` DISABLE KEYS */;
INSERT INTO `tbl_products` VALUES ('P00001','허쉬드링크(신)','','','허쉬스',197,400),('P00002','뉴롤리폴리','','','해태제과',298,545),('P00003','디스(갑)','','','KT&G',670,1091),('P00004','디스플러스(갑)','','','KT&G',834,969),('P00005','땅콩그래','','','해태',328,500),('P00006','레종후레시','','','KT&G',1037,1094),('P00007','로크럭스','','','KT&G',284,2115),('P00008','미니자유시간','','','해태',1311,0),('P00009','미사랑','','','해태',262,600),('P00010','바나나우유','','','빙그레',210,571),('P00011','바밤바','','','빙그레',192,150),('P00012','버터링','','','해태',468,286),('P00013','부라보(바닐라)','','','해태',157,714),('P00014','부라보(초코)','','','해태',439,200),('P00015','브라우니','','','성심당',345,474),('P00016','빅썬사과','','','',152,143),('P00017','샤브레','','','',225,857),('P00018','소보로','','','',655,0),('P00019','순두유230ml','','','',341,578),('P00020','신라면큰사발','','','',266,450),('P00021','심플(갑)','','','',606,1479),('P00022','쌍쌍바','','','',240,263),('P00023','아카시아후레쉬','','','',632,429),('P00024','에쎄클래식','','','',659,1607),('P00025','에이스','','','',819,750),('P00026','에이스(소)','','','',230,350),('P00027','연양갱','','','',59,409),('P00028','오미오미누룽지','','','',328,500),('P00029','오예스','','','',1399,1067),('P00030','오예스브라우니','','','',393,400),('P00031','요플레딸기100g','','','',158,350),('P00032','은단청후레쉬','','','',246,2000),('P00033','인디고','','','',868,1324),('P00034','입안가득초코칩','','','',553,656),('P00035','자연애통밀','','','',524,400),('P00036','자유시간','','','',178,227),('P00037','초코틴틴','','','',364,444),('P00038','초코픽','','','',367,240),('P00039','컨디션','','','',615,1250),('P00040','컨디션파워','','','',597,2571),('P00041','타임리스타임(갑)','','','',727,1314),('P00042','티피','','','',230,350),('P00043','티피500','','','',164,250),('P00044','햇쌀','','','',819,750),('P00045','헬로엔요190ml','','','',230,375),('P00046','호두마루','','','',128,467),('P00047','홈런볼초코','','','',1311,1000),('P00048','홈런볼초코(소)','','','',491,250),('P00049','화이트엔젤큐티','','','',614,563),('P00050','후렌치파이딸기','','','',656,1500);
/*!40000 ALTER TABLE `tbl_products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-30  9:11:35
