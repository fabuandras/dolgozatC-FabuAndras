-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Ápr 08. 13:01
-- Kiszolgáló verziója: 10.4.28-MariaDB
-- PHP verzió: 8.2.4

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `tagsag`
--
CREATE DATABASE IF NOT EXISTS `tagsag` DEFAULT CHARACTER SET utf8 COLLATE utf8_hungarian_ci;
USE `tagsag`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `felhasznalo`
--

DROP TABLE IF EXISTS `felhasznalo`;
CREATE TABLE IF NOT EXISTS `felhasznalo` (
  `felhAzon` int(11) NOT NULL AUTO_INCREMENT,
  `nev` varchar(30) NOT NULL,
  `jogosultsag` int(11) NOT NULL,
  `email` varchar(30) NOT NULL,
  PRIMARY KEY (`felhAzon`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `felhasznalo`
--

INSERT INTO `felhasznalo` (`felhAzon`, `nev`, `jogosultsag`, `email`) VALUES
(5, 'Nagy Tibor', 125, 'nagy.tibor@gmail.com'),
(7, 'Szabó Klára', 126, 'szabo.klara@gmail.com'),
(8, 'Kovács Tóbiás', 127, 'kovacs.tobias@gmail.com'),
(9, 'Hofi Géza', 128, 'hofi.geza@gmail.com');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `klub`
--

DROP TABLE IF EXISTS `klub`;
CREATE TABLE IF NOT EXISTS `klub` (
  `klubAzon` int(11) NOT NULL AUTO_INCREMENT,
  `nev` varchar(30) NOT NULL,
  `datum` int(11) NOT NULL,
  `hely` varchar(30) NOT NULL,
  `maxMeret` int(11) NOT NULL,
  PRIMARY KEY (`klubAzon`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `klub`
--

INSERT INTO `klub` (`klubAzon`, `nev`, `datum`, `hely`, `maxMeret`) VALUES
(1, 'Nagy Tibor', 2019, 'Budapest', 20),
(2, 'Szabó Klára', 2020, 'Dunakeszi', 21),
(3, 'Kovács Tóbiás', 2021, 'Göd', 22),
(4, 'Hofi Géza', 2022, 'Vác', 23);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `tag`
--

DROP TABLE IF EXISTS `tag`;
CREATE TABLE IF NOT EXISTS `tag` (
  `klubAzon` int(11) NOT NULL,
  `felhAzon` int(11) NOT NULL,
  `pozicio` int(11) NOT NULL,
  PRIMARY KEY (`klubAzon`,`felhAzon`),
  KEY `felhAzon` (`felhAzon`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `tag`
--

INSERT INTO `tag` (`klubAzon`, `felhAzon`, `pozicio`) VALUES
(1, 5, 1),
(2, 7, 2),
(3, 8, 3),
(4, 9, 4);

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `tag`
--
ALTER TABLE `tag`
  ADD CONSTRAINT `tag_ibfk_1` FOREIGN KEY (`felhAzon`) REFERENCES `felhasznalo` (`felhAzon`),
  ADD CONSTRAINT `tag_ibfk_2` FOREIGN KEY (`klubAzon`) REFERENCES `klub` (`klubAzon`);
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
