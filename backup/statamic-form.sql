-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 02, 2024 at 01:41 PM
-- Server version: 11.4.2-MariaDB
-- PHP Version: 8.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `statamic-form`
--

-- --------------------------------------------------------

--
-- Table structure for table `assets_meta`
--

CREATE TABLE `assets_meta` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `container` varchar(255) NOT NULL,
  `folder` varchar(255) NOT NULL,
  `basename` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `extension` char(10) NOT NULL,
  `path` varchar(255) NOT NULL,
  `meta` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`meta`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `asset_containers`
--

CREATE TABLE `asset_containers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `handle` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `disk` varchar(255) NOT NULL,
  `settings` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`settings`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `asset_containers`
--

INSERT INTO `asset_containers` (`id`, `handle`, `title`, `disk`, `settings`, `created_at`, `updated_at`) VALUES
(1, 'assets', 'Assets', 'assets', '{\"allow_uploads\":true,\"allow_downloading\":true,\"allow_moving\":true,\"allow_renaming\":true,\"create_folders\":true,\"search_index\":null,\"source_preset\":null,\"warm_presets\":null,\"validation_rules\":[]}', '2024-06-30 09:13:52', '2024-06-30 09:13:52');

-- --------------------------------------------------------

--
-- Table structure for table `blueprints`
--

CREATE TABLE `blueprints` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `namespace` varchar(255) DEFAULT NULL,
  `handle` varchar(255) NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`data`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blueprints`
--

INSERT INTO `blueprints` (`id`, `namespace`, `handle`, `data`, `created_at`, `updated_at`) VALUES
(1, NULL, 'default', '{\"fields\":[{\"field\":{\"type\":\"markdown\",\"display\":\"Content\",\"localizable\":true},\"handle\":\"content\"}]}', '2024-06-30 09:14:16', NULL),
(2, 'C:.laragon.www.statamic-form.resources.blueprints.assets', 'assets', '{\"title\":\"Asset\",\"tabs\":{\"main\":{\"sections\":[{\"fields\":[{\"handle\":\"alt\",\"field\":{\"display\":\"Alt Text\",\"type\":\"text\",\"instructions\":\"Description of the image\"}}]}]}}}', '2024-06-18 02:47:01', '2024-06-18 02:47:01'),
(3, 'C:.laragon.www.statamic-form.resources.blueprints', 'default', '{\"title\":\"Default\",\"tabs\":{\"main\":{\"sections\":[{\"fields\":[{\"handle\":\"content\",\"field\":{\"type\":\"markdown\",\"display\":\"Content\",\"localizable\":true}},{\"handle\":\"author\",\"field\":{\"type\":\"users\",\"display\":\"Author\",\"default\":\"current\",\"localizable\":true,\"max_items\":1}},{\"handle\":\"template\",\"field\":{\"type\":\"template\",\"display\":\"Template\",\"localizable\":true}}]}]}}}', '2024-06-18 02:47:01', '2024-06-18 02:47:01'),
(4, 'C:.laragon.www.statamic-form.resources.blueprints', 'user', '{\"title\":\"User\",\"tabs\":{\"main\":{\"sections\":[{\"fields\":[{\"handle\":\"name\",\"field\":{\"type\":\"text\",\"display\":\"Name\"}},{\"handle\":\"email\",\"field\":{\"type\":\"text\",\"input\":\"email\",\"display\":\"Email Address\"}},{\"handle\":\"roles\",\"field\":{\"type\":\"user_roles\",\"width\":50}},{\"handle\":\"groups\",\"field\":{\"type\":\"user_groups\",\"width\":50}},{\"handle\":\"avatar\",\"field\":{\"type\":\"assets\",\"max_files\":1,\"container\":\"assets\"}}]}]}}}', '2024-06-18 02:47:01', '2024-06-18 02:47:01'),
(5, 'collections.forms', 'form', '{\"tabs\":{\"main\":{\"display\":\"Main\",\"sections\":[{\"display\":\"Form\",\"fields\":[{\"handle\":\"title\",\"field\":{\"type\":\"text\",\"required\":true,\"validate\":[\"required\"]}},{\"handle\":\"name\",\"field\":{\"type\":\"text\",\"display\":\"Name\"}},{\"handle\":\"email\",\"field\":{\"type\":\"text\",\"display\":\"Email\"}},{\"handle\":\"captcha\",\"field\":{\"type\":\"text\",\"display\":\"Captcha\"}}],\"__count\":0}],\"__count\":0},\"sidebar\":{\"display\":\"Sidebar\",\"sections\":[{\"fields\":[{\"handle\":\"slug\",\"field\":{\"type\":\"slug\",\"localizable\":true,\"validate\":\"max:200\"}},{\"handle\":\"parent\",\"field\":{\"type\":\"entries\",\"collections\":[\"forms\"],\"max_items\":1,\"listable\":false,\"localizable\":true}}],\"__count\":0}],\"__count\":1}},\"title\":\"Form\"}', '2024-06-30 09:20:29', '2024-07-01 07:56:30'),
(6, 'forms', 'users', '{\"tabs\":{\"main\":{\"display\":\"Main\",\"sections\":[{\"fields\":[{\"handle\":\"name\",\"field\":{\"type\":\"text\",\"display\":\"Name\"}},{\"handle\":\"email\",\"field\":{\"type\":\"text\",\"display\":\"Email\"}}],\"__count\":0}],\"__count\":0}}}', '2024-06-30 09:54:39', '2024-06-30 09:55:21');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `collections`
--

CREATE TABLE `collections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `handle` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `settings` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`settings`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `collections`
--

INSERT INTO `collections` (`id`, `handle`, `title`, `settings`, `created_at`, `updated_at`) VALUES
(1, 'pages', 'Pages', '{\"routes\":\"{parent_uri}\\/{slug}\",\"slugs\":true,\"title_formats\":[],\"mount\":null,\"dated\":false,\"sites\":[\"default\"],\"template\":null,\"layout\":null,\"inject\":[],\"search_index\":null,\"revisions\":false,\"default_status\":true,\"structure\":{\"root\":true},\"sort_dir\":null,\"sort_field\":null,\"taxonomies\":null,\"propagate\":true,\"past_date_behavior\":\"public\",\"future_date_behavior\":\"public\",\"preview_targets\":[{\"label\":\"Entry\",\"format\":\"{permalink}\",\"refresh\":true}],\"origin_behavior\":\"select\"}', '2024-06-18 02:47:01', '2024-06-18 02:47:01'),
(2, 'forms', 'Forms', '{\"routes\":null,\"slugs\":true,\"title_formats\":[],\"mount\":null,\"dated\":false,\"sites\":null,\"template\":\"default\",\"layout\":\"layout\",\"inject\":[],\"search_index\":null,\"revisions\":false,\"default_status\":true,\"structure\":{\"root\":false},\"sort_dir\":\"asc\",\"sort_field\":null,\"taxonomies\":[],\"propagate\":false,\"past_date_behavior\":\"public\",\"future_date_behavior\":\"private\",\"preview_targets\":[{\"id\":\"F9sPUMpV\",\"label\":\"Entry\",\"format\":\"{permalink}\",\"refresh\":true}],\"origin_behavior\":\"select\"}', '2024-06-30 09:18:12', '2024-06-30 09:18:49');

-- --------------------------------------------------------

--
-- Table structure for table `entries`
--

CREATE TABLE `entries` (
  `id` char(36) NOT NULL,
  `site` varchar(255) NOT NULL,
  `origin_id` char(36) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT 1,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `collection` varchar(255) NOT NULL,
  `blueprint` varchar(30) DEFAULT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`data`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `entries`
--

INSERT INTO `entries` (`id`, `site`, `origin_id`, `published`, `slug`, `uri`, `date`, `order`, `collection`, `blueprint`, `data`, `created_at`, `updated_at`) VALUES
('15ee4b9a-ab63-4f3a-8d4f-7d62b03cd985', 'default', NULL, 1, NULL, NULL, NULL, 1, 'forms', 'form', '{\"title\":\"2024-07-01 15:52:09\",\"name\":\"Seto\",\"email\":\"seto@gmail.com\",\"captcha\":\"dzxzZe\"}', '2024-07-01 08:52:09', '2024-07-01 08:52:09'),
('d731568d-e68c-4e31-8981-2b2bd87d01f3', 'default', NULL, 1, NULL, NULL, NULL, 1, 'forms', 'form', '{\"title\":\"2024-07-01 15:26:52\",\"name\":\"joko\",\"email\":\"joko@gmail.com\",\"captcha\":\"n8umcq\"}', '2024-07-01 08:26:52', '2024-07-01 08:26:52'),
('f0b26b3b-c3dc-4ea0-b08f-81a84bbbeeeb', 'default', NULL, 1, NULL, NULL, NULL, 1, 'forms', 'form', '{\"title\":\"2024-07-01 15:18:40\",\"name\":\"agus\",\"email\":\"agusprnytx@gmail.com\",\"captcha\":\"p9ut49\"}', '2024-07-01 08:18:40', '2024-07-01 08:18:40'),
('home', 'default', NULL, 1, 'home', '/', NULL, 1, 'pages', 'pages', '{\"title\":\"Home\",\"template\":\"home\",\"content\":\"## Welcome to your brand new Statamic site!\\n\\nNot sure where to do next? Here are a few ideas, but feel free to explore in your own way, in your own time.\\n\\n- [Jump into the Control Panel](\\/cp) and edit this page or begin setting up your own collections and blueprints.\\n- [Head to the docs](https:\\/\\/statamic.dev) and learn how Statamic works.\\n- [Watch some Statamic videos](https:\\/\\/youtube.com\\/statamic) on YouTube.\\n- [Join our Discord chat](https:\\/\\/statamic.com\\/discord) and meet thousands of other Statamic developers.\\n- [Start a discussion](https:\\/\\/github.com\\/statamic\\/cms\\/discussions) and get answers to your questions.\\n- [Star Statamic on Github](https:\\/\\/github.com\\/statamic\\/cms) if you enjoy using it!\\n\"}', '2024-06-30 09:14:40', '2024-06-30 09:14:40');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
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
-- Table structure for table `fieldsets`
--

CREATE TABLE `fieldsets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `handle` varchar(255) NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`data`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `forms`
--

CREATE TABLE `forms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `handle` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `settings` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`settings`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `forms`
--

INSERT INTO `forms` (`id`, `handle`, `title`, `settings`, `created_at`, `updated_at`) VALUES
(2, 'users', 'users', '{\"store\":true,\"email\":[],\"honeypot\":\"honeypot\"}', '2024-06-30 09:50:55', '2024-06-30 09:51:00');

-- --------------------------------------------------------

--
-- Table structure for table `form_submissions`
--

CREATE TABLE `form_submissions` (
  `id` decimal(14,4) NOT NULL,
  `form` varchar(30) DEFAULT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`data`)),
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `form_submissions`
--

INSERT INTO `form_submissions` (`id`, `form`, `data`, `created_at`, `updated_at`) VALUES
('1719766716.6479', 'users', '{\"name\":\"agus\",\"email\":\"agus@example.com\"}', '2024-06-30 09:58:36.633384', '2024-06-30 09:58:36.648089'),
('1719767208.7159', 'users', '{\"name\":\"joko\",\"email\":\"joko@gmail.com\"}', '2024-06-30 10:06:48.712275', '2024-06-30 10:06:48.716024'),
('1719767373.6261', 'users', '{\"name\":\"seto\",\"email\":\"seto@gmail.com\"}', '2024-06-30 10:09:33.622571', '2024-06-30 10:09:33.626266'),
('1719767430.8862', 'users', '{\"name\":\"safira\",\"email\":\"safira@gmail.com\"}', '2024-06-30 10:10:30.883562', '2024-06-30 10:10:30.886323'),
('1719767502.0839', 'users', '{\"name\":\"nuni\",\"email\":\"nuni@gmail.com\"}', '2024-06-30 10:11:42.080807', '2024-06-30 10:11:42.084017'),
('1719767521.2542', 'users', '{\"name\":\"dio\",\"email\":\"dio@gmail.com\"}', '2024-06-30 10:12:01.251554', '2024-06-30 10:12:01.254335');

-- --------------------------------------------------------

--
-- Table structure for table `global_sets`
--

CREATE TABLE `global_sets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `handle` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `settings` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`settings`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `global_set_variables`
--

CREATE TABLE `global_set_variables` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `handle` varchar(255) NOT NULL,
  `locale` varchar(255) DEFAULT NULL,
  `origin` varchar(255) DEFAULT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`data`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `group_user`
--

CREATE TABLE `group_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` char(36) NOT NULL,
  `group_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
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
-- Table structure for table `job_batches`
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
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_03_07_100000_create_asset_containers_table', 1),
(5, '2024_03_07_100000_create_asset_table', 2),
(6, '2024_03_07_100000_create_tokens_table', 3),
(7, '2024_03_07_100000_create_blueprints_table', 4),
(8, '2024_03_07_100000_create_collections_table', 5),
(9, '2024_03_07_100000_create_navigation_trees_table', 6),
(10, '2024_03_07_100000_create_entries_table_with_string_ids', 7),
(11, '2024_03_07_100000_create_fieldsets_table', 8),
(12, '2024_03_07_100000_create_forms_table', 9),
(13, '2024_03_07_100000_create_form_submissions_table', 10),
(14, '2024_05_15_100000_modify_form_submissions_id', 10),
(15, '2024_03_07_100000_create_globals_table', 11),
(16, '2024_03_07_100000_create_navigations_table', 12),
(17, '2024_03_07_100000_create_terms_table', 13),
(18, '2024_03_07_100000_create_taxonomies_table', 14),
(19, '2024_03_07_100000_create_global_variables_table', 15),
(20, '2024_06_30_161648_statamic_auth_tables', 16);

-- --------------------------------------------------------

--
-- Table structure for table `navigations`
--

CREATE TABLE `navigations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `handle` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `settings` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`settings`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_activation_tokens`
--

CREATE TABLE `password_activation_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` char(36) NOT NULL,
  `role_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
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
-- Table structure for table `taxonomies`
--

CREATE TABLE `taxonomies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `handle` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `sites` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`sites`)),
  `settings` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`settings`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `taxonomy_terms`
--

CREATE TABLE `taxonomy_terms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `site` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `taxonomy` varchar(255) NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`data`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE `tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `token` varchar(255) NOT NULL,
  `handler` varchar(255) NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`data`)),
  `expire_at` timestamp NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trees`
--

CREATE TABLE `trees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `locale` varchar(255) DEFAULT NULL,
  `tree` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`tree`)),
  `settings` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`settings`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `trees`
--

INSERT INTO `trees` (`id`, `handle`, `type`, `locale`, `tree`, `settings`, `created_at`, `updated_at`) VALUES
(1, 'pages', 'collection', 'default', '[{\"entry\":\"home\"}]', '{\"initial_path\":\"C:\\/laragon\\/www\\/statamic-form\\/content\\/trees\\/collections\\/pages.yaml\"}', '2024-06-18 02:47:01', '2024-06-18 02:47:01'),
(2, 'forms', 'collection', 'default', '[{\"entry\":\"fba3babb-bcdf-4260-9992-0f5c5c0b8323\"}]', '{\"initial_path\":null}', '2024-06-30 09:49:06', '2024-07-01 08:15:55');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `super` tinyint(1) NOT NULL DEFAULT 0,
  `avatar` varchar(255) DEFAULT NULL,
  `preferences` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`preferences`)),
  `last_login` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `super`, `avatar`, `preferences`, `last_login`) VALUES
('88d86e71-a579-4016-b34f-feb6fd9e2a4f', 'agus', 'agus@example.com', NULL, '$2y$12$H76ID0f0VKIGgX2x0p2df.gnztYbc78r70JJA361lLz33TBQ2L/Oe', 'bFpq4HHWwhojDBgAZDI4nEbVn2PYIwcfDTY0A5pg7sh09vhqPdgeS0awsZNO', '2024-06-30 09:17:23', '2024-06-30 09:20:01', 1, NULL, '{\"theme\":\"light\"}', '2024-07-01 07:03:31');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assets_meta`
--
ALTER TABLE `assets_meta`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `assets_meta_container_folder_basename_unique` (`container`,`folder`,`basename`),
  ADD KEY `assets_meta_container_index` (`container`),
  ADD KEY `assets_meta_folder_index` (`folder`),
  ADD KEY `assets_meta_basename_index` (`basename`),
  ADD KEY `assets_meta_filename_index` (`filename`),
  ADD KEY `assets_meta_extension_index` (`extension`),
  ADD KEY `assets_meta_path_index` (`path`);

--
-- Indexes for table `asset_containers`
--
ALTER TABLE `asset_containers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `asset_containers_handle_unique` (`handle`);

--
-- Indexes for table `blueprints`
--
ALTER TABLE `blueprints`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blueprints_handle_namespace_unique` (`handle`,`namespace`),
  ADD KEY `blueprints_namespace_index` (`namespace`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `collections`
--
ALTER TABLE `collections`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `collections_handle_unique` (`handle`);

--
-- Indexes for table `entries`
--
ALTER TABLE `entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entries_site_index` (`site`),
  ADD KEY `entries_origin_id_index` (`origin_id`),
  ADD KEY `entries_uri_index` (`uri`),
  ADD KEY `entries_order_index` (`order`),
  ADD KEY `entries_collection_index` (`collection`),
  ADD KEY `entries_blueprint_index` (`blueprint`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `fieldsets`
--
ALTER TABLE `fieldsets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fieldsets_handle_unique` (`handle`);

--
-- Indexes for table `forms`
--
ALTER TABLE `forms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `forms_handle_unique` (`handle`);

--
-- Indexes for table `form_submissions`
--
ALTER TABLE `form_submissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `form_submissions_id_unique` (`id`),
  ADD UNIQUE KEY `form_submissions_form_created_at_unique` (`form`,`created_at`),
  ADD KEY `form_submissions_form_index` (`form`);

--
-- Indexes for table `global_sets`
--
ALTER TABLE `global_sets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `global_sets_handle_unique` (`handle`);

--
-- Indexes for table `global_set_variables`
--
ALTER TABLE `global_set_variables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `global_set_variables_handle_index` (`handle`);

--
-- Indexes for table `group_user`
--
ALTER TABLE `group_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `navigations`
--
ALTER TABLE `navigations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `navigations_handle_unique` (`handle`);

--
-- Indexes for table `password_activation_tokens`
--
ALTER TABLE `password_activation_tokens`
  ADD KEY `password_activation_tokens_email_index` (`email`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `taxonomies`
--
ALTER TABLE `taxonomies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `taxonomies_handle_unique` (`handle`);

--
-- Indexes for table `taxonomy_terms`
--
ALTER TABLE `taxonomy_terms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `taxonomy_terms_slug_taxonomy_site_unique` (`slug`,`taxonomy`,`site`),
  ADD KEY `taxonomy_terms_site_index` (`site`),
  ADD KEY `taxonomy_terms_uri_index` (`uri`),
  ADD KEY `taxonomy_terms_taxonomy_index` (`taxonomy`);

--
-- Indexes for table `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tokens_token_unique` (`token`);

--
-- Indexes for table `trees`
--
ALTER TABLE `trees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `trees_handle_type_locale_unique` (`handle`,`type`,`locale`),
  ADD KEY `trees_type_index` (`type`),
  ADD KEY `trees_locale_index` (`locale`);

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
-- AUTO_INCREMENT for table `assets_meta`
--
ALTER TABLE `assets_meta`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `asset_containers`
--
ALTER TABLE `asset_containers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `blueprints`
--
ALTER TABLE `blueprints`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `collections`
--
ALTER TABLE `collections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fieldsets`
--
ALTER TABLE `fieldsets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `forms`
--
ALTER TABLE `forms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `global_sets`
--
ALTER TABLE `global_sets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `global_set_variables`
--
ALTER TABLE `global_set_variables`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `group_user`
--
ALTER TABLE `group_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `navigations`
--
ALTER TABLE `navigations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `taxonomies`
--
ALTER TABLE `taxonomies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `taxonomy_terms`
--
ALTER TABLE `taxonomy_terms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trees`
--
ALTER TABLE `trees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
