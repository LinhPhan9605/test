-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th2 17, 2025 lúc 09:00 AM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `test`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_02_17_022653_create_transactions_table', 1),
(5, '2025_02_17_022707_create_products_table', 1),
(6, '2025_02_17_022819_create_transaction_lines_table', 1),
(7, '2025_02_17_031816_create_revenues_table', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `summary` text DEFAULT NULL,
  `price` int(11) DEFAULT 0,
  `discount` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `sku`, `summary`, `price`, `discount`, `created_at`, `updated_at`) VALUES
(1, 'Product 1', NULL, NULL, 1000, 0, '2025-02-17 00:39:50', '2025-02-17 00:39:50'),
(2, 'Product 2', NULL, NULL, 2000, 20, '2025-02-17 00:39:50', '2025-02-17 00:39:50'),
(3, 'Product 3', NULL, NULL, 3000, 5, '2025-02-17 00:39:50', '2025-02-17 00:39:50'),
(4, 'Product 4', NULL, NULL, 4000, 0, '2025-02-17 00:39:50', '2025-02-17 00:39:50');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `revenues`
--

CREATE TABLE `revenues` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `percent` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `revenues`
--

INSERT INTO `revenues` (`id`, `user_id`, `transaction_id`, `percent`, `price`, `created_at`, `updated_at`) VALUES
(1, 3, 1, 10, 100, '2025-02-17 00:39:55', '2025-02-17 00:39:55'),
(2, 2, 1, 5, 50, '2025-02-17 00:39:55', '2025-02-17 00:39:55'),
(3, 1, 1, 3, 30, '2025-02-17 00:39:55', '2025-02-17 00:39:55'),
(4, 3, 2, 10, 100, '2025-02-17 00:40:55', '2025-02-17 00:40:55'),
(5, 2, 2, 5, 50, '2025-02-17 00:40:55', '2025-02-17 00:40:55'),
(6, 1, 2, 3, 30, '2025-02-17 00:40:55', '2025-02-17 00:40:55'),
(7, 2, 3, 10, 100, '2025-02-17 00:41:34', '2025-02-17 00:41:34'),
(8, 1, 3, 5, 50, '2025-02-17 00:41:34', '2025-02-17 00:41:34'),
(9, 2, 4, 10, 300, '2025-02-17 00:42:01', '2025-02-17 00:42:01'),
(10, 1, 4, 5, 150, '2025-02-17 00:42:01', '2025-02-17 00:42:01'),
(11, 2, 5, 10, 320, '2025-02-17 00:42:32', '2025-02-17 00:42:32'),
(12, 1, 5, 5, 160, '2025-02-17 00:42:32', '2025-02-17 00:42:32'),
(13, 2, 6, 10, 800, '2025-02-17 00:43:51', '2025-02-17 00:43:51'),
(14, 1, 6, 5, 400, '2025-02-17 00:43:51', '2025-02-17 00:43:51'),
(15, 2, 7, 10, 445, '2025-02-17 00:44:23', '2025-02-17 00:44:23'),
(16, 1, 7, 5, 222, '2025-02-17 00:44:23', '2025-02-17 00:44:23'),
(17, 2, 8, 10, 300, '2025-02-17 00:58:29', '2025-02-17 00:58:29'),
(18, 1, 8, 5, 150, '2025-02-17 00:58:29', '2025-02-17 00:58:29');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `total_price` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `total_price`, `created_at`, `updated_at`) VALUES
(1, 4, 1000, '2025-02-17 00:39:55', '2025-02-17 00:39:55'),
(2, 4, 1000, '2025-02-17 00:40:55', '2025-02-17 00:40:55'),
(3, 3, 1000, '2025-02-17 00:41:34', '2025-02-17 00:41:34'),
(4, 3, 3000, '2025-02-17 00:42:01', '2025-02-17 00:42:01'),
(5, 3, 3200, '2025-02-17 00:42:32', '2025-02-17 00:42:32'),
(6, 3, 8000, '2025-02-17 00:43:51', '2025-02-17 00:43:51'),
(7, 3, 4450, '2025-02-17 00:44:23', '2025-02-17 00:44:23'),
(8, 3, 3000, '2025-02-17 00:58:29', '2025-02-17 00:58:29');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `transaction_lines`
--

CREATE TABLE `transaction_lines` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `price` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `transaction_lines`
--

INSERT INTO `transaction_lines` (`id`, `transaction_id`, `product_id`, `quantity`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 1000, '2025-02-17 00:39:55', '2025-02-17 00:39:55'),
(2, 2, 1, 1, 1000, '2025-02-17 00:40:55', '2025-02-17 00:40:55'),
(3, 3, 1, 1, 1000, '2025-02-17 00:41:34', '2025-02-17 00:41:34'),
(4, 4, 1, 3, 1000, '2025-02-17 00:42:01', '2025-02-17 00:42:01'),
(5, 5, 2, 2, 1600, '2025-02-17 00:42:32', '2025-02-17 00:42:32'),
(6, 6, 4, 2, 4000, '2025-02-17 00:43:51', '2025-02-17 00:43:51'),
(7, 7, 2, 1, 1600, '2025-02-17 00:44:23', '2025-02-17 00:44:23'),
(8, 7, 3, 1, 2850, '2025-02-17 00:44:23', '2025-02-17 00:44:23'),
(9, 8, 1, 3, 1000, '2025-02-17 00:58:29', '2025-02-17 00:58:29');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT 1,
  `revenue` int(11) DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `parent_id`, `level`, `revenue`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 0, 1, 1192, 'User 1', 'User 1@example.com', NULL, '$2y$12$EIs2/P3G0QZUep0UvIDhTutQQbshKt4P73OYawAm9Bhy4Amsdo0rC', NULL, '2025-02-17 00:39:49', '2025-02-17 00:58:29'),
(2, 1, 2, 2365, 'User 2', 'User 2@example.com', NULL, '$2y$12$CU1UqwaU28XDDKg2ts1NlepijlTXvDWENaPd/I7zLTS77yr3wduw6', NULL, '2025-02-17 00:39:50', '2025-02-17 00:58:29'),
(3, 2, 3, 200, 'User 3', 'User 3@example.com', NULL, '$2y$12$WbeeqRL1KaBMESBT9npjuOqBD7Epvvtk5EjRlsQUhQE3HTzS8AuBy', NULL, '2025-02-17 00:39:50', '2025-02-17 00:40:55'),
(4, 3, 4, 0, 'User 4', 'User 4@example.com', NULL, '$2y$12$mmivMx.vMiwx.r47LmMO6enqDu5qF8VzNf2UyZVKKtc3GlhLY8AO2', NULL, '2025-02-17 00:39:50', '2025-02-17 00:39:50');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Chỉ mục cho bảng `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Chỉ mục cho bảng `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Chỉ mục cho bảng `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `revenues`
--
ALTER TABLE `revenues`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Chỉ mục cho bảng `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `transaction_lines`
--
ALTER TABLE `transaction_lines`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `revenues`
--
ALTER TABLE `revenues`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `transaction_lines`
--
ALTER TABLE `transaction_lines`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
