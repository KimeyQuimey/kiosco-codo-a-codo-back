-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 14, 2024 at 02:01 PM
-- Server version: 8.0.27
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kiosko_codo`
--

-- --------------------------------------------------------

--
-- Table structure for table `categorias_productos`
--

DROP TABLE IF EXISTS `categorias_productos`;
CREATE TABLE IF NOT EXISTS `categorias_productos` (
  `id_categoria_producto` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`id_categoria_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `categorias_productos`
--

INSERT INTO `categorias_productos` (`id_categoria_producto`, `descripcion`) VALUES
(1, 'golosinas'),
(2, 'bebidas'),
(3, 'cigarrillos'),
(4, 'galletitas'),
(5, 'varios');

-- --------------------------------------------------------

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `fecha_carga` datetime DEFAULT CURRENT_TIMESTAMP,
  `fecha_update` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nombre`, `apellido`, `email`, `fecha_carga`, `fecha_update`) VALUES
(1, 'Jon', 'Snow', 'jon@gmail.com', '2024-06-13 23:16:57', '2024-06-13 23:16:57'),
(2, 'Joffrey', 'Baratheon', 'Joffrey@gmail.com', '2024-06-13 23:17:26', '2024-06-13 23:17:26'),
(3, 'Tyrion', 'Lannister', 'tyrion@gmail.com', '2024-06-13 23:18:11', '2024-06-13 23:18:11'),
(4, 'Samwell', 'Tarly', 'samwell@gmail.com', '2024-06-13 23:20:03', '2024-06-13 23:20:03'),
(5, 'Aemon', 'Targaryen', 'aemon@gmail.com', '2024-06-13 23:29:08', '2024-06-13 23:29:08');

-- --------------------------------------------------------

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
CREATE TABLE IF NOT EXISTS `productos` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `id_categoria_producto` int NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `fecha_carga` datetime DEFAULT CURRENT_TIMESTAMP,
  `fecha_update` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_producto`),
  KEY `id_categoria_producto` (`id_categoria_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `productos`
--

INSERT INTO `productos` (`id_producto`, `id_categoria_producto`, `nombre`, `precio`, `fecha_carga`, `fecha_update`) VALUES
(1, 1, 'Caramelo de Menta', '0.50', '2024-06-13 23:46:12', '2024-06-13 23:46:12'),
(2, 1, 'Chocolate con maní', '1.00', '2024-06-13 23:46:12', '2024-06-13 23:46:12'),
(3, 1, 'Chicle Bazooka', '0.75', '2024-06-13 23:46:12', '2024-06-13 23:46:12'),
(4, 1, 'Chupetín con sorpresa', '0.50', '2024-06-13 23:46:12', '2024-06-13 23:46:12'),
(5, 1, 'Caramelos de Fruta', '0.10', '2024-06-13 23:46:12', '2024-06-13 23:46:12'),
(6, 2, 'Agua Mineral (500 ml)', '1.00', '2024-06-13 23:46:12', '2024-06-13 23:46:12'),
(7, 2, 'Refresco (350 ml)	', '1.50', '2024-06-13 23:46:12', '2024-06-13 23:46:12'),
(8, 2, 'Jugo de Naranja (500 ml)', '2.00', '2024-06-13 23:46:12', '2024-06-13 23:46:12'),
(9, 2, 'Té Helado (500 ml)', '1.75', '2024-06-13 23:46:12', '2024-06-13 23:46:12'),
(10, 2, 'Café (vaso)', '1.50', '2024-06-13 23:46:12', '2024-06-13 23:46:12'),
(11, 3, 'Marlboro', '5.00', '2024-06-13 23:46:12', '2024-06-13 23:46:12'),
(12, 3, 'Camel', '4.50', '2024-06-13 23:46:12', '2024-06-13 23:46:12'),
(13, 3, 'Lucky Strike', '4.50', '2024-06-13 23:46:12', '2024-06-13 23:46:12'),
(14, 3, 'Philip Morris', '4.00', '2024-06-13 23:46:12', '2024-06-13 23:46:12'),
(15, 3, 'Pall Mall', '4.00', '2024-06-13 23:46:12', '2024-06-13 23:46:12'),
(16, 4, 'Sándwich', '3.00', '2024-06-13 23:46:12', '2024-06-13 23:46:12'),
(17, 4, 'Yogur (200 ml)', '2.50', '2024-06-13 23:46:12', '2024-06-13 23:46:12'),
(18, 4, 'Papas Fritas (bolsa)', '2.00', '2024-06-13 23:46:12', '2024-06-13 23:46:12');

-- --------------------------------------------------------

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
CREATE TABLE IF NOT EXISTS `ventas` (
  `id_venta` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int NOT NULL,
  `precio_total` decimal(10,2) DEFAULT NULL,
  `fecha_carga` datetime DEFAULT CURRENT_TIMESTAMP,
  `fecha_update` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_venta`),
  KEY `id_cliente` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `ventas`
--

INSERT INTO `ventas` (`id_venta`, `id_cliente`, `precio_total`, `fecha_carga`, `fecha_update`) VALUES
(1, 1, '0.50', '2024-06-13 23:48:42', '2024-06-13 23:48:42'),
(2, 2, '4.50', '2024-06-13 23:48:42', '2024-06-13 23:48:42'),
(3, 3, '20.25', '2024-06-13 23:48:42', '2024-06-13 23:48:42'),
(4, 4, '64.00', '2024-06-13 23:48:42', '2024-06-13 23:48:42'),
(5, 5, '7.00', '2024-06-13 23:48:42', '2024-06-13 23:48:42');

-- --------------------------------------------------------

--
-- Table structure for table `ventas_detalle`
--

DROP TABLE IF EXISTS `ventas_detalle`;
CREATE TABLE IF NOT EXISTS `ventas_detalle` (
  `id_venta_detalle` int NOT NULL AUTO_INCREMENT,
  `id_venta` int NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad` int NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_venta_detalle`),
  KEY `id_venta` (`id_venta`),
  KEY `id_producto` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `ventas_detalle`
--

INSERT INTO `ventas_detalle` (`id_venta_detalle`, `id_venta`, `id_producto`, `cantidad`, `precio`) VALUES
(1, 1, 1, 1, '0.50'),
(2, 2, 4, 1, '0.50'),
(3, 2, 8, 2, '4.00'),
(4, 3, 11, 1, '5.00'),
(5, 3, 2, 10, '10.00'),
(6, 3, 9, 3, '5.25'),
(7, 5, 4, 1, '1.50'),
(8, 5, 7, 2, '5.50'),
(9, 4, 3, 1, '5.50'),
(10, 4, 6, 10, '50.00'),
(11, 4, 5, 3, '8.50');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_categoria_producto`) REFERENCES `categorias_productos` (`id_categoria_producto`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `ventas_detalle`
--
ALTER TABLE `ventas_detalle`
  ADD CONSTRAINT `ventas_detalle_ibfk_1` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id_venta`),
  ADD CONSTRAINT `ventas_detalle_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
