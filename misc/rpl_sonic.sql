-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 13 Agu 2022 pada 06.28
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rpl_sonic`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Tea', '2022-08-07 09:41:45', '2022-08-07 09:41:45'),
(2, 'Non Coffee', '2022-08-07 09:41:45', '2022-08-07 09:41:45'),
(3, 'Coffee', '2022-08-07 09:41:45', '2022-08-07 09:41:45'),
(4, 'Brunch', '2022-08-07 09:41:45', '2022-08-07 09:41:45'),
(5, 'Lunch', '2022-08-07 09:41:45', '2022-08-07 09:41:45'),
(6, 'Desert', '2022-08-07 09:41:45', '2022-08-07 09:41:45');

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_06_30_095241_create_products_table', 1),
(6, '2022_06_30_095259_create_categories_table', 1),
(7, '2022_07_01_070101_create_orders_table', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'guest',
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`data`)),
  `isActive` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `orders`
--

INSERT INTO `orders` (`id`, `name`, `data`, `isActive`, `created_at`, `updated_at`) VALUES
(1, 'ujang', '{\"1\":{\"name\":\"Kopi Original\",\"quantity\":1,\"price\":20000},\"4\":{\"name\":\"Lemon Tea\",\"quantity\":1,\"price\":20000}}', 0, '2022-08-07 09:42:56', '2022-08-07 09:44:26'),
(2, 'koko', '{\"3\":{\"name\":\"Es Teh Manis\",\"quantity\":1,\"price\":20000},\"6\":{\"name\":\"Ice Chocolate\",\"quantity\":1,\"price\":21000}}', 1, '2022-08-07 10:03:33', '2022-08-07 10:03:33'),
(3, 'Bintang', '{\"12\":{\"name\":\"Black Forest\",\"quantity\":1,\"price\":20000},\"7\":{\"name\":\"Croffle\",\"quantity\":1,\"price\":20000},\"3\":{\"name\":\"Es Teh Manis\",\"quantity\":1,\"price\":20000}}', 1, '2022-08-12 10:41:47', '2022-08-12 10:41:47'),
(4, 'Zaky', '{\"12\":{\"name\":\"Black Forest\",\"quantity\":1,\"price\":20000},\"3\":{\"name\":\"Es Teh Manis\",\"quantity\":1,\"price\":20000},\"2\":{\"name\":\"Kopi Creamy\",\"quantity\":1,\"price\":20000}}', 1, '2022-08-12 11:03:48', '2022-08-12 11:03:48'),
(5, 'Zaky', '{\"12\":{\"name\":\"Black Forest\",\"quantity\":1,\"price\":20000},\"3\":{\"name\":\"Es Teh Manis\",\"quantity\":1,\"price\":20000},\"6\":{\"name\":\"Ice Chocolate\",\"quantity\":1,\"price\":21000}}', 1, '2022-08-12 11:11:27', '2022-08-12 11:11:27'),
(6, 'Sonic', '{\"12\":{\"name\":\"Black Forest\",\"quantity\":1,\"price\":20000},\"7\":{\"name\":\"Croffle\",\"quantity\":1,\"price\":20000},\"10\":{\"name\":\"Nasi Uduk\",\"quantity\":1,\"price\":20000}}', 0, '2022-08-12 11:17:22', '2022-08-12 11:20:24');

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
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
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `category_id`, `isActive`, `created_at`, `updated_at`) VALUES
(1, 'Kopi Original', 20000, 3, 1, '2022-08-07 09:41:45', '2022-08-07 09:41:45'),
(2, 'Kopi Creamy', 20000, 3, 1, '2022-08-07 09:41:45', '2022-08-12 11:14:28'),
(3, 'Es Teh Manis', 20000, 1, 1, '2022-08-07 09:41:45', '2022-08-07 09:43:09'),
(4, 'Lemon Tea', 20000, 1, 1, '2022-08-07 09:41:45', '2022-08-07 09:41:45'),
(5, 'Pop Ice Taro', 20000, 2, 1, '2022-08-07 09:41:45', '2022-08-07 09:41:45'),
(6, 'Ice Chocolate', 21000, 2, 1, '2022-08-07 09:41:45', '2022-08-12 11:18:57'),
(7, 'Croffle', 20000, 4, 1, '2022-08-07 09:41:45', '2022-08-12 10:45:48'),
(8, 'Roti Panggang', 20000, 4, 1, '2022-08-07 09:41:45', '2022-08-07 09:41:45'),
(9, 'Nasi Goreng', 20000, 5, 1, '2022-08-07 09:41:45', '2022-08-07 09:41:45'),
(10, 'Nasi Uduk', 20000, 5, 1, '2022-08-07 09:41:45', '2022-08-07 09:41:45'),
(11, 'Pudding Cokelat', 20000, 6, 1, '2022-08-07 09:41:45', '2022-08-07 09:41:45'),
(12, 'Black Forest', 20000, 6, 1, '2022-08-07 09:41:45', '2022-08-12 10:45:19');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Zaky', 'admin', 'admin@example.com', NULL, '$2y$10$nSAPj56ndRhoa74H1cH8But9qivdLZvjS2IWwri94CruQh4aPMfg.', NULL, '2022-08-07 09:41:45', '2022-08-07 09:41:45');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
