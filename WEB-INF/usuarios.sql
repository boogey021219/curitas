-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-09-2024 a las 23:41:01
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
  `tipo_afiliación` varchar(100) NOT NULL,
  `estado_civil` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `tipo_documento`, `nombre`, `email`, `passwd`, `Confirmar_paswd`, `genero`, `telefono`, `direccion`, `fecha_nacimiento`, `tipo_afiliación`, `estado_civil`) VALUES
(4, '', 'nueve', 'aaaa@gmail.com', '1', '1', 'Masculino', '3184163111', 'cerca de la casa', '2024-09-17', '', '0'),
(911, '', 'nueve', 'theboogeyman02bsd@gmail.com', '123', '123', 'Masculino', '3147777', 'cerca de la casa', '2024-09-23', '', '0'),
(1005231401, '', 'yeison eliecer prada', 'yeliecerprada@uts.edu.co', '123456', '123456', 'Masculino', '318416311', 'cerca de la casa', '2003-09-24', '', '0'),
(1005231407, '', 'pepe', 'andres46@jmail.com', 'prueba123', 'prueba123', 'Masculino', '31545585', 'my house', '2024-09-24', '', '0'),
(1005238888, '', 'anderspn', 'andre84@jmail.com', 'prueba123', 'prueba123', 'Masculino', '31545585', 'my house', '2024-09-27', '', '0'),
(1098070422, '', 'pipe', 'pepe@gmail.com', '123', '123', 'Otro', '31880802', 'cerca de la casa', '2024-09-17', '', '0');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
