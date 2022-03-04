/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.7.33 : Database - eqms_mah
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `failed_jobs` */

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `failed_jobs` */

/*Table structure for table `freelinks` */

DROP TABLE IF EXISTS `freelinks`;

CREATE TABLE `freelinks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `freelinks` */

insert  into `freelinks`(`id`,`name`,`route`,`desc`,`status`,`created_at`,`updated_at`) values (1,'Home Page','/',NULL,1,'2020-05-17 22:11:46','2020-12-25 20:08:45'),(2,'Dashboard','dashboard',NULL,1,'2020-05-17 22:11:57','2020-05-17 22:11:57'),(3,'Login','login',NULL,1,'2020-05-17 22:12:29','2020-05-17 22:12:29'),(4,'Logout','logout',NULL,1,'2020-05-21 17:02:07','2020-05-21 17:02:07'),(5,'Change Password','setups/change-password',NULL,1,'2020-05-23 13:35:50','2020-08-28 17:14:11'),(6,'Side Bar','side-bar',NULL,1,'2020-05-27 17:02:01','2020-05-27 17:02:01'),(9,'My Image','setups/my-image',NULL,1,'2020-08-28 17:14:30','2020-08-28 17:14:30'),(10,'My Preferences','setups/my-preferences',NULL,1,'2020-08-29 21:47:58','2020-08-29 21:48:08'),(11,'Toggle Status','dashboard/toggle-status',NULL,1,'2020-08-30 19:17:21','2020-12-25 20:07:36'),(13,'My Profile','setups/my-profile',NULL,1,'2021-03-07 21:00:42','2021-03-07 21:00:42');

/*Table structure for table `menu` */

DROP TABLE IF EXISTS `menu`;

CREATE TABLE `menu` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `module_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `route` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` text COLLATE utf8mb4_unicode_ci,
  `desc` text COLLATE utf8mb4_unicode_ci,
  `serial` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_module_id_foreign` (`module_id`),
  CONSTRAINT `menu_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `menu` */

insert  into `menu`(`id`,`module_id`,`name`,`route`,`icon`,`desc`,`serial`,`status`,`created_at`,`updated_at`) values (8,6,'System Settings','#','fas fa-chart-pie',NULL,0,1,'2020-05-15 19:45:58','2020-05-15 19:45:58'),(10,6,'Role Management','#','fab fa-pied-piper-alt',NULL,1,1,'2020-05-15 23:37:59','2020-08-28 16:12:48'),(44,17,'Dashboard','/','fa fa-home',NULL,1,1,'2020-08-25 19:25:46','2020-08-26 19:58:23'),(55,6,'People','admins','fa fa-user-secret',NULL,3,1,'2020-08-28 16:13:15','2022-02-15 12:46:34'),(60,6,'Database Backups','database-backups','fa fa-briefcase',NULL,4,1,NULL,'2022-02-15 12:46:40'),(61,24,'Departments','departments',NULL,NULL,1,1,'2022-01-23 12:13:25','2022-01-23 12:13:25'),(62,24,'Head of Departments','head-of-departments',NULL,NULL,2,1,'2022-01-23 12:13:46','2022-01-23 12:13:46'),(63,25,'Engagements','engagements',NULL,NULL,1,1,'2022-01-23 12:16:04','2022-01-23 12:16:04'),(64,25,'Projects','projects',NULL,NULL,2,1,'2022-01-23 12:16:25','2022-01-23 12:16:25'),(65,25,'Criteria','criterias',NULL,NULL,3,1,'2022-01-23 12:17:08','2022-01-23 12:17:08'),(66,25,'Status','statuses',NULL,NULL,4,1,'2022-01-23 12:17:22','2022-01-23 12:17:22'),(67,25,'Create New Project','create-new-project','fa fa-briefcase',NULL,1,1,'2022-01-24 17:49:17','2022-02-17 13:52:28'),(68,27,'My Projects','manager-projects',NULL,NULL,2,1,'2022-01-24 17:50:22','2022-01-24 17:50:22'),(69,26,'Ongoing Projects','ongoing-projects',NULL,NULL,1,1,'2022-01-25 15:09:59','2022-02-17 13:53:15'),(70,26,'Completed Projects','completed-projects',NULL,NULL,2,1,'2022-01-25 15:10:17','2022-02-17 13:53:27'),(72,28,'Project','project-consumptions','far fa-clock',NULL,1,1,'2022-01-25 18:25:48','2022-02-16 12:23:04'),(74,21,'Consultant','consultant-reports',NULL,NULL,4,1,'2022-01-26 13:00:42','2022-01-26 13:00:42'),(75,21,'Project Manager','project-manager-reports',NULL,NULL,5,1,'2022-01-26 13:01:03','2022-01-26 13:01:03'),(76,21,'Head of Department','head-of-department-reports',NULL,NULL,6,1,'2022-01-26 13:01:31','2022-01-26 13:01:52'),(78,21,'Department','department-reports',NULL,NULL,8,1,'2022-01-26 13:03:23','2022-01-26 13:03:23'),(83,6,'Designations','designations','fa fa-briefcase',NULL,2,1,'2022-02-15 12:48:58','2022-02-15 12:48:58'),(84,28,'Commercial','commercial-consumptions','fas fa-hourglass-half',NULL,2,1,'2022-02-16 12:23:52','2022-02-16 12:23:52'),(85,28,'Administrative','administrative-consumptions','fas fa-stopwatch',NULL,3,1,'2022-02-16 12:24:42','2022-02-16 12:24:50'),(86,28,'Leave','leave','fas fa-calendar-day',NULL,4,1,'2022-02-16 12:25:35','2022-02-16 12:25:35'),(87,29,'Comments','comments','far fa-comment-dots',NULL,1,1,'2022-02-16 12:32:09','2022-02-16 12:32:09'),(88,21,'Project','project-reports',NULL,NULL,10,1,'2022-02-17 12:07:58','2022-02-17 12:08:06');

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=392 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values (59,'2020_05_28_114753_holiday_types',3),(60,'2020_05_28_114759_holidays',3),(61,'2020_08_25_143645_event_types',3),(62,'2020_08_25_143701_events',3),(63,'2020_08_25_143710_foreign_keys',3),(67,'2014_10_12_000000_create_users_table',5),(68,'2014_10_12_100000_create_password_resets_table',5),(69,'2019_08_19_000000_create_failed_jobs_table',5),(297,'2022_01_22_115333_profile_foreign_keys',6),(298,'2022_01_22_113721_departments',7),(299,'2022_01_22_113954_head_of_departments',7),(300,'2022_01_22_121606_foreign_keys',7),(346,'2022_01_22_114608_project_consultants',10),(365,'2020_05_14_184001_roles',11),(366,'2020_05_15_093124_modules',11),(367,'2020_05_15_093132_menu',11),(368,'2020_05_15_093136_submenu',11),(369,'2020_05_15_093142_options',11),(370,'2020_05_15_095045_foreignkeys',11),(371,'2020_05_17_160043_freelinks',11),(372,'2020_09_08_131217_system_informations',11),(373,'2022_01_22_114137_profiles',11),(374,'2022_01_22_115333_foreign_keys_latest',11),(375,'2022_02_15_062508_designations',11),(379,'2022_02_16_061606_consumptions',13),(380,'2022_02_16_061611_consumption_keys',13),(381,'2022_01_22_114218_engagements',14),(382,'2022_01_22_114258_projects',14),(383,'2022_01_22_114318_project_distributions',14),(384,'2022_01_22_114450_criterias',14),(385,'2022_01_22_114455_project_criterias',14),(386,'2022_01_22_114515_statuses',14),(387,'2022_01_22_114521_project_statuses',14),(388,'2022_01_22_114653_project_consumptions',14),(389,'2022_01_22_114730_foreign_keys',14),(390,'2022_02_15_102727_project_comments',14),(391,'2022_02_15_102750_project_comment_keys',14);

/*Table structure for table `modules` */

DROP TABLE IF EXISTS `modules`;

CREATE TABLE `modules` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `route` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` text COLLATE utf8mb4_unicode_ci,
  `desc` text COLLATE utf8mb4_unicode_ci,
  `serial` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `modules` */

insert  into `modules`(`id`,`name`,`route`,`icon`,`desc`,`serial`,`status`,`created_at`,`updated_at`) values (6,'Setups','setups','fas fa-cogs',NULL,1,1,'2020-05-15 16:58:39','2020-08-25 20:13:26'),(17,'Dashboard','dashboard','fa fa-home',NULL,0,1,'2020-08-25 19:24:59','2020-08-26 19:58:50'),(21,'Reports','reports','fa fa-list',NULL,100,1,'2021-04-15 18:14:50','2022-01-22 16:40:03'),(24,'Departments','departments','fa fa-university',NULL,2,1,'2022-01-22 16:42:46','2022-01-22 16:49:13'),(25,'Projects','projects','fa fa-list',NULL,3,1,'2022-01-22 16:43:34','2022-01-22 16:49:02'),(26,'Head of Department','head-of-department-panel','fa fa-user-secret',NULL,4,1,'2022-01-22 16:44:01','2022-01-22 16:45:50'),(27,'Project Manager','project-manager-panel','fa fa-user-secret',NULL,5,1,'2022-01-22 16:44:43','2022-01-22 16:45:45'),(28,'Consumptions','consumptions','fa fa-user-secret',NULL,6,1,'2022-01-22 16:45:02','2022-01-22 16:45:02'),(29,'Meetings','meetings','fas fa-handshake',NULL,7,1,'2022-02-16 12:31:19','2022-02-16 12:31:19');

/*Table structure for table `options` */

DROP TABLE IF EXISTS `options`;

CREATE TABLE `options` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` bigint(20) unsigned NOT NULL,
  `submenu_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `options_menu_id_foreign` (`menu_id`),
  KEY `options_submenu_id_foreign` (`submenu_id`),
  CONSTRAINT `options_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `options` */

insert  into `options`(`id`,`menu_id`,`submenu_id`,`name`,`desc`,`status`,`created_at`,`updated_at`) values (1,8,4,'create',NULL,1,'2020-12-25 19:48:07','2020-12-25 19:48:07'),(2,8,4,'edit',NULL,1,'2020-12-25 19:48:17','2020-12-25 19:48:17'),(3,8,4,'delete',NULL,1,'2020-12-25 19:48:27','2020-12-25 19:48:27'),(4,8,1,'create',NULL,1,'2020-12-25 19:48:50','2020-12-25 19:48:50'),(5,8,1,'edit',NULL,1,'2020-12-25 19:49:02','2020-12-25 19:49:02'),(6,8,1,'delete',NULL,1,'2020-12-25 19:49:12','2020-12-25 19:49:12'),(7,8,2,'create',NULL,1,NULL,NULL),(8,8,2,'edit',NULL,1,NULL,NULL),(9,8,2,'delete',NULL,1,NULL,NULL),(10,8,3,'create',NULL,1,NULL,NULL),(11,8,3,'edit',NULL,1,NULL,NULL),(12,8,3,'delete',NULL,1,NULL,NULL),(13,8,7,'create',NULL,1,NULL,NULL),(14,8,7,'edit',NULL,1,NULL,NULL),(15,8,7,'delete',NULL,1,NULL,NULL),(16,10,5,'create',NULL,1,NULL,NULL),(17,10,5,'edit',NULL,1,NULL,NULL),(18,10,5,'delete',NULL,1,NULL,NULL),(19,55,0,'create',NULL,1,NULL,NULL),(20,55,0,'edit',NULL,1,NULL,NULL),(21,55,0,'delete',NULL,1,NULL,NULL),(22,61,0,'create',NULL,1,'2022-01-23 12:14:13','2022-01-23 12:14:13'),(23,61,0,'edit',NULL,1,'2022-01-23 12:14:13','2022-01-23 12:14:13'),(24,61,0,'delete',NULL,1,'2022-01-23 12:14:13','2022-01-23 12:14:13'),(25,62,0,'create',NULL,1,'2022-01-23 12:14:25','2022-01-23 12:14:25'),(26,62,0,'edit',NULL,1,'2022-01-23 12:14:25','2022-01-23 12:14:25'),(27,62,0,'delete',NULL,1,'2022-01-23 12:14:25','2022-01-23 12:14:25'),(28,63,0,'create',NULL,1,'2022-01-23 12:17:46','2022-01-23 12:17:46'),(29,63,0,'edit',NULL,1,'2022-01-23 12:17:46','2022-01-23 12:17:46'),(30,63,0,'delete',NULL,1,'2022-01-23 12:17:46','2022-01-23 12:17:46'),(31,64,0,'create',NULL,1,'2022-01-23 12:17:57','2022-01-23 12:17:57'),(32,64,0,'edit',NULL,1,'2022-01-23 12:17:57','2022-01-23 12:17:57'),(33,64,0,'delete',NULL,1,'2022-01-23 12:17:57','2022-01-23 12:17:57'),(34,65,0,'create',NULL,1,'2022-01-23 12:18:09','2022-01-23 12:18:09'),(35,65,0,'edit',NULL,1,'2022-01-23 12:18:09','2022-01-23 12:18:09'),(36,65,0,'delete',NULL,1,'2022-01-23 12:18:09','2022-01-23 12:18:09'),(37,66,0,'create',NULL,1,'2022-01-23 12:18:19','2022-01-23 12:18:19'),(38,66,0,'edit',NULL,1,'2022-01-23 12:18:19','2022-01-23 12:18:19'),(39,66,0,'delete',NULL,1,'2022-01-23 12:18:19','2022-01-23 12:18:19'),(43,68,0,'create',NULL,1,'2022-01-24 17:53:29','2022-01-24 17:53:29'),(44,68,0,'edit',NULL,1,'2022-01-24 17:53:29','2022-01-24 17:53:29'),(45,68,0,'delete',NULL,1,'2022-01-24 17:53:29','2022-01-24 17:53:29'),(46,83,0,'create',NULL,1,'2022-02-15 12:49:34','2022-02-15 12:49:34'),(47,83,0,'edit',NULL,1,'2022-02-15 12:49:34','2022-02-15 12:49:34'),(48,83,0,'delete',NULL,1,'2022-02-15 12:49:34','2022-02-15 12:49:34'),(49,72,0,'update',NULL,1,'2022-02-16 12:26:44','2022-02-16 12:26:44'),(50,84,0,'update',NULL,1,'2022-02-16 12:26:58','2022-02-16 12:26:58'),(51,85,0,'update',NULL,1,'2022-02-16 12:27:10','2022-02-16 12:27:10'),(52,86,0,'update',NULL,1,'2022-02-16 12:27:26','2022-02-16 12:27:26');

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

insert  into `password_resets`(`email`,`token`,`created_at`) values ('nazmulhridoy25@gmail.com','$2y$10$ZSs1o9xBV9PXnw/yEB396OezQK6z/gUqzpV57x9knSghitbKDYTrm','2021-03-17 05:10:26'),('mhossainzihadi@gmail.com','$2y$10$8Zy3pOLHyzK0cZ6FoVfKm.SwD62jWoCTeeJ6olLopMN62P0QgeB7G','2021-03-17 06:59:10'),('tazul.islam25@yahoo.com','$2y$10$sZQU2nFncsJN0HxO0sPJNemBmKSB.I5WkLVAYuKg4oTMYVl29avMm','2021-03-19 14:06:35'),('mohammedullah704@gmail.com','$2y$10$2UHJ1ZNTAtiNCJXLJtX3dOlta3rgiOZdsJWiHD4qfU.HvA9J8OyR.','2021-03-19 21:58:02'),('sujayetsujan@gmail.com','$2y$10$/1OTfbbXTZYmzm9ZJZuvEO4xFkyItCvF74ZRt0rI5qv5Lt.30N3Ii','2021-03-20 11:45:29'),('smr64643@gmail.com','$2y$10$Yq01SIUluyNN9NPE.N5WIOFCfKWV7yl7OfEtHN9pWt/mvyUdnC41K','2021-03-20 13:12:09'),('sakib887@gmail.com','$2y$10$ysGcWSrFcpdSY1sIDPXg..GZW2Zy2D98xDAcNaDkLz7u1eBla4XKG','2021-03-22 04:22:12'),('paritoshkumar550@gmail.com','$2y$10$JGbvM7oPu6DmEjgolncTKuRptdQNBJ1kqyc4sMe7gjkDVPjgW8372','2021-03-24 07:49:38');

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_main` int(1) DEFAULT '0',
  `sub_roles` text COLLATE utf8mb4_unicode_ci,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `desc` text COLLATE utf8mb4_unicode_ci,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `roles` */

insert  into `roles`(`id`,`name`,`is_main`,`sub_roles`,`permissions`,`desc`,`status`,`created_at`,`updated_at`) values (1,'Super Admin',1,'[\"2\",\"3\",\"4\",\"5\"]','{\"modules\":[\"17\",\"6\",\"24\",\"25\",\"26\",\"27\",\"28\",\"29\",\"21\"],\"menu\":[\"44\",\"8\",\"10\",\"55\",\"60\",\"83\",\"61\",\"62\",\"63\",\"64\",\"65\",\"66\",\"69\",\"70\",\"71\",\"67\",\"68\",\"72\",\"84\",\"85\",\"86\",\"87\",\"74\",\"75\",\"76\",\"78\",\"88\"],\"submenu\":[\"1\",\"2\",\"3\",\"4\",\"7\",\"98\",\"5\",\"6\"],\"options\":[\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"1\",\"2\",\"3\",\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"46\",\"47\",\"48\",\"22\",\"23\",\"24\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"32\",\"33\",\"34\",\"35\",\"36\",\"37\",\"38\",\"39\",\"43\",\"44\",\"45\",\"49\",\"50\",\"51\",\"52\"]}',NULL,1,'2020-05-15 01:53:31','2022-02-17 12:08:47'),(2,'System Admin',0,'[\"3\",\"4\",\"5\"]','{\"modules\":[\"17\",\"6\",\"24\",\"25\",\"28\",\"21\"],\"menu\":[\"44\",\"8\",\"10\",\"55\",\"60\",\"83\",\"61\",\"62\",\"63\",\"64\",\"65\",\"66\",\"72\",\"84\",\"85\",\"86\",\"74\",\"75\",\"76\",\"78\",\"88\"],\"submenu\":[\"98\",\"5\",\"6\"],\"options\":[\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"46\",\"47\",\"48\",\"22\",\"23\",\"24\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"32\",\"33\",\"34\",\"35\",\"36\",\"37\",\"38\",\"39\",\"49\",\"50\",\"51\",\"52\"]}',NULL,1,'2020-05-15 01:53:31','2022-02-17 12:14:45'),(3,'Head of Department',0,'[\"4\",\"5\"]','{\"modules\":[\"17\",\"26\",\"28\",\"21\"],\"menu\":[\"44\",\"69\",\"70\",\"71\",\"72\",\"84\",\"85\",\"86\",\"74\",\"75\",\"88\"],\"submenu\":null,\"options\":[\"49\",\"50\",\"51\",\"52\"]}',NULL,1,'2022-01-22 16:37:48','2022-02-17 12:27:01'),(4,'Project Manager',0,'[\"5\"]','{\"modules\":[\"17\",\"27\",\"28\",\"21\"],\"menu\":[\"44\",\"67\",\"68\",\"72\",\"84\",\"85\",\"86\",\"74\",\"88\"],\"submenu\":null,\"options\":[\"43\",\"44\",\"45\",\"49\",\"50\",\"51\",\"52\"]}',NULL,1,'2022-01-22 16:38:03','2022-02-17 12:27:32'),(5,'Consultant',0,'[]','{\"modules\":[\"17\",\"28\",\"21\"],\"menu\":[\"44\",\"72\",\"84\",\"85\",\"86\",\"74\",\"88\"],\"submenu\":null,\"options\":[\"49\",\"50\",\"51\",\"52\"]}',NULL,1,'2022-01-22 16:38:14','2022-02-17 12:28:05'),(6,'HPI',0,'[]','{\"modules\":[\"17\",\"6\",\"24\",\"25\",\"28\",\"21\"],\"menu\":[\"44\",\"8\",\"10\",\"55\",\"60\",\"83\",\"61\",\"62\",\"63\",\"64\",\"65\",\"66\",\"67\",\"72\",\"84\",\"85\",\"86\",\"74\",\"75\",\"76\",\"78\",\"88\"],\"submenu\":[\"98\",\"6\"],\"options\":[\"19\",\"20\",\"21\",\"46\",\"47\",\"48\",\"22\",\"23\",\"24\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"32\",\"33\",\"34\",\"35\",\"36\",\"37\",\"38\",\"39\",\"49\",\"50\",\"51\",\"52\"]}',NULL,1,'2022-02-15 12:15:47','2022-02-17 13:58:09'),(7,'Meeting Admin',0,'[]','{\"modules\":[\"17\",\"28\",\"29\",\"21\"],\"menu\":[\"44\",\"72\",\"84\",\"85\",\"86\",\"87\",\"88\"],\"submenu\":null,\"options\":[\"49\",\"50\",\"51\",\"52\"]}',NULL,1,'2022-02-15 12:16:02','2022-02-17 12:28:42'),(8,'Business Admin',0,'[]','{\"modules\":[\"17\",\"25\"],\"menu\":[\"44\",\"64\"],\"submenu\":null,\"options\":null}',NULL,1,'2022-02-15 12:16:37','2022-02-17 12:29:10');

/*Table structure for table `submenu` */

DROP TABLE IF EXISTS `submenu`;

CREATE TABLE `submenu` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `route` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` text COLLATE utf8mb4_unicode_ci,
  `desc` text COLLATE utf8mb4_unicode_ci,
  `serial` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `submenu_menu_id_foreign` (`menu_id`),
  CONSTRAINT `submenu_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `submenu` */

insert  into `submenu`(`id`,`menu_id`,`name`,`route`,`icon`,`desc`,`serial`,`status`,`created_at`,`updated_at`) values (1,8,'Modules','modules','fa fa-tasks',NULL,1,1,'2020-05-15 19:46:36','2020-05-15 19:46:36'),(2,8,'Menu','menu','fa fa-tasks',NULL,2,1,'2020-05-15 19:47:39','2020-05-15 19:47:39'),(3,8,'Submenu','submenu','fa fa-tasks',NULL,3,1,'2020-05-15 19:47:52','2020-05-15 19:47:52'),(4,8,'Options','options','fa fa-tasks',NULL,4,1,'2020-05-15 23:12:39','2020-05-15 23:12:39'),(5,10,'Roles','roles','fab fa-accessible-icon',NULL,1,1,'2020-05-15 23:40:50','2020-05-15 23:40:50'),(6,10,'Role Permissions','role-permissions','fab fa-angellist',NULL,0,1,'2020-05-15 23:42:12','2020-05-15 23:42:12'),(7,8,'Freelinks','freelinks','fas fa-external-link-alt',NULL,5,1,'2020-05-17 22:10:28','2020-05-17 22:13:18'),(98,8,'System Information','system-information','fas fa-cogs',NULL,0,1,'2020-09-08 19:14:51','2020-09-08 19:15:10');

/*Table structure for table `system_information` */

DROP TABLE IF EXISTS `system_information`;

CREATE TABLE `system_information` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` text COLLATE utf8mb4_unicode_ci,
  `address` text COLLATE utf8mb4_unicode_ci,
  `email` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `twitter` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `facebook` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `instagram` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `skype` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `linked_in` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `report_file` text COLLATE utf8mb4_unicode_ci,
  `report_file_info` text COLLATE utf8mb4_unicode_ci,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `system_information` */

insert  into `system_information`(`id`,`name`,`phone`,`mobile`,`address`,`email`,`twitter`,`facebook`,`instagram`,`skype`,`linked_in`,`logo`,`icon`,`report_file`,`report_file_info`,`status`,`created_at`,`updated_at`) values (1,'EQMS Consulting Limited','+8801000000000','+8801000000000','Dhaka','example@gmail.com','https://twitter.com/','https://www.facebook.com/','https://www.instagram.com/','https://www.skype.com','https://www.linkedin.com/','1-20220122163147-1074495519-258042578.png','1-20220122163147-729302520-1509111032.ico','20210120171951-1142582553-1875780514.xls','{\"name\":\"Compelet+Incompelet.xlsx.xls\",\"type\":\"application\\/vnd.ms-excel\",\"size\":191488,\"width\":null,\"height\":null,\"extension\":\"xls\"}',1,NULL,'2022-02-17 12:44:14');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  `department_id` bigint(20) unsigned NOT NULL,
  `designation_id` bigint(20) unsigned NOT NULL,
  `is_developer` int(1) DEFAULT '0',
  `sound` int(1) DEFAULT '1',
  `gender` int(1) DEFAULT '1',
  `admin` bigint(20) NOT NULL DEFAULT '0',
  `image` text COLLATE utf8mb4_unicode_ci,
  `status` int(11) NOT NULL DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  KEY `users_role_id_foreign` (`role_id`),
  KEY `users_department_id_foreign` (`department_id`),
  KEY `users_designation_id_foreign` (`designation_id`),
  CONSTRAINT `users_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `users_designation_id_foreign` FOREIGN KEY (`designation_id`) REFERENCES `designations` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`email`,`username`,`password`,`role_id`,`department_id`,`designation_id`,`is_developer`,`sound`,`gender`,`admin`,`image`,`status`,`remember_token`,`created_at`,`updated_at`) values (1,'Roopokar','info@roopokar.com','roopokar','$2a$12$oxb2zaudVUJedXNkjs/K4.GYXkfBUrGWrYR4nBPjogUJ7Rkm67182',1,1,1,1,0,1,1,'1-20210307172036-2111844845-591902592.png',1,NULL,NULL,'2022-01-23 11:53:50'),(2,'System Admin','anwarullah834@gmail.com','system-admin','$2y$10$dJqxTDhQTNlF4r2gLoaEO.U.FLhbsEzhkXTzA4t.powcon8CdsYCC',2,1,1,0,1,1,1,NULL,1,'2rDQfZOiD4OI9WdRxIZRlaGaGQF6CxrHkzrFtrnwdMDvMp3fEJuFWvMwlkuL','2022-01-25 11:46:15','2022-01-25 11:46:15'),(8,'HPI','example@email.com','hpi','$2a$12$jjtJB9I97mSzz3p4IILv9O.n91AfUHuFuyk9Fk2Z9K2kzmDSeef.W',6,1,6,0,1,1,1,NULL,1,NULL,'2022-02-17 12:41:46','2022-02-17 12:41:46'),(9,'Head of Department','example@email.com','head-of-department','$2y$10$XFVrc9P3vHiwhUT2xXi/vufWKYSnaA709hGsuqiz/eZMnlidX1p.a',3,1,2,0,1,1,1,NULL,1,NULL,'2022-02-17 12:42:23','2022-02-17 12:42:23'),(10,'Project Manager','example@email.com','project-manager','$2y$10$Mwifwpwy6ex0T5fJ1Tkfb.dli3s4cbtbGiV30dfGU0NNnDTYym1rW',4,1,3,0,1,1,1,NULL,1,NULL,'2022-02-17 12:42:51','2022-02-17 12:42:51'),(11,'Consultant','example@email.com','consultant','$2y$10$qSo47MIbqNH.vCwUD0jFQOo/TxEkwK8GgADxqeKUNjjJuRQcdVKsa',5,1,4,0,1,1,1,NULL,1,NULL,'2022-02-17 12:43:24','2022-02-17 12:43:24'),(12,'Meeting Admin','example@email.com','meeting-admin','$2y$10$bq4avynIWMgxmGCDGL8mueUuMI5w.8YRFAC.f4CytGUM3pZCGIM4O',7,1,5,0,1,1,1,NULL,1,NULL,'2022-02-17 12:43:47','2022-02-17 12:43:47'),(13,'Business Admin','example@email.com','business-admin','$2y$10$ktjqDyQEiFT3mT3FM/aUYuNvIuZ44bYTlFI2IoUcE7qtHZ6DuC43K',8,1,7,0,1,1,1,NULL,1,NULL,'2022-02-17 12:44:14','2022-02-17 12:44:14');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
