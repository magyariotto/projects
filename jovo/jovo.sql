-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2018. Már 18. 15:00
-- Kiszolgáló verziója: 10.1.28-MariaDB
-- PHP verzió: 7.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `jovo`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `fizeteselozmenyek`
--

CREATE TABLE `fizeteselozmenyek` (
  `id` int(11) NOT NULL,
  `datum` varchar(256) COLLATE utf8_lithuanian_ci NOT NULL,
  `munkanap` varchar(20) COLLATE utf8_lithuanian_ci NOT NULL DEFAULT '0',
  `szabadnap` int(2) NOT NULL DEFAULT '0',
  `betegszabadnap` int(2) NOT NULL DEFAULT '0',
  `tuloranap` int(3) NOT NULL DEFAULT '0',
  `ora100` varchar(20) COLLATE utf8_lithuanian_ci NOT NULL,
  `ora200` varchar(20) COLLATE utf8_lithuanian_ci NOT NULL DEFAULT '0',
  `egyebbplusz` varchar(20) COLLATE utf8_lithuanian_ci NOT NULL,
  `egyebbminusz` varchar(20) COLLATE utf8_lithuanian_ci NOT NULL DEFAULT '0',
  `nettonap` varchar(15) COLLATE utf8_lithuanian_ci NOT NULL,
  `nettohonap` varchar(15) COLLATE utf8_lithuanian_ci NOT NULL,
  `tiketekszama` varchar(2) COLLATE utf8_lithuanian_ci NOT NULL,
  `tiketekerteke` varchar(15) COLLATE utf8_lithuanian_ci NOT NULL,
  `bevetel` varchar(20) COLLATE utf8_lithuanian_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- A tábla adatainak kiíratása `fizeteselozmenyek`
--

INSERT INTO `fizeteselozmenyek` (`id`, `datum`, `munkanap`, `szabadnap`, `betegszabadnap`, `tuloranap`, `ora100`, `ora200`, `egyebbplusz`, `egyebbminusz`, `nettonap`, `nettohonap`, `tiketekszama`, `tiketekerteke`, `bevetel`) VALUES
(1, '2016.09.21-2016.09.30', '8', 0, 0, 0, '59', '0', '0%', '0', '59.57', '399', '8', '77.56', '476.56'),
(2, '2016.10.01-2016.10.31', '20', 1, 0, 0, '160', '0', '5%', '0', '64.25', '1158', '20', '191.40', '1349.4'),
(3, '2016.11.01-2016.11.30', '15', 0, 7, 1, '120', '8', '10%', '0', '53.21', '1090', '14', '133.98', '1223.98'),
(4, '2016.12.01-2016.12.31', '19', 2, 0, 1, '144', '8', '15%+prima', '0', '69.64', '1360', '18', '172.08', '1532.08'),
(5, '2017.01.01-2017.01.31', '20', 0, 0, 3, '160', '32', '20%', '0', '83.52', '1661', '20', '260', '1921'),
(6, '2016.02.01-2016.02.28', '20', 0, 0, 1, '160', '12', '26%', '0', '81.57', '1453', '20', '260', '1713'),
(7, '2017.03.01-2017.03.31', '21', 2, 0, 2, '168', '24', '18%', '0', '74.08', '1579', '21', '273', '1852'),
(8, '2017.04.01-2017.04.30', '17', 2, 0, 2, '136', '20', '22%', '0', '85.09', '1566', '17', '221', '1787'),
(9, '2017.05.01-2017.05.31', '20', 2, 0, 0, '160', '0', '72%', '0', '93.59', '1799', '20', '260', '2059'),
(10, '2017.06.01-2017.06.30', '16', 0, 4, 0, '128', '0', '22%', '0', '66.45', '1121', '16', '208', '1329'),
(11, '2017.07.01-2017.07.31', '20', 1, 0, 0, '160', '24', '19%', '0', '88.66', '1602', '20', '260', '1862'),
(12, '2017.08.01-2017.08.31', '20', 2, 0, 0, '160', '0', '22%+75lej', '0', '73.45', '1356', '20', '260', '1616'),
(13, '2017.09.01-2017.09.30', '21', 0, 0, 0, '168', '0', '22%+150lej', '0', '81.52', '1439', '21', '273', '1712'),
(14, '2017.10.01-2017.10.31', '20', 2, 0, 2, '160', '16', '64%+75lej', '0', '98.62', '2107', '20', '260', '2367'),
(15, '2017.11.01-2017.11.30', '16', 5, 0, 1, '128', '16', '22%+75lej', '0', '80.31', '1559', '16', '208', '1767'),
(16, '2017.12.01-2017.12.31', '13', 1, 4, 0, '104', '0', '0', '0', '69.33', '1079', '13', '169', '1248'),
(17, '2018.01.01-2018.01.31', '8', 0, 0, 0, '64', '0', '22%', '0', '', '', '8', '104', ''),
(18, '2018.02.01-2018.02.28', '0', 0, 0, 0, '0', '0', '', '0', '', '', '0', '0', '');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `fizeteselozmenyek`
--
ALTER TABLE `fizeteselozmenyek`
  ADD PRIMARY KEY (`id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `fizeteselozmenyek`
--
ALTER TABLE `fizeteselozmenyek`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
