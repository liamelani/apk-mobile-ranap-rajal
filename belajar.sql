-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 13, 2024 at 03:17 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `belajar`
--

-- --------------------------------------------------------

--
-- Table structure for table `diagnosa_rawat_inap`
--

CREATE TABLE `diagnosa_rawat_inap` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `no_diag_inap` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tgl_diagnosis` date NOT NULL,
  `no_rm_inap` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_pasien` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `h_diagnosis` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `kd_obat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_obat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_dokter` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_dokter` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `diagnosa_rawat_inap`
--

INSERT INTO `diagnosa_rawat_inap` (`id`, `no_diag_inap`, `tgl_diagnosis`, `no_rm_inap`, `nama_pasien`, `h_diagnosis`, `kd_obat`, `nama_obat`, `no_dokter`, `nama_dokter`, `created_at`, `updated_at`) VALUES
(1, 'dginap01', '2024-04-02', 'RM001', 'Jonh Doe', 'Flu', 'OB001', 'Paracetamol', 'D001', 'Dr.Agus', '2024-06-10 23:10:09', '2024-06-10 23:10:09'),
(2, 'dginap02', '2024-04-25', 'RM002', 'Sandi', 'Batuk', 'OB003', 'OBH44', 'D001', 'Dr.Agus', '2024-06-10 23:11:25', '2024-06-10 23:11:25'),
(3, 'dginap03', '2024-04-26', 'RM003', 'Tuti', 'katarak', 'OB002', 'Optrik', 'D002', 'Dr.Tami', '2024-06-10 23:12:40', '2024-06-10 23:12:40');

-- --------------------------------------------------------

--
-- Table structure for table `diagnosa_rawat_jalan`
--

CREATE TABLE `diagnosa_rawat_jalan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `no_diag_jalan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tgl_diagnosis` date NOT NULL,
  `no_rm_jalan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_pasien` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `h_diagnosis` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `kd_obat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_obat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_dokter` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_dokter` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `diagnosa_rawat_jalan`
--

INSERT INTO `diagnosa_rawat_jalan` (`id`, `no_diag_jalan`, `tgl_diagnosis`, `no_rm_jalan`, `nama_pasien`, `h_diagnosis`, `kd_obat`, `nama_obat`, `no_dokter`, `nama_dokter`, `created_at`, `updated_at`) VALUES
(1, 'dgjalan02', '2024-04-08', 'RJ002', 'Widi', 'sakit mata', 'OB004', 'Insto', 'D002', 'Dr.Tami', '2024-06-10 23:15:07', '2024-06-10 23:15:07'),
(2, 'dgjalan01', '2024-04-01', 'RJ001', 'Fani', 'Demam', 'OB001', 'Paracetamol', 'D001', 'Dr.Agus', '2024-06-10 23:16:22', '2024-06-10 23:16:22');

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `no_dokter` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `spesialisasi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `diterima` date NOT NULL,
  `no_hp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`id`, `no_dokter`, `nama`, `spesialisasi`, `diterima`, `no_hp`, `alamat`, `created_at`, `updated_at`) VALUES
(1, 'D001', 'Dr.Agus', 'Dokter Umum', '2024-03-12', '08123456789', 'jl. Pahlawan no.123,kota madiun', '2024-06-10 22:47:05', '2024-06-10 22:47:05'),
(2, 'D002', 'Dr.Tami', 'Mata', '2024-04-30', '08676555', 'Simpang Len', '2024-06-10 22:48:37', '2024-06-10 22:48:37');

-- --------------------------------------------------------

--
-- Table structure for table `kamar`
--

CREATE TABLE `kamar` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `no_tempat_tidur` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ruang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `di_isi_oleh` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `harga_kamar` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kamar`
--

INSERT INTO `kamar` (`id`, `no_tempat_tidur`, `ruang`, `status`, `di_isi_oleh`, `harga_kamar`, `created_at`, `updated_at`) VALUES
(1, 'A101', 'Ruang A', 'Tidak Tersedia', '1', '150000.00', '2024-06-10 23:06:28', '2024-06-10 23:06:28'),
(2, 'A102', 'Ruang B', 'Tidak Tersedia', '2', '222.00', '2024-06-10 23:07:20', '2024-06-10 23:07:20'),
(3, 'A103', 'Ruang C', 'Tidak Tersedia', '3', '550004.00', '2024-06-10 23:08:11', '2024-06-10 23:08:11'),
(4, 'A104', 'Ruang D', 'Tersedia', NULL, '500000.00', '2024-06-10 23:08:48', '2024-06-10 23:08:48');

-- --------------------------------------------------------

--
-- Table structure for table `laporan_rawat_inap`
--

CREATE TABLE `laporan_rawat_inap` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `No_Rawat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `No_RM_Inap` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Nama_Pasien` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Jenis_Kelamin` enum('Laki-laki','Perempuan') COLLATE utf8mb4_unicode_ci NOT NULL,
  `Umur` tinyint(3) UNSIGNED NOT NULL,
  `no_tempat_tidur` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Nama_Kamar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode_obat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Nama_Obat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Harga_Obat` decimal(10,2) NOT NULL,
  `harga_kamar` decimal(10,2) NOT NULL,
  `Biaya_Dokter` decimal(10,2) NOT NULL,
  `Total_Biaya` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `laporan_rawat_inap`
--

INSERT INTO `laporan_rawat_inap` (`id`, `No_Rawat`, `No_RM_Inap`, `Nama_Pasien`, `Jenis_Kelamin`, `Umur`, `no_tempat_tidur`, `Nama_Kamar`, `kode_obat`, `Nama_Obat`, `Harga_Obat`, `harga_kamar`, `Biaya_Dokter`, `Total_Biaya`, `created_at`, `updated_at`) VALUES
(1, 'RWTINAP001', 'RM001', 'Jonh Doe', 'Laki-laki', 30, 'A101', 'Ruang A', 'OB001', 'Paracetamol', '5000.00', '150000.00', '500000.00', '655000.00', '2024-06-10 23:18:37', '2024-06-10 23:18:37'),
(2, 'RWTINAP002', 'RM002', 'Sandi', 'Laki-laki', 19, 'A102', 'Ruang B', 'OB003', 'OBH44', '6000.00', '222.00', '76222.00', '82444.00', '2024-06-10 23:19:25', '2024-06-10 23:19:25'),
(3, 'RWTINAP003', 'RM003', 'Tuti', 'Perempuan', 20, 'A103', 'Ruang C', 'OB002', 'Optrik', '10000.00', '550004.00', '610004.00', '1170008.00', '2024-06-10 23:20:13', '2024-06-10 23:20:13');

-- --------------------------------------------------------

--
-- Table structure for table `laporan_rawat_jalan`
--

CREATE TABLE `laporan_rawat_jalan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `No_Rawat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `No_RM_Jalan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Nama_Pasien` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Jenis_Kelamin` enum('Laki-laki','Perempuan') COLLATE utf8mb4_unicode_ci NOT NULL,
  `Umur` tinyint(3) UNSIGNED NOT NULL,
  `kode_obat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Nama_Obat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Harga_Obat` decimal(10,2) NOT NULL,
  `Biaya_Dokter` decimal(10,2) NOT NULL,
  `Total_Biaya` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `laporan_rawat_jalan`
--

INSERT INTO `laporan_rawat_jalan` (`id`, `No_Rawat`, `No_RM_Jalan`, `Nama_Pasien`, `Jenis_Kelamin`, `Umur`, `kode_obat`, `Nama_Obat`, `Harga_Obat`, `Biaya_Dokter`, `Total_Biaya`, `created_at`, `updated_at`) VALUES
(1, 'RWTJALAN001', 'RJ001', 'Fani', 'Laki-laki', 25, 'OB001', 'Paracetamol', '5000.00', '500000.00', '505000.00', '2024-06-10 23:21:54', '2024-06-10 23:23:52'),
(2, 'RWTJALAN002', 'RJ002', 'Widi', 'Laki-laki', 27, 'OB004', 'Insto', '10.00', '78.00', '88.00', '2024-06-10 23:24:34', '2024-06-10 23:24:34');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(2, '2024_03_11_034434_create_user_table', 1),
(3, '2024_03_12_135953_create_doctors_table', 1),
(4, '2024_03_13_083219_create_pasien_rawat_inap_table', 1),
(5, '2024_03_13_173842_create_diagnosa_rawat_inap_table', 1),
(6, '2024_03_14_001835_create_perawat_table', 1),
(7, '2024_03_14_060550_create_kamar_table', 1),
(8, '2024_03_14_063853_create_obat_table', 1),
(9, '2024_03_16_014512_create_laporan_rawat_inap_table', 1),
(10, '2024_04_06_044459_create_pasien_rawat_jalan_table', 1),
(11, '2024_04_08_091339_create_diagnosa_rawat_jalan_table', 1),
(12, '2024_05_04_081606_create_laporan_rawat_jalan_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `obat`
--

CREATE TABLE `obat` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_obat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_obat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jenis_obat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stok` int(11) NOT NULL,
  `harga_obat` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `obat`
--

INSERT INTO `obat` (`id`, `kode_obat`, `nama_obat`, `jenis_obat`, `stok`, `harga_obat`, `created_at`, `updated_at`) VALUES
(1, 'OB001', 'Paracetamol', 'Tablet', 100, '5000.00', '2024-06-10 23:03:12', '2024-06-10 23:03:12'),
(2, 'OB002', 'Optrik', 'Kapsul', 23, '10000.00', '2024-06-10 23:04:01', '2024-06-10 23:04:01'),
(3, 'OB003', 'OBH44', 'sirup', 12, '6000.00', '2024-06-10 23:04:31', '2024-06-10 23:04:31'),
(4, 'OB004', 'Insto', '-', 50, '10.00', '2024-06-10 23:05:12', '2024-06-10 23:05:12');

-- --------------------------------------------------------

--
-- Table structure for table `pasien_rawat_inap`
--

CREATE TABLE `pasien_rawat_inap` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `No_RM_Inap` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Nama_Pasien` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Jenis_Kelamin` enum('Laki-laki','Perempuan') COLLATE utf8mb4_unicode_ci NOT NULL,
  `Alamat` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `Telepon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Umur` int(11) NOT NULL,
  `Tgl_Masuk` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pasien_rawat_inap`
--

INSERT INTO `pasien_rawat_inap` (`id`, `No_RM_Inap`, `Nama_Pasien`, `Jenis_Kelamin`, `Alamat`, `Telepon`, `Umur`, `Tgl_Masuk`, `created_at`, `updated_at`) VALUES
(1, 'RM001', 'Jonh Doe', 'Laki-laki', 'Jl.Contoh No.123', '081234567890', 30, '2022-01-01', '2024-06-10 22:54:33', '2024-06-10 22:54:33'),
(2, 'RM002', 'Sandi', 'Laki-laki', 'nbdjss', '232', 19, '2024-05-03', '2024-06-10 22:55:53', '2024-06-10 22:55:53'),
(3, 'RM003', 'Tuti', 'Perempuan', 'Pakam', '0099090', 20, '2024-05-03', '2024-06-10 22:57:10', '2024-06-10 22:57:10');

-- --------------------------------------------------------

--
-- Table structure for table `pasien_rawat_jalan`
--

CREATE TABLE `pasien_rawat_jalan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `No_RM_Jalan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Nama_Pasien` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Jenis_Kelamin` enum('Laki-laki','Perempuan') COLLATE utf8mb4_unicode_ci NOT NULL,
  `Alamat` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `Telepon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Umur` int(11) NOT NULL,
  `Tgl_Masuk` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pasien_rawat_jalan`
--

INSERT INTO `pasien_rawat_jalan` (`id`, `No_RM_Jalan`, `Nama_Pasien`, `Jenis_Kelamin`, `Alamat`, `Telepon`, `Umur`, `Tgl_Masuk`, `created_at`, `updated_at`) VALUES
(1, 'RJ001', 'Fani', 'Laki-laki', 'jl. contoh No. 456', '081234567891', 25, '2022-01-15', '2024-06-10 22:59:12', '2024-06-10 22:59:12'),
(2, 'RJ002', 'Widi', 'Laki-laki', 'medan', '22888', 27, '2024-04-18', '2024-06-10 23:00:36', '2024-06-10 23:00:36');

-- --------------------------------------------------------

--
-- Table structure for table `perawat`
--

CREATE TABLE `perawat` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kd_perawat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telepon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `perawat`
--

INSERT INTO `perawat` (`id`, `kd_perawat`, `nama`, `alamat`, `telepon`, `created_at`, `updated_at`) VALUES
(1, 'PER001', 'Nama Perawat 1', 'Alamat Perawat 1', '081234567890', '2024-06-10 22:50:25', '2024-06-10 22:50:25'),
(2, 'PER002', 'ariati', 'tebing', '082383504564', '2024-06-10 22:51:26', '2024-06-10 22:52:03');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` enum('admin','petugas_pendaftaran','dokter','apotek','perawat') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'petugas_pendaftaran',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `nama`, `email`, `password`, `level`, `created_at`, `updated_at`) VALUES
(1, 'lia', 'lia@gmail.com', '$2y$10$vBW0RfhWSkV7f0tRSUTKH.W2kEled7uaAc5557sxNfaue.KGfS0c.', 'admin', '2024-06-10 22:40:59', '2024-06-10 22:40:59'),
(2, 'ariati', 'ariati@gmail.com', '$2y$10$5XmS7uoZ0F3oxPHeWy/b7.isApNDKw.gwTzdG0bsetT8Rt2zJgRwy', 'perawat', '2024-06-10 23:26:21', '2024-06-10 23:26:21'),
(3, 'melani', 'melani@gmail.com', '$2y$10$5z2zUZkZdqSzQ5Ix8Yh5IeWaquBx2jcQ9eenoZW4dw.oAIR7HdHT2', 'petugas_pendaftaran', '2024-06-10 23:27:14', '2024-06-10 23:27:14'),
(4, 'tami', 'tami@gmail.com', '$2y$10$OdKzowHDGusPKNsFoYUpD.QEoDkQHLjTW5.PXADgbbsW7cnu9pdLu', 'dokter', '2024-06-10 23:27:55', '2024-06-10 23:27:55'),
(5, 'bunga', 'bunga@gmail.com', '$2y$10$/PaaU2oDwxFQshbUVlsHne7qH.6NGLl50AJIpzz587PjpmlVwtg22', 'apotek', '2024-06-10 23:28:28', '2024-06-10 23:28:28'),
(6, 'k', 'k@gmail.com', '$2y$10$hmiGk7oIlKqC65dkO3Cf5ugTQLUWH0UPtD.pwG3edyD4gRQD2P732', 'admin', '2024-06-12 06:10:52', '2024-06-12 06:10:52');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `diagnosa_rawat_inap`
--
ALTER TABLE `diagnosa_rawat_inap`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `diagnosa_rawat_inap_no_diag_inap_unique` (`no_diag_inap`);

--
-- Indexes for table `diagnosa_rawat_jalan`
--
ALTER TABLE `diagnosa_rawat_jalan`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `diagnosa_rawat_jalan_no_diag_jalan_unique` (`no_diag_jalan`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `doctors_no_dokter_unique` (`no_dokter`);

--
-- Indexes for table `kamar`
--
ALTER TABLE `kamar`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kamar_no_tempat_tidur_unique` (`no_tempat_tidur`);

--
-- Indexes for table `laporan_rawat_inap`
--
ALTER TABLE `laporan_rawat_inap`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `laporan_rawat_inap_no_rawat_unique` (`No_Rawat`);

--
-- Indexes for table `laporan_rawat_jalan`
--
ALTER TABLE `laporan_rawat_jalan`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `laporan_rawat_jalan_no_rawat_unique` (`No_Rawat`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `obat_kode_obat_unique` (`kode_obat`);

--
-- Indexes for table `pasien_rawat_inap`
--
ALTER TABLE `pasien_rawat_inap`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pasien_rawat_inap_no_rm_inap_unique` (`No_RM_Inap`);

--
-- Indexes for table `pasien_rawat_jalan`
--
ALTER TABLE `pasien_rawat_jalan`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pasien_rawat_jalan_no_rm_jalan_unique` (`No_RM_Jalan`);

--
-- Indexes for table `perawat`
--
ALTER TABLE `perawat`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `perawat_kd_perawat_unique` (`kd_perawat`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `diagnosa_rawat_inap`
--
ALTER TABLE `diagnosa_rawat_inap`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `diagnosa_rawat_jalan`
--
ALTER TABLE `diagnosa_rawat_jalan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `kamar`
--
ALTER TABLE `kamar`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `laporan_rawat_inap`
--
ALTER TABLE `laporan_rawat_inap`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `laporan_rawat_jalan`
--
ALTER TABLE `laporan_rawat_jalan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `obat`
--
ALTER TABLE `obat`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pasien_rawat_inap`
--
ALTER TABLE `pasien_rawat_inap`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pasien_rawat_jalan`
--
ALTER TABLE `pasien_rawat_jalan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `perawat`
--
ALTER TABLE `perawat`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
