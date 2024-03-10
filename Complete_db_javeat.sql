CREATE DATABASE  IF NOT EXISTS `javeat` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `javeat`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: javeat
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery` (
  `id` int NOT NULL AUTO_INCREMENT,
  `distance` int NOT NULL,
  `expected_arrival` datetime(6) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `restaurant_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKeagt49doseanxh8r2hrb18goj` (`restaurant_id`),
  KEY `FK5ew3qef4wkv137uiky3nd663e` (`user_id`),
  CONSTRAINT `FK5ew3qef4wkv137uiky3nd663e` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `FKeagt49doseanxh8r2hrb18goj` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery`
--

LOCK TABLES `delivery` WRITE;
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
INSERT INTO `delivery` VALUES (5,267,'2024-03-08 08:57:28.000000','','Credit/Debit Card',1,3),(6,449,NULL,'','Credit/Debit Card',44,3),(7,267,'2024-03-08 10:01:19.000000','ciaociaomsodmasodma','Credit/Debit Card',1,3);
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dish`
--

DROP TABLE IF EXISTS `dish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dish` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `menu_id` int DEFAULT NULL,
  `customizable` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKljuksxg35var0r9a3y09l148h` (`menu_id`),
  CONSTRAINT `FKljuksxg35var0r9a3y09l148h` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=268 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dish`
--

LOCK TABLES `dish` WRITE;
/*!40000 ALTER TABLE `dish` DISABLE KEYS */;
INSERT INTO `dish` VALUES (1,'Pasta','Spaghetti alla Carbonara',10.99,1,_binary '\0'),(2,'Pizza','Pizza Margherita',8.5,3,_binary ''),(3,'Salad','Caesar Salad',7.99,1,_binary ''),(4,'Pasta','Chicken Alfredo',12.99,1,_binary '\0'),(5,'Burger','Hamburger',9.99,5,_binary ''),(6,'Risotto','Mushroom Risotto',11.5,1,_binary '\0'),(7,'Seafood','Grilled Salmon',14.99,7,_binary '\0'),(8,'Dessert','Tiramisu',6.99,1,_binary '\0'),(9,'Salad','Caprese Salad',8.5,1,_binary ''),(10,'Main Course','Steak Frites',16.99,5,_binary '\0'),(11,'Sushi','Sushi Roll',13.99,2,_binary '\0'),(12,'Indian','Chicken Tikka Masala',11.5,5,_binary '\0'),(13,'Thai','Pad Thai',10.99,4,_binary '\0'),(14,'Mexican','Beef Tacos',9.5,8,_binary '\0'),(15,'Italian','Eggplant Parmesan',10.5,1,_binary '\0'),(16,'Vietnamese','Pho',8.99,4,_binary '\0'),(17,'American','BBQ Ribs',15.5,5,_binary '\0'),(18,'Asian','Vegetable Stir-Fry',9.99,2,_binary '\0'),(19,'Italian','Lasagna',12.5,1,_binary '\0'),(20,'British','Fish and Chips',11.99,5,_binary '\0'),(57,'Pasta','Fettuccine Alfredo',11.99,1,_binary '\0'),(58,'Mexican','Tacos al Pastor',10.5,8,_binary '\0'),(60,'American','BBQ Pulled Pork Sandwich',9.99,5,_binary ''),(61,'Dessert','Chocolate Lava Cake',6.5,1,_binary '\0'),(63,'Sushi','California Roll',14.5,2,_binary '\0'),(64,'Thai','Pad Krapow Moo',11.99,4,_binary '\0'),(65,'Burger','Mushroom Burger',12.99,5,_binary '\0'),(66,'Sandwich','Chicken Caesar Wrap',8.99,5,_binary '\0'),(68,'Italian','Lasagna Verde',12.99,1,_binary '\0'),(69,'Seafood','Fish Tostadas',11.99,8,_binary '\0'),(71,'Russian','Classic Beef Stroganoff',12.5,5,_binary '\0'),(72,'Sushi','Salmon Nigiri',8.5,2,_binary '\0'),(73,'Sushi','Tuna Sashimi',9.5,2,_binary '\0'),(74,'Sushi','California Roll',10.99,2,_binary '\0'),(75,'Sushi','Spicy Tuna Roll',11.5,2,_binary '\0'),(76,'Sushi','Dragon Roll',13.99,2,_binary '\0'),(77,'Sushi','Rainbow Roll',12.99,2,_binary '\0'),(82,'Pizza','Margherita',9.99,3,_binary ''),(83,'Pizza','Quattro Stagioni',11.5,3,_binary ''),(84,'Pizza','Capricciosa',12.99,3,_binary ''),(85,'Pizza','Diavola',10.99,3,_binary ''),(86,'Pizza','Quattro Formaggi',12.5,3,_binary ''),(87,'Pizza','Hawaiian',11.99,3,_binary ''),(88,'Seafood','Grilled Sea Bass',18.99,7,_binary '\0'),(89,'Seafood','Lobster Linguine',22.5,7,_binary '\0'),(90,'Seafood','Shrimp Scampi',16.99,7,_binary '\0'),(91,'Seafood','Cioppino',24.99,7,_binary '\0'),(92,'Seafood','Seafood Paella',25.5,7,_binary '\0'),(93,'Seafood','Crab Cakes',17.99,7,_binary '\0'),(94,'Seafood','Mussels Marinara',14.5,7,_binary '\0'),(95,'Seafood','Grilled Octopus',20.99,7,_binary '\0'),(96,'Seafood','Tuna Tartare',19.99,7,_binary '\0'),(97,'Seafood','Fish Tacos',15.99,7,_binary '\0'),(98,'Secondi piatti','Manzo all arancia',12.99,11,_binary '\0'),(99,'Secondi piatti','Pollo alle mandorle',11.5,11,_binary '\0'),(100,'Secondi piatti','Maiale agrodolce',13.99,11,_binary '\0'),(101,'Secondi piatti','Anatra alla pechinese',15.99,11,_binary '\0'),(102,'Secondi piatti','Gamberetti in salsa piccante',14.5,11,_binary '\0'),(103,'Antipasti','Ravioli al vapore',8.99,11,_binary '\0'),(104,'Antipasti','Zuppa di miso',6.5,11,_binary '\0'),(105,'Antipasti','Insalata di alghe',7.99,11,_binary '\0'),(106,'Secondi piatti','Tofu saltato in padella',10.5,11,_binary '\0'),(107,'Secondi piatti','Anatra alla pechinese',15.99,11,_binary '\0'),(108,'Main Course','Souvlaki',12.99,10,_binary '\0'),(109,'Main Course','Moussaka',14.5,10,_binary '\0'),(110,'Appetizer','Dolmades',8.99,10,_binary '\0'),(111,'Appetizer','Spanakopita',10.99,10,_binary '\0'),(113,'Salad','Greek Salad',9.5,10,_binary '\0'),(114,'Appetizer','Tzatziki',6.99,10,_binary '\0'),(115,'Dessert','Baklava',7.99,10,_binary '\0'),(116,'Appetizer','Saganaki',12.5,10,_binary '\0'),(117,'Main Course','Pastitsio',13.99,10,_binary '\0'),(118,'Salad','Quinoa Salad',9.99,6,_binary '\0'),(119,'Burger','Vegan Burger',11.5,6,_binary ''),(120,'Curry','Chickpea Curry',12.99,6,_binary '\0'),(121,'Main Course','Stuffed Bell Peppers',10.99,6,_binary '\0'),(122,'Pizza','Vegan Pizza',13.5,6,_binary ''),(123,'Stir-Fry','Tofu Stir-Fry',11.99,6,_binary '\0'),(124,'Sushi','Vegan Sushi Roll',12.5,6,_binary '\0'),(125,'Pasta','Zucchini Noodles',10.5,6,_binary '\0'),(126,'Pasta','Vegan Mac and Cheese',11.99,6,_binary '\0'),(127,'Wrap','Roasted Vegetable Wrap',9.5,6,_binary '\0'),(128,'Salad','Greek Salad',10.99,17,_binary '\0'),(129,'Appetizer','Mediterranean Platter',15.5,17,_binary '\0'),(130,'Wrap','Falafel Wrap',12.99,17,_binary '\0'),(131,'Main Course','Moussaka',14.99,17,_binary '\0'),(132,'Grill','Grilled Lamb Chops',18.5,17,_binary '\0'),(133,'Seafood','Seafood Paella',22.99,17,_binary '\0'),(134,'Sandwich','Caprese Panini',11.99,17,_binary ''),(135,'Salad','Couscous Salad',9.5,17,_binary '\0'),(136,'Seafood','Lemon Garlic Shrimp',16.99,17,_binary '\0'),(137,'Dessert','Baklava',8.5,17,_binary '\0'),(138,'Soup','Tom Yum Soup',11.99,4,_binary '\0'),(139,'Noodles','Pad Thai',13.5,4,_binary '\0'),(140,'Curry','Green Curry',14.99,4,_binary '\0'),(141,'Dessert','Mango Sticky Rice',8.5,4,_binary '\0'),(142,'Rice','Pineapple Fried Rice',12.5,4,_binary '\0'),(143,'Curry','Massaman Curry',15.99,4,_binary '\0'),(144,'Salad','Som Tum Salad',10.99,4,_binary '\0'),(145,'Appetizer','Spring Rolls',9.5,4,_binary '\0'),(146,'Salad','Papaya Salad',11.99,4,_binary '\0'),(147,'Soup','Coconut Soup',10.5,4,_binary '\0'),(148,'Soup','Tom Yum Soup',12.99,14,_binary '\0'),(149,'Noodles','Pad Thai',14.5,14,_binary '\0'),(150,'Curry','Green Curry',15.99,14,_binary '\0'),(151,'Dessert','Mango Sticky Rice',9.5,14,_binary '\0'),(152,'Rice','Pineapple Fried Rice',13.5,14,_binary '\0'),(153,'Curry','Massaman Curry',16.99,14,_binary '\0'),(154,'Salad','Som Tum Salad',11.5,14,_binary '\0'),(155,'Appetizer','Spring Rolls',10.5,14,_binary '\0'),(156,'Salad','Papaya Salad',12.99,14,_binary '\0'),(157,'Soup','Coconut Soup',11.5,14,_binary '\0'),(168,'Main Course','Peking Duck',24.99,9,_binary '\0'),(169,'Main Course','Kung Pao Chicken',14.99,9,_binary '\0'),(170,'Appetizer','Dim Sum (Assorted)',12.99,9,_binary '\0'),(171,'Main Course','Mapo Tofu',11.99,9,_binary '\0'),(172,'Main Course','Sweet and Sour Pork',13.99,9,_binary '\0'),(173,'Main Course','Gong Bao Shrimp',16.99,9,_binary '\0'),(174,'Main Course','Beef Chow Mein',12.99,9,_binary '\0'),(175,'Main Course','Egg Foo Young',11.99,9,_binary '\0'),(176,'Soup','Hot and Sour Soup',8.99,9,_binary '\0'),(177,'Main Course','General Tso\'s Chicken',15.99,9,_binary '\0'),(188,'Sushi','Sushi Platter',29.99,12,_binary '\0'),(189,'Sashimi','Sashimi Assortment',34.99,12,_binary '\0'),(190,'Appetizer','Tempura Shrimp',12.99,12,_binary '\0'),(191,'Main Course','Teriyaki Chicken',18.99,12,_binary '\0'),(192,'Soup','Miso Soup',5.99,12,_binary '\0'),(193,'Appetizer','Yakitori Skewers',10.99,12,_binary '\0'),(194,'Sushi','California Roll',14.99,12,_binary '\0'),(195,'Noodles','Udon Noodle Soup',15.99,12,_binary '\0'),(196,'Main Course','Tonkatsu',21.99,12,_binary '\0'),(197,'Dessert','Matcha Ice Cream',8.99,12,_binary '\0'),(208,'Main Course','Paella Valenciana',25.99,16,_binary '\0'),(209,'Appetizer','Tortilla Española',10.99,16,_binary '\0'),(210,'Soup','Gazpacho',8.99,16,_binary '\0'),(211,'Appetizer','Pulpo a la Gallega',18.99,16,_binary '\0'),(212,'Appetizer','Patatas Bravas',12.99,16,_binary '\0'),(213,'Appetizer','Jamón Ibérico',22.99,16,_binary '\0'),(214,'Dessert','Churros',7.99,16,_binary '\0'),(215,'Dessert','Crema Catalana',9.99,16,_binary '\0'),(216,'Appetizer','Gambas al Ajillo',16.99,16,_binary '\0'),(217,'Appetizer','Calamares a la Romana',14.99,16,_binary '\0'),(218,'Salad','Quinoa Salad',12.99,18,_binary '\0'),(219,'Appetizer','Avocado Toast',9.99,18,_binary '\0'),(220,'Salad','Grilled Salmon Salad',15.99,18,_binary '\0'),(221,'Main Course','Vegetable Stir-Fry',14.99,18,_binary '\0'),(222,'Dessert','Acai Bowl',11.99,18,_binary '\0'),(223,'Beverage','Green Smoothie',7.99,18,_binary '\0'),(224,'Appetizer','Sweet Potato Fries',8.99,18,_binary '\0'),(225,'Dessert','Greek Yogurt Parfait',10.99,18,_binary '\0'),(226,'Main Course','Veggie Wrap',13.99,18,_binary '\0'),(227,'Main Course','Quinoa Stuffed Bell Peppers',16.99,18,_binary '\0'),(238,'Main Course','Tacos al Pastor',12.99,8,_binary '\0'),(239,'Appetizer','Guacamole',8.99,8,_binary '\0'),(240,'Main Course','Enchiladas Verdes',14.99,8,_binary '\0'),(241,'Main Course','Chiles Rellenos',16.99,8,_binary '\0'),(242,'Main Course','Mole Poblano',17.99,8,_binary '\0'),(243,'Appetizer','Tostadas de Ceviche',11.99,8,_binary '\0'),(244,'Soup','Pozole',13.99,8,_binary '\0'),(245,'Side Dish','Elote',6.99,8,_binary '\0'),(246,'Dessert','Churros',9.99,8,_binary '\0'),(247,'Beverage','Horchata',5.99,8,_binary '\0'),(248,'Burger','Classic Cheeseburger',9.99,15,_binary ''),(249,'Sandwich','BBQ Pulled Pork Sandwich',11.99,15,_binary ''),(250,'Main Course','Chicken and Waffles',12.99,15,_binary '\0'),(251,'Side Dish','Mac and Cheese',8.99,15,_binary '\0'),(252,'Main Course','Fried Chicken',13.99,15,_binary '\0'),(253,'Salad','Cobb Salad',10.99,15,_binary '\0'),(254,'Appetizer','Buffalo Wings',9.99,15,_binary '\0'),(255,'Sandwich','Philly Cheesesteak',11.99,15,_binary ''),(256,'Beverage','Milkshake',6.99,15,_binary '\0'),(257,'Dessert','Apple Pie',7.99,15,_binary '\0'),(258,'Risotto','Risotto al Frutti di Mare',16.99,20,_binary '\0'),(259,'Main Course','Melanzane alla Parmigiana',13.99,20,_binary '\0'),(260,'Appetizer','Carpaccio di Manzo',11.49,20,_binary '\0'),(261,'Dessert','Panna Cotta',8.49,20,_binary '\0'),(262,'Pasta','Tagliatelle ai Funghi Porcini',15.99,20,_binary '\0'),(263,'Salad','Caprese Salad',9.99,20,_binary '\0'),(264,'Pasta','Fettuccine Alfredo',14.99,20,_binary '\0'),(265,'Main Course','Pollo alla Griglia',17.99,20,_binary '\0'),(266,'Dessert','Gelato alla Vaniglia',6.49,20,_binary '\0'),(267,'Appetizer','Calamari Fritti',10.99,20,_binary '\0');
/*!40000 ALTER TABLE `dish` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dish_to_delivery`
--

DROP TABLE IF EXISTS `dish_to_delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dish_to_delivery` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `delivery_id` int DEFAULT NULL,
  `dish_id` int DEFAULT NULL,
  `added_ingredients` varchar(255) DEFAULT NULL,
  `removed_ingredients` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKsgiol7tokdn92sl0llgnn6wf8` (`delivery_id`),
  KEY `FKjo7bmscs38sea8syop0v5x8sj` (`dish_id`),
  CONSTRAINT `FKjo7bmscs38sea8syop0v5x8sj` FOREIGN KEY (`dish_id`) REFERENCES `dish` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `FKsgiol7tokdn92sl0llgnn6wf8` FOREIGN KEY (`delivery_id`) REFERENCES `delivery` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dish_to_delivery`
--

LOCK TABLES `dish_to_delivery` WRITE;
/*!40000 ALTER TABLE `dish_to_delivery` DISABLE KEYS */;
INSERT INTO `dish_to_delivery` VALUES (1,1,NULL,6,'',NULL),(2,1,NULL,57,'',NULL),(3,1,NULL,1,'',NULL),(4,1,NULL,4,'',NULL),(5,1,NULL,6,'',NULL),(6,1,NULL,57,'',NULL),(7,1,NULL,1,'',NULL),(8,1,NULL,15,'',NULL),(9,4,NULL,3,'',NULL),(10,2,NULL,61,'',NULL),(11,1,NULL,9,'ketchup,mustard,garlic',NULL),(12,1,5,8,'',NULL),(13,3,5,61,'',NULL),(14,1,6,214,'',NULL),(15,1,6,215,'',NULL),(16,1,6,210,'',NULL),(17,4,7,19,'',NULL);
/*!40000 ALTER TABLE `dish_to_delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_types`
--

DROP TABLE IF EXISTS `food_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food_types` (
  `restaurant_id` int DEFAULT NULL,
  `food_type` varchar(255) NOT NULL,
  KEY `FKfvypbp8sw4rojk8quafvd3gju` (`restaurant_id`),
  CONSTRAINT `FKfvypbp8sw4rojk8quafvd3gju` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_types`
--

LOCK TABLES `food_types` WRITE;
/*!40000 ALTER TABLE `food_types` DISABLE KEYS */;
INSERT INTO `food_types` VALUES (1,'Italian'),(1,'Pasta'),(8,'Mexican'),(8,'Tacos'),(5,'American'),(5,'Burgers'),(5,'Desserts'),(11,'Glutenfree'),(11,'Vegan'),(7,'Grill'),(10,'Kebab'),(7,'Fish'),(17,'Vegan'),(17,'Vegetarian'),(4,'Salads'),(3,'Pizza'),(17,'Poke'),(9,'Sushi'),(15,'Japanese'),(5,'Steakhouse'),(16,'Thai'),(9,'Chinese'),(9,'Noodles'),(2,'Sushi'),(12,'Fish'),(12,'Pasta'),(2,'Japanese'),(3,'Italian'),(22,'Kebab'),(10,'Greek'),(15,'Sushi'),(24,'Chinese'),(24,'Sushi'),(25,'Mexican'),(25,'Tacos'),(26,'Sushi'),(26,'Japanese'),(26,'Chinese'),(1,'Italian'),(3,'Italian'),(29,'Italian'),(37,'Italian'),(3,'Pasta'),(12,'Pasta'),(39,'Pasta'),(8,'Mexican'),(25,'Mexican'),(34,'Mexican'),(44,'Mexican'),(8,'Tacos'),(25,'Tacos'),(34,'Tacos'),(5,'American'),(18,'American'),(31,'American'),(41,'American'),(5,'Burgers'),(18,'Burgers'),(31,'Burgers'),(41,'Burgers'),(18,'Desserts'),(11,'Glutenfree'),(17,'Glutenfree'),(11,'Vegan'),(17,'Vegan'),(26,'Vegan'),(7,'Grill'),(33,'Grill'),(22,'Kebab'),(40,'Kebab'),(7,'Fish'),(12,'Fish'),(23,'Fish'),(27,'Fish'),(43,'Fish'),(4,'Salads'),(17,'Salads'),(3,'Pizza'),(29,'Pizza'),(37,'Pizza'),(39,'Pizza'),(17,'Poke'),(2,'Sushi'),(8,'Sushi'),(15,'Sushi'),(26,'Sushi'),(28,'Sushi'),(15,'Japanese'),(16,'Japanese'),(26,'Japanese'),(5,'Steakhouse'),(4,'Thai'),(16,'Thai'),(30,'Thai'),(9,'Chinese'),(24,'Chinese'),(29,'Chinese'),(40,'Chinese'),(9,'Noodles'),(10,'Greek'),(22,'Greek'),(36,'Greek'),(17,'Vegetarian'),(19,'Spanish'),(19,'Tapas'),(15,'Sushi'),(26,'Sushi'),(28,'Sushi'),(15,'Japanese'),(26,'Japanese'),(24,'Chinese'),(26,'Chinese');
/*!40000 ALTER TABLE `food_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredients`
--

DROP TABLE IF EXISTS `ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredients` (
  `dish_id` int DEFAULT NULL,
  `ingredient` varchar(255) NOT NULL,
  KEY `FKih1s8a6pgptfc8dhmlvrf6whf` (`dish_id`),
  CONSTRAINT `FKih1s8a6pgptfc8dhmlvrf6whf` FOREIGN KEY (`dish_id`) REFERENCES `dish` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredients`
--

LOCK TABLES `ingredients` WRITE;
/*!40000 ALTER TABLE `ingredients` DISABLE KEYS */;
INSERT INTO `ingredients` VALUES (1,'pasta'),(1,'uova'),(1,'guanciale'),(1,'pecorino'),(2,'pizza dough'),(2,'tomato sauce'),(2,'mozzarella cheese'),(2,'basil'),(1,'guanciale'),(1,'pecorino'),(2,'pizza dough'),(2,'tomato sauce'),(2,'mozzarella cheese'),(2,'basil'),(3,'romaine lettuce'),(3,'croutons'),(3,'parmesan cheese'),(3,'caesar dressing'),(4,'chicken'),(4,'fettuccine'),(4,'alfredo sauce'),(4,'garlic'),(5,'ground beef patty'),(5,'sesame seed bun'),(5,'lettuce'),(5,'tomato'),(6,'arborio rice'),(6,'mushrooms'),(6,'chicken or vegetable broth'),(6,'white wine'),(7,'salmon fillet'),(7,'olive oil'),(7,'lemon'),(7,'garlic'),(8,'ladyfingers'),(8,'coffee'),(8,'eggs'),(8,'sugar'),(9,'mozzarella cheese'),(9,'tomato'),(9,'basil'),(9,'balsamic glaze'),(10,'steak'),(10,'french fries'),(10,'salad'),(10,'béarnaise sauce'),(11,'rice'),(11,'nori seaweed'),(11,'fish or seafood'),(11,'vegetables'),(12,'chicken thighs'),(12,'yogurt'),(12,'spices'),(12,'tomato sauce'),(13,'chicken'),(13,'tomato sauce'),(13,'spices'),(13,'cream'),(14,'rice noodles'),(14,'bean sprouts'),(14,'peanuts'),(14,'egg'),(15,'beef'),(15,'taco shells'),(15,'lettuce'),(15,'tomato'),(16,'eggplant'),(16,'mozzarella cheese'),(16,'tomato sauce'),(16,'parmesan cheese'),(17,'rice noodles'),(17,'beef or chicken broth'),(17,'bean sprouts'),(17,'lime'),(18,'pork ribs'),(18,'barbecue sauce'),(18,'spices'),(18,'cornbread'),(19,'assorted vegetables'),(19,'soy sauce'),(19,'ginger'),(19,'garlic'),(20,'lasagna noodles'),(20,'ground beef'),(20,'tomato sauce'),(20,'ricotta cheese'),(72,'Salmon'),(72,'Rice'),(72,'Nori seaweed'),(73,'Tuna'),(73,'Rice'),(73,'Wasabi'),(74,'Crab meat'),(74,'Avocado'),(74,'Cucumber'),(74,'Spicy tuna'),(74,'Avocado'),(75,'Cucumber'),(75,'Eel'),(75,'Avocado'),(75,'Cucumber'),(76,'Assorted fish'),(76,'Avocado'),(76,'Cucumber'),(77,'Tempura shrimp'),(77,'Avocado'),(77,'Cucumber'),(63,'Salmon'),(63,'Rice'),(63,'Nori seaweed'),(63,'Tuna'),(57,'Fettuccine pasta'),(57,'Heavy cream'),(57,'Butter'),(57,'Parmesan cheese'),(57,'Garlic'),(57,'Pepper'),(61,'Dark chocolate'),(61,'Butter'),(61,'Eggs'),(61,'Sugar'),(61,'Flour'),(61,'Vanilla extract'),(68,'Lasagna noodles'),(68,'Spinach'),(68,'Ricotta cheese'),(68,'Mozzarella cheese'),(68,'Parmesan cheese'),(68,'Tomato sauce'),(68,'Garlic'),(68,'Olive oil'),(68,'Pepper'),(6,'Rice'),(6,'Mushrooms'),(6,'Chicken or vegetable broth'),(6,'Onion'),(6,'Garlic'),(6,'Butter'),(6,'Parmesan cheese'),(6,'Parsley'),(6,'Pepper'),(82,'Tomato sauce'),(82,'Mozzarella cheese'),(82,'Basil'),(82,'Olive oil'),(82,'Pepper'),(83,'Tomato sauce'),(83,'Mozzarella cheese'),(83,'Ham'),(83,'Artichokes'),(83,'Mushrooms'),(83,'Olives'),(83,'Oregano'),(83,'Olive oil'),(83,'Pepper'),(84,'Tomato sauce'),(84,'Mozzarella cheese'),(84,'Ham'),(84,'Mushrooms'),(84,'Artichokes'),(84,'Olives'),(84,'Oregano'),(84,'Olive oil'),(84,'Pepper'),(85,'Tomato sauce'),(85,'Mozzarella cheese'),(85,'Spicy salami'),(85,'Chili flakes'),(85,'Olive oil'),(85,'Pepper'),(86,'Mozzarella cheese'),(86,'Gorgonzola cheese'),(86,'Fontina cheese'),(86,'Parmesan cheese'),(86,'Olive oil'),(86,'Pepper'),(87,'Tomato sauce'),(87,'Mozzarella cheese'),(87,'Ham'),(87,'Pineapple'),(87,'Olive oil'),(87,'Pepper'),(88,'Sea bass fillet'),(88,'Lemon'),(88,'Garlic'),(88,'Olive oil'),(88,'Pepper'),(89,'Lobster tail'),(89,'Linguine pasta'),(89,'Tomato sauce'),(89,'Garlic'),(89,'Olive oil'),(89,'Basil'),(89,'Pepper'),(90,'Shrimp'),(90,'Linguine pasta'),(90,'Butter'),(90,'Garlic'),(90,'White wine'),(90,'Lemon'),(90,'Parsley'),(90,'Pepper'),(91,'Assorted seafood (e.g., shrimp, clams, mussels, fish)'),(91,'Tomato sauce'),(91,'White wine'),(91,'Garlic'),(91,'Onion'),(91,'Olive oil'),(91,'Basil'),(91,'Pepper'),(92,'Rice'),(92,'Assorted seafood (e.g., shrimp, mussels, clams, squid)'),(92,'Tomato'),(92,'Peas'),(92,'Bell pepper'),(92,'Onion'),(92,'Garlic'),(92,'Saffron'),(92,'Olive oil'),(92,'Pepper'),(93,'Crab meat'),(93,'Breadcrumbs'),(93,'Mayonnaise'),(93,'Dijon mustard'),(93,'Worcestershire sauce'),(93,'Egg'),(93,'Parsley'),(93,'Lemon'),(93,'Pepper'),(94,'Mussels'),(94,'Tomato sauce'),(94,'White wine'),(94,'Garlic'),(94,'Onion'),(94,'Olive oil'),(94,'Basil'),(94,'Pepper'),(95,'Octopus'),(95,'Lemon'),(95,'Olive oil'),(95,'Garlic'),(95,'Oregano'),(95,'Pepper'),(96,'Ahi tuna'),(96,'Soy sauce'),(96,'Sesame oil'),(96,'Green onion'),(96,'Sesame seeds'),(96,'Lime'),(96,'Avocado'),(96,'Cilantro'),(96,'Pepper'),(97,'White fish fillet (e.g., cod, tilapia)'),(97,'Tortillas'),(97,'Cabbage slaw'),(97,'Avocado'),(97,'Tomato'),(97,'Lime'),(97,'Cilantro'),(97,'Sour cream'),(97,'Chipotle sauce'),(97,'Pepper'),(98,'Fettine di manzo'),(98,'Arancia'),(98,'Salsa di soia'),(98,'Zucchero'),(98,'Zenzero'),(98,'Aglio'),(98,'Amido di mais'),(98,'Olio di sesamo'),(99,'Petto di pollo'),(99,'Mandorle'),(99,'Salsa di soia'),(99,'Zenzero'),(99,'Aglio'),(99,'Cipolla'),(99,'Amido di mais'),(99,'Olio di sesamo'),(100,'Carne di maiale'),(100,'Peperoni'),(100,'Ananas'),(100,'Aceto di riso'),(100,'Zucchero'),(100,'Ketchup'),(100,'Salsa di soia'),(100,'Amido di mais'),(101,'Anatra'),(101,'Zenzero'),(101,'Aglio'),(101,'Cipolla'),(101,'Salsa di soia'),(101,'Aceto di riso'),(101,'Zucchero'),(101,'Amido di mais'),(102,'Gamberetti'),(102,'Peperoncino'),(102,'Zenzero'),(102,'Aglio'),(102,'Cipolla'),(102,'Salsa di soia'),(102,'Olio di sesamo'),(102,'Aceto di riso'),(103,'Carne di maiale'),(103,'Cipolla'),(103,'Aglio'),(103,'Salsa di soia'),(103,'Zenzero'),(103,'Pasta per ravioli'),(104,'Tofu'),(104,'Alga nori'),(104,'Miso'),(104,'Brodo di pesce'),(104,'Cipollotto'),(104,'Zucchero'),(105,'Alghe wakame'),(105,'Salsa di soia'),(105,'Aceto di riso'),(105,'Olio di sesamo'),(105,'Semi di sesamo'),(105,'Zucchero'),(106,'Tofu'),(106,'Verdure miste'),(106,'Salsa di soia'),(106,'Zenzero'),(106,'Aglio'),(106,'Olio di sesamo'),(98,'Pork or chicken skewers'),(98,'Olive oil'),(98,'Lemon juice'),(98,'Garlic'),(98,'Oregano'),(98,'Pepper'),(99,'Eggplant'),(99,'Ground lamb or beef'),(99,'Potatoes'),(99,'Tomatoes'),(99,'Onion'),(99,'Garlic'),(99,'Cinnamon'),(99,'Nutmeg'),(99,'Béchamel sauce'),(99,'Olive oil'),(99,'Pepper'),(100,'Grape leaves'),(100,'Rice'),(100,'Tomatoes'),(100,'Onion'),(100,'Dill'),(100,'Mint'),(100,'Lemon juice'),(100,'Olive oil'),(100,'Pepper'),(101,'Phyllo dough'),(101,'Spinach'),(101,'Feta cheese'),(101,'Onion'),(101,'Egg'),(101,'Dill'),(101,'Olive oil'),(101,'Pepper'),(102,'Gyro meat'),(102,'Pita bread'),(102,'Tomato'),(102,'Onion'),(102,'Tzatziki sauce'),(103,'Lettuce'),(103,'Tomato'),(103,'Cucumber'),(103,'Red onion'),(103,'Kalamata olives'),(103,'Feta cheese'),(103,'Olive oil'),(103,'Red wine vinegar'),(103,'Oregano'),(103,'Pepper'),(104,'Greek yogurt'),(104,'Cucumber'),(104,'Garlic'),(104,'Lemon juice'),(104,'Dill'),(104,'Olive oil'),(104,'Pepper'),(105,'Phyllo dough'),(105,'Walnuts'),(105,'Almonds'),(105,'Cloves'),(105,'Cinnamon'),(105,'Sugar'),(105,'Butter'),(105,'Honey'),(106,'Kefalograviera cheese'),(106,'Flour'),(106,'Olive oil'),(106,'Lemon juice'),(98,'Pork or chicken skewers'),(98,'Olive oil'),(98,'Lemon juice'),(98,'Garlic'),(98,'Oregano'),(98,'Pepper'),(99,'Eggplant'),(99,'Ground lamb or beef'),(99,'Potatoes'),(99,'Tomatoes'),(99,'Onion'),(99,'Garlic'),(99,'Cinnamon'),(99,'Nutmeg'),(99,'Béchamel sauce'),(99,'Olive oil'),(99,'Pepper'),(100,'Grape leaves'),(100,'Rice'),(100,'Tomatoes'),(100,'Onion'),(100,'Dill'),(100,'Mint'),(100,'Lemon juice'),(100,'Olive oil'),(100,'Pepper'),(101,'Phyllo dough'),(101,'Spinach'),(101,'Feta cheese'),(101,'Onion'),(101,'Egg'),(101,'Dill'),(101,'Olive oil'),(101,'Pepper'),(102,'Gyro meat'),(102,'Pita bread'),(102,'Tomato'),(102,'Onion'),(102,'Tzatziki sauce'),(103,'Lettuce'),(103,'Tomato'),(103,'Cucumber'),(103,'Red onion'),(103,'Kalamata olives'),(103,'Feta cheese'),(103,'Olive oil'),(103,'Red wine vinegar'),(103,'Oregano'),(103,'Pepper'),(104,'Greek yogurt'),(104,'Cucumber'),(104,'Garlic'),(104,'Lemon juice'),(104,'Dill'),(104,'Olive oil'),(104,'Pepper'),(105,'Phyllo dough'),(105,'Walnuts'),(105,'Almonds'),(105,'Cloves'),(105,'Cinnamon'),(105,'Sugar'),(105,'Butter'),(105,'Honey'),(106,'Kefalograviera cheese'),(106,'Flour'),(106,'Olive oil'),(106,'Lemon juice'),(107,'Pasta'),(107,'Ground beef'),(107,'Tomato sauce'),(107,'Onion'),(107,'Garlic'),(107,'Cinnamon'),(107,'Nutmeg'),(107,'Béchamel sauce'),(107,'Grated'),(117,'Quinoa'),(117,'Cherry tomatoes'),(117,'Cucumber'),(117,'Red onion'),(117,'Kalamata olives'),(117,'Fresh parsley'),(117,'Lemon juice'),(117,'Olive oil'),(117,'Black pepper'),(118,'Vegan burger patty'),(118,'Whole wheat bun'),(118,'Lettuce'),(118,'Tomato'),(118,'Red onion'),(118,'Pickles'),(118,'Ketchup'),(118,'Mustard'),(118,'Black pepper'),(119,'Chickpeas'),(119,'Coconut milk'),(119,'Onion'),(119,'Garlic'),(119,'Ginger'),(119,'Tomato'),(119,'Curry powder'),(119,'Turmeric'),(119,'Cumin'),(119,'Coriander'),(120,'Bell peppers'),(120,'Quinoa'),(120,'Black beans'),(120,'Corn'),(120,'Tomato sauce'),(120,'Onion'),(120,'Garlic'),(120,'Cumin'),(120,'Chili powder'),(120,'Black pepper'),(121,'Pizza dough'),(121,'Tomato sauce'),(121,'Vegan cheese'),(121,'Mushrooms'),(121,'Bell peppers'),(121,'Red onion'),(121,'Black olives'),(121,'Artichoke hearts'),(121,'Fresh basil'),(121,'Oregano'),(122,'Tofu'),(122,'Broccoli'),(122,'Carrots'),(122,'Bell peppers'),(122,'Snap peas'),(122,'Onion'),(122,'Garlic'),(122,'Ginger'),(122,'Soy sauce'),(122,'Sesame oil'),(122,'Rice vinegar'),(123,'Sushi rice'),(123,'Nori seaweed'),(123,'Tofu'),(123,'Cucumber'),(123,'Avocado'),(123,'Carrots'),(123,'Soy sauce'),(123,'Wasabi'),(123,'Pickled ginger'),(124,'Zucchini'),(124,'Cherry tomatoes'),(124,'Basil pesto'),(124,'Pine nuts'),(124,'Nutritional yeast'),(124,'Garlic'),(124,'Olive oil'),(124,'Black pepper'),(125,'Macaroni pasta'),(125,'Cashews'),(125,'Nutritional yeast'),(125,'Lemon juice'),(125,'Garlic powder'),(125,'Onion powder'),(125,'Turmeric'),(125,'Black pepper'),(126,'Whole wheat wrap'),(126,'Roasted vegetables (bell peppers, zucchini, eggplant)'),(126,'Hummus'),(126,'Baby spinach'),(126,'Sun-dried tomatoes'),(126,'Kalamata olives'),(126,'Black pepper'),(127,'Romaine lettuce'),(127,'Tomatoes'),(127,'Cucumbers'),(127,'Red onion'),(127,'Kalamata olives'),(127,'Feta cheese'),(127,'Olive oil'),(127,'Red wine vinegar'),(127,'Dried oregano'),(127,'Black pepper'),(128,'Hummus'),(128,'Baba ganoush'),(128,'Tzatziki'),(128,'Pita bread'),(128,'Olives'),(128,'Cucumber slices'),(128,'Cherry tomatoes'),(128,'Feta cheese'),(128,'Olive oil'),(128,'Lemon juice'),(128,'Dried oregano'),(129,'Falafel balls'),(129,'Whole wheat wrap'),(129,'Lettuce'),(129,'Tomatoes'),(129,'Red onion'),(129,'Cucumber'),(129,'Tahini sauce'),(129,'Black pepper'),(130,'Eggplant'),(130,'Potatoes'),(130,'Ground lamb'),(130,'Onion'),(130,'Garlic'),(130,'Tomatoes'),(130,'Red wine'),(130,'All-purpose flour'),(130,'Milk'),(130,'Butter'),(130,'Nutmeg'),(131,'Lamb chops'),(131,'Olive oil'),(131,'Lemon juice'),(131,'Garlic'),(131,'Dried oregano'),(131,'Black pepper'),(132,'Arborio rice'),(132,'Shrimp'),(132,'Mussels'),(132,'Clams'),(132,'Calamari'),(132,'Chorizo sausage'),(132,'Tomatoes'),(132,'Bell pepper'),(132,'Onion'),(132,'Garlic'),(132,'Saffron'),(133,'Ciabatta bread'),(133,'Fresh mozzarella'),(133,'Tomato slices'),(133,'Fresh basil leaves'),(133,'Balsamic glaze'),(133,'Olive oil'),(133,'Black pepper'),(134,'Couscous'),(134,'Cherry tomatoes'),(134,'Cucumber'),(134,'Red onion'),(134,'Parsley'),(134,'Mint'),(134,'Lemon juice'),(134,'Olive oil'),(134,'Black pepper'),(135,'Shrimp'),(135,'Garlic'),(135,'Lemon juice'),(135,'Olive oil'),(135,'Parsley'),(135,'Black pepper'),(136,'Phyllo dough'),(136,'Walnuts'),(136,'Almonds'),(136,'Sugar'),(136,'Cinnamon'),(136,'Cloves'),(136,'Honey'),(136,'Water'),(136,'Lemon juice'),(137,'Shrimp'),(137,'Lemongrass'),(137,'Galangal'),(137,'Kaffir lime leaves'),(137,'Thai chili peppers'),(137,'Mushrooms'),(137,'Tomato'),(137,'Fish sauce'),(137,'Lime juice'),(137,'Cilantro'),(138,'Rice noodles'),(138,'Shrimp'),(138,'Tofu'),(138,'Bean sprouts'),(138,'Egg'),(138,'Garlic'),(138,'Shallots'),(138,'Green onions'),(138,'Peanuts'),(138,'Tamarind sauce'),(139,'Chicken'),(139,'Green curry paste'),(139,'Coconut milk'),(139,'Thai eggplant'),(139,'Bamboo shoots'),(139,'Red bell pepper'),(139,'Thai basil leaves'),(139,'Fish sauce'),(139,'Palm sugar'),(140,'Sticky rice'),(140,'Mango'),(140,'Coconut milk'),(140,'Sugar'),(140,'Sesame seeds'),(141,'Cooked rice'),(141,'Pineapple'),(141,'Shrimp'),(141,'Cashews'),(141,'Onion'),(141,'Carrots'),(141,'Green peas'),(141,'Garlic'),(141,'Soy sauce'),(142,'Beef'),(142,'Massaman curry paste'),(142,'Coconut milk'),(142,'Potatoes'),(142,'Onion'),(142,'Peanuts'),(142,'Cinnamon'),(142,'Star anise'),(142,'Palm sugar'),(143,'Green papaya'),(143,'Tomato'),(143,'Green beans'),(143,'Thai chili peppers'),(143,'Garlic'),(143,'Fish sauce'),(143,'Lime juice'),(143,'Palm sugar'),(143,'Peanuts'),(144,'Rice paper wrappers'),(144,'Shrimp'),(144,'Rice vermicelli'),(144,'Lettuce'),(144,'Mint leaves'),(144,'Cilantro'),(144,'Thai basil leaves'),(144,'Bean sprouts'),(144,'Peanut dipping sauce'),(145,'Green papaya'),(145,'Tomato'),(145,'Green beans'),(145,'Thai chili peppers'),(145,'Garlic'),(145,'Fish sauce'),(145,'Lime juice'),(145,'Palm sugar'),(145,'Peanuts'),(146,'Chicken'),(146,'Coconut milk'),(146,'Galangal'),(146,'Lemongrass'),(146,'Kaffir lime leaves'),(146,'Mushrooms'),(146,'Fish sauce'),(146,'Lime juice'),(146,'Cilantro'),(148,'Duck'),(148,'Hoisin sauce'),(148,'Cucumber'),(148,'Green onions'),(148,'Pancakes'),(149,'Chicken'),(149,'Peanuts'),(149,'Dried red chili peppers'),(149,'Garlic'),(149,'Ginger'),(149,'Green onions'),(149,'Soy sauce'),(149,'Sesame oil'),(150,'Shrimp dumplings'),(150,'Pork dumplings'),(150,'Chicken feet'),(150,'Sticky rice in lotus leaf'),(150,'Spring rolls'),(150,'Turnip cakes'),(150,'Siu mai'),(150,'Egg custard tarts'),(151,'Tofu'),(151,'Ground pork'),(151,'Sichuan peppercorns'),(151,'Chili bean paste'),(151,'Garlic'),(151,'Ginger'),(151,'Green onions'),(151,'Soy sauce'),(151,'Sesame oil'),(152,'Pork'),(152,'Bell peppers'),(152,'Pineapple'),(152,'Onion'),(152,'Tomato sauce'),(152,'Sugar'),(152,'Vinegar'),(152,'Cornstarch'),(153,'Shrimp'),(153,'Peanuts'),(153,'Dried red chili peppers'),(153,'Garlic'),(153,'Ginger'),(153,'Green onions'),(153,'Soy sauce'),(153,'Sesame oil'),(154,'Beef'),(154,'Egg noodles'),(154,'Onion'),(154,'Celery'),(154,'Carrots'),(154,'Bean sprouts'),(154,'Green onions'),(154,'Soy sauce'),(155,'Eggs'),(155,'Shrimp'),(155,'Bean sprouts'),(155,'Onion'),(155,'Bell peppers'),(155,'Green onions'),(155,'Soy sauce'),(156,'Chicken broth'),(156,'Tofu'),(156,'Bamboo shoots'),(156,'Wood ear mushrooms'),(156,'Shiitake mushrooms'),(156,'Eggs'),(156,'Vinegar'),(156,'Soy sauce'),(157,'Chicken'),(157,'Cornstarch'),(157,'Garlic'),(157,'Ginger'),(157,'Dried red chili peppers'),(157,'Green onions'),(157,'Soy sauce'),(157,'Sugar'),(168,'Duck'),(168,'Hoisin sauce'),(168,'Cucumber'),(168,'Green onions'),(168,'Pancakes'),(169,'Chicken'),(169,'Peanuts'),(169,'Dried red chili peppers'),(169,'Garlic'),(169,'Ginger'),(169,'Green onions'),(169,'Soy sauce'),(169,'Sesame oil'),(170,'Shrimp dumplings'),(170,'Pork dumplings'),(170,'Chicken feet'),(170,'Sticky rice in lotus leaf'),(170,'Spring rolls'),(170,'Turnip cakes'),(170,'Siu mai'),(170,'Egg custard tarts'),(171,'Tofu'),(171,'Ground pork'),(171,'Sichuan peppercorns'),(171,'Chili bean paste'),(171,'Garlic'),(171,'Ginger'),(171,'Green onions'),(171,'Soy sauce'),(171,'Sesame oil'),(172,'Pork'),(172,'Bell peppers'),(172,'Pineapple'),(172,'Onion'),(172,'Tomato sauce'),(172,'Sugar'),(172,'Vinegar'),(172,'Cornstarch'),(173,'Shrimp'),(173,'Peanuts'),(173,'Dried red chili peppers'),(173,'Garlic'),(173,'Ginger'),(173,'Green onions'),(173,'Soy sauce'),(173,'Sesame oil'),(174,'Beef'),(174,'Egg noodles'),(174,'Onion'),(174,'Celery'),(174,'Carrots'),(174,'Bean sprouts'),(174,'Green onions'),(174,'Soy sauce'),(175,'Eggs'),(175,'Shrimp'),(175,'Bean sprouts'),(175,'Onion'),(175,'Bell peppers'),(175,'Green onions'),(175,'Soy sauce'),(176,'Chicken broth'),(176,'Tofu'),(176,'Bamboo shoots'),(176,'Wood ear mushrooms'),(176,'Shiitake mushrooms'),(176,'Eggs'),(176,'Vinegar'),(176,'Soy sauce'),(177,'Chicken'),(177,'Cornstarch'),(177,'Garlic'),(177,'Ginger'),(177,'Dried red chili peppers'),(177,'Green onions'),(177,'Soy sauce'),(177,'Sugar'),(108,'Pork'),(108,'Pita bread'),(108,'Tomato'),(108,'Onion'),(108,'Tzatziki sauce'),(109,'Eggplant'),(109,'Ground beef'),(109,'Potatoes'),(109,'Tomato sauce'),(109,'Bechamel sauce'),(109,'Onion'),(109,'Garlic'),(109,'Olive oil'),(110,'Chicken'),(110,'Pork'),(110,'Beef'),(110,'Pita bread'),(110,'Tomato'),(110,'Onion'),(110,'Tzatziki sauce'),(111,'Lettuce'),(111,'Tomato'),(111,'Cucumber'),(111,'Red onion'),(111,'Kalamata olives'),(111,'Feta cheese'),(111,'Olive oil'),(111,'Red wine vinegar'),(111,'Dried oregano'),(190,'Salmon'),(190,'Tuna'),(190,'Shrimp'),(190,'Rice'),(190,'Nori seaweed'),(190,'Wasabi'),(190,'Soy sauce'),(190,'Pickled ginger'),(191,'Salmon'),(191,'Tuna'),(191,'Yellowtail'),(191,'Wasabi'),(191,'Soy sauce'),(191,'Pickled ginger'),(192,'Shrimp'),(192,'Tempura batter'),(192,'Vegetable oil'),(192,'Soy sauce'),(192,'Tempura dipping sauce'),(193,'Chicken'),(193,'Teriyaki sauce'),(193,'Green onions'),(193,'Sesame seeds'),(193,'Rice'),(194,'Dashi broth'),(194,'Tofu'),(194,'Green onions'),(194,'Wakame seaweed'),(194,'Miso paste'),(195,'Chicken thighs'),(195,'Soy sauce'),(195,'Sake'),(195,'Sugar'),(195,'Green onions'),(196,'Crab meat'),(196,'Avocado'),(196,'Cucumber'),(196,'Rice'),(196,'Nori seaweed'),(196,'Sesame seeds'),(196,'Wasabi'),(196,'Soy sauce'),(196,'Pickled ginger'),(197,'Udon noodles'),(197,'Chicken broth'),(197,'Fish cake'),(197,'Green onions'),(197,'Shiitake mushrooms'),(197,'Narutomaki'),(197,'Kombu seaweed'),(188,'Salmon'),(188,'Tuna'),(188,'Shrimp'),(188,'Rice'),(188,'Nori seaweed'),(188,'Wasabi'),(188,'Soy sauce'),(188,'Pickled ginger'),(189,'Salmon'),(189,'Tuna'),(189,'Yellowtail'),(189,'Wasabi'),(189,'Soy sauce'),(189,'Pickled ginger'),(190,'Shrimp'),(190,'Tempura batter'),(190,'Vegetable oil'),(190,'Soy sauce'),(190,'Tempura dipping sauce'),(191,'Chicken'),(191,'Teriyaki sauce'),(191,'Green onions'),(191,'Sesame seeds'),(191,'Rice'),(192,'Dashi broth'),(192,'Tofu'),(192,'Green onions'),(192,'Wakame seaweed'),(192,'Miso paste'),(193,'Chicken thighs'),(193,'Soy sauce'),(193,'Sake'),(193,'Sugar'),(193,'Green onions'),(194,'Crab meat'),(194,'Avocado'),(194,'Cucumber'),(194,'Rice'),(194,'Nori seaweed'),(194,'Sesame seeds'),(194,'Wasabi'),(194,'Soy sauce'),(194,'Pickled ginger'),(195,'Udon noodles'),(195,'Chicken broth'),(195,'Fish cake'),(195,'Green onions'),(195,'Shiitake mushrooms'),(195,'Narutomaki'),(195,'Kombu seaweed'),(196,'Pork cutlet'),(196,'Panko breadcrumbs'),(196,'Egg'),(196,'Flour'),(196,'Cabbage'),(196,'Tonkatsu sauce'),(196,'Rice'),(197,'Matcha powder'),(197,'Heavy cream'),(197,'Whole milk'),(197,'Sugar'),(197,'Egg yolks'),(208,'Rice'),(208,'Chicken'),(208,'Rabbit'),(208,'Saffron'),(208,'Peas'),(208,'Bell peppers'),(208,'Tomato'),(208,'Onion'),(208,'Garlic'),(208,'Olive oil'),(209,'Potatoes'),(209,'Eggs'),(209,'Onion'),(209,'Olive oil'),(210,'Tomatoes'),(210,'Cucumber'),(210,'Bell pepper'),(210,'Onion'),(210,'Garlic'),(210,'Bread'),(210,'Olive oil'),(210,'Sherry vinegar'),(211,'Octopus'),(211,'Potatoes'),(211,'Paprika'),(211,'Olive oil'),(212,'Potatoes'),(212,'Spicy tomato sauce'),(212,'Garlic aioli'),(213,'Iberian ham'),(214,'Flour'),(214,'Water'),(214,'Sugar'),(214,'Cinnamon'),(214,'Chocolate sauce'),(215,'Milk'),(215,'Egg yolks'),(215,'Sugar'),(215,'Cornstarch'),(215,'Cinnamon'),(215,'Lemon peel'),(216,'Shrimp'),(216,'Garlic'),(216,'Olive oil'),(216,'Chili flakes'),(216,'Parsley'),(217,'Squid rings'),(217,'Flour'),(217,'Egg'),(217,'Lemon wedges'),(218,'Quinoa'),(218,'Mixed greens'),(218,'Cherry tomatoes'),(218,'Cucumber'),(218,'Red onion'),(218,'Feta cheese'),(218,'Kalamata olives'),(218,'Lemon juice'),(218,'Olive oil'),(218,'Pepper'),(219,'Bread'),(219,'Avocado'),(219,'Cherry tomatoes'),(219,'Red pepper flakes'),(219,'Pepper'),(219,'Lemon juice'),(220,'Salmon fillet'),(220,'Mixed greens'),(220,'Cucumber'),(220,'Avocado'),(220,'Cherry tomatoes'),(220,'Red onion'),(220,'Lemon juice'),(220,'Olive oil'),(220,'Pepper'),(221,'Assorted vegetables (bell peppers, broccoli, carrots, snap peas)'),(221,'Soy sauce'),(221,'Sesame oil'),(221,'Garlic'),(221,'Ginger'),(221,'Red pepper flakes'),(221,'Pepper'),(222,'Acai puree'),(222,'Banana'),(222,'Mixed berries'),(222,'Granola'),(222,'Coconut flakes'),(222,'Honey'),(222,'Almond butter'),(223,'Spinach'),(223,'Kale'),(223,'Banana'),(223,'Apple'),(223,'Almond milk'),(223,'Chia seeds'),(224,'Sweet potatoes'),(224,'Olive oil'),(224,'Paprika'),(224,'Garlic'),(227,'Cilantro'),(227,'Lime juice'),(227,'Cumin'),(227,'Chili powder'),(227,'Pepper'),(238,'Pork'),(238,'Pineapple'),(238,'Corn tortillas'),(238,'Onion'),(238,'Cilantro'),(238,'Lime'),(238,'Salsa verde'),(239,'Avocado'),(239,'Tomato'),(239,'Onion'),(239,'Cilantro'),(239,'Lime'),(239,'Jalapeno'),(239,'Pepper'),(240,'Chicken'),(240,'Corn tortillas'),(240,'Green enchilada sauce'),(240,'Cheese'),(240,'Sour cream'),(240,'Lettuce'),(240,'Tomato'),(241,'Poblano peppers'),(241,'Cheese'),(241,'Ground beef'),(241,'Tomato sauce'),(241,'Onion'),(241,'Garlic'),(241,'Cilantro'),(241,'Rice'),(241,'Beans'),(242,'Chicken'),(242,'Mole sauce'),(242,'Rice'),(242,'Tortillas'),(242,'Sesame seeds'),(243,'White fish (tilapia or snapper)'),(243,'Lime juice'),(243,'Tomato'),(243,'Cilantro'),(243,'Onion'),(243,'Avocado'),(243,'Jalapeno'),(243,'Tostada shells'),(244,'Pork shoulder'),(244,'Hominy'),(244,'Onion'),(244,'Garlic'),(244,'Dried chilies'),(244,'Lime'),(244,'Cabbage'),(244,'Radishes'),(245,'Corn on the cob'),(245,'Mayonnaise'),(245,'Chili powder'),(245,'Lime'),(245,'Cotija cheese'),(245,'Cilantro'),(246,'Flour'),(246,'Water'),(246,'Sugar'),(246,'Cinnamon'),(246,'Chocolate sauce'),(247,'Rice'),(247,'Water'),(247,'Cinnamon sticks'),(247,'Sugar'),(247,'Vanilla extract'),(248,'Beef patty'),(248,'Cheddar cheese'),(248,'Lettuce'),(248,'Tomato'),(248,'Onion'),(248,'Pickles'),(248,'Ketchup'),(248,'Mustard'),(248,'Hamburger bun'),(249,'Pulled pork'),(249,'BBQ sauce'),(249,'Coleslaw'),(249,'Hamburger bun'),(250,'Fried chicken'),(250,'Waffles'),(250,'Maple syrup'),(251,'Macaroni'),(251,'Cheddar cheese'),(251,'Milk'),(251,'Flour'),(251,'Butter'),(251,'Breadcrumbs'),(252,'Chicken pieces'),(252,'Flour'),(252,'Eggs'),(252,'Milk'),(252,'Pepper'),(252,'Vegetable oil'),(253,'Lettuce'),(253,'Tomato'),(253,'Chicken breast'),(253,'Hard-boiled eggs'),(253,'Bacon'),(253,'Blue cheese'),(253,'Avocado'),(253,'Red wine vinaigrette'),(254,'Chicken wings'),(254,'Hot sauce'),(254,'Butter'),(254,'Celery sticks'),(254,'Blue cheese dressing'),(255,'Beef steak'),(255,'Onion'),(255,'Green bell pepper'),(255,'Provolone cheese'),(255,'Hoagie roll'),(256,'Ice cream'),(256,'Milk'),(256,'Whipped cream'),(256,'Maraschino cherry'),(257,'Apples'),(257,'Sugar'),(257,'Cinnamon'),(257,'Flour'),(257,'Butter'),(257,'Pie crust');
/*!40000 ALTER TABLE `ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),(21);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant`
--

DROP TABLE IF EXISTS `restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant` (
  `id` int NOT NULL AUTO_INCREMENT,
  `closing_hour` time(6) DEFAULT NULL,
  `delivery_price_per_unit` double DEFAULT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  `max_delivery_distance` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `opening_hour` time(6) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `positionx` int NOT NULL,
  `positiony` int NOT NULL,
  `menu` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKa2up7h6lgjvis5gl3hejuc8c1` (`menu`),
  CONSTRAINT `FKa2up7h6lgjvis5gl3hejuc8c1` FOREIGN KEY (`menu`) REFERENCES `menu` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant`
--

LOCK TABLES `restaurant` WRITE;
/*!40000 ALTER TABLE `restaurant` DISABLE KEYS */;
INSERT INTO `restaurant` VALUES (1,'15:00:00.000000',0.01,'https://i.imgur.com/MiAfenv.jpeg',515,'Ristorante Da Luigino','09:00:00.000000','+39 0123 456789',452,781,1),(2,'23:00:00.000000',0.005,'https://i.imgur.com/hOaUtNC.jpeg',789,'Sushi Bar','11:00:00.000000','+39 0123 987654',245,834,2),(3,'21:30:00.000000',0.004,'https://i.imgur.com/2ihK1gK.jpg',602,'Pizzeria Bella Italia','10:30:00.000000','+39 0123 123456',318,602,3),(4,'22:30:00.000000',0.03,'https://i.imgur.com/YgQYah2.jpeg',378,'Thai Spice','08:30:00.000000','+39 0123 234567',734,125,4),(5,'23:30:00.000000',0.01,'https://i.imgur.com/4tyxoUE.jpg',284,'Burger Joint','10:00:00.000000','+39 0123 345678',83,976,5),(7,'22:00:00.000000',0.006,'https://i.imgur.com/X6154vu.jpeg',972,'Seafood Grill','12:00:00.000000','+39 0123 567890',527,45,7),(8,'23:30:00.000000',0.008,'https://i.imgur.com/A2ZSp7q.jpg',648,'Mexican Cantina','11:30:00.000000','+39 0123 678901',197,998,8),(9,'22:30:00.000000',0.015,'https://i.imgur.com/Ytc6qqw.jpg',405,'Chinese Palace','11:00:00.000000','+39 0123 789012',313,25,9),(10,'23:00:00.000000',0.008,'https://i.imgur.com/4g4Rv9e.jpeg',743,'Greek Taverna','12:00:00.000000','+39 0123 890123',386,249,10),(11,'20:00:00.000000',0.007,'https://i.imgur.com/cu3rAwX.jpg',210,'Vegan Oasis','10:00:00.000000','+39 0123 901234',525,20,6),(12,'22:30:00.000000',0.012,'https://i.imgur.com/MiAfenv.jpeg',766,'Mediterranean Bistro','11:30:00.000000','+39 0123 012345',495,22,17),(15,'23:30:00.000000',0.005,'https://i.imgur.com/ZAC3XpV.jpeg',751,'Japanese Fusion','11:30:00.000000','+39 0123 901234',369,140,12),(16,'22:00:00.000000',0.004,'https://i.imgur.com/YgQYah2.jpeg',851,'Thai Orchid','11:00:00.000000','+39 0123 234567',149,101,14),(17,'21:00:00.000000',0.013,'https://i.imgur.com/Wl9SR7r.jpg',608,'Healthy Haven','09:00:00.000000','+39 0123 567890',34,118,18),(18,'00:00:00.000000',0.005,'https://i.imgur.com/jODE3r9.jpg',789,'American Diner','10:30:00.000000','+39 0123 890123',941,74,15),(19,'23:30:00.000000',0.01,'https://i.imgur.com/94s9MUF.jpeg',789,'Spanish Tapas Bar','12:00:00.000000','+39 0123 123456',409,49,16),(22,'02:00:00.000000',0.002,'https://i.imgur.com/yICvejx.jpg',600,'Kebab House','10:00:00.000000','+39 0123 456789',42,1000,19),(23,'22:00:00.000000',0.016,'https://s3.eu-central-1.amazonaws.com/pazienti-platform/media_items/files/000/008/836/large/Salse_per_crostini.jpg?1684921793',458,'Trattoria Rubinetti\'s','11:00:00.000000','+39 0123 456789',920,12,20),(24,'23:00:00.000000',0.03,'https://media.istockphoto.com/id/483120255/it/foto/asian-oranage-pollo-con-cipolle-verdi.jpg?s=612x612&w=0&k=20&c=2x2-n7WMhVxhKTY4VBs-fx6LtPPTxgSzZVl8bfmaHdk=',720,'Ristorante Lin','11:00:00.000000','+39 0123 456789',41,74,9),(25,'22:00:00.000000',0.02,'https://mangiarebene.s3.amazonaws.com/uploads/blog_item/image/980/mb_asset.jpg',567,'El Chupacabra','12:00:00.000000','+39 0123 987654',19,99,8),(26,'23:30:00.000000',0.03,'https://www.todis.it/wp-content/uploads/2023/05/sushi-fatto-in-casa.jpg',789,'Sushi Bar','11:30:00.000000','+39 0123 234567',36,140,12),(27,'22:00:00.000000',0.025,'https://i0.wp.com/kungfood.info/wp-content/uploads/2022/05/Ricetta-crostini-alla-aragosta.jpg?fit=1190%2C565&ssl=1',700,'Trattoria del Gambero Rosso','09:00:00.000000','+39 0123 456789',325,478,1),(28,'23:00:00.000000',0.03,'https://i.imgur.com/hOaUtNC.jpeg',500,'Tokyo Sushi House','11:00:00.000000','+39 0123 987654',789,213,12),(29,'21:30:00.000000',0.02,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTIibPbOeDQQscm9g-fDNdCvROokQJukg8nYQ&usqp=CAU',800,'Pizzeria Napoli','10:30:00.000000','+39 0123 123456',187,621,3),(30,'22:30:00.000000',0.035,'https://i.imgur.com/YgQYah2.jpeg',300,'Thai Spice Restaurant','11:30:00.000000','+39 0123 234567',459,754,14),(31,'23:30:00.000000',0.032,'https://i.imgur.com/4tyxoUE.jpg',600,'Burger Haven','10:00:00.000000','+39 0123 345678',87,16,15),(32,'20:00:00.000000',0.028,'https://positivitrip.com/wp-content/uploads/2020/04/cosa-mangiare-a-Parigi-3.jpg',900,'Café Parisien','08:00:00.000000','+39 0123 456789',542,375,17),(33,'22:00:00.000000',0.038,'https://i.imgur.com/X6154vu.jpeg',400,'Ocean Grill','12:00:00.000000','+39 0123 567890',920,810,7),(34,'23:30:00.000000',0.022,'https://www.ricettedalmondo.it/images/foto-ricette/t/32872-tacos-di-carne.jpg',700,'Mexican Flavors','11:30:00.000000','+39 0123 678901',276,690,16),(35,'22:30:00.000000',0.04,'https://i.imgur.com/Ytc6qqw.jpg',550,'Golden Dragon','11:00:00.000000','+39 0123 789012',624,482,14),(36,'23:00:00.000000',0.018,'https://i.imgur.com/4g4Rv9e.jpeg',200,'Athenian Tavern','12:00:00.000000','+39 0123 890123',148,817,15),(37,'22:00:00.000000',0.035,'https://www.corrierecesenate.it/var/cesenate/storage/images/dall-italia/comincia-la-notte-bianca-del-cibo-italiano/2155612-1-ita-IT/Comincia-la-Notte-bianca-del-cibo-italiano_articleimage.jpg',600,'Ristorante Buon Gusto','09:00:00.000000','+39 0123 456789',423,70,1),(38,'23:00:00.000000',0.025,'https://example.com/image12.jpg',450,'Sushi Zen','11:00:00.000000','+39 0123 987654',687,329,2),(39,'21:30:00.000000',0.03,'https://www.vivigreen.eu/wp-content/uploads/2020/07/pizzaNapoletana_2_STG.jpg',750,'Pizzeria Romana','10:30:00.000000','+39 0123 123456',278,521,3),(40,'22:30:00.000000',0.028,'https://static.nexilia.it/vologratis/2020/01/cucina-thailandese.jpeg',350,'Thai Spice Bistro','11:30:00.000000','+39 0123 234567',572,714,19),(41,'23:30:00.000000',0.02,'https://example.com/image15.jpg',550,'Burger Express','10:00:00.000000','+39 0123 345678',721,19,5),(42,'20:00:00.000000',0.032,'https://www.scattidigusto.it/wp-content/uploads/2014/02/caffetteria_torinese_pasticcerai_macaron.jpg',800,'Café Royale','08:00:00.000000','+39 0123 456789',64,43,18),(43,'22:00:00.000000',0.038,'https://www.saveur.com/uploads/2019/09/26/16-220816-PAMU-PESCADO_EMBARAZADO-018-scaled.jpg?auto=webp',400,'Seafood Delight','12:00:00.000000','+39 0123 567890',880,720,2),(44,'23:30:00.000000',0.022,'https://www.coolinmilan.it/cool24/wp-content/uploads/2022/09/ristorante-messicano-milano.jpg',680,'Mexican Grill','11:30:00.000000','+39 0123 678901',297,681,16),(45,'22:30:00.000000',0.04,'https://hips.hearstapps.com/hmg-prod/images/gettyimages-544042946-1537009788.jpg?resize=2048:*',500,'Dragon Palace','11:00:00.000000','+39 0123 789012',40,54,9),(46,'23:00:00.000000',0.018,'https://i.imgur.com/VU4JdP4.jpg',300,'Olive Tree Taverna','12:00:00.000000','+39 0123 890123',198,827,10);
/*!40000 ALTER TABLE `restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mail` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `positionx` int NOT NULL,
  `positiony` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'chiara.belfiore@example.com','Password1!','1234567890',50,620,'Chiara'),(2,'cristina.conigli@example.com','Password2@','9876543210',200,420,'Cristina'),(3,'luca.delgatto@example.com','Password3#','5551234567',700,880,'Luca'),(4,'gaetano.pierro@example.com','Password4$','1112223333',25,300,'Gaetano'),(5,'stefano.vergari@example.com','Password5%','9998887777',800,90,'Stefano');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-08  9:18:20
