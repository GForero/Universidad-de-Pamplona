-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-12-2022 a las 03:23:36
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `login_admin`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(10) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`) VALUES
(1, 'Animales'),
(2, 'Deportes'),
(3, 'Automoviles'),
(4, 'Caricaturas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `comentario` text COLLATE utf8_spanish_ci NOT NULL,
  `direccion` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `documento` int(12) NOT NULL,
  `id` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `telefono` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`comentario`, `direccion`, `documento`, `id`, `nombre`, `telefono`) VALUES
('', 'av 5 Centro', 34324123, 6, 'Alejandro', 32155432),
('Buen producto', 'av 5 Cucuta', 12233123, 7, 'Giliberth', 32144321);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedidos`
--

CREATE TABLE `detalle_pedidos` (
  `cantidad` int(11) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `id` int(10) NOT NULL,
  `pedido_id` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `producto_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `detalle_pedidos`
--

INSERT INTO `detalle_pedidos` (`cantidad`, `estado`, `id`, `pedido_id`, `precio`, `producto_id`) VALUES
(3, 1, 3, 7, '10000.00', 15),
(1, 1, 4, 7, '12000.00', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inicio_admin`
--

CREATE TABLE `inicio_admin` (
  `usuario` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `contrasena` varchar(30) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `inicio_admin`
--

INSERT INTO `inicio_admin` (`usuario`, `contrasena`) VALUES
('alejandro', '1234'),
('Giliberth', '1234'),
('marbel', '1234'),
('yurimar', '1234');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `cliente_id` int(11) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `fecha` date NOT NULL,
  `id` int(11) NOT NULL,
  `total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`cliente_id`, `estado`, `fecha`, `id`, `total`) VALUES
(7, 1, '2022-12-12', 7, '42000.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `titulo` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` text COLLATE utf8_spanish_ci NOT NULL,
  `imagen` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `categoria_id` int(10) NOT NULL,
  `fecha` date NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `titulo`, `descripcion`, `imagen`, `precio`, `categoria_id`, `fecha`, `estado`) VALUES
(1, 'Balón', 'Figura hecha en yeso inspirada en un balón de futból que puede ser decorado según el equipo de su preferencia.\r\nSus dimensiones son de 15 cm de alto por 8 cm de ancho.', 'Balón de futbol.png', '12000.00', 2, '2022-06-14', 1),
(2, 'Guayo con Balón', 'Figura hecha en yeso inspirada en un guayo de futból con su balón que puede ser decorado de su equipo de su preferido.\r\nSus dimensiones son de 20 cm de alto por 10 cm de ancho.', 'Guayo de futbol.png', '12000.00', 2, '2022-06-14', 1),
(3, 'Elefante', 'Figura hecha en yeso inspirada en un elefante bebé estirando su trompa de manera placentera.\r\nSus dimensiones son de 15 cm de alto por 20 cm de ancho.', 'Elefante.jpg', '10000.00', 1, '2022-06-14', 1),
(4, 'Bart Simpson', 'Figura hecha en yeso inspirada en un personaje de la familia Simpson, este es conocido como Bart.\r\nSus dimensiones son de 30 cm de alto por 10 cm de ancho.', 'Bart.jpeg', '10000.00', 4, '2022-06-14', 1),
(5, 'Demonio de Tazmania.', 'Figura hecha en yeso inspirada en un personaje de los Looney Tunes, este se caracterizaba por ser un destructor.\r\nSus dimensiones son de 20 cm de alto por 15 cm de ancho.', 'Demonio de tazmania.png', '12000.00', 4, '2022-06-14', 1),
(6, 'Caracol Turbo', 'Figura hecha en yeso inspirada en el personaje principal de la película Turbo, un caracol cuya habilidad es ser muy velóz.\r\nSus dimensiones son de 20 cm de alto por 30 cm de ancho.', 'Caracol turbo.jpeg', '15000.00', 4, '2022-06-14', 1),
(7, 'Camioneta', 'Figura hecha en yeso inspirada en una camioneta 4x4 ideal para quere ahorrar y comprar una así.\r\nSus dimensiones son de 8 cm de alto por 15 cm de ancho.', 'Carro particular.png', '12000.00', 3, '2022-06-14', 1),
(8, 'Patrulla militar', 'Figura hecha en yeso inspirada en una patrulla militar para sentir orgullo del cuerpo militar de la  nación.\r\nSus dimensiones son de 8 cm de alto por 15 cm de ancho.', 'Patrulla militar.png', '15000.00', 3, '2022-06-14', 1),
(9, 'Taxi volkswagen', 'Figura hecha en yeso inspirada en taxi de modelo volkswagen, para los amantes de carros antiguos.\r\nSus dimensiones son de 10 cm de alto por 20 cm de ancho.', 'Taxi.png', '15000.00', 3, '2022-06-14', 1),
(10, 'Cochinito chino', 'Figura hecha en yeso inspirada en un cochinito chino de modelo convencional a las alcancías conocidas.\r\nSus dimensiones son de 20 cm de alto por 20 cm de ancho.', 'Cochinito chino.png', '10000.00', 1, '2022-06-14', 1),
(11, 'Perro Frespuder', 'Figura hecha en yeso inspirada en un perro frespuder para los amantes de la raza canina exclusiva de los aristócratas y nobles. \r\nSus dimensiones son de 10 cm de alto por 7 cm de ancho.', 'Perro frespuder.png', '10000.00', 1, '2022-06-14', 1),
(12, 'Gallina con huevos', 'Figura hecha en yeso inspirada en una gallina cuidando a sus huevos, esperando a que acabe el desarrollo embrionario y nazcan sus pollitos.\r\nSus dimensiones son de 8 cm de alto por 15 cm de ancho.', 'Gallina con huevos.jpg', '10000.00', 1, '2022-06-14', 1),
(13, 'Gallina con pollitos', 'Figura hecha en yeso inspirada en una gallina cuidando a sus pollitos, dandoles calor.\r\nSus dimensiones son de 10 cm de alto por 15 cm de ancho.', 'Gallina con pollitos.png', '10000.00', 1, '2022-06-14', 1),
(14, 'Toro', 'Figura hecha en yeso inspirada en un toro, para los amantes de las reses bravas.\r\nSus dimensiones son de 8 cm de alto por 15 cm de ancho.', 'Toro.png', '10000.00', 1, '2022-06-14', 1),
(15, 'Vaca', 'Figura hecha en yeso inspirada en una vaca con su campana en el cuello y su flor en la oreja.\r\nSus dimensiones son de 8 cm de alto por 15 cm de ancho.', 'Vaca.png', '10000.00', 1, '2022-06-14', 1),
(16, 'Perrito Pug', 'Figura hecha en yeso inspirada en un perro de raza pug feliz con su hueso.\r\nSus dimensiones son de 15 cm de alto por 8 cm de ancho.', 'Perro con hueso.png', '10000.00', 1, '2022-06-14', 1),
(17, 'Rana', 'Figura hecha en yeso inspirada en una rana disfrutando de la naturaleza.\r\nSus dimensiones son de 15 cm de alto por 8 cm de ancho.\"', 'Rana.png', '10000.00', 1, '2022-06-21', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `inicio_admin`
--
ALTER TABLE `inicio_admin`
  ADD PRIMARY KEY (`usuario`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
