-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 18, 2022 at 03:04 AM
-- Server version: 8.0.24
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `expert`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int NOT NULL,
  `parent_id` int NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `name`) VALUES
(1, 0, 'Phones'),
(2, 0, 'Laptop'),
(3, 1, 'Phones Samsung'),
(4, 1, 'Phones Apple'),
(5, 2, 'Laptop Samsung'),
(6, 2, 'Laptop Apple'),
(7, 2, 'Laptop Asus');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `date_created` datetime NOT NULL,
  `date_payment` datetime DEFAULT NULL,
  `date_modification` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `user_ip` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `date_created`, `date_payment`, `date_modification`, `status`, `comment`, `user_ip`) VALUES
(7, 15, '2022-09-08 18:55:40', NULL, '2022-09-08 15:55:40', 0, 'users id: 15<br>\r\n                Name: I love you baby<br>\r\n                Phone: 015121260091<br>\r\n                Address: Im Hainzenthal, 57', '127.0.0.1'),
(8, 15, '2022-09-08 19:11:26', NULL, '2022-09-08 16:11:26', 0, 'users id: 15<br>\r\n                Name: I love you baby<br>\r\n                Phone: 015121260091<br>\r\n                Address: Im Hainzenthal, 57', '127.0.0.1'),
(9, 15, '2022-09-08 19:13:38', NULL, '2022-09-08 16:13:38', 0, 'users id: 15<br>\r\n                Name: I love you baby<br>\r\n                Phone: 015121260091<br>\r\n                Address: Im Hainzenthal, 57', '127.0.0.1'),
(10, 15, '2022-09-08 19:14:29', NULL, '2022-09-08 16:14:29', 0, 'users id: 15<br>\r\n                Name: I love you baby<br>\r\n                Phone: 015121260091<br>\r\n                Address: Im Hainzenthal, 57', '127.0.0.1'),
(11, 15, '2022-09-08 19:15:06', NULL, '2022-09-08 16:15:06', 0, 'users id: 15<br>\r\n                Name: I love you baby<br>\r\n                Phone: 015121260091<br>\r\n                Address: Im Hainzenthal, 57', '127.0.0.1'),
(12, 17, '2022-09-09 19:09:06', NULL, '2022-09-22 15:48:53', 0, 'users id: 17<br>\r\n                Name: zxc<br>\r\n                Phone: 111<br>\r\n                Address: adres', '127.0.0.1'),
(13, 17, '2022-09-09 19:12:55', NULL, '2022-09-09 16:12:55', 0, 'users id: 17<br>\r\n                Name: zxc<br>\r\n                Phone: 111<br>\r\n                Address: adres', '127.0.0.1'),
(14, 17, '2022-09-09 19:37:45', NULL, '2022-09-09 16:37:45', 0, 'users id: 17<br>\r\n                Name: zxc<br>\r\n                Phone: 111<br>\r\n                Address: adres', '127.0.0.1'),
(15, 17, '2022-09-10 19:27:38', NULL, '2022-09-10 16:27:38', 0, 'users id: 17<br>\r\n                Name: zxc<br>\r\n                Phone: 111<br>\r\n                Address: adres', '127.0.0.1'),
(16, 17, '2022-09-10 19:45:00', NULL, '2022-09-10 16:45:00', 0, 'users id: 17<br>\r\n                Name: zxc<br>\r\n                Phone: 111<br>\r\n                Address: adres', '127.0.0.1'),
(17, 18, '2022-09-21 17:34:38', '2022-09-22 00:00:00', '2022-09-22 15:58:01', 0, 'users id: 18<br>\r\n                Name: asd<br>\r\n                Phone: 123<br>\r\n                Address: asd', '127.0.0.1'),
(18, 25, '2022-10-09 22:01:11', NULL, '2022-10-09 19:01:11', 0, 'users id: 25<br>\r\n                Name: <br>\r\n                Phone: <br>\r\n                Address: ', '127.0.0.1'),
(19, 21, '2022-10-11 19:19:21', NULL, '2022-10-11 16:19:21', 0, 'users id: 21<br>\r\n                Name: <br>\r\n                Phone: 015121260091<br>\r\n                Address: Im Hainzenthal, 57', '127.0.0.1'),
(20, 26, '2022-10-12 00:21:47', NULL, '2022-10-11 21:21:47', 0, 'users id: 26<br>\r\n                Name: <br>\r\n                Phone: <br>\r\n                Address: ', '127.0.0.1'),
(21, 27, '2022-10-12 19:13:31', NULL, '2022-10-13 20:09:42', 0, 'users id: 27<br>\r\n                Name: Maria<br>\r\n                Phone: 015121260091<br>\r\n                Address: Im Hainzenthal, 57', '127.0.0.1'),
(22, 33, '2022-11-17 23:15:20', NULL, '2022-11-17 20:15:20', 0, 'users id: 33<br>\r\n                Name: Мария Черкас<br>\r\n                Phone: 0504864121<br>\r\n                Address: Троицкая, 6\n', '127.0.0.1');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int NOT NULL,
  `category_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` float NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `desc_cut` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `description`, `price`, `image`, `status`, `desc_cut`) VALUES
(2, 3, 'Samsung Galaxy A12', 'Samsung Galaxy A12 64GB Black Dual<br><b>SIMWireless carrier:</b> Unlocked for All Carriers<br>\n<b>Operating system:</b> Android 9.0<br>\n<b>Cellular technology:</b> 5G<br>\n<b>Memory storage capacity:</b> 64 GB<br>\n<b>Connectivity technology:</b> Bluetooth<br>\n<b>Colour:</b> black<br>\n<b>Screen Size:</b> 1 Centimetres<br>\n<b>Wireless network technology:</b> GSM, UMTS\n                ', 235.49, '2.jpg', 1, 'Samsung Galaxy A12 64GB Black DualSIMWirele'),
(3, 3, 'Samsung Galaxy A22', '<b>Expand</b> your view with the Galaxy A22\'s 6.4-inch / 16.25 cm Infinity V display and experience exciting content<br>\r\n<b>With the 5,000 mAh</b> (typical) battery, you can be active on your smartphone for hours. <br><b>And with up to 15 W adaptive fast charging,</b> the Galaxy A22 quickly reaches full power<br>\r\n<b>The Galaxy A22</b> combines Octa-Core computing power with up to 4 GB of RAM to quickly and efficiently complete any task.<br> <b>Enjoy 64 GB</b> of internal memory or add up to 1 TB of storage with an optional microSD-card<br>', 220, '3.jpg', 1, 'Expand your view with the Galaxy A22\'s 6.4-'),
(4, 3, 'Samsung Galaxy A21', '<b>Display:</b> 6.5 inches / 16.63 cm. <br>\r\n<b>Main camera:</b> 48 + 8 + 2 + 2 MP. <br>  <b>Front camera:</b> 13 MP. <br>\r\n<b>Memory:</b> 32 GB, 3 GB RAM. <br>\r\n<b>Battery:</b> 5000 mAh.', 279.99, '4.jpg', 1, 'Display: 6.5 inches / 16.63 cm. Ma'),
(5, 3, 'Samsung S901B Galaxy S22', '-  <b>Type: </b> Smartphone<br>\r\n-  <b>2G network: </b> GSM 850 / 900 / 1800 / 1900<br>\r\n-  <b>3G Network: </b> HSDPA 850 / 900 / 1700(AWS) / 1900 / 2100 <br>\r\n-  <b>4G network: </b> LTE<br>\r\n-  <b>5G network: </b> 5G <br>', 702.24, '27.jpg', 1, '- Type: Smartphone - 2G network:'),
(28, 3, 'Samsung Galaxy A02S', '<b> Colour:</b>black<br>\r\n<b> Package dimensions (L x W x H):</b> 8.0 x 7.0 x 18.0 cm<br>\r\n<b> Package weight:</b> 450.0 grams<br>\r\n<b>Country of origin:</b> Spain<br>\r\n<b>32 GB</b>', 182.49, '28.jpg', 1, 'Colour:black Package dimensions ('),
(29, 3, 'Samsung Galaxy S21', 'Our smartphone is based on what you love, so you can experience and enjoy exactly that every day.<br>\r\n<b>The Portrait mode</b> focuses on the subject - simply add an effect to give the photo a different mood, and then upload it directly from your 5G phone to your social media.<br>\r\nAn immersive mobile phone screen that is so impressive that you can almost forget what is real; <b>the large dynamic AMOLED display of the Galaxy S21 FE 5G</b> with up to 120 Hz refresh rate provides vibrant colours and brightness even in bright sunlight.<br>\r\nThe powerful processor is <b>energy-efficient</b> and so smart that you can experience graphic-heavy gaming and multitasking on your Android phone as you like.<br>\r\n\r\n', 599, '29.jpg', 1, 'Our smartphone is based on what you love, so'),
(1, 3, 'Samsung Galaxy A13', 'VIBRANT DISPLAY More space to play with the 6.6 inch Infinity V display, FHD+ technology of the 4G smartphone makes your daily content sharp, defined and clear.<br>\r\n<b>Minimalist design:</b> it combines soft colours with a delicate appearance and feels comfortable in the hand.<br>\r\n<b>Quad camera system:</b> capture unforgettable moments with the 50MP main camera, expand the viewing angle with the ultra wide angle camera, optimize the focus with the deep camera and improve your shots with the macro camera.<br>\r\n<b>LONG BATTERY LIFE:</b> A battery that will not slow down your rhythms. The 5000 mAh battery of these phones will accompany you all day long and even longer.<br>\r\n<b>High performance:</b> with an Octa-Core processor and up to 4GB of RAM, the Galaxy A13 offers fast and efficient performance. Save as much as you want with the 128 GB internal memory, expandable with microSD card up to 1 TB².\r\n', 176.4, '1.jpg\r\n', 1, 'VIBRANT DISPLAY More space to play with the 6.6 in'),
(30, 3, 'Samsung Galaxy A53', '<b>Display:</b> 6.5 inch (16.40 cm) Super AMOLED\r\n120Hz refresh rate<br>\r\n<b>Memory:</b> 128GB internal memory, up to 1TB with microSD/6GB RAM<br>\r\n<b>Exynos 1280 Octa-Core Processor</b>\r\nQuad Main Camera (64MP + 12MP + 5MP + 5MP)', 350, '30.jpg', 1, 'Display: 6.5 inch (16.40 cm) Super AMOLED '),
(31, 4, 'Apple iPhone 11 64GB Rot', '6,1 inch Liquid Retina HD LCD Display (15,5 cm Diagonale)<br>\r\n<b>Wasser- und Staubschutz</b> (2 Meter bis zu 30 Minuten, IP68)<br>\r\n<b>12 Megapixel Zwei-Kamera-System</b> mit Ultraweitwinkel- und Weitwinkelobjektiv, Nachtmodus, Porträtmodus und 4K Video bis zu 60 fps<br>\r\n12 Megapixel TrueDepth Frontkamera mit Porträtmodus, 4K Video und Zeitlupe\r\nFace ID für sicheres Authentifizieren und Apple Pay<br>\r\nA13 Bionic Chip mit Neural Engine der 3. Generation', 447.99, '31.jpg', 1, '6,1 inch Liquid Retina HD LCD Display (15,5 cm Dia'),
(32, 4, 'Apple iPhone XS (Refurbished), 256GB', 'This <b>certified and refurbished product</b> has been tested and tested to ensure a new look and functionality with minimal to no signs of use. The product includes all relevant accessories and a warranty of at least one year.<br>\r\n<b>5.8 inch Super Retina Display</b> (OLED) with HDR (14.7 cm diagonal)<br>\r\nIP68 water and dust protection category (up to 30 minutes and up to 2 metres depth)<br>\r\n- Dual Optical Image Stabilization - 12 Megapixel TrueDepth Front Camera - Portrait mode, Portrait light, Depth Control and Smart HDR\r\nFace ID for secure authentication\r\nA12 Bionic with next-generation Neural Engine', 368.99, '32.jpg', 1, 'This certified and refurbished product has '),
(33, 4, 'Apple iPhone 11 Pro 64GB', 'Staub- und wasserdicht (4 Meter bis 30 Minuten, IP68)<br>\r\n<b>Dreifach-Kamerasystem mit 12 MP</b> (Ultra-Weitwinkel, Weitwinkel und Teleobjektiv)<br> mit Nachtmodus, Porträtmodus und 4 K Videoaufnahme bis zu 60 fps\r\n<b>TrueDepth Frontkamera</b> mit 12 MP mit Portrait-Modus, 4K-Videoaufnahme und Slow-Motion<br>\r\nFace ID für sichere Authentifizierung und Apple Pay<br>\r\nA13 Bionic Chip mit Neural Engine der 3. Generation', 529.98, '33.jpg', 1, 'Staub- und wasserdicht (4 Meter bis 30 Minuten, IP'),
(34, 4, 'Apple iPhone 11 (64 GB)', '6.1 inch liquid retina HD LCD display (15.5 cm diagonal). <br>\r\n<b>Water and dust protection</b> (2 meters for up to 30 minutes, IP68) <br>\r\n12MP dual camera system with ultra wide angle and wide angle lens, night mode, portrait mode and 4K video up to 60 fps. <br>\r\n12MP True Depth front camera with portrait mode, 4K video and slow motion.', 589, '34.jpg', 1, '6.1 inch liquid retina HD LCD display (15.5 cm dia');

-- --------------------------------------------------------

--
-- Table structure for table `purchase`
--

CREATE TABLE `purchase` (
  `id` int NOT NULL,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `price` float NOT NULL,
  `amount` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `purchase`
--

INSERT INTO `purchase` (`id`, `order_id`, `product_id`, `price`, `amount`) VALUES
(1, 7, 4, 6000, 1),
(2, 8, 1, 3000, 1),
(3, 9, 1, 3000, 1),
(4, 10, 11, 20000, 1),
(5, 11, 1, 3000, 1),
(6, 12, 7, 11000, 1),
(7, 13, 11, 20000, 1),
(8, 13, 12, 25000, 1),
(9, 14, 1, 3000, 1),
(10, 15, 7, 11000, 1),
(11, 16, 1, 3000, 1),
(12, 17, 1, 3023120, 1),
(13, 18, 3, 220, 1),
(14, 19, 31, 447.99, 2),
(15, 20, 30, 350, 1),
(16, 21, 34, 589, 1),
(17, 22, 30, 350, 1),
(18, 22, 34, 589, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `email` varchar(50) NOT NULL,
  `pwd` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `adress` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `pwd`, `name`, `phone`, `adress`) VALUES
(21, 'mariacherkas2006@gmail.com', '202cb962ac59075b964b07152d234b70', '', '015121260091', 'Im Hainzenthal, 57'),
(33, 'mar@gmail.com', 'ed2b1f468c5f915f3f1cf75d7068baae', 'Мария Черкас', '0504864121', 'Троицкая, 6\n'),
(32, 'mrkas2006@gmail.com', 'f5bb0c8de146c67b44babbf4e6584cc0', 'xcv', '015121260091', 'hkjhk'),
(31, 'mariac206@gmail.com', '1ed782608547b88ba2cc88fa1f4187d5', '', '', ''),
(30, 'maras2006@gmail.com', '59494bc8f506b9ca6000ea04add8bf93', 'maras2006@gmail.com', '015121260091', 'Im Hainzenthal, 57'),
(29, 'mariakas2006@gmail.com', '42f104e1091335e8b585f20ee00bb4c4', 'mariakas2006@gmail.com', '015121260091', 'Im Hainzenthal, 57'),
(28, 'mariac2006@gmail.com', '428fefdcd0aa17e6287e2db9c046ac88', '', '', ''),
(27, 'mariackas2006@gmail.com', 'f5bb0c8de146c67b44babbf4e6584cc0', 'Maria', '015121260091', 'Im Hainzenthal, 57'),
(26, 'mari@gmail.com', '25d55ad283aa400af464c76d713c07ad', '', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase`
--
ALTER TABLE `purchase`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `purchase`
--
ALTER TABLE `purchase`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
