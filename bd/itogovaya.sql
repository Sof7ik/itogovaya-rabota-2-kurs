-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 28 2019 г., 00:38
-- Версия сервера: 5.6.41
-- Версия PHP: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `itogovaya`
--

-- --------------------------------------------------------

--
-- Структура таблицы `cloth`
--

CREATE TABLE `cloth` (
  `id_cloth` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `structure` varchar(255) DEFAULT NULL,
  `width` varchar(40) NOT NULL,
  `length` varchar(40) NOT NULL,
  `cost` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `cloth`
--

INSERT INTO `cloth` (`id_cloth`, `name`, `color`, `picture`, `image`, `structure`, `width`, `length`, `cost`) VALUES
(1, 'Фетр', 'Зеленый', '1.jpg', '1.jpg', NULL, '1600', '1600', 1000);

-- --------------------------------------------------------

--
-- Структура таблицы `cloth_warehouse`
--

CREATE TABLE `cloth_warehouse` (
  `roll` int(11) NOT NULL,
  `id_cloth` int(11) NOT NULL,
  `width` varchar(40) NOT NULL,
  `length` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `furniture`
--

CREATE TABLE `furniture` (
  `id_furniture` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `width` varchar(40) NOT NULL,
  `length` varchar(40) DEFAULT NULL,
  `weight` varchar(40) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `cost` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `furniture`
--

INSERT INTO `furniture` (`id_furniture`, `name`, `type`, `width`, `length`, `weight`, `image`, `cost`) VALUES
(1, 'Шкаф деревянный', 'Шкаф', '14000', NULL, NULL, '1.jpg', 20000);

-- --------------------------------------------------------

--
-- Структура таблицы `furniture_warehouse`
--

CREATE TABLE `furniture_warehouse` (
  `furniture_set` int(11) NOT NULL,
  `id_furniture` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `ordered_products`
--

CREATE TABLE `ordered_products` (
  `order_number` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `order_data`
--

CREATE TABLE `order_data` (
  `order_number` int(11) NOT NULL,
  `order_date` datetime NOT NULL,
  `order_done_stage` varchar(255) NOT NULL,
  `customer` varchar(255) NOT NULL,
  `manager` varchar(255) DEFAULT NULL,
  `cost` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `product`
--

CREATE TABLE `product` (
  `id_product` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `width` varchar(40) NOT NULL,
  `length` varchar(40) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `products_from_furniture`
--

CREATE TABLE `products_from_furniture` (
  `id_furniture` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `position` varchar(255) NOT NULL,
  `width` varchar(40) DEFAULT NULL,
  `length` varchar(40) DEFAULT NULL,
  `turn_around` varchar(40) DEFAULT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `product_from_cloth`
--

CREATE TABLE `product_from_cloth` (
  `id_cloth` int(11) NOT NULL,
  `id_product` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` int(11) NOT NULL,
  `nickname` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`login`, `password`, `role`, `nickname`) VALUES
('123', '123', 1, 'Леонид'),
('director', '123', 3, 'Антон Овчинников'),
('zakazchik1', '123', 1, 'Базаров Андрей Вермитович');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `cloth`
--
ALTER TABLE `cloth`
  ADD PRIMARY KEY (`id_cloth`);

--
-- Индексы таблицы `cloth_warehouse`
--
ALTER TABLE `cloth_warehouse`
  ADD PRIMARY KEY (`roll`,`id_cloth`),
  ADD KEY `id_cloth` (`id_cloth`);

--
-- Индексы таблицы `furniture`
--
ALTER TABLE `furniture`
  ADD PRIMARY KEY (`id_furniture`);

--
-- Индексы таблицы `furniture_warehouse`
--
ALTER TABLE `furniture_warehouse`
  ADD PRIMARY KEY (`furniture_set`,`id_furniture`),
  ADD KEY `id_furniture` (`id_furniture`);

--
-- Индексы таблицы `ordered_products`
--
ALTER TABLE `ordered_products`
  ADD PRIMARY KEY (`order_number`,`id_product`),
  ADD KEY `id_product` (`id_product`);

--
-- Индексы таблицы `order_data`
--
ALTER TABLE `order_data`
  ADD PRIMARY KEY (`order_number`,`order_date`),
  ADD KEY `customer` (`customer`),
  ADD KEY `manager` (`manager`);

--
-- Индексы таблицы `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id_product`);

--
-- Индексы таблицы `products_from_furniture`
--
ALTER TABLE `products_from_furniture`
  ADD PRIMARY KEY (`id_furniture`,`id_product`),
  ADD KEY `id_product` (`id_product`);

--
-- Индексы таблицы `product_from_cloth`
--
ALTER TABLE `product_from_cloth`
  ADD PRIMARY KEY (`id_cloth`,`id_product`),
  ADD KEY `id_product` (`id_product`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`login`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `cloth`
--
ALTER TABLE `cloth`
  MODIFY `id_cloth` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `cloth_warehouse`
--
ALTER TABLE `cloth_warehouse`
  MODIFY `roll` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `furniture`
--
ALTER TABLE `furniture`
  MODIFY `id_furniture` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `order_data`
--
ALTER TABLE `order_data`
  MODIFY `order_number` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `product`
--
ALTER TABLE `product`
  MODIFY `id_product` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `cloth_warehouse`
--
ALTER TABLE `cloth_warehouse`
  ADD CONSTRAINT `cloth_warehouse_ibfk_1` FOREIGN KEY (`id_cloth`) REFERENCES `cloth` (`id_cloth`);

--
-- Ограничения внешнего ключа таблицы `furniture_warehouse`
--
ALTER TABLE `furniture_warehouse`
  ADD CONSTRAINT `furniture_warehouse_ibfk_1` FOREIGN KEY (`id_furniture`) REFERENCES `furniture` (`id_furniture`);

--
-- Ограничения внешнего ключа таблицы `ordered_products`
--
ALTER TABLE `ordered_products`
  ADD CONSTRAINT `ordered_products_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `product` (`id_product`),
  ADD CONSTRAINT `ordered_products_ibfk_2` FOREIGN KEY (`order_number`) REFERENCES `order_data` (`order_number`);

--
-- Ограничения внешнего ключа таблицы `order_data`
--
ALTER TABLE `order_data`
  ADD CONSTRAINT `order_data_ibfk_1` FOREIGN KEY (`customer`) REFERENCES `user` (`login`),
  ADD CONSTRAINT `order_data_ibfk_2` FOREIGN KEY (`manager`) REFERENCES `user` (`login`);

--
-- Ограничения внешнего ключа таблицы `products_from_furniture`
--
ALTER TABLE `products_from_furniture`
  ADD CONSTRAINT `products_from_furniture_ibfk_1` FOREIGN KEY (`id_furniture`) REFERENCES `furniture` (`id_furniture`),
  ADD CONSTRAINT `products_from_furniture_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `product` (`id_product`);

--
-- Ограничения внешнего ключа таблицы `product_from_cloth`
--
ALTER TABLE `product_from_cloth`
  ADD CONSTRAINT `product_from_cloth_ibfk_1` FOREIGN KEY (`id_cloth`) REFERENCES `cloth` (`id_cloth`),
  ADD CONSTRAINT `product_from_cloth_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `product` (`id_product`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
