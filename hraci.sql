-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hostiteľ: 127.0.0.1
-- Čas generovania: Št 18.Máj 2023, 05:36
-- Verzia serveru: 10.4.28-MariaDB
-- Verzia PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáza: `hraci`
--

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `hraci`
--

CREATE TABLE `hraci` (
  `id` int(11) NOT NULL,
  `meno` varchar(15) NOT NULL,
  `priezvisko` varchar(20) NOT NULL,
  `odohrane_zapasy` int(11) NOT NULL,
  `pocet_golov` int(11) NOT NULL,
  `pocet_asistencii` int(11) NOT NULL,
  `rocnik` int(11) NOT NULL,
  `pozicia` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Sťahujem dáta pre tabuľku `hraci`
--

INSERT INTO `hraci` (`id`, `meno`, `priezvisko`, `odohrane_zapasy`, `pocet_golov`, `pocet_asistencii`, `rocnik`, `pozicia`) VALUES
(26, 'martin', 'Ballay', 10, 18, 12, 2002, '3');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `pozicia`
--

CREATE TABLE `pozicia` (
  `id` int(11) NOT NULL,
  `nazov` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Sťahujem dáta pre tabuľku `pozicia`
--

INSERT INTO `pozicia` (`id`, `nazov`) VALUES
(1, 'Brankár'),
(2, 'Obranca'),
(3, 'Útočník');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `uzivatelia`
--

CREATE TABLE `uzivatelia` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `heslo` varchar(255) NOT NULL,
  `cas` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `administrator` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Sťahujem dáta pre tabuľku `uzivatelia`
--

INSERT INTO `uzivatelia` (`id`, `username`, `heslo`, `cas`, `administrator`) VALUES
(1, 'admin', '$2y$10$RQFcJADk2fbMUoTlCCwGXODGpkiKnKAcMTb4ps.pGSvrfUuFcE6ny', '2023-05-18 02:28:47', 'Áno'),
(9, 'Jano', '$2y$10$lG2uO2CGswskuVIGal5r8uFNsHZq.WNKKLhceMvnr85Pp5owBRya2', '2023-05-18 03:19:53', 'Nie');

--
-- Kľúče pre exportované tabuľky
--

--
-- Indexy pre tabuľku `hraci`
--
ALTER TABLE `hraci`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pre tabuľku `pozicia`
--
ALTER TABLE `pozicia`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pre tabuľku `uzivatelia`
--
ALTER TABLE `uzivatelia`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pre exportované tabuľky
--

--
-- AUTO_INCREMENT pre tabuľku `hraci`
--
ALTER TABLE `hraci`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT pre tabuľku `pozicia`
--
ALTER TABLE `pozicia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pre tabuľku `uzivatelia`
--
ALTER TABLE `uzivatelia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
