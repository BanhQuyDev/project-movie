-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: project_movie
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `cinemamovies`
--

DROP TABLE IF EXISTS `cinemamovies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cinemamovies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `movieId` int DEFAULT NULL,
  `cinemaId` int DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `movieId` (`movieId`),
  KEY `cinemaId` (`cinemaId`),
  CONSTRAINT `cinemamovies_ibfk_1` FOREIGN KEY (`movieId`) REFERENCES `movies` (`id`),
  CONSTRAINT `cinemamovies_ibfk_2` FOREIGN KEY (`cinemaId`) REFERENCES `cinemas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinemamovies`
--

LOCK TABLES `cinemamovies` WRITE;
/*!40000 ALTER TABLE `cinemamovies` DISABLE KEYS */;
INSERT INTO `cinemamovies` VALUES (1,1,1,'2021-11-19 11:36:14','2021-11-19 11:36:14'),(2,3,2,'2021-11-19 11:36:14','2021-11-19 11:36:14'),(3,3,1,'2021-11-19 11:36:14','2021-11-19 11:36:14'),(4,1,2,'2021-11-19 11:36:14','2021-11-19 11:36:14'),(5,1,3,'2021-11-19 11:36:14','2021-11-19 11:36:14');
/*!40000 ALTER TABLE `cinemamovies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinemas`
--

DROP TABLE IF EXISTS `cinemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cinemas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `cineplexId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Cinemas_cineplexId_foreign_idx` (`cineplexId`),
  CONSTRAINT `Cinemas_cineplexId_foreign_idx` FOREIGN KEY (`cineplexId`) REFERENCES `cineplexes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinemas`
--

LOCK TABLES `cinemas` WRITE;
/*!40000 ALTER TABLE `cinemas` DISABLE KEYS */;
INSERT INTO `cinemas` VALUES (1,'BDH 3/2','159 đường 3/2 quận 10 tphcm','hinh rap','2021-11-19 11:36:14','2021-11-19 11:36:14',1),(2,'BDH Cao Thắng','102 đường cao thắng quận 3 tphcm','hinh rap','2021-11-19 11:36:14','2021-11-19 11:36:14',1),(3,'CGV Phạm Ngũ Lão','79 đường phạm ngũ lão quận 1 tphcm','hinh rap','2021-11-19 11:36:14','2021-11-19 11:36:14',2),(4,'Galaxy Nguyễn Hồng Đào','79 đường phạm ngũ lão quận 1 tphcm','hinh rap','2021-11-19 11:36:14','2021-11-19 11:36:14',4),(5,'Lotte Cinema Quang Trung','79 đường phạm ngũ lão quận 1 tphcm','hinh rap','2021-11-19 11:36:14','2021-11-19 11:36:14',2),(6,'Lotte Nguyễn Văn quá','120 Nguyễn Văn Quá','https://toplistsaigon.com/wp-content/uploads/2019/10/6-min-1.jpg','2022-01-17 14:30:01','2022-01-17 14:45:54',5),(7,'Cinebox Nguyễn Thị Minh Khai','120 Nguyễn Thị Minh Khai','https://toplistsaigon.com/wp-content/uploads/2019/10/6-min-1.jpg','2022-01-17 14:35:19','2022-01-17 14:35:19',8),(8,'Cinebox Quang Trung','120 Quang Trung','https://toplistsaigon.com/wp-content/uploads/2019/10/6-min-1.jpg','2022-01-17 14:36:16','2022-01-17 14:36:16',8),(9,'Cinestar Quang Trung','120 Quang Trung','https://toplistsaigon.com/wp-content/uploads/2019/10/6-min-1.jpg','2022-01-17 14:47:28','2022-01-17 14:47:28',7),(10,'Cinestar Đồng Khởi','120 Quang Trung','https://toplistsaigon.com/wp-content/uploads/2019/10/6-min-1.jpg','2022-01-17 14:47:41','2022-01-17 14:47:41',7),(11,'Mega GS Đồng Khởi','120 Quang Trung','https://toplistsaigon.com/wp-content/uploads/2019/10/6-min-1.jpg','2022-01-17 14:48:27','2022-01-17 14:48:27',10),(12,'DDC Trường Chinh','120 Quang Trung','https://toplistsaigon.com/wp-content/uploads/2019/10/6-min-1.jpg','2022-01-17 14:53:47','2022-01-17 14:53:47',6);
/*!40000 ALTER TABLE `cinemas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cineplexes`
--

DROP TABLE IF EXISTS `cineplexes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cineplexes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cineplexes`
--

LOCK TABLES `cineplexes` WRITE;
/*!40000 ALTER TABLE `cineplexes` DISABLE KEYS */;
INSERT INTO `cineplexes` VALUES (1,'BHD','https://www.google.com/url?sa=i&url=https%3A%2F','2021-11-19 11:36:14','2021-11-19 11:36:14'),(2,'CGV','https://www.google.com/imgres?imgurl=https%3A%2F%2Fcdn.tgdd.vn%2FFiles%','2021-11-19 11:36:14','2021-11-19 11:36:14'),(4,'Galaxy Cinema','https://www.google.com/imgres?imgurl=https%3A%2F%2Fwww.g','2021-11-19 11:36:14','2021-11-19 11:36:14'),(5,'Lotte Cinema','https://www.google.com/imgres?imgurl=https%3A%','2021-11-19 11:36:14','2021-11-19 11:36:14'),(6,'DDC','https://toplistsaigon.com/wp-content/uploads/2019/10/5-min-1.jpg','2022-01-17 14:00:16','2022-01-17 14:00:16'),(7,'Cinestar','https://toplistsaigon.com/wp-content/uploads/2019/10/6-min-1.jpg','2022-01-17 14:00:39','2022-01-17 14:00:39'),(8,'Cinebox','https://toplistsaigon.com/wp-content/uploads/2019/10/6-min-1.jpg','2022-01-17 14:00:50','2022-01-17 14:00:50'),(10,'Mega GS','https://toplistsaigon.com/wp-content/uploads/2019/10/6-min-1.jpg','2022-01-17 14:16:48','2022-01-17 14:16:48');
/*!40000 ALTER TABLE `cineplexes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `poster` varchar(255) DEFAULT NULL,
  `trailer` varchar(255) DEFAULT NULL,
  `duration` int DEFAULT NULL,
  `description` text,
  `comingDate` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES (1,'Iron Man 2','Iron Man 2','Link hinh','link video',180,'ok','2021-11-19 00:00:00','2021-11-19 11:36:14','2022-01-15 05:44:47','1'),(2,'Super Man 2','Iron Man 2','Link hinh','link video',180,'ok','2021-11-19 00:00:00','2021-11-19 11:36:14','2022-01-15 05:44:06','1'),(3,'Spider Man- No Way Home','Jon Watts','https://www.google.com/url?sa=i&url=https%3A%2F%2Fthichxemphim.net%2Fnguoi-nhen-khong-con-nha-spider-man-no-way-home&psig=AOvVaw0aALsJF_hAfHL0HJo1vgLY&ust=1642080802623000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCIj7jOmprPUCFQAAAAAdAAAAABAD','https://www.youtube.com/watch?v=JfVOs4VSpmA',150,'Người Nhện: Không Còn Nhà - Spider-Man: No Way Home tiếp nối câu chuyện ở những phần phim trước, khi giờ đây siêu anh hùng người nhện là Peter Parker đã bị bại lộ ra danh tính thật sự của mình cho cả thế giới biết, tất cả đều do Mysterio thực hiện. Giờ đây Peter phải đối mặt với vô số nguy hiểm không những thế còn phải bảo vệ những người thân của mình. Vì không thể nào chống đỡ nổi, Peter Parker đã tìm đến Doctor Strange xin sự trợ giúp. Nhưng mọi chuyện ngày càng đi xa và rắc rối hơn, giờ đây Peter phải cố gắng khám phá ra được ý nghĩa thật sự của bản thân khi trở thành một siêu anh hùng','2021-10-11 00:00:00','2021-11-19 11:35:14','2022-01-15 05:44:25','2'),(4,'End Game','Jon Watts','https://www.google.com/url?sa=i&url=https%3A%2F%2Fthichxemphim.net%2Fnguoi-nhen-khong-con-nha-spider-man-no-way-home&psig=AOvVaw0aALsJF_hAfHL0HJo1vgLY&ust=1642080802623000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCIj7jOmprPUCFQAAAAAdAAAAABAD','https://www.youtube.com/watch?v=JfVOs4VSpmA',150,'Người Nhện: Không Còn Nhà - Spider-Man: No Way Home tiếp nối câu chuyện ở những phần phim trước, khi giờ đây siêu anh hùng người nhện là Peter Parker đã bị bại lộ ra danh tính thật sự của mình cho cả thế giới biết, tất cả đều do Mysterio thực hiện. Giờ đây Peter phải đối mặt với vô số nguy hiểm không những thế còn phải bảo vệ những người thân của mình. Vì không thể nào chống đỡ nổi, Peter Parker đã tìm đến Doctor Strange xin sự trợ giúp. Nhưng mọi chuyện ngày càng đi xa và rắc rối hơn, giờ đây Peter phải cố gắng khám phá ra được ý nghĩa thật sự của bản thân khi trở thành một siêu anh hùng','2021-11-11 00:00:00','2021-12-19 11:36:14','2022-01-15 05:44:34','3'),(5,'Infinity War','Jon Watts','https://www.google.com/url?sa=i&url=https%3A%2F%2Fthichxemphim.net%2Fnguoi-nhen-khong-con-nha-spider-man-no-way-home&psig=AOvVaw0aALsJF_hAfHL0HJo1vgLY&ust=1642080802623000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCIj7jOmprPUCFQAAAAAdAAAAABAD','https://www.youtube.com/watch?v=JfVOs4VSpmA',150,'Người Nhện: Không Còn Nhà - Spider-Man: No Way Home tiếp nối câu chuyện ở những phần phim trước, khi giờ đây siêu anh hùng người nhện là Peter Parker đã bị bại lộ ra danh tính thật sự của mình cho cả thế giới biết, tất cả đều do Mysterio thực hiện. Giờ đây Peter phải đối mặt với vô số nguy hiểm không những thế còn phải bảo vệ những người thân của mình. Vì không thể nào chống đỡ nổi, Peter Parker đã tìm đến Doctor Strange xin sự trợ giúp. Nhưng mọi chuyện ngày càng đi xa và rắc rối hơn, giờ đây Peter phải cố gắng khám phá ra được ý nghĩa thật sự của bản thân khi trở thành một siêu anh hùng','2021-12-11 00:00:00','2021-01-19 11:36:14','2022-01-15 05:44:51','1'),(6,'The Avenger','Jon Watts','https://www.google.com/url?sa=i&url=https%3A%2F%2Fthichxemphim.net%2Fnguoi-nhen-khong-con-nha-spider-man-no-way-home&psig=AOvVaw0aALsJF_hAfHL0HJo1vgLY&ust=1642080802623000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCIj7jOmprPUCFQAAAAAdAAAAABAD','https://www.youtube.com/watch?v=JfVOs4VSpmA',150,'Người Nhện: Không Còn Nhà - Spider-Man: No Way Home tiếp nối câu chuyện ở những phần phim trước, khi giờ đây siêu anh hùng người nhện là Peter Parker đã bị bại lộ ra danh tính thật sự của mình cho cả thế giới biết, tất cả đều do Mysterio thực hiện. Giờ đây Peter phải đối mặt với vô số nguy hiểm không những thế còn phải bảo vệ những người thân của mình. Vì không thể nào chống đỡ nổi, Peter Parker đã tìm đến Doctor Strange xin sự trợ giúp. Nhưng mọi chuyện ngày càng đi xa và rắc rối hơn, giờ đây Peter phải cố gắng khám phá ra được ý nghĩa thật sự của bản thân khi trở thành một siêu anh hùng','2021-09-11 00:00:00','2021-11-19 11:36:14','2022-01-15 05:44:54','1'),(7,'Home alone 4','Jon Watts','https://www.google.com/url?sa=i&url=https%3A%2F%2Fthichxemphim.net%2Fnguoi-nhen-khong-con-nha-spider-man-no-way-home&psig=AOvVaw0aALsJF_hAfHL0HJo1vgLY&ust=1642080802623000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCIj7jOmprPUCFQAAAAAdAAAAABAD','https://www.youtube.com/watch?v=JfVOs4VSpmA',150,'Người Nhện: Không Còn Nhà - Spider-Man: No Way Home tiếp nối câu chuyện ở những phần phim trước, khi giờ đây siêu anh hùng người nhện là Peter Parker đã bị bại lộ ra danh tính thật sự của mình cho cả thế giới biết, tất cả đều do Mysterio thực hiện. Giờ đây Peter phải đối mặt với vô số nguy hiểm không những thế còn phải bảo vệ những người thân của mình. Vì không thể nào chống đỡ nổi, Peter Parker đã tìm đến Doctor Strange xin sự trợ giúp. Nhưng mọi chuyện ngày càng đi xa và rắc rối hơn, giờ đây Peter phải cố gắng khám phá ra được ý nghĩa thật sự của bản thân khi trở thành một siêu anh hùng','2021-10-11 00:00:00','2022-01-15 05:23:14','2022-01-17 13:52:37','2'),(8,'Home alone 4','Jon Watts','https://www.google.com/url?sa=i&url=https%3A%2F%2Fthichxemphim.net%2Fnguoi-nhen-khong-con-nha-spider-man-no-way-home&psig=AOvVaw0aALsJF_hAfHL0HJo1vgLY&ust=1642080802623000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCIj7jOmprPUCFQAAAAAdAAAAABAD','https://www.youtube.com/watch?v=JfVOs4VSpmA',150,'Người Nhện: Không Còn Nhà - Spider-Man: No Way Home tiếp nối câu chuyện ở những phần phim trước, khi giờ đây siêu anh hùng người nhện là Peter Parker đã bị bại lộ ra danh tính thật sự của mình cho cả thế giới biết, tất cả đều do Mysterio thực hiện. Giờ đây Peter phải đối mặt với vô số nguy hiểm không những thế còn phải bảo vệ những người thân của mình. Vì không thể nào chống đỡ nổi, Peter Parker đã tìm đến Doctor Strange xin sự trợ giúp. Nhưng mọi chuyện ngày càng đi xa và rắc rối hơn, giờ đây Peter phải cố gắng khám phá ra được ý nghĩa thật sự của bản thân khi trở thành một siêu anh hùng','2021-10-11 00:00:00','2022-01-18 06:58:18','2022-01-18 06:58:18','1'),(9,'Home alone 9','Jon Watts','https://www.google.com/url?sa=i&url=https%3A%2F%2Fthichxemphim.net%2Fnguoi-nhen-khong-con-nha-spider-man-no-way-home&psig=AOvVaw0aALsJF_hAfHL0HJo1vgLY&ust=1642080802623000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCIj7jOmprPUCFQAAAAAdAAAAABAD','https://www.youtube.com/watch?v=JfVOs4VSpmA',150,'Người Nhện: Không Còn Nhà - Spider-Man: No Way Home tiếp nối câu chuyện ở những phần phim trước, khi giờ đây siêu anh hùng người nhện là Peter Parker đã bị bại lộ ra danh tính thật sự của mình cho cả thế giới biết, tất cả đều do Mysterio thực hiện. Giờ đây Peter phải đối mặt với vô số nguy hiểm không những thế còn phải bảo vệ những người thân của mình. Vì không thể nào chống đỡ nổi, Peter Parker đã tìm đến Doctor Strange xin sự trợ giúp. Nhưng mọi chuyện ngày càng đi xa và rắc rối hơn, giờ đây Peter phải cố gắng khám phá ra được ý nghĩa thật sự của bản thân khi trở thành một siêu anh hùng','2021-10-11 00:00:00','2022-01-18 06:58:40','2022-01-18 06:58:40','3');
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (1,'Giảm Giá 40% cho sinh viên','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book','https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.actopus.','2022-01-13 08:49:53','2022-01-13 08:49:53'),(2,'Combo mua 1 bắp tặng 2 nước','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book','https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.actopus.','2022-01-13 08:49:53','2022-01-13 08:49:53'),(3,'Khởi Chiếu Phim Spider-man','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book','https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.actopus.','2022-01-13 08:49:53','2022-01-13 08:49:53'),(4,'Khởi Chiếu Phim tom and jerry','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book','https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.actopus.','2022-01-13 08:49:53','2022-01-13 08:49:53');
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seats`
--

DROP TABLE IF EXISTS `seats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seats` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `price` int DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `showtimeId` int DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `showtimeId` (`showtimeId`),
  CONSTRAINT `seats_ibfk_1` FOREIGN KEY (`showtimeId`) REFERENCES `showtimes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seats`
--

LOCK TABLES `seats` WRITE;
/*!40000 ALTER TABLE `seats` DISABLE KEYS */;
INSERT INTO `seats` VALUES (1,'T30',0,50,'VIP',1,'2022-01-13 08:49:53','2022-01-18 08:23:11'),(2,'H20',0,100,'VIP',1,'2022-01-13 08:49:53','2022-01-13 08:49:53'),(3,'H30',0,50,'VIP',2,'2022-01-13 08:49:53','2022-01-18 08:49:58'),(4,'A12',1,50,'VIP',4,'2022-01-13 08:49:53','2022-01-13 08:49:53'),(5,'A12',1,50,'VIP',1,'2022-01-13 08:49:53','2022-01-13 08:49:53'),(6,'T30',1,100,'COUPLE',10,'2022-01-17 17:05:22','2022-01-17 17:05:22'),(7,'G30',1,100,'COUPLE',10,'2022-01-17 17:05:34','2022-01-17 17:05:34'),(8,'T10',1,100,'COUPLE',10,'2022-01-17 17:05:41','2022-01-17 17:05:41'),(9,'T10',1,100,'COUPLE',9,'2022-01-17 17:07:30','2022-01-17 17:07:30'),(10,'H20',0,100,'COUPLE',3,'2022-01-17 17:07:42','2022-01-17 17:12:21'),(11,'H20',0,100,'COUPLE',9,'2022-01-17 17:07:52','2022-01-17 17:07:52'),(12,'H20',0,100,'COUPLE',11,'2022-01-17 17:07:55','2022-01-17 17:07:55'),(13,'H20',0,100,'COUPLE',12,'2022-01-17 17:07:58','2022-01-17 17:07:58'),(14,'H20',0,100,'COUPLE',12,'2022-01-17 17:08:00','2022-01-17 17:08:00'),(15,'H20',0,100,'COUPLE',12,'2022-01-17 17:08:02','2022-01-17 17:08:02'),(16,'H20',0,100,'COUPLE',12,'2022-01-17 17:08:03','2022-01-17 17:08:03'),(17,'H20',0,100,'COUPLE',15,'2022-01-17 17:08:08','2022-01-17 17:08:08'),(18,'H20',0,100,'COUPLE',3,'2022-01-17 17:08:12','2022-01-17 17:08:12'),(19,'H20',0,100,'COUPLE',3,'2022-01-17 17:08:13','2022-01-17 17:08:13'),(20,'H20',1,100,'COUPLE',3,'2022-01-17 17:08:21','2022-01-17 17:08:21'),(21,'H20',1,100,'COUPLE',3,'2022-01-17 17:16:38','2022-01-17 17:16:38');
/*!40000 ALTER TABLE `seats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequelizemeta`
--

DROP TABLE IF EXISTS `sequelizemeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sequelizemeta` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequelizemeta`
--

LOCK TABLES `sequelizemeta` WRITE;
/*!40000 ALTER TABLE `sequelizemeta` DISABLE KEYS */;
INSERT INTO `sequelizemeta` VALUES ('20211108120612-create-user.js'),('20211119093355-create-movie.js'),('20211122042522-add-column-avatar.js'),('20211122042522-add-column-status.js'),('20211128061338-create-cinema.js'),('20211128061557-create-cineplex.js'),('20220111034417-create-ticket.js'),('20220111034639-create-showtime.js'),('20220111035030-create-seat.js'),('20220111035632-create-cinema-movie.js'),('20220113060521-create-news.js');
/*!40000 ALTER TABLE `sequelizemeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `showtimes`
--

DROP TABLE IF EXISTS `showtimes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `showtimes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `startTime` datetime DEFAULT NULL,
  `cinemaId` int DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cinemaId` (`cinemaId`),
  CONSTRAINT `showtimes_ibfk_1` FOREIGN KEY (`cinemaId`) REFERENCES `cinemas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `showtimes`
--

LOCK TABLES `showtimes` WRITE;
/*!40000 ALTER TABLE `showtimes` DISABLE KEYS */;
INSERT INTO `showtimes` VALUES (1,'2022-10-20 00:00:00',1,'2021-11-19 11:36:14','2021-11-19 11:36:14'),(2,'2022-11-20 00:00:00',1,'2021-11-19 11:36:14','2021-11-19 11:36:14'),(3,'2022-09-20 00:00:00',1,'2021-11-19 11:36:14','2021-11-19 11:36:14'),(4,'2022-10-20 00:00:00',2,'2021-11-19 11:36:14','2021-11-19 11:36:14'),(5,'2022-01-20 00:00:00',1,'2021-11-19 11:36:14','2021-11-19 11:36:14'),(6,'2021-09-20 00:00:00',5,'2022-01-17 16:25:38','2022-01-17 16:25:38'),(7,'2021-07-20 00:00:00',5,'2022-01-17 16:25:53','2022-01-17 16:25:53'),(8,'2021-07-20 00:00:00',6,'2022-01-17 16:26:03','2022-01-17 16:26:03'),(9,'2021-07-20 00:00:00',3,'2022-01-17 16:26:20','2022-01-17 16:26:20'),(10,'2022-02-12 00:00:00',9,'2022-01-17 16:41:46','2022-01-17 16:41:46'),(11,'2021-07-20 00:00:00',5,'2022-01-17 16:26:29','2022-01-17 16:26:29'),(12,'2021-07-20 00:00:00',6,'2022-01-17 16:26:32','2022-01-17 16:26:32'),(13,'2021-07-20 00:00:00',7,'2022-01-17 16:26:36','2022-01-17 16:26:36'),(14,'2021-07-20 00:00:00',8,'2022-01-17 16:26:49','2022-01-17 16:26:49'),(15,'2022-01-20 00:00:00',9,'2022-01-17 16:27:17','2022-01-17 16:27:17'),(16,'2022-02-20 00:00:00',9,'2022-01-17 16:27:21','2022-01-17 16:27:21'),(17,'2022-02-10 00:00:00',9,'2022-01-17 16:27:24','2022-01-17 16:27:24'),(18,'2022-02-11 00:00:00',9,'2022-01-17 16:27:27','2022-01-17 16:27:27'),(19,'2022-02-12 00:00:00',9,'2022-01-17 16:27:32','2022-01-17 16:27:32'),(20,'2022-02-12 00:00:00',10,'2022-01-18 07:01:58','2022-01-18 07:01:58');
/*!40000 ALTER TABLE `showtimes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int DEFAULT NULL,
  `movieId` int DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `movieId` (`movieId`),
  CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  CONSTRAINT `tickets_ibfk_2` FOREIGN KEY (`movieId`) REFERENCES `movies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
INSERT INTO `tickets` VALUES (1,1,2,'2022-01-13 08:53:06','2022-01-13 08:53:06'),(2,2,4,'2022-01-13 08:53:06','2022-01-13 08:53:06'),(3,3,2,'2022-01-13 08:53:06','2022-01-13 08:53:06'),(4,4,2,'2022-01-13 08:53:06','2022-01-13 08:53:06');
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT 'Client',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Huy Đoàn','conheongungoc@gmail.com','123456','0909563183','ADMIN','2022-01-13 08:52:33','2022-01-13 08:52:33','link hinh'),(2,'Tiên','bemeodth@gmail.com','$2a$10$G64uUFJln0puM4xVuY0u6.zydf6GOYOPeaR9ol8XorPH1DOkL0AR2','0909563183','ADMIN','2022-01-13 08:52:33','2022-01-18 06:33:25','link hinh'),(3,'Vũ Ngu','vupro@gmail.com','123456','0909563183','CLIENT','2022-01-13 08:52:33','2022-01-13 08:52:33','link hinh'),(4,'Tùng giới tính','conheongungoc@gmail.com','123456','0909563183','CLIENT','2022-01-13 08:52:33','2022-01-13 08:52:33','link hinh'),(5,'Neeko','bemeodth123@gmail.com','$2a$10$vq3uVy3IRpvVW9NxDz0Q2uTJbWSpIhIkKaGWANyvmFNBRLy5G.aom','0906918521','Client','2022-01-18 06:26:50','2022-01-18 06:26:50',NULL),(7,'Tien','bemeodth@gmail.com','$2a$10$NK7RH0/dzJFnUK8HVogksOx0FSr/9XhTplnnAYSWh80sw37WK0TW2','0909563183','ADMIN','2022-01-18 06:55:32','2022-01-18 06:55:32',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-18 17:25:03
