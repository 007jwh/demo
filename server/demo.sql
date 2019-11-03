-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2019-11-01 07:33:28
-- 服务器版本： 10.1.34-MariaDB
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `demo`
--
CREATE DATABASE IF NOT EXISTS `demo` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `demo`;

-- --------------------------------------------------------

--
-- 表的结构 `demo_cart`
--

DROP TABLE IF EXISTS `demo_cart`;
CREATE TABLE IF NOT EXISTS `demo_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lid` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `lname` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `demo_cart`
--

INSERT INTO `demo_cart` (`id`, `lid`, `count`, `lname`, `price`, `uid`) VALUES
(7, 1, 19, '华为(HUAWEI)Mate30', '4299.00', 1),
(9, 3, 4, '华为(HUAWEI)Mate30', '4299.00', 1),
(12, 5, 2, '华为(HUAWEI)Mate30', '4299.00', 1),
(13, 6, 2, '华为(HUAWEI)Mate30', '4299.00', 1),
(14, 8, 1, '华为(HUAWEI)Mate30', '4299.00', 1),
(15, 9, 2, '华为(HUAWEI)Mate30', '4299.00', 1),
(16, 10, 1, '华为(HUAWEI)Mate30', '4299.00', 1),
(20, 4, 1, '华为(HUAWEI)Mate30', '4299.00', 1);

-- --------------------------------------------------------

--
-- 表的结构 `demo_laptop`
--

DROP TABLE IF EXISTS `demo_laptop`;
CREATE TABLE IF NOT EXISTS `demo_laptop` (
  `lid` int(11) NOT NULL AUTO_INCREMENT,
  `picture` varchar(255) DEFAULT NULL,
  `lname` varchar(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`lid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `demo_laptop`
--

INSERT INTO `demo_laptop` (`lid`, `picture`, `lname`, `model`, `price`) VALUES
(1, '../../static/shouye/45.jpg', '华为(HUAWEI)Mate30', '麒麟990旗舰芯徕卡三摄', '4299.00'),
(2, '../../static/shouye/45.jpg', '华为(HUAWEI)Mate30', '麒麟990旗舰芯徕卡三摄', '4299.00'),
(3, '../../static/shouye/45.jpg', '华为(HUAWEI)Mate30', '麒麟990旗舰芯徕卡三摄', '4299.00'),
(4, '../../static/shouye/45.jpg', '华为(HUAWEI)Mate30', '麒麟990旗舰芯徕卡三摄', '4299.00'),
(5, '../../static/shouye/45.jpg', '华为(HUAWEI)Mate30', '麒麟990旗舰芯徕卡三摄', '4299.00'),
(6, '../../static/shouye/96.jpg', '华为(HUAWEI)Mate30', '麒麟990旗舰芯徕卡三摄', '4299.00'),
(7, '../../static/shouye/96.jpg', '华为(HUAWEI)Mate30', '麒麟990旗舰芯徕卡三摄', '4299.00'),
(8, '../../static/shouye/96.jpg', '华为(HUAWEI)Mate30', '麒麟990旗舰芯徕卡三摄', '4299.00'),
(9, '../../static/shouye/96.jpg', '华为(HUAWEI)Mate30', '麒麟990旗舰芯徕卡三摄', '4299.00'),
(10, '../../static/shouye/96.jpg', '华为(HUAWEI)Mate30', '麒麟990旗舰芯徕卡三摄', '4299.00');

-- --------------------------------------------------------

--
-- 表的结构 `demo_login`
--

DROP TABLE IF EXISTS `demo_login`;
CREATE TABLE IF NOT EXISTS `demo_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` char(11) DEFAULT NULL,
  `upwd` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `demo_login`
--

INSERT INTO `demo_login` (`id`, `phone`, `upwd`) VALUES
(1, '18136515334', '202cb962ac59075b964b07152d234b70'),
(2, '18111111111', 'caf1a3dfb505ffed0d024130f58c5cfa'),
(3, '12355555555', '4fda68f097ac0ec37a9fe56e317c48bb');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
