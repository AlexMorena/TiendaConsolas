-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 13, 2025 at 12:08 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tienda`
--

-- --------------------------------------------------------

--
-- Table structure for table `consolas`
--

CREATE TABLE `consolas` (
  `Potencia_CPU` varchar(15) NOT NULL,
  `Potencia_GPU` varchar(15) NOT NULL,
  `Compañia` varchar(30) NOT NULL,
  `Precio` decimal(10,0) NOT NULL,
  `Unidades_Disponibles` int(11) NOT NULL,
  `ID_Consola` int(11) NOT NULL,
  `Nombre_Consola` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `consolas`
--

INSERT INTO `consolas` (`Potencia_CPU`, `Potencia_GPU`, `Compañia`, `Precio`, `Unidades_Disponibles`, `ID_Consola`, `Nombre_Consola`) VALUES
('1.75 TFLOPS', '1.75 TFLOPS', 'Microsoft', 500, 197, 1, 'Xbox_One'),
('12.0 TFLOPS', '12.0 TFLOPS', 'Microsoft', 800, 149, 2, 'Xbox_SeriesX'),
('4.0 TFLOPS', '4.0 TFLOPS', 'Microsoft', 300, 300, 3, 'Xbox_Series_S'),
('1.0 TFLOPS', '1.0 TFLOPS', 'Nintendo', 350, 500, 4, 'Nintendo_Switch'),
('0.5 TFLOPS', '0.5 TFLOPS', 'Nintendo', 200, 450, 5, 'Nintendo_Switch_Lite'),
('1500 FLOPS', '1200 FLOPS', 'Lego', 20, 200, 6, 'PS4'),
('10.28 TFLOPS', '10.28 TFLOPS', 'Sony', 500, 100, 7, 'PS5_con_CD'),
('10.28 TFLOPS', '10.28 TFLOPS', 'Sony', 400, 119, 8, 'PS5_sin_CD');

-- --------------------------------------------------------

--
-- Table structure for table `consolas_juegos`
--

CREATE TABLE `consolas_juegos` (
  `Generacion` varchar(30) DEFAULT NULL,
  `ID_Consola` int(11) NOT NULL,
  `ID_Juegos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `consolas_juegos`
--

INSERT INTO `consolas_juegos` (`Generacion`, `ID_Consola`, `ID_Juegos`) VALUES
('8th Generation', 1, 21),
('8th Generation', 1, 22),
('8th Generation', 1, 23),
('8th Generation', 1, 24),
('8th Generation', 1, 25),
('8th Generation', 1, 26),
('8th Generation', 1, 27),
('8th Generation', 1, 28),
('8th Generation', 1, 29),
('8th Generation', 1, 30),
('9th Generation', 2, 31),
('9th Generation', 2, 32),
('9th Generation', 2, 33),
('9th Generation', 2, 34),
('9th Generation', 2, 35),
('9th Generation', 2, 36),
('9th Generation', 2, 37),
('9th Generation', 2, 38),
('9th Generation', 2, 39),
('9th Generation', 2, 40),
('9th Generation', 3, 41),
('9th Generation', 3, 42),
('9th Generation', 3, 43),
('9th Generation', 3, 44),
('9th Generation', 3, 45),
('9th Generation', 3, 46),
('9th Generation', 3, 47),
('9th Generation', 3, 48),
('9th Generation', 3, 49),
('9th Generation', 3, 50),
('8th Generation', 4, 51),
('8th Generation', 4, 53),
('8th Generation', 4, 54),
('8th Generation', 4, 55),
('8th Generation', 4, 56),
('8th Generation', 4, 57),
('8th Generation', 4, 58),
('8th Generation', 4, 59),
('8th Generation', 4, 60),
('8th Generation', 5, 51),
('8th Generation', 5, 53),
('8th Generation', 5, 54),
('8th Generation', 5, 55),
('8th Generation', 5, 56),
('8th Generation', 5, 57),
('8th Generation', 5, 58),
('8th Generation', 5, 59),
('8th Generation', 5, 60),
('8th Generation', 6, 11),
('8th Generation', 6, 12),
('8th Generation', 6, 13),
('8th Generation', 6, 14),
('8th Generation', 6, 15),
('8th Generation', 6, 16),
('8th Generation', 6, 17),
('8th Generation', 6, 18),
('8th Generation', 6, 19),
('8th Generation', 6, 20),
('9th Generation', 7, 1),
('9th Generation', 7, 2),
('9th Generation', 7, 3),
('9th Generation', 7, 4),
('9th Generation', 7, 5),
('9th Generation', 7, 6),
('9th Generation', 7, 8),
('9th Generation', 7, 9),
('9th Generation', 7, 10),
('9th Generation', 8, 1),
('9th Generation', 8, 2),
('9th Generation', 8, 3),
('9th Generation', 8, 4),
('9th Generation', 8, 5),
('9th Generation', 8, 6),
('9th Generation', 8, 8),
('9th Generation', 8, 9),
('9th Generation', 8, 10);

-- --------------------------------------------------------

--
-- Table structure for table `juegos`
--

CREATE TABLE `juegos` (
  `Nombre_Juego` varchar(60) NOT NULL,
  `Nombre_Consola` varchar(30) NOT NULL,
  `Compañia_Desarrolladora` varchar(50) NOT NULL,
  `Genero_Juego` varchar(50) NOT NULL,
  `Punt_Metacritic` int(11) NOT NULL,
  `Precio` decimal(10,0) NOT NULL,
  `Unidades_Disponibles` int(11) NOT NULL,
  `ID_Juego` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `juegos`
--

INSERT INTO `juegos` (`Nombre_Juego`, `Nombre_Consola`, `Compañia_Desarrolladora`, `Genero_Juego`, `Punt_Metacritic`, `Precio`, `Unidades_Disponibles`, `ID_Juego`) VALUES
('FIFA 22', 'PS5 CON Y SIN CD', 'EA Sports', 'Deportes', 87, 60, 497, 1),
('Spider-Man: Miles Morales', 'PS5 CON Y SIN CD', 'Insomniac Games', 'Acción', 89, 50, 300, 2),
('Demon\'s Souls', 'PS5 CON Y SIN CD', 'Bluepoint Games', 'RPG', 92, 70, 250, 3),
('Horizon Forbidden West', 'PS5 CON Y SIN CD', 'Guerrilla Games', 'Aventura', 88, 70, 400, 4),
('Ratchet & Clank: Rift Apart', 'PS5 CON Y SIN CD', 'Insomniac Games', 'Plataformas', 89, 60, 299, 5),
('GTA', 'SuperMarvel', 'Rockstar', 'Accion', 10, 60, 200, 6),
('The Last of Us Part I', 'PS5 CON Y SIN CD', 'Naughty Dog', 'Acción', 93, 70, 500, 8),
('Final Fantasy XVI', 'PS5 CON Y SIN CD', 'Square Enix', 'RPG', 90, 80, 600, 9),
('Resident Evil 4 Remake', 'PS5 CON Y SIN CD', 'Capcom', 'Horror', 91, 60, 399, 10),
('FIFA 22', 'PS4', 'EA Sports', 'Deportes', 85, 40, 699, 11),
('The Last of Us Part II', 'PS4', 'Naughty Dog', 'Acción', 93, 60, 400, 12),
('God of War', 'PS4', 'Santa Monica Studio', 'Acción', 94, 40, 500, 13),
('Uncharted 4', 'PS4', 'Naughty Dog', 'Acción', 91, 30, 300, 14),
('Bloodborne', 'PS4', 'FromSoftware', 'RPG', 92, 20, 600, 15),
('Persona 5 Royal', 'PS4', 'Atlus', 'RPG', 95, 50, 400, 16),
('Red Dead Redemption 2', 'PS4', 'Rockstar Games', 'Aventura', 97, 60, 500, 17),
('Spider-Man', 'PS4', 'Insomniac Games', 'Acción', 87, 40, 400, 18),
('Sekiro: Shadows Die Twice', 'PS4', 'FromSoftware', 'Acción', 90, 40, 300, 19),
('Nier: Automata', 'PS4', 'PlatinumGames', 'RPG', 91, 40, 200, 20),
('Halo Infinite', 'Xbox One', '343 Industries', 'FPS', 87, 60, 398, 21),
('Forza Horizon 5', 'Xbox One', 'Playground Games', 'Carreras', 92, 60, 350, 22),
('Gears 5', 'Xbox One', 'The Coalition', 'Acción', 85, 40, 300, 23),
('Sea of Thieves', 'Xbox One', 'Rare', 'Aventura', 88, 50, 200, 24),
('The Outer Worlds', 'Xbox One', 'Obsidian Entertainment', 'RPG', 86, 60, 150, 25),
('Psychonauts 2', 'Xbox One', 'Double Fine', 'Plataformas', 89, 40, 300, 26),
('Starfield', 'Xbox One', 'Bethesda', 'RPG', 88, 70, 500, 27),
('Elden Ring', 'Xbox One', 'FromSoftware', 'RPG', 96, 60, 300, 28),
('Resident Evil Village', 'Xbox One', 'Capcom', 'Horror', 84, 60, 400, 29),
('Cyberpunk 2077', 'Xbox One', 'CD Projekt Red', 'RPG', 86, 60, 250, 30),
('Halo Infinite', 'Xbox Series X', '343 Industries', 'FPS', 87, 60, 400, 31),
('Forza Horizon 5', 'Xbox Series X', 'Playground Games', 'Carreras', 92, 60, 350, 32),
('Gears 5', 'Xbox Series X', 'The Coalition', 'Acción', 85, 40, 300, 33),
('Sea of Thieves', 'Xbox Series X', 'Rare', 'Aventura', 88, 50, 200, 34),
('The Outer Worlds', 'Xbox Series X', 'Obsidian Entertainment', 'RPG', 86, 60, 150, 35),
('Psychonauts 2', 'Xbox Series X', 'Double Fine', 'Plataformas', 89, 40, 300, 36),
('Starfield', 'Xbox Series X', 'Bethesda', 'RPG', 88, 70, 500, 37),
('Elden Ring', 'Xbox Series X', 'FromSoftware', 'RPG', 96, 60, 300, 38),
('Resident Evil Village', 'Xbox Series X', 'Capcom', 'Horror', 84, 60, 400, 39),
('Cyberpunk 2077', 'Xbox Series X', 'CD Projekt Red', 'RPG', 86, 60, 250, 40),
('Halo Infinite', 'Xbox Series S', '343 Industries', 'FPS', 87, 60, 399, 41),
('Forza Horizon 5', 'Xbox Series S', 'Playground Games', 'Carreras', 92, 60, 350, 42),
('Gears 5', 'Xbox Series S', 'The Coalition', 'Acción', 85, 40, 300, 43),
('Sea of Thieves', 'Xbox Series S', 'Rare', 'Aventura', 88, 50, 200, 44),
('The Outer Worlds', 'Xbox Series S', 'Obsidian Entertainment', 'RPG', 86, 60, 150, 45),
('Psychonauts 2', 'Xbox Series S', 'Double Fine', 'Plataformas', 89, 40, 300, 46),
('Starfield', 'Xbox Series S', 'Bethesda', 'RPG', 88, 70, 500, 47),
('Elden Ring', 'Xbox Series S', 'FromSoftware', 'RPG', 96, 60, 300, 48),
('Resident Evil Village', 'Xbox Series S', 'Capcom', 'Horror', 84, 60, 400, 49),
('Cyberpunk 2077', 'Xbox Series S', 'CD Projekt Red', 'RPG', 86, 60, 250, 50),
('The Legend of Zelda: Breath of the Wild', 'Nintendo Switch & Switch Lite', 'Nintendo', 'Aventura', 97, 60, 800, 51),
('Animal Crossing: New Horizons', 'Nintendo Switch & Switch Lite', 'Nintendo', 'Simulación', 90, 60, 700, 53),
('Super Smash Bros. Ultimate', 'Nintendo Switch & Switch Lite', 'Nintendo', 'Lucha', 93, 60, 750, 54),
('Splatoon 3', 'Nintendo Switch & Switch Lite', 'Nintendo', 'Acción', 88, 60, 600, 55),
('Metroid Dread', 'Nintendo Switch & Switch Lite', 'MercurySteam', 'Acción', 89, 60, 500, 56),
('Fire Emblem: Three Houses', 'Nintendo Switch & Switch Lite', 'Intelligent Systems', 'RPG', 89, 50, 400, 57),
('Pokemon Escarlata', 'Nintendo Switch & Switch Lite', 'GameFreak', 'RPG', 89, 50, 100, 58),
('Bayonetta 3', 'Nintendo Switch & Switch Lite', 'PlatinumGames', 'Acción', 87, 60, 500, 59),
('Luigi\'s Mansion 3', 'Nintendo Switch & Switch Lite', 'Next Level Games', 'Aventura', 86, 50, 450, 60);

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `nombre_usuario` varchar(20) NOT NULL,
  `es_administrador` tinyint(1) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`nombre_usuario`, `es_administrador`, `password`) VALUES
('administrador', 1, '1234'),
('alex', 0, '1234');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `consolas`
--
ALTER TABLE `consolas`
  ADD PRIMARY KEY (`ID_Consola`);

--
-- Indexes for table `consolas_juegos`
--
ALTER TABLE `consolas_juegos`
  ADD PRIMARY KEY (`ID_Consola`,`ID_Juegos`),
  ADD KEY `ID_Juegos` (`ID_Juegos`);

--
-- Indexes for table `juegos`
--
ALTER TABLE `juegos`
  ADD PRIMARY KEY (`ID_Juego`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`nombre_usuario`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `consolas`
--
ALTER TABLE `consolas`
  MODIFY `ID_Consola` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `juegos`
--
ALTER TABLE `juegos`
  MODIFY `ID_Juego` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `consolas_juegos`
--
ALTER TABLE `consolas_juegos`
  ADD CONSTRAINT `consolas_juegos_ibfk_1` FOREIGN KEY (`ID_Consola`) REFERENCES `consolas` (`ID_Consola`),
  ADD CONSTRAINT `consolas_juegos_ibfk_2` FOREIGN KEY (`ID_Juegos`) REFERENCES `juegos` (`ID_Juego`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
