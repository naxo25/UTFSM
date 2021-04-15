--
-- Base de datos: `motos_bd`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas`
--

CREATE TABLE `marcas` (
  `id_marca` varchar(5) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Identificador de tabla marcas',
  `nombre_marca` varchar(20) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Nombre de la marca'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Almacena las distintas marcas de las motocicletas';

--
-- Volcado de datos para la tabla `marcas`
--

INSERT INTO `marcas` (`id_marca`, `nombre_marca`) VALUES
('1', 'Yamaha'),
('2', 'Honda'),
('3', 'Kawasaki'),
('lp41', 'Ducati');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `motos`
--

CREATE TABLE `motos` (
  `id_moto` varchar(5) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Nombre de la modelos',
  `id_marca` varchar(5) COLLATE utf8_spanish_ci NOT NULL COMMENT 'foránea para enlazar con tabla de marcas',
  `nombre_modelo` varchar(20) COLLATE utf8_spanish_ci NOT NULL COMMENT 'contiene el modelo de la moto',
  `valor` int(11) NOT NULL COMMENT 'precio de la motocicleta',
  `stock` int(10) NOT NULL COMMENT 'Contiene el numero de stock disponible'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Almacena el stock disponible de cada motocicleta';

--
-- Volcado de datos para la tabla `motos`
--

INSERT INTO `motos` (`id_moto`, `id_marca`, `nombre_modelo`, `valor`, `stock`) VALUES
('1', '1', 'Cross', 10000000, 10),
('2', '3', 'Enduro', 7500000, 5),
('3', 'lp41', 'Chopper', 8000000, 4);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`id_marca`);

--
-- Indices de la tabla `motos`
--
ALTER TABLE `motos`
  ADD PRIMARY KEY (`id_moto`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
