-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 24, 2020 lúc 04:33 PM
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

--
-- Đang đổ dữ liệu cho bảng `bill`
--

INSERT INTO `bill` (`bID`, `cID`, `bStatus`, `customerName`, `bDate`, `address`, `phone`, `note`, `total`) VALUES
(1, 1, 'Delivered', 'Nhien', '2020-07-24 00:00:00', 'Hau Giang', '0776598062', 'hi hi', 450),
(2, 1, 'New', 'Nhien', '2020-07-23 00:00:00', 'Hau Giang', '0776598062', 'hi', 450),
(3, 4, 'New', 'dat', '2020-07-24 00:00:00', 'Hau Giang', '0776598062', 'hi', 8550),
(4, 4, 'New', 'dat', '2020-07-24 00:00:00', 'Hau Giang', '08994633913', 'hi', 270),
(5, 4, 'New', 'Nhien', '2020-07-24 00:00:00', 'Can tho', '0901110001', 'hi', 450),
(6, 4, 'New', 'Nhien', '2020-07-24 00:00:00', 'Can tho', '0901110001', 'hi', 450);

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

--
-- Đang đổ dữ liệu cho bảng `billdetail`
--

INSERT INTO `billdetail` (`bID`, `pId`, `quantity`, `price`) VALUES
(1, 2, 1, 500),
(2, 4, 1, 500),
(3, 4, 19, 500),
(4, 3, 1, 270),
(5, 2, 1, 500),
(6, 2, 1, 500);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `brand`
--

CREATE TABLE `brand` (
  `brID` int(11) NOT NULL,
  `brName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `brand`
--

INSERT INTO `brand` (`brID`, `brName`) VALUES
(1, 'Gucci'),
(2, 'Channel'),
(3, 'LOUIS VUITTON'),
(4, 'VERSACE');

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

--
-- Đang đổ dữ liệu cho bảng `customer`
--

INSERT INTO `customer` (`cID`, `cPassword`, `cUsername`, `cName`, `phonenumber`, `address`, `birthday`, `email`, `status`, `gender`) VALUES
(1, '14e1b600b1fd579f47433b88e8d85291', 'nhien', 'Huynh Thi Nhien', '0366684333', 'Can tho0', '2020-07-08', 'huynhthinhien23@gmail.com', 1, 'Male'),
(2, 'e10adc3949ba59abbe56e057f20f883e', 'n', 'Nhien', '0366684333', 'Can tho', '2020-07-01', 'huynhthinhien23@gmail.com', 1, 'Female'),
(3, '2e678024cabebdfe17a5aeef0163fe6d', 'dat', 'Huynh Ba Dat', '0776598062', 'Tan Long , Hoa Thanh', '1999-07-08', 'dathbce@fpt.edu.vn', 1, '1'),
(4, '9fb349718f6407a278db96fdb0739fa5', 'dathuynh', 'Huynh Ba Dat', '01213738409', 'Hoa thanh', '2020-07-15', 'dathuynh@fpt.edu.vn', 1, '0');

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

--
-- Đang đổ dữ liệu cho bảng `image`
--

INSERT INTO `image` (`imgID`, `pID`, `imageName`) VALUES
(1, 1, 'data\\g1.jpg'),
(2, 1, 'data\\g2.jpg'),
(3, 1, 'data\\g3.jpg'),
(4, 1, 'data\\g4.jpg'),
(5, 2, 'data\\g5.jpg'),
(6, 2, 'data\\g6.jpg'),
(7, 2, 'data\\g7.jpg'),
(8, 2, 'data\\g8.jpg'),
(9, 3, 'data\\g9.jpg'),
(10, 3, 'data\\g10.jpg'),
(11, 3, 'data\\g11.jpg'),
(12, 4, 'data\\g12.jpg'),
(13, 4, 'data\\g13.jpg'),
(14, 4, 'data\\g14.jpg'),
(15, 5, 'data\\g15.jpg'),
(16, 5, 'data\\g16.jpg'),
(17, 5, 'data\\g17.jpg'),
(18, 5, 'data\\g18.jpg'),
(19, 6, 'data\\g19.jpg'),
(20, 6, 'data\\g20.jpg'),
(21, 6, 'data\\g22.png'),
(22, 6, 'data\\g23.png'),
(23, 7, 'data\\g24.jpg'),
(24, 7, 'data\\g25.jpg'),
(25, 7, 'data\\g26.jpg'),
(26, 7, 'data\\g27.jpg'),
(27, 8, 'data\\g28.jpg'),
(28, 8, 'data\\g29.jpg'),
(29, 8, 'data\\g30.jpg'),
(30, 8, 'data\\g31.jpg'),
(31, 9, 'data\\g28.jpg'),
(32, 9, 'data\\g29.jpg'),
(33, 9, 'data\\g30.jpg'),
(34, 9, 'data\\g31.jpg'),
(35, 10, 'data\\i1.jpg'),
(36, 10, 'data\\i2.jpg'),
(37, 10, 'data\\i3.jpg'),
(38, 10, 'data\\i4.jpg'),
(39, 11, 'data\\i5.jpg'),
(40, 11, 'data\\i6.jpg'),
(41, 11, 'data\\i7.jpg'),
(42, 11, 'data\\i8.jpg'),
(43, 12, 'data\\i10.jpg'),
(44, 12, 'data\\i11.jpg'),
(45, 12, 'data\\i12.jpg'),
(46, 12, 'data\\i13.jpg'),
(47, 13, 'data\\j2.jpg'),
(48, 13, 'data\\q1.jpg'),
(49, 13, 'data\\q3.jpg'),
(50, 13, 'data\\q4.jpg'),
(51, 14, 'data\\q5.jpg'),
(52, 14, 'data\\q6.jpg'),
(53, 14, 'data\\q7.jpg'),
(54, 14, 'data\\q8.jpg'),
(55, 15, 'data\\a1.jpg'),
(56, 15, 'data\\a2.jpg'),
(57, 15, 'data\\a4.jpg'),
(58, 15, 'data\\a33.jpg'),
(59, 16, 'data\\aa1.jpg'),
(60, 16, 'data\\aa2.jpg'),
(61, 16, 'data\\aa3.jpg'),
(62, 16, 'data\\aa4.jpg'),
(63, 17, 'data\\b1.jpg'),
(64, 17, 'data\\b2..jpg'),
(65, 17, 'data\\b3.jpg'),
(66, 17, 'data\\b4.jpg'),
(67, 18, 'data\\1.jpg'),
(68, 18, 'data\\2.jpg'),
(69, 18, 'data\\3.jpg'),
(70, 18, 'data\\4.jpg'),
(71, 18, 'data\\5.jpg'),
(72, 18, 'data\\6.jpg'),
(73, 18, 'data\\7.jpg'),
(74, 18, 'data\\8.jpg'),
(75, 19, 'data\\11.jpg'),
(76, 19, 'data\\12.jpg'),
(77, 19, 'data\\13.jpg'),
(78, 19, 'data\\14.jpg'),
(79, 20, 'data\\1e.jpg'),
(80, 20, 'data\\1q.jpg'),
(81, 20, 'data\\1r.jpg'),
(82, 20, 'data\\1w.jpg'),
(83, 21, 'data\\v.jpg'),
(84, 21, 'data\\v1.jpg'),
(85, 21, 'data\\v2.jpg'),
(86, 21, 'data\\v3.jpg'),
(87, 22, 'data\\llll.jpg'),
(88, 22, 'data\\lll.jpg'),
(89, 22, 'data\\ll.jpg'),
(90, 22, 'data\\l.jpg'),
(91, 23, 'data\\aaaa.jpg'),
(92, 23, 'data\\aaa.jpg'),
(93, 23, 'data\\aa.jpg'),
(94, 24, 'data\\bbbb.jpg'),
(95, 24, 'data\\bbb.jpg'),
(96, 24, 'data\\bb.jpg'),
(97, 24, 'data\\b.jpg'),
(98, 24, 'data\\b4.jpg'),
(99, 25, 'data\\ccc.jpg'),
(100, 25, 'data\\cc.jpg'),
(101, 25, 'data\\c.jpg');

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
  `pName` varchar(250) NOT NULL,
  `sellingPrice` double NOT NULL,
  `price` double NOT NULL,
  `describle` varchar(1000) NOT NULL,
  `pDate` datetime NOT NULL,
  `size` int(11) NOT NULL,
  `material` varchar(100) NOT NULL,
  `quantity` int(11) NOT NULL,
  `discount` float NOT NULL,
  `gender` varchar(6) NOT NULL,
  `aID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`pID`, `status`, `brID`, `tID`, `supID`, `pName`, `sellingPrice`, `price`, `describle`, `pDate`, `size`, `material`, `quantity`, `discount`, `gender`, `aID`) VALUES
(1, 1, 1, 1, 1, 'Porcelain Floral-print silk dress', 1700, 1825, 'This honeysuckle-pink, black, and beige silk crepe de Chine dress is a stunning example of Gucci\'s bold aesthetic for Resort 2017. ', '2020-07-21 00:00:00', 1, 'Cotton', 12, 5, 'Male', 1),
(2, 1, 1, 4, 1, 'After-Bloom Delight Golden Yellow Floral Print Midi Dress', 480, 500, 'Lulus Exclusive! The Lulus After-Bloom Delight Golden Yellow Floral Print Midi Dress was made for mid-day strolls in the park! Woven fabric, in a bright and cheery golden yellow and white floral print, shapes a lightly pleated, surplice bodice framed by fluttering short sleeves. ', '2020-07-23 00:00:00', 0, 'Polyester', 17, 10, 'Male', 1),
(3, 1, 1, 3, 1, 'Pleated Skirt', 250, 270, 'Share your love for vintage with your little one. Inspired by eighties retro tennis gear, this ivory stretch cotton pleated skirt from Gucci Kids is trimmed with a green and red Web detail', '2020-07-23 00:00:00', 0, 'Polyester 100%, Cotton 96%, Spandex/Elastane 4%', 29, 0, 'Female', 1),
(4, 1, 1, 3, 1, 'Skirt White White', 480, 500, 'Exquisitely crafted from softly gathered layers of white tulle draped over a soft cotton lining, this stunning girl?s skirt has a glittery gold and blue elasticated waistband and a colourful ?GG? logo pattern embroidered on the tulle.', '2020-07-23 00:00:00', 2, 'polyamide', -10, 10, 'Male', 1),
(5, 0, 1, 1, 1, 'Blade logo-print cotton T-shirt', 260, 283, 'Gucci?s black T-shirt is printed with the Gucci Blade print in red and white ? the latest edition of the house\'s logo for SS19. ', '2020-07-23 00:00:00', 2, 'Cotton', 40, 12, 'Unisex', 1),
(6, 1, 1, 1, 1, 'Logo-web Cotton-blend Piqué Polo Shirt In Black', 490, 520, 'Gucci - Cut from lightweight stretch cotton-blend piqué in a mustard-yellow hue, this Gucci polo shirt has contrasting sleeve stripes inspired by vintage tracksuits that reflect.', '2020-07-23 00:00:00', 4, 'Cotton', 20, 10, 'Male', 1),
(7, 1, 4, 7, 1, 'High-rise Straight-leg Jeans In A8119 Blue', 270, 300, 'Gianni Versace S.p.A. usually referred to as Versace, is an Italian fashion company and trade name founded by Gianni Versace in 1978.', '2020-07-23 00:00:00', 1, 'Jeans', 10, 0, 'Male', 1),
(8, 1, 1, 1, 1, 'GUCCI ? T-shirt Polo Mens Shirts White', 110, 130, 'Kuta Linen Oversized T-shirt Womens Sweaters & Knitwear Black', '2020-07-23 00:00:00', 1, 'Cotton', 10, 0, 'Male', 1),
(9, 1, 1, 1, 1, 'GUCCI ? T-shirt Polo Mens Shirts White', 110, 125, 'Kuta Linen Oversized T-shirt Womens Sweaters & Knitwear Black', '2020-07-23 00:00:00', 0, 'Cotton', 15, 0, 'Male', 1),
(10, 1, 2, 4, 1, 'Black Cowl Neckline Batwing Sleeves Loose Chiffon Top', 50, 25, 'Give your street style a hint of elegance as you choose this black cowl neckline batwing sleeves loose chiffon top. This top in solid black color will surely turn you into a classy fashionista because it comes with a stylish cowl neckline and batwing sleeves.', '2020-07-22 00:00:00', 0, 'Cotton 50%', 5, 2, 'Female', 1),
(11, 1, 2, 4, 1, 'Apricot Cowl Neckline Batwing Sleeves Loose Chiffon Top', 55, 25, 'Choose to be fabulous from day to night as you wear this super pretty apricot cowl neckline batwing sleeves loose chiffon top. This top in nude color will absolutely bring out your stylishness because it comes with a pretty cowl neckline and batwing sleeves.', '2020-07-09 00:00:00', 1, 'Cotton', 9999, 2, 'Female', 1),
(12, 1, 2, 1, 1, 'Lookbook Store Blue Crochet Lace Short Sleeves V-Neckline Top', 70, 30, 'Level up your basic style as you opt for this blue crochet lace short sleeves V-neckline top. This lovely piece in blue color features a sexy wide V-neckline giving this top just enough for you to show some sexy skin.', '2020-07-11 00:00:00', 3, 'Cotton 75%', 10, 0, 'Female', 1),
(13, 1, 3, 9, 1, 'Light Blue Frayed Raw Hem Distressed Denim Shorts', 105, 50, 'Lighten up your mood this summer as you choose to wear this light blue frayed raw hem distressed denim shorts. This chic ripped shorts in classic light denim blue color features a gorgeous mid-waist design that can easily flatter your waist without too much effort on your part', '2020-07-03 00:00:00', 1, 'Cotton 50%', 5, 0, 'Female', 1),
(14, 1, 3, 2, 1, 'Deep Blue Frayed Raw Hem Distressed Denim Shorts', 55, 23, 'Never miss out the trend as you own this deep blue frayed raw hem distressed denim shorts.', '2020-07-02 00:00:00', 2, 'Cotton 50%', 10, 0, 'Female', 1),
(15, 1, 2, 9, 1, 'Black Back-Slit Notched Lapel Blazer', 105, 100, 'It\'s just so easy to turn that otherwise drab outfit into a fabulous corporate wear when you have this classic black back-slit notched lapel blazer in your wardrobe.', '2020-07-10 00:00:00', 0, 'Cotton 75%', 10, 1, 'Unisex', 1),
(16, 1, 4, 9, 1, 'Black V-Neckline Button-Up Tie-Front Top', 55, 50, 'Sticking to your classy style is surely possible even in your casual wear when you have this black V-neckline button-up tie-front top.', '2020-07-09 00:00:00', 4, 'Cotton 50%', 10, 0, 'Female', 1),
(17, 1, 4, 1, 1, 'White Long Cuffed Sleeves Lapel Button-Up Blouse', 33, 27, 'Being chic is definitely easy as you choose to wear a casual blouse like this white long cuffed sleeves lapel button-up blouse. ', '2020-07-16 00:00:00', 3, 'Cotton 75%', 10, 2, 'Female', 1),
(18, 1, 3, 1, 1, 'Men\'s Liberty® cornflower motif fabric slim shirt', 155, 143, 'Short', '2020-07-18 00:00:00', 3, 'Cotton 75%', 10, 0.1, 'Male', 1),
(19, 1, 2, 8, 1, 'Men\'s eucalyptus green mouliné knit sweater', 175, 155, 'A gorgeous marl effect is the secret of this mouliné knit. You?ve got lots of options for what to wear it with.', '2020-07-11 00:00:00', 3, 'Cotton', 10, 5, 'Male', 1),
(20, 1, 2, 1, 1, 'Men\'s black Rock Paris T-shirt', 105, 66, 'Paris by Night and clubbing vibe for this men?s black T-shirt. Eiffel Tower, scene and lights: it?s got everything!', '2020-07-16 00:00:00', 3, 'Cotton', 10, 5, 'Male', 1),
(21, 1, 2, 5, 1, 'Men\'s slim-fit navy jeans', 135, 125, 'Navy blue jeans with an ultra-chic look. In a slim-fit cut, worn long or with the bottoms turned up over white trainers. The Hyperflex Denim treatment makes them comfortable and stylish.', '2020-06-30 00:00:00', 0, 'Cotton 75%', 19, 1, 'Male', 1),
(22, 1, 1, 6, 1, 'MEN WASHED JERSEY OVERSHIRT', 49, 39, 'Black - Green Gray Long T-Shirt ', '2020-07-25 00:00:00', 3, 'Cotton', 17, 0, 'Male', 1),
(23, 1, 3, 7, 1, 'MEN COTTON CHINO SHORTS', 105, 55, 'Short for man , have a lot of color  , show your style', '2020-07-12 00:00:00', 0, 'Gucci Cotton', 15, 0.1, 'Male', 1),
(24, 1, 4, 1, 1, 'MEN ULTRA STRETCH LONG SLEEVED SWEAT SET', 105, 100, 'MEN ULTRA STRETCH LONG SLEEVED SWEAT SET SHOW YOUR STYLE', '2020-07-22 00:00:00', 2, 'Cotton 75%', 75, 0, 'Male', 1),
(25, 1, 2, 7, 1, 'MEN JOGGERS', 105, 79, 'FULL COLOR MEN JOGGERS ', '2020-07-12 00:00:00', 0, 'JEAN', 65, 1, 'Male', 1);

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
  MODIFY `bID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `brand`
--
ALTER TABLE `brand`
  MODIFY `brID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `comment`
--
ALTER TABLE `comment`
  MODIFY `cmtID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `customer`
--
ALTER TABLE `customer`
  MODIFY `cID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `image`
--
ALTER TABLE `image`
  MODIFY `imgID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `pID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

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
