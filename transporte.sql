-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         5.7.24 - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para transporte
CREATE DATABASE IF NOT EXISTS `transporte` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `transporte`;

-- Volcando estructura para tabla transporte.cargas
CREATE TABLE IF NOT EXISTS `cargas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cliente_id` int(10) unsigned NOT NULL,
  `ruta_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `cantidad_reses` int(11) DEFAULT NULL,
  `cant_llevadas` int(11) DEFAULT NULL,
  `precio_envio` decimal(8,2) DEFAULT NULL,
  `anticipo` decimal(8,2) DEFAULT NULL,
  `pago_transporte` decimal(8,2) DEFAULT NULL,
  `observacion` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla transporte.cargas: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `cargas` DISABLE KEYS */;
INSERT INTO `cargas` (`id`, `cliente_id`, `ruta_id`, `user_id`, `cantidad_reses`, `cant_llevadas`, `precio_envio`, `anticipo`, `pago_transporte`, `observacion`, `created_at`, `updated_at`) VALUES
	(1, 1, 2, 1, 500, 95, 17950.00, 8000.00, 11700.00, 'ninguna', '2019-08-31 21:39:13', '2019-08-31 21:39:13');
/*!40000 ALTER TABLE `cargas` ENABLE KEYS */;

-- Volcando estructura para tabla transporte.categorias
CREATE TABLE IF NOT EXISTS `categorias` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla transporte.categorias: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
	(1, 'vacas', '2019-07-28 00:36:15', '2019-07-28 00:36:15'),
	(2, 'toros', '2019-07-28 00:36:27', '2019-07-28 00:36:27'),
	(3, 'novillos', '2019-07-28 00:36:41', '2019-07-28 00:36:41'),
	(4, 'caballos', '2019-07-28 00:36:56', '2019-07-28 00:36:56');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;

-- Volcando estructura para tabla transporte.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`),
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla transporte.categories: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
	(1, NULL, 1, 'Category 1', 'category-1', '2019-07-25 00:47:52', '2019-07-25 00:47:52'),
	(2, NULL, 1, 'Category 2', 'category-2', '2019-07-25 00:47:52', '2019-07-25 00:47:52');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

-- Volcando estructura para tabla transporte.chauffeurs
CREATE TABLE IF NOT EXISTS `chauffeurs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombres` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellidos` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ci` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brevete` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `celular` int(11) DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `chauffeurs_ci_unique` (`ci`),
  UNIQUE KEY `chauffeurs_brevete_unique` (`brevete`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla transporte.chauffeurs: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `chauffeurs` DISABLE KEYS */;
INSERT INTO `chauffeurs` (`id`, `nombres`, `apellidos`, `ci`, `brevete`, `celular`, `telefono`, `email`, `created_at`, `updated_at`) VALUES
	(1, 'broberth', 'chilo rojas', '6355631 SC', '6355631', 76880951, 76880952, 'escorpe25@gmail.com', '2019-07-25 01:46:59', '2019-08-24 18:09:59'),
	(2, 'Alvaro osvaldo', 'honor', '1397412 sc', '1397412', 76888993, 66772772, 'xxxxxxx@gmail.com', '2019-07-25 14:23:32', '2019-08-24 18:09:39');
/*!40000 ALTER TABLE `chauffeurs` ENABLE KEYS */;

-- Volcando estructura para tabla transporte.clientes
CREATE TABLE IF NOT EXISTS `clientes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `razon_social` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telfono` int(11) DEFAULT NULL,
  `celular` int(11) DEFAULT NULL,
  `documento_id` int(11) unsigned NOT NULL,
  `documento` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dirreccion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla transporte.clientes: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` (`id`, `razon_social`, `telfono`, `celular`, `documento_id`, `documento`, `email`, `dirreccion`, `created_at`, `updated_at`) VALUES
	(1, 'KULJIS', 76893993, 76880951, 2, '7600202', 'escorpe25@gmail.com', 'villa corina calle 8', '2019-07-25 02:08:41', '2019-07-25 02:08:41'),
	(2, 'Coboce', 652356, 6547885, 2, '75456622', 'coboce@gmail.com', 'santa cruz', '2019-08-16 22:30:03', '2019-08-16 22:30:03'),
	(3, 'san ana', 7556565, 5656565, 3, '772829929', 'pedro@gmail.com', 'aknckanckasnkancskan', '2019-08-24 18:05:51', '2019-08-24 18:05:51');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;

-- Volcando estructura para tabla transporte.cobrarcuentas
CREATE TABLE IF NOT EXISTS `cobrarcuentas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `carga_id` int(11) DEFAULT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `costo_carga` decimal(10,0) DEFAULT NULL,
  `deuda` decimal(10,0) DEFAULT NULL,
  `estado` enum('vigente','finalizada') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla transporte.cobrarcuentas: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `cobrarcuentas` DISABLE KEYS */;
/*!40000 ALTER TABLE `cobrarcuentas` ENABLE KEYS */;

-- Volcando estructura para tabla transporte.cuentas
CREATE TABLE IF NOT EXISTS `cuentas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `carga_id` int(10) unsigned NOT NULL,
  `deuda` decimal(8,2) DEFAULT NULL,
  `estado` enum('vigente','finalizado') COLLATE utf8mb4_unicode_ci DEFAULT 'vigente',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla transporte.cuentas: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `cuentas` DISABLE KEYS */;
INSERT INTO `cuentas` (`id`, `carga_id`, `deuda`, `estado`, `created_at`, `updated_at`) VALUES
	(1, 1, 9950.00, 'vigente', '2019-08-31 21:39:15', '2019-08-31 21:39:15');
/*!40000 ALTER TABLE `cuentas` ENABLE KEYS */;

-- Volcando estructura para tabla transporte.cuentaxpagar
CREATE TABLE IF NOT EXISTS `cuentaxpagar` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `detalle_id` int(10) unsigned NOT NULL,
  `deuda` decimal(8,2) DEFAULT NULL,
  `estado` enum('vigente','finalizado') COLLATE utf8mb4_unicode_ci DEFAULT 'vigente',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla transporte.cuentaxpagar: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `cuentaxpagar` DISABLE KEYS */;
INSERT INTO `cuentaxpagar` (`id`, `detalle_id`, `deuda`, `estado`, `created_at`, `updated_at`) VALUES
	(1, 1, 6300.00, 'vigente', '2019-08-31 21:39:14', '2019-08-31 21:39:14'),
	(2, 2, 5400.00, 'vigente', '2019-08-31 21:39:14', '2019-08-31 21:39:14');
/*!40000 ALTER TABLE `cuentaxpagar` ENABLE KEYS */;

-- Volcando estructura para tabla transporte.data_rows
CREATE TABLE IF NOT EXISTS `data_rows` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_type_id` int(10) unsigned NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`),
  CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla transporte.data_rows: ~108 rows (aproximadamente)
/*!40000 ALTER TABLE `data_rows` DISABLE KEYS */;
INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
	(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
	(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
	(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3),
	(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4),
	(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5),
	(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6),
	(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
	(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8),
	(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{"model":"TCG\\\\Voyager\\\\Models\\\\Role","table":"roles","type":"belongsTo","column":"role_id","key":"id","label":"display_name","pivot_table":"roles","pivot":0}', 10),
	(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{"model":"TCG\\\\Voyager\\\\Models\\\\Role","table":"roles","type":"belongsToMany","column":"id","key":"id","label":"display_name","pivot_table":"user_roles","pivot":"1","taggable":"0"}', 11),
	(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
	(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
	(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
	(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
	(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
	(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
	(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
	(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
	(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
	(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
	(21, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, NULL, 9),
	(22, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
	(23, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{"default":"","null":"","options":{"":"-- None --"},"relationship":{"key":"id","label":"name"}}', 2),
	(24, 4, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{"default":1}', 3),
	(25, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 4),
	(26, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{"slugify":{"origin":"name"}}', 5),
	(27, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, NULL, 6),
	(28, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
	(29, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
	(30, 5, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, NULL, 2),
	(31, 5, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, NULL, 3),
	(32, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 4),
	(33, 5, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 5),
	(34, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 6),
	(35, 5, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{"resize":{"width":"1000","height":"null"},"quality":"70%","upsize":true,"thumbnails":[{"name":"medium","scale":"50%"},{"name":"small","scale":"25%"},{"name":"cropped","crop":{"width":"300","height":"250"}}]}', 7),
	(36, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{"slugify":{"origin":"title","forceUpdate":true},"validation":{"rule":"unique:posts,slug"}}', 8),
	(37, 5, 'meta_description', 'text_area', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 9),
	(38, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 10),
	(39, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{"default":"DRAFT","options":{"PUBLISHED":"published","DRAFT":"draft","PENDING":"pending"}}', 11),
	(40, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 12),
	(41, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 13),
	(42, 5, 'seo_title', 'text', 'SEO Title', 0, 1, 1, 1, 1, 1, NULL, 14),
	(43, 5, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, NULL, 15),
	(44, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
	(45, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, NULL, 2),
	(46, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 3),
	(47, 6, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 4),
	(48, 6, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 5),
	(49, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{"slugify":{"origin":"title"},"validation":{"rule":"unique:pages,slug"}}', 6),
	(50, 6, 'meta_description', 'text', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 7),
	(51, 6, 'meta_keywords', 'text', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 8),
	(52, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{"default":"INACTIVE","options":{"INACTIVE":"INACTIVE","ACTIVE":"ACTIVE"}}', 9),
	(53, 6, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 0, 0, 0, NULL, 10),
	(54, 6, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, NULL, 11),
	(55, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, NULL, 12),
	(56, 7, 'id', 'text', 'Id', 1, 1, 0, 0, 0, 0, '{}', 1),
	(57, 7, 'nombre', 'text', 'Nombre', 0, 1, 1, 1, 1, 1, '{"display":{"width":"6"}}', 2),
	(58, 7, 'apellidos', 'text', 'Apellidos', 0, 1, 1, 1, 1, 1, '{"display":{"width":"6"}}', 3),
	(59, 7, 'direccion', 'text', 'Direccion', 0, 1, 1, 1, 1, 1, '{"display":{"width":"6"}}', 4),
	(60, 7, 'telefono', 'number', 'Telefono', 0, 1, 1, 1, 1, 1, '{"display":{"width":"6"}}', 5),
	(61, 7, 'celular', 'number', 'Celular', 0, 1, 1, 1, 1, 1, '{"display":{"width":"6"}}', 6),
	(62, 7, 'email', 'text', 'Email', 0, 1, 1, 1, 1, 1, '{"display":{"width":"6"}}', 7),
	(63, 7, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 8),
	(64, 7, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 9),
	(65, 8, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 2),
	(66, 8, 'placa', 'text', 'Placa', 1, 1, 1, 1, 1, 1, '{"display":{"width":"6"}}', 3),
	(67, 8, 'modelo', 'text', 'Modelo', 1, 1, 1, 1, 1, 1, '{"display":{"width":"6"}}', 4),
	(68, 8, 'n_motor', 'text', 'N Motor', 0, 1, 1, 1, 1, 1, '{"display":{"width":"6"}}', 5),
	(69, 8, 'serie', 'text', 'Serie', 0, 1, 1, 1, 1, 1, '{"display":{"width":"6"}}', 6),
	(70, 8, 'capacidad', 'number', 'Capacidad', 0, 1, 1, 1, 1, 1, '{"display":{"width":"6"}}', 7),
	(71, 8, 'placa_carreta', 'text', 'Placa Carreta', 0, 1, 1, 1, 1, 1, '{"display":{"width":"6"}}', 8),
	(72, 8, 'owner_id', 'text', 'Owner Id', 1, 1, 1, 1, 1, 1, '{}', 9),
	(73, 8, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 1, 0, 0, '{}', 10),
	(74, 8, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 11),
	(75, 8, 'vehiculo_belongsto_owner_relationship', 'relationship', 'dueño', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\Owner","table":"owners","type":"belongsTo","column":"owner_id","key":"id","label":"nombre","pivot_table":"categories","pivot":"0","taggable":"0"}', 1),
	(76, 9, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{"display":{"width":"6"}}', 1),
	(77, 9, 'nombres', 'text', 'Nombres', 1, 1, 1, 1, 1, 1, '{"display":{"width":"6"}}', 2),
	(78, 9, 'apellidos', 'text', 'Apellidos', 1, 1, 1, 1, 1, 1, '{"display":{"width":"6"}}', 3),
	(79, 9, 'ci', 'text', 'Ci', 1, 1, 1, 1, 1, 1, '{"display":{"width":"6"}}', 4),
	(80, 9, 'brevete', 'text', 'Brevete', 1, 1, 1, 1, 1, 1, '{"display":{"width":"6"}}', 5),
	(81, 9, 'celular', 'number', 'Celular', 0, 1, 1, 1, 1, 1, '{"display":{"width":"6"}}', 6),
	(82, 9, 'telefono', 'number', 'Telefono', 0, 1, 1, 1, 1, 1, '{"display":{"width":"6"}}', 7),
	(83, 9, 'email', 'text', 'Email', 0, 1, 1, 1, 1, 1, '{"display":{"width":"6"}}', 8),
	(84, 10, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(85, 10, 'nombres', 'text', 'Nombres', 0, 1, 1, 1, 1, 1, '{}', 2),
	(86, 10, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 3),
	(87, 10, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
	(88, 11, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(89, 11, 'razon_social', 'text', 'Razon Social', 0, 1, 1, 1, 1, 1, '{"display":{"width":"6"}}', 2),
	(90, 11, 'telfono', 'number', 'Telfono', 0, 1, 1, 1, 1, 1, '{"display":{"width":"6"}}', 3),
	(91, 11, 'celular', 'number', 'Celular', 0, 1, 1, 1, 1, 1, '{"display":{"width":"6"}}', 4),
	(92, 11, 'email', 'text', 'Email', 0, 1, 1, 1, 1, 1, '{"display":{"width":"6"}}', 5),
	(93, 11, 'dirreccion', 'text_area', 'Dirreccion', 0, 1, 1, 1, 1, 1, '{}', 9),
	(94, 11, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, '{}', 10),
	(95, 11, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 11),
	(96, 11, 'cliente_belongsto_documento_relationship', 'relationship', 'Tipo-documentos', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\Documento","table":"documentos","type":"belongsTo","column":"documento_id","key":"id","label":"nombres","pivot_table":"categories","pivot":"0","taggable":"0"}', 7),
	(97, 11, 'documento_id', 'text', 'Documento Id', 1, 1, 1, 1, 1, 1, '{}', 6),
	(98, 11, 'documento', 'text', 'Documento', 1, 1, 1, 1, 1, 1, '{"display":{"width":"6"}}', 8),
	(99, 12, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(100, 12, 'origen', 'text', 'Origen', 1, 1, 1, 1, 1, 1, '{"display":{"width":"6"}}', 2),
	(101, 12, 'destino', 'text', 'Destino', 1, 1, 1, 1, 1, 1, '{"display":{"width":"6"}}', 3),
	(102, 12, 'precio', 'text', 'Precio', 0, 1, 1, 1, 1, 1, '{"display":{"width":"6"}}', 4),
	(103, 12, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, '{}', 5),
	(104, 12, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
	(109, 14, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(110, 14, 'nombre', 'text', 'Nombre', 0, 1, 1, 1, 1, 1, '{}', 2),
	(111, 14, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 3),
	(112, 14, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4);
/*!40000 ALTER TABLE `data_rows` ENABLE KEYS */;

-- Volcando estructura para tabla transporte.data_types
CREATE TABLE IF NOT EXISTS `data_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla transporte.data_types: ~13 rows (aproximadamente)
/*!40000 ALTER TABLE `data_types` DISABLE KEYS */;
INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
	(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2019-07-25 00:47:32', '2019-07-25 00:47:32'),
	(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2019-07-25 00:47:32', '2019-07-25 00:47:32'),
	(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, '', '', 1, 0, NULL, '2019-07-25 00:47:32', '2019-07-25 00:47:32'),
	(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2019-07-25 00:47:51', '2019-07-25 00:47:51'),
	(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2019-07-25 00:47:53', '2019-07-25 00:47:53'),
	(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2019-07-25 00:47:54', '2019-07-25 00:47:54'),
	(7, 'owners', 'owners', 'Dueño', 'Dueños', NULL, 'App\\Owner', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}', '2019-07-25 01:11:15', '2019-07-25 01:18:05'),
	(8, 'vehiculos', 'vehiculos', 'Vehiculo', 'Vehiculos', NULL, 'App\\Vehiculo', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}', '2019-07-25 01:21:27', '2019-07-25 01:32:23'),
	(9, 'chauffeurs', 'chauffeurs', 'chofer', 'choferes', NULL, 'App\\Chauffeur', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null}', '2019-07-25 01:43:33', '2019-07-25 01:43:33'),
	(10, 'documentos', 'documentos', 'Documento', 'Documentos', NULL, 'App\\Documento', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null}', '2019-07-25 01:51:18', '2019-07-25 01:51:18'),
	(11, 'clientes', 'clientes', 'Cliente', 'Clientes', NULL, 'App\\Cliente', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}', '2019-07-25 01:59:39', '2019-07-25 02:09:59'),
	(12, 'rutas', 'rutas', 'Ruta', 'Rutas', NULL, 'App\\Ruta', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null}', '2019-07-25 02:16:29', '2019-07-25 02:16:29'),
	(14, 'categorias', 'categorias', 'Categoria', 'Categorias', 'voyager-milestone', 'App\\Categoria', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null}', '2019-07-28 00:33:30', '2019-07-28 00:33:30');
/*!40000 ALTER TABLE `data_types` ENABLE KEYS */;

-- Volcando estructura para tabla transporte.detallecuentaxpagar
CREATE TABLE IF NOT EXISTS `detallecuentaxpagar` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cuenta_id` int(10) unsigned NOT NULL,
  `abonado` decimal(10,0) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla transporte.detallecuentaxpagar: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `detallecuentaxpagar` DISABLE KEYS */;
INSERT INTO `detallecuentaxpagar` (`id`, `cuenta_id`, `abonado`, `created_at`, `updated_at`) VALUES
	(1, 1, 4000, '2019-08-31 21:39:14', '2019-08-31 21:39:14'),
	(2, 2, 2000, '2019-08-31 21:39:14', '2019-08-31 21:39:14');
/*!40000 ALTER TABLE `detallecuentaxpagar` ENABLE KEYS */;

-- Volcando estructura para tabla transporte.detalles
CREATE TABLE IF NOT EXISTS `detalles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `carga_id` int(10) unsigned NOT NULL,
  `vehiculo_id` int(10) unsigned NOT NULL,
  `chofer_id` int(10) unsigned NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `categoria_id` int(10) unsigned DEFAULT NULL,
  `observacion` text COLLATE utf8mb4_unicode_ci,
  `precio` decimal(10,0) DEFAULT NULL,
  `subtotal` decimal(10,0) DEFAULT NULL,
  `anticipo` decimal(10,0) DEFAULT NULL,
  `comision` decimal(10,0) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla transporte.detalles: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `detalles` DISABLE KEYS */;
INSERT INTO `detalles` (`id`, `carga_id`, `vehiculo_id`, `chofer_id`, `cantidad`, `categoria_id`, `observacion`, `precio`, `subtotal`, `anticipo`, `comision`, `total`, `created_at`, `updated_at`) VALUES
	(1, 1, 3, 2, 50, NULL, 'ninguna', 190, 10450, 4000, 150, 6300, '2019-08-31 21:39:14', '2019-08-31 21:39:14'),
	(2, 1, 2, 1, 45, NULL, NULL, 150, 7500, 2000, 100, 5400, '2019-08-31 21:39:14', '2019-08-31 21:39:14');
/*!40000 ALTER TABLE `detalles` ENABLE KEYS */;

-- Volcando estructura para tabla transporte.detalle_cuentas
CREATE TABLE IF NOT EXISTS `detalle_cuentas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cuenta_id` int(10) unsigned NOT NULL,
  `abonado` decimal(10,0) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla transporte.detalle_cuentas: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `detalle_cuentas` DISABLE KEYS */;
INSERT INTO `detalle_cuentas` (`id`, `cuenta_id`, `abonado`, `created_at`, `updated_at`) VALUES
	(1, 1, 8000, '2019-08-31 21:39:16', '2019-08-31 21:39:16');
/*!40000 ALTER TABLE `detalle_cuentas` ENABLE KEYS */;

-- Volcando estructura para tabla transporte.documentos
CREATE TABLE IF NOT EXISTS `documentos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombres` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla transporte.documentos: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `documentos` DISABLE KEYS */;
INSERT INTO `documentos` (`id`, `nombres`, `created_at`, `updated_at`) VALUES
	(2, 'CI', '2019-07-25 01:52:06', '2019-07-25 01:52:06'),
	(3, 'NIT', '2019-07-25 01:52:35', '2019-07-25 01:52:35'),
	(4, 'CE', '2019-07-25 01:52:43', '2019-07-25 01:52:43'),
	(5, 'RUC', '2019-07-25 01:53:13', '2019-07-25 01:53:13'),
	(6, 'OTRO', '2019-07-25 01:53:21', '2019-07-25 01:53:21');
/*!40000 ALTER TABLE `documentos` ENABLE KEYS */;

-- Volcando estructura para tabla transporte.menus
CREATE TABLE IF NOT EXISTS `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla transporte.menus: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'admin', '2019-07-25 00:47:34', '2019-07-25 00:47:34');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;

-- Volcando estructura para tabla transporte.menu_items
CREATE TABLE IF NOT EXISTS `menu_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`),
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla transporte.menu_items: ~27 rows (aproximadamente)
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
	(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2019-07-25 00:47:34', '2019-07-25 00:47:34', 'voyager.dashboard', NULL),
	(2, 1, 'Media', '', '_self', 'voyager-images', NULL, 24, 1, '2019-07-25 00:47:34', '2019-08-20 20:29:32', 'voyager.media.index', NULL),
	(3, 1, 'Users', '', '_self', 'voyager-person', NULL, 27, 1, '2019-07-25 00:47:34', '2019-08-28 04:40:17', 'voyager.users.index', NULL),
	(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, 27, 2, '2019-07-25 00:47:35', '2019-08-28 04:40:18', 'voyager.roles.index', NULL),
	(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 14, '2019-07-25 00:47:35', '2019-09-01 18:33:00', NULL, NULL),
	(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 1, '2019-07-25 00:47:35', '2019-08-20 20:30:42', 'voyager.menus.index', NULL),
	(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 2, '2019-07-25 00:47:35', '2019-08-20 20:30:42', 'voyager.database.index', NULL),
	(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2019-07-25 00:47:35', '2019-08-20 20:30:42', 'voyager.compass.index', NULL),
	(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2019-07-25 00:47:35', '2019-08-20 20:30:43', 'voyager.bread.index', NULL),
	(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, 5, 6, '2019-07-25 00:47:35', '2019-08-20 20:30:43', 'voyager.settings.index', NULL),
	(11, 1, 'Categories', '', '_self', 'voyager-categories', NULL, 24, 4, '2019-07-25 00:47:52', '2019-08-20 20:29:43', 'voyager.categories.index', NULL),
	(12, 1, 'Posts', '', '_self', 'voyager-news', NULL, 24, 2, '2019-07-25 00:47:54', '2019-08-20 20:29:35', 'voyager.posts.index', NULL),
	(13, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, 24, 3, '2019-07-25 00:47:55', '2019-08-20 20:29:41', 'voyager.pages.index', NULL),
	(14, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 5, '2019-07-25 00:48:00', '2019-08-20 20:30:43', 'voyager.hooks', NULL),
	(15, 1, 'dueños', '', '_self', 'voyager-people', '#000000', NULL, 6, '2019-07-25 01:11:15', '2019-09-01 18:33:00', 'voyager.owners.index', 'null'),
	(16, 1, 'Vehiculos', '', '_self', 'voyager-truck', '#000000', NULL, 5, '2019-07-25 01:21:27', '2019-09-01 00:14:13', 'voyager.vehiculos.index', 'null'),
	(17, 1, 'choferes', '', '_self', 'voyager-boat', '#000000', NULL, 7, '2019-07-25 01:43:33', '2019-09-01 18:33:00', 'voyager.chauffeurs.index', 'null'),
	(18, 1, 'Documentos', '', '_self', 'voyager-book', '#000000', NULL, 8, '2019-07-25 01:51:18', '2019-09-01 18:33:00', 'voyager.documentos.index', 'null'),
	(19, 1, 'Clientes', '', '_self', 'voyager-pirate', '#000000', NULL, 9, '2019-07-25 01:59:39', '2019-09-01 18:33:00', 'voyager.clientes.index', 'null'),
	(20, 1, 'Rutas', '', '_self', 'voyager-thumb-tack', '#000000', NULL, 10, '2019-07-25 02:16:29', '2019-09-01 18:33:00', 'voyager.rutas.index', 'null'),
	(22, 1, 'Categorias', '', '_self', 'voyager-milestone', NULL, NULL, 11, '2019-07-28 00:33:31', '2019-09-01 18:33:00', 'voyager.categorias.index', NULL),
	(23, 1, 'Ordenes', '', '_self', 'voyager-params', '#000000', NULL, 4, '2019-08-16 21:06:19', '2019-09-01 00:14:13', 'cargas.index', NULL),
	(24, 1, 'voayager', '', '_self', 'voyager-helm', '#000000', NULL, 12, '2019-08-20 20:28:52', '2019-09-01 18:33:00', NULL, ''),
	(25, 1, 'cuentas', '', '_self', 'voyager-archive', '#000000', NULL, 2, '2019-08-20 20:34:48', '2019-08-31 23:51:21', NULL, ''),
	(26, 1, 'Cuentas por Cobrar', '', '_self', 'voyager-angle-right', '#000000', 25, 1, '2019-08-20 22:54:09', '2019-08-20 23:15:51', 'cobrarcuentas.index', 'null'),
	(27, 1, 'Seguridad', '', '_self', 'voyager-lock', '#000000', NULL, 13, '2019-08-28 04:39:26', '2019-09-01 18:33:00', NULL, ''),
	(28, 1, 'Cuentas x Pagar', '', '_self', NULL, '#000000', 25, 2, '2019-08-31 22:22:16', '2019-08-31 22:23:06', 'pagarcuentas.index', 'null'),
	(29, 1, 'Clientes', '', '_self', NULL, '#000000', 30, 1, '2019-09-01 00:10:35', '2019-09-01 00:13:37', 'extractoclientes', NULL),
	(30, 1, 'Extractos', '', '_self', 'voyager-logbook', '#000000', NULL, 3, '2019-09-01 00:13:24', '2019-09-01 00:14:12', NULL, ''),
	(31, 1, 'Camioneros', '', '_self', NULL, '#000000', 30, 2, '2019-09-01 18:32:30', '2019-09-01 18:32:59', 'extractowners', NULL);
/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;

-- Volcando estructura para tabla transporte.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla transporte.migrations: ~26 rows (aproximadamente)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2016_01_01_000000_add_voyager_user_fields', 1),
	(4, '2016_01_01_000000_create_data_types_table', 1),
	(5, '2016_05_19_173453_create_menu_table', 1),
	(6, '2016_10_21_190000_create_roles_table', 1),
	(7, '2016_10_21_190000_create_settings_table', 1),
	(8, '2016_11_30_135954_create_permission_table', 1),
	(9, '2016_11_30_141208_create_permission_role_table', 1),
	(10, '2016_12_26_201236_data_types__add__server_side', 1),
	(11, '2017_01_13_000000_add_route_to_menu_items_table', 1),
	(12, '2017_01_14_005015_create_translations_table', 1),
	(13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
	(14, '2017_03_06_000000_add_controller_to_data_types_table', 1),
	(15, '2017_04_21_000000_add_order_to_data_rows_table', 1),
	(16, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
	(17, '2017_08_05_000000_add_group_to_settings_table', 1),
	(18, '2017_11_26_013050_add_user_role_relationship', 1),
	(19, '2017_11_26_015000_create_user_roles_table', 1),
	(20, '2018_03_11_000000_add_user_settings', 1),
	(21, '2018_03_14_000000_add_details_to_data_types_table', 1),
	(22, '2018_03_16_000000_make_settings_value_nullable', 1),
	(23, '2016_01_01_000000_create_pages_table', 2),
	(24, '2016_01_01_000000_create_posts_table', 2),
	(25, '2016_02_15_204651_create_categories_table', 2),
	(26, '2017_04_11_000000_alter_post_nullable_fields_table', 2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Volcando estructura para tabla transporte.owners
CREATE TABLE IF NOT EXISTS `owners` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apellidos` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direccion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  `celular` int(11) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla transporte.owners: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `owners` DISABLE KEYS */;
INSERT INTO `owners` (`id`, `nombre`, `apellidos`, `direccion`, `telefono`, `celular`, `email`, `created_at`, `updated_at`) VALUES
	(1, 'Juan', 'Noe Mendoza', 'zona ponpeya', 24566755, 788655, 'juan@gmail.com', '2019-07-25 01:12:41', '2019-07-25 01:12:41'),
	(2, 'roberth', 'chilo rojas', 'vill corina', 76888828, 76882828, 'xxx@gmail.com', '2019-08-22 17:10:23', '2019-08-22 17:10:23'),
	(3, 'irineo', 'cruz', NULL, NULL, NULL, NULL, '2019-08-22 17:11:08', '2019-08-22 17:11:08'),
	(4, 'yimi', 'camacho', NULL, NULL, NULL, NULL, '2019-08-22 17:11:54', '2019-08-22 17:11:54'),
	(5, 'willi honor', NULL, NULL, NULL, NULL, NULL, '2019-08-22 17:12:21', '2019-08-22 17:12:21'),
	(6, 'bania', 'valverde', NULL, NULL, NULL, NULL, '2019-08-22 17:12:44', '2019-08-22 17:12:44'),
	(7, 'willian', 'herrera', NULL, NULL, NULL, NULL, '2019-08-22 17:13:19', '2019-08-22 17:13:19');
/*!40000 ALTER TABLE `owners` ENABLE KEYS */;

-- Volcando estructura para tabla transporte.pages
CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla transporte.pages: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
	(1, 1, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'INACTIVE', '2019-07-25 00:47:56', '2019-07-27 23:07:19');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;

-- Volcando estructura para tabla transporte.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla transporte.password_resets: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Volcando estructura para tabla transporte.permissions
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla transporte.permissions: ~76 rows (aproximadamente)
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
	(1, 'browse_admin', NULL, '2019-07-25 00:47:35', '2019-07-25 00:47:35'),
	(2, 'browse_bread', NULL, '2019-07-25 00:47:35', '2019-07-25 00:47:35'),
	(3, 'browse_database', NULL, '2019-07-25 00:47:36', '2019-07-25 00:47:36'),
	(4, 'browse_media', NULL, '2019-07-25 00:47:36', '2019-07-25 00:47:36'),
	(5, 'browse_compass', NULL, '2019-07-25 00:47:36', '2019-07-25 00:47:36'),
	(6, 'browse_menus', 'menus', '2019-07-25 00:47:36', '2019-07-25 00:47:36'),
	(7, 'read_menus', 'menus', '2019-07-25 00:47:36', '2019-07-25 00:47:36'),
	(8, 'edit_menus', 'menus', '2019-07-25 00:47:36', '2019-07-25 00:47:36'),
	(9, 'add_menus', 'menus', '2019-07-25 00:47:37', '2019-07-25 00:47:37'),
	(10, 'delete_menus', 'menus', '2019-07-25 00:47:37', '2019-07-25 00:47:37'),
	(11, 'browse_roles', 'roles', '2019-07-25 00:47:37', '2019-07-25 00:47:37'),
	(12, 'read_roles', 'roles', '2019-07-25 00:47:37', '2019-07-25 00:47:37'),
	(13, 'edit_roles', 'roles', '2019-07-25 00:47:37', '2019-07-25 00:47:37'),
	(14, 'add_roles', 'roles', '2019-07-25 00:47:37', '2019-07-25 00:47:37'),
	(15, 'delete_roles', 'roles', '2019-07-25 00:47:37', '2019-07-25 00:47:37'),
	(16, 'browse_users', 'users', '2019-07-25 00:47:37', '2019-07-25 00:47:37'),
	(17, 'read_users', 'users', '2019-07-25 00:47:37', '2019-07-25 00:47:37'),
	(18, 'edit_users', 'users', '2019-07-25 00:47:37', '2019-07-25 00:47:37'),
	(19, 'add_users', 'users', '2019-07-25 00:47:37', '2019-07-25 00:47:37'),
	(20, 'delete_users', 'users', '2019-07-25 00:47:37', '2019-07-25 00:47:37'),
	(21, 'browse_settings', 'settings', '2019-07-25 00:47:37', '2019-07-25 00:47:37'),
	(22, 'read_settings', 'settings', '2019-07-25 00:47:37', '2019-07-25 00:47:37'),
	(23, 'edit_settings', 'settings', '2019-07-25 00:47:37', '2019-07-25 00:47:37'),
	(24, 'add_settings', 'settings', '2019-07-25 00:47:38', '2019-07-25 00:47:38'),
	(25, 'delete_settings', 'settings', '2019-07-25 00:47:38', '2019-07-25 00:47:38'),
	(26, 'browse_categories', 'categories', '2019-07-25 00:47:52', '2019-07-25 00:47:52'),
	(27, 'read_categories', 'categories', '2019-07-25 00:47:52', '2019-07-25 00:47:52'),
	(28, 'edit_categories', 'categories', '2019-07-25 00:47:52', '2019-07-25 00:47:52'),
	(29, 'add_categories', 'categories', '2019-07-25 00:47:52', '2019-07-25 00:47:52'),
	(30, 'delete_categories', 'categories', '2019-07-25 00:47:52', '2019-07-25 00:47:52'),
	(31, 'browse_posts', 'posts', '2019-07-25 00:47:54', '2019-07-25 00:47:54'),
	(32, 'read_posts', 'posts', '2019-07-25 00:47:54', '2019-07-25 00:47:54'),
	(33, 'edit_posts', 'posts', '2019-07-25 00:47:54', '2019-07-25 00:47:54'),
	(34, 'add_posts', 'posts', '2019-07-25 00:47:54', '2019-07-25 00:47:54'),
	(35, 'delete_posts', 'posts', '2019-07-25 00:47:54', '2019-07-25 00:47:54'),
	(36, 'browse_pages', 'pages', '2019-07-25 00:47:55', '2019-07-25 00:47:55'),
	(37, 'read_pages', 'pages', '2019-07-25 00:47:55', '2019-07-25 00:47:55'),
	(38, 'edit_pages', 'pages', '2019-07-25 00:47:55', '2019-07-25 00:47:55'),
	(39, 'add_pages', 'pages', '2019-07-25 00:47:55', '2019-07-25 00:47:55'),
	(40, 'delete_pages', 'pages', '2019-07-25 00:47:55', '2019-07-25 00:47:55'),
	(41, 'browse_hooks', NULL, '2019-07-25 00:48:00', '2019-07-25 00:48:00'),
	(42, 'browse_owners', 'owners', '2019-07-25 01:11:15', '2019-07-25 01:11:15'),
	(43, 'read_owners', 'owners', '2019-07-25 01:11:15', '2019-07-25 01:11:15'),
	(44, 'edit_owners', 'owners', '2019-07-25 01:11:15', '2019-07-25 01:11:15'),
	(45, 'add_owners', 'owners', '2019-07-25 01:11:15', '2019-07-25 01:11:15'),
	(46, 'delete_owners', 'owners', '2019-07-25 01:11:15', '2019-07-25 01:11:15'),
	(47, 'browse_vehiculos', 'vehiculos', '2019-07-25 01:21:27', '2019-07-25 01:21:27'),
	(48, 'read_vehiculos', 'vehiculos', '2019-07-25 01:21:27', '2019-07-25 01:21:27'),
	(49, 'edit_vehiculos', 'vehiculos', '2019-07-25 01:21:27', '2019-07-25 01:21:27'),
	(50, 'add_vehiculos', 'vehiculos', '2019-07-25 01:21:27', '2019-07-25 01:21:27'),
	(51, 'delete_vehiculos', 'vehiculos', '2019-07-25 01:21:27', '2019-07-25 01:21:27'),
	(52, 'browse_chauffeurs', 'chauffeurs', '2019-07-25 01:43:33', '2019-07-25 01:43:33'),
	(53, 'read_chauffeurs', 'chauffeurs', '2019-07-25 01:43:33', '2019-07-25 01:43:33'),
	(54, 'edit_chauffeurs', 'chauffeurs', '2019-07-25 01:43:33', '2019-07-25 01:43:33'),
	(55, 'add_chauffeurs', 'chauffeurs', '2019-07-25 01:43:33', '2019-07-25 01:43:33'),
	(56, 'delete_chauffeurs', 'chauffeurs', '2019-07-25 01:43:33', '2019-07-25 01:43:33'),
	(57, 'browse_documentos', 'documentos', '2019-07-25 01:51:18', '2019-07-25 01:51:18'),
	(58, 'read_documentos', 'documentos', '2019-07-25 01:51:18', '2019-07-25 01:51:18'),
	(59, 'edit_documentos', 'documentos', '2019-07-25 01:51:18', '2019-07-25 01:51:18'),
	(60, 'add_documentos', 'documentos', '2019-07-25 01:51:18', '2019-07-25 01:51:18'),
	(61, 'delete_documentos', 'documentos', '2019-07-25 01:51:18', '2019-07-25 01:51:18'),
	(62, 'browse_clientes', 'clientes', '2019-07-25 01:59:39', '2019-07-25 01:59:39'),
	(63, 'read_clientes', 'clientes', '2019-07-25 01:59:39', '2019-07-25 01:59:39'),
	(64, 'edit_clientes', 'clientes', '2019-07-25 01:59:39', '2019-07-25 01:59:39'),
	(65, 'add_clientes', 'clientes', '2019-07-25 01:59:39', '2019-07-25 01:59:39'),
	(66, 'delete_clientes', 'clientes', '2019-07-25 01:59:39', '2019-07-25 01:59:39'),
	(67, 'browse_rutas', 'rutas', '2019-07-25 02:16:29', '2019-07-25 02:16:29'),
	(68, 'read_rutas', 'rutas', '2019-07-25 02:16:29', '2019-07-25 02:16:29'),
	(69, 'edit_rutas', 'rutas', '2019-07-25 02:16:29', '2019-07-25 02:16:29'),
	(70, 'add_rutas', 'rutas', '2019-07-25 02:16:29', '2019-07-25 02:16:29'),
	(71, 'delete_rutas', 'rutas', '2019-07-25 02:16:29', '2019-07-25 02:16:29'),
	(77, 'browse_categorias', 'categorias', '2019-07-28 00:33:30', '2019-07-28 00:33:30'),
	(78, 'read_categorias', 'categorias', '2019-07-28 00:33:30', '2019-07-28 00:33:30'),
	(79, 'edit_categorias', 'categorias', '2019-07-28 00:33:30', '2019-07-28 00:33:30'),
	(80, 'add_categorias', 'categorias', '2019-07-28 00:33:30', '2019-07-28 00:33:30'),
	(81, 'delete_categorias', 'categorias', '2019-07-28 00:33:30', '2019-07-28 00:33:30');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;

-- Volcando estructura para tabla transporte.permission_role
CREATE TABLE IF NOT EXISTS `permission_role` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla transporte.permission_role: ~132 rows (aproximadamente)
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
	(1, 1),
	(1, 3),
	(1, 4),
	(2, 1),
	(3, 1),
	(4, 1),
	(5, 1),
	(6, 1),
	(7, 1),
	(8, 1),
	(9, 1),
	(10, 1),
	(11, 1),
	(12, 1),
	(13, 1),
	(14, 1),
	(15, 1),
	(16, 1),
	(16, 3),
	(17, 1),
	(17, 3),
	(18, 1),
	(18, 3),
	(19, 1),
	(19, 3),
	(20, 1),
	(21, 1),
	(22, 1),
	(23, 1),
	(24, 1),
	(25, 1),
	(26, 1),
	(27, 1),
	(28, 1),
	(29, 1),
	(30, 1),
	(31, 1),
	(32, 1),
	(33, 1),
	(34, 1),
	(35, 1),
	(36, 1),
	(37, 1),
	(38, 1),
	(39, 1),
	(40, 1),
	(42, 1),
	(42, 3),
	(42, 4),
	(43, 1),
	(43, 3),
	(43, 4),
	(44, 1),
	(44, 3),
	(44, 4),
	(45, 1),
	(45, 3),
	(45, 4),
	(46, 1),
	(46, 3),
	(47, 1),
	(47, 3),
	(47, 4),
	(48, 1),
	(48, 3),
	(48, 4),
	(49, 1),
	(49, 3),
	(49, 4),
	(50, 1),
	(50, 3),
	(50, 4),
	(51, 1),
	(51, 3),
	(52, 1),
	(52, 3),
	(52, 4),
	(53, 1),
	(53, 3),
	(53, 4),
	(54, 1),
	(54, 3),
	(54, 4),
	(55, 1),
	(55, 3),
	(55, 4),
	(56, 1),
	(56, 3),
	(57, 1),
	(57, 3),
	(57, 4),
	(58, 1),
	(58, 3),
	(58, 4),
	(59, 1),
	(59, 3),
	(59, 4),
	(60, 1),
	(60, 3),
	(60, 4),
	(61, 1),
	(61, 3),
	(61, 4),
	(62, 1),
	(62, 3),
	(62, 4),
	(63, 1),
	(63, 3),
	(63, 4),
	(64, 1),
	(64, 3),
	(64, 4),
	(65, 1),
	(65, 3),
	(65, 4),
	(66, 1),
	(66, 3),
	(67, 1),
	(67, 3),
	(68, 1),
	(68, 3),
	(69, 1),
	(69, 3),
	(70, 1),
	(70, 3),
	(71, 1),
	(71, 3),
	(77, 1),
	(78, 1),
	(79, 1),
	(80, 1),
	(81, 1);
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;

-- Volcando estructura para tabla transporte.posts
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla transporte.posts: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
	(1, 0, NULL, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2019-07-25 00:47:54', '2019-07-25 00:47:54'),
	(2, 0, NULL, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\n                <h2>We can use all kinds of format!</h2>\n                <p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2019-07-25 00:47:54', '2019-07-25 00:47:54'),
	(3, 0, NULL, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2019-07-25 00:47:54', '2019-07-25 00:47:54'),
	(4, 0, NULL, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2019-07-25 00:47:54', '2019-07-25 00:47:54');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;

-- Volcando estructura para tabla transporte.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla transporte.roles: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
	(1, 'admin', 'Administrator', '2019-07-25 00:47:35', '2019-07-25 00:47:35'),
	(2, 'user', 'Normal User', '2019-07-25 00:47:35', '2019-07-25 00:47:35'),
	(3, 'dueño', 'Dueño', '2019-07-25 02:21:41', '2019-07-25 02:21:41'),
	(4, 'secretaria', 'Secretaria', '2019-07-25 02:23:20', '2019-07-25 02:23:20');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Volcando estructura para tabla transporte.rutas
CREATE TABLE IF NOT EXISTS `rutas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `origen` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `destino` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `precio` decimal(10,0) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla transporte.rutas: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `rutas` DISABLE KEYS */;
INSERT INTO `rutas` (`id`, `origen`, `destino`, `precio`, `created_at`, `updated_at`) VALUES
	(1, 'Alizal Beni', 'Santa lucia Sta Cruz', 130, '2019-07-25 02:18:01', '2019-08-25 17:18:23'),
	(2, 'Trinidad', 'Santa Cruz', 520, '2019-08-16 22:32:01', '2019-08-16 22:32:01'),
	(3, 'San andres', 'San pedro', 50, '2019-08-16 22:32:26', '2019-08-16 22:32:26');
/*!40000 ALTER TABLE `rutas` ENABLE KEYS */;

-- Volcando estructura para tabla transporte.settings
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla transporte.settings: ~14 rows (aproximadamente)
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
	(1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site'),
	(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
	(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
	(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 4, 'Site'),
	(5, 'admin.bg_image', 'Admin Background Image', 'settings\\August2019\\MSRnq7zYZSrX2dkfKAiC.jpg', '', 'image', 5, 'Admin'),
	(6, 'admin.title', 'Admin Title', 'G-TRINIGAN', '', 'text', 1, 'Admin'),
	(7, 'admin.description', 'Admin Description', 'Empresa de transporte', '', 'text', 2, 'Admin'),
	(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
	(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
	(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 1, 'Admin'),
	(12, 'empresa.direccion', 'Direccion', '', NULL, 'text', 8, 'Empresa'),
	(13, 'empresa.telefono', 'Telefono', '', NULL, 'text', 9, 'Empresa'),
	(14, 'empresa.logo', 'Logo', '', NULL, 'image', 10, 'Empresa'),
	(15, 'empresa.nombre', 'Nombre Empresa', '', NULL, 'text', 7, 'Empresa');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;

-- Volcando estructura para tabla transporte.translations
CREATE TABLE IF NOT EXISTS `translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla transporte.translations: ~30 rows (aproximadamente)
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
	(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2019-07-25 00:47:56', '2019-07-25 00:47:56'),
	(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2019-07-25 00:47:56', '2019-07-25 00:47:56'),
	(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2019-07-25 00:47:56', '2019-07-25 00:47:56'),
	(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2019-07-25 00:47:56', '2019-07-25 00:47:56'),
	(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2019-07-25 00:47:56', '2019-07-25 00:47:56'),
	(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2019-07-25 00:47:56', '2019-07-25 00:47:56'),
	(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2019-07-25 00:47:56', '2019-07-25 00:47:56'),
	(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2019-07-25 00:47:56', '2019-07-25 00:47:56'),
	(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2019-07-25 00:47:56', '2019-07-25 00:47:56'),
	(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2019-07-25 00:47:56', '2019-07-25 00:47:56'),
	(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2019-07-25 00:47:56', '2019-07-25 00:47:56'),
	(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2019-07-25 00:47:56', '2019-07-25 00:47:56'),
	(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2019-07-25 00:47:56', '2019-07-25 00:47:56'),
	(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2019-07-25 00:47:56', '2019-07-25 00:47:56'),
	(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2019-07-25 00:47:57', '2019-07-25 00:47:57'),
	(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2019-07-25 00:47:57', '2019-07-25 00:47:57'),
	(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2019-07-25 00:47:57', '2019-07-25 00:47:57'),
	(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2019-07-25 00:47:57', '2019-07-25 00:47:57'),
	(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2019-07-25 00:47:57', '2019-07-25 00:47:57'),
	(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2019-07-25 00:47:57', '2019-07-25 00:47:57'),
	(21, 'menu_items', 'title', 2, 'pt', 'Media', '2019-07-25 00:47:57', '2019-07-25 00:47:57'),
	(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2019-07-25 00:47:57', '2019-07-25 00:47:57'),
	(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2019-07-25 00:47:57', '2019-07-25 00:47:57'),
	(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2019-07-25 00:47:57', '2019-07-25 00:47:57'),
	(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2019-07-25 00:47:57', '2019-07-25 00:47:57'),
	(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2019-07-25 00:47:58', '2019-07-25 00:47:58'),
	(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2019-07-25 00:47:58', '2019-07-25 00:47:58'),
	(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2019-07-25 00:47:58', '2019-07-25 00:47:58'),
	(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2019-07-25 00:47:58', '2019-07-25 00:47:58'),
	(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2019-07-25 00:47:58', '2019-07-25 00:47:58');
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;

-- Volcando estructura para tabla transporte.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla transporte.users: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
	(1, 1, 'Admin', 'admin@admin.com', 'users/default.png', NULL, '$2y$10$.yjLlxXN6f7qtYDkk17zve/BVlPpxuwm3vuQvFzWkUeOBhmR5ErjG', 'hFqwGjiVUtPgDrdSUPYykfeO1zED3QEfpeU8UQoxMGQT9FI4u8LeWZu5oiy9', NULL, '2019-07-25 00:47:53', '2019-07-25 00:47:53'),
	(2, 3, 'Karen', 'karen@gmail.com', 'users\\July2019\\fe9YHJ423oMj11uxjDPa.png', NULL, '$2y$10$yaDNNxbnVGV58463N0/WUufleq9cRbPx.DI4rkSvG1nbFxmeydG6O', NULL, '{"locale":"es"}', '2019-07-25 02:25:22', '2019-07-25 13:35:27');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Volcando estructura para tabla transporte.user_roles
CREATE TABLE IF NOT EXISTS `user_roles` (
  `user_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_user_id_index` (`user_id`),
  KEY `user_roles_role_id_index` (`role_id`),
  CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla transporte.user_roles: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;

-- Volcando estructura para tabla transporte.vehiculos
CREATE TABLE IF NOT EXISTS `vehiculos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `placa` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modelo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `n_motor` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `serie` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `capacidad` int(11) DEFAULT NULL,
  `placa_carreta` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `owner_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `vehiculos_placa_unique` (`placa`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla transporte.vehiculos: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `vehiculos` DISABLE KEYS */;
INSERT INTO `vehiculos` (`id`, `placa`, `modelo`, `n_motor`, `serie`, `capacidad`, `placa_carreta`, `owner_id`, `created_at`, `updated_at`) VALUES
	(1, 'c-677-SZN', '2004', '23355778', '223445666', 55, '677-szn', 1, '2019-07-25 01:31:00', '2019-08-24 18:09:01'),
	(2, 'b-12345', '2010', '1231314', '21322131', 50, 'q22222', 5, '2019-08-24 18:03:00', '2019-08-24 18:08:48'),
	(3, 'a-1234', '2000', 'sd2324', 'wewrwer', 55, 'werwer', 2, '2019-08-24 18:04:00', '2019-08-24 18:08:37');
/*!40000 ALTER TABLE `vehiculos` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
