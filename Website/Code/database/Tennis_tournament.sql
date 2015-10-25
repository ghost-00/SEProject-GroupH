-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Host: localhost:8889
-- Generation Time: Oct 14, 2015 at 02:50 PM
-- Server version: 5.5.42
-- PHP Version: 5.6.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `SEProject`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` int(9) NOT NULL,
  `nam` varchar(250) DEFAULT NULL,
  `passwords` varchar(250) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `nam`, `passwords`) VALUES
(1, 'steve', 'jobs');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(9) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;--
-- Database: `Tennis_Tournament`
--

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `UserId` int(11) NOT NULL,
  `UserFirstName` varchar(45) NOT NULL,
  `UserLastName` varchar(45) NOT NULL,
  `UsersBirthDate` date DEFAULT NULL,
  `UserAddress` varchar(45) DEFAULT NULL,
  `UserAddressN` int(11) DEFAULT NULL,
  `UserAddressB` int(11) DEFAULT NULL,
  `UserAddressC` int(11) DEFAULT NULL,
  `UserAddressL` varchar(45) DEFAULT NULL,
  `UserPhone` varchar(45) DEFAULT NULL,
  `UserMail` varchar(45) NOT NULL,
  `Username` varchar(45) NOT NULL,
  `Userpassword` longtext NOT NULL,
  `UserCreationDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`UserId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `UserId` int(11) NOT NULL AUTO_INCREMENT;