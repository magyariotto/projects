-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2018. Már 18. 14:52
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
-- Adatbázis: `u451973341_jatek`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `admin`
--

CREATE TABLE `admin` (
  `id` int(5) NOT NULL,
  `username` varchar(50) COLLATE utf8_bin NOT NULL,
  `password` varchar(40) COLLATE utf8_bin NOT NULL,
  `email` varchar(40) COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- A tábla adatainak kiíratása `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `email`) VALUES
(1, 'otto', '123', 'magyariotto96@gmail.com');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `banyak`
--

CREATE TABLE `banyak` (
  `id` int(11) NOT NULL,
  `sorszam` int(255) NOT NULL DEFAULT '0',
  `besorolas` int(1) NOT NULL COMMENT '1=Iridium;2=Radon;3=Uran;4=Tantal;5=Palladium',
  `nev` varchar(256) NOT NULL,
  `szintkorlat` int(32) NOT NULL DEFAULT '0',
  `epitesi_koltseg` varchar(4096) NOT NULL DEFAULT 'a:2:{i:0;i:0;i:1;i:0}' COMMENT 'i:0 = kredit ; i:1 = terra;',
  `alaptermeles` int(32) NOT NULL DEFAULT '0' COMMENT '(X*szint^2)/ora'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- A tábla adatainak kiíratása `banyak`
--

INSERT INTO `banyak` (`id`, `sorszam`, `besorolas`, `nev`, `szintkorlat`, `epitesi_koltseg`, `alaptermeles`) VALUES
(1, 1, 1, 'Iridium banya', 0, 'a:2:{i:0;i:0;i:1;i:0}', 50),
(2, 2, 1, 'Iridium banya', 5, 'a:2:{i:0;i:0;i:1;i:0}', 100),
(3, 3, 1, 'Iridium banya', 10, 'a:2:{i:0;i:0;i:1;i:0}', 150),
(4, 4, 1, 'Iridium banya', 20, 'a:2:{i:0;i:0;i:1;i:0}', 200),
(5, 5, 1, 'Iridium banya', 40, 'a:2:{i:0;i:0;i:1;i:0}', 250),
(6, 6, 1, 'Iridium banya', 60, 'a:2:{i:0;i:0;i:1;i:0}', 300),
(7, 7, 1, 'Iridium banya', 80, 'a:2:{i:0;i:0;i:1;i:0}', 350),
(8, 8, 1, 'Iridium banya', 100, 'a:2:{i:0;i:0;i:1;i:0}', 400),
(9, 9, 1, 'Iridium banya', 125, 'a:2:{i:0;i:0;i:1;i:0}', 450),
(10, 1, 2, 'Radon banya', 0, 'a:2:{i:0;i:0;i:1;i:0}', 50);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `epuleteim`
--

CREATE TABLE `epuleteim` (
  `userid` int(16) NOT NULL,
  `epulet_id:1` int(16) NOT NULL DEFAULT '0',
  `epulet_id:2` int(16) NOT NULL DEFAULT '0',
  `epulet_id:3` int(16) NOT NULL DEFAULT '0',
  `epulet_id:4` int(16) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- A tábla adatainak kiíratása `epuleteim`
--

INSERT INTO `epuleteim` (`userid`, `epulet_id:1`, `epulet_id:2`, `epulet_id:3`, `epulet_id:4`) VALUES
(1, 0, 0, 0, 0),
(7, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `epuletek`
--

CREATE TABLE `epuletek` (
  `azonosito` int(3) NOT NULL,
  `statusz` tinyint(1) NOT NULL DEFAULT '0',
  `nev` varchar(256) NOT NULL DEFAULT 'epulet_',
  `szintkorlat` int(16) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- A tábla adatainak kiíratása `epuletek`
--

INSERT INTO `epuletek` (`azonosito`, `statusz`, `nev`, `szintkorlat`) VALUES
(1, 1, 'Civilhajo Gyar', 10),
(2, 1, 'Csatahajo Gyar', 10),
(3, 1, 'Robotgyar', 40),
(4, 1, 'Hangar', 0);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `felszerelesem`
--

CREATE TABLE `felszerelesem` (
  `userid` int(20) NOT NULL,
  `bazis` int(20) NOT NULL DEFAULT '1',
  `b1` int(20) NOT NULL DEFAULT '11',
  `b2` int(20) NOT NULL,
  `b3` int(20) NOT NULL,
  `b4` int(20) NOT NULL,
  `b5` int(20) NOT NULL,
  `p1` int(20) NOT NULL DEFAULT '21',
  `p2` int(20) NOT NULL,
  `p3` int(20) NOT NULL,
  `p4` int(20) NOT NULL,
  `p5` int(20) NOT NULL,
  `l1` int(20) NOT NULL DEFAULT '31',
  `l2` int(20) NOT NULL,
  `l3` int(20) NOT NULL,
  `l4` int(20) NOT NULL,
  `l5` int(20) NOT NULL,
  `m1` int(20) NOT NULL DEFAULT '41',
  `m2` int(20) NOT NULL,
  `m3` int(20) NOT NULL,
  `m4` int(20) NOT NULL,
  `m5` int(20) NOT NULL,
  `g1` int(20) NOT NULL DEFAULT '51',
  `g2` int(20) NOT NULL,
  `g3` int(20) NOT NULL,
  `g4` int(20) NOT NULL,
  `g5` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- A tábla adatainak kiíratása `felszerelesem`
--

INSERT INTO `felszerelesem` (`userid`, `bazis`, `b1`, `b2`, `b3`, `b4`, `b5`, `p1`, `p2`, `p3`, `p4`, `p5`, `l1`, `l2`, `l3`, `l4`, `l5`, `m1`, `m2`, `m3`, `m4`, `m5`, `g1`, `g2`, `g3`, `g4`, `g5`) VALUES
(1, 4, 11, 0, 0, 0, 0, 21, 0, 0, 0, 0, 31, 0, 0, 0, 0, 41, 0, 0, 0, 0, 51, 0, 0, 0, 0),
(2, 1, 11, 0, 0, 0, 0, 21, 0, 0, 0, 0, 31, 0, 0, 0, 0, 41, 0, 0, 0, 0, 51, 0, 0, 0, 0),
(3, 1, 11, 0, 0, 0, 0, 21, 0, 0, 0, 0, 31, 0, 0, 0, 0, 41, 0, 0, 0, 0, 51, 0, 0, 0, 0),
(4, 1, 11, 0, 0, 0, 0, 21, 0, 0, 0, 0, 31, 0, 0, 0, 0, 41, 0, 0, 0, 0, 51, 0, 0, 0, 0),
(5, 1, 11, 0, 0, 0, 0, 21, 0, 0, 0, 0, 31, 0, 0, 0, 0, 41, 0, 0, 0, 0, 51, 0, 0, 0, 0),
(6, 1, 11, 0, 0, 0, 0, 21, 0, 0, 0, 0, 31, 0, 0, 0, 0, 41, 0, 0, 0, 0, 51, 0, 0, 0, 0),
(7, 1, 11, 0, 0, 0, 0, 21, 0, 0, 0, 0, 31, 0, 0, 0, 0, 41, 0, 0, 0, 0, 51, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `galaxy`
--

CREATE TABLE `galaxy` (
  `galaxisid` int(11) NOT NULL,
  `atjaroreszek` int(11) NOT NULL,
  `aktiv` tinyint(4) NOT NULL,
  `npcszam` int(11) NOT NULL,
  `npc1` varchar(256) NOT NULL DEFAULT 'a:10:{i:0;i:1;i:1;s:4:"NPC1";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:"img/img.jpg";}',
  `npc2` varchar(256) NOT NULL DEFAULT 'a:10:{i:0;i:2;i:1;s:4:"NPC2";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:"img/img.jpg";}',
  `npc3` varchar(256) NOT NULL DEFAULT 'a:10:{i:0;i:3;i:1;s:4:"NPC3";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:"img/img.jpg";}',
  `npc4` varchar(256) NOT NULL DEFAULT 'a:10:{i:0;i:4;i:1;s:4:"NPC4";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:"img/img.jpg";}',
  `npc5` varchar(256) NOT NULL DEFAULT 'a:10:{i:0;i:5;i:1;s:4:"NPC5";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:"img/img.jpg";}',
  `npc6` varchar(256) NOT NULL DEFAULT 'a:10:{i:0;i:6;i:1;s:4:"NPC6";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:"img/img.jpg";}',
  `npc7` varchar(256) NOT NULL DEFAULT 'a:10:{i:0;i:7;i:1;s:4:"NPC7";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:"img/img.jpg";}',
  `npc8` varchar(256) NOT NULL DEFAULT 'a:10:{i:0;i:8;i:1;s:4:"NPC8";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:"img/img.jpg";}',
  `npc9` varchar(256) NOT NULL DEFAULT 'a:10:{i:0;i:9;i:1;s:4:"NPC9";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:"img/img.jpg";}',
  `npc10` varchar(256) NOT NULL DEFAULT 'a:10:{i:0;i:10;i:1;s:4:"NPC10";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:"img/img.jpg";}',
  `npc11` varchar(256) NOT NULL DEFAULT 'a:10:{i:0;i:11;i:1;s:4:"NPC11";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:"img/img.jpg";}',
  `npc12` varchar(256) NOT NULL DEFAULT 'a:10:{i:0;i:12;i:1;s:4:"NPC12";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:"img/img.jpg";}',
  `npc13` varchar(256) NOT NULL DEFAULT 'a:10:{i:0;i:13;i:1;s:4:"NPC13";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:"img/img.jpg";}',
  `npc14` varchar(256) NOT NULL DEFAULT 'a:10:{i:0;i:14;i:1;s:4:"NPC14";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:"img/img.jpg";}',
  `npc15` varchar(256) NOT NULL DEFAULT 'a:10:{i:0;i:15;i:1;s:4:"NPC15";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:"img/img.jpg";}',
  `npc16` varchar(256) NOT NULL DEFAULT 'a:10:{i:0;i:16;i:1;s:4:"NPC16";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:"img/img.jpg";}',
  `npc17` varchar(256) NOT NULL DEFAULT 'a:10:{i:0;i:17;i:1;s:4:"NPC17";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:"img/img.jpg";}',
  `npc18` varchar(256) NOT NULL DEFAULT 'a:10:{i:0;i:18;i:1;s:4:"NPC18";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:"img/img.jpg";}',
  `npc19` varchar(256) NOT NULL DEFAULT 'a:10:{i:0;i:19;i:1;s:4:"NPC19";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:"img/img.jpg";}',
  `npc20` varchar(256) NOT NULL DEFAULT 'a:10:{i:0;i:20;i:1;s:4:"NPC20";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:"img/img.jpg";}',
  `npc21` varchar(256) NOT NULL DEFAULT 'a:10:{i:0;i:21;i:1;s:5:"NPC21";i:2;i:30;i:3;i:25;i:4;i:20;i:5;i:15;i:6;i:10;i:7;i:900;i:8;i:500;i:9;s:11:"img/img.jpg";}',
  `npc22` varchar(256) NOT NULL DEFAULT 'a:10:{i:0;i:22;i:1;s:5:"NPC22";i:2;i:30;i:3;i:25;i:4;i:20;i:5;i:15;i:6;i:10;i:7;i:900;i:8;i:500;i:9;s:11:"img/img.jpg";}',
  `npc23` varchar(256) NOT NULL DEFAULT 'a:10:{i:0;i:23;i:1;s:5:"NPC23";i:2;i:30;i:3;i:25;i:4;i:20;i:5;i:15;i:6;i:10;i:7;i:900;i:8;i:500;i:9;s:11:"img/img.jpg";}',
  `npc24` varchar(256) NOT NULL DEFAULT 'a:10:{i:0;i:24;i:1;s:5:"NPC24";i:2;i:30;i:3;i:25;i:4;i:20;i:5;i:15;i:6;i:10;i:7;i:900;i:8;i:500;i:9;s:11:"img/img.jpg";}',
  `npc25` varchar(256) NOT NULL DEFAULT 'a:10:{i:0;i:25;i:1;s:5:"NPC25";i:2;i:30;i:3;i:25;i:4;i:20;i:5;i:15;i:6;i:10;i:7;i:900;i:8;i:500;i:9;s:11:"img/img.jpg";}',
  `npc26` varchar(256) NOT NULL DEFAULT 'a:10:{i:0;i:26;i:1;s:5:"NPC26";i:2;i:30;i:3;i:25;i:4;i:20;i:5;i:15;i:6;i:10;i:7;i:900;i:8;i:500;i:9;s:11:"img/img.jpg";}',
  `npc27` varchar(256) NOT NULL DEFAULT 'a:10:{i:0;i:27;i:1;s:5:"NPC27";i:2;i:30;i:3;i:25;i:4;i:20;i:5;i:15;i:6;i:10;i:7;i:900;i:8;i:500;i:9;s:11:"img/img.jpg";}',
  `npc28` varchar(256) NOT NULL DEFAULT 'a:10:{i:0;i:28;i:1;s:5:"NPC28";i:2;i:30;i:3;i:25;i:4;i:20;i:5;i:15;i:6;i:10;i:7;i:900;i:8;i:500;i:9;s:11:"img/img.jpg";}',
  `npc29` varchar(256) NOT NULL DEFAULT 'a:10:{i:0;i:29;i:1;s:5:"NPC29";i:2;i:30;i:3;i:25;i:4;i:20;i:5;i:15;i:6;i:10;i:7;i:900;i:8;i:500;i:9;s:11:"img/img.jpg";}',
  `npc30` varchar(256) NOT NULL DEFAULT 'a:10:{i:0;i:30;i:1;s:5:"NPC30";i:2;i:30;i:3;i:25;i:4;i:20;i:5;i:15;i:6;i:10;i:7;i:900;i:8;i:500;i:9;s:11:"img/img.jpg";}',
  `jutalom` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- A tábla adatainak kiíratása `galaxy`
--

INSERT INTO `galaxy` (`galaxisid`, `atjaroreszek`, `aktiv`, `npcszam`, `npc1`, `npc2`, `npc3`, `npc4`, `npc5`, `npc6`, `npc7`, `npc8`, `npc9`, `npc10`, `npc11`, `npc12`, `npc13`, `npc14`, `npc15`, `npc16`, `npc17`, `npc18`, `npc19`, `npc20`, `npc21`, `npc22`, `npc23`, `npc24`, `npc25`, `npc26`, `npc27`, `npc28`, `npc29`, `npc30`, `jutalom`) VALUES
(1, 50, 1, 30, 'a:10:{i:0;i:1;i:1;s:4:\"NPC1\";i:2;i:10;i:3;i:15;i:4;i:10;i:5;i:5;i:6;i:8;i:7;i:1000;i:8;i:500;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:2;i:1;s:4:\"NPC2\";i:2;i:10;i:3;i:20;i:4;i:5;i:5;i:5;i:6;i:10;i:7;i:1000;i:8;i:500;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:3;i:1;s:4:\"NPC3\";i:2;i:20;i:3;i:10;i:4;i:20;i:5;i:5;i:6;i:7;i:7;i:1200;i:8;i:600;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:4;i:1;s:4:\"NPC4\";i:2;i:17;i:3;i:13;i:4;i:27;i:5;i:10;i:6;i:11;i:7;i:1300;i:8;i:800;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:5;i:1;s:4:\"NPC5\";i:2;i:21;i:3;i:5;i:4;i:14;i:5;i:10;i:6;i:18;i:7;i:1000;i:8;i:1000;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:6;i:1;s:4:\"NPC6\";i:2;i:20;i:3;i:20;i:4;i:10;i:5;i:10;i:6;i:15;i:7;i:1200;i:8;i:1000;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:7;i:1;s:4:\"NPC7\";i:2;i:18;i:3;i:20;i:4;i:15;i:5;i:13;i:6;i:17;i:7;i:1200;i:8;i:1000;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:8;i:1;s:4:\"NPC8\";i:2;i:20;i:3;i:5;i:4;i:17;i:5;i:19;i:6;i:25;i:7;i:1300;i:8;i:900;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:9;i:1;s:4:\"NPC9\";i:2;i:20;i:3;i:25;i:4;i:17;i:5;i:19;i:6;i:15;i:7;i:1100;i:8;i:700;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:10;i:1;s:5:\"NPC10\";i:2;i:22;i:3;i:25;i:4;i:19;i:5;i:21;i:6;i:17;i:7;i:1200;i:8;i:750;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:11;i:1;s:5:\"NPC11\";i:2;i:15;i:3;i:20;i:4;i:17;i:5;i:23;i:6;i:19;i:7;i:1000;i:8;i:600;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:12;i:1;s:5:\"NPC12\";i:2;i:17;i:3;i:21;i:4;i:13;i:5;i:27;i:6;i:15;i:7;i:1100;i:8;i:800;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:13;i:1;s:5:\"NPC13\";i:2;i:20;i:3;i:20;i:4;i:10;i:5;i:20;i:6;i:15;i:7;i:1000;i:8;i:800;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:14;i:1;s:5:\"NPC14\";i:2;i:20;i:3;i:25;i:4;i:20;i:5;i:17;i:6;i:19;i:7;i:1400;i:8;i:900;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:15;i:1;s:5:\"NPC15\";i:2;i:23;i:3;i:25;i:4;i:19;i:5;i:21;i:6;i:19;i:7;i:1400;i:8;i:950;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:16;i:1;s:5:\"NPC16\";i:2;i:21;i:3;i:21;i:4;i:19;i:5;i:21;i:6;i:19;i:7;i:1000;i:8;i:750;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:17;i:1;s:5:\"NPC17\";i:2;i:20;i:3;i:29;i:4;i:25;i:5;i:21;i:6;i:18;i:7;i:1500;i:8;i:700;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:18;i:1;s:5:\"NPC18\";i:2;i:25;i:3;i:25;i:4;i:20;i:5;i:25;i:6;i:19;i:7;i:1300;i:8;i:850;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:19;i:1;s:5:\"NPC19\";i:2;i:10;i:3;i:15;i:4;i:20;i:5;i:25;i:6;i:30;i:7;i:900;i:8;i:500;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:20;i:1;s:5:\"NPC20\";i:2;i:30;i:3;i:25;i:4;i:20;i:5;i:15;i:6;i:10;i:7;i:900;i:8;i:500;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:21;i:1;s:5:\"NPC21\";i:2;i:20;i:3;i:25;i:4;i:20;i:5;i:15;i:6;i:20;i:7;i:900;i:8;i:700;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:22;i:1;s:5:\"NPC22\";i:2;i:20;i:3;i:21;i:4;i:22;i:5;i:13;i:6;i:24;i:7;i:900;i:8;i:700;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:23;i:1;s:5:\"NPC23\";i:2;i:10;i:3;i:20;i:4;i:30;i:5;i:35;i:6;i:10;i:7;i:1500;i:8;i:1500;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:24;i:1;s:5:\"NPC24\";i:2;i:30;i:3;i:5;i:4;i:20;i:5;i:20;i:6;i:25;i:7;i:1150;i:8;i:825;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:25;i:1;s:5:\"NPC25\";i:2;i:20;i:3;i:25;i:4;i:17;i:5;i:23;i:6;i:29;i:7;i:1050;i:8;i:800;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:26;i:1;s:5:\"NPC26\";i:2;i:25;i:3;i:25;i:4;i:27;i:5;i:33;i:6;i:29;i:7;i:1300;i:8;i:900;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:27;i:1;s:5:\"NPC27\";i:2;i:25;i:3;i:27;i:4;i:17;i:5;i:23;i:6;i:29;i:7;i:1000;i:8;i:700;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:28;i:1;s:5:\"NPC28\";i:2;i:25;i:3;i:25;i:4;i:30;i:5;i:23;i:6;i:29;i:7;i:1500;i:8;i:1000;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:29;i:1;s:5:\"NPC29\";i:2;i:30;i:3;i:25;i:4;i:30;i:5;i:33;i:6;i:29;i:7;i:2000;i:8;i:1000;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:30;i:1;s:5:\"NPC30\";i:2;i:29;i:3;i:35;i:4;i:30;i:5;i:33;i:6;i:31;i:7;i:2500;i:8;i:1000;i:9;s:11:\"img/img.jpg\";}', 'a:4:{i:0;i:1;i:1;i:40000;i:2;i:15000;i:3;i:0;}'),
(2, 80, 1, 30, 'a:10:{i:0;i:1;i:1;s:4:\"NPC1\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:2;i:1;s:4:\"NPC2\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:3;i:1;s:4:\"NPC3\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}	', 'a:10:{i:0;i:4;i:1;s:4:\"NPC4\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:5;i:1;s:4:\"NPC5\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:6;i:1;s:4:\"NPC6\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:7;i:1;s:4:\"NPC7\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:8;i:1;s:4:\"NPC8\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:9;i:1;s:4:\"NPC9\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:10;i:1;s:4:\"NPC10\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:11;i:1;s:4:\"NPC11\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:12;i:1;s:4:\"NPC12\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:13;i:1;s:4:\"NPC13\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:14;i:1;s:4:\"NPC14\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:15;i:1;s:4:\"NPC15\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:16;i:1;s:4:\"NPC16\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:17;i:1;s:4:\"NPC17\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:18;i:1;s:4:\"NPC18\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:19;i:1;s:4:\"NPC19\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:20;i:1;s:4:\"NPC20\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:21;i:1;s:5:\"NPC21\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:22;i:1;s:5:\"NPC22\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:23;i:1;s:5:\"NPC23\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:24;i:1;s:5:\"NPC24\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:25;i:1;s:5:\"NPC25\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:26;i:1;s:5:\"NPC26\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:27;i:1;s:5:\"NPC27\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:28;i:1;s:5:\"NPC28\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:29;i:1;s:5:\"NPC29\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:30;i:1;s:5:\"NPC30\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', ''),
(3, 110, 1, 30, 'a:10:{i:0;i:1;i:1;s:4:\"NPC1\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:2;i:1;s:4:\"NPC2\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:3;i:1;s:4:\"NPC3\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}	', 'a:10:{i:0;i:4;i:1;s:4:\"NPC4\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:5;i:1;s:4:\"NPC5\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:6;i:1;s:4:\"NPC6\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:7;i:1;s:4:\"NPC7\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:8;i:1;s:4:\"NPC8\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:9;i:1;s:4:\"NPC9\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:10;i:1;s:4:\"NPC10\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:11;i:1;s:4:\"NPC11\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:12;i:1;s:4:\"NPC12\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:13;i:1;s:4:\"NPC13\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:14;i:1;s:4:\"NPC14\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:15;i:1;s:4:\"NPC15\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:16;i:1;s:4:\"NPC16\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:17;i:1;s:4:\"NPC17\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:18;i:1;s:4:\"NPC18\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:19;i:1;s:4:\"NPC19\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:20;i:1;s:4:\"NPC20\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:21;i:1;s:5:\"NPC21\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:22;i:1;s:5:\"NPC22\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:23;i:1;s:5:\"NPC23\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:24;i:1;s:5:\"NPC24\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:25;i:1;s:5:\"NPC25\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:26;i:1;s:5:\"NPC26\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:27;i:1;s:5:\"NPC27\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:28;i:1;s:5:\"NPC28\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:29;i:1;s:5:\"NPC29\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:30;i:1;s:5:\"NPC30\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', ''),
(4, 9999, 1, 0, 'a:10:{i:0;i:1;i:1;s:4:\"NPC1\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:2;i:1;s:4:\"NPC2\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:3;i:1;s:4:\"NPC3\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}	', 'a:10:{i:0;i:4;i:1;s:4:\"NPC4\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:5;i:1;s:4:\"NPC5\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:6;i:1;s:4:\"NPC6\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:7;i:1;s:4:\"NPC7\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:8;i:1;s:4:\"NPC8\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:9;i:1;s:4:\"NPC9\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:10;i:1;s:4:\"NPC10\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:11;i:1;s:4:\"NPC11\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:12;i:1;s:4:\"NPC12\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:13;i:1;s:4:\"NPC13\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:14;i:1;s:4:\"NPC14\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:15;i:1;s:4:\"NPC15\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:16;i:1;s:4:\"NPC16\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:17;i:1;s:4:\"NPC17\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:18;i:1;s:4:\"NPC18\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:19;i:1;s:4:\"NPC19\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:20;i:1;s:4:\"NPC20\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:21;i:1;s:5:\"NPC21\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:22;i:1;s:5:\"NPC22\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:23;i:1;s:5:\"NPC23\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:24;i:1;s:5:\"NPC24\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:25;i:1;s:5:\"NPC25\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:26;i:1;s:5:\"NPC26\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:27;i:1;s:5:\"NPC27\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:28;i:1;s:5:\"NPC28\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:29;i:1;s:5:\"NPC29\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:30;i:1;s:5:\"NPC30\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', ''),
(5, 211, 0, 0, 'a:10:{i:0;i:1;i:1;s:4:\"NPC1\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:2;i:1;s:4:\"NPC2\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:3;i:1;s:4:\"NPC3\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}	', 'a:10:{i:0;i:4;i:1;s:4:\"NPC4\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:5;i:1;s:4:\"NPC5\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:6;i:1;s:4:\"NPC6\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:7;i:1;s:4:\"NPC7\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:8;i:1;s:4:\"NPC8\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:9;i:1;s:4:\"NPC9\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:10;i:1;s:4:\"NPC10\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:11;i:1;s:4:\"NPC11\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:12;i:1;s:4:\"NPC12\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:13;i:1;s:4:\"NPC13\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:14;i:1;s:4:\"NPC14\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:15;i:1;s:4:\"NPC15\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:16;i:1;s:4:\"NPC16\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:17;i:1;s:4:\"NPC17\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:18;i:1;s:4:\"NPC18\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:19;i:1;s:4:\"NPC19\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:20;i:1;s:4:\"NPC20\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:21;i:1;s:5:\"NPC21\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:22;i:1;s:5:\"NPC22\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:23;i:1;s:5:\"NPC23\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:24;i:1;s:5:\"NPC24\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:25;i:1;s:5:\"NPC25\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:26;i:1;s:5:\"NPC26\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:27;i:1;s:5:\"NPC27\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:28;i:1;s:5:\"NPC28\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:29;i:1;s:5:\"NPC29\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:30;i:1;s:5:\"NPC30\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', ''),
(6, 256, 0, 0, 'a:10:{i:0;i:1;i:1;s:4:\"NPC1\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:2;i:1;s:4:\"NPC2\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:3;i:1;s:4:\"NPC3\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}	', 'a:10:{i:0;i:4;i:1;s:4:\"NPC4\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:5;i:1;s:4:\"NPC5\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:6;i:1;s:4:\"NPC6\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:7;i:1;s:4:\"NPC7\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:8;i:1;s:4:\"NPC8\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:9;i:1;s:4:\"NPC9\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:10;i:1;s:4:\"NPC10\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:11;i:1;s:4:\"NPC11\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:12;i:1;s:4:\"NPC12\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:13;i:1;s:4:\"NPC13\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:14;i:1;s:4:\"NPC14\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:15;i:1;s:4:\"NPC15\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:16;i:1;s:4:\"NPC16\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:17;i:1;s:4:\"NPC17\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:18;i:1;s:4:\"NPC18\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:19;i:1;s:4:\"NPC19\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:20;i:1;s:4:\"NPC20\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:21;i:1;s:5:\"NPC21\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:22;i:1;s:5:\"NPC22\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:23;i:1;s:5:\"NPC23\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:24;i:1;s:5:\"NPC24\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:25;i:1;s:5:\"NPC25\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:26;i:1;s:5:\"NPC26\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:27;i:1;s:5:\"NPC27\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:28;i:1;s:5:\"NPC28\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:29;i:1;s:5:\"NPC29\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:30;i:1;s:5:\"NPC30\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', ''),
(7, 320, 0, 0, 'a:10:{i:0;i:1;i:1;s:4:\"NPC1\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:2;i:1;s:4:\"NPC2\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:3;i:1;s:4:\"NPC3\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}	', 'a:10:{i:0;i:4;i:1;s:4:\"NPC4\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:5;i:1;s:4:\"NPC5\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:6;i:1;s:4:\"NPC6\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:7;i:1;s:4:\"NPC7\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:8;i:1;s:4:\"NPC8\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:9;i:1;s:4:\"NPC9\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:10;i:1;s:4:\"NPC10\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:11;i:1;s:4:\"NPC11\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:12;i:1;s:4:\"NPC12\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:13;i:1;s:4:\"NPC13\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:14;i:1;s:4:\"NPC14\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:15;i:1;s:4:\"NPC15\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:16;i:1;s:4:\"NPC16\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:17;i:1;s:4:\"NPC17\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:18;i:1;s:4:\"NPC18\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:19;i:1;s:4:\"NPC19\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:20;i:1;s:4:\"NPC20\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:21;i:1;s:5:\"NPC21\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:22;i:1;s:5:\"NPC22\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:23;i:1;s:5:\"NPC23\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:24;i:1;s:5:\"NPC24\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:25;i:1;s:5:\"NPC25\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:26;i:1;s:5:\"NPC26\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:27;i:1;s:5:\"NPC27\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:28;i:1;s:5:\"NPC28\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:29;i:1;s:5:\"NPC29\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:30;i:1;s:5:\"NPC30\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', ''),
(8, 190, 0, 0, 'a:10:{i:0;i:1;i:1;s:4:\"NPC1\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:2;i:1;s:4:\"NPC2\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:3;i:1;s:4:\"NPC3\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}	', 'a:10:{i:0;i:4;i:1;s:4:\"NPC4\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:5;i:1;s:4:\"NPC5\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:6;i:1;s:4:\"NPC6\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:7;i:1;s:4:\"NPC7\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:8;i:1;s:4:\"NPC8\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:9;i:1;s:4:\"NPC9\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:10;i:1;s:4:\"NPC10\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:11;i:1;s:4:\"NPC11\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:12;i:1;s:4:\"NPC12\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:13;i:1;s:4:\"NPC13\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:14;i:1;s:4:\"NPC14\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:15;i:1;s:4:\"NPC15\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:16;i:1;s:4:\"NPC16\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:17;i:1;s:4:\"NPC17\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:18;i:1;s:4:\"NPC18\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:19;i:1;s:4:\"NPC19\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:20;i:1;s:4:\"NPC20\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:21;i:1;s:5:\"NPC21\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:22;i:1;s:5:\"NPC22\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:23;i:1;s:5:\"NPC23\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:24;i:1;s:5:\"NPC24\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:25;i:1;s:5:\"NPC25\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:26;i:1;s:5:\"NPC26\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:27;i:1;s:5:\"NPC27\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:28;i:1;s:5:\"NPC28\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:29;i:1;s:5:\"NPC29\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:30;i:1;s:5:\"NPC30\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', ''),
(9, 500, 0, 0, 'a:10:{i:0;i:1;i:1;s:4:\"NPC1\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:2;i:1;s:4:\"NPC2\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:3;i:1;s:4:\"NPC4\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:4;i:1;s:4:\"NPC4\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:5;i:1;s:4:\"NPC5\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:6;i:1;s:4:\"NPC6\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:7;i:1;s:4:\"NPC7\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:8;i:1;s:4:\"NPC8\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:9;i:1;s:4:\"NPC9\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:10;i:1;s:4:\"NPC10\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:11;i:1;s:4:\"NPC11\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:12;i:1;s:4:\"NPC12\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:13;i:1;s:4:\"NPC13\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:14;i:1;s:4:\"NPC14\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:15;i:1;s:4:\"NPC15\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:16;i:1;s:4:\"NPC16\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:17;i:1;s:4:\"NPC17\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:18;i:1;s:4:\"NPC18\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:19;i:1;s:4:\"NPC19\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:20;i:1;s:4:\"NPC20\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:21;i:1;s:5:\"NPC21\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:22;i:1;s:5:\"NPC22\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:23;i:1;s:5:\"NPC23\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:24;i:1;s:5:\"NPC24\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:25;i:1;s:5:\"NPC25\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:26;i:1;s:5:\"NPC26\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:27;i:1;s:5:\"NPC27\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:28;i:1;s:5:\"NPC28\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:29;i:1;s:5:\"NPC29\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:30;i:1;s:5:\"NPC30\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', ''),
(10, 1000, 0, 0, 'a:10:{i:0;i:1;i:1;s:4:\"NPC1\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:2;i:1;s:4:\"NPC2\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:3;i:1;s:4:\"NPC3\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}	', 'a:10:{i:0;i:4;i:1;s:4:\"NPC4\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:5;i:1;s:4:\"NPC5\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:6;i:1;s:4:\"NPC6\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:7;i:1;s:4:\"NPC7\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:8;i:1;s:4:\"NPC8\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:9;i:1;s:4:\"NPC9\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:10;i:1;s:4:\"NPC10\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:11;i:1;s:4:\"NPC11\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:12;i:1;s:4:\"NPC12\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:13;i:1;s:4:\"NPC13\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:14;i:1;s:4:\"NPC14\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:15;i:1;s:4:\"NPC15\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:16;i:1;s:4:\"NPC16\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:17;i:1;s:4:\"NPC17\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:18;i:1;s:4:\"NPC18\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:19;i:1;s:4:\"NPC19\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:20;i:1;s:4:\"NPC20\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:21;i:1;s:5:\"NPC21\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:22;i:1;s:5:\"NPC22\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:23;i:1;s:5:\"NPC23\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:24;i:1;s:5:\"NPC24\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:25;i:1;s:5:\"NPC25\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:26;i:1;s:5:\"NPC26\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:27;i:1;s:5:\"NPC27\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:28;i:1;s:5:\"NPC28\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:29;i:1;s:5:\"NPC29\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', 'a:10:{i:0;i:30;i:1;s:5:\"NPC30\";i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;s:11:\"img/img.jpg\";}', '');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `jutalom_parbaj`
--

CREATE TABLE `jutalom_parbaj` (
  `szint` int(11) NOT NULL,
  `tapasztalat` int(11) NOT NULL,
  `kredit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- A tábla adatainak kiíratása `jutalom_parbaj`
--

INSERT INTO `jutalom_parbaj` (`szint`, `tapasztalat`, `kredit`) VALUES
(1, 100, 100),
(2, 200, 150),
(3, 300, 200),
(4, 350, 250),
(5, 450, 300),
(6, 500, 350),
(7, 500, 350),
(8, 500, 350),
(9, 700, 400),
(10, 900, 400),
(11, 900, 400),
(12, 900, 400),
(13, 900, 400),
(14, 900, 400),
(15, 1300, 500),
(16, 1300, 500),
(17, 1400, 500),
(18, 1400, 500),
(19, 1500, 550),
(20, 1500, 550),
(21, 2000, 600),
(22, 2000, 600),
(23, 2200, 650),
(24, 2200, 650),
(25, 2400, 700),
(26, 2600, 750),
(27, 5000, 1000),
(28, 5000, 1000),
(29, 6000, 1250),
(30, 6000, 1250),
(47, 23852, 13333);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kalozok`
--

CREATE TABLE `kalozok` (
  `id` int(11) NOT NULL,
  `kaloznev` varchar(256) NOT NULL,
  `ertekek` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- A tábla adatainak kiíratása `kalozok`
--

INSERT INTO `kalozok` (`id`, `kaloznev`, `ertekek`) VALUES
(1, '', 'a:8:{i:0;i:1;i:1;i:1;i:2;i:1;i:3;i:1;i:4;i:1;i:5;i:1;i:6;i:10;i:7;i:10;}'),
(2, '', 'a:8:{i:0;i:2;i:1;i:2;i:2;i:2;i:3;i:2;i:4;i:2;i:5;i:2;i:6;i:25;i:7;i:25;}'),
(3, '', 'a:8:{i:0;i:3;i:1;i:4;i:2;i:4;i:3;i:4;i:4;i:4;i:5;i:4;i:6;i:50;i:7;i:50;}'),
(4, '', 'a:8:{i:0;i:4;i:1;i:6;i:2;i:6;i:3;i:6;i:4;i:6;i:5;i:6;i:6;i:75;i:7;i:75;}'),
(5, '', 'a:8:{i:0;i:5;i:1;i:8;i:2;i:10;i:3;i:12;i:4;i:6;i:5;i:8;i:6;i:100;i:7;i:100;}'),
(6, '', 'a:8:{i:0;i:6;i:1;i:14;i:2;i:12;i:3;i:10;i:4;i:10;i:5;i:15;i:6;i:150;i:7;i:200;}'),
(7, '', 'a:8:{i:0;i:7;i:1;i:13;i:2;i:13;i:3;i:16;i:4;i:16;i:5;i:14;i:6;i:200;i:7;i:200;}'),
(8, '', 'a:8:{i:0;i:7;i:1;i:130;i:2;i:130;i:3;i:160;i:4;i:160;i:5;i:140;i:6;i:200000;i:7;i:1000000;}'),
(9, '', ''),
(10, '', '');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `munka`
--

CREATE TABLE `munka` (
  `id` int(30) NOT NULL,
  `kezdes` varchar(256) COLLATE utf8_bin NOT NULL,
  `munkahely_id` int(2) NOT NULL,
  `munkaido` int(1) NOT NULL,
  `munkaido_sec` int(11) NOT NULL,
  `dolgozik` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- A tábla adatainak kiíratása `munka`
--

INSERT INTO `munka` (`id`, `kezdes`, `munkahely_id`, `munkaido`, `munkaido_sec`, `dolgozik`) VALUES
(1, '1517658880', 4, 8, 28800, 1),
(2, '', 0, 0, 0, 0),
(3, '', 0, 0, 0, 0),
(4, '', 0, 0, 0, 0),
(5, '', 0, 0, 0, 0),
(6, '', 0, 0, 0, 0),
(7, '', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `munkahelyek`
--

CREATE TABLE `munkahelyek` (
  `id` int(2) NOT NULL,
  `szintkorlat` int(3) NOT NULL,
  `oraber` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- A tábla adatainak kiíratása `munkahelyek`
--

INSERT INTO `munkahelyek` (`id`, `szintkorlat`, `oraber`) VALUES
(1, 1, 1000),
(2, 5, 2000),
(3, 10, 3000),
(4, 25, 4000),
(5, 50, 5000);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `nyersanyagtermeles`
--

CREATE TABLE `nyersanyagtermeles` (
  `userid` int(64) NOT NULL,
  `iridium_banyak_szint` varchar(8192) NOT NULL DEFAULT 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}' COMMENT 'Irídium(77/Ir)',
  `radon_banyak_szint` varchar(8192) NOT NULL DEFAULT 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}' COMMENT 'Radon(86/Pn)',
  `uran_banyak_szint` varchar(8192) NOT NULL DEFAULT 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}' COMMENT 'Urán(92/U)',
  `tantal_finomito_szint` varchar(8192) NOT NULL DEFAULT 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}' COMMENT 'Tantál(73/Ta)',
  `palladium_finomito_szint` varchar(8192) NOT NULL DEFAULT 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- A tábla adatainak kiíratása `nyersanyagtermeles`
--

INSERT INTO `nyersanyagtermeles` (`userid`, `iridium_banyak_szint`, `radon_banyak_szint`, `uran_banyak_szint`, `tantal_finomito_szint`, `palladium_finomito_szint`) VALUES
(1, 'a:9:{i:0;i:1;i:1;i:2;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(2, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(3, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(4, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(5, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(6, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(7, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(8, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(9, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(10, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(11, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(12, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(13, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(14, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(15, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(16, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(17, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(18, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(19, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(20, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(21, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(22, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(23, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(24, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(25, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(26, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(27, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(28, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(29, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(30, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(31, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(32, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(33, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(34, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(35, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(36, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(37, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(38, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(39, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(40, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(41, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(42, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(43, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(44, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(45, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(46, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(47, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(48, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(49, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(50, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(51, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(52, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(53, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(54, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(55, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(56, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(57, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(58, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(59, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(60, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(61, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(62, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(63, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(64, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(65, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(66, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(67, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(68, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(69, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(70, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(71, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(72, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(73, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(74, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(75, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(76, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(77, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(78, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(79, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(80, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(81, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(82, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(83, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(84, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(85, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(86, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(87, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(88, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(89, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(90, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(91, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(92, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(93, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(94, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(95, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(96, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(97, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(98, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(99, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(100, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(101, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(102, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(103, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(104, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(105, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(106, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(107, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(108, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(109, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}'),
(110, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}');
INSERT INTO `nyersanyagtermeles` (`userid`, `iridium_banyak_szint`, `radon_banyak_szint`, `uran_banyak_szint`, `tantal_finomito_szint`, `palladium_finomito_szint`) VALUES
(111, 'a:9:{i:0;i:1;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}', 'a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `szintek`
--

CREATE TABLE `szintek` (
  `szint` int(10) NOT NULL,
  `altp` int(255) NOT NULL DEFAULT '0',
  `ossztp` int(255) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- A tábla adatainak kiíratása `szintek`
--

INSERT INTO `szintek` (`szint`, `altp`, `ossztp`) VALUES
(1, 0, 0),
(2, 400, 400),
(3, 900, 1300),
(4, 1600, 2900),
(5, 2500, 5400),
(6, 3600, 9000),
(7, 4900, 13900),
(8, 6400, 20300),
(9, 8100, 28400),
(10, 10000, 38400),
(11, 12100, 50500),
(12, 14400, 64900),
(13, 16900, 81800),
(14, 19600, 101400),
(15, 22500, 123900),
(16, 25600, 149500),
(17, 28900, 178400),
(18, 32400, 210800),
(19, 36100, 246900),
(20, 40000, 286900),
(21, 44100, 331000),
(22, 48400, 379400),
(23, 52900, 432300),
(24, 57600, 489900),
(25, 62500, 552400),
(26, 67600, 620000),
(27, 72900, 692900),
(28, 78400, 771300),
(29, 84100, 855400),
(30, 90000, 945400),
(31, 96100, 1041500),
(32, 102400, 1143900),
(33, 108900, 1252800),
(34, 115600, 1368400),
(35, 122500, 1490900),
(36, 129600, 1620500),
(37, 136900, 1757400),
(38, 144400, 1901800),
(39, 152100, 2053900),
(40, 160000, 2213900),
(41, 168100, 2382000),
(42, 176400, 2558400),
(43, 184900, 2743300),
(44, 193600, 2936900),
(45, 202500, 3139400),
(46, 211600, 3351000),
(47, 220900, 3571900),
(48, 230400, 3802300),
(49, 240100, 4042400),
(50, 250000, 4292400),
(51, 260100, 4552500),
(52, 270400, 4822900),
(53, 280900, 5103800),
(54, 291600, 5395400),
(55, 302500, 5697900),
(56, 313600, 6011500),
(57, 324900, 6336400),
(58, 336400, 6672800),
(59, 348100, 7020900),
(60, 360000, 7380900),
(61, 372100, 7753000),
(62, 384400, 8137400),
(63, 396900, 8534300),
(64, 409600, 8943900),
(65, 422500, 9366400),
(66, 435600, 9802000),
(67, 448900, 10250900),
(68, 462400, 10713300),
(69, 476100, 11189400),
(70, 490000, 11679400),
(71, 504100, 12183500),
(72, 518400, 12701900),
(73, 532900, 13234800),
(74, 547600, 13782400),
(75, 562500, 14344900),
(76, 577600, 14922500),
(77, 592900, 15515400),
(78, 608400, 16123800),
(79, 624100, 16747900),
(80, 640000, 17387900),
(81, 656100, 18044000),
(82, 672400, 18716400),
(83, 688900, 19405300),
(84, 705600, 20110900),
(85, 722500, 20833400),
(86, 739600, 21573000),
(87, 756900, 22329900),
(88, 774400, 23104300),
(89, 792100, 23896400),
(90, 810000, 24706400),
(91, 828100, 25534500),
(92, 846400, 26380900),
(93, 864900, 27245800),
(94, 883600, 28129400),
(95, 902500, 29031900),
(96, 921600, 29953500),
(97, 940900, 30894400),
(98, 960400, 31854800),
(99, 980100, 32834900),
(100, 1000000, 33834900),
(101, 1020100, 34855000),
(102, 1040400, 35895400),
(103, 1060900, 36956300),
(104, 1081600, 38037900),
(105, 1102500, 39140400),
(106, 1123600, 40264000),
(107, 1144900, 41408900),
(108, 1166400, 42575300),
(109, 1188100, 43763400),
(110, 1210000, 44973400),
(111, 1232100, 46205500),
(112, 1254400, 47459900),
(113, 1276900, 48736800),
(114, 1299600, 50036400),
(115, 1322500, 51358900),
(116, 1345600, 52704500),
(117, 1368900, 54073400),
(118, 1392400, 55465800),
(119, 1416100, 56881900),
(120, 1440000, 58321900),
(121, 1464100, 59786000),
(122, 1488400, 61274400),
(123, 1512900, 62787300),
(124, 1537600, 64324900),
(125, 1562500, 65887400),
(126, 1587600, 67475000),
(127, 1612900, 69087900),
(128, 1638400, 70726300),
(129, 1664100, 72390400),
(130, 1690000, 74080400),
(131, 1716100, 75796500),
(132, 1742400, 77538900),
(133, 1768900, 79307800),
(134, 1795600, 81103400),
(135, 1822500, 82925900),
(136, 1849600, 84775500),
(137, 1876900, 86652400),
(138, 1904400, 88556800),
(139, 1932100, 90488900),
(140, 1960000, 92448900),
(141, 1988100, 94437000),
(142, 2016400, 96453400),
(143, 2044900, 98498300),
(144, 2073600, 100571900),
(145, 2102500, 102674400),
(146, 2131600, 104806000),
(147, 2160900, 106966900),
(148, 2190400, 109157300),
(149, 2220100, 111377400),
(150, 2250000, 113627400),
(151, 2280100, 115907500),
(152, 2310400, 118217900),
(153, 2340900, 120558800),
(154, 2371600, 122930400),
(155, 2402500, 125332900),
(156, 2433600, 127766500),
(157, 2464900, 130231400),
(158, 2496400, 132727800),
(159, 2528100, 135255900),
(160, 2560000, 137815900),
(161, 2592100, 140408000),
(162, 2624400, 143032400),
(163, 2656900, 145689300),
(164, 2689600, 148378900),
(165, 2722500, 151101400),
(166, 2755600, 153857000),
(167, 2788900, 156645900),
(168, 2822400, 159468300),
(169, 2856100, 162324400),
(170, 2890000, 165214400),
(171, 2924100, 168138500),
(172, 2958400, 171096900),
(173, 2992900, 174089800),
(174, 3027600, 177117400),
(175, 3062500, 180179900),
(176, 3097600, 183277500),
(177, 3132900, 186410400),
(178, 3168400, 189578800),
(179, 3204100, 192782900),
(180, 3240000, 196022900),
(181, 3276100, 199299000),
(182, 3312400, 202611400),
(183, 3348900, 205960300),
(184, 3385600, 209345900),
(185, 3422500, 212768400),
(186, 3459600, 216228000),
(187, 3496900, 219724900),
(188, 3534400, 223259300),
(189, 3572100, 226831400),
(190, 3610000, 230441400),
(191, 3648100, 234089500),
(192, 3686400, 237775900),
(193, 3724900, 241500800),
(194, 3763600, 245264400),
(195, 3802500, 249066900),
(196, 3841600, 252908500),
(197, 3880900, 256789400),
(198, 3920400, 260709800),
(199, 3960100, 264669900),
(200, 4000000, 268669900),
(201, 4040100, 272710000),
(202, 4080400, 276790400),
(203, 4120900, 280911300),
(204, 4161600, 285072900),
(205, 4202500, 289275400),
(206, 4243600, 293519000),
(207, 4284900, 297803900),
(208, 4326400, 302130300),
(209, 4368100, 306498400),
(210, 4410000, 310908400),
(211, 4452100, 315360500),
(212, 4494400, 319854900),
(213, 4536900, 324391800),
(214, 4579600, 328971400),
(215, 4622500, 333593900),
(216, 4665600, 338259500),
(217, 4708900, 342968400),
(218, 4752400, 347720800),
(219, 4796100, 352516900),
(220, 4840000, 357356900),
(221, 4884100, 362241000),
(222, 4928400, 367169400),
(223, 4972900, 372142300),
(224, 5017600, 377159900),
(225, 5062500, 382222400),
(226, 5107600, 387330000),
(227, 5152900, 392482900),
(228, 5198400, 397681300),
(229, 5244100, 402925400),
(230, 5290000, 408215400),
(231, 5336100, 413551500),
(232, 5382400, 418933900),
(233, 5428900, 424362800),
(234, 5475600, 429838400),
(235, 5522500, 435360900),
(236, 5569600, 440930500),
(237, 5616900, 446547400),
(238, 5664400, 452211800),
(239, 5712100, 457923900),
(240, 5760000, 463683900),
(241, 5808100, 469492000),
(242, 5856400, 475348400),
(243, 5904900, 481253300),
(244, 5953600, 487206900),
(245, 6002500, 493209400),
(246, 6051600, 499261000),
(247, 6100900, 505361900),
(248, 6150400, 511512300),
(249, 6200100, 517712400),
(250, 6250000, 523962400),
(251, 6300100, 530262500),
(252, 6350400, 536612900),
(253, 6400900, 543013800),
(254, 6451600, 549465400),
(255, 6502500, 555967900),
(256, 6553600, 562521500),
(257, 6604900, 569126400),
(258, 6656400, 575782800),
(259, 6708100, 582490900),
(260, 6760000, 589250900),
(261, 6812100, 596063000),
(262, 6864400, 602927400),
(263, 6916900, 609844300),
(264, 6969600, 616813900),
(265, 7022500, 623836400),
(266, 7075600, 630912000),
(267, 7128900, 638040900),
(268, 7182400, 645223300),
(269, 7236100, 652459400),
(270, 7290000, 659749400),
(271, 7344100, 667093500),
(272, 7398400, 674491900),
(273, 7452900, 681944800),
(274, 7507600, 689452400),
(275, 7562500, 697014900),
(276, 7617600, 704632500),
(277, 7672900, 712305400),
(278, 7728400, 720033800),
(279, 7784100, 727817900),
(280, 7840000, 735657900),
(281, 7896100, 743554000),
(282, 7952400, 751506400),
(283, 8008900, 759515300),
(284, 8065600, 767580900),
(285, 8122500, 775703400),
(286, 8179600, 783883000),
(287, 8236900, 792119900),
(288, 8294400, 800414300),
(289, 8352100, 808766400),
(290, 8410000, 817176400),
(291, 8468100, 825644500),
(292, 8526400, 834170900),
(293, 8584900, 842755800),
(294, 8643600, 851399400),
(295, 8702500, 860101900),
(296, 8761600, 868863500),
(297, 8820900, 877684400),
(298, 8880400, 886564800),
(299, 8940100, 895504900),
(300, 9000000, 904504900);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `szovetseg`
--

CREATE TABLE `szovetseg` (
  `id` int(16) NOT NULL,
  `pontszam` varchar(256) NOT NULL,
  `rovidites` varchar(3) NOT NULL,
  `szovetsegneve` varchar(256) NOT NULL,
  `szovetsegvezere` varchar(256) NOT NULL,
  `szovetsegtagok` varchar(2048) NOT NULL DEFAULT 'a:0:{}',
  `jelentkezok` varchar(1024) NOT NULL DEFAULT 'a:0:{}',
  `letszam` int(8) NOT NULL DEFAULT '1',
  `maxletszam` int(8) NOT NULL DEFAULT '10',
  `szovetsegesek` varchar(256) NOT NULL,
  `ellensegek` varchar(256) NOT NULL,
  `kassza` varchar(512) NOT NULL DEFAULT 'a:2:{i:0;i:0;i:1;i:0;}',
  `kasszalog` varchar(4096) NOT NULL DEFAULT 'a:0:{}',
  `bonuszok` varchar(256) NOT NULL DEFAULT 'a:6:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;}'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- A tábla adatainak kiíratása `szovetseg`
--

INSERT INTO `szovetseg` (`id`, `pontszam`, `rovidites`, `szovetsegneve`, `szovetsegvezere`, `szovetsegtagok`, `jelentkezok`, `letszam`, `maxletszam`, `szovetsegesek`, `ellensegek`, `kassza`, `kasszalog`, `bonuszok`) VALUES
(1, '0', 'adm', 'admin', '1', 'a:2:{i:0;i:1;i:1;s:1:\"2\";}', 'a:0:{}', 2, 24, '', '', 'a:2:{i:0;i:10847700;i:1;i:0;}', 'a:5:{i:0;a:5:{i:0;s:26:\"December 21, 2017 13:11:44\";i:1;s:1:\"1\";i:2;s:9:\"Adakozott\";i:3;s:7:\"1000000\";i:4;i:0;}i:1;a:6:{i:0;s:26:\"December 21, 2017 14:48:23\";i:1;s:0:\"\";i:2;s:10:\"Kifizetett\";i:3;s:3:\"100\";i:4;i:0;i:5;s:1:\"1\";}i:2;a:6:{i:0;s:26:\"December 21, 2017 14:48:42\";i:1;s:1:\"2\";i:2;s:10:\"Kifizetett\";i:3;s:5:\"50000\";i:4;i:0;i:5;s:1:\"1\";}i:3;a:6:{i:0;s:26:\"December 21, 2017 14:48:50\";i:1;s:1:\"1\";i:2;s:10:\"Kifizetett\";i:3;s:6:\"100000\";i:4;i:0;i:5;s:1:\"1\";}i:4;a:5:{i:0;s:26:\"December 21, 2017 14:49:07\";i:1;s:1:\"1\";i:2;s:9:\"Adakozott\";i:3;s:8:\"10000000\";i:4;i:0;}}', 'a:6:{i:0;i:4;i:1;i:2;i:2;i:1;i:3;i:0;i:4;i:0;i:5;i:14;}');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `szovetsegrangok`
--

CREATE TABLE `szovetsegrangok` (
  `id` int(16) NOT NULL,
  `megnevezes` varchar(256) NOT NULL,
  `tagfelvetel` tinyint(1) NOT NULL DEFAULT '0',
  `tagtorles` tinyint(1) NOT NULL DEFAULT '0',
  `adovaltoztatas` tinyint(1) NOT NULL DEFAULT '0',
  `kifizetes` tinyint(1) NOT NULL DEFAULT '0',
  `diplomacia` tinyint(1) NOT NULL DEFAULT '0',
  `fejlesztes` tinyint(1) NOT NULL DEFAULT '0',
  `feloszlatas` tinyint(1) NOT NULL DEFAULT '0',
  `letszam` int(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- A tábla adatainak kiíratása `szovetsegrangok`
--

INSERT INTO `szovetsegrangok` (`id`, `megnevezes`, `tagfelvetel`, `tagtorles`, `adovaltoztatas`, `kifizetes`, `diplomacia`, `fejlesztes`, `feloszlatas`, `letszam`) VALUES
(1, 'Vezer', 1, 1, 1, 1, 1, 1, 1, 1),
(2, 'Alvezer', 1, 1, 1, 1, 1, 1, 0, 2),
(3, 'Fotiszt', 1, 0, 1, 1, 1, 0, 0, 5),
(4, 'Altiszt', 1, 0, 0, 0, 1, 0, 0, 5),
(5, 'Diplomata', 0, 0, 0, 0, 1, 0, 0, 5),
(6, 'Urpilota', 0, 0, 0, 0, 0, 0, 0, 49);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `targyaim`
--

CREATE TABLE `targyaim` (
  `id` int(20) NOT NULL,
  `item1` int(10) NOT NULL DEFAULT '1',
  `item2` int(10) NOT NULL DEFAULT '0',
  `item3` int(10) NOT NULL DEFAULT '0',
  `item4` int(10) NOT NULL DEFAULT '0',
  `item5` int(10) NOT NULL DEFAULT '0',
  `item6` int(10) NOT NULL DEFAULT '0',
  `item7` int(10) NOT NULL DEFAULT '0',
  `item8` int(10) NOT NULL DEFAULT '0',
  `item9` int(10) NOT NULL DEFAULT '0',
  `item10` int(10) NOT NULL DEFAULT '0',
  `item11` int(10) NOT NULL DEFAULT '1',
  `item12` int(10) NOT NULL DEFAULT '0',
  `item13` int(10) NOT NULL DEFAULT '0',
  `item14` int(10) NOT NULL DEFAULT '0',
  `item15` int(10) NOT NULL DEFAULT '0',
  `item16` int(20) NOT NULL DEFAULT '0',
  `item17` int(20) NOT NULL DEFAULT '0',
  `item18` int(20) NOT NULL DEFAULT '0',
  `item19` int(20) NOT NULL DEFAULT '0',
  `item20` int(20) NOT NULL DEFAULT '0',
  `item21` int(20) NOT NULL DEFAULT '1',
  `item22` int(11) NOT NULL DEFAULT '0',
  `item23` int(20) NOT NULL DEFAULT '0',
  `item24` int(20) NOT NULL DEFAULT '0',
  `item25` int(20) NOT NULL DEFAULT '0',
  `item26` int(20) NOT NULL DEFAULT '0',
  `item27` int(20) NOT NULL DEFAULT '0',
  `item28` int(20) NOT NULL DEFAULT '0',
  `item29` int(20) NOT NULL DEFAULT '0',
  `item30` int(20) NOT NULL DEFAULT '0',
  `item31` int(20) NOT NULL DEFAULT '1',
  `item32` int(20) NOT NULL DEFAULT '0',
  `item33` int(20) NOT NULL DEFAULT '0',
  `item34` int(20) NOT NULL DEFAULT '0',
  `item35` int(20) NOT NULL DEFAULT '0',
  `item36` int(20) NOT NULL DEFAULT '0',
  `item37` int(20) NOT NULL DEFAULT '0',
  `item38` int(20) NOT NULL DEFAULT '0',
  `item39` int(20) NOT NULL DEFAULT '0',
  `item40` int(20) NOT NULL DEFAULT '0',
  `item41` int(20) NOT NULL DEFAULT '1',
  `item42` int(20) NOT NULL DEFAULT '0',
  `item43` int(20) NOT NULL DEFAULT '0',
  `item44` int(20) NOT NULL DEFAULT '0',
  `item45` int(20) NOT NULL DEFAULT '0',
  `item46` int(20) NOT NULL DEFAULT '0',
  `item47` int(20) NOT NULL DEFAULT '0',
  `item48` int(20) NOT NULL DEFAULT '0',
  `item49` int(20) NOT NULL DEFAULT '0',
  `item50` int(20) NOT NULL DEFAULT '0',
  `item51` int(20) NOT NULL DEFAULT '1',
  `item52` int(20) NOT NULL DEFAULT '0',
  `item53` int(20) NOT NULL DEFAULT '0',
  `item54` int(20) NOT NULL DEFAULT '0',
  `item55` int(20) NOT NULL DEFAULT '0',
  `item56` int(20) NOT NULL DEFAULT '0',
  `item57` int(20) NOT NULL DEFAULT '0',
  `item58` int(20) NOT NULL DEFAULT '0',
  `item59` int(20) NOT NULL DEFAULT '0',
  `item60` int(20) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- A tábla adatainak kiíratása `targyaim`
--

INSERT INTO `targyaim` (`id`, `item1`, `item2`, `item3`, `item4`, `item5`, `item6`, `item7`, `item8`, `item9`, `item10`, `item11`, `item12`, `item13`, `item14`, `item15`, `item16`, `item17`, `item18`, `item19`, `item20`, `item21`, `item22`, `item23`, `item24`, `item25`, `item26`, `item27`, `item28`, `item29`, `item30`, `item31`, `item32`, `item33`, `item34`, `item35`, `item36`, `item37`, `item38`, `item39`, `item40`, `item41`, `item42`, `item43`, `item44`, `item45`, `item46`, `item47`, `item48`, `item49`, `item50`, `item51`, `item52`, `item53`, `item54`, `item55`, `item56`, `item57`, `item58`, `item59`, `item60`) VALUES
(1, 4, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `targyak`
--

CREATE TABLE `targyak` (
  `azonosito` int(10) NOT NULL,
  `kategoria` varchar(256) NOT NULL,
  `burkolatertek` int(10) NOT NULL,
  `pajzsertek` int(10) NOT NULL,
  `lezerertek` int(10) NOT NULL,
  `meghajtoertek` int(10) NOT NULL,
  `generatorertek` int(10) NOT NULL,
  `burkolatslotszam` int(2) NOT NULL,
  `pajzsslotszam` int(2) NOT NULL,
  `lezerslotszam` int(2) NOT NULL,
  `meghajtoslotszam` int(2) NOT NULL,
  `generatorslotszam` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- A tábla adatainak kiíratása `targyak`
--

INSERT INTO `targyak` (`azonosito`, `kategoria`, `burkolatertek`, `pajzsertek`, `lezerertek`, `meghajtoertek`, `generatorertek`, `burkolatslotszam`, `pajzsslotszam`, `lezerslotszam`, `meghajtoslotszam`, `generatorslotszam`) VALUES
(1, 'bazis', 5, 5, 5, 5, 5, 1, 1, 1, 1, 1),
(2, 'bazis', 10, 10, 10, 10, 10, 2, 1, 1, 2, 1),
(3, 'bazis', 25, 25, 25, 25, 25, 2, 1, 3, 1, 2),
(4, 'bazis', 50, 50, 50, 50, 50, 2, 2, 2, 5, 3),
(5, 'bazis', 75, 75, 75, 75, 75, 4, 2, 1, 3, 5),
(6, 'bazis', 100, 100, 100, 100, 100, 1, 1, 1, 1, 1),
(7, 'bazis', 150, 150, 150, 150, 150, 1, 1, 1, 1, 1),
(8, 'bazis', 225, 225, 225, 225, 225, 1, 1, 1, 1, 1),
(9, 'bazis', 400, 400, 400, 400, 400, 1, 1, 1, 1, 1),
(10, 'bazis', 768, 768, 768, 768, 768, 5, 5, 5, 5, 5),
(11, 'burkolat', 5, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(12, 'burkolat', 10, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(13, 'burkolat', 25, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(14, 'burkolat', 50, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15, 'burkolat', 75, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(21, 'pajzs', 0, 5, 0, 0, 0, 0, 0, 0, 0, 0),
(22, 'pajzs', 0, 10, 0, 0, 0, 0, 0, 0, 0, 0),
(23, 'pajzs', 0, 25, 0, 0, 0, 0, 0, 0, 0, 0),
(24, 'pajzs', 0, 50, 0, 0, 0, 0, 0, 0, 0, 0),
(25, 'pajzs', 0, 75, 0, 0, 0, 0, 0, 0, 0, 0),
(31, 'lezer', 0, 0, 5, 0, 0, 0, 0, 0, 0, 0),
(32, 'lezer', 0, 0, 10, 0, 0, 0, 0, 0, 0, 0),
(33, 'lezer', 0, 0, 25, 0, 0, 0, 0, 0, 0, 0),
(34, 'lezer', 0, 0, 50, 0, 0, 0, 0, 0, 0, 0),
(35, 'lezer', 0, 0, 75, 0, 0, 0, 0, 0, 0, 0),
(41, 'meghajto', 0, 0, 0, 5, 0, 0, 0, 0, 0, 0),
(42, 'meghajto', 0, 0, 0, 10, 0, 0, 0, 0, 0, 0),
(43, 'meghajto', 0, 0, 0, 25, 0, 0, 0, 0, 0, 0),
(44, 'meghajto', 0, 0, 0, 50, 0, 0, 0, 0, 0, 0),
(45, 'meghajto', 0, 0, 0, 75, 0, 0, 0, 0, 0, 0),
(51, 'generator', 0, 0, 0, 0, 5, 0, 0, 0, 0, 0),
(52, 'generator', 0, 0, 0, 0, 10, 0, 0, 0, 0, 0),
(53, 'generator', 0, 0, 0, 0, 25, 0, 0, 0, 0, 0),
(54, 'generator', 0, 0, 0, 0, 50, 0, 0, 0, 0, 0),
(55, 'generator', 0, 0, 0, 0, 75, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `urhajok`
--

CREATE TABLE `urhajok` (
  `azonosito` int(3) NOT NULL,
  `nev` varchar(64) NOT NULL DEFAULT 'urhajo',
  `tipus` int(1) NOT NULL COMMENT '1=katonai;2=civil',
  `aktiv` tinyint(1) NOT NULL DEFAULT '0',
  `szintkorlat` int(4) NOT NULL DEFAULT '0',
  `e_ido` int(16) NOT NULL DEFAULT '0' COMMENT 'masodperc',
  `sz_iridium` int(16) NOT NULL DEFAULT '0',
  `sz_radon` int(16) NOT NULL DEFAULT '0',
  `sz_uran` int(16) NOT NULL DEFAULT '0',
  `sz_tantal` int(16) NOT NULL DEFAULT '0',
  `sz_palladium` int(16) NOT NULL DEFAULT '0',
  `kredit` int(16) NOT NULL DEFAULT '0',
  `terra` int(16) NOT NULL DEFAULT '0',
  `kep` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- A tábla adatainak kiíratása `urhajok`
--

INSERT INTO `urhajok` (`azonosito`, `nev`, `tipus`, `aktiv`, `szintkorlat`, `e_ido`, `sz_iridium`, `sz_radon`, `sz_uran`, `sz_tantal`, `sz_palladium`, `kredit`, `terra`, `kep`) VALUES
(1, 'urhajo_1', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '\'../img/urhajo_1.jpg\''),
(2, 'urhajo_2', 1, 1, 35, 0, 0, 0, 0, 0, 0, 0, 0, '\'../img/urhajo_2.jpg\''),
(3, 'urhajo_3', 1, 1, 40, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4, 'urhajo_4', 1, 1, 45, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(5, 'urhajo_5', 1, 1, 50, 0, 0, 0, 0, 0, 0, 0, 0, '');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `urlenyek`
--

CREATE TABLE `urlenyek` (
  `npcid` int(11) NOT NULL,
  `npcnev` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `elet` varchar(11) NOT NULL,
  `pajzs` varchar(11) NOT NULL,
  `sebzes` varchar(11) NOT NULL,
  `sebesseg` varchar(11) NOT NULL,
  `generator` varchar(11) NOT NULL,
  `tapasztalat` int(11) NOT NULL,
  `kredit` int(11) NOT NULL,
  `kep` varchar(256) NOT NULL,
  `leiras` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- A tábla adatainak kiíratása `urlenyek`
--

INSERT INTO `urlenyek` (`npcid`, `npcnev`, `elet`, `pajzs`, `sebzes`, `sebesseg`, `generator`, `tapasztalat`, `kredit`, `kep`, `leiras`) VALUES
(1, '&Ucirc;r f&eacute;reg', '2', '2.2', '2.4', '2.6', '2', 18, 35, '\'../img/npc_urfereg.jpg\'', '0'),
(2, 'V&aacute;ndor bakt&eacute;ri&uacute;m', '2.2', '2.6', '2', '2.2', '2.4', 10, 20, '\'../img/npc_bakterium.jpg\'', '0'),
(3, 'V&eacute;gzetes idegen', '2', '2.6', '2.2', '2.4', '2.2', 14, 30, '\'../img/npc_vegzetesidegen.jpg\'', '0'),
(4, 'Gravitowat', '2,8', '2', '2.6', '2', '2.4', 18, 35, '\'../img/npc_gravitowat.jpg\'', '0'),
(5, 'Roncsol&oacute; r&eacute;ms&eacute;g', '2', '2.2', '2.8', '3', '2.6', 22, 40, '\'../img/npc_roncsoloremseg.jpg\'', '0');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE `users` (
  `userid` int(30) NOT NULL,
  `username` varchar(25) COLLATE utf8_bin NOT NULL,
  `password` varchar(20) COLLATE utf8_bin NOT NULL,
  `email` varchar(50) COLLATE utf8_bin NOT NULL,
  `datum` date NOT NULL,
  `nemed` varchar(6) COLLATE utf8_bin NOT NULL,
  `tp` varchar(256) COLLATE utf8_bin NOT NULL DEFAULT 'a:2:{i:0;i:0;i:1;i:0;}',
  `tapasztalat` bigint(255) NOT NULL DEFAULT '0',
  `szint` int(11) NOT NULL DEFAULT '1',
  `nyersanyagok` varchar(256) COLLATE utf8_bin NOT NULL DEFAULT 'a:5:{i:0;i:20000;i:1;i:15000;i:2;i:10000;i:3;i:5000;i:4;i:0;}',
  `kredit` bigint(20) NOT NULL DEFAULT '5000',
  `terra` bigint(255) NOT NULL DEFAULT '1000',
  `pontszam` int(32) NOT NULL DEFAULT '0',
  `aktivbazis` int(20) NOT NULL DEFAULT '1',
  `szovetseg` varchar(256) COLLATE utf8_bin NOT NULL DEFAULT 'a:2:{i:0;i:0;i:1;i:0;}',
  `stattok` varchar(512) COLLATE utf8_bin NOT NULL DEFAULT 'a:10:{i:0;i:0;i:1;i:5;i:2;i:0;i:3;i:5;i:4;i:0;i:5;i:5;i:6;i:0;i:7;i:5;i:8;i:0;i:9;i:5;}',
  `megnyertp` bigint(20) NOT NULL DEFAULT '0',
  `elvesztettp` bigint(20) NOT NULL DEFAULT '0',
  `energia` int(2) NOT NULL DEFAULT '1000',
  `energiatermeles` datetime NOT NULL,
  `energiav` tinyint(1) NOT NULL DEFAULT '10',
  `faj` int(1) NOT NULL DEFAULT '0',
  `fejlesztesszint` int(11) NOT NULL DEFAULT '1',
  `urleny` varchar(256) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `kalozid` int(11) NOT NULL DEFAULT '1',
  `galaxy1` varchar(256) COLLATE utf8_bin NOT NULL DEFAULT 'a:3:{i:0;i:0;i:1;i:0;i:2;i:1;}',
  `galaxy2` varchar(256) COLLATE utf8_bin NOT NULL DEFAULT 'a:3:{i:0;i:0;i:1;i:0;i:2;i:1;}',
  `galaxy3` varchar(256) COLLATE utf8_bin NOT NULL DEFAULT 'a:3:{i:0;i:0;i:1;i:0;i:2;i:1;}',
  `galaxy4` varchar(256) COLLATE utf8_bin NOT NULL DEFAULT 'a:3:{i:0;i:0;i:1;i:0;i:2;i:1;}',
  `galaxy5` varchar(256) COLLATE utf8_bin NOT NULL DEFAULT 'a:3:{i:0;i:0;i:1;i:0;i:2;i:1;}',
  `galaxy6` varchar(256) COLLATE utf8_bin NOT NULL DEFAULT 'a:3:{i:0;i:0;i:1;i:0;i:2;i:1;}',
  `galaxy7` varchar(256) COLLATE utf8_bin NOT NULL DEFAULT 'a:3:{i:0;i:0;i:1;i:0;i:2;i:1;}',
  `galaxy8` varchar(256) COLLATE utf8_bin NOT NULL DEFAULT 'a:3:{i:0;i:0;i:1;i:0;i:2;i:1;}',
  `galaxy9` varchar(256) COLLATE utf8_bin NOT NULL DEFAULT 'a:3:{i:0;i:0;i:1;i:0;i:2;i:1;}',
  `galaxy10` varchar(256) COLLATE utf8_bin NOT NULL DEFAULT 'a:3:{i:0;i:0;i:1;i:0;i:2;i:1;}',
  `galaxylog` varchar(256) COLLATE utf8_bin NOT NULL DEFAULT 'a:6:{i:0;i:0;i:1;i:1;i:2;i:1;i:3;i:0;i:4;i:0;i:5;i:0;}',
  `porgeteslog` varchar(256) COLLATE utf8_bin NOT NULL DEFAULT 'a:5:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;}'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`userid`, `username`, `password`, `email`, `datum`, `nemed`, `tp`, `tapasztalat`, `szint`, `nyersanyagok`, `kredit`, `terra`, `pontszam`, `aktivbazis`, `szovetseg`, `stattok`, `megnyertp`, `elvesztettp`, `energia`, `energiatermeles`, `energiav`, `faj`, `fejlesztesszint`, `urleny`, `kalozid`, `galaxy1`, `galaxy2`, `galaxy3`, `galaxy4`, `galaxy5`, `galaxy6`, `galaxy7`, `galaxy8`, `galaxy9`, `galaxy10`, `galaxylog`, `porgeteslog`) VALUES
(1, 'magyari', '123', 'magyariotto@yahoo.com', '0000-00-00', '', 'a:2:{i:0;i:100;i:1;i:1000000;}', 0, 30, 'a:5:{i:0;i:100000;i:1;i:100000;i:2;i:100000;i:3;i:100000;i:4;i:100000;}', 432361036, 1000, 0, 4, 'a:2:{i:0;s:1:\"1\";i:1;i:1;}', 'a:10:{i:0;i:10;i:1;d:16;i:2;i:4;i:3;d:10;i:4;i:3;i:5;d:8;i:6;i:3;i:7;d:58;i:8;i:3;i:9;d:58;}', 1, 0, 1000, '0000-00-00 00:00:00', 10, 0, 24, '0', 1, 'a:3:{i:0;i:0;i:1;i:0;i:2;i:1;}', 'a:3:{i:0;i:0;i:1;i:0;i:2;i:1;}', 'a:3:{i:0;i:0;i:1;i:11;i:2;i:1;}', 'a:3:{i:0;i:0;i:1;i:885;i:2;i:1;}', 'a:3:{i:0;i:0;i:1;i:0;i:2;i:1;}', 'a:3:{i:0;i:0;i:1;i:0;i:2;i:1;}', 'a:3:{i:0;i:0;i:1;i:0;i:2;i:1;}', 'a:3:{i:0;i:0;i:1;i:0;i:2;i:1;}', 'a:3:{i:0;i:0;i:1;i:0;i:2;i:1;}', 'a:3:{i:0;i:0;i:1;i:0;i:2;i:1;}', 'a:6:{i:0;i:0;i:1;i:1;i:2;i:1;i:3;i:0;i:4;i:0;i:5;i:0;}', 'a:5:{i:0;i:1;i:1;i:100;i:2;i:-10000;i:3;i:5;i:4;i:375;}'),
(2, '123123', '123', 'magyariotto96@gmail.com', '0000-00-00', '', 'a:2:{i:0;d:105;i:1;d:105;}', 0, 1, 'a:5:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;}', 55005, 1000, 0, 1, 'a:2:{i:0;s:1:\"1\";i:1;i:6;}', 'a:10:{i:0;i:0;i:1;d:6;i:2;i:0;i:3;d:6;i:4;i:0;i:5;d:5;i:6;i:0;i:7;d:5;i:8;i:0;i:9;d:5;}', 0, 1, 1000, '0000-00-00 00:00:00', 10, 0, 1, '0', 1, 'a:3:{i:0;i:0;i:1;i:0;i:2;i:1;}', 'a:3:{i:0;i:0;i:1;i:0;i:2;i:1;}', 'a:3:{i:0;i:0;i:1;i:0;i:2;i:1;}', 'a:3:{i:0;i:0;i:1;i:0;i:2;i:1;}', 'a:3:{i:0;i:0;i:1;i:0;i:2;i:1;}', 'a:3:{i:0;i:0;i:1;i:0;i:2;i:1;}', 'a:3:{i:0;i:0;i:1;i:0;i:2;i:1;}', 'a:3:{i:0;i:0;i:1;i:0;i:2;i:1;}', 'a:3:{i:0;i:0;i:1;i:0;i:2;i:1;}', 'a:3:{i:0;i:0;i:1;i:0;i:2;i:1;}', 'a:6:{i:0;i:0;i:1;i:1;i:2;i:1;i:3;i:0;i:4;i:0;i:5;i:0;}', 'a:5:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;}'),
(3, 'qweqwe', 'qwe', 'qweqwe@qwe.qwe', '0000-00-00', '', 'a:2:{i:0;i:0;i:1;i:0;}', 0, 1, 'a:5:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;}', 5000, 1000, 0, 1, 'a:2:{i:0;i:0;i:1;i:0;}', 'a:10:{i:0;i:0;i:1;i:5;i:2;i:0;i:3;i:5;i:4;i:0;i:5;i:5;i:6;i:0;i:7;i:5;i:8;i:0;i:9;i:5;}', 0, 0, 1000, '0000-00-00 00:00:00', 10, 0, 1, '0', 1, 'a:3:{i:0;i:0;i:1;i:0;i:2;i:1;}', 'a:3:{i:0;i:0;i:1;i:0;i:2;i:1;}', 'a:3:{i:0;i:0;i:1;i:0;i:2;i:1;}', 'a:3:{i:0;i:0;i:1;i:0;i:2;i:1;}', 'a:3:{i:0;i:0;i:1;i:0;i:2;i:1;}', 'a:3:{i:0;i:0;i:1;i:0;i:2;i:1;}', 'a:3:{i:0;i:0;i:1;i:0;i:2;i:1;}', 'a:3:{i:0;i:0;i:1;i:0;i:2;i:1;}', 'a:3:{i:0;i:0;i:1;i:0;i:2;i:1;}', 'a:3:{i:0;i:0;i:1;i:0;i:2;i:1;}', 'a:6:{i:0;i:0;i:1;i:1;i:2;i:1;i:3;i:0;i:4;i:0;i:5;i:0;}', 'a:5:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;}'),
(4, 'azazaz', 'azaz', 'dsfdsf@fgsd.com', '0000-00-00', '', 'a:2:{i:0;i:0;i:1;i:0;}', 0, 1, 'a:5:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;}', 5000, 1000, 0, 1, 'a:2:{i:0;i:0;i:1;i:0;}', 'a:10:{i:0;i:0;i:1;i:5;i:2;i:0;i:3;i:5;i:4;i:0;i:5;i:5;i:6;i:0;i:7;i:5;i:8;i:0;i:9;i:5;}', 0, 0, 1000, '0000-00-00 00:00:00', 10, 0, 1, '0', 1, 'a:3:{i:0;i:0;i:1;i:0;i:2;i:1;}', 'a:3:{i:0;i:0;i:1;i:0;i:2;i:1;}', 'a:3:{i:0;i:0;i:1;i:0;i:2;i:1;}', 'a:3:{i:0;i:0;i:1;i:0;i:2;i:1;}', 'a:3:{i:0;i:0;i:1;i:0;i:2;i:1;}', 'a:3:{i:0;i:0;i:1;i:0;i:2;i:1;}', 'a:3:{i:0;i:0;i:1;i:0;i:2;i:1;}', 'a:3:{i:0;i:0;i:1;i:0;i:2;i:1;}', 'a:3:{i:0;i:0;i:1;i:0;i:2;i:1;}', 'a:3:{i:0;i:0;i:1;i:0;i:2;i:1;}', 'a:6:{i:0;i:0;i:1;i:1;i:2;i:1;i:3;i:0;i:4;i:0;i:5;i:0;}', 'a:5:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;}'),
(5, 'asasas', 'asas', 'dasasd@gasd.fsf', '0000-00-00', '', 'a:2:{i:0;i:0;i:1;i:0;}', 0, 1, 'a:5:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;}', 5000, 1000, 0, 1, 'a:2:{i:0;i:0;i:1;i:0;}', 'a:10:{i:0;i:0;i:1;i:5;i:2;i:0;i:3;i:5;i:4;i:0;i:5;i:5;i:6;i:0;i:7;i:5;i:8;i:0;i:9;i:5;}', 0, 0, 1000, '0000-00-00 00:00:00', 10, 0, 1, '0', 1, 'a:3:{i:0;i:0;i:1;i:0;i:2;i:1;}', 'a:3:{i:0;i:0;i:1;i:0;i:2;i:1;}', 'a:3:{i:0;i:0;i:1;i:0;i:2;i:1;}', 'a:3:{i:0;i:0;i:1;i:0;i:2;i:1;}', 'a:3:{i:0;i:0;i:1;i:0;i:2;i:1;}', 'a:3:{i:0;i:0;i:1;i:0;i:2;i:1;}', 'a:3:{i:0;i:0;i:1;i:0;i:2;i:1;}', 'a:3:{i:0;i:0;i:1;i:0;i:2;i:1;}', 'a:3:{i:0;i:0;i:1;i:0;i:2;i:1;}', 'a:3:{i:0;i:0;i:1;i:0;i:2;i:1;}', 'a:6:{i:0;i:0;i:1;i:1;i:2;i:1;i:3;i:0;i:4;i:0;i:5;i:0;}', 'a:5:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;}'),
(6, 'qqqqqq', 'qqqqqq', 'qqq@gmail.com', '0000-00-00', '', 'a:2:{i:0;i:0;i:1;i:0;}', 0, 1, 'a:5:{i:0;i:20000;i:1;i:15000;i:2;i:10000;i:3;i:5000;i:4;i:0;}', 5000, 1000, 0, 1, 'a:2:{i:0;i:0;i:1;i:0;}', 'a:10:{i:0;i:0;i:1;i:5;i:2;i:0;i:3;i:5;i:4;i:0;i:5;i:5;i:6;i:0;i:7;i:5;i:8;i:0;i:9;i:5;}', 0, 0, 1000, '0000-00-00 00:00:00', 10, 0, 1, '0', 1, 'a:3:{i:0;i:0;i:1;i:0;i:2;i:1;}', 'a:3:{i:0;i:0;i:1;i:0;i:2;i:1;}', 'a:3:{i:0;i:0;i:1;i:0;i:2;i:1;}', 'a:3:{i:0;i:0;i:1;i:0;i:2;i:1;}', 'a:3:{i:0;i:0;i:1;i:0;i:2;i:1;}', 'a:3:{i:0;i:0;i:1;i:0;i:2;i:1;}', 'a:3:{i:0;i:0;i:1;i:0;i:2;i:1;}', 'a:3:{i:0;i:0;i:1;i:0;i:2;i:1;}', 'a:3:{i:0;i:0;i:1;i:0;i:2;i:1;}', 'a:3:{i:0;i:0;i:1;i:0;i:2;i:1;}', 'a:6:{i:0;i:0;i:1;i:1;i:2;i:1;i:3;i:0;i:4;i:0;i:5;i:0;}', 'a:5:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;}'),
(7, 'sssss', 'sssss', 'ssss@sss.com', '0000-00-00', '', 'a:2:{i:0;i:0;i:1;i:0;}', 0, 1, 'a:5:{i:0;i:20000;i:1;i:15000;i:2;i:10000;i:3;i:5000;i:4;i:0;}', 5000, 1000, 0, 1, 'a:2:{i:0;i:0;i:1;i:0;}', 'a:10:{i:0;i:0;i:1;i:5;i:2;i:0;i:3;i:5;i:4;i:0;i:5;i:5;i:6;i:0;i:7;i:5;i:8;i:0;i:9;i:5;}', 0, 0, 1000, '0000-00-00 00:00:00', 10, 0, 1, '0', 1, 'a:3:{i:0;i:0;i:1;i:0;i:2;i:1;}', 'a:3:{i:0;i:0;i:1;i:0;i:2;i:1;}', 'a:3:{i:0;i:0;i:1;i:0;i:2;i:1;}', 'a:3:{i:0;i:0;i:1;i:0;i:2;i:1;}', 'a:3:{i:0;i:0;i:1;i:0;i:2;i:1;}', 'a:3:{i:0;i:0;i:1;i:0;i:2;i:1;}', 'a:3:{i:0;i:0;i:1;i:0;i:2;i:1;}', 'a:3:{i:0;i:0;i:1;i:0;i:2;i:1;}', 'a:3:{i:0;i:0;i:1;i:0;i:2;i:1;}', 'a:3:{i:0;i:0;i:1;i:0;i:2;i:1;}', 'a:6:{i:0;i:0;i:1;i:1;i:2;i:1;i:3;i:0;i:4;i:0;i:5;i:0;}', 'a:5:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;}');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `uzenetek`
--

CREATE TABLE `uzenetek` (
  `id` int(30) NOT NULL,
  `felado` varchar(50) COLLATE utf8_bin NOT NULL,
  `cimzett` varchar(50) COLLATE utf8_bin NOT NULL,
  `targy` varchar(50) COLLATE utf8_bin NOT NULL,
  `uzenet` text COLLATE utf8_bin NOT NULL,
  `ido` text COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `uzlet`
--

CREATE TABLE `uzlet` (
  `azonosito` int(3) NOT NULL,
  `kategoria` varchar(256) NOT NULL,
  `megnevezes` varchar(256) NOT NULL,
  `mennyiseg` int(20) NOT NULL,
  `ara` int(20) NOT NULL,
  `penznem` varchar(256) NOT NULL,
  `szintkorlat` int(5) NOT NULL,
  `aktiv` tinyint(1) NOT NULL DEFAULT '0',
  `kep` varchar(256) NOT NULL,
  `eladasiar` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- A tábla adatainak kiíratása `uzlet`
--

INSERT INTO `uzlet` (`azonosito`, `kategoria`, `megnevezes`, `mennyiseg`, `ara`, `penznem`, `szintkorlat`, `aktiv`, `kep`, `eladasiar`) VALUES
(1, 'bazis', 'bazis_1', 1, 5000, 'kredit', 0, 1, '', 1000),
(2, 'bazis', 'bazis_2', 1, 25000, 'kredit', 5, 1, '', 5000),
(3, 'bazis', 'bazis_3', 1, 100000, 'kredit', 20, 1, '', 20000),
(4, 'bazis', 'bazis_4', 1, 200000, 'kredit', 30, 1, '', 50000),
(5, 'bazis', 'bazis_5', 1, 500000, 'kredit', 50, 1, '', 100000),
(6, 'bazis', 'bazis_6', 1, 2000000, 'kredit', 75, 1, '', 300000),
(7, 'bazis', 'bazis_7', 1, 5000000, 'kredit', 100, 1, '', 750000),
(8, 'bazis', 'bazis_8', 1, 20000000, 'kredit', 150, 1, '', 2500000),
(9, 'bazis', 'bazis_9', 1, 50000000, 'kredit', 225, 1, '', 10000000),
(10, 'bazis', 'bazis_10', 1, 250000000, 'kredit', 300, 1, '', 33750000),
(11, 'burkolat', 'burkolat1', 1, 7500, 'kredit', 0, 1, '', 1000),
(12, 'burkolat', 'burkolat2', 1, 20000, 'kredit', 5, 1, '', 0),
(13, 'burkolat', 'burkolat3', 1, 50000, 'kredit', 10, 1, '', 0),
(14, 'burkolat', 'burkolat4', 1, 100000, 'kredit', 25, 1, '', 0),
(15, 'burkolat', 'burkolat5', 1, 200000, 'kredit', 50, 1, '', 0),
(21, 'pajzs', 'pajzs1', 1, 5000, 'kredit', 0, 1, '', 0),
(22, 'pajzs', 'pajzs2', 1, 15000, 'kredit', 5, 1, '', 0),
(23, 'pajzs', 'pajzs3', 1, 50000, 'kredit', 15, 1, '', 0),
(24, 'pajzs', 'pajzs4', 1, 90000, 'kredit', 25, 1, '', 0),
(25, 'pajzs', 'pajzs5', 1, 170000, 'kredit', 40, 1, '', 0),
(31, 'lezer', 'lezer1', 1, 5000, 'kredit', 0, 1, '', 0),
(32, 'lezer', 'lezer2', 1, 10000, 'kredit', 5, 1, '', 0),
(33, 'lezer', 'lezer3', 1, 40000, 'kredit', 15, 1, '', 0),
(34, 'lezer', 'lezer4', 1, 100000, 'kredit', 30, 1, '', 0),
(35, 'lezer', 'lezer5', 1, 175000, 'kredit', 50, 1, '', 0),
(41, 'meghajto', 'meghajto1', 1, 10000, 'kredit', 0, 1, '', 0),
(42, 'meghajto', 'meghajto2', 1, 20000, 'kredit', 5, 1, '', 0),
(43, 'meghajto', 'meghajto3', 1, 50000, 'kredit', 15, 1, '', 0),
(44, 'meghajto', 'meghajto4', 1, 100000, 'kredit', 35, 1, '', 0),
(45, 'meghajto', 'meghajto5', 1, 150000, 'kredit', 45, 1, '', 0),
(51, 'generator', 'generator', 1, 50000, 'kredit', 0, 1, '', 0),
(52, 'generator', 'generator', 1, 15000, 'kredit', 5, 1, '', 0),
(53, 'generator', 'generator', 1, 30000, 'kredit', 10, 1, '', 0),
(54, 'generator', 'generator', 1, 100000, 'kredit', 25, 1, '', 0),
(55, 'generator', 'generator', 1, 225000, 'kredit', 50, 1, '', 0);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `banyak`
--
ALTER TABLE `banyak`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- A tábla indexei `epuleteim`
--
ALTER TABLE `epuleteim`
  ADD PRIMARY KEY (`userid`),
  ADD UNIQUE KEY `userid` (`userid`);

--
-- A tábla indexei `epuletek`
--
ALTER TABLE `epuletek`
  ADD PRIMARY KEY (`azonosito`),
  ADD UNIQUE KEY `azonosito` (`azonosito`);

--
-- A tábla indexei `felszerelesem`
--
ALTER TABLE `felszerelesem`
  ADD PRIMARY KEY (`userid`),
  ADD UNIQUE KEY `userid` (`userid`);

--
-- A tábla indexei `galaxy`
--
ALTER TABLE `galaxy`
  ADD PRIMARY KEY (`galaxisid`);

--
-- A tábla indexei `jutalom_parbaj`
--
ALTER TABLE `jutalom_parbaj`
  ADD PRIMARY KEY (`szint`);

--
-- A tábla indexei `kalozok`
--
ALTER TABLE `kalozok`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `munka`
--
ALTER TABLE `munka`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- A tábla indexei `munkahelyek`
--
ALTER TABLE `munkahelyek`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- A tábla indexei `nyersanyagtermeles`
--
ALTER TABLE `nyersanyagtermeles`
  ADD PRIMARY KEY (`userid`),
  ADD UNIQUE KEY `userid` (`userid`);

--
-- A tábla indexei `szintek`
--
ALTER TABLE `szintek`
  ADD PRIMARY KEY (`szint`),
  ADD UNIQUE KEY `szint` (`szint`);

--
-- A tábla indexei `szovetseg`
--
ALTER TABLE `szovetseg`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- A tábla indexei `szovetsegrangok`
--
ALTER TABLE `szovetsegrangok`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `targyaim`
--
ALTER TABLE `targyaim`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- A tábla indexei `targyak`
--
ALTER TABLE `targyak`
  ADD PRIMARY KEY (`azonosito`),
  ADD UNIQUE KEY `azonosito` (`azonosito`);

--
-- A tábla indexei `urhajok`
--
ALTER TABLE `urhajok`
  ADD PRIMARY KEY (`azonosito`),
  ADD UNIQUE KEY `azonosito` (`azonosito`);

--
-- A tábla indexei `urlenyek`
--
ALTER TABLE `urlenyek`
  ADD PRIMARY KEY (`npcid`);

--
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userid`),
  ADD UNIQUE KEY `username_2` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- A tábla indexei `uzenetek`
--
ALTER TABLE `uzenetek`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `uzlet`
--
ALTER TABLE `uzlet`
  ADD PRIMARY KEY (`azonosito`),
  ADD UNIQUE KEY `azonosito` (`azonosito`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `banyak`
--
ALTER TABLE `banyak`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT a táblához `epuleteim`
--
ALTER TABLE `epuleteim`
  MODIFY `userid` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT a táblához `epuletek`
--
ALTER TABLE `epuletek`
  MODIFY `azonosito` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT a táblához `felszerelesem`
--
ALTER TABLE `felszerelesem`
  MODIFY `userid` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT a táblához `galaxy`
--
ALTER TABLE `galaxy`
  MODIFY `galaxisid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT a táblához `jutalom_parbaj`
--
ALTER TABLE `jutalom_parbaj`
  MODIFY `szint` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT a táblához `kalozok`
--
ALTER TABLE `kalozok`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT a táblához `munka`
--
ALTER TABLE `munka`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT a táblához `nyersanyagtermeles`
--
ALTER TABLE `nyersanyagtermeles`
  MODIFY `userid` int(64) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT a táblához `szovetseg`
--
ALTER TABLE `szovetseg`
  MODIFY `id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT a táblához `szovetsegrangok`
--
ALTER TABLE `szovetsegrangok`
  MODIFY `id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT a táblához `targyaim`
--
ALTER TABLE `targyaim`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT a táblához `targyak`
--
ALTER TABLE `targyak`
  MODIFY `azonosito` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT a táblához `urhajok`
--
ALTER TABLE `urhajok`
  MODIFY `azonosito` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT a táblához `urlenyek`
--
ALTER TABLE `urlenyek`
  MODIFY `npcid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `userid` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT a táblához `uzenetek`
--
ALTER TABLE `uzenetek`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `uzlet`
--
ALTER TABLE `uzlet`
  MODIFY `azonosito` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
