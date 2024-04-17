-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-04-2024 a las 16:36:01
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_discoteca`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `ID_cliente` int(50) NOT NULL,
  `Nombre_cliente` varchar(200) NOT NULL,
  `Numero_identificacion` varchar(200) NOT NULL,
  `Fecha_nacimiento` date NOT NULL,
  `Genero` varchar(20) NOT NULL,
  `Direccion` varchar(200) NOT NULL,
  `Numero_telefono` varchar(20) NOT NULL,
  `Correo_electronico` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`ID_cliente`, `Nombre_cliente`, `Numero_identificacion`, `Fecha_nacimiento`, `Genero`, `Direccion`, `Numero_telefono`, `Correo_electronico`) VALUES
(1, 'Juan Pérez', '123456789', '1990-01-08', 'M', 'Calle Principal, Ciudad', '6784520', 'juan@example.com'),
(2, 'douglas', '12545', '2023-04-12', 'M', 'la paz', '62504155', 'douglas1@gmail.com'),
(3, 'victor', '1235', '2023-12-04', 'M', 'el alto', '62301477', 'victor@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `control_asistencia_discoteca`
--

CREATE TABLE `control_asistencia_discoteca` (
  `ID_registro_asistencia` int(11) NOT NULL,
  `ID_cliente` int(50) NOT NULL,
  `ID_evento` int(50) NOT NULL,
  `Fecha_hora_entrada` datetime(6) NOT NULL,
  `Fecha_hora_salida` datetime(6) NOT NULL,
  `Precio_pagado` decimal(50,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `ID_empleado` int(50) NOT NULL,
  `Nombre_empleado` varchar(200) NOT NULL,
  `Cargo` varchar(200) NOT NULL,
  `Fecha_contratacion` date NOT NULL,
  `Nombre_usuario` varchar(200) NOT NULL,
  `Contraseña` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eventos`
--

CREATE TABLE `eventos` (
  `ID_Evento` int(50) NOT NULL,
  `Nombre_evento` varchar(200) NOT NULL,
  `Fecha_Hora_evento` datetime(6) NOT NULL,
  `Descripcion_evento` text NOT NULL,
  `Artistas_DJ_invitados` varchar(200) NOT NULL,
  `Capacidad_maxima_evento` int(200) NOT NULL,
  `Precio_entrada` decimal(65,0) NOT NULL,
  `Estado_evento` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `ID_inventario` int(50) NOT NULL,
  `ID_producto` int(50) NOT NULL,
  `Fecha_registro` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `inventario`
--

INSERT INTO `inventario` (`ID_inventario`, `ID_producto`, `Fecha_registro`) VALUES
(1, 1, '2023-11-15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `ID_producto` int(50) NOT NULL,
  `Nombre_producto` varchar(200) NOT NULL,
  `Categoria_producto` varchar(200) NOT NULL,
  `Precio_unitario` decimal(65,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`ID_producto`, `Nombre_producto`, `Categoria_producto`, `Precio_unitario`) VALUES
(1, 'Cerveza Paceña', 'na', 15),
(2, 'Taquiña', 'Cerveza', 15),
(3, 'Singani', 'Cocteles', 50),
(4, 'Huari', 'Cerveza', 15),
(5, 'Bock', 'Cerveza', 15),
(6, 'Vodka', 'Vodka', 50),
(7, 'Ron Bahamas', 'Ron', 70),
(8, 'Whisky', 'Whisky', 80),
(9, 'Vodka COCO', 'Vodka', 100),
(10, 'Champague', 'Champan', 40);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `ID_proveedor` int(50) NOT NULL,
  `Nombre_proveedor` varchar(200) NOT NULL,
  `Direccion` varchar(200) NOT NULL,
  `Numero_telefono_contacto` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `ID_venta` int(50) NOT NULL,
  `ID_cliente` int(50) NOT NULL,
  `ID_empleado` int(50) NOT NULL,
  `Fecha_hora_venta` datetime(6) NOT NULL,
  `Monto_total_venta` decimal(50,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`ID_cliente`);

--
-- Indices de la tabla `control_asistencia_discoteca`
--
ALTER TABLE `control_asistencia_discoteca`
  ADD PRIMARY KEY (`ID_registro_asistencia`),
  ADD KEY `ID_cliente` (`ID_cliente`),
  ADD KEY `ID_evento` (`ID_evento`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`ID_empleado`);

--
-- Indices de la tabla `eventos`
--
ALTER TABLE `eventos`
  ADD PRIMARY KEY (`ID_Evento`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`ID_inventario`),
  ADD KEY `ID_producto` (`ID_producto`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`ID_producto`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`ID_proveedor`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`ID_venta`),
  ADD KEY `ID_cliente` (`ID_cliente`),
  ADD KEY `ID_empleado` (`ID_empleado`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `ID_cliente` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `control_asistencia_discoteca`
--
ALTER TABLE `control_asistencia_discoteca`
  MODIFY `ID_registro_asistencia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `ID_empleado` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `eventos`
--
ALTER TABLE `eventos`
  MODIFY `ID_Evento` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inventario`
--
ALTER TABLE `inventario`
  MODIFY `ID_inventario` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `ID_producto` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `ID_proveedor` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `ID_venta` int(50) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `control_asistencia_discoteca`
--
ALTER TABLE `control_asistencia_discoteca`
  ADD CONSTRAINT `control_asistencia_discoteca_ibfk_1` FOREIGN KEY (`ID_cliente`) REFERENCES `clientes` (`ID_cliente`) ON UPDATE CASCADE,
  ADD CONSTRAINT `control_asistencia_discoteca_ibfk_2` FOREIGN KEY (`ID_evento`) REFERENCES `eventos` (`ID_Evento`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD CONSTRAINT `inventario_ibfk_1` FOREIGN KEY (`ID_producto`) REFERENCES `productos` (`ID_producto`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`ID_cliente`) REFERENCES `clientes` (`ID_cliente`) ON UPDATE CASCADE,
  ADD CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`ID_empleado`) REFERENCES `empleados` (`ID_empleado`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
