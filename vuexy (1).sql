-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 19, 2023 at 05:11 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vuexy`
--

-- --------------------------------------------------------

--
-- Table structure for table `apps`
--

CREATE TABLE `apps` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `type` varchar(50) NOT NULL,
  `file` text DEFAULT NULL,
  `visualItems` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `apps`
--

INSERT INTO `apps` (`id`, `userId`, `name`, `type`, `file`, `visualItems`) VALUES
(3, 2, 'Google Sheet', 'googleSheet', 'https://docs.google.com/spreadsheets/d/e/2PACX-1vQz44mwVMFs-nPVy_ILWATJATmQU6Lrfhe9jYEBmGQRltl7vJBlw8FimGNyxWepjeX3Gs25J00-krgA/pub?output=csv', '[{\"appId\": 3, \"yAxis\": [\"City\", \"Country\"], \"xAxis\": [], \"filterBy\": [\"OrderDate\"], \"selectedChart\": \"count\", \"visualItem\": {\"id\": 3, \"name\": \"Count\", \"methodName\": \"count\", \"type\": \"count\", \"sectionType\": \"count\", \"viewComponent\": \"count\", \"column\": [], \"image\": \"count.png\"}, \"rawData\": {\"yAxis\": [{\"name\": \"City\", \"aggr\": \"count\", \"field\": \"City\", \"customAggr\": null}, {\"name\": \"Country\", \"aggr\": \"count\", \"field\": \"Country\", \"customAggr\": null}], \"xAxis\": [], \"filterBy\": [{\"name\": \"OrderDate\", \"aggr\": null, \"field\": \"OrderDate\", \"customAggr\": null}]}}, {\"appId\": 3, \"yAxis\": [\"Country\"], \"xAxis\": [], \"filterBy\": [], \"selectedChart\": \"pieChart\", \"visualItem\": {\"id\": 2, \"name\": \"Bar Chart (X and Y axix, X axis is groupable column)\", \"methodName\": \"barChart\", \"type\": \"chart\", \"sectionType\": \"pieChart\", \"viewComponent\": \"piechart\", \"column\": [], \"image\": \"pie.jpg\", \"chartOptions\": {\"chart\": {\"plotBackgroundColor\": null, \"plotBorderWidth\": null, \"plotShadow\": false, \"type\": \"pie\"}, \"title\": {\"text\": \"Pie Chart\", \"align\": \"left\"}, \"tooltip\": {\"pointFormat\": \"{series.name}: <b>{point.percentage:.1f}%</b>\"}, \"accessibility\": {\"point\": {\"valueSuffix\": \"%\"}}, \"plotOptions\": {\"pie\": {\"allowPointSelect\": true, \"cursor\": \"pointer\", \"dataLabels\": {\"enabled\": true, \"format\": \"<b>{point.name}</b>: {point.percentage:.1f} %\", \"connectorColor\": \"silver\"}}}, \"series\": [{\"name\": \"Percentage\", \"data\": [{\"name\": \"Argentina\", \"y\": 27}, {\"name\": \"Austria\", \"y\": 63}, {\"name\": \"Belgium\", \"y\": 25}, {\"name\": \"Brazil\", \"y\": 157}, {\"name\": \"Canada\", \"y\": 87}, {\"name\": \"Denmark\", \"y\": 92}, {\"name\": \"Finland\", \"y\": 16}, {\"name\": \"France\", \"y\": 177}, {\"name\": \"Germany\", \"y\": 491}, {\"name\": \"Ireland\", \"y\": 140}, {\"name\": \"Italy\", \"y\": 35}, {\"name\": \"Mexico\", \"y\": 113}, {\"name\": \"Norway\", \"y\": 1}, {\"name\": \"Poland\", \"y\": 16}, {\"name\": \"Portugal\", \"y\": 21}, {\"name\": \"Spain\", \"y\": 56}, {\"name\": \"Sweden\", \"y\": 78}, {\"name\": \"Switzerland\", \"y\": 26}, {\"name\": \"UK\", \"y\": 163}, {\"name\": \"USA\", \"y\": 267}, {\"name\": \"Venezuela\", \"y\": 121}]}]}}, \"rawData\": {\"yAxis\": [{\"name\": \"Country\", \"aggr\": null, \"field\": \"Country\", \"customAggr\": null}], \"xAxis\": [], \"filterBy\": []}}]'),
(4, 2, 'Excel File Ekpay', 'excel', 'tmp/1. eKpay Detailed (Jan20).xlsx', '[{\"appId\": 4, \"yAxis\": [\"EkPay ID\", \"Receipt Number\", \"Transaction ID\"], \"xAxis\": [], \"filterBy\": [], \"selectedChart\": \"count\", \"visualItem\": {\"id\": 3, \"name\": \"Count\", \"methodName\": \"count\", \"type\": \"count\", \"sectionType\": \"count\", \"viewComponent\": \"count\", \"column\": [], \"image\": \"count.png\"}, \"rawData\": {\"yAxis\": [{\"name\": \"Ek Pay ID\", \"aggr\": \"count\", \"field\": \"EkPay ID\", \"customAggr\": null}, {\"name\": \"Receipt Number\", \"aggr\": \"count\", \"field\": \"Receipt Number\", \"customAggr\": null}, {\"name\": \"Transaction ID\", \"aggr\": \"count\", \"field\": \"Transaction ID\", \"customAggr\": null}], \"xAxis\": [], \"filterBy\": []}}]'),
(5, 2, 'xzxz', 'excel', 'tmp/Sales.xlsx', '[{\"appId\": 5, \"yAxis\": [\"City\"], \"xAxis\": [], \"filterBy\": [], \"selectedChart\": \"pieChart\", \"visualItem\": {\"id\": 2, \"name\": \"Bar Chart (X and Y axix, X axis is groupable column)\", \"methodName\": \"barChart\", \"type\": \"chart\", \"sectionType\": \"pieChart\", \"viewComponent\": \"piechart\", \"column\": [], \"image\": \"pie.jpg\", \"chartOptions\": {\"chart\": {\"plotBackgroundColor\": null, \"plotBorderWidth\": null, \"plotShadow\": false, \"type\": \"pie\"}, \"title\": {\"text\": \"Pie Chart\", \"align\": \"left\"}, \"tooltip\": {\"pointFormat\": \"{series.name}: <b>{point.percentage:.1f}%</b>\"}, \"accessibility\": {\"point\": {\"valueSuffix\": \"%\"}}, \"plotOptions\": {\"pie\": {\"allowPointSelect\": true, \"cursor\": \"pointer\", \"dataLabels\": {\"enabled\": true, \"format\": \"<b>{point.name}</b>: {point.percentage:.1f} %\", \"connectorColor\": \"silver\"}}}, \"series\": [{\"name\": \"Percentage\", \"data\": [{\"name\": \"Aachen\", \"y\": 49}, {\"name\": \"Albuquerque\", \"y\": 7}, {\"name\": \"Anchorage\", \"y\": 2}, {\"name\": \"Barcelona\", \"y\": 8}, {\"name\": \"Barquisimeto\", \"y\": 34}, {\"name\": \"Bergamo\", \"y\": 19}, {\"name\": \"Berlin\", \"y\": 82}, {\"name\": \"Bern\", \"y\": 10}, {\"name\": \"Boise\", \"y\": 4}, {\"name\": \"Brandenburg\", \"y\": 39}, {\"name\": \"Bruxelles\", \"y\": 10}, {\"name\": \"Bru00e4cke\", \"y\": 18}, {\"name\": \"Buenos Aires\", \"y\": 27}, {\"name\": \"Butte\", \"y\": 1}, {\"name\": \"Campinas\", \"y\": 19}, {\"name\": \"Caracas\", \"y\": 7}, {\"name\": \"Charleroi\", \"y\": 15}, {\"name\": \"Cork\", \"y\": 140}, {\"name\": \"Cowes\", \"y\": 11}, {\"name\": \"Cunewalde\", \"y\": 106}, {\"name\": \"Elgin\", \"y\": 2}, {\"name\": \"Eugene\", \"y\": 122}, {\"name\": \"Frankfurt\", \"y\": 72}, {\"name\": \"Genu00e8ve\", \"y\": 16}, {\"name\": \"Graz\", \"y\": 11}, {\"name\": \"Helsinki\", \"y\": 3}, {\"name\": \"Kirkland\", \"y\": 57}, {\"name\": \"Ku00f6ln\", \"y\": 29}, {\"name\": \"Ku00f8benhavn\", \"y\": 92}, {\"name\": \"Lander\", \"y\": 12}, {\"name\": \"Leipzig\", \"y\": 1}, {\"name\": \"Lille\", \"y\": 72}, {\"name\": \"Lisboa\", \"y\": 21}, {\"name\": \"London\", \"y\": 152}, {\"name\": \"Luleu00e5\", \"y\": 52}, {\"name\": \"Lyon\", \"y\": 22}, {\"name\": \"Madrid\", \"y\": 23}, {\"name\": \"Mannheim\", \"y\": 9}, {\"name\": \"Marseille\", \"y\": 8}, {\"name\": \"Mexico City\", \"y\": 113}, {\"name\": \"Montru00e9al\", \"y\": 32}, {\"name\": \"Mu00fcnchen\", \"y\": 48}, {\"name\": \"Mu00fcnster\", \"y\": 48}, {\"name\": \"Nantes\", \"y\": 15}, {\"name\": \"Oulu\", \"y\": 13}, {\"name\": \"Paris\", \"y\": 5}, {\"name\": \"Porlamar\", \"y\": 35}, {\"name\": \"Portland\", \"y\": 14}, {\"name\": \"Reggio Emilia\", \"y\": 6}, {\"name\": \"Reims\", \"y\": 2}, {\"name\": \"Resende\", \"y\": 1}, {\"name\": \"Rio de Janeiro\", \"y\": 61}, {\"name\": \"Salzburg\", \"y\": 52}, {\"name\": \"San Cristu00f3bal\", \"y\": 45}, {\"name\": \"San Francisco\", \"y\": 5}, {\"name\": \"Seattle\", \"y\": 40}, {\"name\": \"Sevilla\", \"y\": 25}, {\"name\": \"Stavern\", \"y\": 1}, {\"name\": \"Stockholm\", \"y\": 8}, {\"name\": \"Strasbourg\", \"y\": 26}, {\"name\": \"Stuttgart\", \"y\": 12}, {\"name\": \"Su00e3o Paulo\", \"y\": 76}, {\"name\": \"Torino\", \"y\": 10}, {\"name\": \"Toulouse\", \"y\": 16}, {\"name\": \"Tsawwassen\", \"y\": 14}, {\"name\": \"Vancouver\", \"y\": 41}, {\"name\": \"Versailles\", \"y\": 11}, {\"name\": \"Walla Walla\", \"y\": 1}, {\"name\": \"Warszawa\", \"y\": 16}]}]}}, \"rawData\": {\"yAxis\": [{\"name\": \"City\", \"aggr\": null, \"field\": \"City\", \"customAggr\": null}], \"xAxis\": [], \"filterBy\": []}}, {\"appId\": 5, \"yAxis\": [\"City\"], \"xAxis\": [], \"filterBy\": [\"OrderDate\"], \"selectedChart\": \"count\", \"visualItem\": {\"id\": 3, \"name\": \"Count\", \"methodName\": \"count\", \"type\": \"count\", \"sectionType\": \"count\", \"viewComponent\": \"count\", \"column\": [], \"image\": \"count.png\"}, \"rawData\": {\"yAxis\": [{\"name\": \"City\", \"aggr\": \"count\", \"field\": \"City\", \"customAggr\": null}], \"xAxis\": [], \"filterBy\": [{\"name\": \"OrderDate\", \"aggr\": null, \"field\": \"OrderDate\", \"customAggr\": null}]}}, {\"appId\": 5, \"yAxis\": [\"Sales\"], \"xAxis\": [\"OrderDate\"], \"filterBy\": [\"OrderDate\"], \"selectedChart\": \"basicColumn\", \"visualItem\": {\"id\": 4, \"name\": \"Area Chart\", \"methodName\": \"basicColumn\", \"type\": \"chart\", \"sectionType\": \"basicColumn\", \"viewComponent\": \"basicColumn\", \"column\": [], \"image\": \"bar.png\", \"chartOptions\": {\"chart\": {\"type\": \"column\"}, \"title\": {\"text\": \"\"}, \"subtitle\": {\"text\": \"\"}, \"xAxis\": {\"categories\": [\"2017-02-26T00:00:00\", \"2017-03-26T00:00:00\", \"2017-04-09T00:00:00\", \"2017-04-23T00:00:00\", \"2017-04-25T00:00:00\", \"2017-04-26T00:00:00\"], \"crosshair\": true}, \"yAxis\": {\"min\": 0, \"title\": {\"text\": \"\"}}, \"tooltip\": {\"headerFormat\": \"<span style=\"font-size:10px\">{point.key}</span><table>\", \"pointFormat\": \"<tr><td style=\"color:{series.color};padding:0\">{series.name}: </td><td style=\"padding:0\"><b>{point.y:.1f}</b></td></tr>\", \"footerFormat\": \"</table>\", \"shared\": true, \"useHTML\": true}, \"plotOptions\": {\"column\": {\"pointPadding\": 0.2, \"borderWidth\": 0}}, \"series\": [{\"name\": \"2017-02-26T00:00:00\", \"data\": [1734.95]}, {\"name\": \"2017-03-26T00:00:00\", \"data\": [723.952]}, {\"name\": \"2017-04-09T00:00:00\", \"data\": [1046.85]}, {\"name\": \"2017-04-23T00:00:00\", \"data\": [752.056]}, {\"name\": \"2017-04-25T00:00:00\", \"data\": [1817.2]}, {\"name\": \"2017-04-26T00:00:00\", \"data\": [772.8475000000001]}]}}, \"rawData\": {\"yAxis\": [{\"name\": \"January month sales report\", \"aggr\": null, \"field\": \"Sales\", \"customAggr\": null}], \"xAxis\": [{\"name\": \"OrderDate\", \"aggr\": null, \"field\": \"OrderDate\", \"customAggr\": null}], \"filterBy\": [{\"name\": \"OrderDate\", \"aggr\": null, \"field\": \"OrderDate\", \"customAggr\": null}]}}]');

-- --------------------------------------------------------

--
-- Table structure for table `auto_excels`
--

CREATE TABLE `auto_excels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
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
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `userId` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fileId` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`id`, `userId`, `name`, `fileId`, `active`, `created_at`, `updated_at`) VALUES
(1, 1, '1. eKpay Detailed (Jan\'20).xlsx', 'upload/1. eKpay Detailed (Jan\'20).xlsx', NULL, '2023-03-19 08:20:40', '2023-03-29 10:32:59'),
(2, 1, 'sampledatafoodsales.xlsx', 'upload/sampledatafoodsales.xlsx', NULL, '2023-03-19 08:22:02', '2023-03-29 10:32:59'),
(3, 1, 'Sales.xlsx', 'upload/Sales.xlsx', 1, '2023-03-29 10:32:51', '2023-03-29 10:32:59');

-- --------------------------------------------------------

--
-- Table structure for table `gen_frames`
--

CREATE TABLE `gen_frames` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `userId` int(11) NOT NULL,
  `fileId` int(11) NOT NULL,
  `gen_section` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gen_frames`
--

INSERT INTO `gen_frames` (`id`, `userId`, `fileId`, `gen_section`, `created_at`, `updated_at`) VALUES
(1, 1, 2, '[{\"id\":\"5\",\"name\":\"Date List\",\"methodName\":\"dateList\",\"type\":\"dateList\",\"viewComponent\":\"dateList\",\"column\":[\"date\"]},{\"id\":\"1\",\"name\":\"Total City\",\"methodName\":\"groupBy\",\"type\":\"count\",\"viewComponent\":\"count\",\"column\":[\"city\"]},{\"id\":\"1\",\"name\":\"Total Region\",\"methodName\":\"groupBy\",\"type\":\"count\",\"viewComponent\":\"count\",\"column\":[\"region\"]},{\"id\":\"5\",\"name\":\"Line Chart\",\"methodName\":\"lineChart\",\"type\":\"chart\",\"viewComponent\":\"linechart\",\"column\":[\"product\",\"total_price\"]},{\"id\":\"5\",\"name\":\"Line Chart\",\"methodName\":\"lineChart\",\"type\":\"lineChart\",\"viewComponent\":\"linechart\",\"column\":[\"product\",\"total_price\"]},{\"id\":\"5\",\"name\":\"Category Wise Quantity\",\"methodName\":\"barChart\",\"type\":\"chart\",\"viewComponent\":\"barchart\",\"column\":[\"category\",\"qty\"]},{\"id\":\"5\",\"name\":\"Product Wise Quantity\",\"methodName\":\"barChart\",\"type\":\"chart\",\"viewComponent\":\"barchart\",\"column\":[\"product\",\"qty\"]},{\"id\":\"5\",\"name\":\"Doughnut Chart (Base on 1 Column, Group Then Count)\",\"methodName\":\"doughNutChart\",\"type\":\"chart\",\"viewComponent\":\"doughnutchart\",\"column\":[\"product\"]},{\"id\":\"5\",\"name\":\"Bar Chart (X and Y axix, X axis is groupable column)\",\"methodName\":\"barChart\",\"type\":\"chart\",\"viewComponent\":\"barchart\",\"column\":[\"date\",\"total_price\"]},{\"id\":\"3\",\"name\":\"Average\",\"methodName\":\"avg\",\"type\":\"count\",\"viewComponent\":\"count\",\"column\":[\"unit_price\"]},{\"id\":\"1\",\"name\":\"Product Group\",\"methodName\":\"groupBy\",\"type\":\"count\",\"viewComponent\":\"count\",\"column\":[\"product\"]}]', '2023-03-20 10:48:15', '2023-03-25 01:23:47'),
(2, 1, 1, '[{\"id\":\"3\",\"name\":\"Average\",\"methodName\":\"avg\",\"type\":\"count\",\"viewComponent\":\"count\",\"column\":[\"bank_name\"]}]', '2023-03-20 11:24:45', '2023-03-20 11:24:45'),
(3, 1, 3, '[{\"id\":\"5\",\"name\":\"Line Chart\",\"methodName\":\"lineChart\",\"type\":\"chart\",\"viewComponent\":\"linechart\",\"column\":[\"order_date\",\"quantity\"]},{\"id\":\"5\",\"name\":\"Date Wise Quantity\",\"methodName\":\"lineChart\",\"type\":\"chart\",\"viewComponent\":\"linechart\",\"column\":[\"order_date\",\"quantity\"]},{\"id\":\"5\",\"name\":\"Category\",\"methodName\":\"doughNutChart\",\"type\":\"chart\",\"viewComponent\":\"doughnutchart\",\"column\":[\"category_name\"]},{\"id\":\"1\",\"name\":\"Count Customer\",\"methodName\":\"groupBy\",\"type\":\"count\",\"viewComponent\":\"count\",\"column\":[\"customer\"]},{\"id\":\"5\",\"name\":\"City Wise Quantity\",\"methodName\":\"barChart\",\"type\":\"chart\",\"viewComponent\":\"barchart\",\"column\":[\"city\",\"quantity\"]},{\"id\":\"5\",\"name\":\"Doughnut Chart (Base on 1 Column, Group Then Count)\",\"methodName\":\"doughNutChart\",\"type\":\"chart\",\"viewComponent\":\"doughnutchart\",\"column\":[\"product_name\"]}]', '2023-03-29 10:35:57', '2023-04-04 10:02:47');

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_03_08_134418_create_auto_excels_table', 1),
(6, '2023_03_19_135539_create_files_table', 2),
(7, '2023_03_19_173915_create_gen_frames_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'shofiq', 's@gmail.com', NULL, 'ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f', '$2y$10$WQ99F68I.6KzE6A7tTLCWe7pbKQ/ObhNmLAhqYeMKpLklutyA4igq', '2023-03-11 08:38:47', '2023-03-11 08:38:47'),
(2, 'shofiq', 'm@gmail.com', NULL, '$5$rounds=535000$BlTOO7u3CimFXoBU$PS75Fhzzb64j.FoBMljtQJAtijUCuW2pMtHmbn/j6hC', NULL, '2023-03-11 08:38:47', '2023-03-11 08:38:47');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `apps`
--
ALTER TABLE `apps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auto_excels`
--
ALTER TABLE `auto_excels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gen_frames`
--
ALTER TABLE `gen_frames`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

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
-- AUTO_INCREMENT for table `apps`
--
ALTER TABLE `apps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `auto_excels`
--
ALTER TABLE `auto_excels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `gen_frames`
--
ALTER TABLE `gen_frames`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
