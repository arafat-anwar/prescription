/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.7.33 : Database - prescription
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

insert  into `menu`(`id`,`module_id`,`name`,`route`,`icon`,`desc`,`serial`,`status`,`created_at`,`updated_at`) values (8,6,'System Settings','#','fas fa-chart-pie',NULL,0,1,'2020-05-15 19:45:58','2020-05-15 19:45:58'),(10,6,'Role Management','#','fab fa-pied-piper-alt',NULL,1,1,'2020-05-15 23:37:59','2020-08-28 16:12:48'),(44,17,'Dashboard','/','fa fa-home',NULL,1,1,'2020-08-25 19:25:46','2020-08-26 19:58:23'),(55,6,'People','admins','fa fa-user-secret',NULL,3,1,'2020-08-28 16:13:15','2022-02-15 12:46:34'),(60,6,'Database Backups','database-backups','fa fa-briefcase',NULL,4,1,NULL,'2022-02-15 12:46:40');

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=392 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values (67,'2014_10_12_000000_create_users_table',5),(68,'2014_10_12_100000_create_password_resets_table',5),(69,'2019_08_19_000000_create_failed_jobs_table',5),(365,'2020_05_14_184001_roles',11),(366,'2020_05_15_093124_modules',11),(367,'2020_05_15_093132_menu',11),(368,'2020_05_15_093136_submenu',11),(369,'2020_05_15_093142_options',11),(370,'2020_05_15_095045_foreignkeys',11),(371,'2020_05_17_160043_freelinks',11),(372,'2020_09_08_131217_system_informations',11);

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

insert  into `modules`(`id`,`name`,`route`,`icon`,`desc`,`serial`,`status`,`created_at`,`updated_at`) values (6,'Setups','setups','fas fa-cogs',NULL,1,1,'2020-05-15 16:58:39','2020-08-25 20:13:26'),(17,'Dashboard','dashboard','fa fa-home',NULL,0,1,'2020-08-25 19:24:59','2020-08-26 19:58:50'),(21,'Reports','reports','fa fa-list',NULL,100,1,'2021-04-15 18:14:50','2022-01-22 16:40:03');

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

insert  into `options`(`id`,`menu_id`,`submenu_id`,`name`,`desc`,`status`,`created_at`,`updated_at`) values (1,8,4,'create',NULL,1,'2020-12-25 19:48:07','2020-12-25 19:48:07'),(2,8,4,'edit',NULL,1,'2020-12-25 19:48:17','2020-12-25 19:48:17'),(3,8,4,'delete',NULL,1,'2020-12-25 19:48:27','2020-12-25 19:48:27'),(4,8,1,'create',NULL,1,'2020-12-25 19:48:50','2020-12-25 19:48:50'),(5,8,1,'edit',NULL,1,'2020-12-25 19:49:02','2020-12-25 19:49:02'),(6,8,1,'delete',NULL,1,'2020-12-25 19:49:12','2020-12-25 19:49:12'),(7,8,2,'create',NULL,1,NULL,NULL),(8,8,2,'edit',NULL,1,NULL,NULL),(9,8,2,'delete',NULL,1,NULL,NULL),(10,8,3,'create',NULL,1,NULL,NULL),(11,8,3,'edit',NULL,1,NULL,NULL),(12,8,3,'delete',NULL,1,NULL,NULL),(13,8,7,'create',NULL,1,NULL,NULL),(14,8,7,'edit',NULL,1,NULL,NULL),(15,8,7,'delete',NULL,1,NULL,NULL),(16,10,5,'create',NULL,1,NULL,NULL),(17,10,5,'edit',NULL,1,NULL,NULL),(18,10,5,'delete',NULL,1,NULL,NULL),(19,55,0,'create',NULL,1,NULL,NULL),(20,55,0,'edit',NULL,1,NULL,NULL),(21,55,0,'delete',NULL,1,NULL,NULL);

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

/*Table structure for table `profiles` */

DROP TABLE IF EXISTS `profiles`;

CREATE TABLE `profiles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `phone` text COLLATE utf8mb4_unicode_ci,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `profiles_user_id_foreign` (`user_id`),
  CONSTRAINT `profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `profiles` */

insert  into `profiles`(`id`,`user_id`,`phone`,`status`,`created_at`,`updated_at`) values (2,1,'01754148869',1,'2022-01-23 11:38:35','2022-01-23 11:38:35');

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

insert  into `roles`(`id`,`name`,`is_main`,`sub_roles`,`permissions`,`desc`,`status`,`created_at`,`updated_at`) values (1,'Super Admin',1,'[\"2\",\"3\",\"4\",\"5\"]','{\"modules\":[\"17\",\"6\",\"24\",\"25\",\"26\",\"27\",\"28\",\"29\",\"21\"],\"menu\":[\"44\",\"8\",\"10\",\"55\",\"60\",\"83\",\"61\",\"62\",\"63\",\"64\",\"65\",\"66\",\"69\",\"70\",\"71\",\"67\",\"68\",\"72\",\"84\",\"85\",\"86\",\"87\",\"74\",\"75\",\"76\",\"78\",\"88\"],\"submenu\":[\"1\",\"2\",\"3\",\"4\",\"7\",\"98\",\"5\",\"6\"],\"options\":[\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"1\",\"2\",\"3\",\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"46\",\"47\",\"48\",\"22\",\"23\",\"24\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"32\",\"33\",\"34\",\"35\",\"36\",\"37\",\"38\",\"39\",\"43\",\"44\",\"45\",\"49\",\"50\",\"51\",\"52\"]}',NULL,1,'2020-05-15 01:53:31','2022-02-17 12:08:47'),(2,'System Admin',0,'[\"3\",\"4\",\"5\"]','{\"modules\":[\"17\",\"6\",\"24\",\"25\",\"28\",\"21\"],\"menu\":[\"44\",\"8\",\"10\",\"55\",\"60\",\"83\",\"61\",\"62\",\"63\",\"64\",\"65\",\"66\",\"72\",\"84\",\"85\",\"86\",\"74\",\"75\",\"76\",\"78\",\"88\"],\"submenu\":[\"98\",\"5\",\"6\"],\"options\":[\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"46\",\"47\",\"48\",\"22\",\"23\",\"24\",\"25\",\"26\",\"27\",\"28\",\"29\",\"30\",\"31\",\"32\",\"33\",\"34\",\"35\",\"36\",\"37\",\"38\",\"39\",\"49\",\"50\",\"51\",\"52\"]}',NULL,1,'2020-05-15 01:53:31','2022-02-17 12:14:45');

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

insert  into `system_information`(`id`,`name`,`phone`,`mobile`,`address`,`email`,`twitter`,`facebook`,`instagram`,`skype`,`linked_in`,`logo`,`icon`,`report_file`,`report_file_info`,`status`,`created_at`,`updated_at`) values (1,'ওষুধপথ্য','+8801000000000','+8801000000000','Dhaka','example@gmail.com','https://twitter.com/','https://www.facebook.com/','https://www.instagram.com/','https://www.skype.com','https://www.linkedin.com/','1-20220304194730-630802395-1519818719.png','1-20220304194730-1235524233-38775706.png','20210120171951-1142582553-1875780514.xls','{\"name\":\"Compelet+Incompelet.xlsx.xls\",\"type\":\"application\\/vnd.ms-excel\",\"size\":191488,\"width\":null,\"height\":null,\"extension\":\"xls\"}',1,NULL,'2022-03-04 19:47:30');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
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
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`email`,`username`,`password`,`role_id`,`is_developer`,`sound`,`gender`,`admin`,`image`,`status`,`remember_token`,`created_at`,`updated_at`) values (1,'Larasoft','info@thelarasoft.com','larasoft','$2a$12$CmL62F1ZuhUE0kyds4sDnuce5lJNzxng7Hwntxsm6s1td1XE4hZvC',1,1,0,1,1,'1-20210307172036-2111844845-591902592.png',1,NULL,NULL,'2022-01-23 11:53:50');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
