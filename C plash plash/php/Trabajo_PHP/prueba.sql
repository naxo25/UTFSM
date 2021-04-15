-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-06-2016 a las 05:53:20
-- Versión del servidor: 10.1.13-MariaDB
-- Versión de PHP: 5.6.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `prueba`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `arriendos`
--

CREATE TABLE `arriendos` (
  `fecha` datetime NOT NULL COMMENT 'Fecha y Hora del Arriendo',
  `rut_cliente` varchar(8) COLLATE latin1_spanish_ci NOT NULL COMMENT 'Rut del cliente a quien se le arrienda el video (ver tabla CLIENTES)',
  `cod_video` varchar(5) COLLATE latin1_spanish_ci NOT NULL COMMENT 'Código del video arrendado (ver tabla VIDEOS)',
  `estado` varchar(1) COLLATE latin1_spanish_ci NOT NULL COMMENT 'Valor que señala si el video ha sido devuelto o no, en donde D corresponde a devuelto y A corresponde a arrendado.',
  `valor` int(11) NOT NULL COMMENT 'Costo del Arriendo del Video'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci COMMENT='Registra los movimientos de arriendo y entrega de videos. TI';

--
-- Volcado de datos para la tabla `arriendos`
--

INSERT INTO `arriendos` (`fecha`, `rut_cliente`, `cod_video`, `estado`, `valor`) VALUES
('2016-06-28 00:00:00', '18503022', '99001', 'A', 5000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `rut_cliente` varchar(8) COLLATE latin1_spanish_ci NOT NULL COMMENT 'Parte numerica del Rut sin formato. No incluye el digito verificador.',
  `nombre_cliente` varchar(30) COLLATE latin1_spanish_ci NOT NULL COMMENT 'Texto libre',
  `sexo` varchar(1) COLLATE latin1_spanish_ci NOT NULL COMMENT 'Código que señala el género del cliente, en donde F corresponde a femenino y M a masculino.'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci COMMENT='Almacena los datos relevantes de cada cliente o socio que pu';

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`rut_cliente`, `nombre_cliente`, `sexo`) VALUES
('17972512', 'Diego Aguilera', 'M'),
('18503022', 'Pedro Gutirrez Muñoz', 'M'),
('18726244', 'Ygnacio Rojas', 'M'),
('19099207', 'Rodrigo Gutierrez Munnoz', 'M');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `generos`
--

CREATE TABLE `generos` (
  `cod_genero` varchar(5) COLLATE latin1_spanish_ci NOT NULL COMMENT 'Código de Identificación del Género cinematográfico, Corresponde a un texto libre alfanumérico, considerando letras en mayúsculas.',
  `nombre_genero` varchar(20) COLLATE latin1_spanish_ci NOT NULL COMMENT 'Texto libre'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci COMMENT='Registra los géneros cinematográficos';

--
-- Volcado de datos para la tabla `generos`
--

INSERT INTO `generos` (`cod_genero`, `nombre_genero`) VALUES
('00001', 'Terror'),
('00002', 'Comedia'),
('00003', 'Romantico'),
('13138', 'Hentai');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `videos`
--

CREATE TABLE `videos` (
  `cod_video` varchar(5) COLLATE latin1_spanish_ci NOT NULL COMMENT 'Código de identificación del Video. Corresponde a un texto libre alfanumérico, considerando letras en mayúsculas.',
  `nombre_video` varchar(30) COLLATE latin1_spanish_ci NOT NULL COMMENT 'Texto libre',
  `cod_genero` varchar(5) COLLATE latin1_spanish_ci NOT NULL COMMENT 'Código del género cinematográfico (ver tabla GENEROS)',
  `total` int(11) NOT NULL COMMENT 'Cantidad de unidades del video disponibles para ser arredrados.',
  `en_arriendo` int(11) NOT NULL COMMENT 'Cantidad de unidades que se encuentran en arriendo (sin ser devueltas)',
  `valor` int(11) NOT NULL COMMENT 'Valor ($) del arriendo (3 días)'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci COMMENT='Contiene el Inventario de Videos, además lleva un contador ';

--
-- Volcado de datos para la tabla `videos`
--

INSERT INTO `videos` (`cod_video`, `nombre_video`, `cod_genero`, `total`, `en_arriendo`, `valor`) VALUES
('00005', 'qwena', '00002', 2, 3, 4000),
('00008', 'Star wars', '13138', 4, 3, 6000),
('99001', 'Mama', '00001', 5, 1, 5000),
('99002', 'Son como niños 2', '00002', 2, 3, 4000),
('99009', 'NarutoxSasuke', '13138', 2, 1, 3000);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `arriendos`
--
ALTER TABLE `arriendos`
  ADD PRIMARY KEY (`fecha`,`rut_cliente`,`cod_video`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`rut_cliente`);

--
-- Indices de la tabla `generos`
--
ALTER TABLE `generos`
  ADD PRIMARY KEY (`cod_genero`);

--
-- Indices de la tabla `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`cod_video`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
