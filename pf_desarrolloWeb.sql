-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: pf_desarrolloweb
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add usuario',7,'add_usuario'),(26,'Can change usuario',7,'change_usuario'),(27,'Can delete usuario',7,'delete_usuario'),(28,'Can view usuario',7,'view_usuario'),(29,'Can add pedido',8,'add_pedido'),(30,'Can change pedido',8,'change_pedido'),(31,'Can delete pedido',8,'delete_pedido'),(32,'Can view pedido',8,'view_pedido'),(33,'Can add cliente',9,'add_cliente'),(34,'Can change cliente',9,'change_cliente'),(35,'Can delete cliente',9,'delete_cliente'),(36,'Can view cliente',9,'view_cliente'),(37,'Can add producto',10,'add_producto'),(38,'Can change producto',10,'change_producto'),(39,'Can delete producto',10,'delete_producto'),(40,'Can view producto',10,'view_producto'),(41,'Can add categoria',11,'add_categoria'),(42,'Can change categoria',11,'change_categoria'),(43,'Can delete categoria',11,'delete_categoria'),(44,'Can view categoria',11,'view_categoria'),(45,'Can add carrito',12,'add_carrito'),(46,'Can change carrito',12,'change_carrito'),(47,'Can delete carrito',12,'delete_carrito'),(48,'Can view carrito',12,'view_carrito'),(49,'Can add detalle pedido',13,'add_detallepedido'),(50,'Can change detalle pedido',13,'change_detallepedido'),(51,'Can delete detalle pedido',13,'delete_detallepedido'),(52,'Can view detalle pedido',13,'view_detallepedido'),(53,'Can add item carrito',14,'add_itemcarrito'),(54,'Can change item carrito',14,'change_itemcarrito'),(55,'Can delete item carrito',14,'delete_itemcarrito'),(56,'Can view item carrito',14,'view_itemcarrito'),(57,'Can add pedido item',15,'add_pedidoitem'),(58,'Can change pedido item',15,'change_pedidoitem'),(59,'Can delete pedido item',15,'delete_pedidoitem'),(60,'Can view pedido item',15,'view_pedidoitem');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$1000000$MEjwI9Up5yZZ1DCkh0nNrT$l9A3L2QHhb0005RmwzesDmoGRQV1EDZetSSg6KIm4F8=','2025-11-04 00:40:47.073860',1,'admin','','','',1,1,'2025-10-01 23:50:53.862336'),(2,'pbkdf2_sha256$1000000$tyvRBKjEGM2kiMg2jA5yn4$aofMYvFAOtwLb6QRJ5Paww/N5RGGYKe9Jy4GD8UMwIU=','2025-11-06 04:30:01.871219',0,'lcajas','Luz','Cajas','luzcajas63@gmail.com',0,1,'2025-11-04 00:35:48.531036'),(3,'pbkdf2_sha256$1000000$NagDI5qT8fGH74DwhNR61Q$rRvGyVsGXq65XR6pt6J6ZKDcBhUzoSbGQ/AmAXCFGcA=','2025-11-06 04:18:02.039693',1,'administrador','','','',1,1,'2025-11-04 00:40:10.175692'),(4,'pbkdf2_sha256$1000000$wpEfG2vfGnT1qRRJqj10BN$3KZEXfqtvL/+IlMccxEn1cfC+xnddUHhWPnm21ExBFo=',NULL,0,'ncustodio','Nancy','Custodio','necadca@gmail.com',0,1,'2025-11-05 18:41:20.280733');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2025-10-02 00:23:24.155221','2','Cartera Rosa Cartera de color rosa, con agarrador de mano. 250.00 15 Carteras Carteras de diferentes colores y tamaños.',1,'[{\"added\": {}}]',10,1),(2,'2025-10-02 00:26:37.108271','1','Cartera Azul Pequeña cartera azul con cinta para colgarla en el hombro. 200.00 20 Carteras Carteras de diferentes colores y tamaños.',3,'',10,1),(3,'2025-10-02 00:31:54.125210','3','Cartera Azul Cartera azul, pequeña, con cinta para colgarla sobre el brazo. 150.00 25 Carteras Carteras de diferentes colores y tamaños.',1,'[{\"added\": {}}]',10,1),(4,'2025-10-03 01:28:20.002622','1','Carteras Descubre nuestra colección de carteras diseñadas para acompañarte en cada momento de tu día. Desde estilos modernos y minimalistas hasta diseños más elegantes y sofisticados, aquí encontrarás',2,'[{\"changed\": {\"fields\": [\"Descripcion\"]}}]',11,1),(5,'2025-10-03 01:34:14.563277','3','Cartera de Mano Las carteras de mano son el complemento ideal para quienes buscan un accesorio práctico pero lleno de estilo. Su diseño compacto permite llevar lo esencial —como el celular, llaves, ma',2,'[{\"changed\": {\"fields\": [\"Nombre\", \"Descripcion\"]}}]',10,1),(6,'2025-10-03 01:34:44.338673','2','Cartera cruzada La cartera cruzada es sinónimo de libertad y comodidad. Con una correa ajustable y un diseño versátil, te permite moverte sin preocupaciones mientras mantienes tus pertenencias seguras',2,'[{\"changed\": {\"fields\": [\"Nombre\", \"Descripcion\"]}}]',10,1),(7,'2025-10-03 02:02:22.294076','3','Cartera de Mano Las carteras de mano son el complemento ideal para quienes buscan un accesorio práctico pero lleno de estilo. Su diseño compacto permite llevar lo esencial —como el celular, llaves, ma',2,'[]',10,1),(8,'2025-10-03 02:05:39.758173','4','Reloj Digital prueba 200 20 Relojes Relojes',1,'[{\"added\": {}}]',10,1),(9,'2025-11-05 23:31:42.168236','5','Carteras tipo sobre Minimalismo y elegancia se unen en las carteras tipo sobre. Su diseño delgado y moderno está pensado para complementar tus atuendos más especiales: bodas, fiestas, cenas o eventos ',2,'[{\"changed\": {\"fields\": [\"Disponible\"]}}]',10,3),(10,'2025-11-06 04:25:04.613669','13','Reloj de bolsillo Clásico y retro, perfecto para coleccionistas o para quienes disfrutan de un estilo vintage con elegancia atemporal. 400.00 True Relojes Explora nuestra colección de relojes para tod',2,'[{\"changed\": {\"fields\": [\"Disponible\"]}}]',10,3);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(12,'modulos','carrito'),(11,'modulos','categoria'),(9,'modulos','cliente'),(13,'modulos','detallepedido'),(14,'modulos','itemcarrito'),(8,'modulos','pedido'),(15,'modulos','pedidoitem'),(10,'modulos','producto'),(7,'modulos','usuario'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-10-01 23:28:20.084452'),(2,'auth','0001_initial','2025-10-01 23:28:20.528552'),(3,'admin','0001_initial','2025-10-01 23:28:20.633668'),(4,'admin','0002_logentry_remove_auto_add','2025-10-01 23:28:20.638914'),(5,'admin','0003_logentry_add_action_flag_choices','2025-10-01 23:28:20.644239'),(6,'contenttypes','0002_remove_content_type_name','2025-10-01 23:28:20.711863'),(7,'auth','0002_alter_permission_name_max_length','2025-10-01 23:28:20.758879'),(8,'auth','0003_alter_user_email_max_length','2025-10-01 23:28:20.774315'),(9,'auth','0004_alter_user_username_opts','2025-10-01 23:28:20.779314'),(10,'auth','0005_alter_user_last_login_null','2025-10-01 23:28:20.820177'),(11,'auth','0006_require_contenttypes_0002','2025-10-01 23:28:20.822177'),(12,'auth','0007_alter_validators_add_error_messages','2025-10-01 23:28:20.826403'),(13,'auth','0008_alter_user_username_max_length','2025-10-01 23:28:20.874948'),(14,'auth','0009_alter_user_last_name_max_length','2025-10-01 23:28:20.923003'),(15,'auth','0010_alter_group_name_max_length','2025-10-01 23:28:20.935877'),(16,'auth','0011_update_proxy_permissions','2025-10-01 23:28:20.941883'),(17,'auth','0012_alter_user_first_name_max_length','2025-10-01 23:28:20.988919'),(18,'sessions','0001_initial','2025-10-01 23:28:21.015823'),(19,'modulos','0001_initial','2025-10-01 23:29:37.198364'),(20,'modulos','0002_remove_producto_stock','2025-10-03 03:38:23.198196'),(21,'modulos','0003_remove_pedido_cliente_remove_usuario_apellido_and_more','2025-11-02 02:41:46.504478'),(22,'modulos','0004_usuario_direccion_usuario_telefono','2025-11-02 03:01:26.929570'),(23,'modulos','0005_rename_fecha_pedido_creado_en_alter_pedido_usuario_and_more','2025-11-05 21:20:31.598341'),(24,'modulos','0006_rename_creado_en_pedido_fecha_and_more','2025-11-05 22:26:37.651390'),(25,'modulos','0007_delete_detallepedido','2025-11-05 22:47:10.618355'),(26,'modulos','0008_producto_disponible','2025-11-05 23:28:09.049347'),(27,'modulos','0009_producto_imagen','2025-11-05 23:39:21.174082');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0xtpp5n7zeis9pfaut45ccmmd8trz0gu','.eJxVjDsOwjAQBe_iGlnBn8RLSc8ZrF3vGgeQI8VJhbg7iZQC2jcz760irkuJa5M5jqwu6qxOvxthekrdAT-w3iedprrMI-ld0Qdt-jaxvK6H-3dQsJWtTrk33gyQB2GTyHLIgZL1nWPwvTiBbAgMBOsodSzATH4T0boAGZ36fAH7DTit:1v46bT:NL7nYV3nGPARsDSbttkdAGK-Yc6I5sGD45dNkjSlBwQ','2025-10-15 23:51:23.008618'),('zutjtdjhbv5hvw4kox74ow1g3xksfsjv','.eJxVjDsOwjAQBe_iGln-20tJzxmstXeFA8iR4qRC3B0ipYD2zcx7iYzb2vI2eMkTibMw4vS7FawP7jugO_bbLOvc12UqclfkQYe8zsTPy-H-HTQc7VuDBlfAkoIYmau3CU1y1vvIKkAgg75gKuACmBJYR1u9co6w6khKOfH-AL-7Nu8:1vGrdJ:9PxSg6ni7Jl9Yi7EtsEr8RakmnKO_hyhuamlRM3QzYI','2025-11-20 04:30:01.874881');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modulos_carrito`
--

DROP TABLE IF EXISTS `modulos_carrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modulos_carrito` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `creado_en` datetime(6) NOT NULL,
  `usuario_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `modulos_carrito_usuario_id_f621fbe0_fk_auth_user_id` (`usuario_id`),
  CONSTRAINT `modulos_carrito_usuario_id_f621fbe0_fk_auth_user_id` FOREIGN KEY (`usuario_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modulos_carrito`
--

LOCK TABLES `modulos_carrito` WRITE;
/*!40000 ALTER TABLE `modulos_carrito` DISABLE KEYS */;
INSERT INTO `modulos_carrito` VALUES (1,'2025-11-05 21:20:45.702045',3),(2,'2025-11-05 22:51:06.907634',2);
/*!40000 ALTER TABLE `modulos_carrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modulos_categoria`
--

DROP TABLE IF EXISTS `modulos_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modulos_categoria` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modulos_categoria`
--

LOCK TABLES `modulos_categoria` WRITE;
/*!40000 ALTER TABLE `modulos_categoria` DISABLE KEYS */;
INSERT INTO `modulos_categoria` VALUES (1,'Carteras','Descubre nuestra colección de carteras diseñadas para acompañarte en cada momento de tu día. Desde estilos modernos y minimalistas hasta diseños más elegantes y sofisticados, aquí encontrarás el accesorio perfecto para realzar tu look.'),(2,'Billeteras','Descubre nuestra selección de billeteras elegantes y funcionales. Diseñadas para organizar tarjetas, billetes y documentos, combinan estilo, durabilidad y comodidad para el día a día. Encuentra el modelo que se adapta a tu personalidad y necesidades.'),(3,'Monederos','Pequeños pero prácticos, nuestros monederos son ideales para llevar monedas, billetes y tarjetas de manera ordenada. Con diseños modernos, clásicos o divertidos, ofrecen funcionalidad y estilo en un accesorio compacto.'),(4,'Relojes','Explora nuestra colección de relojes para todos los estilos y ocasiones. Desde modelos clásicos y elegantes hasta deportivos y tecnológicos, cada reloj combina precisión, diseño y funcionalidad para acompañarte en tu día a día con estilo.');
/*!40000 ALTER TABLE `modulos_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modulos_itemcarrito`
--

DROP TABLE IF EXISTS `modulos_itemcarrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modulos_itemcarrito` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cantidad` int unsigned NOT NULL,
  `carrito_id` bigint NOT NULL,
  `producto_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `modulos_itemcarrito_carrito_id_344c4d4b_fk_modulos_carrito_id` (`carrito_id`),
  KEY `modulos_itemcarrito_producto_id_28af9f72_fk_modulos_producto_id` (`producto_id`),
  CONSTRAINT `modulos_itemcarrito_carrito_id_344c4d4b_fk_modulos_carrito_id` FOREIGN KEY (`carrito_id`) REFERENCES `modulos_carrito` (`id`),
  CONSTRAINT `modulos_itemcarrito_producto_id_28af9f72_fk_modulos_producto_id` FOREIGN KEY (`producto_id`) REFERENCES `modulos_producto` (`id`),
  CONSTRAINT `modulos_itemcarrito_chk_1` CHECK ((`cantidad` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modulos_itemcarrito`
--

LOCK TABLES `modulos_itemcarrito` WRITE;
/*!40000 ALTER TABLE `modulos_itemcarrito` DISABLE KEYS */;
/*!40000 ALTER TABLE `modulos_itemcarrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modulos_pedido`
--

DROP TABLE IF EXISTS `modulos_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modulos_pedido` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fecha` datetime(6) NOT NULL,
  `usuario_id` int NOT NULL,
  `estado` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `modulos_pedido_usuario_id_3ba9fb71_fk_auth_user_id` (`usuario_id`),
  CONSTRAINT `modulos_pedido_usuario_id_3ba9fb71_fk_auth_user_id` FOREIGN KEY (`usuario_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modulos_pedido`
--

LOCK TABLES `modulos_pedido` WRITE;
/*!40000 ALTER TABLE `modulos_pedido` DISABLE KEYS */;
INSERT INTO `modulos_pedido` VALUES (3,'2025-11-05 22:48:46.841187',3,'pendiente'),(4,'2025-11-05 22:50:03.540119',3,'despachado'),(5,'2025-11-05 22:51:33.295505',2,'pendiente'),(6,'2025-11-06 04:14:18.994865',2,'despachado'),(7,'2025-11-06 04:26:27.131654',3,'pendiente');
/*!40000 ALTER TABLE `modulos_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modulos_pedidoitem`
--

DROP TABLE IF EXISTS `modulos_pedidoitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modulos_pedidoitem` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cantidad` int unsigned NOT NULL,
  `pedido_id` bigint NOT NULL,
  `producto_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `modulos_pedidoitem_pedido_id_b270ff29_fk_modulos_pedido_id` (`pedido_id`),
  KEY `modulos_pedidoitem_producto_id_fa215bbb_fk_modulos_producto_id` (`producto_id`),
  CONSTRAINT `modulos_pedidoitem_pedido_id_b270ff29_fk_modulos_pedido_id` FOREIGN KEY (`pedido_id`) REFERENCES `modulos_pedido` (`id`),
  CONSTRAINT `modulos_pedidoitem_producto_id_fa215bbb_fk_modulos_producto_id` FOREIGN KEY (`producto_id`) REFERENCES `modulos_producto` (`id`),
  CONSTRAINT `modulos_pedidoitem_chk_1` CHECK ((`cantidad` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modulos_pedidoitem`
--

LOCK TABLES `modulos_pedidoitem` WRITE;
/*!40000 ALTER TABLE `modulos_pedidoitem` DISABLE KEYS */;
INSERT INTO `modulos_pedidoitem` VALUES (1,1,3,2),(2,2,4,5),(4,1,5,2),(5,1,5,3),(6,1,6,9),(7,1,6,2),(8,1,7,2),(9,1,7,4),(10,1,7,13);
/*!40000 ALTER TABLE `modulos_pedidoitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modulos_producto`
--

DROP TABLE IF EXISTS `modulos_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modulos_producto` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` longtext NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `categoria_id` bigint NOT NULL,
  `disponible` tinyint(1) NOT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `modulos_producto_categoria_id_a081e1d5_fk_modulos_categoria_id` (`categoria_id`),
  CONSTRAINT `modulos_producto_categoria_id_a081e1d5_fk_modulos_categoria_id` FOREIGN KEY (`categoria_id`) REFERENCES `modulos_categoria` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modulos_producto`
--

LOCK TABLES `modulos_producto` WRITE;
/*!40000 ALTER TABLE `modulos_producto` DISABLE KEYS */;
INSERT INTO `modulos_producto` VALUES (2,'Cartera cruzada','La cartera cruzada es sinónimo de libertad y comodidad. Con una correa ajustable y un diseño versátil, te permite moverte sin preocupaciones mientras mantienes tus pertenencias seguras y al alcance. Es la elección perfecta para el día a día, viajes o actividades que requieren practicidad sin renunciar al estilo. Disponible en una amplia variedad de tamaños y colores, siempre encontrarás una que se adapte a tu ritmo de vida.',250.00,1,1,'productos/cartera_cruzada.jpg'),(3,'Cartera de Mano','Las carteras de mano son el complemento ideal para quienes buscan un accesorio práctico pero lleno de estilo. Su diseño compacto permite llevar lo esencial —como el celular, llaves, maquillaje o tarjetas— sin perder elegancia. Perfectas para cenas, reuniones o salidas nocturnas, estas carteras son símbolo de distinción y un toque sofisticado que transforma cualquier look sencillo en uno lleno de personalidad.',150.00,1,1,'productos/cartera_mano.jpg'),(4,'Reloj Digital','Moderno y práctico, muestra la hora de forma clara y precisa. Incluye funciones como alarma, cronómetro y retroiluminación.',220.00,4,1,'productos/reloj_digital.jpg'),(5,'Carteras tipo sobre','Minimalismo y elegancia se unen en las carteras tipo sobre. Su diseño delgado y moderno está pensado para complementar tus atuendos más especiales: bodas, fiestas, cenas o eventos formales. A pesar de su tamaño, ofrecen la organización necesaria para llevar tus imprescindibles con estilo. El clutch es el accesorio perfecto para quienes saben que un pequeño detalle puede hacer la gran diferencia.',175.00,1,1,'productos/cartera_sobre.jpg'),(7,'Cartera de cuero clásica','Elegante y duradera, confeccionada en cuero de alta calidad. Cuenta con compartimentos para tarjetas, billetes y documentos, ofreciendo organización y estilo en tu día a día. Ideal para quienes buscan un accesorio práctico y sofisticado.',350.00,1,1,'productos/cartera_cuero.jpg'),(8,'Billetera de cuero clásica','Fabricada en cuero genuino, combina durabilidad y elegancia. Posee compartimentos para tarjetas, billetes y documentos, ideal para quienes buscan estilo y funcionalidad en un mismo accesorio.',150.00,2,1,'productos/billetera_cuero.jpg'),(9,'Billetera con cierre','Incluye un cierre seguro que protege tarjetas y efectivo. Ideal para quienes valoran la seguridad y la organización en su día a día.',175.00,2,1,'productos/billetera_cierre.jpg'),(10,'Monedero compacto','Pequeño y ligero, perfecto para bolsillos o bolsos pequeños. Ideal para quienes buscan practicidad sin sacrificar elegancia.',150.00,3,1,'productos/monedero_compacto.jpeg'),(11,'Monedero clásico de cuero','Elegante y resistente, fabricado en cuero de alta calidad. Ideal para llevar monedas, billetes pequeños y tarjetas, manteniendo todo organizado y con estilo.',125.00,3,1,'productos/monedero_cuero.jpg'),(12,'Reloj clásico de pulsera','Elegante y atemporal, con correa de cuero o metal. Ideal para cualquier ocasión, combina estilo y funcionalidad.',200.00,4,1,'productos/reloj_pulsera.jpg'),(13,'Reloj de bolsillo','Clásico y retro, perfecto para coleccionistas o para quienes disfrutan de un estilo vintage con elegancia atemporal.',400.00,4,0,'productos/reloj_bolsillo.jpg');
/*!40000 ALTER TABLE `modulos_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modulos_usuario`
--

DROP TABLE IF EXISTS `modulos_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modulos_usuario` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `perfil_id` int NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `telefono` varchar(8) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `perfil_id` (`perfil_id`),
  CONSTRAINT `modulos_usuario_perfil_id_4192c220_fk_auth_user_id` FOREIGN KEY (`perfil_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modulos_usuario`
--

LOCK TABLES `modulos_usuario` WRITE;
/*!40000 ALTER TABLE `modulos_usuario` DISABLE KEYS */;
INSERT INTO `modulos_usuario` VALUES (1,2,'',''),(2,3,'',''),(3,4,'Quetzaltenango','45196227');
/*!40000 ALTER TABLE `modulos_usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-05 22:58:49
