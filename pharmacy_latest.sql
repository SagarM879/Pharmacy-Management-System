-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 15, 2018 at 08:31 AM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pharmacy`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` tinyint(5) NOT NULL,
  `username` varchar(10) NOT NULL,
  `password` varchar(10) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `username`, `password`, `date`) VALUES
(1, 'admin', 'admin', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `cashier`
--

CREATE TABLE `cashier` (
  `cashier_id` tinyint(5) NOT NULL,
  `first_name` varchar(15) NOT NULL,
  `last_name` varchar(15) NOT NULL,
  `staff_id` varchar(10) NOT NULL,
  `postal_address` varchar(20) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `email` varchar(20) NOT NULL,
  `username` varchar(10) NOT NULL,
  `password` varchar(10) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cashier`
--

INSERT INTO `cashier` (`cashier_id`, `first_name`, `last_name`, `staff_id`, `postal_address`, `phone`, `email`, `username`, `password`, `date`) VALUES
(6, 'Ajay', 'Kamath', 'C001', 'NewYork', '789654123', 'ajaykamath@gmail.com', 'cashier', 'cashier', '2018-04-14 11:56:30');

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `invoice_id` int(5) NOT NULL,
  `customer_name` varchar(30) NOT NULL,
  `served_by` varchar(15) NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'Unpaid',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`invoice_id`, `customer_name`, `served_by`, `status`, `date`) VALUES
(10, 'Sigar', 'osoro', 'Pending', '2018-01-10 11:19:42'),
(11, 'Jalas', 'osoro', 'Pending', '2018-01-10 11:28:59'),
(12, 'Abuto', 'osoro', 'Pending', '2018-01-10 12:19:02'),
(13, 'Andre', 'osoro', 'Pending', '2018-01-10 12:25:19'),
(14, 'William', 'osoro', 'Pending', '2018-01-10 12:29:38'),
(15, 'Osoro', 'osoro', 'Pending', '2018-01-10 12:39:51'),
(16, 'Sam Osoro', 'osoro', 'Pending', '2018-01-10 12:49:45'),
(17, 'Peter Nyaisa', 'osoro', 'Pending', '2018-01-10 12:51:48'),
(18, 'Gtyhd', 'osoro', 'Pending', '2018-01-12 19:20:44'),
(19, 'Jay-z', 'osoro', 'Pending', '2018-02-12 20:34:51');

--
-- Triggers `invoice`
--
DELIMITER $$
CREATE TRIGGER `tarehe` AFTER INSERT ON `invoice` FOR EACH ROW BEGIN
     SET @date=NOW();
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_details`
--

CREATE TABLE `invoice_details` (
  `id` tinyint(5) NOT NULL,
  `invoice` int(5) NOT NULL,
  `drug` tinyint(5) NOT NULL,
  `cost` int(5) DEFAULT NULL,
  `quantity` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoice_details`
--

INSERT INTO `invoice_details` (`id`, `invoice`, `drug`, `cost`, `quantity`) VALUES
(2, 10, 5, 5, 12),
(3, 11, 5, 5, 12),
(5, 11, 6, 120, 12),
(6, 12, 5, 5, 15),
(7, 12, 6, 120, 17),
(9, 12, 7, 250, 15),
(10, 12, 8, 15, 15),
(11, 12, 9, 1, 20),
(13, 13, 5, 5, 5),
(14, 13, 6, 120, 10),
(15, 13, 7, 250, 20),
(16, 13, 8, 15, 16),
(17, 13, 9, 1, 10),
(19, 14, 5, 5, 5),
(20, 15, 5, 5, 12),
(21, 16, 5, 5, 30),
(22, 16, 6, 120, 10),
(23, 17, 5, 5, 10),
(24, 17, 8, 15, 60),
(25, 18, 5, 5, 12),
(26, 18, 6, 120, 15),
(27, 19, 5, 5, 12),
(28, 19, 6, 120, 15),
(29, 19, 8, 15, 20),
(30, 19, 9, 1, 20);

-- --------------------------------------------------------

--
-- Table structure for table `manager`
--

CREATE TABLE `manager` (
  `manager_id` tinyint(5) NOT NULL,
  `first_name` varchar(15) NOT NULL,
  `last_name` varchar(15) NOT NULL,
  `staff_id` varchar(10) NOT NULL,
  `postal_address` varchar(20) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `email` varchar(20) NOT NULL,
  `username` varchar(10) NOT NULL,
  `password` varchar(10) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `manager`
--

INSERT INTO `manager` (`manager_id`, `first_name`, `last_name`, `staff_id`, `postal_address`, `phone`, `email`, `username`, `password`, `date`) VALUES
(1, 'Samwel', 'Osoro', 'sam/pharm', '456 Kabu', '0789653417', 'samoso@pharmacy.com', 'manager', 'manager', '2018-01-10 14:09:03');

-- --------------------------------------------------------

--
-- Table structure for table `paymenttypes`
--

CREATE TABLE `paymenttypes` (
  `id` tinyint(5) NOT NULL,
  `Name` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `paymenttypes`
--

INSERT INTO `paymenttypes` (`id`, `Name`) VALUES
(1, 'Cash'),
(2, 'Credit card'),
(3, 'Mobile Money'),
(4, 'Cheque'),
(5, '');

-- --------------------------------------------------------

--
-- Table structure for table `pharmacist`
--

CREATE TABLE `pharmacist` (
  `pharmacist_id` tinyint(5) NOT NULL,
  `first_name` varchar(15) NOT NULL,
  `last_name` varchar(15) NOT NULL,
  `staff_id` varchar(10) NOT NULL,
  `postal_address` varchar(20) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `email` varchar(20) NOT NULL,
  `username` varchar(10) NOT NULL,
  `password` varchar(10) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pharmacist`
--

INSERT INTO `pharmacist` (`pharmacist_id`, `first_name`, `last_name`, `staff_id`, `postal_address`, `phone`, `email`, `username`, `password`, `date`) VALUES
(24, 'Sumukh', 'Kudu', 'P001', 'Nashik', '7896541230', 'sumukh.kudu@gmail.co', 'pharmacist', 'pharmacist', '2018-04-14 12:35:25'),
(25, 'Akshay', 'Kumar', 'P002', 'Pune', '9876543215', 'akshay.kumar@gmail.c', 'akshay', '1234', '2018-04-14 12:39:40'),
(26, 'Sumit', 'Vora', 'P003', 'Nagpur', '7894561230', 'sumitvora@gmail.com', 'sumit', '1234', '2018-04-14 12:40:33'),
(27, 'Pradip', 'Rathod', 'P004', 'Pune', '7894561320', 'pradip.rathod@gmail.', 'pradip', '1234', '2018-04-14 12:45:07'),
(28, 'Nilesh', 'Malekar', 'P005', 'Nashik', '9876541250', 'nileshm@gmail.com', 'nilesh', '1234', '2018-04-14 12:45:56'),
(29, 'Santosh', 'Naik', 'P006', 'Pune', '9876540123', 'santoshn@gmail.com', 'santosh', '1234', '2018-04-14 12:46:52'),
(30, 'Amir', 'Jadhav', 'P007', 'Mumbai', '7894562130', 'amirjadhav@gmail.com', 'amir', '1234', '2018-04-14 12:48:41'),
(31, 'Rahul', 'Jagtap', 'P008', 'Pune', '9874560321', 'rahuljag@gmail.com', 'rahul', '1234', '2018-04-14 12:49:52'),
(32, 'Sudeet ', 'Bhoir', 'P009', 'Mumbai', '9875463210', 'sudeet213@gmail.com', 'sudeet', '1234', '2018-04-14 12:51:44'),
(33, 'Bhavin', 'Kumar', 'P010', 'Mumbai', '9875462130', 'bhavin@gmail.com', 'bhavin', '1234', '2018-04-14 12:53:05'),
(34, 'Rohan', 'Vartak', 'P011', 'Nagpur', '9874563012', 'rohanv@gmail.com', 'rohan', '1234', '2018-04-14 17:08:51');

-- --------------------------------------------------------

--
-- Table structure for table `prescription`
--

CREATE TABLE `prescription` (
  `id` tinyint(5) NOT NULL,
  `prescription_id` int(5) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(30) NOT NULL,
  `age` int(11) NOT NULL,
  `sex` varchar(6) NOT NULL,
  `postal_address` varchar(20) NOT NULL,
  `invoice_id` tinyint(5) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prescription`
--

INSERT INTO `prescription` (`id`, `prescription_id`, `customer_id`, `customer_name`, `age`, `sex`, `postal_address`, `invoice_id`, `phone`, `date`) VALUES
(4, 1002, 254678, 'Andre', 0, 'male', '45 eldy', 13, '0987643524', '2018-02-10 12:25:19'),
(9, 1003, 6765, 'Gtyhd', 45, 'Male', '664466447744 Njy', 18, '887998457', '2018-02-12 19:20:44'),
(10, 1004, 1678, 'Jay-z', 45, 'Male', '123 Brooklyn', 19, '088721313', '2018-02-12 20:34:50');

--
-- Triggers `prescription`
--
DELIMITER $$
CREATE TRIGGER `taree` AFTER INSERT ON `prescription` FOR EACH ROW BEGIN
SET@date=NOW();
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `prescription_details`
--

CREATE TABLE `prescription_details` (
  `id` tinyint(5) NOT NULL,
  `pres_id` int(5) NOT NULL,
  `drug_name` tinyint(5) NOT NULL,
  `strength` varchar(15) NOT NULL,
  `dose` varchar(15) NOT NULL,
  `quantity` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prescription_details`
--

INSERT INTO `prescription_details` (`id`, `pres_id`, `drug_name`, `strength`, `dose`, `quantity`) VALUES
(2, 999, 5, '10 gms', '1x2', 12),
(3, 1000, 5, '10 gms', '1x2', 12),
(5, 1000, 6, '150 gms', '1x4', 12),
(6, 1001, 5, '20 gms', '2x3', 15),
(7, 1001, 6, '30 gms', '2x4', 17),
(9, 1001, 7, '50 gms', '1x3', 15),
(10, 1001, 8, '40 gms', '1x3', 15),
(11, 1001, 9, '15 gms', '2x3', 20),
(13, 1002, 5, '50 gms', '2X3', 5),
(14, 1002, 6, '150 gms', '2X3', 10),
(15, 1002, 7, '20 gms', '2X3', 20),
(16, 1002, 8, '15 gms', '2X3', 16),
(17, 1002, 9, '10 gms', '2X3', 10),
(19, 1003, 5, '50 gms', '1x2', 5),
(20, 1004, 5, '12', '1x2', 12),
(21, 1005, 5, '20 gms', '2x3', 30),
(22, 1005, 6, '40 gms', '1x3', 10),
(23, 1006, 5, '12 gms', '1x3', 10),
(24, 1006, 8, '15 gms', '1x3', 60),
(25, 1003, 5, '20 gms', '1x3', 12),
(26, 1003, 6, '30 gms', '1x2', 15),
(27, 1004, 5, '20 gms', '1x3', 12),
(28, 1004, 6, '150 gms', '1x4', 15),
(29, 1004, 8, '120 gms', '1x3', 20),
(30, 1004, 9, '10 gms', '2x3', 20);

-- --------------------------------------------------------

--
-- Table structure for table `receipts`
--

CREATE TABLE `receipts` (
  `reciptNo` int(10) NOT NULL,
  `customer_id` varchar(10) NOT NULL,
  `total` int(10) NOT NULL,
  `payType` varchar(10) NOT NULL,
  `serialno` varchar(10) DEFAULT NULL,
  `served_by` varchar(15) NOT NULL,
  `date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `receipts`
--

INSERT INTO `receipts` (`reciptNo`, `customer_id`, `total`, `payType`, `serialno`, `served_by`, `date`) VALUES
(0, '', 1500, '', '', 'sam', '0000-00-00 00:00:00'),
(999, '', 1350, '', '', 'sam', '0000-00-00 00:00:00');

--
-- Triggers `receipts`
--
DELIMITER $$
CREATE TRIGGER `siku` AFTER INSERT ON `receipts` FOR EACH ROW BEGIN
     SET @date=NOW();
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

CREATE TABLE `stock` (
  `stock_id` tinyint(5) NOT NULL,
  `drug_name` varchar(20) NOT NULL,
  `category` varchar(20) NOT NULL,
  `description` varchar(50) NOT NULL,
  `company` varchar(20) NOT NULL,
  `supplier` varchar(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  `cost` int(11) NOT NULL,
  `status` enum('Available','Inavailable') NOT NULL,
  `date_supplied` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stock`
--

INSERT INTO `stock` (`stock_id`, `drug_name`, `category`, `description`, `company`, `supplier`, `quantity`, `cost`, `status`, `date_supplied`) VALUES
(5, 'Piriton', 'tablet', 'Painkiller', 'SB', 'SB', 1000, 5, 'Available', '2018-03-30'),
(6, 'Dual Cotexin', 'tablet', 'Malaria', 'GX', 'Clinix', 150, 120, 'Available', '2018-03-30'),
(7, 'Naproxen', 'Tablet', 'Reproductive', 'Family Health', 'Stopes', 250, 250, 'Available', '2018-03-30'),
(8, 'Flagi', 'talet', 'Digestive', 'GX', 'Clinix', 657, 15, 'Available', '2018-03-30'),
(9, 'Actal', 'Tablet', 'Stomach Reliev', 'GX', 'Clinix', 1000, 1, 'Available', '2018-03-06');

-- --------------------------------------------------------

--
-- Table structure for table `stock_chennai`
--

CREATE TABLE `stock_chennai` (
  `stock_id` int(5) NOT NULL,
  `drug_name` varchar(20) NOT NULL,
  `category` varchar(20) NOT NULL,
  `description` varchar(20) NOT NULL,
  `company` varchar(20) NOT NULL,
  `supplier` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `quantity` int(10) NOT NULL,
  `cost` int(10) NOT NULL,
  `status` varchar(20) NOT NULL,
  `date_supplied` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stock_chennai`
--

INSERT INTO `stock_chennai` (`stock_id`, `drug_name`, `category`, `description`, `company`, `supplier`, `city`, `quantity`, `cost`, `status`, `date_supplied`) VALUES
(100, 'Printin', 'tablet', 'PainKiller', 'SB', 'Clinix', 'chennai', 122, 100, 'Avaliable', '2018-02-13'),
(101, 'Printin', 'tablet', 'PainKiller', 'SB', 'Clinix', 'chennai', 122, 120, 'Avaliable', '2018-02-13'),
(102, 'Flagi', 'tablet', 'PainKiller', 'SB', 'SB', 'chennai', 100, 50, 'Avaliable', '2018-02-25'),
(103, 'Actal', 'tablet', 'PainKiller', 'SB', 'Stopes', 'chennai', 50, 70, 'Avaliable', '2018-02-28'),
(104, 'Actal', 'tablet', 'Digestive', 'GX', 'GX', 'chennai', 50, 80, 'Avaliable', '2018-02-26'),
(105, 'Printin', 'tablet', 'PainKiller', 'SB', 'Clinix', 'chennai', 122, 150, 'Avaliable', '2018-02-13'),
(106, 'Printin', 'tablet', 'PainKiller', 'SB', 'Clinix', 'chennai', 122, 150, 'Avaliable', '2018-02-13'),
(107, 'Printin', 'tablet', 'PainKiller', 'SB', 'Clinix', 'chennai', 122, 150, 'Avaliable', '2018-02-13');

-- --------------------------------------------------------

--
-- Table structure for table `stock_delhi`
--

CREATE TABLE `stock_delhi` (
  `stock_id` int(5) NOT NULL,
  `drug_name` varchar(20) NOT NULL,
  `category` varchar(20) NOT NULL,
  `description` varchar(20) NOT NULL,
  `company` varchar(20) NOT NULL,
  `supplier` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `quantity` int(10) NOT NULL,
  `cost` int(10) NOT NULL,
  `status` varchar(20) NOT NULL,
  `date_supplied` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stock_delhi`
--

INSERT INTO `stock_delhi` (`stock_id`, `drug_name`, `category`, `description`, `company`, `supplier`, `city`, `quantity`, `cost`, `status`, `date_supplied`) VALUES
(201, 'Piriton', 'tablet', 'Painkiller', 'SB', 'SB', 'delhi', 500, 60, 'Avaliable', '2018-02-15'),
(202, 'Flagi', 'tablet', 'Digestive', 'Gx', 'Clinix', 'delhi', 122, 70, 'Avaliable', '2018-02-13'),
(203, 'Penicilin', 'tablet', 'Painkiller', 'Gx', 'Clinix', 'delhi', 500, 80, 'Avaliable', '2018-02-25'),
(204, 'Flagi', 'tablet', 'Stomach Relive', 'SB', 'SB', 'delhi', 60, 120, 'Avaliable', '2018-02-17'),
(205, 'Flagi', 'tablet', 'Painkiller', 'Gx', 'Clinix', 'delhi', 102, 80, 'Avaliable', '2018-02-13'),
(206, 'Piriton', 'tablet', 'Painkiller', 'SB', 'SB', 'delhi', 150, 90, 'Avaliable', '2018-01-18'),
(207, 'Flagi', 'tablet', 'Digestive', 'Gx', 'Clinix', 'delhi', 50, 120, 'Avaliable', '2018-02-14'),
(208, 'Prition', 'tablet', 'Painkiller', 'Gx', 'GX', 'delhi', 40, 60, 'Avaliable', '2018-02-25'),
(209, 'Flagi', 'tablet', 'Digestive', 'Gx', 'Clinix', 'delhi', 122, 70, 'Avaliable', '2018-02-13');

-- --------------------------------------------------------

--
-- Table structure for table `stock_mumbai`
--

CREATE TABLE `stock_mumbai` (
  `stock_id` int(5) NOT NULL,
  `drug_name` varchar(20) NOT NULL,
  `category` varchar(20) NOT NULL,
  `description` varchar(20) NOT NULL,
  `company` varchar(20) NOT NULL,
  `supplier` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `quantity` int(10) NOT NULL,
  `cost` int(10) NOT NULL,
  `status` varchar(20) NOT NULL,
  `date_supplied` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stock_mumbai`
--

INSERT INTO `stock_mumbai` (`stock_id`, `drug_name`, `category`, `description`, `company`, `supplier`, `city`, `quantity`, `cost`, `status`, `date_supplied`) VALUES
(301, 'Piriton', 'tablet', 'Painkiller', 'SB', 'SB', 'mumbai', 500, 80, 'Avaliable', '2018-02-15'),
(302, 'Flagi', 'tablet', 'Digestive', 'Gx', 'Clinix', 'mumbai', 122, 90, 'Avaliable', '2018-02-13'),
(303, 'Penicilin', 'tablet', 'Painkiller', 'Gx', 'Clinix', 'mumbai', 500, 70, 'Avaliable', '2018-02-25'),
(304, 'Actal', 'tablet', 'Stomach Relive', 'SB', 'SB', 'mumbai', 60, 120, 'Avaliable', '2018-02-17'),
(305, 'Flagi', 'tablet', 'Digestive', 'Gx', 'Clinix', 'mumbai', 122, 60, 'Avaliable', '2018-02-13'),
(306, 'Penicilin', 'tablet', 'Painkiller', 'SB', 'SB', 'mumbai', 100, 120, 'Avaliable', '2018-01-18'),
(307, 'Flagi', 'tablet', 'Digestive', 'Gx', 'Clinix', 'mumbai', 50, 500, 'Avaliable', '2018-02-14'),
(308, 'Prition', 'tablet', 'Painkiller', 'Gx', 'GX', 'mumbai', 40, 60, 'Avaliable', '2018-02-25'),
(309, 'Flagi', 'tablet', 'Digestive', 'Gx', 'Clinix', 'mumbai', 122, 90, 'Avaliable', '2018-02-13');

-- --------------------------------------------------------

--
-- Table structure for table `tempprescri`
--

CREATE TABLE `tempprescri` (
  `id` tinyint(5) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(30) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `sex` varchar(6) DEFAULT NULL,
  `postal_address` varchar(30) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `drug_name` varchar(30) NOT NULL,
  `strength` varchar(30) NOT NULL,
  `dose` varchar(30) NOT NULL,
  `quantity` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `cashier`
--
ALTER TABLE `cashier`
  ADD PRIMARY KEY (`cashier_id`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_id`);

--
-- Indexes for table `invoice_details`
--
ALTER TABLE `invoice_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stocks` (`drug`),
  ADD KEY `invoices` (`invoice`);

--
-- Indexes for table `manager`
--
ALTER TABLE `manager`
  ADD PRIMARY KEY (`manager_id`);

--
-- Indexes for table `paymenttypes`
--
ALTER TABLE `paymenttypes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pharmacist`
--
ALTER TABLE `pharmacist`
  ADD PRIMARY KEY (`pharmacist_id`);

--
-- Indexes for table `prescription`
--
ALTER TABLE `prescription`
  ADD PRIMARY KEY (`id`,`prescription_id`);

--
-- Indexes for table `prescription_details`
--
ALTER TABLE `prescription_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dsfd` (`drug_name`);

--
-- Indexes for table `receipts`
--
ALTER TABLE `receipts`
  ADD PRIMARY KEY (`reciptNo`);

--
-- Indexes for table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`stock_id`);

--
-- Indexes for table `stock_chennai`
--
ALTER TABLE `stock_chennai`
  ADD PRIMARY KEY (`stock_id`);

--
-- Indexes for table `stock_delhi`
--
ALTER TABLE `stock_delhi`
  ADD PRIMARY KEY (`stock_id`);

--
-- Indexes for table `stock_mumbai`
--
ALTER TABLE `stock_mumbai`
  ADD PRIMARY KEY (`stock_id`);

--
-- Indexes for table `tempprescri`
--
ALTER TABLE `tempprescri`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` tinyint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `cashier`
--
ALTER TABLE `cashier`
  MODIFY `cashier_id` tinyint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `invoice_details`
--
ALTER TABLE `invoice_details`
  MODIFY `id` tinyint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `manager`
--
ALTER TABLE `manager`
  MODIFY `manager_id` tinyint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `paymenttypes`
--
ALTER TABLE `paymenttypes`
  MODIFY `id` tinyint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `pharmacist`
--
ALTER TABLE `pharmacist`
  MODIFY `pharmacist_id` tinyint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `prescription`
--
ALTER TABLE `prescription`
  MODIFY `id` tinyint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `prescription_details`
--
ALTER TABLE `prescription_details`
  MODIFY `id` tinyint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `stock`
--
ALTER TABLE `stock`
  MODIFY `stock_id` tinyint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `stock_chennai`
--
ALTER TABLE `stock_chennai`
  MODIFY `stock_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;
--
-- AUTO_INCREMENT for table `stock_delhi`
--
ALTER TABLE `stock_delhi`
  MODIFY `stock_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=210;
--
-- AUTO_INCREMENT for table `stock_mumbai`
--
ALTER TABLE `stock_mumbai`
  MODIFY `stock_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=310;
--
-- AUTO_INCREMENT for table `tempprescri`
--
ALTER TABLE `tempprescri`
  MODIFY `id` tinyint(5) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `invoice_details`
--
ALTER TABLE `invoice_details`
  ADD CONSTRAINT `invoices` FOREIGN KEY (`invoice`) REFERENCES `invoice` (`invoice_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `stocks` FOREIGN KEY (`drug`) REFERENCES `stock` (`stock_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `prescription_details`
--
ALTER TABLE `prescription_details`
  ADD CONSTRAINT `dsfd` FOREIGN KEY (`drug_name`) REFERENCES `stock` (`stock_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
