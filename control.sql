-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-01-2023 a las 04:24:11
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `control`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistencia`
--

CREATE TABLE `asistencia` (
  `idasistencia` int(11) NOT NULL,
  `codigo_persona` varchar(20) NOT NULL,
  `fecha_hora` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `tipo` varchar(45) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `asistencia`
--

INSERT INTO `asistencia` (`idasistencia`, `codigo_persona`, `fecha_hora`, `tipo`, `fecha`) VALUES
(112, '444', '2020-02-01 03:01:00', 'Entrada', '2020-01-31'),
(113, '789', '2020-02-01 03:01:03', 'Entrada', '2020-01-31'),
(114, '789', '2020-02-01 03:01:06', 'Salida', '2020-01-31'),
(115, '444', '2020-02-01 03:01:08', 'Salida', '2020-01-31'),
(116, '444', '2020-02-01 03:01:28', 'Entrada', '2020-01-31'),
(117, '789', '2020-02-01 03:01:43', 'Entrada', '2020-01-31'),
(118, '444', '2020-02-01 03:06:12', 'Salida', '2020-01-31'),
(119, '444', '2020-02-01 03:06:17', 'Entrada', '2020-01-31'),
(120, '789', '2020-02-01 03:08:33', 'Salida', '2020-01-31'),
(121, '789', '2020-02-01 03:08:38', 'Entrada', '2020-01-31'),
(122, '444', '2020-02-01 03:08:44', 'Salida', '2020-01-31'),
(123, '444', '2020-02-01 03:08:49', 'Entrada', '2020-01-31'),
(124, '8VwqyL', '2020-02-01 03:22:02', 'Entrada', '2020-01-31'),
(125, '8VwqyL', '2020-02-01 03:22:04', 'Salida', '2020-01-31'),
(126, '8VwqyL', '2020-02-01 03:22:07', 'Entrada', '2020-01-31'),
(127, '8VwqyL', '2020-02-01 03:22:11', 'Salida', '2020-01-31'),
(128, '444', '2020-02-03 00:15:42', 'Salida', '2020-02-02'),
(129, '444', '2020-02-03 00:15:47', 'Entrada', '2020-02-02'),
(130, '789', '2020-02-03 00:15:54', 'Salida', '2020-02-02'),
(131, '789', '2020-02-03 00:16:00', 'Entrada', '2020-02-02'),
(132, 'z7Vt9Y', '2020-11-14 17:30:12', 'Entrada', '2020-11-14'),
(133, '444', '2020-11-14 17:31:44', 'Salida', '2020-11-14'),
(134, '70311233', '2023-01-23 17:18:50', 'Entrada', '2023-01-23'),
(135, '70311233', '2023-01-23 17:29:02', 'Salida', '2023-01-23'),
(136, '70311233', '2023-01-23 23:50:52', 'Entrada', '2023-01-23'),
(137, '70311233', '2023-01-23 23:50:58', 'Salida', '2023-01-23'),
(138, '70311233', '2023-01-24 00:03:17', 'Entrada', '2023-01-23'),
(139, '70311233', '2023-01-24 00:03:24', 'Salida', '2023-01-23'),
(140, '70311233', '2023-01-24 00:05:28', 'Entrada', '2023-01-23'),
(141, '70311233', '2023-01-24 00:05:37', 'Salida', '2023-01-23'),
(142, '70311233', '2023-01-24 02:25:09', 'Entrada', '2023-01-23'),
(143, '70311233', '2023-01-24 02:25:14', 'Salida', '2023-01-23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE `departamento` (
  `iddepartamento` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `fechacreada` datetime NOT NULL,
  `idusuario` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`iddepartamento`, `nombre`, `descripcion`, `fechacreada`, `idusuario`) VALUES
(1, 'Sistemas', 'Se encarga de todo el sistema en general', '2020-01-18 00:00:00', '1'),
(2, 'Contabilidad', '', '2020-01-19 00:15:24', '16'),
(3, 'Dirección General', '', '2020-01-28 21:24:52', '16'),
(4, 'EBA', '', '2020-01-28 21:25:08', '16'),
(5, 'EBR Rural', '', '2020-01-28 21:25:45', '16'),
(6, 'EBR Urbano', '', '2020-01-28 21:26:14', '16'),
(7, 'EPTT', '', '2020-01-28 21:26:50', '16'),
(8, 'FyA Digital', '', '2023-01-23 21:18:31', '16'),
(9, 'Identidad y Misión', '', '2023-01-23 21:18:35', '16'),
(10, 'Legal', '', '2023-01-23 21:18:40', '16'),
(11, 'Logística', '', '2023-01-23 21:18:45', '16'),
(12, 'Proyectos', '', '2023-01-23 21:18:56', '16'),
(13, 'Recaudo y Voluntariado', '', '2023-01-23 21:19:03', '16'),
(14, 'Recursos Humanos', '', '2023-01-23 21:19:09', '16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensajes`
--

CREATE TABLE `mensajes` (
  `idmensaje` int(11) NOT NULL,
  `idusuariomensaje` int(11) NOT NULL,
  `textomensaje` text NOT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT 1,
  `fechamensaje` datetime NOT NULL,
  `fechacreada` datetime NOT NULL,
  `idusuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `mensajes`
--

INSERT INTO `mensajes` (`idmensaje`, `idusuariomensaje`, `textomensaje`, `estado`, `fechamensaje`, `fechacreada`, `idusuario`) VALUES
(2, 1, 'hola, esto es un mensaje de prueba del sistema de usuarios', 1, '2020-01-18 00:00:00', '2020-01-18 00:00:00', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipousuario`
--

CREATE TABLE `tipousuario` (
  `idtipousuario` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `fechacreada` datetime NOT NULL,
  `idusuario` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `tipousuario`
--

INSERT INTO `tipousuario` (`idtipousuario`, `nombre`, `descripcion`, `fechacreada`, `idusuario`) VALUES
(1, 'Administrador', 'Con priviliegios de gestionar todo el sistema', '2020-01-18 00:00:00', '1'),
(2, 'Trabajador', 'Trabaja en la institución', '2020-01-19 00:30:13', '16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idusuario` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellidos` varchar(45) NOT NULL,
  `login` varchar(45) NOT NULL,
  `iddepartamento` int(11) NOT NULL,
  `idtipousuario` int(11) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(64) NOT NULL,
  `imagen` varchar(50) NOT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT 1,
  `fechacreado` datetime NOT NULL,
  `usuariocreado` varchar(45) NOT NULL,
  `codigo_persona` varchar(20) DEFAULT NULL,
  `idmensaje` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idusuario`, `nombre`, `apellidos`, `login`, `iddepartamento`, `idtipousuario`, `email`, `password`, `imagen`, `estado`, `fechacreado`, `usuariocreado`, `codigo_persona`, `idmensaje`) VALUES
(1, 'admin', 'asistencia', 'admin', 1, 1, 'asistenacia@asistencia.com', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'default.jpg', 1, '2020-01-18 00:00:00', 'admin', '444', 1),
(16, 'Jorge Antony', 'Milian Montalvo', 'jmilian', 1, 1, 'jmilian@feyalegria.org.pe', '3b426878119f00e0ad61793257fdae841cff8ce26e844e41708b71a050f4c12e', '1674493169.jpg', 1, '2023-01-23 10:59:28', 'Jorge Antony', '70311233', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asistencia`
--
ALTER TABLE `asistencia`
  ADD PRIMARY KEY (`idasistencia`);

--
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`iddepartamento`);

--
-- Indices de la tabla `mensajes`
--
ALTER TABLE `mensajes`
  ADD PRIMARY KEY (`idmensaje`),
  ADD KEY `idusuario` (`idusuario`);

--
-- Indices de la tabla `tipousuario`
--
ALTER TABLE `tipousuario`
  ADD PRIMARY KEY (`idtipousuario`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idusuario`),
  ADD UNIQUE KEY `login` (`login`),
  ADD UNIQUE KEY `codigo_persona` (`codigo_persona`),
  ADD KEY `fk_departamento` (`iddepartamento`),
  ADD KEY `fk_tiposusario` (`idtipousuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asistencia`
--
ALTER TABLE `asistencia`
  MODIFY `idasistencia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;

--
-- AUTO_INCREMENT de la tabla `departamento`
--
ALTER TABLE `departamento`
  MODIFY `iddepartamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `mensajes`
--
ALTER TABLE `mensajes`
  MODIFY `idmensaje` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipousuario`
--
ALTER TABLE `tipousuario`
  MODIFY `idtipousuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `mensajes`
--
ALTER TABLE `mensajes`
  ADD CONSTRAINT `mensajes_ibfk_1` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`idusuario`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`iddepartamento`) REFERENCES `departamento` (`iddepartamento`),
  ADD CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`idtipousuario`) REFERENCES `tipousuario` (`idtipousuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
