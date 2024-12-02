-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 02, 2024 at 12:35 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `express_laundry`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `fullname`, `address`, `contact`, `created_at`) VALUES
(1, 'BRIAN CAPIRAL', '10-A-Agoncillo St iligan city ', '12312312344', '2024-12-02 03:21:33'),
(2, 'JOSHUA ASDSA', 'asdsad', '13245654567', '2024-12-02 03:21:43'),
(3, 'JON  SINA', '10-A-Agoncillo St iligan city ', '23232323232', '2024-12-02 04:24:46');

-- --------------------------------------------------------

--
-- Table structure for table `expenditures`
--

CREATE TABLE `expenditures` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `expenditures`
--

INSERT INTO `expenditures` (`id`, `user_id`, `item_id`, `transaction_id`, `qty`, `created_at`) VALUES
(3, 1, 6, 5, 4, '2024-12-02 04:50:08'),
(4, 1, 5, 5, 1, '2024-12-02 04:50:36');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `name`, `unit`, `stock`, `created_at`) VALUES
(3, 'Liquid Detergent', 'Liters', 11, '2024-12-02 04:46:03'),
(4, 'Powdered Detergent', 'kg', 10, '2024-12-02 04:46:27'),
(5, 'Fabric Softener', 'Liters ', 9, '2024-12-02 04:46:50'),
(6, 'Bleach', 'Liters (L)', 11, '2024-12-02 04:47:44');

-- --------------------------------------------------------

--
-- Table structure for table `laundry`
--

CREATE TABLE `laundry` (
  `id` int(11) NOT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `kilo` double DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `date0` datetime DEFAULT NULL,
  `date1` datetime DEFAULT NULL,
  `date2` datetime DEFAULT NULL,
  `date3` datetime DEFAULT NULL,
  `date4` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `laundry`
--

INSERT INTO `laundry` (`id`, `transaction_id`, `kilo`, `type`, `status`, `date0`, `date1`, `date2`, `date3`, `date4`, `created_at`) VALUES
(1, 1, 5, 1, '4', '2024-12-02 04:04:52', '2024-12-02 04:05:00', '2024-12-02 04:13:00', '2024-12-02 04:17:31', NULL, '2024-12-02 03:23:05'),
(2, 2, 1, 1, '4', '2024-12-02 03:34:25', '2024-12-02 03:47:25', '2024-12-02 04:12:53', '2024-12-02 04:12:57', NULL, '2024-12-02 03:34:06'),
(3, 2, 4, 1, '4', '2024-12-02 03:48:13', '2024-12-02 03:48:15', '2024-12-02 03:48:22', '2024-12-02 03:48:33', NULL, '2024-12-02 03:44:05'),
(5, 2, 1, 1, '4', '2024-12-02 04:17:38', '2024-12-02 04:17:44', '2024-12-02 04:28:12', '2024-12-02 04:28:28', NULL, '2024-12-02 04:14:40'),
(8, 4, 10, 1, '0', NULL, NULL, NULL, NULL, NULL, '2024-12-02 04:29:49'),
(9, 4, 1, 1, '2', '2024-12-02 04:55:41', '2024-12-02 04:55:54', NULL, NULL, NULL, '2024-12-02 04:30:01'),
(10, 3, 10, 1, '0', NULL, NULL, NULL, NULL, NULL, '2024-12-02 04:33:43'),
(11, 5, 3, 1, '1', '2024-12-02 04:55:44', NULL, NULL, NULL, NULL, '2024-12-02 04:37:09');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `logs` text DEFAULT NULL,
  `type` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`id`, `user_id`, `logs`, `type`, `created_at`) VALUES
(1, 1, 'adminUser has logged out', 'Logout', '2024-12-02 03:15:16'),
(2, 1, 'admin| Logged in', 'Login', '2024-12-02 03:15:19'),
(3, 1, 'admin| Logged in', 'Login', '2024-12-02 03:17:54'),
(4, 1, 'Wash | New Price was added', 'Adding Price', '2024-12-02 03:19:21'),
(5, 1, 'adminUser has logged out', 'Logout', '2024-12-02 03:20:40'),
(6, 1, 'adminUser has logged out', 'Logout', '2024-12-02 03:21:21'),
(7, 1, 'admin| Logged in', 'Login', '2024-12-02 03:21:24'),
(8, 1, 'BRIAN CAPIRAL| New Customer was added', 'Adding Customer', '2024-12-02 03:21:33'),
(9, 1, 'JOSHUA ASDSA| New Customer was added', 'Adding Customer', '2024-12-02 03:21:43'),
(10, 1, 'Pet Feeder | New Item was added', 'Adding Item', '2024-12-02 03:22:00'),
(11, 1, 'New Transaction was added', 'Adding Transaction', '2024-12-02 03:22:19'),
(12, 1, '1| was added', 'Adding Laundry', '2024-12-02 03:23:05'),
(13, 1, 'Adding Expenditures', 'Added item to transaction', '2024-12-02 03:23:18'),
(14, 1, '1 added a new pending transaction', 'New Pending Transaction', '2024-12-02 03:23:23'),
(15, 1, 'New Transaction was added', 'Adding Transaction', '2024-12-02 03:24:10'),
(16, 1, '1| was added', 'Adding Laundry', '2024-12-02 03:34:06'),
(17, 1, '2| Transaction was updated to Pending by admin.', 'Update Transaction', '2024-12-02 03:34:25'),
(18, 1, '2| Transaction was updated to Washing by admin.', 'Update Transaction', '2024-12-02 03:34:34'),
(19, 1, 'soap| New Item was added', 'Adding Item', '2024-12-02 03:35:25'),
(20, 1, '1| was added', 'Adding Laundry', '2024-12-02 03:44:05'),
(21, 1, '1| was added', 'Adding Laundry', '2024-12-02 03:44:44'),
(22, 1, '2| Transaction was updated to Ready for Pickup by admin.', 'Update Transaction', '2024-12-02 03:47:23'),
(23, 1, '2| Transaction was updated to Washing by admin.', 'Update Transaction', '2024-12-02 03:47:25'),
(24, 1, '3| Transaction was updated to Pending by admin.', 'Update Transaction', '2024-12-02 03:48:13'),
(25, 1, '3| Transaction was updated to Washing by admin.', 'Update Transaction', '2024-12-02 03:48:15'),
(26, 1, '3| Transaction was updated to Folding by admin.', 'Update Transaction', '2024-12-02 03:48:22'),
(27, 1, '3| Transaction was updated to Ready for Pickup by admin.', 'Update Transaction', '2024-12-02 03:48:33'),
(28, 1, '4| Transaction was updated to Pending by admin.', 'Update Transaction', '2024-12-02 03:57:07'),
(29, 1, '1| Transaction was updated to Pending by admin.', 'Update Transaction', '2024-12-02 04:04:52'),
(30, 1, '1| Transaction was updated to Washing by admin.', 'Update Transaction', '2024-12-02 04:05:00'),
(31, 1, '2| Transaction was updated to Folding by admin.', 'Update Transaction', '2024-12-02 04:12:53'),
(32, 1, '2| Transaction was updated to Ready for Pickup by admin.', 'Update Transaction', '2024-12-02 04:12:57'),
(33, 1, '1| Transaction was updated to Folding by admin.', 'Update Transaction', '2024-12-02 04:13:00'),
(34, 1, 'soap| New Item was added', 'Adding Item', '2024-12-02 04:13:23'),
(35, 1, 'Adding Expenditures', 'Added item to transaction', '2024-12-02 04:13:29'),
(36, 1, '4| Laundry was removed', 'Removing Laundry', '2024-12-02 04:13:39'),
(37, 1, '1| was added', 'Adding Laundry', '2024-12-02 04:14:40'),
(38, 1, '1 added a new pending transaction', 'New Pending Transaction', '2024-12-02 04:14:46'),
(39, 1, 'New Transaction was added', 'Adding Transaction', '2024-12-02 04:16:36'),
(40, 1, '1| was added', 'Adding Laundry', '2024-12-02 04:16:41'),
(41, 1, '1| was added', 'Adding Laundry', '2024-12-02 04:16:50'),
(42, 1, '7| Transaction was updated to Pending by admin.', 'Update Transaction', '2024-12-02 04:17:18'),
(43, 1, '1| Transaction was updated to Ready for Pickup by admin.', 'Update Transaction', '2024-12-02 04:17:31'),
(44, 1, '5| Transaction was updated to Pending by admin.', 'Update Transaction', '2024-12-02 04:17:38'),
(45, 1, '7| Transaction was updated to Washing by admin.', 'Update Transaction', '2024-12-02 04:17:41'),
(46, 1, '5| Transaction was updated to Washing by admin.', 'Update Transaction', '2024-12-02 04:17:44'),
(47, 1, 'adminUser has logged out', 'Logout', '2024-12-02 04:21:08'),
(48, 1, 'admin| Logged in', 'Login', '2024-12-02 04:21:18'),
(49, 1, 'staff| New Staff was added', 'Adding Staff', '2024-12-02 04:24:03'),
(50, 1, 'adminUser has logged out', 'Logout', '2024-12-02 04:24:07'),
(51, 2, 'staff| Logged in', 'Login', '2024-12-02 04:24:09'),
(52, 2, 'JON  SINA| New Customer was added', 'Adding Customer', '2024-12-02 04:24:46'),
(53, 2, '5| Transaction was updated to Folding by staff.', 'Update Transaction', '2024-12-02 04:28:12'),
(54, 2, '7| Transaction was updated to Folding by staff.', 'Update Transaction', '2024-12-02 04:28:16'),
(55, 2, '5| Transaction was updated to Ready for Pickup by staff.', 'Update Transaction', '2024-12-02 04:28:28'),
(56, 2, '7| Transaction was updated to Ready for Pickup by staff.', 'Update Transaction', '2024-12-02 04:28:30'),
(57, 2, 'New Transaction was added', 'Adding Transaction', '2024-12-02 04:29:40'),
(58, 2, '1| was added', 'Adding Laundry', '2024-12-02 04:29:49'),
(59, 2, '1| was added', 'Adding Laundry', '2024-12-02 04:30:01'),
(60, 2, '6| Transaction was updated to Pending by staff.', 'Update Transaction', '2024-12-02 04:31:32'),
(61, 2, '6| Transaction was updated to Washing by staff.', 'Update Transaction', '2024-12-02 04:31:43'),
(62, 2, '6| Transaction was updated to Folding by staff.', 'Update Transaction', '2024-12-02 04:31:56'),
(63, 2, '6| Transaction was updated to Ready for Pickup by staff.', 'Update Transaction', '2024-12-02 04:32:06'),
(64, 2, 'staffUser has logged out', 'Logout', '2024-12-02 04:33:08'),
(65, NULL, 'User has logged out', 'Logout', '2024-12-02 04:33:16'),
(66, 1, 'admin| Logged in', 'Login', '2024-12-02 04:33:20'),
(67, 1, '6| Laundry was removed', 'Removing Laundry', '2024-12-02 04:33:34'),
(68, 1, '7| Laundry was removed', 'Removing Laundry', '2024-12-02 04:33:37'),
(69, 1, '1| was added', 'Adding Laundry', '2024-12-02 04:33:43'),
(70, 1, 'Pet Feeder | New Item was added', 'Adding Item', '2024-12-02 04:34:17'),
(71, 1, 'Adding Expenditures', 'Added item to transaction', '2024-12-02 04:34:25'),
(72, 1, '1 added a new pending transaction', 'New Pending Transaction', '2024-12-02 04:34:27'),
(73, 1, 'New Transaction was added', 'Adding Transaction', '2024-12-02 04:34:47'),
(74, 1, '1| was added', 'Adding Laundry', '2024-12-02 04:37:09'),
(75, 1, '1| was added', 'Adding Laundry', '2024-12-02 04:41:36'),
(76, 1, 'Liquid Detergent| New Item was added', 'Adding Item', '2024-12-02 04:46:03'),
(77, 1, '2| Item was removed', 'Removing Supply', '2024-12-02 04:46:07'),
(78, 1, '1| Item was removed', 'Removing Supply', '2024-12-02 04:46:09'),
(79, 1, 'Powdered Detergent| New Item was added', 'Adding Item', '2024-12-02 04:46:27'),
(80, 1, 'Fabric Softener| New Item was added', 'Adding Item', '2024-12-02 04:46:50'),
(81, 1, 'Liquid Detergent| Item was updated', 'Updating Item', '2024-12-02 04:46:56'),
(82, 1, '3 Stock was deducted', 'Stock Out', '2024-12-02 04:47:12'),
(83, 1, '9 Stock was added', 'Stock In', '2024-12-02 04:47:17'),
(84, 1, '9 Stock was added', 'Stock In', '2024-12-02 04:47:22'),
(85, 1, 'Bleach| New Item was added', 'Adding Item', '2024-12-02 04:47:44'),
(86, 1, 'Adding Expenditures', 'Added item to transaction', '2024-12-02 04:50:08'),
(87, 1, 'Adding Expenditures', 'Added item to transaction', '2024-12-02 04:50:36'),
(88, 1, '12| Laundry was removed', 'Removing Laundry', '2024-12-02 04:51:03'),
(89, 1, '1 added a new pending transaction', 'New Pending Transaction', '2024-12-02 04:51:29'),
(90, 1, '9| Transaction was updated to Pending by admin.', 'Update Transaction', '2024-12-02 04:55:41'),
(91, 1, '11| Transaction was updated to Pending by admin.', 'Update Transaction', '2024-12-02 04:55:44'),
(92, 1, '9| Transaction was updated to Washing by admin.', 'Update Transaction', '2024-12-02 04:55:54'),
(93, 1, 'admin| Logged in', 'Login', '2024-12-02 05:35:58'),
(94, 1, '4 Stock was added', 'Stock In', '2024-12-02 05:49:22'),
(95, 1, '5 Stock was added', 'Stock In', '2024-12-02 05:49:27'),
(96, 1, 'Dry| New Price was added', 'Adding Price', '2024-12-02 05:51:16'),
(97, 1, 'adminUser has logged out', 'Logout', '2024-12-02 06:39:17'),
(98, 1, 'admin| Logged in', 'Login', '2024-12-02 06:39:46'),
(99, 1, 'adminUser has logged out', 'Logout', '2024-12-02 06:39:53'),
(100, 1, 'admin| Logged in', 'Login', '2024-12-02 07:05:35'),
(101, 1, 'adminUser has logged out', 'Logout', '2024-12-02 07:06:20'),
(102, 1, 'admin| Logged in', 'Login', '2024-12-02 07:13:34'),
(103, 1, 'adminUser has logged out', 'Logout', '2024-12-02 07:13:38'),
(104, 1, 'admin| Logged in', 'Login', '2024-12-02 07:18:38'),
(105, 1, 'admin| Logged in', 'Login', '2024-12-02 07:32:39');

-- --------------------------------------------------------

--
-- Table structure for table `prices`
--

CREATE TABLE `prices` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `prices`
--

INSERT INTO `prices` (`id`, `name`, `unit`, `price`, `created_at`) VALUES
(1, 'Wash ', 'Kg', 69.00, '2024-12-02 03:19:21'),
(2, 'Dry', 'Load', 49.00, '2024-12-02 05:51:16');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `customer_id`, `total`, `amount`, `status`, `created_at`) VALUES
(1, 1, 1, 345.00, 345.00, 'completed', '2024-12-02 03:22:19'),
(2, 1, 2, 414.00, 414.00, 'completed', '2024-12-02 03:24:10'),
(3, 1, 2, 690.00, 690.00, 'completed', '2024-12-02 04:16:36'),
(4, 2, 3, NULL, NULL, 'pending', '2024-12-02 04:29:40'),
(5, 1, 3, 207.00, 207.00, 'completed', '2024-12-02 04:34:47');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `level` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `level`, `created_at`) VALUES
(1, 'admin', '$2y$10$WgL2d2fzi6IiGiTfXvdBluTLlMroU8zBtIcRut7SzOB6j9i/LbA4K', '0', '2024-12-02 03:15:13'),
(2, 'staff', '$2y$10$O6jYiuUELXPvddl.XyT9pu4tnA6NfJkfQiit/VtlyT0pCRyMK1..O', '1', '2024-12-02 04:24:03');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenditures`
--
ALTER TABLE `expenditures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `transaction_id` (`transaction_id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `laundry`
--
ALTER TABLE `laundry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_id` (`transaction_id`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `prices`
--
ALTER TABLE `prices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `expenditures`
--
ALTER TABLE `expenditures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `laundry`
--
ALTER TABLE `laundry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `prices`
--
ALTER TABLE `prices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `expenditures`
--
ALTER TABLE `expenditures`
  ADD CONSTRAINT `expenditures_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `expenditures_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `expenditures_ibfk_3` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `laundry`
--
ALTER TABLE `laundry`
  ADD CONSTRAINT `laundry_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `laundry_ibfk_2` FOREIGN KEY (`type`) REFERENCES `prices` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `logs`
--
ALTER TABLE `logs`
  ADD CONSTRAINT `logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
