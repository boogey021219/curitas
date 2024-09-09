-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-09-2024 a las 09:01:36
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
-- Base de datos: `curitas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citaslaboratorio`
--

CREATE TABLE `citaslaboratorio` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `tipo_prueba` varchar(100) NOT NULL,
  `estado` enum('pendiente','confirmada','cancelada') DEFAULT 'pendiente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `citaslaboratorio`
--

INSERT INTO `citaslaboratorio` (`id`, `usuario_id`, `fecha`, `hora`, `tipo_prueba`, `estado`) VALUES
(3, 1005231401, '2020-04-15', '14:05:00', 'i', 'cancelada'),
(4, 1005231401, '2024-09-27', '17:13:00', 'ki', 'confirmada'),
(5, 911, '2024-09-12', '21:10:00', '<zz', 'confirmada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citasmedicogeneral`
--

CREATE TABLE `citasmedicogeneral` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `descripcion` text NOT NULL,
  `estado` enum('pendiente','confirmada','cancelada') DEFAULT 'pendiente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `citasmedicogeneral`
--

INSERT INTO `citasmedicogeneral` (`id`, `usuario_id`, `fecha`, `hora`, `descripcion`, `estado`) VALUES
(3, 1005231407, '2024-09-23', '14:10:00', 'aaaaaaaaa', 'confirmada'),
(4, 1005231407, '2024-09-27', '09:17:00', 'aaaaasdsfsfdrgtrdg', 'cancelada'),
(17, 911, '2024-09-17', '12:16:00', 'aaa', 'confirmada'),
(18, 1098070422, '2024-09-15', '21:20:00', 'cita medica', 'confirmada'),
(25, 1005231401, '2024-09-04', '20:44:00', 'sss', 'confirmada'),
(26, 1005231401, '2024-09-18', '23:50:00', 'aa', 'confirmada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id` int(100) NOT NULL,
  `tipo_de_documento` varchar(100) NOT NULL,
  `cargo` varchar(100) NOT NULL,
  `genero` varchar(100) NOT NULL,
  `fecha_de_nacimiento` date NOT NULL,
  `email` varchar(100) NOT NULL,
  `passwd` varchar(100) NOT NULL,
  `departamento_area` varchar(100) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `tipo_contrato` varchar(100) NOT NULL,
  `horas_trabajo` int(100) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `confirmar_paswd` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id`, `tipo_de_documento`, `cargo`, `genero`, `fecha_de_nacimiento`, `email`, `passwd`, `departamento_area`, `fecha_inicio`, `tipo_contrato`, `horas_trabajo`, `nombre`, `confirmar_paswd`) VALUES
(123, 'cc', 'cc', 'cc', '2024-09-05', 'root@gmail.com', 'root', 'aa', '2024-09-09', 'aa', 7, 'root', 'root');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicos`
--

CREATE TABLE `medicos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `especialidad` varchar(100) NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `fecha_contratacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `medicos`
--

INSERT INTO `medicos` (`id`, `nombre`, `especialidad`, `telefono`, `email`, `fecha_contratacion`) VALUES
(911, 'corazon', 'el anal', '666', 'anal@xn--hotmai-1wa.com', '2024-09-02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(100) NOT NULL,
  `tipo_documento` varchar(100) NOT NULL,
  `nombre` text NOT NULL,
  `email` varchar(100) NOT NULL,
  `passwd` text NOT NULL,
  `Confirmar_paswd` text NOT NULL,
  `genero` text NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `direccion` text NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `tipo_afiliacion` varchar(100) NOT NULL,
  `estado_civil` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `tipo_documento`, `nombre`, `email`, `passwd`, `Confirmar_paswd`, `genero`, `telefono`, `direccion`, `fecha_nacimiento`, `tipo_afiliacion`, `estado_civil`) VALUES
(4, '', 'nueve', 'aaaa@gmail.com', '1', '1', 'Masculino', '3184163111', 'cerca de la casa', '2024-09-17', '', '0'),
(7, 'CE', 'siete', 'siete7@gmail.com', 'siete123', 'siete123', 'Femenino', '777', 'casa 7', '7777-07-07', 'Subsidiado', 'Divorciado'),
(8, 'CC', 'ocho', 'ocho@gmail.com', 'ocho', 'ocho', 'Masculino', '888', 'casa 8', '7777-07-07', 'Contributivo', 'Divorciado'),
(9, 'CC', 'ocho', 'ocho@gmail.com', '999', '999', 'Masculino', '888', 'casa 8', '7777-07-07', 'Contributivo', 'Divorciado'),
(10, 'CC', 'ocho', 'diez@gmail.com', '10', '10', 'Masculino', '888', 'casa 8', '7777-07-07', 'Contributivo', 'Divorciado'),
(11, 'CC', 'ocho', '11@gmail.com', '11', '11', 'Masculino', '888', 'casa 8', '7777-07-07', 'Contributivo', 'Divorciado'),
(911, '', 'nueve', 'theboogeyman02bsd@gmail.com', '123', '123', 'Masculino', '3147777', 'cerca de la casa', '2024-09-23', '', '0'),
(1005231401, 'CC', 'nueve', 'yeison@gmail.com', '123456', '123456', 'Femenino', '8', 'cerca de la casa', '2024-09-30', 'Subsidiado', 'Divorciado'),
(1005231407, '', 'pepe', 'andres46@jmail.com', 'prueba123', 'prueba123', 'Masculino', '31545585', 'my house', '2024-09-24', '', '0'),
(1005238888, '', 'anderspn', 'andre84@jmail.com', 'prueba123', 'prueba123', 'Masculino', '31545585', 'my house', '2024-09-27', '', '0'),
(1098070422, '', 'pipe', 'pepe@gmail.com', '123', '123', 'Otro', '31880802', 'cerca de la casa', '2024-09-17', '', '0');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `citaslaboratorio`
--
ALTER TABLE `citaslaboratorio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `citasmedicogeneral`
--
ALTER TABLE `citasmedicogeneral`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `medicos`
--
ALTER TABLE `medicos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `citaslaboratorio`
--
ALTER TABLE `citaslaboratorio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `citasmedicogeneral`
--
ALTER TABLE `citasmedicogeneral`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `citaslaboratorio`
--
ALTER TABLE `citaslaboratorio`
  ADD CONSTRAINT `citaslaboratorio_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `citasmedicogeneral`
--
ALTER TABLE `citasmedicogeneral`
  ADD CONSTRAINT `citasmedicogeneral_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
