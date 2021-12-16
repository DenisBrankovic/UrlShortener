-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 16, 2021 at 12:32 PM
-- Server version: 8.0.21
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shortener`
--

-- --------------------------------------------------------

--
-- Table structure for table `url`
--

DROP TABLE IF EXISTS `url`;
CREATE TABLE IF NOT EXISTS `url` (
  `id` int NOT NULL AUTO_INCREMENT,
  `longUrl` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shortUrl` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `url`
--

INSERT INTO `url` (`id`, `longUrl`, `shortUrl`) VALUES
(1, 'https://www.livescore.com/en/football/champions-league/group-f/', 'www.livescore'),
(2, 'https://www.klix.ba/biznis/privreda/gorivo-u-bih-jeftinije-u-prosjeku-za-0-10-km-trend-pada-cijena-ce-se-nastaviti/211209066', 'www.klix.ba'),
(3, 'https://www.klix.ba/auto/volkswagen-objavio-teasere-novog-amaroka/211208027', 'www.short/auto.something'),
(7, 'long address', 'short address'),
(8, 'new attempt', '85f5f70f'),
(9, '', 'd276b21b'),
(10, 'https://www.nytimes.com/2021/12/09/us/politics/debt-ceiling-congress.html', '123009d4'),
(11, 'https://www.nytimes.com/2021/12/09/us/politics/debt-ceiling-congress.html', '12a1f03b'),
(12, 'https://www.nytimes.com/2021/12/09/us/politics/debt-ceiling-congress.html', '8eda038b'),
(13, 'https://www.nytimes.com/2021/12/09/us/politics/debt-ceiling-congress.html', '642c6dca'),
(17, 'https://www.google.com/search?q=how+to+check+if+an+element+exists+in+an+array+php&amp;client=firefox-b-d&amp;ei=J0WzYbCbIpKFlQf-np_QDA&amp;ved=0ahUKEwjwytuPm9n0AhWSQuUKHX7PB8oQ4dUDCA0&amp;uact=5&amp;oq=how+to+check+if+an+element+exists+in+an+array+php&amp;gs_lcp=Cgdnd3Mtd2l6EAMyBAgAEB46BwgAEEcQsAM6BQgAEIAEOgYIABAWEB5KBAhBGABKBAhGGABQ4wlYwBBg1xNoAXACeACAAX2IAdADkgEDMC40mAEAoAEByAEIwAEB&amp;sclient=gws-wiz', '683a86eb'),
(18, 'https://www.google.com/search?q=how+to+check+if+an+element+exists+in+an+array+php&amp;client=firefox-b-d&amp;ei=J0WzYbCbIpKFlQf-np_QDA&amp;ved=0ahUKEwjwytuPm9n0AhWSQuUKHX7PB8oQ4dUDCA0&amp;uact=5&amp;oq=how+to+check+if+an+element+exists+in+an+array+php&amp;gs_lcp=Cgdnd3Mtd2l6EAMyBAgAEB46BwgAEEcYIABAWEB5KBAhBGABKBAhGGABQ4wlYwBBg1xNoAXACeACAAX2IAdADkgEDMC40mAEAoAEByAEIwAEB&amp;sclient=gws-wiz', '056ddb08'),
(19, 'jhgjg', '5d611f1f'),
(20, 'https://www.livescore.com/en/', '93da1d3b'),
(21, 'https://www.it-akademija.com/', '632f6023'),
(22, 'https://www.pokernews.com/strategy/five-hands-from-episode-8-triton-million-charity-event-40336.htm', '19290f1f'),
(23, 'https://www.pokernews.com/news/2021/12/2021-ept-online-day-2-40398.htm', 'caa7ffa5'),
(24, 'https://www.pokernews.com/us-poker-rooms/', '504c2977'),
(25, 'https://www.pokernews.com/pokerstars/', '296d6a0d'),
(26, 'https://docs.redis.com/latest/rs/references/client_references/client_nodejs/', 'e417fa70'),
(27, 'https://www.it-akademija.com/birajte-sest-odseka-it-strucnost-zvanicna-zvanja-eksperata#', '9b8fa7fe'),
(28, 'https://reqbin.com/req/nfilsyk5/get-request-example', 'b800dc40'),
(29, 'https://www.youtube.com/watch?v=Cie5v59mrTg&amp;t=781s', 'd20c97ea'),
(30, 'http://www.tutorialsavvy.com/2016/01/working-redis-node-js.html/', '259341c1'),
(32, 'https://www.youtube.com/watch?v=Z57566JBaZQ', 'fb4fd7b7'),
(34, 'https://tinyurl.com/app/sadsdasda', 'deb4bb26'),
(36, 'https://tinyurl.com/app/sakkdsdajjjjjsda', 'bdf337cd'),
(38, 'http://localhost/phpmyadmin/sql.php?db=shortener&amp;table=url&amp;pos=0', '2c373b4c'),
(39, 'https://www.php.net/manual/en/function.hex2bin.php', 'http://localhost:8080/5f772653'),
(40, 'https://www.sciencenews.org/article/favorite-top-science-books-2021', 'http://localhost:8080/a782b33d');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
