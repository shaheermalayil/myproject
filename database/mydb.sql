-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 07, 2018 at 08:06 AM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mydb`
--

-- --------------------------------------------------------

--
-- Table structure for table `diagnosis`
--

CREATE TABLE `diagnosis` (
  `diag_id` int(11) NOT NULL,
  `disease_id` varchar(30) NOT NULL,
  `drug_id` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `disease`
--

CREATE TABLE `disease` (
  `disease_id` int(10) NOT NULL,
  `disease_name` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `disease_master`
--

CREATE TABLE `disease_master` (
  `dise_id` int(11) NOT NULL,
  `disease` varchar(30) NOT NULL,
  `symtons` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `doctor_reg`
--

CREATE TABLE `doctor_reg` (
  `doc_id` int(11) NOT NULL,
  `d_name` varchar(30) NOT NULL,
  `qualification` varchar(30) NOT NULL,
  `spec` varchar(30) NOT NULL,
  `expert_level` varchar(30) NOT NULL,
  `type` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctor_reg`
--

INSERT INTO `doctor_reg` (`doc_id`, `d_name`, `qualification`, `spec`, `expert_level`, `type`) VALUES
(1, 'ds', 'sdasd', 'sdadad', '0.5', 'docter'),
(2, 'sonu', 'mbbs', 'md', '0.4335', 'docter'),
(3, 'praji', 'mbbs', 'md', '0.1', 'doctor');

-- --------------------------------------------------------

--
-- Table structure for table `drugs`
--

CREATE TABLE `drugs` (
  `drug_id` int(11) NOT NULL,
  `druag` int(11) NOT NULL,
  `side_effect` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `log_id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `type` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`log_id`, `username`, `password`, `type`) VALUES
(123, 'shaheer', '12345', 'user'),
(3, 'sdsad', '123', 'user'),
(5, 'vidya', '54321', 'user'),
(2, 'sonus', '1234', 'doctor'),
(3, 'paru', '123', 'doctor');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `news_id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `contents` varchar(500) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `prescription`
--

CREATE TABLE `prescription` (
  `pres_id` int(11) NOT NULL,
  `q_id` varchar(30) NOT NULL,
  `answer` varchar(100) NOT NULL,
  `truthness` varchar(30) NOT NULL DEFAULT '0.1',
  `doc_id` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prescription`
--

INSERT INTO `prescription` (`pres_id`, `q_id`, `answer`, `truthness`, `doc_id`) VALUES
(1, '2', '        you have fever take paracetamol 500mg ', '0.3', '2'),
(2, '2', '       take paracetamol 500mg', '0.3', '2'),
(3, '2', '        no other way', '0.0', '2'),
(4, '3', '        sdfasdfasdflasdfklasldgjlasdgaga', '0.4', '2'),
(5, '4', 'the applied asdfasdlfajsld;fjasldfs', '0.7', '2'),
(6, '5', '        u take paracetamol', '0.1', '2'),
(7, '6', '        sdfsdfsgsdfsdgsgsdhs', '0.6', '2'),
(8, '8', '        ewrwerwerttrtert', '0.5', '2'),
(9, '3', '        qwasd', '0.1', '2'),
(10, '8', '        take paracetamol 500', '0.4055', '2'),
(11, '8', '        take paracetamol 500', '0.8326', '2'),
(12, '5', '        you have fever', '0.4866', '2'),
(13, '8', '        its quite natural', '0.0', '3'),
(14, '5', '        you have nothing', '0.0', '3'),
(15, '7', '        don worry man', '0.1', '3'),
(16, '5', 'i cant do that', '0.1', '3'),
(17, '7', '       hai nothing to worry', '0.1', '3'),
(18, '8', '        do not worry', '0.1', '2'),
(19, '7', '        sdfsfsdfsfsf', '0.1', '2');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `q_id` int(11) NOT NULL,
  `q_user` varchar(50) NOT NULL,
  `question` varchar(100) NOT NULL,
  `asked_date` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`q_id`, `q_user`, `question`, `asked_date`) VALUES
(3, '5', 'fsdfsfsdfsfsdfsfs', '2018-02-16'),
(2, '5', '        helllow docter', '2018-02-15'),
(4, '5', '       haisa sdfjasdf asljdfaskldfjasldjf alsddfalskdasf', '2018-02-18'),
(5, '5', '        hello sir I am suffering from fever', '2018-03-01'),
(6, '5', '        sdsfsdfsfsfsf', '2018-03-01'),
(7, '5', '        sfdsdgdhdfjdhdhd', '2018-03-13'),
(8, '5', ' I have feaver', '2018-03-13');

-- --------------------------------------------------------

--
-- Table structure for table `replayed`
--

CREATE TABLE `replayed` (
  `check_id` int(30) NOT NULL,
  `doc_id` varchar(30) NOT NULL,
  `q_id` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `replayed`
--

INSERT INTO `replayed` (`check_id`, `doc_id`, `q_id`) VALUES
(1, '3', '7'),
(2, '2', '2'),
(3, '2', '3'),
(4, '2', '4'),
(5, '2', '5'),
(6, '2', '8'),
(7, '2', '7');

-- --------------------------------------------------------

--
-- Table structure for table `symptoms`
--

CREATE TABLE `symptoms` (
  `sim_id` int(11) NOT NULL,
  `sim_name` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `u_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `blood` varchar(5) NOT NULL,
  `dob` varchar(20) NOT NULL,
  `height` varchar(20) NOT NULL,
  `weight` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`u_id`, `name`, `blood`, `dob`, `height`, `weight`) VALUES
(1, 'shaheer', 'A+', '2018-02-15', '163', '50'),
(2, 'shaheer', 'A+', '2018-02-15', '163', '50'),
(3, 'shaheer', 'A+', '2018-02-15', '163', '50'),
(4, 'shaheer', 'A+', '2018-02-15', '163', '50'),
(5, 'vidyadeep', 'O+', '2018-02-15', '165', '58');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `diagnosis`
--
ALTER TABLE `diagnosis`
  ADD PRIMARY KEY (`diag_id`);

--
-- Indexes for table `disease`
--
ALTER TABLE `disease`
  ADD PRIMARY KEY (`disease_id`);

--
-- Indexes for table `disease_master`
--
ALTER TABLE `disease_master`
  ADD PRIMARY KEY (`dise_id`);

--
-- Indexes for table `doctor_reg`
--
ALTER TABLE `doctor_reg`
  ADD PRIMARY KEY (`doc_id`);

--
-- Indexes for table `drugs`
--
ALTER TABLE `drugs`
  ADD PRIMARY KEY (`drug_id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`news_id`);

--
-- Indexes for table `prescription`
--
ALTER TABLE `prescription`
  ADD PRIMARY KEY (`pres_id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`q_id`);

--
-- Indexes for table `replayed`
--
ALTER TABLE `replayed`
  ADD PRIMARY KEY (`check_id`);

--
-- Indexes for table `symptoms`
--
ALTER TABLE `symptoms`
  ADD PRIMARY KEY (`sim_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`u_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `diagnosis`
--
ALTER TABLE `diagnosis`
  MODIFY `diag_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `disease`
--
ALTER TABLE `disease`
  MODIFY `disease_id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `disease_master`
--
ALTER TABLE `disease_master`
  MODIFY `dise_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `doctor_reg`
--
ALTER TABLE `doctor_reg`
  MODIFY `doc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `drugs`
--
ALTER TABLE `drugs`
  MODIFY `drug_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `news_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `prescription`
--
ALTER TABLE `prescription`
  MODIFY `pres_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `q_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `replayed`
--
ALTER TABLE `replayed`
  MODIFY `check_id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `symptoms`
--
ALTER TABLE `symptoms`
  MODIFY `sim_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `u_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
