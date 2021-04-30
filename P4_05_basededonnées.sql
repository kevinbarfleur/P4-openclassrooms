-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 27, 2021 at 10:38 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `expressFood`
--

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `stater_product_id` int(11) DEFAULT NULL,
  `dish_product_id` int(11) DEFAULT NULL,
  `dessert_product_id` int(11) DEFAULT NULL,
  `availability` varchar(255) DEFAULT NULL,
  `is_today_special` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `stater_product_id`, `dish_product_id`, `dessert_product_id`, `availability`, `is_today_special`) VALUES
(1, 'Italian menu', 1, 3, 5, 'available', 1),
(2, 'French menu', 2, 4, 6, 'available', 0);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `delivery_user_id` int(11) DEFAULT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `order_items_id` int(11) DEFAULT NULL,
  `order_status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `delivery_user_id`, `order_date`, `order_items_id`, `order_status`) VALUES
(1, 1, 4, '2021-04-27 20:35:05', 1, 'in delivery');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `order_item_status` tinyint(1) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `menu_id`, `order_id`, `order_item_status`, `quantity`) VALUES
(1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `positions`
--

CREATE TABLE `positions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `lon` int(11) DEFAULT NULL,
  `lat` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `positions`
--

INSERT INTO `positions` (`id`, `user_id`, `lon`, `lat`) VALUES
(1, 1, 34, -119),
(2, 2, 34, -119),
(3, 3, 34, -119),
(4, 4, 34, -119),
(5, 5, 33, -97),
(6, 6, 41, -74);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `ingredient` varchar(255) DEFAULT NULL,
  `availability` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `type`, `price`, `ingredient`, `availability`) VALUES
(1, 'Wrapped Peaches with Burrata and Basil', 'dish', 10, 'Freestone peaches, Burrata chesse, Basil', 'available'),
(2, 'Prosciutto e Melone', 'dish', 8, 'Cantaloup, Prosciutto', 'available'),
(3, 'World Best Lasagna', 'dish', 13, 'Italaian sausage, Ground beef, Onion, Tomatoes, Noodles', 'available'),
(4, 'Pork Chops in Garlic Mushroom Sauce', 'dish', 18, 'Boneless pork chops, Paprika, Mushrooms, Dijon mustard', 'available'),
(5, 'Chocolate Eclair Dessert', 'dessert', 6, 'Chocolat, Vanilla', 'available'),
(6, 'Tangy Poppy Seed Fruit Salad', 'dessert', 5, 'Fruits tho (Orange, Kiwi, Grapes, Strawberries)', 'available');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `basket` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `adress` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `cp` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `card_number` int(11) DEFAULT NULL,
  `card_date` int(11) DEFAULT NULL,
  `card_csv` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `password`, `type`, `basket`, `position`, `adress`, `city`, `cp`, `country`, `phone`, `card_number`, `card_date`, `card_csv`, `created_at`) VALUES
(1, 'Joe', 'Dalton', 'joe.dalton@mail.com', '8iJBtbRfroXEP$#r', 'user', 1, 1, '12 broadway valley', 'Malibu', '90265', 'United states', '0120904845', 424242424, 1212, 424, '2021-04-27 20:36:22'),
(2, 'William', 'Dalton', 'william.dalton@mail.com', '7gf&R#56XT#gRByt', 'user', NULL, 2, '12 broadway valley', 'Malibu', '90265', 'United states', '0120904845', 424242424, 1212, 424, '2021-04-27 20:26:44'),
(3, 'Jack', 'Dalton', 'jack.dalton@mail.com', 'p??7TFLai3o4nTHn', 'user', NULL, 3, '12 broadway valley', 'Malibu', '90265', 'United states', '0128374845', 424242424, 1212, 424, '2021-04-27 20:26:52'),
(4, 'Averell', 'Dalton', 'averell.dalton@mail.com', 'g#75!?CHbkkk3@Sd', 'deliverer', NULL, 4, '12 broadway valley', 'Malibu', '90265', 'United states', '0120901083', 424242424, 1212, 424, '2021-04-27 20:27:01'),
(5, 'Lucky', 'Lucke', 'lucky.lucke@mail.com', 'DyMa!By99meRPq#q', 'user', NULL, 5, '65 straticaster view', 'Dalas', '90265', 'United states', '9184059111', 787878787, 1212, 424, '2021-04-27 20:27:10'),
(6, 'Billy', 'The kid', 'billy.tk@mail.com', 'aod6a@r#4yanKtbK$', 'deliverer', NULL, 6, '99 Graramond street', 'New York', '50265', 'United states', '9184059111', 787878787, 1212, 424, '2021-04-27 20:27:19');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stater_product_id` (`stater_product_id`),
  ADD KEY `dish_product_id` (`dish_product_id`),
  ADD KEY `dessert_product_id` (`dessert_product_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `delivery_user_id` (`delivery_user_id`),
  ADD KEY `order_items_id` (`order_items_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_id` (`menu_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `positions`
--
ALTER TABLE `positions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `basket` (`basket`),
  ADD KEY `position` (`position`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `positions`
--
ALTER TABLE `positions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `menus`
--
ALTER TABLE `menus`
  ADD CONSTRAINT `menus_ibfk_1` FOREIGN KEY (`stater_product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `menus_ibfk_2` FOREIGN KEY (`dish_product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `menus_ibfk_3` FOREIGN KEY (`dessert_product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`delivery_user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`order_items_id`) REFERENCES `order_items` (`id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`),
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Constraints for table `positions`
--
ALTER TABLE `positions`
  ADD CONSTRAINT `positions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`basket`) REFERENCES `menus` (`id`),
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`position`) REFERENCES `positions` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
