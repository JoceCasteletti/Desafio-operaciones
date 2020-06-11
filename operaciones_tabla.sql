-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 09-06-2020 a las 06:39:51
-- Versión del servidor: 8.0.17
-- Versión de PHP: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `operaciones_tabla`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `editoriales`
--

CREATE TABLE `editoriales` (
  `Codigo` int(11) NOT NULL,
  `Nombre` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `editoriales`
--

INSERT INTO `editoriales` (`Codigo`, `Nombre`) VALUES
(1, 'ANAYA'),
(2, 'IberLibro'),
(3, 'S.M');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `Codigo` int(11) NOT NULL,
  `Titulo` varchar(200) DEFAULT NULL,
  `CodigoEditorial` int(11) DEFAULT NULL,
  `autor` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`Codigo`, `Titulo`, `CodigoEditorial`, `autor`) VALUES
(2, 'El principito', 2, 'Antoine SaintExupery'),
(3, 'El príncipe ', 3, 'Maquiavelo'),
(4, 'Diplomacia', 3, 'Henry Kissinger'),
(6, 'Los Hermanoz Karamazov', 2, 'Fiodor Dostoiesvki');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamos`
--

CREATE TABLE `prestamos` (
  `codigo` int(11) NOT NULL,
  `codigo_libro` int(11) NOT NULL,
  `codigo_usuario` int(11) NOT NULL,
  `fecha_prestamo` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `prestamos`
--

INSERT INTO `prestamos` (`codigo`, `codigo_libro`, `codigo_usuario`, `fecha_prestamo`) VALUES
(1, 2, 1, '2020-10-01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `codigo` int(11) NOT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `apellido` varchar(20) DEFAULT NULL,
  `telefono` varchar(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`codigo`, `nombre`, `apellido`, `telefono`) VALUES
(1, 'Jose', 'Soto', '98347756'),
(2, 'Miguel', 'Gomez', '94845537'),
(3, 'Sara', 'Avendaño', '93345455'),
(4, 'Jaime', 'Carrasco', '92223453');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `editoriales`
--
ALTER TABLE `editoriales`
  ADD PRIMARY KEY (`Codigo`);

--
-- Indices de la tabla `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`Codigo`),
  ADD KEY `CodigoEditorial` (`CodigoEditorial`);

--
-- Indices de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `codigo_libro` (`codigo_libro`),
  ADD KEY `codigo_usuario` (`codigo_usuario`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`codigo`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `libros`
--
ALTER TABLE `libros`
  ADD CONSTRAINT `libros_ibfk_1` FOREIGN KEY (`CodigoEditorial`) REFERENCES `editoriales` (`Codigo`);

--
-- Filtros para la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD CONSTRAINT `prestamos_ibfk_1` FOREIGN KEY (`codigo_libro`) REFERENCES `libros` (`Codigo`),
  ADD CONSTRAINT `prestamos_ibfk_2` FOREIGN KEY (`codigo_usuario`) REFERENCES `usuarios` (`codigo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
