-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.37-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win32
-- HeidiSQL Version:             10.1.0.5464
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for order_db
CREATE DATABASE IF NOT EXISTS `order_db` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `order_db`;

-- Dumping structure for table order_db.customers
CREATE TABLE IF NOT EXISTS `customers` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(50) NOT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table order_db.customers: ~1 rows (approximately)
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` (`customer_id`, `customer_name`) VALUES
	(2, 'John');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;

-- Dumping structure for table order_db.items
CREATE TABLE IF NOT EXISTS `items` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_name` varchar(50) NOT NULL DEFAULT '0',
  `item_cost` decimal(10,0) NOT NULL DEFAULT '0',
  PRIMARY KEY (`item_id`),
  UNIQUE KEY `item_id` (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table order_db.items: ~2 rows (approximately)
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` (`item_id`, `item_name`, `item_cost`) VALUES
	(1, 'pencil', 1),
	(2, 'computer', 450);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;

-- Dumping structure for table order_db.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `num_items` int(11) DEFAULT '1',
  `item_id` int(11) DEFAULT '1',
  `rep_id` int(11) DEFAULT '1',
  `order_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `order_id` (`order_id`),
  KEY `orders_ibfk_1` (`item_id`),
  KEY `orders_ibfk_2` (`rep_id`),
  KEY `orders_ibfk_3` (`customer_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`rep_id`) REFERENCES `reps` (`rep_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- Dumping data for table order_db.orders: ~4 rows (approximately)
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` (`order_id`, `customer_id`, `num_items`, `item_id`, `rep_id`, `order_date`) VALUES
	(6, 2, 23, 2, 1, '2019-01-30 22:37:22'),
	(7, 2, 4, 1, 1, '2019-01-30 22:37:22'),
	(8, 2, 1, 1, 1, '2019-01-30 22:37:41'),
	(9, 2, 3, 2, 1, '2019-01-30 22:44:29');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;

-- Dumping structure for table order_db.reps
CREATE TABLE IF NOT EXISTS `reps` (
  `rep_id` int(11) NOT NULL AUTO_INCREMENT,
  `rep_name` varchar(50) NOT NULL,
  `rep_location` varchar(50) NOT NULL,
  PRIMARY KEY (`rep_id`),
  UNIQUE KEY `rep_id` (`rep_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table order_db.reps: ~1 rows (approximately)
/*!40000 ALTER TABLE `reps` DISABLE KEYS */;
INSERT INTO `reps` (`rep_id`, `rep_name`, `rep_location`) VALUES
	(1, 'Bob', 'East');
/*!40000 ALTER TABLE `reps` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
