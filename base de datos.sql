-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.0.30 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para gestionferreteria
CREATE DATABASE IF NOT EXISTS `gestionferreteria` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `gestionferreteria`;

-- Volcando estructura para tabla gestionferreteria.ciudad
CREATE TABLE IF NOT EXISTS `ciudad` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla gestionferreteria.ciudad: ~5 rows (aproximadamente)
INSERT INTO `ciudad` (`ID`, `nombre`) VALUES
	(1, 'Fonseca'),
	(2, 'Hatonuevo'),
	(3, 'Valledupar'),
	(4, 'San Juan Cesar'),
	(5, 'Barrancas');

-- Volcando estructura para tabla gestionferreteria.tcategorias
CREATE TABLE IF NOT EXISTS `tcategorias` (
  `ID` int NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla gestionferreteria.tcategorias: ~0 rows (aproximadamente)

-- Volcando estructura para tabla gestionferreteria.tclientesxcompras
CREATE TABLE IF NOT EXISTS `tclientesxcompras` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `IDpersona` int NOT NULL,
  `tventas_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_tClientesxVentas_tPersonas1_idx` (`IDpersona`),
  KEY `fk_tclientesxcompras_tventas1_idx` (`tventas_ID`),
  CONSTRAINT `fk_tclientesxcompras_tventas1` FOREIGN KEY (`tventas_ID`) REFERENCES `tventas` (`ID`),
  CONSTRAINT `fk_tClientesxVentas_tPersonas1` FOREIGN KEY (`IDpersona`) REFERENCES `tpersonas` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla gestionferreteria.tclientesxcompras: ~0 rows (aproximadamente)

-- Volcando estructura para tabla gestionferreteria.testadoproductos
CREATE TABLE IF NOT EXISTS `testadoproductos` (
  `ID` int NOT NULL,
  `estadoPro` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla gestionferreteria.testadoproductos: ~0 rows (aproximadamente)

-- Volcando estructura para tabla gestionferreteria.tgeneros
CREATE TABLE IF NOT EXISTS `tgeneros` (
  `ID` int NOT NULL,
  `genero` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla gestionferreteria.tgeneros: ~2 rows (aproximadamente)
INSERT INTO `tgeneros` (`ID`, `genero`) VALUES
	(1, 'masculino'),
	(2, 'femenino');

-- Volcando estructura para tabla gestionferreteria.tpersonas
CREATE TABLE IF NOT EXISTS `tpersonas` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) DEFAULT NULL,
  `Id_documento` int DEFAULT NULL,
  `Documento` int DEFAULT NULL,
  `Direccion` varchar(45) DEFAULT NULL,
  `Telefono` int DEFAULT NULL,
  `IDgenero` int NOT NULL,
  `Estado` tinyint DEFAULT NULL,
  `Id_ciudad` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_tpersonas_tGenero1_idx` (`IDgenero`,`Id_documento`),
  KEY `IDtipoDoc_idx` (`Id_documento`),
  KEY `Id_ciudad` (`Id_ciudad`),
  CONSTRAINT `tpersonas_ibfk_1` FOREIGN KEY (`Id_ciudad`) REFERENCES `ciudad` (`ID`),
  CONSTRAINT `tpersonas_ibfk_2` FOREIGN KEY (`Id_documento`) REFERENCES `ttiposdoc` (`ID`),
  CONSTRAINT `tpersonas_ibfk_3` FOREIGN KEY (`IDgenero`) REFERENCES `tgeneros` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla gestionferreteria.tpersonas: ~2 rows (aproximadamente)
INSERT INTO `tpersonas` (`ID`, `Nombre`, `Id_documento`, `Documento`, `Direccion`, `Telefono`, `IDgenero`, `Estado`, `Id_ciudad`) VALUES
	(1, 'luis Angel Gil Ballestero', 1, 1121040400, 'carrera 11', 32033757, 1, 1, 1),
	(2, 'Jose Andres Solano', 2, 1121296184, 'Carrera 12', 123456789, 1, 2, 2);

-- Volcando estructura para tabla gestionferreteria.tproductos
CREATE TABLE IF NOT EXISTS `tproductos` (
  `ID` int NOT NULL,
  `referencia` varchar(50) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `precio` int DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `IDestado` int NOT NULL,
  `tCategorias_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_tProductos_tEstadoProductos1_idx` (`IDestado`),
  KEY `fk_tproductos_tCategorias1_idx` (`tCategorias_ID`),
  CONSTRAINT `fk_tproductos_tCategorias1` FOREIGN KEY (`tCategorias_ID`) REFERENCES `tcategorias` (`ID`),
  CONSTRAINT `fk_tProductos_tEstadoProductos1` FOREIGN KEY (`IDestado`) REFERENCES `testadoproductos` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla gestionferreteria.tproductos: ~0 rows (aproximadamente)

-- Volcando estructura para tabla gestionferreteria.tproductosxventas
CREATE TABLE IF NOT EXISTS `tproductosxventas` (
  `ID` int NOT NULL,
  `tVentas_ID` int NOT NULL,
  `tProductos_ID` int NOT NULL,
  `cantidad` int DEFAULT NULL,
  `precioxcantidad` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_tProductosxVentas_tVentas1_idx` (`tVentas_ID`),
  KEY `fk_tProductosxVentas_tProductos1_idx` (`tProductos_ID`),
  CONSTRAINT `fk_tProductosxVentas_tProductos1` FOREIGN KEY (`tProductos_ID`) REFERENCES `tproductos` (`ID`),
  CONSTRAINT `fk_tProductosxVentas_tVentas1` FOREIGN KEY (`tVentas_ID`) REFERENCES `tventas` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla gestionferreteria.tproductosxventas: ~0 rows (aproximadamente)

-- Volcando estructura para tabla gestionferreteria.ttiposdoc
CREATE TABLE IF NOT EXISTS `ttiposdoc` (
  `ID` int NOT NULL,
  `tipo_doc` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla gestionferreteria.ttiposdoc: ~2 rows (aproximadamente)
INSERT INTO `ttiposdoc` (`ID`, `tipo_doc`) VALUES
	(1, 'Cedula Ciudadania'),
	(2, 'Cedula Extranjeria');

-- Volcando estructura para tabla gestionferreteria.tventas
CREATE TABLE IF NOT EXISTS `tventas` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla gestionferreteria.tventas: ~2 rows (aproximadamente)
INSERT INTO `tventas` (`ID`, `fecha`) VALUES
	(1, '2024-06-05 17:43:41'),
	(2, '2024-06-06 12:31:21');

-- Volcando estructura para tabla gestionferreteria.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(45) DEFAULT NULL,
  `clave` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla gestionferreteria.usuarios: ~4 rows (aproximadamente)
INSERT INTO `usuarios` (`ID`, `usuario`, `clave`) VALUES
	(1, 'luisangel', '123456'),
	(2, 'joseandres', 'andres1234'),
	(3, 'linner_q', '123'),
	(4, 'yosusii', '123');

-- Volcando estructura para tabla gestionferreteria.ventas
CREATE TABLE IF NOT EXISTS `ventas` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `codigo` int NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `valor_total` double DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `tpersonas_id` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_ventas_tpersonas1_idx` (`tpersonas_id`),
  CONSTRAINT `fk_ventas_tpersonas1` FOREIGN KEY (`tpersonas_id`) REFERENCES `tpersonas` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla gestionferreteria.ventas: ~2 rows (aproximadamente)
INSERT INTO `ventas` (`ID`, `codigo`, `descripcion`, `valor_total`, `cantidad`, `tpersonas_id`) VALUES
	(1, 2223, 'Pintura', 10000, 5, 1),
	(2, 1, 'prueba 2', 15000, 3, 2);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
