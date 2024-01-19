-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 20 Jan 2024 pada 00.36
-- Versi server: 10.4.20-MariaDB
-- Versi PHP: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `coffe`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `cart`
--

CREATE TABLE `cart` (
  `id_cart` int(20) NOT NULL,
  `id_food` int(20) NOT NULL,
  `note` varchar(300) NOT NULL,
  `jumlah` int(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `cart`
--

INSERT INTO `cart` (`id_cart`, `id_food`, `note`, `jumlah`, `created_at`, `updated_at`) VALUES
(1, 1, 'yang pedes bang', 1, NULL, NULL),
(2, 2, 'jangan ambil yang lembek', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `makanan`
--

CREATE TABLE `makanan` (
  `id_food` int(20) NOT NULL,
  `nama_food` varchar(20) NOT NULL,
  `deskripsi` varchar(259) NOT NULL,
  `gambar` varchar(9999) NOT NULL,
  `harga` int(20) NOT NULL,
  `jenis_fod` varchar(20) NOT NULL,
  `fodOrDrink` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `makanan`
--

INSERT INTO `makanan` (`id_food`, `nama_food`, `deskripsi`, `gambar`, `harga`, `jenis_fod`, `fodOrDrink`) VALUES
(1, 'Martabak', 'martabak enak gak pakek bohong', 'https://img.freepik.com/free-vector/hand-drawn-flat-design-vietnamese-food-illustration_23-2149276813.jpg?w=826&t=st=1705672968~exp=1705673568~hmac=7e7f67d77ca9e3450fd3c50b3c6bb98be9d6bf5851cc1b8b3a45db719e615555', 20000, 'ringan', 'food'),
(2, 'chips', 'chips alla kadarnya hehehe', 'https://img.freepik.com/free-vector/realistic-chips-package_1284-34786.jpg?w=826&t=st=1705673114~exp=1705673714~hmac=6aed792d7f473f06c68bb36fb8018a73d0bb615af7d40af5ff9920c0b17fe345', 5000, 'ringan', 'food'),
(3, 'donat', 'donat yang dalamnya bolong', 'https://img.freepik.com/free-vector/floating-melted-doughnut-cartoon-icon-illustration_138676-2597.jpg?w=826&t=st=1705673189~exp=1705673789~hmac=0e6f31dc94a2cae1b09f205818ce4a69ae99064add54ba4f0e908727d9f31f6e', 5000, 'ringan', 'food'),
(4, 'cola', 'ini cola teh', 'https://img.freepik.com/free-photo/fresh-cola-drink-glass_144627-16201.jpg?w=740&t=st=1705683607~exp=1705684207~hmac=b0ef13303f2f1c2a885f338622ee46154f093f7b33a15f61730cfe4f5fc2cae0', 10000, 'ice', 'drink'),
(5, 'es teh', 'es teh bang jarwo', 'https://img.freepik.com/free-photo/ice-falling-brown-drink_1194-1074.jpg?w=740&t=st=1705691540~exp=1705692140~hmac=6199720f598e6076e5d387d22be4a0fe98144d5872df1f037f055dc3a8a53f34', 5000, 'ice', 'drink'),
(6, 'Jeruk', 'ini jeruk panas,', 'https://img.freepik.com/premium-photo/fresh-orange-juice-glass-energetic-with-half-cut-orange_972547-37.jpg?w=826', 10000, 'hot', 'drink'),
(7, 'coffe boba', 'minuman fresh new ada boba', 'https://img.freepik.com/free-photo/frappe-drink-with-caramel-nuts-isolated-white-background-ai-generative_123827-24936.jpg?t=st=1705691772~exp=1705695372~hmac=043c817026e89675f5240034dcc8ca8740ff4d8b29ad42f2a9fce54ac8a45f4d&w=740', 30000, 'ice', 'drink');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(2, '2024_01_19_181452_add_timestamps_to_cart_table', 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id_cart`),
  ADD KEY `list` (`id_food`);

--
-- Indeks untuk tabel `makanan`
--
ALTER TABLE `makanan`
  ADD PRIMARY KEY (`id_food`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `cart`
--
ALTER TABLE `cart`
  MODIFY `id_cart` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `makanan`
--
ALTER TABLE `makanan`
  MODIFY `id_food` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`id_food`) REFERENCES `makanan` (`id_food`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
