-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 10, 2022 at 08:57 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pharmamanagement`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `Add` (IN `id` INT(50), IN `name` VARCHAR(255), IN `rate` INT(255), IN `qnty` INT(255))  INSERT INTO `product`(`product_id`, `product_name`, `price`, `quantity`) VALUES (id,name,rate,qnty)$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `detail`
--

CREATE TABLE `detail` (
  `id` int(50) NOT NULL,
  `medid` varchar(255) NOT NULL,
  `time` datetime NOT NULL,
  `event` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detail`
--

INSERT INTO `detail` (`id`, `medid`, `time`, `event`) VALUES
(1, '14', '2022-04-10 12:44:39', 'Add'),
(2, '14', '2022-04-10 12:53:01', 'Delete'),
(3, '15', '2022-04-10 12:54:48', 'Add'),
(4, '15', '2022-04-10 12:54:52', 'Update'),
(5, '15', '2022-04-10 12:56:15', 'Update'),
(6, '15', '2022-04-10 12:56:34', 'Update');

-- --------------------------------------------------------

--
-- Table structure for table `medicine`
--

CREATE TABLE `medicine` (
  `med_id` int(50) NOT NULL,
  `med_name` varchar(255) NOT NULL,
  `price` float NOT NULL,
  `quantity` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `medicine`
--

INSERT INTO `medicine` (`med_id`, `med_name`, `price`, `quantity`) VALUES
(15, 'napa', 10, 5);

--
-- Triggers `medicine`
--
DELIMITER $$
CREATE TRIGGER `Add` AFTER INSERT ON `medicine` FOR EACH ROW INSERT INTO `detail`(`id`, `medid`, `time`, `event`) VALUES (null,new.med_id,now(),"Add")
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Delete` AFTER DELETE ON `medicine` FOR EACH ROW INSERT INTO `detail`(`id`, `medid`, `time`, `event`) VALUES (null,old.med_id,now(),"Delete")
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Update` AFTER UPDATE ON `medicine` FOR EACH ROW INSERT INTO `detail`(`id`, `medid`, `time`, `event`) VALUES (null,old.med_id,now(),"Update")
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `medi_view`
-- (See below for the actual view)
--
CREATE TABLE `medi_view` (
`med_name` varchar(255)
,`price` float
);

-- --------------------------------------------------------

--
-- Table structure for table `signup`
--

CREATE TABLE `signup` (
  `username` varchar(50) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `mobile` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `pass` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `signup`
--

INSERT INTO `signup` (`username`, `first_name`, `last_name`, `mobile`, `email`, `pass`) VALUES
('admin', 'a', 'b', 12345, '123@email.com', 'b59c67bf196a4758191e42f76670ceba');

-- --------------------------------------------------------

--
-- Structure for view `medi_view`
--
DROP TABLE IF EXISTS `medi_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `medi_view`  AS SELECT `medicine`.`med_name` AS `med_name`, `medicine`.`price` AS `price` FROM `medicine` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detail`
--
ALTER TABLE `detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medicine`
--
ALTER TABLE `medicine`
  ADD PRIMARY KEY (`med_id`);

--
-- Indexes for table `signup`
--
ALTER TABLE `signup`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detail`
--
ALTER TABLE `detail`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `medicine`
--
ALTER TABLE `medicine`
  MODIFY `med_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
