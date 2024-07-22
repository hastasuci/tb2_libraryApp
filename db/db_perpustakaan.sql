-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 14, 2024 at 12:35 AM
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
-- Database: `db_perpustakaan`
--

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `id` int(11) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `penulis` varchar(255) NOT NULL,
  `penerbit` varchar(255) DEFAULT NULL,
  `tahun_terbit` int(11) DEFAULT NULL,
  `konten` text DEFAULT NULL,
  `iktisar` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`id`, `judul`, `penulis`, `penerbit`, `tahun_terbit`, `konten`, `iktisar`) VALUES
(1, 'SQL for Beginner', 'Dwi Nugroho', 'Penerbit Erlangga', 2023, '[\"Pendahuluan\", \"Bab 1: Dasar-Dasar SQL\", \"Bab 2: Perintah DML\", \"Bab 3: Perintah DDL\", \"Kesimpulan\"]', 'Buku ini menjelaskan dasar-dasar SQL dan cara penggunaannya dengan contoh yang mudah dipahami.'),
(2, 'Basic Python Programming', 'Alamsyah', 'Penerbit Hikari', 2022, '[\"Bab 1: Pengantar Python\", \"Bab 2: Tipe Data\", \"Bab 3: Kontrol Alur\", \"Bab 4: Fungsi\", \"Bab 5: Modul dan Paket\", \"Bab 6: OOP\"]', 'Buku ini memberikan panduan lengkap tentang pemrograman Python, mulai dari dasar hingga konsep OOP, disertai dengan contoh-contoh kode.'),
(3, 'Data Structure', 'Susilowati', 'Penerbit Gajayana', 2021, '[\"Pendahuluan\", \"Bab 1: Algoritma\", \"Bab 2: Struktur Data\", \"Bab 3: Array\", \"Bab 4: Linked List\", \"Bab 5: Stack dan Queue\", \"Bab 6: Tree\", \"Bab 7: Graph\"]', 'Buku ini membahas berbagai algoritma dan struktur data yang umum digunakan dalam pemrograman, dengan penjelasan dan contoh yang detail.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `buku`
--
ALTER TABLE `buku`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
