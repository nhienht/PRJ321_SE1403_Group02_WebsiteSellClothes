-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 22, 2020 lúc 02:34 PM
-- Phiên bản máy phục vụ: 10.1.38-MariaDB
-- Phiên bản PHP: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `prj321`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

CREATE TABLE `admin` (
  `aID` int(11) NOT NULL,
  `aPassword` varchar(32) NOT NULL,
  `aUsername` varchar(30) NOT NULL,
  `aName` varchar(50) NOT NULL,
  `aPhonenumber` varchar(15) NOT NULL,
  `aAddress` varchar(255) NOT NULL,
  `aBirthday` date NOT NULL,
  `aEmail` varchar(50) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `admin`
--

INSERT INTO `admin` (`aID`, `aPassword`, `aUsername`, `aName`, `aPhonenumber`, `aAddress`, `aBirthday`, `aEmail`, `status`) VALUES
(1, '21232f297a57a5a743894a0e4a801fc3', 'admin', 'Admin', '0366684333', 'HG', '2000-08-14', 'nhien@gmail.com', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill`
--

CREATE TABLE `bill` (
  `bID` int(11) NOT NULL,
  `cID` int(11) NOT NULL,
  `bStatus` varchar(200) NOT NULL,
  `customerName` varchar(50) NOT NULL,
  `bDate` datetime NOT NULL,
  `address` varchar(150) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `note` text NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `billdetail`
--

CREATE TABLE `billdetail` (
  `bID` int(11) NOT NULL,
  `pId` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `brand`
--

CREATE TABLE `brand` (
  `brID` int(11) NOT NULL,
  `brName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comment`
--

CREATE TABLE `comment` (
  `cmtID` int(11) NOT NULL,
  `pID` int(11) NOT NULL,
  `cID` int(11) NOT NULL,
  `cmtMessage` text NOT NULL,
  `cmtDate` datetime NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customer`
--

CREATE TABLE `customer` (
  `cID` int(11) NOT NULL,
  `cPassword` varchar(32) NOT NULL,
  `cUsername` varchar(30) NOT NULL,
  `cName` varchar(50) NOT NULL,
  `phonenumber` varchar(15) NOT NULL,
  `address` varchar(150) NOT NULL,
  `birthday` date NOT NULL,
  `email` varchar(100) NOT NULL,
  `status` int(11) NOT NULL,
  `gender` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `history`
--

CREATE TABLE `history` (
  `hID` int(11) NOT NULL,
  `aID` int(11) DEFAULT NULL,
  `activity` text,
  `hDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `image`
--

CREATE TABLE `image` (
  `imgID` int(11) NOT NULL,
  `pID` int(11) NOT NULL,
  `imageName` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `pID` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `brID` int(11) NOT NULL,
  `tID` int(11) NOT NULL,
  `supID` int(11) NOT NULL,
  `pName` varchar(50) NOT NULL,
  `sellingPrice` double NOT NULL,
  `price` double NOT NULL,
  `describle` varchar(250) NOT NULL,
  `pDate` datetime NOT NULL,
  `size` int(11) NOT NULL,
  `material` varchar(100) NOT NULL,
  `quantity` int(11) NOT NULL,
  `discount` float NOT NULL,
  `gender` varchar(6) NOT NULL,
  `aID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `supplier`
--

CREATE TABLE `supplier` (
  `supID` int(11) NOT NULL,
  `supName` char(250) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `address` varchar(250) NOT NULL,
  `email` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `supplier`
--

INSERT INTO `supplier` (`supID`, `supName`, `phone`, `address`, `email`) VALUES
(1, 'DND', '0123456789', 'DT FPT CT', 'DBD@gmail.com\r\n');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `type`
--

CREATE TABLE `type` (
  `tID` int(11) NOT NULL,
  `tName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `type`
--

INSERT INTO `type` (`tID`, `tName`) VALUES
(1, 'T-shirt'),
(2, 'Short'),
(3, 'Skirt'),
(4, 'Dress'),
(5, 'Pants'),
(6, 'Jacket'),
(7, 'Jeans'),
(8, 'Sweater'),
(9, 'Other');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`aID`);

--
-- Chỉ mục cho bảng `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`bID`),
  ADD KEY `cID` (`cID`);

--
-- Chỉ mục cho bảng `billdetail`
--
ALTER TABLE `billdetail`
  ADD KEY `pId` (`pId`),
  ADD KEY `bID` (`bID`);

--
-- Chỉ mục cho bảng `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`brID`);

--
-- Chỉ mục cho bảng `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`cmtID`),
  ADD KEY `pID` (`pID`),
  ADD KEY `cID` (`cID`);

--
-- Chỉ mục cho bảng `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`cID`),
  ADD UNIQUE KEY `cUsername` (`cUsername`);

--
-- Chỉ mục cho bảng `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`hID`),
  ADD KEY `aID` (`aID`);

--
-- Chỉ mục cho bảng `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`imgID`),
  ADD KEY `pID` (`pID`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`pID`),
  ADD KEY `brID` (`brID`),
  ADD KEY `tID` (`tID`),
  ADD KEY `supID` (`supID`),
  ADD KEY `aID` (`aID`);

--
-- Chỉ mục cho bảng `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`supID`);

--
-- Chỉ mục cho bảng `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`tID`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin`
--
ALTER TABLE `admin`
  MODIFY `aID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `bill`
--
ALTER TABLE `bill`
  MODIFY `bID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `brand`
--
ALTER TABLE `brand`
  MODIFY `brID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `customer`
--
ALTER TABLE `customer`
  MODIFY `cID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `image`
--
ALTER TABLE `image`
  MODIFY `imgID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `pID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `supplier`
--
ALTER TABLE `supplier`
  MODIFY `supID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `type`
--
ALTER TABLE `type`
  MODIFY `tID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`cID`) REFERENCES `customer` (`cID`);

--
-- Các ràng buộc cho bảng `billdetail`
--
ALTER TABLE `billdetail`
  ADD CONSTRAINT `billdetail_ibfk_1` FOREIGN KEY (`pId`) REFERENCES `products` (`pID`),
  ADD CONSTRAINT `billdetail_ibfk_2` FOREIGN KEY (`bID`) REFERENCES `bill` (`bID`);

--
-- Các ràng buộc cho bảng `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`pID`) REFERENCES `products` (`pID`),
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`cID`) REFERENCES `customer` (`cID`);

--
-- Các ràng buộc cho bảng `history`
--
ALTER TABLE `history`
  ADD CONSTRAINT `history_ibfk_1` FOREIGN KEY (`aID`) REFERENCES `admin` (`aID`);

--
-- Các ràng buộc cho bảng `image`
--
ALTER TABLE `image`
  ADD CONSTRAINT `image_ibfk_1` FOREIGN KEY (`pID`) REFERENCES `products` (`pID`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`brID`) REFERENCES `brand` (`brID`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`tID`) REFERENCES `type` (`tID`),
  ADD CONSTRAINT `products_ibfk_3` FOREIGN KEY (`supID`) REFERENCES `supplier` (`supID`),
  ADD CONSTRAINT `products_ibfk_4` FOREIGN KEY (`aID`) REFERENCES `admin` (`aID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
