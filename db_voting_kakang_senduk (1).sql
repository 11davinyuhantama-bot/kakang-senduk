-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 12 Nov 2026 pada 07.16
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_voting_kakang_senduk`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `kontestan`
--

CREATE TABLE `kontestan` (
  `id` int(11) NOT NULL,
  `nomor_peserta` varchar(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `kategori` enum('Kakang','Senduk') NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `tempat_lahir` varchar(100) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `asal_instansi` varchar(150) DEFAULT NULL,
  `visi` text DEFAULT NULL,
  `misi` text DEFAULT NULL,
  `prestasi` text DEFAULT NULL,
  `deskripsi` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kontestan`
--

INSERT INTO `kontestan` (`id`, `nomor_peserta`, `nama`, `kategori`, `foto`, `tempat_lahir`, `tanggal_lahir`, `asal_instansi`, `visi`, `misi`, `prestasi`, `deskripsi`) VALUES
(1, '20', 'Fahriya', 'Senduk', 'uploads/749a75b1d8bf08090137f58d32ed76c3.jpg', 'Ponorogo', '2026-11-12', 'SMK PGRI 2 Ponorogo', 'sukses', 'mandiri', 'Senduk Sterida', 'Menjadi lebih baik'),
(2, '18', 'Kayla', 'Senduk', 'uploads/images (5).jpg', 'Ponorogo', '2026-11-12', 'SMAN 1 Balong', 'Bangkit', 'Mandiri', 'Ngaji', 'Ibadah adalah kewajiban'),
(3, '08', 'Sandy', 'Senduk', 'uploads/images (3).jpg', 'Ponorogo', '2008-01-11', 'SMAN 1 Pulung', 'Kita', 'Bisa', 'Bisa;lah', 'bEN'),
(4, '09', 'Viko', 'Kakang', 'uploads/contestant-9-dbf0332c3af626a2.jpg', 'Ponorogo', '2007-02-11', 'SMAN 3 Balong', 'Maju', 'Mundur', 'Juara Ngaji', 'Beriman'),
(5, '13', 'Moreno', 'Kakang', 'uploads/images (2).jpg', 'Ponorogo', '2003-02-11', 'SMAN 2 Balong', 'Ben', 'YowesBen', 'Presentasi', 'Juara Presentasi'),
(6, '01', 'Fahrizal', 'Kakang', 'uploads/images.jpg', 'Ponorogo', '2006-02-11', 'SMAN 4 BALONG', 'Berdiri', 'Mandiri', 'Juara', 'Mbeluo');

-- --------------------------------------------------------

--
-- Struktur dari tabel `periode_voting`
--

CREATE TABLE `periode_voting` (
  `id` int(11) NOT NULL,
  `nama_periode` varchar(100) NOT NULL,
  `tanggal_mulai` datetime NOT NULL,
  `tanggal_selesai` datetime NOT NULL,
  `status` enum('Aktif','Nonaktif') DEFAULT 'Nonaktif'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `periode_voting`
--

INSERT INTO `periode_voting` (`id`, `nama_periode`, `tanggal_mulai`, `tanggal_selesai`, `status`) VALUES
(1, 'periode 1', '2026-11-12 11:01:00', '2026-11-12 12:01:00', 'Nonaktif'),
(2, 'periode2', '2026-11-12 13:04:00', '2026-11-12 13:59:00', 'Aktif');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `no_hp` varchar(20) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','pemilih') DEFAULT 'pemilih',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `nama`, `email`, `no_hp`, `password`, `role`, `created_at`) VALUES
(1, 'Admin', 'admin@kakangsenduk.com', '081234567890', '$2y$10$sKeiFkkgwQxY62fyTCr8l.vBVxtGdwbzaWJ991ZiaCv/p7yET0sfS', 'admin', '2026-11-12 02:01:06'),
(2, 'davin', 'davinyu@gmail.com', '088102222222', '$2y$10$s87clfHyfV/XE6/h/hPyauNHDQd9stS4.UJBVHYOf3z6YFnGPF8cy', 'pemilih', '2026-11-12 03:59:00'),
(3, 'danu', 'danu@gmail.com', '00000000000', '$2y$10$xeTZLQjibPoJcylDJC9dh.giGRwe.3J3IIjSuEUosjI57pPWipyiW', 'pemilih', '2026-11-12 06:08:23');

-- --------------------------------------------------------

--
-- Struktur dari tabel `voting`
--

CREATE TABLE `voting` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `kontestan_id` int(11) NOT NULL,
  `kategori` enum('Kakang','Senduk') NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `voting`
--

INSERT INTO `voting` (`id`, `user_id`, `kontestan_id`, `kategori`, `created_at`) VALUES
(3, 2, 4, 'Kakang', '2026-11-12 13:05:54'),
(4, 2, 3, 'Senduk', '2026-11-12 13:06:03'),
(5, 3, 6, 'Kakang', '2026-11-12 13:09:03'),
(6, 3, 2, 'Senduk', '2026-11-12 13:09:11');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `kontestan`
--
ALTER TABLE `kontestan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `periode_voting`
--
ALTER TABLE `periode_voting`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indeks untuk tabel `voting`
--
ALTER TABLE `voting`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unik_voting` (`user_id`,`kategori`),
  ADD KEY `kontestan_id` (`kontestan_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `kontestan`
--
ALTER TABLE `kontestan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `periode_voting`
--
ALTER TABLE `periode_voting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `voting`
--
ALTER TABLE `voting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `voting`
--
ALTER TABLE `voting`
  ADD CONSTRAINT `voting_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `voting_ibfk_2` FOREIGN KEY (`kontestan_id`) REFERENCES `kontestan` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
