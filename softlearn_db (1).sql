-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 12, 2025 at 07:12 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `softlearn_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `hasil_kuis_siswa`
--

CREATE TABLE `hasil_kuis_siswa` (
  `id_hasil` int(11) NOT NULL,
  `id_kuis` int(11) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `total_skor` int(11) NOT NULL,
  `waktu_mulai` timestamp NULL DEFAULT NULL,
  `waktu_selesai` timestamp NULL DEFAULT NULL,
  `status` enum('sedang_dikerjakan','selesai','terlambat') DEFAULT 'sedang_dikerjakan'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hasil_kuis_siswa`
--

INSERT INTO `hasil_kuis_siswa` (`id_hasil`, `id_kuis`, `id_siswa`, `total_skor`, `waktu_mulai`, `waktu_selesai`, `status`) VALUES
(20, 2, 6, 20, '2025-06-12 03:16:32', '2025-06-12 04:26:25', 'selesai');

-- --------------------------------------------------------

--
-- Table structure for table `jawaban_siswa`
--

CREATE TABLE `jawaban_siswa` (
  `id_jawaban_siswa` int(11) NOT NULL,
  `id_kuis` int(11) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `id_pertanyaan` int(11) NOT NULL,
  `jawaban_siswa` text DEFAULT NULL,
  `skor_diperoleh` int(11) DEFAULT 0,
  `waktu_submit` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jawaban_siswa`
--

INSERT INTO `jawaban_siswa` (`id_jawaban_siswa`, `id_kuis`, `id_siswa`, `id_pertanyaan`, `jawaban_siswa`, `skor_diperoleh`, `waktu_submit`) VALUES
(69, 2, 6, 6, 'B', 0, '2025-06-12 03:16:24'),
(70, 2, 6, 7, 'A', 0, '2025-06-12 03:16:26'),
(71, 2, 6, 4, 'C', 0, '2025-06-12 03:16:28'),
(72, 2, 6, 5, 'B', 0, '2025-06-12 03:16:29'),
(73, 2, 6, 3, 'C', 0, '2025-06-12 03:16:31');

-- --------------------------------------------------------

--
-- Table structure for table `kuis`
--

CREATE TABLE `kuis` (
  `id_kuis` int(11) NOT NULL,
  `id_mapel` int(11) NOT NULL,
  `judul_kuis` varchar(255) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `level_kesulitan` enum('Beginner','Intermediate','Advanced','Expert') NOT NULL,
  `id_pembuat` int(11) NOT NULL,
  `tanggal_dibuat` timestamp NOT NULL DEFAULT current_timestamp(),
  `waktu_pengerjaan_menit` int(11) DEFAULT 60
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kuis`
--

INSERT INTO `kuis` (`id_kuis`, `id_mapel`, `judul_kuis`, `deskripsi`, `level_kesulitan`, `id_pembuat`, `tanggal_dibuat`, `waktu_pengerjaan_menit`) VALUES
(2, 2, 'Kuis Konsep PBO', '', 'Intermediate', 3, '2025-06-11 06:26:26', 10),
(3, 3, 'Kuis Basis Data', '', 'Advanced', 1, '2025-06-11 06:34:56', 12);

-- --------------------------------------------------------

--
-- Table structure for table `mata_pelajaran`
--

CREATE TABLE `mata_pelajaran` (
  `id_mapel` int(11) NOT NULL,
  `nama_mapel` varchar(100) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `id_admin_pembuat` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mata_pelajaran`
--

INSERT INTO `mata_pelajaran` (`id_mapel`, `nama_mapel`, `deskripsi`, `id_admin_pembuat`) VALUES
(2, 'Pemrograman Berorientasi Objek (PBO)', 'Mempelajari konsep pemrograman berorientasi objek.', 1),
(3, 'Basis Data', 'Mempelajari desain dan manajemen sistem basis data.', 1),
(4, 'Pemodelan Perangkat Lunak', 'Mempelajari cara memodelkan sistem perangkat lunak.', 1),
(5, 'Pemrograman Dasar', 'Pengenalan konsep dasar logika pemrograman.', 1),
(6, 'Algoritma', 'Mempelajari cara merancang algoritma yang efisien.', 1),
(7, 'Sistem Komputer', 'Mempelajari arsitektur dan organisasi sistem komputer.', 1);

-- --------------------------------------------------------

--
-- Table structure for table `materi`
--

CREATE TABLE `materi` (
  `id_materi` int(11) NOT NULL,
  `id_mapel` int(11) NOT NULL,
  `judul_materi` varchar(255) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `konten_materi` text DEFAULT NULL,
  `tipe_konten` enum('file_pdf','video_embed','teks','link_eksternal') DEFAULT 'teks',
  `file_path` varchar(255) DEFAULT NULL,
  `id_uploader` int(11) NOT NULL,
  `tanggal_upload` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `materi`
--

INSERT INTO `materi` (`id_materi`, `id_mapel`, `judul_materi`, `deskripsi`, `konten_materi`, `tipe_konten`, `file_path`, `id_uploader`, `tanggal_upload`) VALUES
(3, 2, 'Konsep PBO', '', '', 'file_pdf', 'uploads/materi/1749622302_Konsep_PBO.pdf', 1, '2025-06-11 06:11:42'),
(4, 4, 'GTA', 'aa', 'https://www.youtube.com/embed/a-Akk0HJdv8?si=rEkUu7DamhF5ExIZ', 'video_embed', '', 1, '2025-06-12 05:02:20');

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE `pengguna` (
  `id_pengguna` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `peran` enum('siswa','admin') NOT NULL,
  `nis` varchar(20) DEFAULT NULL,
  `kelas` varchar(20) DEFAULT NULL,
  `nip` varchar(20) DEFAULT NULL,
  `tanggal_dibuat` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`id_pengguna`, `username`, `password_hash`, `nama_lengkap`, `email`, `peran`, `nis`, `kelas`, `nip`, `tanggal_dibuat`) VALUES
(1, '123456', '$2y$10$NrmxZ08BD6YQBVnEIBKnQO1GX90SSP4RfwgjqVCaHdwJYlyxGaP1e', 'husnu', 'husnugimang@gmail.com', 'admin', NULL, NULL, '123456', '2025-06-03 12:08:06'),
(3, '654321', '$2y$10$UA7ns2yirzMkCNPCCdKYjelxs3J7eph5UALijTV5lze2ZGvCKDYGu', 'dewati', 'gimang@gmail.com', 'admin', NULL, NULL, '654321', '2025-06-10 14:30:19'),
(6, 'Arya Putra', '$2y$10$CG0.lpWAleaQvPcUDDUBy.ybFm333p51.IdJaRH/HNpAcL0wVGfD2', 'Arya Putra Pratama Ansori', 'aryagta456Ok@gmail.com', 'siswa', '12345', 'X RPL 2', NULL, '2025-06-12 02:40:21'),
(7, 'Rizal MZ', '$2y$10$wl.vgoxDOH5/B9EmlodiQu/.18Ml3mwPPaKiX5YOL4YCnvZocyAgu', 'Rizal MZ', '', 'siswa', '1234567', 'X RPL 2', NULL, '2025-06-12 02:45:59');

-- --------------------------------------------------------

--
-- Table structure for table `pertanyaan_kuis`
--

CREATE TABLE `pertanyaan_kuis` (
  `id_pertanyaan` int(11) NOT NULL,
  `id_kuis` int(11) NOT NULL,
  `teks_pertanyaan` text NOT NULL,
  `tipe_pertanyaan` enum('pilihan_ganda','esai_singkat') DEFAULT 'pilihan_ganda',
  `opsi_jawaban_json` text DEFAULT NULL,
  `kunci_jawaban` varchar(255) NOT NULL,
  `poin` int(11) DEFAULT 10
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pertanyaan_kuis`
--

INSERT INTO `pertanyaan_kuis` (`id_pertanyaan`, `id_kuis`, `teks_pertanyaan`, `tipe_pertanyaan`, `opsi_jawaban_json`, `kunci_jawaban`, `poin`) VALUES
(3, 2, 'Dalam Pemrograman Berorientasi Objek (PBO), sebuah \"objek\" paling tepat dideskripsikan sebagai...\r\n', 'pilihan_ganda', '{\"A\":\"Sebuah cetak biru atau templat untuk membuat kode.\",\"B\":\"Serangkaian perintah atau fungsi yang berjalan secara berurutan.\",\"C\":\"Perwujudan nyata dari sebuah kelas, yang memiliki data (atribut) dan perilaku (metode) spesifik.\",\"D\":\"Sebuah variabel yang hanya bisa menyimpan satu jenis data.\"}', 'B', 20),
(4, 2, 'Prinsip PBO yang berfungsi \"membungkus\" data dan metode ke dalam satu unit (objek) serta menyembunyikan detail internal yang kompleks dari dunia luar disebut...', 'pilihan_ganda', '{\"A\":\"Pewarisan (Inheritance)\",\"B\":\"Polimorfisme\",\"C\":\"Enkapsulasi\",\"D\":\"Abstraksi\"}', 'A', 20),
(5, 2, 'Sebuah pengembang game membuat kelas Musuh sebagai kelas induk. Kemudian, ia membuat kelas Zombie dan Pemanah yang mengambil semua sifat dari kelas Musuh namun memiliki tambahan kemampuan spesifik. Konsep PBO yang diterapkan di sini adalah...', 'pilihan_ganda', '{\"A\":\"Abstraksi\",\"B\":\"Pewarisan (Inheritance)\",\"C\":\"Polimorfisme\",\"D\":\"Enkapsulasi\"}', 'C', 20),
(6, 2, 'Anda memiliki metode bersuara(). Ketika metode ini dipanggil oleh objek Kucing, ia akan mengeluarkan suara \"Meong\". Namun, ketika dipanggil oleh objek Anjing, ia akan mengeluarkan suara \"Guk\". Kemampuan satu metode bersuara() untuk berperilaku berbeda tergantung pada objek yang memanggilnya adalah contoh dari...', 'pilihan_ganda', '{\"A\":\"Kelas\",\"B\":\"Enkapsulasi\",\"C\":\"Pewarisan (Inheritance)\",\"D\":\"Polimorfisme\"}', 'A', 20),
(7, 2, 'Saat Anda menggunakan remote control TV, Anda hanya perlu menekan tombol volume untuk mengubah suara tanpa perlu tahu bagaimana sirkuit di dalamnya bekerja. Konsep PBO yang paling sesuai dengan penyederhanaan interaksi ini adalah...', 'pilihan_ganda', '{\"A\":\"Pewarisan (Inheritance)\",\"B\":\"Polimorfisme\",\"C\":\"Objek\",\"D\":\"Abstraksi\"}', 'C', 20),
(8, 3, 'Ok lanjut', 'pilihan_ganda', '{\"A\":\"a\",\"B\":\"s\",\"C\":\"a\",\"D\":\"d\"}', 'C', 10),
(9, 3, 'q', 'pilihan_ganda', '{\"A\":\"t\",\"B\":\"u\",\"C\":\"y\",\"D\":\"b\"}', 'A', 10);

-- --------------------------------------------------------

--
-- Table structure for table `pesan_forum`
--

CREATE TABLE `pesan_forum` (
  `id_pesan` int(11) NOT NULL,
  `id_pengguna_pengirim` int(11) NOT NULL,
  `isi_pesan` text NOT NULL,
  `waktu_kirim` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pesan_forum`
--

INSERT INTO `pesan_forum` (`id_pesan`, `id_pengguna_pengirim`, `isi_pesan`, `waktu_kirim`) VALUES
(1, 1, 'Halo', '2025-06-10 11:54:19'),
(3, 3, 'Ok gas', '2025-06-10 14:31:05'),
(6, 1, 'Halo', '2025-06-12 01:37:39'),
(9, 6, 'Halo', '2025-06-12 03:14:43');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `hasil_kuis_siswa`
--
ALTER TABLE `hasil_kuis_siswa`
  ADD PRIMARY KEY (`id_hasil`),
  ADD UNIQUE KEY `unik_hasil` (`id_kuis`,`id_siswa`),
  ADD KEY `id_siswa` (`id_siswa`);

--
-- Indexes for table `jawaban_siswa`
--
ALTER TABLE `jawaban_siswa`
  ADD PRIMARY KEY (`id_jawaban_siswa`),
  ADD UNIQUE KEY `unik_jawaban` (`id_kuis`,`id_siswa`,`id_pertanyaan`),
  ADD KEY `id_siswa` (`id_siswa`),
  ADD KEY `id_pertanyaan` (`id_pertanyaan`);

--
-- Indexes for table `kuis`
--
ALTER TABLE `kuis`
  ADD PRIMARY KEY (`id_kuis`),
  ADD KEY `id_mapel` (`id_mapel`),
  ADD KEY `id_pembuat` (`id_pembuat`);

--
-- Indexes for table `mata_pelajaran`
--
ALTER TABLE `mata_pelajaran`
  ADD PRIMARY KEY (`id_mapel`),
  ADD UNIQUE KEY `nama_mapel` (`nama_mapel`),
  ADD KEY `id_admin_pembuat` (`id_admin_pembuat`);

--
-- Indexes for table `materi`
--
ALTER TABLE `materi`
  ADD PRIMARY KEY (`id_materi`),
  ADD KEY `id_mapel` (`id_mapel`),
  ADD KEY `id_uploader` (`id_uploader`);

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`id_pengguna`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `nis` (`nis`),
  ADD UNIQUE KEY `nip` (`nip`);

--
-- Indexes for table `pertanyaan_kuis`
--
ALTER TABLE `pertanyaan_kuis`
  ADD PRIMARY KEY (`id_pertanyaan`),
  ADD KEY `id_kuis` (`id_kuis`);

--
-- Indexes for table `pesan_forum`
--
ALTER TABLE `pesan_forum`
  ADD PRIMARY KEY (`id_pesan`),
  ADD KEY `id_pengguna_pengirim` (`id_pengguna_pengirim`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `hasil_kuis_siswa`
--
ALTER TABLE `hasil_kuis_siswa`
  MODIFY `id_hasil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `jawaban_siswa`
--
ALTER TABLE `jawaban_siswa`
  MODIFY `id_jawaban_siswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `kuis`
--
ALTER TABLE `kuis`
  MODIFY `id_kuis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `mata_pelajaran`
--
ALTER TABLE `mata_pelajaran`
  MODIFY `id_mapel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `materi`
--
ALTER TABLE `materi`
  MODIFY `id_materi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `id_pengguna` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pertanyaan_kuis`
--
ALTER TABLE `pertanyaan_kuis`
  MODIFY `id_pertanyaan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `pesan_forum`
--
ALTER TABLE `pesan_forum`
  MODIFY `id_pesan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `hasil_kuis_siswa`
--
ALTER TABLE `hasil_kuis_siswa`
  ADD CONSTRAINT `hasil_kuis_siswa_ibfk_1` FOREIGN KEY (`id_kuis`) REFERENCES `kuis` (`id_kuis`) ON DELETE CASCADE,
  ADD CONSTRAINT `hasil_kuis_siswa_ibfk_2` FOREIGN KEY (`id_siswa`) REFERENCES `pengguna` (`id_pengguna`) ON DELETE CASCADE;

--
-- Constraints for table `jawaban_siswa`
--
ALTER TABLE `jawaban_siswa`
  ADD CONSTRAINT `jawaban_siswa_ibfk_1` FOREIGN KEY (`id_kuis`) REFERENCES `kuis` (`id_kuis`) ON DELETE CASCADE,
  ADD CONSTRAINT `jawaban_siswa_ibfk_2` FOREIGN KEY (`id_siswa`) REFERENCES `pengguna` (`id_pengguna`) ON DELETE CASCADE,
  ADD CONSTRAINT `jawaban_siswa_ibfk_3` FOREIGN KEY (`id_pertanyaan`) REFERENCES `pertanyaan_kuis` (`id_pertanyaan`) ON DELETE CASCADE;

--
-- Constraints for table `kuis`
--
ALTER TABLE `kuis`
  ADD CONSTRAINT `kuis_ibfk_1` FOREIGN KEY (`id_mapel`) REFERENCES `mata_pelajaran` (`id_mapel`) ON DELETE CASCADE,
  ADD CONSTRAINT `kuis_ibfk_2` FOREIGN KEY (`id_pembuat`) REFERENCES `pengguna` (`id_pengguna`) ON DELETE CASCADE;

--
-- Constraints for table `mata_pelajaran`
--
ALTER TABLE `mata_pelajaran`
  ADD CONSTRAINT `mata_pelajaran_ibfk_1` FOREIGN KEY (`id_admin_pembuat`) REFERENCES `pengguna` (`id_pengguna`) ON DELETE SET NULL;

--
-- Constraints for table `materi`
--
ALTER TABLE `materi`
  ADD CONSTRAINT `materi_ibfk_1` FOREIGN KEY (`id_mapel`) REFERENCES `mata_pelajaran` (`id_mapel`) ON DELETE CASCADE,
  ADD CONSTRAINT `materi_ibfk_2` FOREIGN KEY (`id_uploader`) REFERENCES `pengguna` (`id_pengguna`) ON DELETE CASCADE;

--
-- Constraints for table `pertanyaan_kuis`
--
ALTER TABLE `pertanyaan_kuis`
  ADD CONSTRAINT `pertanyaan_kuis_ibfk_1` FOREIGN KEY (`id_kuis`) REFERENCES `kuis` (`id_kuis`) ON DELETE CASCADE;

--
-- Constraints for table `pesan_forum`
--
ALTER TABLE `pesan_forum`
  ADD CONSTRAINT `pesan_forum_ibfk_1` FOREIGN KEY (`id_pengguna_pengirim`) REFERENCES `pengguna` (`id_pengguna`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
