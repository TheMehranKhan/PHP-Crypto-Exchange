-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 21, 2024 at 02:21 PM
-- Server version: 10.6.12-MariaDB
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `trademenn_dbn`
--

-- --------------------------------------------------------

--
-- Table structure for table `application_settings`
--

CREATE TABLE `application_settings` (
  `slug` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `application_settings`
--

INSERT INTO `application_settings` (`slug`, `value`, `created_at`, `updated_at`) VALUES
('admin_receive_email', 'codemenco@gmail.com', '2022-02-03 22:05:35', '2023-08-25 07:03:45'),
('coinpayments_ch', '', '2022-03-13 14:42:58', '2022-03-13 14:42:58'),
('coinpayments_ipn_secret', 'eyJpdiI6IjJFaUdxeWxlL3lHdlRFcE92bXd1VEE9PSIsInZhbHVlIjoiMEt5KzR1Zk5QSjBtT3pUZVNUOUJwdm0vbXlOUnFqZHJIQ25tNkJvZ2JsTT0iLCJtYWMiOiJlM2Q5MmZhMzI0MjE0MjU3M2I4ZGNjNjU1ZDMzMjAxNzVkNzA5MTQxNWYxYzVhZGZlNGMyNWZlMjNiZDViYmU2IiwidGFnIjoiIn0=', '2022-03-13 14:42:58', '2022-08-03 23:52:06'),
('coinpayments_merchant_id', 'eyJpdiI6IkV1M01Tcmc1RjBkUEN6bUVGSklMVlE9PSIsInZhbHVlIjoiOFh6WkpKVkk2Z2tQQjQ1UWxYUi9rRU1IVEJyRjFXVkdYTHQrOTFqUkxtRmora2ppcnNnbFpvazllN1FNNUJ4MiIsIm1hYyI6ImFlNDk5ZGQ3NTgxMjJmNjdkY2VjZWQxOTIxMTg2N2U5OTE3MDAxN2E5YTdlYWE2MWQ1MmI0ODQ5ODQzZjYyZTQiLCJ0YWciOiIifQ==', '2022-03-13 14:42:58', '2022-08-03 23:52:06'),
('coinpayments_private_key', 'eyJpdiI6IlU3d00yeDloNG50M1dubzFQYXprdHc9PSIsInZhbHVlIjoiL2JyelhYWlg5cXYwV1VNWWFwQkNUNUJaT3p4bzlTcW5vajJ3eW5yR0ZrdHloQjdvVjNVTFp0MEFpMnBtcHpFYUZRVW96S2FPOWpUZFZWcjM2QWpSR0tNbTQxVk1sTGJtUUFpdkFZVlh1bTg9IiwibWFjIjoiMjdjNDA2MzQzOGNmNGY4YzBkYzIxMWJkYzdmZWE5MDJjMjhmODI0ZDYyMDEwMDE0MGMyYjAyOTJmMzcyMDA3NCIsInRhZyI6IiJ9', '2022-03-13 14:42:58', '2022-08-03 23:52:06'),
('coinpayments_public_key', 'eyJpdiI6IktVOTIwbTZaUDFVbU0rWGxuWXVsUlE9PSIsInZhbHVlIjoibE9SemdlWmQ1MVNVdmlmTmtzM1A4dUVGb3JsNGJxSGZBN04yYnBFbXU2My9TVmN6bStxUGpqZTBldFpjYTVjN01yNkI1YmJ1Z2JiMWZFNElleHhaOGZJbk1NV2hScUh2RTBpR1JremFNN289IiwibWFjIjoiYTJkNjI2MDRhMzhkZDk3ODg5MWI1MjdlOWJhZWRjZTY4YmE1ZGYyMTMxNTkwZDM4YTNmNTIzNjMzYmQ2MmEzZSIsInRhZyI6IiJ9', '2022-03-13 14:42:58', '2022-08-03 23:52:06'),
('company_logo', '_company_logo_.png', '2022-02-03 22:05:35', '2023-05-26 14:30:16'),
('company_logo_light', '_company_logo_light_.png', '2022-02-03 22:05:35', '2023-05-26 14:30:16'),
('company_name', 'Trademen', '2022-02-03 22:05:35', '2023-05-04 04:53:24'),
('dashboard_coin_1', 'BTC', '2022-02-03 22:05:35', '2022-06-20 03:19:14'),
('dashboard_coin_2', 'ETH', '2022-02-03 22:05:35', '2022-06-20 03:19:14'),
('dashboard_coin_3', 'USDT', '2022-02-03 22:05:35', '2022-06-20 03:19:14'),
('dashboard_coin_4', 'BNB', '2022-02-03 22:05:35', '2022-06-20 03:19:14'),
('dashboard_coin_pair', 'USDT_IRT', '2022-02-03 22:05:35', '2023-08-05 13:30:26'),
('default_role_to_register', 'user', '2022-02-03 22:05:35', '2023-07-14 17:21:47'),
('deposit_policy_page_url', '', '2022-08-03 23:51:33', '2022-08-03 23:51:33'),
('display_google_captcha', '0', '2022-02-03 22:05:35', '2022-02-03 22:05:35'),
('enable_complete_market_anyway', '1', '2023-10-10 07:35:24', '2023-10-10 07:35:24'),
('enable_idanalyzer_kyc', '1', '2022-08-11 04:34:54', '2023-05-11 09:42:20'),
('enable_kyc_verification_in_exchange', '0', '2022-02-04 03:21:34', '2023-05-31 15:58:48'),
('enable_thirdparty_exchange', '0', '2023-05-13 05:31:33', '2023-05-14 23:38:46'),
('ethereum_blockchain_explorer', 'https://etherscan.io/', '2023-01-19 20:11:42', '2023-01-19 20:16:25'),
('ethereum_server_url', 'http://65.108.1.39', '2023-01-19 20:11:42', '2023-01-19 21:41:20'),
('ethereum_websocket_url', 'ws://65.108.1.39:8546', '2023-01-19 20:11:42', '2023-01-19 20:11:42'),
('exchange_maker_fee', '0.5', '2022-02-03 22:05:35', '2023-02-25 09:33:58'),
('exchange_taker_fee', '0.2', '2022-02-03 22:05:35', '2022-02-03 22:05:35'),
('favicon', '_favicon_.png', '2022-02-03 22:05:35', '2022-12-12 09:33:21'),
('footer_about', '\r\n\r\n\r\n        ', '2022-02-04 14:31:12', '2022-03-21 09:02:19'),
('footer_address', 'Khulna, Bangladesh.', '2022-02-03 22:05:35', '2022-02-03 22:05:35'),
('footer_copyright_text', '', '2022-03-21 09:03:14', '2022-03-21 09:05:37'),
('footer_email', 'codemenco@gmail.com', '2022-02-03 22:05:35', '2022-02-04 14:31:12'),
('footer_menu_1', 'footer-nav-one', '2022-02-03 22:05:35', '2022-02-03 22:05:35'),
('footer_menu_2', 'footer-nav-two', '2022-02-03 22:05:35', '2022-02-03 22:05:35'),
('footer_menu_3', 'footer-nav-three', '2022-02-03 22:05:35', '2022-02-03 22:05:35'),
('footer_menu_title_1', 'About Trademen', '2022-02-03 22:05:35', '2022-02-03 22:05:35'),
('footer_menu_title_2', 'Products', '2022-02-03 22:05:35', '2022-02-03 22:05:35'),
('footer_menu_title_3', 'Social', '2022-02-03 22:05:35', '2022-02-03 22:05:35'),
('footer_phone_number', '+1 (205) 724‑9145‬', '2022-02-03 22:05:35', '2022-02-04 14:31:12'),
('home_page_popup', '0', '2022-09-29 07:10:40', '2022-09-29 07:10:40'),
('home_page_popup_img', '_home_page_popup_img_.png', '2022-09-29 07:10:40', '2022-09-29 07:10:40'),
('idanalyzer_kyc_api', 'wG83kYCsne1TnhRY0TdJ8c6pnoYxnK44', '2022-08-11 04:34:54', '2022-08-11 04:41:24'),
('is_admin_approval_required', '0', '2022-02-03 22:05:35', '2023-08-08 15:14:28'),
('is_email_confirmation_required', '0', '2023-03-07 10:54:02', '2023-08-08 15:14:28'),
('lang', 'en', '2022-02-03 22:05:35', '2023-09-27 16:54:38'),
('lang_switcher', '1', '2022-02-03 22:05:35', '2023-09-27 16:54:38'),
('lang_switcher_item', 'name', '2022-02-03 22:05:35', '2024-03-17 11:54:28'),
('layout_mode_dark', '1', '2022-02-03 22:05:35', '2023-07-30 08:21:05'),
('live_chart', '1', '2022-02-04 03:21:34', '2022-02-04 03:21:34'),
('maintenance_mode', '0', '2022-02-03 22:05:35', '2023-09-17 17:36:03'),
('navigation_type', '2', '2022-02-03 22:05:35', '2023-03-01 05:49:48'),
('no_header_layout', '0', '2022-02-03 22:05:35', '2023-05-11 09:42:10'),
('preloader', '1', '2022-12-28 00:17:52', '2023-05-12 01:41:16'),
('referral', '1', '2022-02-03 22:05:35', '2022-02-03 22:05:35'),
('referral_percentage', '2', '2022-02-03 22:05:35', '2022-02-03 22:05:35'),
('register_bonus_amount', '2', '2022-08-20 17:49:53', '2023-02-26 06:20:49'),
('register_bonus_status', '1', '2022-08-20 17:49:53', '2023-05-09 00:40:52'),
('register_bonus_symbol', 'TRX', '2022-08-20 17:49:53', '2023-02-26 06:20:49'),
('registration_active_status', '1', '2022-02-03 22:05:35', '2022-12-01 09:14:02'),
('require_email_verification', '0', '2022-02-03 22:05:35', '2023-09-17 15:54:05'),
('require_mobile_verification', '0', '2022-12-01 09:14:02', '2023-09-17 15:54:05'),
('robot_active_status', '1', '2022-02-04 03:27:30', '2023-09-05 08:53:28'),
('robot_time_purge', '1', '2022-02-04 03:27:30', '2023-09-05 08:47:47'),
('robot_time_work', '60', '2022-02-04 03:27:30', '2024-02-28 05:37:19'),
('side_nav', '1', '2023-03-01 05:49:04', '2023-10-05 16:48:10'),
('side_nav_fixed', '0', '2022-02-03 22:05:35', '2023-05-17 07:34:28'),
('sms_provider_service', '0', '2022-12-01 09:14:02', '2023-09-17 15:54:05'),
('stake_policy_page_url', '', '2022-06-23 06:01:51', '2022-06-23 06:01:51'),
('thirdparty_api_key', '646b5cb64acb120001910ba2', '2023-05-13 05:31:34', '2023-05-22 08:45:43'),
('thirdparty_passphrase', 'Codemen11o6811*', '2023-05-13 05:31:34', '2023-05-13 05:31:34'),
('thirdparty_provider', 'kucoin', '2023-05-13 05:31:33', '2023-05-13 05:31:33'),
('thirdparty_secrete_key', '6fe3b7e9-5e2c-45da-8a38-72988b9ce842', '2023-05-13 05:31:34', '2023-05-22 08:45:43'),
('trading_price_tolerance', '90', '2022-02-03 22:05:35', '2023-02-07 00:12:41'),
('tron_api_key', 'a7a1445c-7e79-489f-9853-dd3fef458ea5', '2022-02-05 19:37:54', '2023-08-06 05:04:19'),
('twilo_auth', '', '2022-12-01 09:14:02', '2022-12-01 09:14:02'),
('twilo_sender', '', '2022-12-01 09:14:02', '2022-12-01 09:14:02'),
('twilo_sid', '', '2022-12-01 09:14:02', '2022-12-01 09:14:02'),
('withdrawal_confirmation_link_expire_in', '2', '2023-03-07 10:54:02', '2023-03-07 10:54:02'),
('withdrawal_policy_page_url', '', '2023-03-07 10:54:02', '2023-03-07 10:54:02');

-- --------------------------------------------------------

--
-- Table structure for table `bank_accounts`
--

CREATE TABLE `bank_accounts` (
  `id` char(36) NOT NULL,
  `user_id` char(36) DEFAULT NULL,
  `country_id` bigint(20) UNSIGNED DEFAULT NULL,
  `bank_name` varchar(255) NOT NULL,
  `iban` varchar(255) NOT NULL,
  `swift` varchar(255) NOT NULL,
  `reference_number` varchar(255) DEFAULT NULL,
  `account_holder` varchar(255) DEFAULT NULL,
  `bank_address` varchar(255) DEFAULT NULL,
  `account_holder_address` varchar(255) DEFAULT NULL,
  `is_verified` int(11) NOT NULL DEFAULT 0,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bank_accounts`
--

INSERT INTO `bank_accounts` (`id`, `user_id`, `country_id`, `bank_name`, `iban`, `swift`, `reference_number`, `account_holder`, `bank_address`, `account_holder_address`, `is_verified`, `is_active`, `created_at`, `updated_at`) VALUES
('113d42ba-abbc-40e5-aa2c-52211c8502aa', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 1, 'Mellat2', '0213131', '123123', NULL, 'Hamidreza2', 'Esfahani', 'Esfahani', 1, 0, '2023-04-05 12:29:52', '2023-10-17 18:21:14'),
('14ea785d-94b2-464b-9723-8b3a4af60cc6', NULL, 202, 'softwared', 'IR070120020000004619282533', '0', '002', '128976349102386490132864', 'today', 'Ferdowsi Branch wednesday', 1, 1, '2023-02-25 06:52:30', '2023-07-25 23:47:30'),
('28db6892-0a14-48f0-836c-ccfb9ccfea0d', 'a502eb20-d81c-4f3e-a56f-11444fe1e4cb', 202, 'std', 'sj982934', 'xt37429', NULL, 'studio', 'dfdwesd', 'dasdasdsa', 1, 1, '2023-05-07 02:32:40', '2023-07-08 09:53:50'),
('2e7c61d8-6def-4655-b2ef-f12f186e34d1', 'e7862d9c-fba8-4509-b59b-a4cb4f71ba04', 205, 'Bankinter', 'ES3801280030310100078414', 'BKBKESMMXXX', NULL, 'Jorge Dandart', 'Av. Diagonal, 371. 08008', 'Jaen', 0, 1, '2023-08-23 06:24:22', '2023-08-23 06:24:22'),
('321c30d1-04c3-495a-ab0c-56ef278e0c42', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 1, 'Mellat', '0213131', '123123', NULL, 'Hamidreza', 'Esfahan', 'Esfahan', 1, 0, '2023-04-05 12:29:33', '2023-10-17 18:21:21'),
('40017e9a-c2a2-4e08-a2cc-125e2916c072', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', NULL, 'ملت', '070120020000004619282533', '6104338904796451', NULL, 'Codemen', NULL, NULL, 1, 1, '2023-10-18 10:48:31', '2023-10-18 10:49:02'),
('55cb453b-0a59-4bdb-b64d-f6f897feb45c', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 1, '213213', '123123', '12312312', NULL, 'sdfgdsffgds', 'rtfrewfgds', 'sdfgsdg', 1, 0, '2023-05-09 00:31:50', '2023-10-17 18:21:27'),
('dc598cda-202d-4801-9045-1e9ee333064a', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 2, '213213', '123123', '12312312', '1232', '123123', 'asdewqe32342wq', '123123213', 1, 0, '2023-05-08 23:39:36', '2023-10-17 18:21:36'),
('e035be98-e5c9-4241-a3ed-97e597751771', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 1, 'Mellat', '0213131', '123123', NULL, 'Hamidreza', 'Esfahan', 'Esfahan', 1, 1, '2023-04-05 10:09:45', '2024-01-19 14:02:09');

-- --------------------------------------------------------

--
-- Table structure for table `coins`
--

CREATE TABLE `coins` (
  `symbol` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL,
  `token_info` text DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `decimal_place` int(11) DEFAULT NULL,
  `property_id` bigint(20) UNSIGNED DEFAULT NULL,
  `contract_address` varchar(255) DEFAULT NULL,
  `exchange_status` tinyint(1) NOT NULL DEFAULT 1,
  `deposit_status` tinyint(1) NOT NULL DEFAULT 0,
  `deposit_fee` decimal(13,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `deposit_fee_type` varchar(20) NOT NULL DEFAULT 'fixed',
  `minimum_deposit_amount` decimal(19,8) UNSIGNED DEFAULT NULL,
  `total_deposit` decimal(19,8) UNSIGNED NOT NULL DEFAULT 0.00000000,
  `total_deposit_fee` decimal(19,8) UNSIGNED NOT NULL DEFAULT 0.00000000,
  `withdrawal_status` tinyint(1) NOT NULL DEFAULT 0,
  `withdrawal_fee` decimal(13,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `withdrawal_fee_type` varchar(20) NOT NULL DEFAULT 'fixed',
  `minimum_withdrawal_amount` decimal(19,8) UNSIGNED DEFAULT NULL,
  `daily_withdrawal_limit` decimal(19,8) UNSIGNED DEFAULT NULL,
  `total_withdrawal` decimal(19,8) UNSIGNED NOT NULL DEFAULT 0.00000000,
  `total_withdrawal_fee` decimal(19,8) UNSIGNED NOT NULL DEFAULT 0.00000000,
  `api` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coins`
--

INSERT INTO `coins` (`symbol`, `name`, `type`, `token_info`, `icon`, `decimal_place`, `property_id`, `contract_address`, `exchange_status`, `deposit_status`, `deposit_fee`, `deposit_fee_type`, `minimum_deposit_amount`, `total_deposit`, `total_deposit_fee`, `withdrawal_status`, `withdrawal_fee`, `withdrawal_fee_type`, `minimum_withdrawal_amount`, `daily_withdrawal_limit`, `total_withdrawal`, `total_withdrawal_fee`, `api`, `is_active`, `created_at`, `updated_at`) VALUES
('BTC', 'Bitcoin', 'trc20', '', '__BTC.png', 8, NULL, 'TN3W4H6rK2ce4vX9YnFQHwKENnHjoxb3m9', 1, 1, 0.00, 'fixed', NULL, 0.00000000, 0.00000000, 1, 0.00, 'fixed', 0.00050000, 25.00000000, 0.00000000, 0.00000000, '{\"selected_apis\":\"BitcoinForkedApi\"}', 1, '2023-05-21 10:25:41', '2024-01-22 02:52:38'),
('DOGE', 'Dogecoin', 'trc20', '', '__DOGE.png', 8, NULL, 'THbVQp8kMjStKNnf2iCY6NEzThKMK5aBHg', 1, 1, 0.00, 'fixed', NULL, 0.00000000, 0.00000000, 1, 0.00, 'fixed', 1.00000000, 1000.00000000, 0.00000000, 0.00000000, '{\"selected_apis\":\"Internal\"}', 1, '2023-05-21 10:31:49', '2023-10-27 05:09:49'),
('ETH', 'Ethereum', 'trc20', '', '__ETH.png', 18, NULL, 'THb4CqiFdwNHsWsQCs4JhzwjMWys4aqCbF', 1, 1, 0.00, 'fixed', NULL, 0.00000000, 0.00000000, 1, 0.00, 'fixed', 0.05000000, 50.00000000, 0.00000000, 0.00000000, '{\"selected_apis\":\"ERC20Api\"}', 1, '2023-05-21 10:29:13', '2024-04-08 13:38:16'),
('GRMS', 'GRMS', 'crypto', 'a', '__GRMS.png', NULL, NULL, NULL, 1, 1, 1.00, 'fixed', NULL, 0.00000000, 0.00000000, 1, 1.00, 'fixed', 1.00000000, 10000000.00000000, 0.00000000, 0.00000000, '{\"selected_apis\":\"BitcoinForkedApi\"}', 1, '2024-01-22 02:53:24', '2024-01-28 06:05:46'),
('IRT', 'Toman', 'fiat', '', '__IRT.png', NULL, NULL, NULL, 1, 1, 0.00, 'fixed', 1000.00000000, 0.00000000, 0.00000000, 1, 0.00, 'fixed', 10000.00000000, 0.00000000, 0.00000000, 0.00000000, '{\"selected_apis\":[\"BankApi\",\"MellatApi\"],\"selected_banks\":[\"14ea785d-94b2-464b-9723-8b3a4af60cc6\"]}', 1, '2023-05-21 10:36:00', '2024-02-28 05:34:37'),
('MATIC', 'Polygon', 'crypto', 'https://polygon.technology/', '__MATIC.png', NULL, NULL, NULL, 1, 1, 1.00, 'fixed', NULL, 0.00000000, 0.00000000, 1, 1.00, 'fixed', 1.00000000, 10000000.00000000, 0.00000000, 0.00000000, '{\"selected_apis\":\"EthereumApi\"}', 1, '2024-02-19 05:26:37', '2024-02-19 05:32:06'),
('TRX', 'Tron', 'crypto', '', '__TRX.png', NULL, NULL, NULL, 1, 1, 0.00, 'fixed', NULL, 0.00000000, 0.00000000, 1, 0.00, 'fixed', 1.00000000, 1000000.00000000, 0.00000000, 0.00000000, '{\"selected_apis\":\"TronApi\"}', 1, '2023-05-21 10:23:31', '2023-05-21 10:24:07'),
('USD', 'United State Dollar', 'fiat', '', '__USD.png', NULL, NULL, NULL, 0, 1, 1.00, 'fixed', 1.00000000, 0.00000000, 0.00000000, 1, 0.00, 'fixed', 1.00000000, 10000.00000000, 0.00000000, 0.00000000, '{\"selected_apis\":[\"BankApi\",\"ADVCashApi\",\"PaypalApi\"],\"selected_banks\":[\"14ea785d-94b2-464b-9723-8b3a4af60cc6\"]}', 1, '2023-05-21 10:33:01', '2023-06-07 08:34:35'),
('USDT', 'Tether', 'trc20', '', '__USDT.png', 6, NULL, 'TR7NHqjeKQxGTCi8q8ZY4pL8otSzgjLj6t', 1, 1, 0.00, 'fixed', NULL, 0.00000000, 0.00000000, 1, 0.00, 'fixed', 10.00000000, 10000.00000000, 0.00000000, 0.00000000, '{\"selected_apis\":\"TRC20Api\"}', 1, '2023-05-21 10:27:21', '2023-05-21 10:27:44');

-- --------------------------------------------------------

--
-- Table structure for table `coin_bonuses`
--

CREATE TABLE `coin_bonuses` (
  `id` char(36) NOT NULL,
  `name` char(100) NOT NULL,
  `symbol` varchar(10) NOT NULL,
  `minimum_amount` decimal(19,8) UNSIGNED NOT NULL,
  `maximum_amount` decimal(19,8) UNSIGNED NOT NULL,
  `bonus_usage_count` int(10) UNSIGNED NOT NULL,
  `coin_earning` varchar(10) NOT NULL,
  `bonus_earning_type` varchar(20) NOT NULL DEFAULT 'percent',
  `bonus_earning` decimal(19,2) NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coin_pairs`
--

CREATE TABLE `coin_pairs` (
  `name` varchar(20) NOT NULL,
  `trade_coin` varchar(10) NOT NULL,
  `base_coin` varchar(10) NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `is_default` int(11) NOT NULL DEFAULT 0,
  `is_futures` int(1) NOT NULL DEFAULT 0,
  `last_price` decimal(19,8) UNSIGNED NOT NULL DEFAULT 0.00000000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coin_pairs`
--

INSERT INTO `coin_pairs` (`name`, `trade_coin`, `base_coin`, `is_active`, `is_default`, `is_futures`, `last_price`, `created_at`, `updated_at`) VALUES
('BTC_USDT', 'BTC', 'USDT', 1, 0, 0, 64980.01000000, '2023-05-21 10:37:13', '2024-04-21 09:18:13'),
('DOGE_USDT', 'DOGE', 'USDT', 1, 1, 0, 0.15932000, '2023-06-07 08:32:27', '2024-04-21 09:18:13'),
('ETH_USDT', 'ETH', 'USDT', 1, 0, 0, 3148.50000000, '2023-06-07 08:33:21', '2023-06-07 08:33:21'),
('TRX_USDT', 'TRX', 'USDT', 1, 0, 0, 0.11074000, '2023-06-07 08:33:49', '2023-06-07 08:33:49'),
('USDT_IRT', 'USDT', 'IRT', 1, 0, 0, 64139.00000000, '2023-06-07 08:34:57', '2024-04-09 10:49:36');

-- --------------------------------------------------------

--
-- Table structure for table `coin_stakes`
--

CREATE TABLE `coin_stakes` (
  `id` char(36) NOT NULL,
  `name` char(100) NOT NULL,
  `symbol` varchar(10) NOT NULL,
  `minimum_amount` decimal(19,2) UNSIGNED NOT NULL,
  `stake_fee_type` varchar(20) NOT NULL DEFAULT 'percent',
  `stake_fee` decimal(19,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `stake_month` int(10) UNSIGNED NOT NULL,
  `stake_earning_type` varchar(20) NOT NULL DEFAULT 'percent',
  `stake_earning` decimal(19,2) NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coin_stakes`
--

INSERT INTO `coin_stakes` (`id`, `name`, `symbol`, `minimum_amount`, `stake_fee_type`, `stake_fee`, `stake_month`, `stake_earning_type`, `stake_earning`, `is_active`, `created_at`, `updated_at`) VALUES
('252a4165-8cb5-4d12-b143-4d137b60fcd3', 'Gold', 'TRX', 10000000.00, 'fixed', 100.00, 1, 'fixed', 1000.00, 1, '2023-05-21 10:24:37', '2023-05-21 10:24:37'),
('71c289ad-c2f9-442a-9672-dc15ef64e878', 'Gold', 'ETH', 0.05, 'fixed', 0.10, 1, 'fixed', 0.10, 1, '2023-05-21 10:30:03', '2023-05-21 10:30:03'),
('82644f55-66d2-4ca1-94a6-12d751ab1c85', 'Gold', 'BTC', 0.00, 'fixed', 0.01, 1, 'fixed', 0.01, 1, '2023-05-21 10:26:31', '2023-05-21 10:26:31');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(2) NOT NULL,
  `phone_code` varchar(5) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `code`, `phone_code`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Afghanistan', 'AF', '93', 1, NULL, NULL),
(2, 'Albania', 'AL', '355', 1, NULL, NULL),
(3, 'Algeria', 'DZ', '213', 1, NULL, NULL),
(4, 'American Samoa', 'AS', '1684', 1, NULL, NULL),
(5, 'Andorra', 'AD', '376', 1, NULL, NULL),
(6, 'Angola', 'AO', '244', 1, NULL, NULL),
(7, 'Anguilla', 'AI', '1264', 1, NULL, NULL),
(8, 'Antarctica', 'AQ', '0', 1, NULL, NULL),
(9, 'Antigua And Barbuda', 'AG', '1268', 1, NULL, NULL),
(10, 'Argentina', 'AR', '54', 1, NULL, NULL),
(11, 'Armenia', 'AM', '374', 1, NULL, NULL),
(12, 'Aruba', 'AW', '297', 1, NULL, NULL),
(13, 'Australia', 'AU', '61', 1, NULL, NULL),
(14, 'Austria', 'AT', '43', 1, NULL, NULL),
(15, 'Azerbaijan', 'AZ', '994', 1, NULL, NULL),
(16, 'Bahamas The', 'BS', '1242', 1, NULL, NULL),
(17, 'Bahrain', 'BH', '973', 1, NULL, NULL),
(18, 'Bangladesh', 'BD', '880', 1, NULL, NULL),
(19, 'Barbados', 'BB', '1246', 1, NULL, NULL),
(20, 'Belarus', 'BY', '375', 1, NULL, NULL),
(21, 'Belgium', 'BE', '32', 1, NULL, NULL),
(22, 'Belize', 'BZ', '501', 1, NULL, NULL),
(23, 'Benin', 'BJ', '229', 1, NULL, NULL),
(24, 'Bermuda', 'BM', '1441', 1, NULL, NULL),
(25, 'Bhutan', 'BT', '975', 1, NULL, NULL),
(26, 'Bolivia', 'BO', '591', 1, NULL, NULL),
(27, 'Bosnia and Herzegovina', 'BA', '387', 1, NULL, NULL),
(28, 'Botswana', 'BW', '267', 1, NULL, NULL),
(29, 'Bouvet Island', 'BV', '0', 1, NULL, NULL),
(30, 'Brazil', 'BR', '55', 1, NULL, NULL),
(31, 'British Indian Ocean Territory', 'IO', '246', 1, NULL, NULL),
(32, 'Brunei', 'BN', '673', 1, NULL, NULL),
(33, 'Bulgaria', 'BG', '359', 1, NULL, NULL),
(34, 'Burkina Faso', 'BF', '226', 1, NULL, NULL),
(35, 'Burundi', 'BI', '257', 1, NULL, NULL),
(36, 'Cambodia', 'KH', '855', 1, NULL, NULL),
(37, 'Cameroon', 'CM', '237', 1, NULL, NULL),
(38, 'Canada', 'CA', '1', 1, NULL, NULL),
(39, 'Cape Verde', 'CV', '238', 1, NULL, NULL),
(40, 'Cayman Islands', 'KY', '1345', 1, NULL, NULL),
(41, 'Central African Republic', 'CF', '236', 1, NULL, NULL),
(42, 'Chad', 'TD', '235', 1, NULL, NULL),
(43, 'Chile', 'CL', '56', 1, NULL, NULL),
(44, 'China', 'CN', '86', 1, NULL, NULL),
(45, 'Christmas Island', 'CX', '61', 1, NULL, NULL),
(46, 'Cocos (Keeling) Islands', 'CC', '672', 1, NULL, NULL),
(47, 'Colombia', 'CO', '57', 1, NULL, NULL),
(48, 'Comoros', 'KM', '269', 1, NULL, NULL),
(49, 'Congo', 'CG', '242', 1, NULL, NULL),
(50, 'Congo The Democratic Republic Of The', 'CD', '242', 1, NULL, NULL),
(51, 'Cook Islands', 'CK', '682', 1, NULL, NULL),
(52, 'Costa Rica', 'CR', '506', 1, NULL, NULL),
(53, 'Cote D Ivoire (Ivory Coast)', 'CI', '225', 1, NULL, NULL),
(54, 'Croatia (Hrvatska)', 'HR', '385', 1, NULL, NULL),
(55, 'Cuba', 'CU', '53', 1, NULL, NULL),
(56, 'Cyprus', 'CY', '357', 1, NULL, NULL),
(57, 'Czech Republic', 'CZ', '420', 1, NULL, NULL),
(58, 'Denmark', 'DK', '45', 1, NULL, NULL),
(59, 'Djibouti', 'DJ', '253', 1, NULL, NULL),
(60, 'Dominica', 'DM', '1767', 1, NULL, NULL),
(61, 'Dominican Republic', 'DO', '1809', 1, NULL, NULL),
(62, 'East Timor', 'TP', '670', 1, NULL, NULL),
(63, 'Ecuador', 'EC', '593', 1, NULL, NULL),
(64, 'Egypt', 'EG', '20', 1, NULL, NULL),
(65, 'El Salvador', 'SV', '503', 1, NULL, NULL),
(66, 'Equatorial Guinea', 'GQ', '240', 1, NULL, NULL),
(67, 'Eritrea', 'ER', '291', 1, NULL, NULL),
(68, 'Estonia', 'EE', '372', 1, NULL, NULL),
(69, 'Ethiopia', 'ET', '251', 1, NULL, NULL),
(70, 'External Territories of Australia', 'XA', '61', 1, NULL, NULL),
(71, 'Falkland Islands', 'FK', '500', 1, NULL, NULL),
(72, 'Faroe Islands', 'FO', '298', 1, NULL, NULL),
(73, 'Fiji Islands', 'FJ', '679', 1, NULL, NULL),
(74, 'Finland', 'FI', '358', 1, NULL, NULL),
(75, 'France', 'FR', '33', 1, NULL, NULL),
(76, 'French Guiana', 'GF', '594', 1, NULL, NULL),
(77, 'French Polynesia', 'PF', '689', 1, NULL, NULL),
(78, 'French Southern Territories', 'TF', '0', 1, NULL, NULL),
(79, 'Gabon', 'GA', '241', 1, NULL, NULL),
(80, 'Gambia The', 'GM', '220', 1, NULL, NULL),
(81, 'Georgia', 'GE', '995', 1, NULL, NULL),
(82, 'Germany', 'DE', '49', 1, NULL, NULL),
(83, 'Ghana', 'GH', '233', 1, NULL, NULL),
(84, 'Gibraltar', 'GI', '350', 1, NULL, NULL),
(85, 'Greece', 'GR', '30', 1, NULL, NULL),
(86, 'Greenland', 'GL', '299', 1, NULL, NULL),
(87, 'Grenada', 'GD', '1473', 1, NULL, NULL),
(88, 'Guadeloupe', 'GP', '590', 1, NULL, NULL),
(89, 'Guam', 'GU', '1671', 1, NULL, NULL),
(90, 'Guatemala', 'GT', '502', 1, NULL, NULL),
(91, 'Guernsey and Alderney', 'XU', '44', 1, NULL, NULL),
(92, 'Guinea', 'GN', '224', 1, NULL, NULL),
(93, 'Guinea-Bissau', 'GW', '245', 1, NULL, NULL),
(94, 'Guyana', 'GY', '592', 1, NULL, NULL),
(95, 'Haiti', 'HT', '509', 1, NULL, NULL),
(96, 'Heard and McDonald Islands', 'HM', '0', 1, NULL, NULL),
(97, 'Honduras', 'HN', '504', 1, NULL, NULL),
(98, 'Hong Kong S.A.R.', 'HK', '852', 1, NULL, NULL),
(99, 'Hungary', 'HU', '36', 1, NULL, NULL),
(100, 'Iceland', 'IS', '354', 1, NULL, NULL),
(101, 'India', 'IN', '91', 1, NULL, NULL),
(102, 'Indonesia', 'ID', '62', 1, NULL, NULL),
(103, 'Iran', 'IR', '98', 1, NULL, NULL),
(104, 'Iraq', 'IQ', '964', 1, NULL, NULL),
(105, 'Ireland', 'IE', '353', 1, NULL, NULL),
(106, 'Israel', 'IL', '972', 1, NULL, NULL),
(107, 'Italy', 'IT', '39', 1, NULL, NULL),
(108, 'Jamaica', 'JM', '1876', 1, NULL, NULL),
(109, 'Japan', 'JP', '81', 1, NULL, NULL),
(110, 'Jersey', 'XJ', '44', 1, NULL, NULL),
(111, 'Jordan', 'JO', '962', 1, NULL, NULL),
(112, 'Kazakhstan', 'KZ', '7', 1, NULL, NULL),
(113, 'Kenya', 'KE', '254', 1, NULL, NULL),
(114, 'Kiribati', 'KI', '686', 1, NULL, NULL),
(115, 'Korea North', 'KP', '850', 1, NULL, NULL),
(116, 'Korea South', 'KR', '82', 1, NULL, NULL),
(117, 'Kuwait', 'KW', '965', 1, NULL, NULL),
(118, 'Kyrgyzstan', 'KG', '996', 1, NULL, NULL),
(119, 'Laos', 'LA', '856', 1, NULL, NULL),
(120, 'Latvia', 'LV', '371', 1, NULL, NULL),
(121, 'Lebanon', 'LB', '961', 1, NULL, NULL),
(122, 'Lesotho', 'LS', '266', 1, NULL, NULL),
(123, 'Liberia', 'LR', '231', 1, NULL, NULL),
(124, 'Libya', 'LY', '218', 1, NULL, NULL),
(125, 'Liechtenstein', 'LI', '423', 1, NULL, NULL),
(126, 'Lithuania', 'LT', '370', 1, NULL, NULL),
(127, 'Luxembourg', 'LU', '352', 1, NULL, NULL),
(128, 'Macau S.A.R.', 'MO', '853', 1, NULL, NULL),
(129, 'Macedonia', 'MK', '389', 1, NULL, NULL),
(130, 'Madagascar', 'MG', '261', 1, NULL, NULL),
(131, 'Malawi', 'MW', '265', 1, NULL, NULL),
(132, 'Malaysia', 'MY', '60', 1, NULL, NULL),
(133, 'Maldives', 'MV', '960', 1, NULL, NULL),
(134, 'Mali', 'ML', '223', 1, NULL, NULL),
(135, 'Malta', 'MT', '356', 1, NULL, NULL),
(136, 'Man (Isle of)', 'XM', '44', 1, NULL, NULL),
(137, 'Marshall Islands', 'MH', '692', 1, NULL, NULL),
(138, 'Martinique', 'MQ', '596', 1, NULL, NULL),
(139, 'Mauritania', 'MR', '222', 1, NULL, NULL),
(140, 'Mauritius', 'MU', '230', 1, NULL, NULL),
(141, 'Mayotte', 'YT', '269', 1, NULL, NULL),
(142, 'Mexico', 'MX', '52', 1, NULL, NULL),
(143, 'Micronesia', 'FM', '691', 1, NULL, NULL),
(144, 'Moldova', 'MD', '373', 1, NULL, NULL),
(145, 'Monaco', 'MC', '377', 1, NULL, NULL),
(146, 'Mongolia', 'MN', '976', 1, NULL, NULL),
(147, 'Montserrat', 'MS', '1664', 1, NULL, NULL),
(148, 'Morocco', 'MA', '212', 1, NULL, NULL),
(149, 'Mozambique', 'MZ', '258', 1, NULL, NULL),
(150, 'Myanmar', 'MM', '95', 1, NULL, NULL),
(151, 'Namibia', 'NA', '264', 1, NULL, NULL),
(152, 'Nauru', 'NR', '674', 1, NULL, NULL),
(153, 'Nepal', 'NP', '977', 1, NULL, NULL),
(154, 'Netherlands Antilles', 'AN', '599', 1, NULL, NULL),
(155, 'Netherlands The', 'NL', '31', 1, NULL, NULL),
(156, 'New Caledonia', 'NC', '687', 1, NULL, NULL),
(157, 'New Zealand', 'NZ', '64', 1, NULL, NULL),
(158, 'Nicaragua', 'NI', '505', 1, NULL, NULL),
(159, 'Niger', 'NE', '227', 1, NULL, NULL),
(160, 'Nigeria', 'NG', '234', 1, NULL, NULL),
(161, 'Niue', 'NU', '683', 1, NULL, NULL),
(162, 'Norfolk Island', 'NF', '672', 1, NULL, NULL),
(163, 'Northern Mariana Islands', 'MP', '1670', 1, NULL, NULL),
(164, 'Norway', 'NO', '47', 1, NULL, NULL),
(165, 'Oman', 'OM', '968', 1, NULL, NULL),
(166, 'Pakistan', 'PK', '92', 1, NULL, NULL),
(167, 'Palau', 'PW', '680', 1, NULL, NULL),
(168, 'Palestinian Territory Occupied', 'PS', '970', 1, NULL, NULL),
(169, 'Panama', 'PA', '507', 1, NULL, NULL),
(170, 'Papua new Guinea', 'PG', '675', 1, NULL, NULL),
(171, 'Paraguay', 'PY', '595', 1, NULL, NULL),
(172, 'Peru', 'PE', '51', 1, NULL, NULL),
(173, 'Philippines', 'PH', '63', 1, NULL, NULL),
(174, 'Pitcairn Island', 'PN', '0', 1, NULL, NULL),
(175, 'Poland', 'PL', '48', 1, NULL, NULL),
(176, 'Portugal', 'PT', '351', 1, NULL, NULL),
(177, 'Puerto Rico', 'PR', '1787', 1, NULL, NULL),
(178, 'Qatar', 'QA', '974', 1, NULL, NULL),
(179, 'Reunion', 'RE', '262', 1, NULL, NULL),
(180, 'Romania', 'RO', '40', 1, NULL, NULL),
(181, 'Russia', 'RU', '70', 1, NULL, NULL),
(182, 'Rwanda', 'RW', '250', 1, NULL, NULL),
(183, 'Saint Helena', 'SH', '290', 1, NULL, NULL),
(184, 'Saint Kitts And Nevis', 'KN', '1869', 1, NULL, NULL),
(185, 'Saint Lucia', 'LC', '1758', 1, NULL, NULL),
(186, 'Saint Pierre and Miquelon', 'PM', '508', 1, NULL, NULL),
(187, 'Saint Vincent And The Grenadines', 'VC', '1784', 1, NULL, NULL),
(188, 'Samoa', 'WS', '684', 1, NULL, NULL),
(189, 'San Marino', 'SM', '378', 1, NULL, NULL),
(190, 'Sao Tome and Principe', 'ST', '239', 1, NULL, NULL),
(191, 'Saudi Arabia', 'SA', '966', 1, NULL, NULL),
(192, 'Senegal', 'SN', '221', 1, NULL, NULL),
(193, 'Serbia', 'RS', '381', 1, NULL, NULL),
(194, 'Seychelles', 'SC', '248', 1, NULL, NULL),
(195, 'Sierra Leone', 'SL', '232', 1, NULL, NULL),
(196, 'Singapore', 'SG', '65', 1, NULL, NULL),
(197, 'Slovakia', 'SK', '421', 1, NULL, NULL),
(198, 'Slovenia', 'SI', '386', 1, NULL, NULL),
(199, 'Smaller Territories of the UK', 'XG', '44', 1, NULL, NULL),
(200, 'Solomon Islands', 'SB', '677', 1, NULL, NULL),
(201, 'Somalia', 'SO', '252', 1, NULL, NULL),
(202, 'South Africa', 'ZA', '27', 1, NULL, NULL),
(203, 'South Georgia', 'GS', '0', 1, NULL, NULL),
(204, 'South Sudan', 'SS', '211', 1, NULL, NULL),
(205, 'Spain', 'ES', '34', 1, NULL, NULL),
(206, 'Sri Lanka', 'LK', '94', 1, NULL, NULL),
(207, 'Sudan', 'SD', '249', 1, NULL, NULL),
(208, 'Suriname', 'SR', '597', 1, NULL, NULL),
(209, 'Svalbard And Jan Mayen Islands', 'SJ', '47', 1, NULL, NULL),
(210, 'Swaziland', 'SZ', '268', 1, NULL, NULL),
(211, 'Sweden', 'SE', '46', 1, NULL, NULL),
(212, 'Switzerland', 'CH', '41', 1, NULL, NULL),
(213, 'Syria', 'SY', '963', 1, NULL, NULL),
(214, 'Taiwan', 'TW', '886', 1, NULL, NULL),
(215, 'Tajikistan', 'TJ', '992', 1, NULL, NULL),
(216, 'Tanzania', 'TZ', '255', 1, NULL, NULL),
(217, 'Thailand', 'TH', '66', 1, NULL, NULL),
(218, 'Togo', 'TG', '228', 1, NULL, NULL),
(219, 'Tokelau', 'TK', '690', 1, NULL, NULL),
(220, 'Tonga', 'TO', '676', 1, NULL, NULL),
(221, 'Trinidad And Tobago', 'TT', '1868', 1, NULL, NULL),
(222, 'Tunisia', 'TN', '216', 1, NULL, NULL),
(223, 'Turkey', 'TR', '90', 1, NULL, NULL),
(224, 'Turkmenistan', 'TM', '7370', 1, NULL, NULL),
(225, 'Turks And Caicos Islands', 'TC', '1649', 1, NULL, NULL),
(226, 'Tuvalu', 'TV', '688', 1, NULL, NULL),
(227, 'Uganda', 'UG', '256', 1, NULL, NULL),
(228, 'Ukraine', 'UA', '380', 1, NULL, NULL),
(229, 'United Arab Emirates', 'AE', '971', 1, NULL, NULL),
(230, 'United Kingdom', 'GB', '44', 1, NULL, NULL),
(231, 'United States', 'US', '1', 1, NULL, NULL),
(232, 'United States Minor Outlying Islands', 'UM', '1', 1, NULL, NULL),
(233, 'Uruguay', 'UY', '598', 1, NULL, NULL),
(234, 'Uzbekistan', 'UZ', '998', 1, NULL, NULL),
(235, 'Vanuatu', 'VU', '678', 1, NULL, NULL),
(236, 'Vatican City State (Holy See)', 'VA', '39', 1, NULL, NULL),
(237, 'Venezuela', 'VE', '58', 1, NULL, NULL),
(238, 'Vietnam', 'VN', '84', 1, NULL, NULL),
(239, 'Virgin Islands (British)', 'VG', '1284', 1, NULL, NULL),
(240, 'Virgin Islands (US)', 'VI', '1340', 1, NULL, NULL),
(241, 'Wallis And Futuna Islands', 'WF', '681', 1, NULL, NULL),
(242, 'Western Sahara', 'EH', '212', 1, NULL, NULL),
(243, 'Yemen', 'YE', '967', 1, NULL, NULL),
(244, 'Yugoslavia', 'YU', '38', 1, NULL, NULL),
(245, 'Zambia', 'ZM', '260', 1, NULL, NULL),
(246, 'Zimbabwe', 'ZW', '263', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ethereum_deposits`
--

CREATE TABLE `ethereum_deposits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` char(36) NOT NULL,
  `symbol` varchar(10) NOT NULL,
  `receiver_address` varchar(255) NOT NULL,
  `sender_address` varchar(255) NOT NULL,
  `system_address` varchar(255) NOT NULL,
  `txn_id_1` varchar(255) NOT NULL,
  `txn_id_2` varchar(255) DEFAULT NULL,
  `received` decimal(19,8) NOT NULL,
  `sent` decimal(19,8) DEFAULT NULL,
  `network_fee` decimal(19,8) DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exchanges`
--

CREATE TABLE `exchanges` (
  `id` char(36) NOT NULL,
  `user_id` char(36) NOT NULL,
  `order_id` char(36) NOT NULL,
  `trade_coin` varchar(10) NOT NULL,
  `base_coin` varchar(10) NOT NULL,
  `trade_pair` varchar(20) NOT NULL,
  `amount` decimal(32,8) UNSIGNED NOT NULL,
  `price` decimal(32,8) UNSIGNED NOT NULL,
  `total` decimal(32,8) UNSIGNED NOT NULL,
  `fee` decimal(32,8) UNSIGNED NOT NULL,
  `referral_earning` decimal(32,8) NOT NULL DEFAULT 0.00000000,
  `order_type` varchar(255) NOT NULL,
  `related_order_id` char(36) DEFAULT NULL,
  `is_maker` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exchanges`
--

INSERT INTO `exchanges` (`id`, `user_id`, `order_id`, `trade_coin`, `base_coin`, `trade_pair`, `amount`, `price`, `total`, `fee`, `referral_earning`, `order_type`, `related_order_id`, `is_maker`, `created_at`, `updated_at`) VALUES
('00003b5c-19dc-4b6a-9d63-9cb6854a3c0b', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'b5c42e49-cc15-4e2d-810c-b9bbe6d770c4', 'BTC', 'USDT', 'BTC_USDT', 0.00300000, 43000.17000000, 129.00051000, 0.25800102, 0.00000000, 'sell', '506670a2-ac01-44af-a4bc-c7096931ae49', 0, '2024-01-31 05:05:46', '2024-01-31 05:05:46'),
('0375f2e2-0992-4b0d-988b-0e37be790c7f', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', '7728be97-bf8d-4dc8-bc54-f59ec49841fb', 'USDT', 'IRT', 'USDT_IRT', 3133.28000000, 503880.00000000, 3133.28000000, 15.66640000, 0.00000000, 'sell', '12178a4c-a714-4ad6-9fc2-ae5b939d0e77', 1, '2023-09-05 08:44:00', '2023-09-05 08:44:00'),
('07087b85-4944-4824-ab86-832f114fee60', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', '0983c8d0-82e5-4b27-8742-d26099293a70', 'USDT', 'IRT', 'USDT_IRT', 95.72000000, 503530.00000000, 48197891.60000000, 240989.45800000, 0.00000000, 'sell', '1cb52969-980d-49ab-98de-aafc4619b358', 1, '2023-09-05 08:54:06', '2023-09-05 08:54:06'),
('07c2c2a2-bbe0-4824-93eb-7ec15b3937da', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', '6bd08239-b188-46c4-a1d4-4c523770e39b', 'USDT', 'IRT', 'USDT_IRT', 20.00000000, 503600.00000000, 20.00000000, 0.10000000, 0.00000000, 'buy', 'd0a98ee5-f59c-43a2-b498-5c74dae8b9b7', 1, '2023-09-05 08:48:00', '2023-09-05 08:48:00'),
('0d7f341f-eefb-482a-be91-1e1959b4e166', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', '66d804c7-6b9d-4561-b8f4-f47b50b63523', 'BTC', 'USDT', 'BTC_USDT', 4.00000000, 65158.00000000, 260632.00000000, 1303.16000000, 0.00000000, 'sell', '566756e7-9a3c-4df0-b2ef-b793715e74d8', 1, '2024-04-09 01:44:44', '2024-04-09 01:44:44'),
('0f2c7c1f-6c16-421c-94bc-c2193034da3d', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', '1cb52969-980d-49ab-98de-aafc4619b358', 'USDT', 'IRT', 'USDT_IRT', 95.72000000, 503890.00000000, 48232350.80000000, 0.19144000, 0.00000000, 'buy', '0983c8d0-82e5-4b27-8742-d26099293a70', 0, '2023-09-05 08:54:06', '2023-09-05 08:54:06'),
('1529672e-86e0-4879-b2b0-3af632f0df00', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', 'b82ebbec-c66f-41d7-b386-2509fa46b4bd', 'USDT', 'IRT', 'USDT_IRT', 393.60000000, 503530.00000000, 393.60000000, 1.96800000, 0.00000000, 'buy', '0983c8d0-82e5-4b27-8742-d26099293a70', 1, '2023-09-05 08:43:00', '2023-09-05 08:43:00'),
('19995cae-5d20-45b6-9153-dda6af0c841a', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', '1a5b018a-5007-49d7-b008-67abe98b9ff6', 'USDT', 'IRT', 'USDT_IRT', 2776.24000000, 503880.00000000, 2776.24000000, 5.55248000, 0.00000000, 'buy', '77962bb1-93f5-4a59-b5f3-812654eb2685', 0, '2023-09-05 08:45:00', '2023-09-05 08:45:00'),
('19e2c2ad-44d0-449d-9b27-617e370c58d5', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', '60c5740f-d5d2-4eb2-9cef-c56584f794fe', 'USDT', 'IRT', 'USDT_IRT', 20.10000000, 64139.00000000, 20.10000000, 0.04020000, 0.00000000, 'buy', 'c32a1678-f14f-4f9b-8784-1eb0533b0795', 0, '2024-04-09 10:39:00', '2024-04-09 10:39:00'),
('1a2f7629-88e0-4de1-b066-183cef9df72e', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', 'b2c7ccd8-3074-4579-96fa-b30204f6254c', 'USDT', 'IRT', 'USDT_IRT', 99.68000000, 503890.00000000, 99.68000000, 0.49840000, 0.00000000, 'sell', '1f10571d-7270-472b-848d-d4d2c9dba86d', 1, '2023-09-05 08:43:00', '2023-09-05 08:43:00'),
('1b057bf5-332e-45b1-9bc0-985b5f61a3a4', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', '12178a4c-a714-4ad6-9fc2-ae5b939d0e77', 'USDT', 'IRT', 'USDT_IRT', 3133.28000000, 503880.00000000, 3133.28000000, 6.26656000, 0.00000000, 'buy', '7728be97-bf8d-4dc8-bc54-f59ec49841fb', 0, '2023-09-05 08:44:00', '2023-09-05 08:44:00'),
('1d97ef2c-fed0-4bcb-bff7-75dce2097e2a', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', 'b2a799b1-5151-4806-be4f-f01b761a46fb', 'USDT', 'IRT', 'USDT_IRT', 95.72000000, 503890.00000000, 48232350.80000000, 0.19144000, 0.00000000, 'buy', '0983c8d0-82e5-4b27-8742-d26099293a70', 0, '2023-09-05 08:55:31', '2023-09-05 08:55:31'),
('20cc11ff-60e2-4355-a80b-eead314f3b3b', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', '976083a6-94de-4fe0-9a41-be2e34451315', 'USDT', 'IRT', 'USDT_IRT', 99.68000000, 503890.00000000, 99.68000000, 0.19936000, 0.00000000, 'buy', '86ab3dac-4f4a-43b3-9bcd-83a4e9fff247', 0, '2023-09-05 08:43:00', '2023-09-05 08:43:00'),
('2b83b88e-1c2d-48c9-924a-d1f5b4e38298', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', '1f10571d-7270-472b-848d-d4d2c9dba86d', 'USDT', 'IRT', 'USDT_IRT', 99.68000000, 503890.00000000, 50227755.20000000, 0.19936000, 0.00000000, 'buy', 'b2c7ccd8-3074-4579-96fa-b30204f6254c', 0, '2023-09-05 08:53:42', '2023-09-05 08:53:42'),
('30746a21-406f-47bf-b7ed-6ceb7fb0176f', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', 'bb7a1c9f-881f-4304-bd95-da913c3b3c14', 'USDT', 'IRT', 'USDT_IRT', 145.00000000, 503900.00000000, 145.00000000, 0.29000000, 0.00000000, 'buy', '8e9182f3-5971-4b5a-807a-0854c8c42c18', 0, '2023-09-05 08:53:00', '2023-09-05 08:53:00'),
('33f746e1-4b7a-4eff-a657-9440f9764785', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', '0efbdc9b-76be-4739-9df3-a3578924c535', 'USDT', 'IRT', 'USDT_IRT', 134.10000000, 503600.00000000, 67532760.00000000, 0.26820000, 0.00000000, 'buy', '0983c8d0-82e5-4b27-8742-d26099293a70', 0, '2023-09-05 08:54:42', '2023-09-05 08:54:42'),
('3bc9dd27-00b0-409b-b96c-5e541649ba45', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', 'e127d573-6cc1-47b8-88a5-3e3b569e7c27', 'USDT', 'IRT', 'USDT_IRT', 3097.39000000, 503880.00000000, 3097.39000000, 15.48695000, 0.00000000, 'sell', 'efa689ad-5dc8-476d-a397-7b4ab78a2373', 1, '2023-09-05 08:44:00', '2023-09-05 08:44:00'),
('3ebc7844-35e9-4808-9a8b-255198e622c6', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', '506670a2-ac01-44af-a4bc-c7096931ae49', 'BTC', 'USDT', 'BTC_USDT', 0.00300000, 43000.17000000, 129.00051000, 0.00001500, 0.00000000, 'buy', 'b5c42e49-cc15-4e2d-810c-b9bbe6d770c4', 1, '2024-01-31 05:05:46', '2024-01-31 05:05:46'),
('400084a5-7b24-4547-8b56-7a19621b9987', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', '94e120de-4bea-4fee-892a-d8568cb72095', 'USDT', 'IRT', 'USDT_IRT', 573.86000000, 503880.00000000, 573.86000000, 1.14772000, 0.00000000, 'buy', '391b4dda-539a-48ac-a24d-d40b9c048d28', 0, '2023-09-05 08:45:00', '2023-09-05 08:45:00'),
('431bf006-e9cb-4c5f-bb56-a1a39f61e6d5', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', '1f10571d-7270-472b-848d-d4d2c9dba86d', 'USDT', 'IRT', 'USDT_IRT', 99.68000000, 503890.00000000, 99.68000000, 0.19936000, 0.00000000, 'buy', 'b2c7ccd8-3074-4579-96fa-b30204f6254c', 0, '2023-09-05 08:43:00', '2023-09-05 08:43:00'),
('48b7d096-4a63-494f-98de-0c662ec2b6aa', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', '1c91fb33-86f6-4c92-a5a0-afbedd65c324', 'USDT', 'IRT', 'USDT_IRT', 573.86000000, 503880.00000000, 573.86000000, 1.14772000, 0.00000000, 'buy', '275d236b-f569-4338-9314-bcdce1db979d', 0, '2023-09-05 08:45:00', '2023-09-05 08:45:00'),
('4dbc2abf-1ca2-432f-8ca4-0466108939bc', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', '4e42dcd2-29fd-4f2a-a2cb-afec629abc8b', 'BTC', 'USDT', 'BTC_USDT', 1.00000000, 70202.82000000, 70202.82000000, 0.00500000, 0.00000000, 'buy', '4ff3f357-0958-4679-bd58-857b742ecc85', 1, '2024-04-09 10:43:44', '2024-04-09 10:43:44'),
('50af0b12-b0d3-4aa0-a62d-bdbdce8c40f9', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', '0983c8d0-82e5-4b27-8742-d26099293a70', 'USDT', 'IRT', 'USDT_IRT', 95.72000000, 503530.00000000, 48197891.60000000, 240989.45800000, 0.00000000, 'sell', 'b2a799b1-5151-4806-be4f-f01b761a46fb', 1, '2023-09-05 08:55:31', '2023-09-05 08:55:31'),
('5bc336ae-86eb-4bd1-9ae9-6807f0f003c1', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', '5447f2a8-a728-4222-ae96-6e2aaa47a429', 'USDT', 'IRT', 'USDT_IRT', 68.06000000, 503530.00000000, 34270251.80000000, 0.13612000, 0.00000000, 'buy', '0983c8d0-82e5-4b27-8742-d26099293a70', 0, '2023-09-05 08:55:36', '2023-09-05 08:55:36'),
('5be02795-c2d4-4cff-b570-dc7a26a2dd2f', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', '84c478b5-f7c4-49ef-afcd-db4fb476227d', 'USDT', 'IRT', 'USDT_IRT', 1670.00000000, 504000.00000000, 1670.00000000, 3.34000000, 0.00000000, 'buy', '5b6f4550-d2ca-4e71-b5f2-1c02ebb4f22a', 0, '2023-09-05 08:41:00', '2023-09-05 08:41:00'),
('5cad4ca8-924f-42e8-bca7-e0011c73af69', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', 'c11c141f-9d6b-48ea-bed4-efb2c8df99cf', 'USDT', 'IRT', 'USDT_IRT', 74.82000000, 50892.00000000, 74.82000000, 0.37410000, 0.00000000, 'buy', '41b64b5e-cbeb-41b2-8919-ad7015e34e84', 1, '2023-11-30 06:25:00', '2023-11-30 06:25:00'),
('5d807c48-1d28-47a3-a139-0a8904ea147f', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', '8b05aa2e-218e-4b06-9c79-fe5c41056cb2', 'BTC', 'USDT', 'BTC_USDT', 1.00000000, 70303.80000000, 70303.80000000, 351.51900000, 0.00000000, 'sell', '0e2a698e-1347-4187-9f30-a9022e1a1206', 1, '2024-04-09 10:45:11', '2024-04-09 10:45:11'),
('62167884-1f27-41a5-938b-25c9cf273093', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', 'e30f5622-3ac6-4f1c-9bc6-9c9326bdbb83', 'USDT', 'IRT', 'USDT_IRT', 95.72000000, 503890.00000000, 95.72000000, 0.47860000, 0.00000000, 'sell', 'b2a799b1-5151-4806-be4f-f01b761a46fb', 1, '2023-09-05 08:51:00', '2023-09-05 08:51:00'),
('62fb0769-a8f1-4fc4-a49d-aa1341e316fd', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', 'b2a799b1-5151-4806-be4f-f01b761a46fb', 'USDT', 'IRT', 'USDT_IRT', 95.72000000, 503890.00000000, 95.72000000, 0.19144000, 0.00000000, 'buy', 'e30f5622-3ac6-4f1c-9bc6-9c9326bdbb83', 0, '2023-09-05 08:51:00', '2023-09-05 08:51:00'),
('636c4e00-d165-441b-b827-2443709c392e', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', '77962bb1-93f5-4a59-b5f3-812654eb2685', 'USDT', 'IRT', 'USDT_IRT', 2776.24000000, 503880.00000000, 2776.24000000, 13.88120000, 0.00000000, 'sell', '1a5b018a-5007-49d7-b008-67abe98b9ff6', 1, '2023-09-05 08:45:00', '2023-09-05 08:45:00'),
('6bef9b5a-0ea9-4b23-b6bb-f32abddf7428', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', '5bd6b512-258d-4519-abb6-69bcce95bc78', 'BTC', 'USDT', 'BTC_USDT', 0.00060000, 3029.00000000, 1.81740000, 0.04929103, 0.00000000, 'sell', '35f0521d-6d93-4241-9323-ed1c22c89aa1', 0, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('73df222e-3192-4c0e-a153-92a5e140be22', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', '0efbdc9b-76be-4739-9df3-a3578924c535', 'USDT', 'IRT', 'USDT_IRT', 134.10000000, 503600.00000000, 134.10000000, 0.67050000, 0.00000000, 'buy', '6c11ebd9-c3d6-41ad-a5d5-6f05543a86bf', 1, '2023-09-05 08:44:00', '2023-09-05 08:44:00'),
('7d139c13-cf70-415f-8940-995d94c678f4', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', '0e2a698e-1347-4187-9f30-a9022e1a1206', 'BTC', 'USDT', 'BTC_USDT', 1.00000000, 70303.80000000, 70303.80000000, 0.00200000, 0.00000000, 'buy', '8b05aa2e-218e-4b06-9c79-fe5c41056cb2', 0, '2024-04-09 10:45:11', '2024-04-09 10:45:11'),
('81229565-cc42-44a9-ad54-5de88a9660ac', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', 'efa689ad-5dc8-476d-a397-7b4ab78a2373', 'USDT', 'IRT', 'USDT_IRT', 68.06000000, 503880.00000000, 34294072.80000000, 0.34030000, 0.00000000, 'buy', '19e126b3-77f7-4af7-8a9b-74f9ce8f8381', 1, '2023-09-05 08:55:36', '2023-09-05 08:55:36'),
('815a73ed-dfe7-4c74-a255-1446e36d275c', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', '5447f2a8-a728-4222-ae96-6e2aaa47a429', 'USDT', 'IRT', 'USDT_IRT', 357.29000000, 503530.00000000, 357.29000000, 1.78645000, 0.00000000, 'buy', '19e126b3-77f7-4af7-8a9b-74f9ce8f8381', 1, '2023-09-05 08:45:00', '2023-09-05 08:45:00'),
('871e7084-0448-4baf-bb32-4593e81fce19', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', 'b2c7ccd8-3074-4579-96fa-b30204f6254c', 'USDT', 'IRT', 'USDT_IRT', 99.68000000, 503890.00000000, 50227755.20000000, 251138.77600000, 0.00000000, 'sell', '1f10571d-7270-472b-848d-d4d2c9dba86d', 1, '2023-09-05 08:53:42', '2023-09-05 08:53:42'),
('8a78924a-6fc8-4728-abbc-2571df87886c', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', '19e126b3-77f7-4af7-8a9b-74f9ce8f8381', 'USDT', 'IRT', 'USDT_IRT', 289.23000000, 503530.00000000, 145635981.90000000, 291271.96380000, 0.00000000, 'sell', '5447f2a8-a728-4222-ae96-6e2aaa47a429', 0, '2023-09-05 08:55:36', '2023-09-05 08:55:36'),
('8d54aa3a-a4ff-4c72-af67-cc90b8d9417b', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', 'c32a1678-f14f-4f9b-8784-1eb0533b0795', 'USDT', 'IRT', 'USDT_IRT', 20.10000000, 64139.00000000, 20.10000000, 0.10050000, 0.00000000, 'sell', '60c5740f-d5d2-4eb2-9cef-c56584f794fe', 1, '2024-04-09 10:39:00', '2024-04-09 10:39:00'),
('8e008fcc-24eb-4d4d-87e9-87b015078542', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', '0983c8d0-82e5-4b27-8742-d26099293a70', 'USDT', 'IRT', 'USDT_IRT', 68.06000000, 503530.00000000, 34270251.80000000, 171351.25900000, 0.00000000, 'sell', '5447f2a8-a728-4222-ae96-6e2aaa47a429', 1, '2023-09-05 08:55:36', '2023-09-05 08:55:36'),
('9259fe5a-b78a-4529-92a7-6eda53031363', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', '86ab3dac-4f4a-43b3-9bcd-83a4e9fff247', 'USDT', 'IRT', 'USDT_IRT', 99.68000000, 503890.00000000, 99.68000000, 0.49840000, 0.00000000, 'sell', '976083a6-94de-4fe0-9a41-be2e34451315', 1, '2023-09-05 08:43:00', '2023-09-05 08:43:00'),
('945e2870-78f4-405e-a69e-33141002b2ad', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', '391b4dda-539a-48ac-a24d-d40b9c048d28', 'USDT', 'IRT', 'USDT_IRT', 573.86000000, 503880.00000000, 573.86000000, 2.86930000, 0.00000000, 'sell', '94e120de-4bea-4fee-892a-d8568cb72095', 1, '2023-09-05 08:45:00', '2023-09-05 08:45:00'),
('9eac5fd9-4e4f-4c9b-a271-95b62ce17f79', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', '5b6f4550-d2ca-4e71-b5f2-1c02ebb4f22a', 'USDT', 'IRT', 'USDT_IRT', 1670.00000000, 504000.00000000, 1670.00000000, 8.35000000, 0.00000000, 'sell', '84c478b5-f7c4-49ef-afcd-db4fb476227d', 1, '2023-09-05 08:41:00', '2023-09-05 08:41:00'),
('a6989153-22d3-442f-9dfc-851eac966215', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', '93e50d16-1d7b-41f6-a29b-c5cb6fa83ab0', 'USDT', 'IRT', 'USDT_IRT', 84.96000000, 503520.00000000, 84.96000000, 0.42480000, 0.00000000, 'buy', '781b6d0b-adf6-4d69-af5b-a9100500a3ef', 1, '2023-09-05 08:52:00', '2023-09-05 08:52:00'),
('ab208f81-640c-4399-862c-78437d7a6109', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', '4ff3f357-0958-4679-bd58-857b742ecc85', 'BTC', 'USDT', 'BTC_USDT', 1.00000000, 70202.82000000, 70202.82000000, 140.40564000, 0.00000000, 'sell', '4e42dcd2-29fd-4f2a-a2cb-afec629abc8b', 0, '2024-04-09 10:43:44', '2024-04-09 10:43:44'),
('af84f876-59a3-49c4-b0aa-ffa26a9cde81', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', '6c11ebd9-c3d6-41ad-a5d5-6f05543a86bf', 'USDT', 'IRT', 'USDT_IRT', 134.10000000, 503600.00000000, 134.10000000, 0.26820000, 0.00000000, 'sell', '0efbdc9b-76be-4739-9df3-a3578924c535', 0, '2023-09-05 08:44:00', '2023-09-05 08:44:00'),
('b235a824-2143-4830-93f6-c649aa944d8a', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', '35f0521d-6d93-4241-9323-ed1c22c89aa1', 'BTC', 'USDT', 'BTC_USDT', 0.00060000, 41075.86000000, 24.64551600, 0.00000300, 0.00000000, 'buy', '5bd6b512-258d-4519-abb6-69bcce95bc78', 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('b4046326-24fc-4bfe-a091-946a36abc801', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', '0983c8d0-82e5-4b27-8742-d26099293a70', 'USDT', 'IRT', 'USDT_IRT', 393.60000000, 503530.00000000, 393.60000000, 0.78720000, 0.00000000, 'sell', 'b82ebbec-c66f-41d7-b386-2509fa46b4bd', 0, '2023-09-05 08:43:00', '2023-09-05 08:43:00'),
('b9dfe4df-ccba-413f-97b9-f9f54d5de6d5', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', '33eb159f-73e4-4da5-9aae-7be788537755', 'USDT', 'IRT', 'USDT_IRT', 95.72000000, 503890.00000000, 95.72000000, 0.47860000, 0.00000000, 'sell', '1cb52969-980d-49ab-98de-aafc4619b358', 1, '2023-09-05 08:48:00', '2023-09-05 08:48:00'),
('c4501c7f-f03f-4d31-8733-80bb010dba25', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', '275d236b-f569-4338-9314-bcdce1db979d', 'USDT', 'IRT', 'USDT_IRT', 573.86000000, 503880.00000000, 573.86000000, 2.86930000, 0.00000000, 'sell', '1c91fb33-86f6-4c92-a5a0-afbedd65c324', 1, '2023-09-05 08:45:00', '2023-09-05 08:45:00'),
('c7a72e04-fd6f-4757-88b1-c5013015f6d0', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', '566756e7-9a3c-4df0-b2ef-b793715e74d8', 'BTC', 'USDT', 'BTC_USDT', 4.00000000, 65158.00000000, 260632.00000000, 0.00800000, 0.00000000, 'buy', '66d804c7-6b9d-4561-b8f4-f47b50b63523', 0, '2024-04-09 01:44:44', '2024-04-09 01:44:44'),
('cd0d78ed-4f2c-427a-b63c-ee70385c470d', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', 'f687fdf7-c21b-48f3-a839-717df3176ee4', 'USDT', 'IRT', 'USDT_IRT', 367.23000000, 503530.00000000, 367.23000000, 0.73446000, 0.00000000, 'sell', 'd3e5c548-ecfa-4425-b74d-089340bccb36', 0, '2023-09-05 08:45:00', '2023-09-05 08:45:00'),
('cffe6792-a3b9-475d-a61c-72215ac04bab', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', '5447f2a8-a728-4222-ae96-6e2aaa47a429', 'USDT', 'IRT', 'USDT_IRT', 289.23000000, 503530.00000000, 145635981.90000000, 1.44615000, 0.00000000, 'buy', '19e126b3-77f7-4af7-8a9b-74f9ce8f8381', 1, '2023-09-05 08:55:36', '2023-09-05 08:55:36'),
('d1c59987-0921-402d-8113-0b0962757876', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', '19e126b3-77f7-4af7-8a9b-74f9ce8f8381', 'USDT', 'IRT', 'USDT_IRT', 68.06000000, 503530.00000000, 34270251.80000000, 68540.50360000, 0.00000000, 'sell', 'efa689ad-5dc8-476d-a397-7b4ab78a2373', 0, '2023-09-05 08:55:36', '2023-09-05 08:55:36'),
('d46bf20c-22a5-4629-ac5a-f93fa394966c', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', '8e9182f3-5971-4b5a-807a-0854c8c42c18', 'USDT', 'IRT', 'USDT_IRT', 145.00000000, 503900.00000000, 145.00000000, 0.72500000, 0.00000000, 'sell', 'bb7a1c9f-881f-4304-bd95-da913c3b3c14', 1, '2023-09-05 08:53:00', '2023-09-05 08:53:00'),
('d501ef14-0805-4139-86ad-b1ec4ce62496', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', '41b64b5e-cbeb-41b2-8919-ad7015e34e84', 'USDT', 'IRT', 'USDT_IRT', 74.82000000, 50892.00000000, 74.82000000, 0.14964000, 0.00000000, 'sell', 'c11c141f-9d6b-48ea-bed4-efb2c8df99cf', 0, '2023-11-30 06:25:00', '2023-11-30 06:25:00'),
('dc019978-90d1-4509-b3c7-f1007aa70e21', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', '1cb52969-980d-49ab-98de-aafc4619b358', 'USDT', 'IRT', 'USDT_IRT', 95.72000000, 503890.00000000, 95.72000000, 0.19144000, 0.00000000, 'buy', '33eb159f-73e4-4da5-9aae-7be788537755', 0, '2023-09-05 08:48:00', '2023-09-05 08:48:00'),
('dd90a478-92fd-4370-bd9a-7233bb798f49', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', '1b2c2965-ccb9-4cb9-afe7-34df5369df45', 'USDT', 'IRT', 'USDT_IRT', 9781.37000000, 503990.00000000, 9781.37000000, 19.56274000, 0.00000000, 'buy', 'a01c266d-c8c8-4a2b-9218-10f1008c1bf0', 0, '2023-09-05 08:38:00', '2023-09-05 08:38:00'),
('e6ced6de-cdee-4faa-9a81-6a7bc65ea712', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', '19e126b3-77f7-4af7-8a9b-74f9ce8f8381', 'USDT', 'IRT', 'USDT_IRT', 357.29000000, 503530.00000000, 357.29000000, 0.71458000, 0.00000000, 'sell', '5447f2a8-a728-4222-ae96-6e2aaa47a429', 0, '2023-09-05 08:45:00', '2023-09-05 08:45:00'),
('e6f0fad2-4164-496e-a788-04be7e4b0496', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', 'd0a98ee5-f59c-43a2-b498-5c74dae8b9b7', 'USDT', 'IRT', 'USDT_IRT', 20.00000000, 503600.00000000, 20.00000000, 0.04000000, 0.00000000, 'sell', '6bd08239-b188-46c4-a1d4-4c523770e39b', 0, '2023-09-05 08:48:00', '2023-09-05 08:48:00'),
('eaf965d7-5ce2-422f-bd9f-cb0752fe5338', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', '0983c8d0-82e5-4b27-8742-d26099293a70', 'USDT', 'IRT', 'USDT_IRT', 134.10000000, 503530.00000000, 67523373.00000000, 337616.86500000, 0.00000000, 'sell', '0efbdc9b-76be-4739-9df3-a3578924c535', 1, '2023-09-05 08:54:42', '2023-09-05 08:54:42'),
('edcd7c12-a046-4e82-b984-41d2821324d2', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', 'efa689ad-5dc8-476d-a397-7b4ab78a2373', 'USDT', 'IRT', 'USDT_IRT', 3097.39000000, 503880.00000000, 3097.39000000, 6.19478000, 0.00000000, 'buy', 'e127d573-6cc1-47b8-88a5-3e3b569e7c27', 0, '2023-09-05 08:44:00', '2023-09-05 08:44:00'),
('f59e5dc8-1443-41db-abe1-fda2de656698', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', 'a01c266d-c8c8-4a2b-9218-10f1008c1bf0', 'USDT', 'IRT', 'USDT_IRT', 9781.37000000, 503990.00000000, 9781.37000000, 48.90685000, 0.00000000, 'sell', '1b2c2965-ccb9-4cb9-afe7-34df5369df45', 1, '2023-09-05 08:38:00', '2023-09-05 08:38:00'),
('fd746abd-f368-4c09-8bf4-77e20bcb44f9', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', 'd3e5c548-ecfa-4425-b74d-089340bccb36', 'USDT', 'IRT', 'USDT_IRT', 367.23000000, 503530.00000000, 367.23000000, 1.83615000, 0.00000000, 'buy', 'f687fdf7-c21b-48f3-a839-717df3176ee4', 1, '2023-09-05 08:45:00', '2023-09-05 08:45:00'),
('ffb07c24-ab20-42fb-9b39-ab2491f4471f', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', '781b6d0b-adf6-4d69-af5b-a9100500a3ef', 'USDT', 'IRT', 'USDT_IRT', 84.96000000, 503520.00000000, 84.96000000, 0.16992000, 0.00000000, 'sell', '93e50d16-1d7b-41f6-a29b-c5cb6fa83ab0', 0, '2023-09-05 08:52:00', '2023-09-05 08:52:00');

-- --------------------------------------------------------

--
-- Table structure for table `exchange_data`
--

CREATE TABLE `exchange_data` (
  `date` date NOT NULL,
  `trade_pair` varchar(20) NOT NULL,
  `5min` text NOT NULL,
  `15min` text NOT NULL,
  `30min` text NOT NULL,
  `2hr` text NOT NULL,
  `4hr` text NOT NULL,
  `1day` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `failed_jobs`
--

INSERT INTO `failed_jobs` (`id`, `connection`, `queue`, `payload`, `exception`, `failed_at`) VALUES
(1, 'redis', 'default', '{\"uuid\":\"2d8a1126-da16-4954-9d5f-eae2e96394a2\",\"displayName\":\"App\\\\Mail\\\\Core\\\\AccountCreated\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":13:{s:8:\\\"mailable\\\";O:28:\\\"App\\\\Mail\\\\Core\\\\AccountCreated\\\":30:{s:7:\\\"profile\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:27:\\\"App\\\\Models\\\\Core\\\\UserProfile\\\";s:2:\\\"id\\\";s:36:\\\"91358793-af16-45ce-8830-d0cf6cd92e87\\\";s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:8:\\\"password\\\";s:6:\\\"tU6zld\\\";s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:21:\\\"admin@fxinvestpro.com\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:8:\\\"markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"},\"id\":\"2d8a1126-da16-4954-9d5f-eae2e96394a2\",\"attempts\":0,\"type\":\"mail\",\"tags\":[\"App\\\\Models\\\\Core\\\\UserProfile:91358793-af16-45ce-8830-d0cf6cd92e87\"],\"silenced\":false,\"pushedAt\":\"1685455187.5746\"}', 'ErrorException: DOMDocument::loadHTML(): Empty string supplied as input in /home/trademenn/domains/trademen.codemen.me/public_html/vendor/tijsverkoyen/css-to-inline-styles/src/CssToInlineStyles.php:116\nStack trace:\n#0 [internal function]: Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError()\n#1 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/tijsverkoyen/css-to-inline-styles/src/CssToInlineStyles.php(116): DOMDocument->loadHTML()\n#2 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/tijsverkoyen/css-to-inline-styles/src/CssToInlineStyles.php(36): TijsVerkoyen\\CssToInlineStyles\\CssToInlineStyles->createDomDocumentFromHtml()\n#3 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Mail/Markdown.php(74): TijsVerkoyen\\CssToInlineStyles\\CssToInlineStyles->convert()\n#4 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(309): Illuminate\\Mail\\Markdown->render()\n#5 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(279): Illuminate\\Mail\\Mailable->buildMarkdownView()\n#6 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(181): Illuminate\\Mail\\Mailable->buildView()\n#7 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Support/Traits/Localizable.php(19): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}()\n#8 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(188): Illuminate\\Mail\\Mailable->withLocale()\n#9 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Mail/SendQueuedMailable.php(65): Illuminate\\Mail\\Mailable->send()\n#10 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Mail\\SendQueuedMailable->handle()\n#11 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Container/Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#12 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#13 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#14 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Container/Container.php(653): Illuminate\\Container\\BoundMethod::call()\n#15 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#16 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#17 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#18 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#19 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(120): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#20 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#21 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#22 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(122): Illuminate\\Pipeline\\Pipeline->then()\n#23 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#24 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call()\n#25 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(428): Illuminate\\Queue\\Jobs\\Job->fire()\n#26 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(378): Illuminate\\Queue\\Worker->process()\n#27 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(172): Illuminate\\Queue\\Worker->runJob()\n#28 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(117): Illuminate\\Queue\\Worker->daemon()\n#29 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(101): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#30 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/horizon/src/Console/WorkCommand.php(51): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#31 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Laravel\\Horizon\\Console\\WorkCommand->handle()\n#32 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Container/Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#33 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#34 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#35 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Container/Container.php(653): Illuminate\\Container\\BoundMethod::call()\n#36 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Console/Command.php(136): Illuminate\\Container\\Container->call()\n#37 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/symfony/console/Command/Command.php(298): Illuminate\\Console\\Command->execute()\n#38 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Console/Command.php(121): Symfony\\Component\\Console\\Command\\Command->run()\n#39 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/symfony/console/Application.php(1040): Illuminate\\Console\\Command->run()\n#40 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/symfony/console/Application.php(301): Symfony\\Component\\Console\\Application->doRunCommand()\n#41 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/symfony/console/Application.php(171): Symfony\\Component\\Console\\Application->doRun()\n#42 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Console/Application.php(94): Symfony\\Component\\Console\\Application->run()\n#43 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(129): Illuminate\\Console\\Application->run()\n#44 /home/trademenn/domains/trademen.codemen.me/public_html/artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle()\n#45 {main}', '2023-06-14 18:00:20'),
(2, 'redis', 'exchange', '{\"uuid\":\"0f189cc6-9cfe-4b57-b9c1-f31bd4b850eb\",\"displayName\":\"App\\\\Jobs\\\\Order\\\\ProcessOrderJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\Order\\\\ProcessOrderJob\",\"command\":\"O:30:\\\"App\\\\Jobs\\\\Order\\\\ProcessOrderJob\\\":11:{s:37:\\\"\\u0000App\\\\Jobs\\\\Order\\\\ProcessOrderJob\\u0000order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:22:\\\"App\\\\Models\\\\Order\\\\Order\\\";s:2:\\\"id\\\";s:36:\\\"1dc5e9a4-f78d-43b1-8b6e-b9524f68e295\\\";s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";s:8:\\\"exchange\\\";s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"},\"id\":\"0f189cc6-9cfe-4b57-b9c1-f31bd4b850eb\",\"attempts\":0,\"type\":\"job\",\"tags\":[\"App\\\\Models\\\\Order\\\\Order:1dc5e9a4-f78d-43b1-8b6e-b9524f68e295\"],\"silenced\":false,\"pushedAt\":\"1685545573.6318\"}', 'ErrorException: Trying to get property \'last_price\' of non-object in /home/trademenn/domains/trademen.codemen.me/public_html/app/Services/Orders/ProcessMarketOrderService.php:44\nStack trace:\n#0 /home/trademenn/domains/trademen.codemen.me/public_html/app/Services/Orders/ProcessMarketOrderService.php(44): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError()\n#1 /home/trademenn/domains/trademen.codemen.me/public_html/app/Providers/AppServiceProvider.php(276): App\\Services\\Orders\\ProcessMarketOrderService->__construct()\n#2 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Container/Container.php(873): App\\Providers\\AppServiceProvider->App\\Providers\\{closure}()\n#3 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Container/Container.php(758): Illuminate\\Container\\Container->build()\n#4 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(851): Illuminate\\Container\\Container->resolve()\n#5 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Container/Container.php(694): Illuminate\\Foundation\\Application->resolve()\n#6 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(836): Illuminate\\Container\\Container->make()\n#7 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Foundation/helpers.php(119): Illuminate\\Foundation\\Application->make()\n#8 /home/trademenn/domains/trademen.codemen.me/public_html/app/Jobs/Order/ProcessOrderJob.php(35): app()\n#9 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): App\\Jobs\\Order\\ProcessOrderJob->handle()\n#10 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Container/Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#11 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#12 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#13 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Container/Container.php(653): Illuminate\\Container\\BoundMethod::call()\n#14 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#15 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#16 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#17 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#18 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(120): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#19 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#20 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#21 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(122): Illuminate\\Pipeline\\Pipeline->then()\n#22 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#23 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call()\n#24 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(428): Illuminate\\Queue\\Jobs\\Job->fire()\n#25 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(378): Illuminate\\Queue\\Worker->process()\n#26 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(172): Illuminate\\Queue\\Worker->runJob()\n#27 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(117): Illuminate\\Queue\\Worker->daemon()\n#28 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(101): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#29 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/horizon/src/Console/WorkCommand.php(51): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#30 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Laravel\\Horizon\\Console\\WorkCommand->handle()\n#31 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Container/Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#32 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#33 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#34 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Container/Container.php(653): Illuminate\\Container\\BoundMethod::call()\n#35 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Console/Command.php(136): Illuminate\\Container\\Container->call()\n#36 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/symfony/console/Command/Command.php(298): Illuminate\\Console\\Command->execute()\n#37 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Console/Command.php(121): Symfony\\Component\\Console\\Command\\Command->run()\n#38 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/symfony/console/Application.php(1040): Illuminate\\Console\\Command->run()\n#39 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/symfony/console/Application.php(301): Symfony\\Component\\Console\\Application->doRunCommand()\n#40 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/symfony/console/Application.php(171): Symfony\\Component\\Console\\Application->doRun()\n#41 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Console/Application.php(94): Symfony\\Component\\Console\\Application->run()\n#42 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(129): Illuminate\\Console\\Application->run()\n#43 /home/trademenn/domains/trademen.codemen.me/public_html/artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle()\n#44 {main}', '2023-06-14 18:00:21'),
(3, 'redis', 'default', '{\"uuid\":\"4316392a-db47-424b-986b-a1e948f44deb\",\"displayName\":\"App\\\\Mail\\\\Core\\\\Registered\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":13:{s:8:\\\"mailable\\\";O:24:\\\"App\\\\Mail\\\\Core\\\\Registered\\\":31:{s:7:\\\"profile\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:27:\\\"App\\\\Models\\\\Core\\\\UserProfile\\\";s:2:\\\"id\\\";s:36:\\\"763da2bc-320c-4693-b56a-c7db8621b3e1\\\";s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:5:\\\"isApi\\\";b:0;s:16:\\\"verificationCode\\\";N;s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:19:\\\"dgarcia@yopmail.net\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:8:\\\"markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"},\"id\":\"4316392a-db47-424b-986b-a1e948f44deb\",\"attempts\":0,\"type\":\"mail\",\"tags\":[\"App\\\\Models\\\\Core\\\\UserProfile:763da2bc-320c-4693-b56a-c7db8621b3e1\"],\"pushedAt\":\"1688508093.5004\"}', 'Illuminate\\Database\\Eloquent\\ModelNotFoundException: No query results for model [App\\Models\\Core\\UserProfile]. in /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Builder.php:527\nStack trace:\n#0 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/SerializesAndRestoresModelIdentifiers.php(102): Illuminate\\Database\\Eloquent\\Builder->firstOrFail()\n#1 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/SerializesAndRestoresModelIdentifiers.php(57): App\\Mail\\Core\\Registered->restoreModel()\n#2 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/SerializesModels.php(122): App\\Mail\\Core\\Registered->getRestoredPropertyValue()\n#3 [internal function]: App\\Mail\\Core\\Registered->__unserialize()\n#4 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(97): unserialize()\n#5 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(60): Illuminate\\Queue\\CallQueuedHandler->getCommand()\n#6 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call()\n#7 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(428): Illuminate\\Queue\\Jobs\\Job->fire()\n#8 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(378): Illuminate\\Queue\\Worker->process()\n#9 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(172): Illuminate\\Queue\\Worker->runJob()\n#10 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(117): Illuminate\\Queue\\Worker->daemon()\n#11 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(101): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#12 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/horizon/src/Console/WorkCommand.php(51): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#13 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Laravel\\Horizon\\Console\\WorkCommand->handle()\n#14 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Container/Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#15 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#16 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#17 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Container/Container.php(653): Illuminate\\Container\\BoundMethod::call()\n#18 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Console/Command.php(136): Illuminate\\Container\\Container->call()\n#19 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/symfony/console/Command/Command.php(298): Illuminate\\Console\\Command->execute()\n#20 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Console/Command.php(121): Symfony\\Component\\Console\\Command\\Command->run()\n#21 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/symfony/console/Application.php(1040): Illuminate\\Console\\Command->run()\n#22 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/symfony/console/Application.php(301): Symfony\\Component\\Console\\Application->doRunCommand()\n#23 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/symfony/console/Application.php(171): Symfony\\Component\\Console\\Application->doRun()\n#24 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Console/Application.php(94): Symfony\\Component\\Console\\Application->run()\n#25 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(129): Illuminate\\Console\\Application->run()\n#26 /home/trademenn/domains/trademen.codemen.me/public_html/artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle()\n#27 {main}', '2023-07-04 18:31:34'),
(4, 'redis', 'default', '{\"pushedAt\":\"1692053540.6412\",\"uuid\":\"840f87ee-2614-48ef-be6d-076192f45117\",\"timeout\":null,\"tags\":[\"App\\\\Models\\\\Core\\\\UserProfile:9775e164-bb42-43d9-8632-3eadb3e78bcb\"],\"id\":\"840f87ee-2614-48ef-be6d-076192f45117\",\"maxExceptions\":null,\"backoff\":null,\"displayName\":\"App\\\\Mail\\\\Core\\\\Registered\",\"maxTries\":null,\"type\":\"mail\",\"failOnTimeout\":false,\"silenced\":false,\"retryUntil\":null,\"data\":{\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":13:{s:8:\\\"mailable\\\";O:24:\\\"App\\\\Mail\\\\Core\\\\Registered\\\":31:{s:7:\\\"profile\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:27:\\\"App\\\\Models\\\\Core\\\\UserProfile\\\";s:2:\\\"id\\\";s:36:\\\"9775e164-bb42-43d9-8632-3eadb3e78bcb\\\";s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:5:\\\"isApi\\\";b:0;s:16:\\\"verificationCode\\\";N;s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:19:\\\"demotunde@gmail.com\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:8:\\\"markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\",\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\"},\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"attempts\":1}', 'Illuminate\\Queue\\MaxAttemptsExceededException: App\\Mail\\Core\\Registered has been attempted too many times or run too long. The job may have previously timed out. in /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php:750\nStack trace:\n#0 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(504): Illuminate\\Queue\\Worker->maxAttemptsExceededException()\n#1 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(418): Illuminate\\Queue\\Worker->markJobAsFailedIfAlreadyExceedsMaxAttempts()\n#2 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(378): Illuminate\\Queue\\Worker->process()\n#3 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(172): Illuminate\\Queue\\Worker->runJob()\n#4 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(117): Illuminate\\Queue\\Worker->daemon()\n#5 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(101): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#6 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/horizon/src/Console/WorkCommand.php(51): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#7 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Laravel\\Horizon\\Console\\WorkCommand->handle()\n#8 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Container/Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#9 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#10 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#11 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Container/Container.php(653): Illuminate\\Container\\BoundMethod::call()\n#12 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Console/Command.php(136): Illuminate\\Container\\Container->call()\n#13 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/symfony/console/Command/Command.php(298): Illuminate\\Console\\Command->execute()\n#14 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Console/Command.php(121): Symfony\\Component\\Console\\Command\\Command->run()\n#15 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/symfony/console/Application.php(1040): Illuminate\\Console\\Command->run()\n#16 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/symfony/console/Application.php(301): Symfony\\Component\\Console\\Application->doRunCommand()\n#17 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/symfony/console/Application.php(171): Symfony\\Component\\Console\\Application->doRun()\n#18 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Console/Application.php(94): Symfony\\Component\\Console\\Application->run()\n#19 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(129): Illuminate\\Console\\Application->run()\n#20 /home/trademenn/domains/trademen.codemen.me/public_html/artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle()\n#21 {main}', '2023-08-14 19:23:53'),
(5, 'redis', 'default', '{\"pushedAt\":\"1692182734.9172\",\"uuid\":\"4a783e99-662c-4103-b55c-ccec8f8791b7\",\"timeout\":null,\"tags\":[\"App\\\\Models\\\\Core\\\\User:d86b3a4d-3a57-426e-8e1e-95a6be996bb5\"],\"id\":\"4a783e99-662c-4103-b55c-ccec8f8791b7\",\"maxExceptions\":null,\"backoff\":null,\"displayName\":\"App\\\\Mail\\\\Core\\\\ResetPassword\",\"maxTries\":null,\"type\":\"mail\",\"failOnTimeout\":false,\"silenced\":false,\"retryUntil\":null,\"data\":{\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":13:{s:8:\\\"mailable\\\";O:27:\\\"App\\\\Mail\\\\Core\\\\ResetPassword\\\":31:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:20:\\\"App\\\\Models\\\\Core\\\\User\\\";s:2:\\\"id\\\";s:36:\\\"d86b3a4d-3a57-426e-8e1e-95a6be996bb5\\\";s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:5:\\\"isApi\\\";b:0;s:16:\\\"verificationCode\\\";N;s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:19:\\\"banfasuso1@gmli.com\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:8:\\\"markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\",\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\"},\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"attempts\":1}', 'Illuminate\\Queue\\MaxAttemptsExceededException: App\\Mail\\Core\\ResetPassword has been attempted too many times or run too long. The job may have previously timed out. in /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php:750\nStack trace:\n#0 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(504): Illuminate\\Queue\\Worker->maxAttemptsExceededException()\n#1 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(418): Illuminate\\Queue\\Worker->markJobAsFailedIfAlreadyExceedsMaxAttempts()\n#2 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(378): Illuminate\\Queue\\Worker->process()\n#3 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(172): Illuminate\\Queue\\Worker->runJob()\n#4 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(117): Illuminate\\Queue\\Worker->daemon()\n#5 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(101): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#6 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/horizon/src/Console/WorkCommand.php(51): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#7 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Laravel\\Horizon\\Console\\WorkCommand->handle()\n#8 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Container/Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#9 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#10 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#11 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Container/Container.php(653): Illuminate\\Container\\BoundMethod::call()\n#12 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Console/Command.php(136): Illuminate\\Container\\Container->call()\n#13 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/symfony/console/Command/Command.php(298): Illuminate\\Console\\Command->execute()\n#14 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Console/Command.php(121): Symfony\\Component\\Console\\Command\\Command->run()\n#15 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/symfony/console/Application.php(1040): Illuminate\\Console\\Command->run()\n#16 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/symfony/console/Application.php(301): Symfony\\Component\\Console\\Application->doRunCommand()\n#17 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/symfony/console/Application.php(171): Symfony\\Component\\Console\\Application->doRun()\n#18 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Console/Application.php(94): Symfony\\Component\\Console\\Application->run()\n#19 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(129): Illuminate\\Console\\Application->run()\n#20 /home/trademenn/domains/trademen.codemen.me/public_html/artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle()\n#21 {main}', '2023-08-16 07:17:06'),
(6, 'redis', 'default', '{\"pushedAt\":\"1692533728.3689\",\"uuid\":\"b6e708f8-a58e-4678-9840-162c57ab77f6\",\"timeout\":null,\"tags\":[\"App\\\\Models\\\\Core\\\\UserProfile:389bd649-cbea-41a0-9c9b-02896f6ee67f\"],\"id\":\"b6e708f8-a58e-4678-9840-162c57ab77f6\",\"maxExceptions\":null,\"backoff\":null,\"displayName\":\"App\\\\Mail\\\\Core\\\\Registered\",\"maxTries\":null,\"type\":\"mail\",\"failOnTimeout\":false,\"silenced\":false,\"retryUntil\":null,\"data\":{\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":13:{s:8:\\\"mailable\\\";O:24:\\\"App\\\\Mail\\\\Core\\\\Registered\\\":31:{s:7:\\\"profile\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:27:\\\"App\\\\Models\\\\Core\\\\UserProfile\\\";s:2:\\\"id\\\";s:36:\\\"389bd649-cbea-41a0-9c9b-02896f6ee67f\\\";s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:5:\\\"isApi\\\";b:0;s:16:\\\"verificationCode\\\";N;s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:19:\\\"dgarcia@yopmail.net\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:8:\\\"markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\",\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\"},\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"attempts\":1}', 'Illuminate\\Queue\\MaxAttemptsExceededException: App\\Mail\\Core\\Registered has been attempted too many times or run too long. The job may have previously timed out. in /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php:750\nStack trace:\n#0 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(504): Illuminate\\Queue\\Worker->maxAttemptsExceededException()\n#1 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(418): Illuminate\\Queue\\Worker->markJobAsFailedIfAlreadyExceedsMaxAttempts()\n#2 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(378): Illuminate\\Queue\\Worker->process()\n#3 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(172): Illuminate\\Queue\\Worker->runJob()\n#4 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(117): Illuminate\\Queue\\Worker->daemon()\n#5 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(101): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#6 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/horizon/src/Console/WorkCommand.php(51): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#7 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Laravel\\Horizon\\Console\\WorkCommand->handle()\n#8 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Container/Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#9 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#10 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#11 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Container/Container.php(653): Illuminate\\Container\\BoundMethod::call()\n#12 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Console/Command.php(136): Illuminate\\Container\\Container->call()\n#13 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/symfony/console/Command/Command.php(298): Illuminate\\Console\\Command->execute()\n#14 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Console/Command.php(121): Symfony\\Component\\Console\\Command\\Command->run()\n#15 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/symfony/console/Application.php(1040): Illuminate\\Console\\Command->run()\n#16 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/symfony/console/Application.php(301): Symfony\\Component\\Console\\Application->doRunCommand()\n#17 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/symfony/console/Application.php(171): Symfony\\Component\\Console\\Application->doRun()\n#18 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Console/Application.php(94): Symfony\\Component\\Console\\Application->run()\n#19 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(129): Illuminate\\Console\\Application->run()\n#20 /home/trademenn/domains/trademen.codemen.me/public_html/artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle()\n#21 {main}', '2023-08-20 08:47:00');
INSERT INTO `failed_jobs` (`id`, `connection`, `queue`, `payload`, `exception`, `failed_at`) VALUES
(7, 'redis', 'default', '{\"pushedAt\":\"1693991331.6143\",\"uuid\":\"f1e59eac-c27e-4673-a052-3009cd77e17c\",\"timeout\":null,\"tags\":[\"App\\\\Models\\\\Core\\\\UserProfile:8d2bc7ca-1b35-4bfe-b0d6-a7917323c90c\"],\"id\":\"f1e59eac-c27e-4673-a052-3009cd77e17c\",\"maxExceptions\":null,\"backoff\":null,\"displayName\":\"App\\\\Mail\\\\Core\\\\Registered\",\"maxTries\":null,\"type\":\"mail\",\"failOnTimeout\":false,\"silenced\":false,\"retryUntil\":null,\"data\":{\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":13:{s:8:\\\"mailable\\\";O:24:\\\"App\\\\Mail\\\\Core\\\\Registered\\\":31:{s:7:\\\"profile\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:27:\\\"App\\\\Models\\\\Core\\\\UserProfile\\\";s:2:\\\"id\\\";s:36:\\\"8d2bc7ca-1b35-4bfe-b0d6-a7917323c90c\\\";s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:5:\\\"isApi\\\";b:0;s:16:\\\"verificationCode\\\";N;s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:16:\\\"admin@codemen.me\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:8:\\\"markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\",\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\"},\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"attempts\":1}', 'Illuminate\\Queue\\MaxAttemptsExceededException: App\\Mail\\Core\\Registered has been attempted too many times or run too long. The job may have previously timed out. in /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php:750\nStack trace:\n#0 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(504): Illuminate\\Queue\\Worker->maxAttemptsExceededException()\n#1 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(418): Illuminate\\Queue\\Worker->markJobAsFailedIfAlreadyExceedsMaxAttempts()\n#2 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(378): Illuminate\\Queue\\Worker->process()\n#3 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(172): Illuminate\\Queue\\Worker->runJob()\n#4 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(117): Illuminate\\Queue\\Worker->daemon()\n#5 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(101): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#6 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/horizon/src/Console/WorkCommand.php(51): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#7 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Laravel\\Horizon\\Console\\WorkCommand->handle()\n#8 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Container/Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#9 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#10 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#11 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Container/Container.php(653): Illuminate\\Container\\BoundMethod::call()\n#12 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Console/Command.php(136): Illuminate\\Container\\Container->call()\n#13 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/symfony/console/Command/Command.php(298): Illuminate\\Console\\Command->execute()\n#14 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Console/Command.php(121): Symfony\\Component\\Console\\Command\\Command->run()\n#15 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/symfony/console/Application.php(1040): Illuminate\\Console\\Command->run()\n#16 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/symfony/console/Application.php(301): Symfony\\Component\\Console\\Application->doRunCommand()\n#17 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/symfony/console/Application.php(171): Symfony\\Component\\Console\\Application->doRun()\n#18 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Console/Application.php(94): Symfony\\Component\\Console\\Application->run()\n#19 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(129): Illuminate\\Console\\Application->run()\n#20 /home/trademenn/domains/trademen.codemen.me/public_html/artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle()\n#21 {main}', '2023-09-06 05:40:24'),
(8, 'redis', 'default', '{\"pushedAt\":\"1693994765.0748\",\"uuid\":\"fe52ff54-3aa7-415f-9e8f-1f41bab3083e\",\"timeout\":null,\"tags\":[\"App\\\\Models\\\\Core\\\\UserProfile:8d2bc7ca-1b35-4bfe-b0d6-a7917323c90c\"],\"id\":\"fe52ff54-3aa7-415f-9e8f-1f41bab3083e\",\"maxExceptions\":null,\"backoff\":null,\"displayName\":\"App\\\\Mail\\\\Core\\\\Registered\",\"maxTries\":null,\"type\":\"mail\",\"failOnTimeout\":false,\"silenced\":false,\"retryUntil\":null,\"data\":{\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":13:{s:8:\\\"mailable\\\";O:24:\\\"App\\\\Mail\\\\Core\\\\Registered\\\":31:{s:7:\\\"profile\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:27:\\\"App\\\\Models\\\\Core\\\\UserProfile\\\";s:2:\\\"id\\\";s:36:\\\"8d2bc7ca-1b35-4bfe-b0d6-a7917323c90c\\\";s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:5:\\\"isApi\\\";b:1;s:16:\\\"verificationCode\\\";i:710954;s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:16:\\\"admin@codemen.me\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:8:\\\"markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\",\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\"},\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"attempts\":1}', 'Illuminate\\Queue\\MaxAttemptsExceededException: App\\Mail\\Core\\Registered has been attempted too many times or run too long. The job may have previously timed out. in /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php:750\nStack trace:\n#0 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(504): Illuminate\\Queue\\Worker->maxAttemptsExceededException()\n#1 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(418): Illuminate\\Queue\\Worker->markJobAsFailedIfAlreadyExceedsMaxAttempts()\n#2 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(378): Illuminate\\Queue\\Worker->process()\n#3 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(172): Illuminate\\Queue\\Worker->runJob()\n#4 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(117): Illuminate\\Queue\\Worker->daemon()\n#5 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(101): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#6 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/horizon/src/Console/WorkCommand.php(51): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#7 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Laravel\\Horizon\\Console\\WorkCommand->handle()\n#8 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Container/Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#9 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#10 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#11 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Container/Container.php(653): Illuminate\\Container\\BoundMethod::call()\n#12 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Console/Command.php(136): Illuminate\\Container\\Container->call()\n#13 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/symfony/console/Command/Command.php(298): Illuminate\\Console\\Command->execute()\n#14 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Console/Command.php(121): Symfony\\Component\\Console\\Command\\Command->run()\n#15 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/symfony/console/Application.php(1040): Illuminate\\Console\\Command->run()\n#16 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/symfony/console/Application.php(301): Symfony\\Component\\Console\\Application->doRunCommand()\n#17 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/symfony/console/Application.php(171): Symfony\\Component\\Console\\Application->doRun()\n#18 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Console/Application.php(94): Symfony\\Component\\Console\\Application->run()\n#19 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(129): Illuminate\\Console\\Application->run()\n#20 /home/trademenn/domains/trademen.codemen.me/public_html/artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle()\n#21 {main}', '2023-09-06 06:37:35'),
(9, 'redis', 'default', '{\"pushedAt\":\"1694309667.8917\",\"uuid\":\"c2d577f8-235e-4a13-8f97-4ef8cc520c44\",\"timeout\":null,\"tags\":[\"App\\\\Models\\\\Core\\\\UserProfile:731a43cb-261b-4110-bb30-ddd00483f249\"],\"id\":\"c2d577f8-235e-4a13-8f97-4ef8cc520c44\",\"maxExceptions\":null,\"backoff\":null,\"displayName\":\"App\\\\Mail\\\\Core\\\\Registered\",\"maxTries\":null,\"type\":\"mail\",\"failOnTimeout\":false,\"silenced\":false,\"retryUntil\":null,\"data\":{\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":13:{s:8:\\\"mailable\\\";O:24:\\\"App\\\\Mail\\\\Core\\\\Registered\\\":31:{s:7:\\\"profile\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:27:\\\"App\\\\Models\\\\Core\\\\UserProfile\\\";s:2:\\\"id\\\";s:36:\\\"731a43cb-261b-4110-bb30-ddd00483f249\\\";s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:5:\\\"isApi\\\";b:0;s:16:\\\"verificationCode\\\";N;s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:21:\\\"feihongengr@gmail.com\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:8:\\\"markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\",\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\"},\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"attempts\":1}', 'Illuminate\\Queue\\MaxAttemptsExceededException: App\\Mail\\Core\\Registered has been attempted too many times or run too long. The job may have previously timed out. in /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php:750\nStack trace:\n#0 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(504): Illuminate\\Queue\\Worker->maxAttemptsExceededException()\n#1 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(418): Illuminate\\Queue\\Worker->markJobAsFailedIfAlreadyExceedsMaxAttempts()\n#2 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(378): Illuminate\\Queue\\Worker->process()\n#3 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(172): Illuminate\\Queue\\Worker->runJob()\n#4 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(117): Illuminate\\Queue\\Worker->daemon()\n#5 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(101): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#6 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/horizon/src/Console/WorkCommand.php(51): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#7 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Laravel\\Horizon\\Console\\WorkCommand->handle()\n#8 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Container/Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#9 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#10 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#11 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Container/Container.php(653): Illuminate\\Container\\BoundMethod::call()\n#12 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Console/Command.php(136): Illuminate\\Container\\Container->call()\n#13 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/symfony/console/Command/Command.php(298): Illuminate\\Console\\Command->execute()\n#14 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Console/Command.php(121): Symfony\\Component\\Console\\Command\\Command->run()\n#15 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/symfony/console/Application.php(1040): Illuminate\\Console\\Command->run()\n#16 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/symfony/console/Application.php(301): Symfony\\Component\\Console\\Application->doRunCommand()\n#17 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/symfony/console/Application.php(171): Symfony\\Component\\Console\\Application->doRun()\n#18 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Console/Application.php(94): Symfony\\Component\\Console\\Application->run()\n#19 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(129): Illuminate\\Console\\Application->run()\n#20 /home/trademenn/domains/trademen.codemen.me/public_html/artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle()\n#21 {main}', '2023-09-09 22:06:00'),
(10, 'redis', 'default', '{\"pushedAt\":\"1694368053.0034\",\"uuid\":\"df9f5b48-8a94-4e8a-ba4f-ad2d852d4d1f\",\"timeout\":null,\"tags\":[\"App\\\\Models\\\\Core\\\\UserProfile:f5c43463-26ff-4228-9fb2-fb63fc5c22e1\"],\"id\":\"df9f5b48-8a94-4e8a-ba4f-ad2d852d4d1f\",\"maxExceptions\":null,\"backoff\":null,\"displayName\":\"App\\\\Mail\\\\Core\\\\Registered\",\"maxTries\":null,\"type\":\"mail\",\"failOnTimeout\":false,\"silenced\":false,\"retryUntil\":null,\"data\":{\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":13:{s:8:\\\"mailable\\\";O:24:\\\"App\\\\Mail\\\\Core\\\\Registered\\\":31:{s:7:\\\"profile\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:27:\\\"App\\\\Models\\\\Core\\\\UserProfile\\\";s:2:\\\"id\\\";s:36:\\\"f5c43463-26ff-4228-9fb2-fb63fc5c22e1\\\";s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:5:\\\"isApi\\\";b:0;s:16:\\\"verificationCode\\\";N;s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:20:\\\"mojoudigsm@yahoo.com\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:8:\\\"markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\",\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\"},\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"attempts\":1}', 'Illuminate\\Queue\\MaxAttemptsExceededException: App\\Mail\\Core\\Registered has been attempted too many times or run too long. The job may have previously timed out. in /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php:750\nStack trace:\n#0 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(504): Illuminate\\Queue\\Worker->maxAttemptsExceededException()\n#1 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(418): Illuminate\\Queue\\Worker->markJobAsFailedIfAlreadyExceedsMaxAttempts()\n#2 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(378): Illuminate\\Queue\\Worker->process()\n#3 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(172): Illuminate\\Queue\\Worker->runJob()\n#4 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(117): Illuminate\\Queue\\Worker->daemon()\n#5 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(101): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#6 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/horizon/src/Console/WorkCommand.php(51): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#7 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Laravel\\Horizon\\Console\\WorkCommand->handle()\n#8 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Container/Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#9 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#10 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#11 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Container/Container.php(653): Illuminate\\Container\\BoundMethod::call()\n#12 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Console/Command.php(136): Illuminate\\Container\\Container->call()\n#13 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/symfony/console/Command/Command.php(298): Illuminate\\Console\\Command->execute()\n#14 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Console/Command.php(121): Symfony\\Component\\Console\\Command\\Command->run()\n#15 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/symfony/console/Application.php(1040): Illuminate\\Console\\Command->run()\n#16 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/symfony/console/Application.php(301): Symfony\\Component\\Console\\Application->doRunCommand()\n#17 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/symfony/console/Application.php(171): Symfony\\Component\\Console\\Application->doRun()\n#18 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Console/Application.php(94): Symfony\\Component\\Console\\Application->run()\n#19 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(129): Illuminate\\Console\\Application->run()\n#20 /home/trademenn/domains/trademen.codemen.me/public_html/artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle()\n#21 {main}', '2023-09-10 14:19:04'),
(11, 'redis', 'default', '{\"pushedAt\":\"1694499104.1264\",\"uuid\":\"fddbe23b-5e48-40cf-bf80-c4895d0ba555\",\"timeout\":null,\"tags\":[\"App\\\\Models\\\\Core\\\\UserProfile:1eea3fe2-64b9-4a0d-9bbd-1c568648a3e3\"],\"id\":\"fddbe23b-5e48-40cf-bf80-c4895d0ba555\",\"maxExceptions\":null,\"backoff\":null,\"displayName\":\"App\\\\Mail\\\\Core\\\\Registered\",\"maxTries\":null,\"type\":\"mail\",\"failOnTimeout\":false,\"silenced\":false,\"retryUntil\":null,\"data\":{\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":13:{s:8:\\\"mailable\\\";O:24:\\\"App\\\\Mail\\\\Core\\\\Registered\\\":31:{s:7:\\\"profile\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:27:\\\"App\\\\Models\\\\Core\\\\UserProfile\\\";s:2:\\\"id\\\";s:36:\\\"1eea3fe2-64b9-4a0d-9bbd-1c568648a3e3\\\";s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:5:\\\"isApi\\\";b:0;s:16:\\\"verificationCode\\\";N;s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:21:\\\"mos.khodaei@gmail.com\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:8:\\\"markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\",\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\"},\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"attempts\":1}', 'Illuminate\\Queue\\MaxAttemptsExceededException: App\\Mail\\Core\\Registered has been attempted too many times or run too long. The job may have previously timed out. in /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php:750\nStack trace:\n#0 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(504): Illuminate\\Queue\\Worker->maxAttemptsExceededException()\n#1 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(418): Illuminate\\Queue\\Worker->markJobAsFailedIfAlreadyExceedsMaxAttempts()\n#2 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(378): Illuminate\\Queue\\Worker->process()\n#3 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(172): Illuminate\\Queue\\Worker->runJob()\n#4 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(117): Illuminate\\Queue\\Worker->daemon()\n#5 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(101): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#6 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/horizon/src/Console/WorkCommand.php(51): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#7 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Laravel\\Horizon\\Console\\WorkCommand->handle()\n#8 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Container/Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#9 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#10 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#11 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Container/Container.php(653): Illuminate\\Container\\BoundMethod::call()\n#12 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Console/Command.php(136): Illuminate\\Container\\Container->call()\n#13 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/symfony/console/Command/Command.php(298): Illuminate\\Console\\Command->execute()\n#14 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Console/Command.php(121): Symfony\\Component\\Console\\Command\\Command->run()\n#15 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/symfony/console/Application.php(1040): Illuminate\\Console\\Command->run()\n#16 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/symfony/console/Application.php(301): Symfony\\Component\\Console\\Application->doRunCommand()\n#17 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/symfony/console/Application.php(171): Symfony\\Component\\Console\\Application->doRun()\n#18 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Console/Application.php(94): Symfony\\Component\\Console\\Application->run()\n#19 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(129): Illuminate\\Console\\Application->run()\n#20 /home/trademenn/domains/trademen.codemen.me/public_html/artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle()\n#21 {main}', '2023-09-12 02:43:15'),
(12, 'redis', 'default', '{\"pushedAt\":\"1694703746.1639\",\"uuid\":\"091c998b-c458-42a0-b76d-d0c38b183977\",\"timeout\":null,\"tags\":[\"App\\\\Models\\\\Core\\\\UserProfile:3e5cc6d9-786c-43dd-a36b-bd219cb95b92\"],\"id\":\"091c998b-c458-42a0-b76d-d0c38b183977\",\"maxExceptions\":null,\"backoff\":null,\"displayName\":\"App\\\\Mail\\\\Core\\\\Registered\",\"maxTries\":null,\"type\":\"mail\",\"failOnTimeout\":false,\"silenced\":false,\"retryUntil\":null,\"data\":{\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":13:{s:8:\\\"mailable\\\";O:24:\\\"App\\\\Mail\\\\Core\\\\Registered\\\":31:{s:7:\\\"profile\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:27:\\\"App\\\\Models\\\\Core\\\\UserProfile\\\";s:2:\\\"id\\\";s:36:\\\"3e5cc6d9-786c-43dd-a36b-bd219cb95b92\\\";s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:5:\\\"isApi\\\";b:0;s:16:\\\"verificationCode\\\";N;s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:22:\\\"mysaviour256@gmail.com\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:8:\\\"markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\",\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\"},\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"attempts\":1}', 'Illuminate\\Queue\\MaxAttemptsExceededException: App\\Mail\\Core\\Registered has been attempted too many times or run too long. The job may have previously timed out. in /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php:750\nStack trace:\n#0 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(504): Illuminate\\Queue\\Worker->maxAttemptsExceededException()\n#1 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(418): Illuminate\\Queue\\Worker->markJobAsFailedIfAlreadyExceedsMaxAttempts()\n#2 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(378): Illuminate\\Queue\\Worker->process()\n#3 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(172): Illuminate\\Queue\\Worker->runJob()\n#4 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(117): Illuminate\\Queue\\Worker->daemon()\n#5 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(101): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#6 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/horizon/src/Console/WorkCommand.php(51): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#7 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Laravel\\Horizon\\Console\\WorkCommand->handle()\n#8 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Container/Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#9 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#10 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#11 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Container/Container.php(653): Illuminate\\Container\\BoundMethod::call()\n#12 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Console/Command.php(136): Illuminate\\Container\\Container->call()\n#13 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/symfony/console/Command/Command.php(298): Illuminate\\Console\\Command->execute()\n#14 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Console/Command.php(121): Symfony\\Component\\Console\\Command\\Command->run()\n#15 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/symfony/console/Application.php(1040): Illuminate\\Console\\Command->run()\n#16 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/symfony/console/Application.php(301): Symfony\\Component\\Console\\Application->doRunCommand()\n#17 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/symfony/console/Application.php(171): Symfony\\Component\\Console\\Application->doRun()\n#18 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Console/Application.php(94): Symfony\\Component\\Console\\Application->run()\n#19 /home/trademenn/domains/trademen.codemen.me/public_html/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(129): Illuminate\\Console\\Application->run()\n#20 /home/trademenn/domains/trademen.codemen.me/public_html/artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle()\n#21 {main}', '2023-09-14 11:33:58');

-- --------------------------------------------------------

--
-- Table structure for table `futures`
--

CREATE TABLE `futures` (
  `id` varchar(60) NOT NULL,
  `symbol` varchar(10) NOT NULL,
  `orderid` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `realised_cost` varchar(100) DEFAULT NULL,
  `leverage` int(11) NOT NULL,
  `typetrade` varchar(20) NOT NULL,
  `type` varchar(20) NOT NULL,
  `pnl` float NOT NULL,
  `price` varchar(32) DEFAULT NULL,
  `stop` varchar(32) DEFAULT NULL,
  `stopPrice` varchar(32) DEFAULT NULL,
  `stopPriceType` varchar(32) DEFAULT NULL,
  `realizepnl` float NOT NULL,
  `avg_entry_price` decimal(19,8) DEFAULT NULL,
  `pos_margin` decimal(19,8) DEFAULT NULL,
  `maint_margin` decimal(19,8) DEFAULT NULL,
  `status` varchar(20) NOT NULL,
  `amount` decimal(19,8) NOT NULL,
  `liquid` decimal(19,8) NOT NULL,
  `cid` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gateway_transactions`
--

CREATE TABLE `gateway_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` char(36) DEFAULT NULL,
  `order_id` char(36) DEFAULT NULL,
  `to_time` int(11) DEFAULT NULL,
  `port` enum('MELLAT','JAHANPAY','PARSIAN','PASARGAD','PAYLINE','SADAD','ZARINPAL','SAMAN','ASANPARDAKHT','PAYPAL','PAYIR','VENDAR','IDPAY') NOT NULL,
  `price` int(11) NOT NULL,
  `ref_id` varchar(100) DEFAULT NULL,
  `tracking_code` varchar(50) DEFAULT NULL,
  `card_number` varchar(50) DEFAULT NULL,
  `status` enum('INIT','SUCCEED','FAILED') NOT NULL DEFAULT 'INIT',
  `ip` varchar(20) DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL,
  `payment_date` timestamp NULL DEFAULT NULL,
  `platform` varchar(300) DEFAULT 'Android',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gateway_transactions`
--

INSERT INTO `gateway_transactions` (`id`, `user_id`, `order_id`, `to_time`, `port`, `price`, `ref_id`, `tracking_code`, `card_number`, `status`, `ip`, `description`, `payment_date`, `platform`, `created_at`, `updated_at`, `deleted_at`) VALUES
(168950235009, 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'b34ccff1-c391-401d-87c6-ba8ceebda026', NULL, 'MELLAT', 2000, 'E9CB4F5C93A64E2D', NULL, NULL, 'FAILED', '69.194.107.135', NULL, NULL, 'Android', '2023-07-16 11:12:30', '2023-07-16 11:25:20', NULL),
(168950317177, 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', '8dfe8e3a-03ff-48d4-a1c3-50b9c7987993', NULL, 'MELLAT', 2000, 'E59E249FA7690B67', NULL, NULL, 'INIT', '69.194.122.155', NULL, NULL, 'Android', '2023-07-16 11:26:11', '2023-07-16 11:26:12', NULL),
(168950335118, 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'f001b805-173a-49b7-92cf-890db75da040', NULL, 'MELLAT', 2000, '04BC68617F000AEE', NULL, NULL, 'INIT', '69.194.90.130', NULL, NULL, 'Android', '2023-07-16 11:29:11', '2023-07-16 11:29:11', NULL),
(168950358477, 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'a229b663-3682-47a0-94cb-50da7733c66f', NULL, 'MELLAT', 2000, 'F7C515570EDDA850', NULL, NULL, 'INIT', '69.194.120.252', NULL, NULL, 'Android', '2023-07-16 11:33:04', '2023-07-16 11:33:05', NULL),
(168950364820, 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', '7c9d7499-693c-4132-b755-6350ec260480', NULL, 'MELLAT', 2000, 'FFB3035A2163F02A', NULL, NULL, 'INIT', '69.194.126.99', NULL, NULL, 'Android', '2023-07-16 11:34:08', '2023-07-16 11:34:08', NULL),
(168958603297, 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', '6c91d789-e7cf-485f-aa11-49d4a797f932', NULL, 'MELLAT', 20000, 'D4FA48EA75E67AD5', NULL, NULL, 'INIT', '94.176.35.180', NULL, NULL, 'Android', '2023-07-17 10:27:12', '2023-07-17 10:27:13', NULL),
(169764029370, 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', '4ce2b5a9-6113-44ef-beff-deb1d499f3b3', NULL, 'MELLAT', 40000, NULL, NULL, NULL, 'FAILED', '5.123.55.31', NULL, NULL, 'Android', '2023-10-18 14:44:53', '2023-10-18 14:44:55', NULL),
(169764032280, 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', '28a24d1c-1f75-41fe-b977-5d1d83735e9d', NULL, 'MELLAT', 40000, NULL, NULL, NULL, 'FAILED', '5.123.55.31', NULL, NULL, 'Android', '2023-10-18 14:45:22', '2023-10-18 14:45:23', NULL),
(171179923382, 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'c7099733-3a7b-44b9-95fe-b6a4c1d6e2fc', NULL, 'MELLAT', 800000, NULL, NULL, NULL, 'FAILED', '2.190.22.84', NULL, NULL, 'Android', '2024-03-30 11:47:13', '2024-03-30 11:47:15', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `gateway_transactions_logs`
--

CREATE TABLE `gateway_transactions_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `transaction_id` bigint(20) UNSIGNED NOT NULL,
  `result_code` varchar(10) DEFAULT NULL,
  `result_message` varchar(255) DEFAULT NULL,
  `log_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gateway_transactions_logs`
--

INSERT INTO `gateway_transactions_logs` (`id`, `transaction_id`, `result_code`, `result_message`, `log_date`) VALUES
(1, 168950235009, NULL, NULL, '2023-07-16 11:25:20'),
(2, 169764029370, '21', 'پذیرنده نامعتبر است', '2023-10-18 14:44:55'),
(3, 169764032280, '21', 'پذیرنده نامعتبر است', '2023-10-18 14:45:23'),
(4, 171179923382, '21', 'پذیرنده نامعتبر است', '2024-03-30 11:47:15');

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
-- Table structure for table `kyc_verifications`
--

CREATE TABLE `kyc_verifications` (
  `id` char(36) NOT NULL,
  `user_id` char(36) NOT NULL,
  `type` varchar(255) NOT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `card_image` text NOT NULL,
  `face_image` text DEFAULT NULL,
  `data` text DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'reviewing',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kyc_verifications`
--

INSERT INTO `kyc_verifications` (`id`, `user_id`, `type`, `reference`, `card_image`, `face_image`, `data`, `reason`, `status`, `created_at`, `updated_at`) VALUES
('209185a2-5fcf-4e66-98fb-ae6c7805995c', '6eb3595c-031c-4f55-abee-80cf6d8c816b', 'id_analyzer', 'B3WFHR3B7Z', 'null', NULL, NULL, 'Session expired', 'failed', '2023-11-06 08:47:54', '2023-11-06 08:47:54'),
('28e3456c-b026-4a00-a2a9-75bd10075ebd', '6eb3595c-031c-4f55-abee-80cf6d8c816b', 'id_analyzer', 'LA63UW6NQY', 'null', NULL, NULL, 'Session expired', 'failed', '2023-11-15 20:32:04', '2023-11-15 20:32:04'),
('41b4a726-0843-4bcd-b66f-4c1412472820', '47eaf168-5901-4ccb-8b9c-d7f9c754ed04', 'id_analyzer', '3P576WT3A6', 'null', NULL, NULL, 'Session expired', 'failed', '2023-11-27 20:34:09', '2023-11-27 20:34:09'),
('42995d88-6675-4eb4-af7c-2b2ae1ad3168', '6eb3595c-031c-4f55-abee-80cf6d8c816b', 'id_analyzer', '8Z5MFFY4SE', 'null', NULL, NULL, 'Session expired', 'failed', '2023-11-16 08:33:22', '2023-11-16 08:33:22'),
('446a3174-89b7-41e5-a7a9-449d70e77c92', '6eb3595c-031c-4f55-abee-80cf6d8c816b', 'id_analyzer', 'CQ42XNGUQG', 'null', NULL, NULL, 'Session expired', 'failed', '2023-11-23 20:39:01', '2023-11-23 20:39:01'),
('58497e06-fcc1-4b35-9362-4b1150bbcf4c', 'eeb02b68-6521-4a40-84ad-21a2d21aa440', 'id_analyzer', 'ZAHTPJT3Z7', 'null', NULL, NULL, 'Session expired', 'failed', '2023-11-23 20:39:42', '2023-11-23 20:39:42'),
('5b492d85-54fc-48d5-90c5-f3ab5b41c837', '6eb3595c-031c-4f55-abee-80cf6d8c816b', 'id_analyzer', 'PGCNFKFNJG', 'null', NULL, NULL, 'Session expired', 'failed', '2023-11-06 08:48:00', '2023-11-06 08:48:00'),
('7b975c6d-cb2a-4040-b190-17371a27ff11', 'a502eb20-d81c-4f3e-a56f-11444fe1e4cb', 'national_id', NULL, '{\"id_card_front\":\"id_id_card_front_a502eb20-d81c-4f3e-a56f-11444fe1e4cb.png\",\"id_card_back\":\"id_id_card_back_a502eb20-d81c-4f3e-a56f-11444fe1e4cb.png\"}', NULL, NULL, NULL, 'verified', '2023-05-08 04:28:32', '2023-05-09 01:12:49'),
('7c1b5200-d727-4c92-ba86-2dea5ad72a49', 'eb0d5cb2-a937-4d7e-9e4d-cbd10c9948a3', 'national_id', NULL, '{\"id_card_front\":\"id_id_card_front_eb0d5cb2-a937-4d7e-9e4d-cbd10c9948a3.png\",\"id_card_back\":\"id_id_card_back_eb0d5cb2-a937-4d7e-9e4d-cbd10c9948a3.png\"}', NULL, NULL, 'to old', 'expired', '2023-03-13 09:46:36', '2023-05-15 00:57:32'),
('7d0732c1-459a-467e-ab99-256dc1a3d6dc', 'c275436b-9379-4114-9770-9e6d376488cd', 'id_analyzer', 'QMBKTJVTKE', 'null', NULL, NULL, 'Session expired', 'failed', '2023-11-16 20:32:54', '2023-11-16 20:32:54'),
('9c89c63e-d851-48de-8a9f-20e73daa81db', '47eaf168-5901-4ccb-8b9c-d7f9c754ed04', 'id_analyzer', 'PJHWMT996C', 'null', NULL, NULL, 'Session expired', 'failed', '2023-11-27 20:32:19', '2023-11-27 20:32:19'),
('d9f77642-8404-42cf-8376-28939d3c2156', '6eb3595c-031c-4f55-abee-80cf6d8c816b', 'id_analyzer', 'X38NLGDKY9', 'null', NULL, NULL, 'Session expired', 'failed', '2023-11-22 20:41:38', '2023-11-22 20:41:38'),
('ec4b32cc-afd8-4b84-8699-24a1ce9b3e0c', '6eb3595c-031c-4f55-abee-80cf6d8c816b', 'id_analyzer', 'ZJRBCD3JYG', 'null', NULL, NULL, 'Session expired', 'failed', '2023-11-17 08:38:27', '2023-11-17 08:38:27'),
('f64ceb72-1346-4672-a70f-f57a5cf4c7b2', '6eb3595c-031c-4f55-abee-80cf6d8c816b', 'id_analyzer', 'QZTM6NBN2S', 'null', NULL, NULL, 'Session expired', 'failed', '2023-11-26 08:36:42', '2023-11-26 08:36:42');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `short_code` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `direction` varchar(255) NOT NULL DEFAULT 'ltr'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `short_code`, `icon`, `is_active`, `created_at`, `updated_at`, `direction`) VALUES
(1, 'English', 'en', '1d40d16afd304f4b21dca78ea9ffebd4.png', 1, NULL, '2023-09-27 16:53:53', 'ltr'),
(2, 'عربي', 'ar', '_AR_.png', 1, NULL, NULL, 'rtl'),
(3, 'فارسی', 'fa', '_fa_.png', 1, '2022-06-14 04:29:15', '2024-03-14 13:06:36', 'rtl'),
(4, 'Chinese', 'cn', '_cn_.png', 1, '2023-03-02 13:04:20', '2023-03-02 13:04:20', 'ltr'),
(5, 'de', 'de', '_de_.png', 1, '2023-11-13 14:03:40', '2023-11-13 14:03:40', 'ltr');

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
(1, '2016_05_28_195350_create_roles_table', 1),
(2, '2016_05_28_195458_create_users_table', 1),
(3, '2018_07_29_083317_create_application_settings_table', 1),
(4, '2018_08_11_062554_create_notices_table', 1),
(5, '2018_08_19_112525_create_notifications_table', 1),
(6, '2018_09_14_073550_create_navigations_table', 1),
(7, '2018_09_22_080311_create_user_profiles_table', 1),
(8, '2018_10_14_000200_create_countries_table', 1),
(9, '2018_10_14_000300_create_states_table', 1),
(10, '2019_10_06_055946_create_languages_table', 1),
(11, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(12, '2020_01_01_000003_create_user_preferences_table', 1),
(13, '2020_01_01_000024_create_tickets_table', 1),
(14, '2020_01_01_000025_create_ticket_comments_table', 1),
(15, '2020_01_01_000026_create_bank_accounts_table', 1),
(16, '2020_01_01_000027_create_coins_table', 1),
(17, '2020_01_01_000028_create_coin_pairs_table', 1),
(18, '2020_01_01_000028_create_wallets_table', 1),
(19, '2020_01_01_000031_create_wallet_deposits_table', 1),
(20, '2020_01_01_000032_create_wallet_withdrawals_table', 1),
(21, '2020_01_01_000033_create_orders_table', 1),
(22, '2020_01_01_000035_create_exchanges_table', 1),
(23, '2020_01_01_000036_create_exchange_data_table', 1),
(24, '2020_01_21_082730_create_referral_earnings_table', 1),
(25, '2020_01_21_102001_create_post_categories_table', 1),
(26, '2020_01_21_102100_create_posts_table', 1),
(27, '2020_01_21_102112_create_post_comments_table', 1),
(28, '2020_01_29_070511_create_jobs_table', 1),
(29, '2020_01_29_070749_create_failed_jobs_table', 1),
(30, '2020_02_03_073527_create_kyc_verifications_table', 1),
(31, '2020_04_01_062350_create_user_activities_table', 1),
(32, '2020_04_27_052025_create_pages_table', 1),
(33, '2020_11_11_111744_modify_fields_to_pages_table', 1),
(34, '2020_11_17_115552_create_ethereum_deposits_table', 1),
(35, '2020_11_17_121819_add_decimal_place_to_coins_table', 1),
(36, '2021_01_17_151329_add_contract_address_field_to_coins_table', 1),
(37, '2021_02_04_064624_add_property_id_to_coins_table', 1),
(38, '2021_03_03_130216_add_direction_to_languages_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `navigations`
--

CREATE TABLE `navigations` (
  `slug` varchar(255) NOT NULL,
  `items` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `navigations`
--

INSERT INTO `navigations` (`slug`, `items`, `created_at`, `updated_at`) VALUES
('footer-nav-one', '[{\"name\":\"About Us\",\"value\":{\"name\":\"about-us\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"page\",\"parent_id\":\"0\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"1\"},{\"name\":\"Terms And Conditions\",\"value\":{\"name\":\"terms-and-conditions\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"page\",\"parent_id\":\"0\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"2\"},{\"name\":\"Privacy Policy\",\"value\":{\"name\":\"privacy-policy\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"page\",\"parent_id\":\"0\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"3\"},{\"name\":\"Referral Programs\",\"value\":{\"name\":\"referral-programs\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"page\",\"parent_id\":\"0\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"4\"}]', '2022-02-03 22:05:35', '2022-02-03 22:05:35'),
('footer-nav-three', '[{\"name\":\"Facebook\",\"value\":{\"name\":\"https:\\/\\/www.facebook.com\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"link\",\"parent_id\":\"0\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"1\"},{\"name\":\"Twitter\",\"value\":{\"name\":\"https:\\/\\/twitter.com\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"link\",\"parent_id\":\"0\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"2\"},{\"name\":\"Blockchain Explorer\",\"value\":{\"name\":\"https:\\/\\/www.blockchain.com\\/explorer\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"link\",\"parent_id\":\"0\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"3\"},{\"name\":\"YouTube\",\"value\":{\"name\":\"https:\\/\\/www.youtube.com\\/\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"link\",\"parent_id\":\"0\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"4\"}]', '2022-02-03 22:05:35', '2022-02-03 22:05:35'),
('footer-nav-two', '[{\"name\":\"Exchange\",\"value\":{\"name\":\"exchange.index\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"route\",\"parent_id\":\"0\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"1\"},{\"name\":\"Public API\",\"value\":{\"name\":\"public-api\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"page\",\"parent_id\":\"0\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"2\"},{\"name\":\"Private API\",\"value\":{\"name\":\"private-api\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"page\",\"parent_id\":\"0\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"3\"},{\"name\":\"Blog\",\"value\":{\"name\":\"blog.index\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"route\",\"parent_id\":\"0\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"4\"},{\"name\":\"Fees\",\"value\":{\"name\":\"\\/fees\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"link\",\"parent_id\":\"0\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"5\"}]', '2022-02-03 22:05:35', '2022-02-03 22:05:35'),
('profile-nav', '[{\"name\":\"MY Profile\",\"value\":{\"name\":\"profile.index\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"route\",\"parent_id\":\"0\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"1\"},{\"name\":\"Preference Setting\",\"value\":{\"name\":\"preference.index\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"route\",\"parent_id\":\"0\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"2\"},{\"name\":\"Google 2FA\",\"value\":{\"name\":\"profile.google-2fa.create\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"route\",\"parent_id\":\"0\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"3\"},{\"name\":\"KYC Verifications\",\"value\":{\"name\":\"kyc-verifications.index\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"route\",\"parent_id\":\"0\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"4\"},{\"name\":\"Change Password\",\"value\":{\"name\":\"profile.change-password\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"route\",\"parent_id\":\"0\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"5\"},{\"name\":\"Referral Link\",\"value\":{\"name\":\"referral.link.show\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"route\",\"parent_id\":\"0\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"6\"},{\"name\":\"Referral Users\",\"value\":{\"name\":\"referral.users\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"route\",\"parent_id\":\"0\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"7\"},{\"name\":\"Referral Earnings\",\"value\":{\"name\":\"referral.earnings\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"route\",\"parent_id\":\"0\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"8\"},{\"name\":\"My Banks\",\"value\":{\"name\":\"bank-accounts.index\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"route\",\"parent_id\":\"0\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"9\"},{\"name\":\"Add New Bank\",\"value\":{\"name\":\"bank-accounts.create\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"route\",\"parent_id\":\"0\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"10\"},{\"name\":\"Access Token\",\"value\":{\"name\":\"personal-access-tokens.index\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"route\",\"parent_id\":\"0\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"11\"},{\"name\":\"Create Access Token\",\"value\":{\"name\":\"personal-access-tokens.create\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"route\",\"parent_id\":\"0\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"12\"},{\"name\":\"Recent Activities\",\"value\":{\"name\":\"my-activities.index\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"route\",\"parent_id\":\"0\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"13\"}]', '2022-02-03 22:05:35', '2022-02-03 22:05:35'),
('side-nav', '[{\"name\":\"Home\",\"value\":{\"name\":\"home\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"route\",\"parent_id\":\"0\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"1\"},{\"name\":\"Dashboard\",\"value\":{\"name\":\"admin.dashboard\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"route\",\"parent_id\":\"0\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"2\"},{\"name\":\"Application Control\",\"value\":{\"name\":\"javascript:;\"},\"class\":\"nav-label first\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"link\",\"parent_id\":\"0\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"3\"},{\"name\":\"Application Settings\",\"value\":{\"name\":\"application-settings.edit\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"route\",\"parent_id\":\"3\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"4\"},{\"name\":\"Role Management\",\"value\":{\"name\":\"javascript:;\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"link\",\"parent_id\":\"3\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"5\"},{\"name\":\"Role List\",\"value\":{\"name\":\"roles.index\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"route\",\"parent_id\":\"5\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"6\"},{\"name\":\"Add New Role\",\"value\":{\"name\":\"roles.create\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"route\",\"parent_id\":\"5\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"7\"},{\"name\":\"Language Management\",\"value\":{\"name\":\"javascript:;\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"link\",\"parent_id\":\"3\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"8\"},{\"name\":\"Language Settings\",\"value\":{\"name\":\"languages.settings\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"route\",\"parent_id\":\"8\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"9\"},{\"name\":\"Language List\",\"value\":{\"name\":\"languages.index\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"route\",\"parent_id\":\"8\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"10\"},{\"name\":\"Add New Language\",\"value\":{\"name\":\"languages.create\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"route\",\"parent_id\":\"8\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"11\"},{\"name\":\"Menu Manager\",\"value\":{\"name\":\"menu-manager.index\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"route\",\"parent_id\":\"3\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"12\"},{\"name\":\"Log Viewer\",\"value\":{\"name\":\"logs.index\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"route\",\"parent_id\":\"3\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"13\"},{\"name\":\"Notice Management\",\"value\":{\"name\":\"javascript:;\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"link\",\"parent_id\":\"3\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"14\"},{\"name\":\"Notice List\",\"value\":{\"name\":\"notices.index\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"route\",\"parent_id\":\"14\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"15\"},{\"name\":\"Add  New Notice\",\"value\":{\"name\":\"notices.create\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"route\",\"parent_id\":\"14\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"16\"},{\"name\":\"Check Node Status\",\"value\":{\"name\":\"admin.node-status.index\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"route\",\"parent_id\":\"3\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"17\"},{\"name\":\"User Management\",\"value\":{\"name\":\"javascript:;\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"link\",\"parent_id\":\"0\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"18\"},{\"name\":\"User List\",\"value\":{\"name\":\"admin.users.index\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"route\",\"parent_id\":\"18\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"19\"},{\"name\":\"Add New User\",\"value\":{\"name\":\"admin.users.create\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"route\",\"parent_id\":\"18\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"20\"},{\"name\":\"KYC Management\",\"value\":{\"name\":\"kyc-management.index\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"route\",\"parent_id\":\"0\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"21\"},{\"name\":\"Ticket Management\",\"value\":{\"name\":\"admin.tickets.index\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"route\",\"parent_id\":\"0\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"22\"},{\"name\":\"Coin Management\",\"value\":{\"name\":\"javascript:;\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"link\",\"parent_id\":\"0\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"23\"},{\"name\":\"Coin List\",\"value\":{\"name\":\"coins.index\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"route\",\"parent_id\":\"23\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"24\"},{\"name\":\"Add New Coin\",\"value\":{\"name\":\"coins.create\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"route\",\"parent_id\":\"23\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"25\"},{\"name\":\"Coin Pair Management\",\"value\":{\"name\":\"javascript:;\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"link\",\"parent_id\":\"0\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"26\"},{\"name\":\"Coin Pair List\",\"value\":{\"name\":\"coin-pairs.index\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"route\",\"parent_id\":\"26\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"27\"},{\"name\":\"Add New Coin Pair\",\"value\":{\"name\":\"coin-pairs.create\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"route\",\"parent_id\":\"26\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"28\"},{\"name\":\"System Wallet Management\",\"value\":{\"name\":\"javascript:;\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"link\",\"parent_id\":\"0\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"29\"},{\"name\":\"Wallet List\",\"value\":{\"name\":\"admin.system-wallets.index\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"route\",\"parent_id\":\"29\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"30\"},{\"name\":\"System Bank Management\",\"value\":{\"name\":\"javascript:;\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"link\",\"parent_id\":\"0\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"31\"},{\"name\":\"System Bank List\",\"value\":{\"name\":\"system-banks.index\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"route\",\"parent_id\":\"31\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"32\"},{\"name\":\"Add New System Bank\",\"value\":{\"name\":\"system-banks.create\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"route\",\"parent_id\":\"31\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"33\"},{\"name\":\"User Bank Management\",\"value\":{\"name\":\"javascript:;\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"link\",\"parent_id\":\"0\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"34\"},{\"name\":\"User Bank Accounts\",\"value\":{\"name\":\"user-banks.index\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"route\",\"parent_id\":\"34\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"35\"},{\"name\":\"Add User Bank Account\",\"value\":{\"name\":\"user-banks.create\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"route\",\"parent_id\":\"34\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"36\"},{\"name\":\"Withdrawal Management\",\"value\":{\"name\":\"javascript:;\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"link\",\"parent_id\":\"0\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"37\"},{\"name\":\"Review Withdrawals\",\"value\":{\"name\":\"admin.review.withdrawals.index\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"route\",\"parent_id\":\"37\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"38\"},{\"name\":\"Withdrawal Histories\",\"value\":{\"name\":\"admin.history.withdrawals.index\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"route\",\"parent_id\":\"37\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"39\"},{\"name\":\"Deposit Management\",\"value\":{\"name\":\"javascript:;\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"link\",\"parent_id\":\"0\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"40\"},{\"name\":\"Review Bank Deposits\",\"value\":{\"name\":\"admin.review.bank-deposits.index\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"route\",\"parent_id\":\"40\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"41\"},{\"name\":\"Deposit Histories\",\"value\":{\"name\":\"admin.history.deposits.index\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"route\",\"parent_id\":\"40\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"42\"},{\"name\":\"Ethereum Deposit Histories\",\"value\":{\"name\":\"admin.history.ethereum-deposits.index\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"route\",\"parent_id\":\"40\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"43\"},{\"name\":\"Blog Management\",\"value\":{\"name\":\"javascript:;\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"link\",\"parent_id\":\"0\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"44\"},{\"name\":\"Post\",\"value\":{\"name\":\"javascript:;\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"link\",\"parent_id\":\"44\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"45\"},{\"name\":\"Post List\",\"value\":{\"name\":\"posts.index\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"route\",\"parent_id\":\"45\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"46\"},{\"name\":\"Add New Post\",\"value\":{\"name\":\"posts.create\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"route\",\"parent_id\":\"45\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"47\"},{\"name\":\"Manage Comments\",\"value\":{\"name\":\"comments.index\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"route\",\"parent_id\":\"45\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"48\"},{\"name\":\"Categories\",\"value\":{\"name\":\"javascript:;\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"link\",\"parent_id\":\"44\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"49\"},{\"name\":\"Category List\",\"value\":{\"name\":\"post-categories.index\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"route\",\"parent_id\":\"49\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"50\"},{\"name\":\"Add New Category\",\"value\":{\"name\":\"post-categories.create\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"route\",\"parent_id\":\"49\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"51\"},{\"name\":\"Page Management \",\"value\":{\"name\":\"javascript:;\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"link\",\"parent_id\":\"0\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"52\"},{\"name\":\"Page List\",\"value\":{\"name\":\"admin.pages.index\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"route\",\"parent_id\":\"52\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"53\"},{\"name\":\"Add New Page\",\"value\":{\"name\":\"admin.pages.create\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"route\",\"parent_id\":\"52\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"54\"}]', '2022-02-03 22:05:35', '2023-11-12 09:51:06'),
('top-nav', '[{\"name\":\"Home\",\"value\":{\"name\":\"home\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"route\",\"parent_id\":\"0\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"1\"},{\"name\":\"Markets\",\"value\":{\"name\":\"markets\",\"parameters\":{\"request\":\"m\"}},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"route\",\"parent_id\":\"0\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"2\"},{\"name\":\"Exchange\",\"value\":{\"name\":\"exchange.index\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"route\",\"parent_id\":\"0\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"3\"},{\"name\":\"Futures\",\"value\":{\"name\":\"futures.index\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"route\",\"parent_id\":\"0\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"4\"},{\"name\":\"Swap\",\"value\":{\"name\":\"swap\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"route\",\"parent_id\":\"0\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"5\"},{\"name\":\"Stake\",\"value\":{\"name\":\"stake\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"route\",\"parent_id\":\"0\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"6\"},{\"name\":\"Wallets\",\"value\":{\"name\":\"user.wallets.index\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"route\",\"parent_id\":\"0\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"7\"},{\"name\":\"Orders\",\"value\":{\"name\":\"javascript:;\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"link\",\"parent_id\":\"0\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"8\"},{\"name\":\"Open Order\",\"value\":{\"name\":\"user.open.order\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"route\",\"parent_id\":\"8\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"9\"},{\"name\":\"All Orders\",\"value\":{\"name\":\"user.orders.index\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"route\",\"parent_id\":\"8\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"10\"},{\"name\":\"Trade Histories\",\"value\":{\"name\":\"my-trade-history\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"route\",\"parent_id\":\"8\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"11\"},{\"name\":\"Support\",\"value\":{\"name\":\"javascript:;\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"link\",\"parent_id\":\"0\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"12\"},{\"name\":\"Ticket List\",\"value\":{\"name\":\"tickets.index\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"route\",\"parent_id\":\"12\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"13\"},{\"name\":\"New Ticket\",\"value\":{\"name\":\"tickets.create\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"route\",\"parent_id\":\"12\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"14\"},{\"name\":\"Blog\",\"value\":{\"name\":\"blog.index\"},\"class\":\"\",\"icon\":\"\",\"beginning_text\":\"\",\"ending_text\":\"\",\"type\":\"route\",\"parent_id\":\"0\",\"new_tab\":\"0\",\"mega_menu\":\"0\",\"order\":\"15\"}]', '2022-02-03 22:05:35', '2023-10-16 17:09:35');

-- --------------------------------------------------------

--
-- Table structure for table `notices`
--

CREATE TABLE `notices` (
  `id` char(36) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `type` varchar(20) NOT NULL,
  `visible_type` varchar(20) NOT NULL DEFAULT 'public',
  `start_at` timestamp NULL DEFAULT NULL,
  `end_at` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `user_id` char(36) NOT NULL,
  `message` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `message`, `read_at`, `created_at`, `updated_at`) VALUES
('001bd69d-5d80-47d1-8568-7ece06b513b6', 'a01cd4e5-4cbb-48ab-bfde-2b558ab60d88', 'Your USDT wallet has been increased with 8000 USDT by system.', NULL, '2023-07-20 08:21:28', '2023-07-20 08:21:28'),
('01636729-1e25-4fe6-a805-cd48d87f4101', 'd2b09976-3be3-43e8-81ef-d0dd81784cdf', 'Your TRX wallet has been increased with 60 TRX by system.', NULL, '2023-11-23 00:12:34', '2023-11-23 00:12:34'),
('0193ea34-f4d3-4d37-826e-cf4a8a2b4327', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'Your AUSD wallet has been increased with 1000000 AUSD by system.', '2023-07-12 14:38:26', '2023-05-14 02:40:40', '2023-07-12 14:38:26'),
('02209ab5-051f-46be-af73-af6d09db223b', '86f3c2c9-e4c3-4192-ad1e-d34a6b188833', 'Your USDT wallet has been increased with 250 USDT by system.', NULL, '2023-07-19 09:50:05', '2023-07-19 09:50:05'),
('02215ea0-c9ba-4ed9-a522-ef76d26eb45d', '60145862-0641-4106-af67-8de47b916abe', 'Your account\'s role has been changed by admin.', NULL, '2023-12-14 13:00:47', '2023-12-14 13:00:47'),
('03c4e847-659a-48c7-b84d-c6609b92f543', 'e7862d9c-fba8-4509-b59b-a4cb4f71ba04', 'Your USDT wallet has been increased with 156000 USDT by system.', NULL, '2023-08-30 08:56:26', '2023-08-30 08:56:26'),
('0440d02d-235b-4bff-bc68-6870758435bf', '1ac9db2f-613b-4351-ba36-aa8a8e502079', 'Your ETH wallet has been increased with 88000 ETH by system.', NULL, '2023-06-02 16:37:11', '2023-06-02 16:37:11'),
('05e22541-3785-4540-9074-e39812b11486', 'eb0d5cb2-a937-4d7e-9e4d-cbd10c9948a3', 'Your KYC verification has been expired.', NULL, '2023-05-15 00:57:32', '2023-05-15 00:57:32'),
('0773e5a7-f520-445e-a0b6-c5de8dae72cd', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'Your USDs wallet has been increased with 1000000 USDs by system.', '2023-07-12 14:38:16', '2023-05-14 02:39:15', '2023-07-12 14:38:16'),
('0904d027-7c9a-4c0a-99c4-843662d9edd4', 'cb74f45c-280c-42fd-a06e-a4672280c040', 'Your USDT wallet has been increased with 35500 USDT by system.', NULL, '2023-07-21 16:30:54', '2023-07-21 16:30:54'),
('0aea58bb-9227-4cfc-a747-5fa0a578b1ab', '4737ffad-8afe-4bbe-9c76-9ece9d55068f', 'Your USDT wallet has been increased with 35000 USDT by system.', NULL, '2023-11-22 09:13:55', '2023-11-22 09:13:55'),
('0e482ada-2ddf-4717-8f7a-86e1fa872e11', '6dd2b333-abab-4c57-b4f5-d33e4dd70f39', 'Your BTC wallet has been increased with 100 BTC by system.', NULL, '2023-08-04 16:51:36', '2023-08-04 16:51:36'),
('107cf4f8-206c-40b8-bfd0-332728757ee4', '32769d8c-4dca-40d5-83ec-99b68df4b130', 'Your USD wallet has been increased with 10000 USD by system.', NULL, '2023-05-30 10:16:26', '2023-05-30 10:16:26'),
('1139ea80-b62a-443c-b970-52ed545e9c47', 'd2b09976-3be3-43e8-81ef-d0dd81784cdf', 'Your BTC wallet has been increased with 18960 BTC by system.', NULL, '2023-11-23 00:13:41', '2023-11-23 00:13:41'),
('129b2a61-86ab-4373-8a48-288c29e25ae3', 'cb74f45c-280c-42fd-a06e-a4672280c040', 'Your USDT wallet has been increased with 10300 USDT by system.', NULL, '2023-12-18 16:24:41', '2023-12-18 16:24:41'),
('12ef84ba-2a56-45d4-ab2e-81ddc8f96f4f', '6cd1a9e7-a910-43c8-a930-95dcb2c8edca', 'Your USDT wallet has been increased with 200 USDT by system.', NULL, '2023-08-07 18:14:36', '2023-08-07 18:14:36'),
('137eb5bf-1293-457a-a98a-458cbd9a95d9', 'c71eeafd-849d-4cb7-8275-1ebcd9ac93d8', 'Your USDT wallet has been increased with 5450 USDT by system.', NULL, '2024-02-27 05:06:30', '2024-02-27 05:06:30'),
('152298ad-d49e-494d-a527-410f9a803c1b', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'Your USDT wallet has been increased with 99999999999.99999999 USDT by system.', '2023-07-12 14:38:12', '2023-05-28 09:02:31', '2023-07-12 14:38:12'),
('15f50ccc-5985-4d9a-9166-794e2034c19f', '60145862-0641-4106-af67-8de47b916abe', 'Your BTC wallet has been increased with 25000 BTC by system.', NULL, '2023-12-14 00:41:17', '2023-12-14 00:41:17'),
('161e4c40-6aeb-4bbb-988a-002d15b19bd6', 'fb35867d-1db8-4b6d-9f19-54ab0b2ddab1', 'Your USDT wallet has been increased with 3000 USDT by system.', '2023-06-03 08:42:41', '2023-06-01 14:19:23', '2023-06-03 08:42:41'),
('1666df54-6c42-4f12-aa98-cfc0bad55706', 'd2b09976-3be3-43e8-81ef-d0dd81784cdf', 'Your BTC wallet has been increased with 1000 BTC by system.', NULL, '2023-08-14 10:54:10', '2023-08-14 10:54:10'),
('1753a172-e1d0-4b9c-9d68-8a534051161e', '60145862-0641-4106-af67-8de47b916abe', 'Your BTC wallet has been increased with 35000 BTC by system.', NULL, '2023-12-14 12:59:45', '2023-12-14 12:59:45'),
('194cc72f-4e37-44ed-a986-a06f3531515c', 'f978562a-6102-47ef-b44c-00962596e9e4', 'Your USDT wallet has been increased with 1750 USDT by system.', NULL, '2023-06-12 10:54:11', '2023-06-12 10:54:11'),
('195440d4-981f-44ee-aadc-2e0c9266cdcf', 'd72e5177-9169-4d3b-a805-aa9a45da9c32', 'Your TRX wallet has been increased with 2.00000000 TRX by system.', NULL, '2023-06-05 09:37:04', '2023-06-05 09:37:04'),
('1983bf25-4b46-4551-b594-c8f3476b1b3e', '7109c567-63f7-4d17-a2d5-a518e560408e', 'Your USDT wallet has been increased with 10000 USDT by system.', NULL, '2023-10-17 18:38:52', '2023-10-17 18:38:52'),
('19ab1054-7b68-4d1b-ba5f-ec83b5af8371', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'You just changed your account\'s password.', '2023-10-29 02:18:51', '2023-10-11 17:12:03', '2023-10-29 02:18:51'),
('19df7f74-228a-4496-ade9-6fd2a1547f66', 'c71eeafd-849d-4cb7-8275-1ebcd9ac93d8', 'Your TRX wallet has been increased with 20000 TRX by system.', NULL, '2023-12-04 18:00:00', '2023-12-04 18:00:00'),
('1d361a4a-ac4d-41e0-8e7b-da06913bd9c5', 'c275436b-9379-4114-9770-9e6d376488cd', 'Your account has been verified successfully.', NULL, '2023-05-20 11:08:53', '2023-05-20 11:08:53'),
('1d3bae5d-d946-4306-9fc0-cfe09c8d3c1b', 'd2b09976-3be3-43e8-81ef-d0dd81784cdf', 'Your BTC wallet has been increased with 1000 BTC by system.', NULL, '2023-11-23 00:10:01', '2023-11-23 00:10:01'),
('1e350ff8-f872-427a-a42e-14a886dda0da', '52523c96-98e6-4e75-a1d8-e3cf094993a1', 'Your TRX wallet has been increased with 44554545454 TRX by system.', NULL, '2023-09-09 13:55:56', '2023-09-09 13:55:56'),
('1f048e6d-b7e2-40f0-97d5-f523fa56ec4f', 'd2b09976-3be3-43e8-81ef-d0dd81784cdf', 'Your USDT wallet has been increased with 99000 USDT by system.', NULL, '2023-11-23 00:11:05', '2023-11-23 00:11:05'),
('2144746c-7efc-4aae-b9b1-5471adf25989', '7109c567-63f7-4d17-a2d5-a518e560408e', 'Your USD wallet has been increased with 10000 USD by system.', '2023-08-10 13:33:17', '2023-08-09 16:52:30', '2023-08-10 13:33:17'),
('228141fb-783d-4ac9-8d13-8d66f2b4c123', 'e7862d9c-fba8-4509-b59b-a4cb4f71ba04', 'Your USDT wallet has been increased with 2200 USDT by system.', NULL, '2023-07-26 09:03:01', '2023-07-26 09:03:01'),
('22ecd50e-71a9-4f38-a7f9-6d3dbf5a3e20', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'Your withdrawal request of 1000.00000000 TRX has been completed.', '2023-04-03 00:55:53', '2023-03-30 07:39:19', '2023-04-03 00:55:53'),
('247f3fe9-8050-4f8e-a0cf-cedbeea4387f', '32769d8c-4dca-40d5-83ec-99b68df4b130', 'Your BTC wallet has been increased with 10000 BTC by system.', NULL, '2023-05-30 10:16:04', '2023-05-30 10:16:04'),
('24ff6db9-f0db-4192-9b47-ac38fa2048c6', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'Your USDT wallet has been increased with 504147729.05120207 USDT by system.', '2023-07-12 14:36:00', '2023-05-08 15:38:27', '2023-07-12 14:36:00'),
('251aa048-c6c5-4fb2-ad75-e2af90ce9dfd', 'c71eeafd-849d-4cb7-8275-1ebcd9ac93d8', 'You just changed your account\'s password.', '2023-06-04 17:56:28', '2023-06-04 17:07:59', '2023-06-04 17:56:28'),
('254c9a34-7fc4-4656-b772-413ca372622d', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'Your AUSD wallet has been increased with 5000000 AUSD by system.', '2023-06-14 16:19:27', '2023-05-14 02:40:28', '2023-06-14 16:19:27'),
('259e9362-365f-4ed7-9f43-a59be6615c89', 'cf37d061-aa9c-460d-9701-66439afc812d', 'Your account\'s role has been changed by admin.', NULL, '2023-07-03 11:29:52', '2023-07-03 11:29:52'),
('27ce75dc-936b-4b1b-ab6a-e17797796397', 'd2b09976-3be3-43e8-81ef-d0dd81784cdf', 'Your USDT wallet has been increased with 7000 USDT by system.', NULL, '2023-11-23 00:11:46', '2023-11-23 00:11:46'),
('28322c8b-f8c7-497c-902e-07590c7674ee', '52523c96-98e6-4e75-a1d8-e3cf094993a1', 'Your USDT wallet has been increased with 25000 USDT by system.', NULL, '2023-11-14 10:02:17', '2023-11-14 10:02:17'),
('2885a2fa-444b-4199-8abe-bf53d96fd5ce', '675d5181-9662-4d5a-8e29-924e2b58b24f', 'Your USDT wallet has been increased with 750 USDT by system.', NULL, '2023-07-25 17:45:27', '2023-07-25 17:45:27'),
('28de8ea8-ef22-4f79-819e-23357290556e', 'c71eeafd-849d-4cb7-8275-1ebcd9ac93d8', 'Your TRX wallet has been increased with 20002 TRX by system.', NULL, '2023-12-04 18:00:52', '2023-12-04 18:00:52'),
('29b90c35-5658-4e1f-bc3b-de224b6e3f8a', '7db45872-7279-474d-aa0d-d56723822162', 'Your account\'s role has been changed by admin.', NULL, '2023-10-04 10:32:37', '2023-10-04 10:32:37'),
('2a6a113d-9731-4e61-9048-d6fbcf34bae2', '47eaf168-5901-4ccb-8b9c-d7f9c754ed04', 'Your BTC wallet has been increased with 10000 BTC by system.', NULL, '2023-05-31 11:14:43', '2023-05-31 11:14:43'),
('2a92e378-e8e2-40a7-93c8-4945474f398b', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'Your USDT wallet has been increased with 100 USDT by system.', '2023-02-26 05:50:59', '2023-02-25 09:39:56', '2023-02-26 05:50:59'),
('2bb1055f-12d5-4adb-9d23-8eda5063443d', '01bac2f0-2e3c-4116-a7fb-61c4d149a2e6', 'Your USDT wallet has been increased with 1750 USDT by system.', NULL, '2023-06-12 10:22:59', '2023-06-12 10:22:59'),
('2bef352e-32c9-42c4-b33b-5d38ce327198', 'd86b3a4d-3a57-426e-8e1e-95a6be996bb5', 'Your account\'s role has been changed by admin.', '2023-08-16 13:26:20', '2023-07-21 09:02:30', '2023-08-16 13:26:20'),
('2c2c3ee8-b2a4-424a-9754-0c1799f4fad7', '4737ffad-8afe-4bbe-9c76-9ece9d55068f', 'Your USD wallet has been increased with 560000 USD by system.', NULL, '2023-06-15 23:18:30', '2023-06-15 23:18:30'),
('2edfeb87-04ca-4b0d-8892-169d497b20dc', '467671a6-55bc-4527-ba1f-d0d2b562fca4', 'Your USDT wallet has been increased with 11500 USDT by system.', NULL, '2023-06-06 14:17:59', '2023-06-06 14:17:59'),
('2f938e6a-a055-4b19-8c25-7d2a233f621a', 'e7862d9c-fba8-4509-b59b-a4cb4f71ba04', 'Your USDT wallet has been increased with 15000 USDT by system.', NULL, '2024-02-06 14:01:34', '2024-02-06 14:01:34'),
('305659cb-54fc-4a73-b524-0814a5c55842', 'e7862d9c-fba8-4509-b59b-a4cb4f71ba04', 'Your TRX wallet has been increased with 2000 TRX by system.', NULL, '2023-07-25 05:22:15', '2023-07-25 05:22:15'),
('31ce4f12-6d5f-4d3b-820c-65fc1708ae0f', '6dd2b333-abab-4c57-b4f5-d33e4dd70f39', 'Your TRX wallet has been increased with 2 TRX by system.', NULL, '2023-08-04 16:42:03', '2023-08-04 16:42:03'),
('32a3003c-931c-4570-9eea-f27ec795c968', 'e7862d9c-fba8-4509-b59b-a4cb4f71ba04', 'Your TRX wallet has been increased with 799 TRX by system.', NULL, '2023-07-25 05:54:12', '2023-07-25 05:54:12'),
('33c1197c-5baa-49bb-90f5-70ea9c00d390', '933d676a-c435-4697-bdf2-e54d026c156e', 'Your account has been verified successfully.', NULL, '2023-05-10 05:26:13', '2023-05-10 05:26:13'),
('34fb0bbf-7a2e-4a18-bfd1-bc4f07aec587', 'cb74f45c-280c-42fd-a06e-a4672280c040', 'Your account\'s role has been changed by admin.', NULL, '2023-12-18 14:52:05', '2023-12-18 14:52:05'),
('3859e6c1-cf2b-4e8d-a171-c0606ed8194f', 'e7862d9c-fba8-4509-b59b-a4cb4f71ba04', 'Your TRX wallet has been increased with 2002 TRX by system.', NULL, '2023-07-25 05:22:41', '2023-07-25 05:22:41'),
('3a633632-e502-4f5a-89ef-b6756caa301f', '7109c567-63f7-4d17-a2d5-a518e560408e', 'Your USD wallet has been increased with 300 USD by system.', '2023-08-04 11:28:47', '2023-08-03 17:59:29', '2023-08-04 11:28:47'),
('3b260732-0356-46de-9f50-a84401f51cf6', '4737ffad-8afe-4bbe-9c76-9ece9d55068f', 'Your TRX wallet has been increased with 2.00000000 TRX by system.', NULL, '2023-06-14 13:50:21', '2023-06-14 13:50:21'),
('3eb34579-8534-4f51-a18d-e55e697ac4fc', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'Your USDT wallet has been increased with 600000000 USDT by system.', '2023-03-07 10:26:06', '2023-03-07 10:23:25', '2023-03-07 10:26:06'),
('3eda742c-ad78-47a7-8796-4226a1d44a89', '44d4809d-28e1-4685-b15c-dc11134fdf1d', 'Your TRX wallet has been increased with 2.00000000 TRX by system.', NULL, '2023-07-20 09:59:19', '2023-07-20 09:59:19'),
('3f3bdf53-b1b4-41d2-a99c-be30b2d8599e', '794254a9-ab67-4e67-8f36-861c423c29a8', 'Your USD wallet has been increased with 15000 USD by system.', NULL, '2023-09-17 18:26:59', '2023-09-17 18:26:59'),
('3f79f37c-e9f4-4d39-b280-2e06589a981e', '47eaf168-5901-4ccb-8b9c-d7f9c754ed04', 'Your USDT wallet has been increased with 10000 USDT by system.', NULL, '2023-05-31 11:14:14', '2023-05-31 11:14:14'),
('40d7c812-9d3c-4d9d-8fb0-c6fdcd381bb9', 'e7862d9c-fba8-4509-b59b-a4cb4f71ba04', 'Your account\'s role has been changed by admin.', NULL, '2024-02-06 13:59:45', '2024-02-06 13:59:45'),
('423c5312-960c-4c3f-abc0-c0f94ab8c50a', '6dd2b333-abab-4c57-b4f5-d33e4dd70f39', 'Your USDT wallet has been increased with 200 USDT by system.', NULL, '2023-08-04 16:41:52', '2023-08-04 16:41:52'),
('43542fb6-65c5-4822-88e8-e60c4e9c9ffb', '7109c567-63f7-4d17-a2d5-a518e560408e', 'Your TRX wallet has been increased with 2 TRX by system.', '2023-08-04 11:28:33', '2023-08-03 17:59:48', '2023-08-04 11:28:33'),
('43ffc754-99c1-4c4a-8cb0-3d22b9e0276d', '7cde25b7-e520-4fb3-85df-f5fcf89305d3', 'Your USDT wallet has been increased with 7000 USDT by system.', NULL, '2023-06-12 09:48:43', '2023-06-12 09:48:43'),
('44e57467-d3da-4641-8612-e60edb2f0e75', '89e4087c-1287-47c9-b101-f87da3cd0acb', 'کیف پول USD توسط مدیر به میزان 10000 USD افزایش یافت.', NULL, '2024-03-14 12:53:09', '2024-03-14 12:53:09'),
('46252e48-cfe6-46bd-89ea-9f7fb9fc03f0', 'a502eb20-d81c-4f3e-a56f-11444fe1e4cb', 'Your BTC wallet has been increased with 10 BTC by system.', '2023-08-15 07:28:55', '2023-07-18 13:27:32', '2023-08-15 07:28:55'),
('47138dbf-050f-4333-9081-cb353bc9bb08', 'e7862d9c-fba8-4509-b59b-a4cb4f71ba04', 'You just changed your account\'s password.', NULL, '2023-08-31 13:55:51', '2023-08-31 13:55:51'),
('477815ca-07fe-40ed-b6a2-65c372f6d273', '4737ffad-8afe-4bbe-9c76-9ece9d55068f', 'Your USD wallet has been increased with 10000 USD by system.', NULL, '2023-07-10 10:27:40', '2023-07-10 10:27:40'),
('4996c2ca-cfc2-4f6c-bb47-126ce9ed38e8', '44d4809d-28e1-4685-b15c-dc11134fdf1d', 'Your BTC wallet has been increased with 2000 BTC by system.', NULL, '2023-12-16 11:44:28', '2023-12-16 11:44:28'),
('4ac3f55e-2b39-443f-8a83-79495079404e', 'd2b09976-3be3-43e8-81ef-d0dd81784cdf', 'Your ETH wallet has been increased with 14960 ETH by system.', NULL, '2023-07-28 05:59:40', '2023-07-28 05:59:40'),
('4c8ec719-10f8-43b6-98f1-c175bd6172bb', 'e7862d9c-fba8-4509-b59b-a4cb4f71ba04', 'Your USDT wallet has been increased with 155000 USDT by system.', NULL, '2023-07-25 05:21:32', '2023-07-25 05:21:32'),
('4c9e73a3-3f0a-4272-8c12-25b6f8e2b70f', 'd2b09976-3be3-43e8-81ef-d0dd81784cdf', 'Your TRX wallet has been increased with 12960 TRX by system.', NULL, '2023-07-28 06:00:09', '2023-07-28 06:00:09'),
('4ddbf197-2e7d-4164-8e9c-f48e05aacb23', 'fb35867d-1db8-4b6d-9f19-54ab0b2ddab1', 'Your USDT wallet has been increased with 2500 USDT by system.', '2023-06-20 14:50:44', '2023-06-01 14:48:41', '2023-06-20 14:50:44'),
('4f07ea27-caa8-4825-ab15-39f2990a5ec1', '4737ffad-8afe-4bbe-9c76-9ece9d55068f', 'Your USD wallet has been increased with 35000 USD by system.', NULL, '2023-11-22 09:13:30', '2023-11-22 09:13:30'),
('4fa1d834-a5e0-40b6-ab6b-7d01a379b90c', 'e7862d9c-fba8-4509-b59b-a4cb4f71ba04', 'Your TRX wallet has been increased with 2201 TRX by system.', NULL, '2023-07-25 06:20:12', '2023-07-25 06:20:12'),
('4ffde8f2-b171-4510-b95a-3b0d207bbdc6', 'd72e5177-9169-4d3b-a805-aa9a45da9c32', 'Your USDT wallet has been increased with 35000 USDT by system.', NULL, '2023-06-05 09:37:34', '2023-06-05 09:37:34'),
('52dd3eba-8f2c-4aef-97ff-b8b14984d35d', '98697609-12a9-4415-a700-07de18f31ba9', 'Your account\'s role has been changed by admin.', NULL, '2023-07-18 20:12:49', '2023-07-18 20:12:49'),
('5417873a-4f4e-4574-9848-0ce0a34b5645', 'ea3c376d-8e83-4e18-be5c-25fda612432f', 'Your USDs wallet has been increased with 11 USDs by system.', NULL, '2023-05-09 00:22:14', '2023-05-09 00:22:14'),
('5423f8be-a5c6-40b8-b93b-34524b2a1346', '4737ffad-8afe-4bbe-9c76-9ece9d55068f', 'Your USD wallet has been increased with 495000 USD by system.', NULL, '2023-11-22 09:13:07', '2023-11-22 09:13:07'),
('547cd673-41b6-44f0-86ac-608e265c7a08', 'c71eeafd-849d-4cb7-8275-1ebcd9ac93d8', 'Your IRT wallet has been increased with 250000 IRT by system.', '2023-06-04 17:56:11', '2023-06-04 15:03:43', '2023-06-04 17:56:11'),
('555c76e5-c958-4232-b583-a889b45abeb1', 'd2b09976-3be3-43e8-81ef-d0dd81784cdf', 'Your USD wallet has been increased with 2000 USD by system.', NULL, '2023-11-23 00:10:18', '2023-11-23 00:10:18'),
('55aa0f41-61ab-4f13-8957-b9c1ac6db9dc', 'c71eeafd-849d-4cb7-8275-1ebcd9ac93d8', 'Your account\'s role has been changed by admin.', NULL, '2024-02-27 05:04:56', '2024-02-27 05:04:56'),
('563b8904-0ab9-4e04-9318-6016d1be1e83', '60145862-0641-4106-af67-8de47b916abe', 'Your BTC wallet has been increased with 25000 BTC by system.', NULL, '2023-12-14 12:59:37', '2023-12-14 12:59:37'),
('56feea37-d43c-4137-94ef-cf47f3e5225e', 'e7862d9c-fba8-4509-b59b-a4cb4f71ba04', 'Your account\'s role has been changed by admin.', NULL, '2024-02-06 15:05:40', '2024-02-06 15:05:40'),
('57ba4d9c-f991-42a3-9cae-5af1c5c3e5b7', 'd2b09976-3be3-43e8-81ef-d0dd81784cdf', 'Your USD wallet has been increased with 760 USD by system.', NULL, '2023-07-26 11:30:40', '2023-07-26 11:30:40'),
('5bd733d0-8a60-4ca1-8d9d-9724c137aa64', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'Your TRX wallet has been increased with 100 TRX by system.', '2023-03-13 01:37:11', '2023-03-08 10:20:29', '2023-03-13 01:37:11'),
('5c5af4fa-3573-4dc7-a377-15c781c345d8', 'db5d841b-d90a-4437-957a-c7fb5fa86319', 'Your USD wallet has been increased with 99999999999.99999999 USD by system.', NULL, '2023-05-28 08:59:36', '2023-05-28 08:59:36'),
('5d9a800b-0dd0-4a65-9ede-8db91c1a296c', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'Your BTC wallet has been increased with 1 BTC by system.', '2023-02-26 05:50:44', '2023-02-25 09:38:55', '2023-02-26 05:50:44'),
('5e03443c-eeda-45ad-aa79-2bdf6a8e03e4', '7cde25b7-e520-4fb3-85df-f5fcf89305d3', 'Your USDT wallet has been increased with 10000 USDT by system.', NULL, '2023-06-12 13:00:08', '2023-06-12 13:00:08'),
('6215b074-6aef-4cac-ba67-04f8f7e20a8d', 'cb74f45c-280c-42fd-a06e-a4672280c040', 'Your USDT wallet has been increased with 15000 USDT by system.', NULL, '2023-12-18 14:51:13', '2023-12-18 14:51:13'),
('643479c3-8442-481c-9a8c-ab066bdb3468', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'Your LTC wallet has been increased with 1000000 LTC by system.', '2023-06-20 22:26:34', '2023-05-08 15:14:19', '2023-06-20 22:26:34'),
('64a17b39-c8b4-4492-bde5-af1c3acbf4b8', '36f5887f-2b9b-4144-879c-9be2cff7e466', 'Your ETH wallet has been increased with 220 ETH by system.', NULL, '2023-06-24 12:41:43', '2023-06-24 12:41:43'),
('64d38df0-0745-44e1-a7b7-c105cb5b80ca', 'c71eeafd-849d-4cb7-8275-1ebcd9ac93d8', 'Your IRT wallet has been increased with 250000 IRT by system.', '2023-06-04 17:56:36', '2023-06-04 15:10:36', '2023-06-04 17:56:36'),
('658991e7-461b-415e-811f-5adfc3f6e348', '4737ffad-8afe-4bbe-9c76-9ece9d55068f', 'Your account\'s role has been changed by admin.', NULL, '2023-11-22 09:12:16', '2023-11-22 09:12:16'),
('65fd6f2b-033e-489e-9c35-d7bd7af36630', 'fb35867d-1db8-4b6d-9f19-54ab0b2ddab1', 'Your USDT wallet has been increased with 8000 USDT by system.', '2023-06-20 14:50:31', '2023-06-01 14:50:32', '2023-06-20 14:50:31'),
('685d304f-ac65-484c-9597-0169e753c7bc', 'd2b09976-3be3-43e8-81ef-d0dd81784cdf', 'Your TRX wallet has been increased with 3998 TRX by system.', NULL, '2023-07-29 07:18:00', '2023-07-29 07:18:00'),
('6a0d6af9-45de-437d-9706-bc3324e2f6fb', '44d4809d-28e1-4685-b15c-dc11134fdf1d', 'Your USDT wallet has been increased with 180000 USDT by system.', NULL, '2023-07-20 09:59:46', '2023-07-20 09:59:46'),
('6c41c70a-a75e-4878-88ed-c0de2cd78538', 'cb74f45c-280c-42fd-a06e-a4672280c040', 'Your account\'s role has been changed by admin.', NULL, '2023-12-18 12:06:01', '2023-12-18 12:06:01'),
('6c6164f3-752b-4d21-aab3-30948e9168ee', 'cdc7f9c6-150b-4b90-bc4a-8ce2f71f5c83', 'Your account\'s role has been changed by admin.', NULL, '2023-06-01 13:09:42', '2023-06-01 13:09:42'),
('6d455c48-3b8b-4677-9dd0-6acf7dccbe10', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'Your ETH wallet has been increased with 99999999999.99999999 ETH by system.', '2023-06-12 13:00:28', '2023-05-28 09:02:42', '2023-06-12 13:00:28'),
('6deae1db-dd48-4a05-b1e3-6af0ac7ad00a', '36f5887f-2b9b-4144-879c-9be2cff7e466', 'Your USDT wallet has been increased with 80000 USDT by system.', NULL, '2023-06-22 14:03:56', '2023-06-22 14:03:56'),
('721d6b55-ccdc-4891-aa25-0d18b665f61e', '44d4809d-28e1-4685-b15c-dc11134fdf1d', 'Your USDT wallet has been increased with 500 USDT by system.', NULL, '2023-12-06 15:43:34', '2023-12-06 15:43:34'),
('732ffe0e-2c78-4789-a573-2bd1ab7061ce', 'b9ec7d63-015c-4814-b253-eb1d45eae4dd', 'Your USD wallet has been increased with 10000 USD by system.', NULL, '2023-10-11 17:01:42', '2023-10-11 17:01:42'),
('75343f58-1b78-453f-8fc8-1ab1195e4db7', 'e7862d9c-fba8-4509-b59b-a4cb4f71ba04', 'Your account\'s role has been changed by admin.', NULL, '2024-02-06 14:10:39', '2024-02-06 14:10:39'),
('75a16d84-69dd-42be-90ca-61cf2efd3367', '52523c96-98e6-4e75-a1d8-e3cf094993a1', 'Your TRX wallet has been increased with 44554545460 TRX by system.', NULL, '2023-11-14 10:01:50', '2023-11-14 10:01:50'),
('75c7798f-9bd4-4506-b448-bc4f5ef26508', 'd2b09976-3be3-43e8-81ef-d0dd81784cdf', 'Your USDT wallet has been increased with 891000 USDT by system.', NULL, '2023-11-23 00:11:26', '2023-11-23 00:11:26'),
('77138ec0-80fe-448c-9807-2b21e5ba9fcb', '44d4809d-28e1-4685-b15c-dc11134fdf1d', 'Your TRX wallet has been increased with 4500 TRX by system.', NULL, '2023-07-24 13:39:04', '2023-07-24 13:39:04'),
('77449e52-55d8-4ef1-82d8-315ef1e2bf3b', 'd2b09976-3be3-43e8-81ef-d0dd81784cdf', 'Your USD wallet has been increased with 1020 USD by system.', NULL, '2023-07-26 10:03:29', '2023-07-26 10:03:29'),
('77c8b00b-fb7e-491b-9a64-7da7306a22b6', '7109c567-63f7-4d17-a2d5-a518e560408e', 'Your USD wallet has been increased with 50 USD by system.', '2023-08-10 11:52:05', '2023-08-07 14:02:55', '2023-08-10 11:52:05'),
('78b6dbad-cf8c-4632-b62a-2f17f0cb450a', '60145862-0641-4106-af67-8de47b916abe', 'Your account\'s role has been changed by admin.', NULL, '2023-12-14 00:42:35', '2023-12-14 00:42:35'),
('79d38070-2953-4675-ba16-b6c199bef4c9', 'c71eeafd-849d-4cb7-8275-1ebcd9ac93d8', 'Your TRX wallet has been increased with 1000 TRX by system.', NULL, '2023-12-16 12:35:00', '2023-12-16 12:35:00'),
('7ab2f0e1-95b5-49ac-94a8-d2e53773a7ff', '675d5181-9662-4d5a-8e29-924e2b58b24f', 'Your USDT wallet has been increased with 6750 USDT by system.', '2023-07-25 17:36:51', '2023-07-25 15:40:42', '2023-07-25 17:36:51'),
('7e7cd835-dcba-4662-9452-272983a3bb7d', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'You just changed your account\'s password.', '2023-10-29 02:18:58', '2023-10-11 17:13:31', '2023-10-29 02:18:58'),
('7ec49d40-1cd2-4ed3-9a62-42e17fcaf5d1', 'c71eeafd-849d-4cb7-8275-1ebcd9ac93d8', 'Your account\'s role has been changed by admin.', '2023-06-04 17:56:21', '2023-06-04 16:34:22', '2023-06-04 17:56:21'),
('807b13cf-b93b-42ea-b9c5-3d59dcf7640c', '7cde25b7-e520-4fb3-85df-f5fcf89305d3', 'Your USDT wallet has been increased with 1000 USDT by system.', NULL, '2023-06-09 15:43:15', '2023-06-09 15:43:15'),
('826193b0-a29e-4a86-85e7-e966e74a0649', 'cb74f45c-280c-42fd-a06e-a4672280c040', 'Your USDT wallet has been increased with 4700 USDT by system.', NULL, '2023-12-18 16:01:46', '2023-12-18 16:01:46'),
('828b8f2b-ca3d-40b5-8b4e-cd42c23889c8', 'fb35867d-1db8-4b6d-9f19-54ab0b2ddab1', 'Your BTC wallet has been increased with 8000 BTC by system.', '2023-06-20 14:50:16', '2023-06-01 14:50:52', '2023-06-20 14:50:16'),
('857423ab-8a5a-4450-a4fa-e03ddaf8700b', '6cd1a9e7-a910-43c8-a930-95dcb2c8edca', 'Your BTC wallet has been increased with 2000000000 BTC by system.', NULL, '2023-08-07 18:14:54', '2023-08-07 18:14:54'),
('8597be8b-a589-47ab-8bc6-7f3b34b5110e', 'b9ec7d63-015c-4814-b253-eb1d45eae4dd', 'Your TRX wallet has been increased with 2.00000000 TRX by system.', NULL, '2023-06-20 13:47:54', '2023-06-20 13:47:54'),
('87d10ef1-4648-4bce-9505-7e66916dbeb2', '60145862-0641-4106-af67-8de47b916abe', 'Your account\'s role has been changed by admin.', NULL, '2023-10-23 14:21:50', '2023-10-23 14:21:50'),
('882c6a77-9cb2-4f5b-9c54-afa8297efae8', 'e7862d9c-fba8-4509-b59b-a4cb4f71ba04', 'Your USD wallet has been increased with 78 USD by system.', NULL, '2024-02-06 14:03:10', '2024-02-06 14:03:10'),
('8a0664c2-ba6c-441f-87ed-30858a4805aa', 'e7862d9c-fba8-4509-b59b-a4cb4f71ba04', 'Your TRX wallet has been increased with 3000 TRX by system.', NULL, '2023-08-29 04:05:10', '2023-08-29 04:05:10'),
('8a9fb991-4ae6-4c95-be7b-77267341682a', 'c71eeafd-849d-4cb7-8275-1ebcd9ac93d8', 'Your ETH wallet has been increased with 250000 ETH by system.', '2023-06-04 17:26:27', '2023-06-04 15:10:59', '2023-06-04 17:26:27'),
('8cee90d6-6cfa-4b7e-9e32-973d526855a0', 'b9ec7d63-015c-4814-b253-eb1d45eae4dd', 'Your account\'s role has been changed by admin.', NULL, '2023-06-20 13:49:25', '2023-06-20 13:49:25'),
('8db9e021-f952-428e-b62f-13425878baaf', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'Your BTC wallet has been increased with 100 BTC by system.', '2024-04-20 07:31:39', '2024-04-09 01:23:15', '2024-04-20 07:31:39'),
('8f465bda-2199-4c69-9157-85e128d34fb7', 'eb0d5cb2-a937-4d7e-9e4d-cbd10c9948a3', 'Your KYC verification request has been approved.', NULL, '2023-05-15 00:57:13', '2023-05-15 00:57:13'),
('8fbeacac-4c6b-4358-a117-00f1bf578790', 'cb74f45c-280c-42fd-a06e-a4672280c040', 'Your BTC wallet has been increased with 1200 BTC by system.', NULL, '2023-12-18 16:03:16', '2023-12-18 16:03:16'),
('92e40f10-67d7-4cf3-9700-c7d6d808eae9', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'Your TRX wallet has been increased with 10000000 TRX by system.', '2023-06-08 18:28:07', '2023-05-14 02:30:55', '2023-06-08 18:28:07'),
('94118161-c84f-4702-b481-8d10c2dcbdd2', 'cb74f45c-280c-42fd-a06e-a4672280c040', 'Your USDT wallet has been increased with 500 USDT by system.', '2023-08-08 08:44:04', '2023-07-21 18:08:35', '2023-08-08 08:44:04'),
('94971649-5760-4b71-a4c6-d6561422a5b2', 'c71eeafd-849d-4cb7-8275-1ebcd9ac93d8', 'Your ETH wallet has been increased with 250000 ETH by system.', NULL, '2023-12-04 17:59:30', '2023-12-04 17:59:30'),
('94f780f9-42ce-450c-bef6-bd22738c9254', '7109c567-63f7-4d17-a2d5-a518e560408e', 'Your USD wallet has been increased with 10200 USD by system.', NULL, '2023-08-11 13:39:12', '2023-08-11 13:39:12'),
('94fb9380-cddd-4ac1-bbc7-5c3d9d5bd14b', 'db5d841b-d90a-4437-957a-c7fb5fa86319', 'Your DOGE wallet has been increased with 99999999999.99999999 DOGE by system.', NULL, '2023-05-28 09:00:13', '2023-05-28 09:00:13'),
('954fa779-e598-4ff4-80a1-e2125019b9d3', 'b9ec7d63-015c-4814-b253-eb1d45eae4dd', 'Your USDT wallet has been increased with 150000 USDT by system.', NULL, '2023-10-11 17:00:29', '2023-10-11 17:00:29'),
('97c9dee1-3f3c-490e-9c7e-73797a9df844', '6eb3595c-031c-4f55-abee-80cf6d8c816b', 'You just changed your account\'s password.', NULL, '2023-09-10 14:58:21', '2023-09-10 14:58:21'),
('98d123ca-7e11-47bf-be81-e31c41009408', 'c71eeafd-849d-4cb7-8275-1ebcd9ac93d8', 'Your USDT wallet has been increased with 250000 USDT by system.', NULL, '2023-12-05 09:13:38', '2023-12-05 09:13:38'),
('98ea5ed2-1a79-4187-85a8-a23a94ce00fc', '86f3c2c9-e4c3-4192-ad1e-d34a6b188833', 'Your USDT wallet has been increased with 75 USDT by system.', NULL, '2023-07-28 21:24:32', '2023-07-28 21:24:32'),
('9b4b305c-2ceb-45be-9f7f-3ac4793875a7', 'cb74f45c-280c-42fd-a06e-a4672280c040', 'Your account\'s role has been changed by admin.', NULL, '2023-12-18 16:25:25', '2023-12-18 16:25:25'),
('9c1947ea-ab55-44ea-ad11-eb03cabb3998', 'fb35867d-1db8-4b6d-9f19-54ab0b2ddab1', 'Your USDT wallet has been increased with 2500 USDT by system.', '2023-06-01 15:04:57', '2023-06-01 14:39:40', '2023-06-01 15:04:57'),
('9e293a93-5049-4d5c-bb9f-ac5b544b9279', '52523c96-98e6-4e75-a1d8-e3cf094993a1', 'Your account\'s role has been changed by admin.', NULL, '2023-11-14 10:04:09', '2023-11-14 10:04:09'),
('9f03ebfb-50b2-4dbf-bb37-f98cd0085a9c', '47eaf168-5901-4ccb-8b9c-d7f9c754ed04', 'Your BTC wallet has been increased with 10000 BTC by system.', NULL, '2023-05-31 10:28:17', '2023-05-31 10:28:17'),
('a19bee68-ba43-4eec-8e30-306afcc08dd4', 'e7862d9c-fba8-4509-b59b-a4cb4f71ba04', 'Your USDT wallet has been increased with 100000 USDT by system.', NULL, '2024-02-06 14:01:52', '2024-02-06 14:01:52'),
('a33d73e2-e0bc-4910-9993-e6c42010008e', 'e7862d9c-fba8-4509-b59b-a4cb4f71ba04', 'Your USDT wallet has been increased with 43000 USDT by system.', NULL, '2024-02-06 14:03:24', '2024-02-06 14:03:24'),
('a380f31c-f2c0-4d0f-9f95-9c44b3f28c52', 'db5d841b-d90a-4437-957a-c7fb5fa86319', 'Your USDT wallet has been increased with 99999999999.99999999 USDT by system.', NULL, '2023-05-28 09:00:26', '2023-05-28 09:00:26'),
('a41ea83c-2db2-45ac-8e65-409143bb7554', 'd2b09976-3be3-43e8-81ef-d0dd81784cdf', 'Your USD wallet has been increased with 220 USD by system.', NULL, '2023-07-28 05:58:57', '2023-07-28 05:58:57'),
('a6b3ddd9-32d8-46dd-8024-662bf497f616', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'Your USD wallet has been increased with 9999999 USD by system.', '2023-06-08 18:28:15', '2023-05-31 12:22:06', '2023-06-08 18:28:15'),
('a782ff4b-133e-4b45-836c-6a15a78dfa22', '44d4809d-28e1-4685-b15c-dc11134fdf1d', 'Your TRX wallet has been increased with 2000 TRX by system.', NULL, '2023-12-16 11:44:07', '2023-12-16 11:44:07'),
('a84efde9-8217-401d-9154-6a42afdb011e', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'You just changed your account\'s password.', '2023-10-29 02:19:02', '2023-10-23 14:13:21', '2023-10-29 02:19:02'),
('a98fbcf7-ceb2-4c23-b4fb-a9ebbeb072e6', '4737ffad-8afe-4bbe-9c76-9ece9d55068f', 'Your USD wallet has been increased with 35000 USD by system.', NULL, '2023-11-22 09:14:12', '2023-11-22 09:14:12'),
('a9cb2101-53e9-49a8-8ba1-f31aa5ff7a57', 'e7862d9c-fba8-4509-b59b-a4cb4f71ba04', 'Your USD wallet has been increased with 43400 USD by system.', NULL, '2024-02-06 14:02:51', '2024-02-06 14:02:51'),
('aacdda17-59aa-4a6d-bd3f-e85c981a1945', '36f5887f-2b9b-4144-879c-9be2cff7e466', 'Your ETH wallet has been increased with 2100 ETH by system.', NULL, '2023-06-22 22:43:52', '2023-06-22 22:43:52'),
('abe80d1f-900f-475c-8106-8514960d3151', '675d5181-9662-4d5a-8e29-924e2b58b24f', 'Your USD wallet has been increased with 750 USD by system.', NULL, '2023-07-25 15:41:01', '2023-07-25 15:41:01'),
('abef0cac-206b-43cf-93fe-076652973205', '44d4809d-28e1-4685-b15c-dc11134fdf1d', 'Your TRX wallet has been increased with 1100 TRX by system.', NULL, '2023-12-06 15:12:08', '2023-12-06 15:12:08'),
('ac4c3da7-9b96-40f5-a741-9e0e6afdb5ec', '12a277f5-c2ee-44a6-82da-f6f5e03758a9', 'Your USDT wallet has been increased with 50000 USDT by system.', NULL, '2023-06-01 13:18:43', '2023-06-01 13:18:43'),
('ad9e61b3-fa0a-40d8-b4d8-62c500bab325', '86f3c2c9-e4c3-4192-ad1e-d34a6b188833', 'Your TRX wallet has been increased with 2.00000000 TRX by system.', NULL, '2023-07-19 09:49:53', '2023-07-19 09:49:53'),
('aec39fae-3b98-434c-8ef9-1e69c023513f', '60145862-0641-4106-af67-8de47b916abe', 'Your TRX wallet has been increased with 2.00000000 TRX by system.', NULL, '2023-06-05 09:55:16', '2023-06-05 09:55:16'),
('b0164d56-b9cb-433c-888e-f74424054e27', '47eaf168-5901-4ccb-8b9c-d7f9c754ed04', 'Your USD wallet has been increased with 5000 USD by system.', NULL, '2023-05-31 10:45:57', '2023-05-31 10:45:57'),
('b04145d0-dbb8-48fa-b5f3-2840c28a5bd7', '60145862-0641-4106-af67-8de47b916abe', 'Your USDT wallet has been increased with 42300 USDT by system.', NULL, '2023-10-23 14:23:41', '2023-10-23 14:23:41'),
('b13c19d2-02f4-40ce-8588-a577cc2ebba3', 'd2b09976-3be3-43e8-81ef-d0dd81784cdf', 'Your TRX wallet has been increased with 18900 TRX by system.', NULL, '2023-11-23 00:12:21', '2023-11-23 00:12:21'),
('b5a3ac39-2c46-4fcf-b404-7d1cba62a051', 'db5d841b-d90a-4437-957a-c7fb5fa86319', 'Your BTC wallet has been increased with 99999999999.99999999 BTC by system.', NULL, '2023-05-28 09:00:40', '2023-05-28 09:00:40'),
('b692b0f7-fb48-4961-9b10-28c21e37a0f7', 'fb35867d-1db8-4b6d-9f19-54ab0b2ddab1', 'You just changed your account\'s password.', '2023-06-20 14:50:05', '2023-06-01 18:21:22', '2023-06-20 14:50:05'),
('b69fc1e2-84d2-4aa3-bce2-8a5518a0ccbb', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'Your AUSD wallet has been increased with 1000000 AUSD by system.', '2023-05-28 08:57:41', '2023-05-14 02:40:40', '2023-05-28 08:57:41'),
('b6eaf95c-bb59-4f93-b24f-ce8c9ad977c0', 'd2b09976-3be3-43e8-81ef-d0dd81784cdf', 'Your USDT wallet has been increased with 12960 USDT by system.', NULL, '2023-07-26 11:31:23', '2023-07-26 11:31:23'),
('b899f2d0-e713-4aab-b0e9-54769e7c5181', 'cb74f45c-280c-42fd-a06e-a4672280c040', 'Your account\'s role has been changed by admin.', NULL, '2023-12-18 16:04:17', '2023-12-18 16:04:17'),
('b8e314fc-bbb6-49cb-b63b-a6838f09a0a9', 'adc69fe5-342e-4db7-83d6-1aa6b50e4217', 'Your USD wallet has been increased with 10000 USD by system.', NULL, '2023-05-30 10:21:02', '2023-05-30 10:21:02'),
('b9df477d-0f96-4d4e-a76a-2247e8fd3ffe', '36f5887f-2b9b-4144-879c-9be2cff7e466', 'Your ETH wallet has been increased with 2320 ETH by system.', NULL, '2023-06-24 13:58:51', '2023-06-24 13:58:51'),
('ba8c65a2-3dca-426d-92ec-daf43f2a9844', 'da77601a-40e5-4bb1-b584-2b82bd26370f', 'Your TRX wallet has been increased with 2.0000 TRX by system.', NULL, '2023-07-18 12:18:02', '2023-07-18 12:18:02'),
('bbb7f138-ec63-4484-8a89-2756cde16658', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'Your TRX wallet has been increased with 1000000 TRX by system.', '2023-03-30 07:34:22', '2023-03-17 14:11:25', '2023-03-30 07:34:22'),
('bc1c4625-5ffd-4a50-8192-38d11e4064c2', 'd86b3a4d-3a57-426e-8e1e-95a6be996bb5', 'Your TRX wallet has been increased with 2.00000000 TRX by system.', '2023-07-22 11:32:01', '2023-07-19 11:02:53', '2023-07-22 11:32:01'),
('bca8f588-f065-4847-af6b-e6278814d467', '44d4809d-28e1-4685-b15c-dc11134fdf1d', 'Your USDT wallet has been increased with 1021 USDT by system.', NULL, '2023-12-06 15:12:23', '2023-12-06 15:12:23'),
('bcd3198c-c41c-4fd5-a1e8-9564f7fc75fd', 'a502eb20-d81c-4f3e-a56f-11444fe1e4cb', 'Your BTC wallet has been increased with 70 BTC by system.', '2023-07-24 12:09:45', '2023-07-18 13:27:48', '2023-07-24 12:09:45'),
('bdeb6ac3-4902-4ed6-abcb-cacde1a52b2f', 'e7862d9c-fba8-4509-b59b-a4cb4f71ba04', 'Your BTC wallet has been increased with 152000 BTC by system.', NULL, '2023-09-11 14:47:15', '2023-09-11 14:47:15'),
('bfaaf621-2fb4-45eb-a2b1-97c98e1c8b59', 'e7862d9c-fba8-4509-b59b-a4cb4f71ba04', 'Your USD wallet has been increased with 43000 USD by system.', NULL, '2024-02-06 14:01:05', '2024-02-06 14:01:05'),
('c14d43d7-9106-424b-975a-5b9fa73a5ddd', 'a502eb20-d81c-4f3e-a56f-11444fe1e4cb', 'Your BTC wallet has been increased with 20 BTC by system.', '2023-07-18 13:28:35', '2023-07-18 13:27:41', '2023-07-18 13:28:35'),
('c1d0711e-149d-4f88-8253-e998c54311b7', '44d4809d-28e1-4685-b15c-dc11134fdf1d', 'Your TRX wallet has been increased with 4500 TRX by system.', NULL, '2023-12-06 15:11:59', '2023-12-06 15:11:59'),
('c357ccb3-651e-4782-ad0c-fa5536d7eeda', '6800875b-c059-49a2-aec7-8612c7d402a1', 'Your USD wallet has been increased with 95000 USD by system.', NULL, '2023-11-22 17:14:03', '2023-11-22 17:14:03'),
('c381bcaa-b6ac-4dcc-9e72-3aba0ca88f5e', '36f5887f-2b9b-4144-879c-9be2cff7e466', 'Your USDT wallet has been increased with 80000 USDT by system.', NULL, '2023-06-13 01:18:56', '2023-06-13 01:18:56'),
('c5fdf31d-c17f-4626-978e-abc66d6e5dc1', '60145862-0641-4106-af67-8de47b916abe', 'Your USDT wallet has been increased with 42300 USDT by system.', NULL, '2023-12-14 00:41:38', '2023-12-14 00:41:38'),
('c64be544-c6de-481f-a410-883efd19b30e', 'c71eeafd-849d-4cb7-8275-1ebcd9ac93d8', 'Your USDT wallet has been increased with 5910 USDT by system.', NULL, '2024-02-27 05:07:49', '2024-02-27 05:07:49'),
('c754114d-c16c-48f7-9261-8f1801321116', 'd86b3a4d-3a57-426e-8e1e-95a6be996bb5', 'Your USDT wallet has been increased with 11000 USDT by system.', '2023-07-21 13:26:50', '2023-07-19 11:03:13', '2023-07-21 13:26:50'),
('c830f5ad-f031-4f16-97a3-151c7605a24b', '6dd2b333-abab-4c57-b4f5-d33e4dd70f39', 'Your BTC wallet has been increased with 29000 BTC by system.', NULL, '2023-08-04 16:50:56', '2023-08-04 16:50:56'),
('c9134245-9ee1-4ae1-8d3c-15949b95c47a', '7cde25b7-e520-4fb3-85df-f5fcf89305d3', 'Your USDT wallet has been increased with 5500 USDT by system.', NULL, '2023-06-09 13:46:03', '2023-06-09 13:46:03'),
('ca9f87fc-2ed0-4cfb-bda7-cf665cb67388', 'e7862d9c-fba8-4509-b59b-a4cb4f71ba04', 'Your USDT wallet has been increased with 43200 USDT by system.', NULL, '2024-02-06 14:02:11', '2024-02-06 14:02:11'),
('cb91ac1e-5303-469c-91ea-f5afdbacca04', '675d5181-9662-4d5a-8e29-924e2b58b24f', 'Your USDT wallet has been increased with 750 USDT by system.', NULL, '2023-07-25 17:37:10', '2023-07-25 17:37:10'),
('cbbdf176-cbe9-4598-96d5-35ebd2c1b40f', 'a502eb20-d81c-4f3e-a56f-11444fe1e4cb', 'Your KYC verification request has been approved.', '2023-06-02 18:47:29', '2023-05-09 01:12:49', '2023-06-02 18:47:29'),
('cc3ffac0-2bd2-4214-81bc-81ef6384db38', '1ac9db2f-613b-4351-ba36-aa8a8e502079', 'Your ETH wallet has been increased with 18000 ETH by system.', NULL, '2023-06-02 16:53:39', '2023-06-02 16:53:39'),
('cd0f37a2-5d9f-4bca-b49e-40473308d12e', '6cd1a9e7-a910-43c8-a930-95dcb2c8edca', 'Your USD wallet has been increased with 200 USD by system.', NULL, '2023-08-07 18:14:20', '2023-08-07 18:14:20'),
('cedb13b8-7b95-4af9-9a00-0454f292f9f4', '60145862-0641-4106-af67-8de47b916abe', 'Your USDT wallet has been increased with 29000 USDT by system.', NULL, '2023-06-05 09:55:40', '2023-06-05 09:55:40'),
('cf04eb23-2e0a-4601-ae05-29867c49d76d', 'e7862d9c-fba8-4509-b59b-a4cb4f71ba04', 'Your BTC wallet has been increased with 158000 BTC by system.', NULL, '2023-08-29 04:05:32', '2023-08-29 04:05:32'),
('cf8cfc2b-954c-44a3-94a8-e3fc9d6d52ab', '933d676a-c435-4697-bdf2-e54d026c156e', 'Your USD wallet has been increased with 1000 USD by system.', NULL, '2023-05-31 12:19:17', '2023-05-31 12:19:17'),
('cfcb281e-7f43-4c20-a5d0-ec5ab7e01c4e', '675d5181-9662-4d5a-8e29-924e2b58b24f', 'Your USDT wallet has been increased with 750 USDT by system.', NULL, '2023-07-25 15:40:26', '2023-07-25 15:40:26'),
('d0e62909-1195-485d-9438-31a99e5e0edd', 'ea3c376d-8e83-4e18-be5c-25fda612432f', 'Your LTC wallet has been increased with 11 LTC by system.', NULL, '2023-05-08 23:54:00', '2023-05-08 23:54:00'),
('d158e7b8-1dbb-40fe-b7cd-192c432a80e5', 'cf37d061-aa9c-460d-9701-66439afc812d', 'Your USDT wallet has been increased with 24000 USDT by system.', NULL, '2023-06-13 13:24:15', '2023-06-13 13:24:15'),
('d332f7b9-e46d-4a99-8c2c-08a4cff13112', '6eb3595c-031c-4f55-abee-80cf6d8c816b', 'Your USDT wallet has been increased with 150000 USDT by system.', NULL, '2023-09-17 18:28:37', '2023-09-17 18:28:37'),
('d4639666-2e9a-4c53-9ee2-41c1e0f5ea74', '4737ffad-8afe-4bbe-9c76-9ece9d55068f', 'Your USD wallet has been increased with 55000 USD by system.', NULL, '2023-11-22 09:12:56', '2023-11-22 09:12:56'),
('d538e4ea-651c-464c-be86-2f5879b92201', '44d4809d-28e1-4685-b15c-dc11134fdf1d', 'You just changed your account\'s password.', NULL, '2023-12-04 14:09:11', '2023-12-04 14:09:11'),
('d637c9fe-2493-4139-9fab-c83bed1b8418', '12a277f5-c2ee-44a6-82da-f6f5e03758a9', 'Your TRX wallet has been increased with 2.00000000 TRX by system.', NULL, '2023-06-01 13:25:20', '2023-06-01 13:25:20'),
('d6c7b2a8-8051-4d62-98b3-50986e4fe8f0', '7109c567-63f7-4d17-a2d5-a518e560408e', 'Your USD wallet has been increased with 150 USD by system.', '2023-08-04 11:28:14', '2023-08-03 18:27:57', '2023-08-04 11:28:14'),
('d7be741a-5086-41c4-bde4-ab6110beea69', 'db5d841b-d90a-4437-957a-c7fb5fa86319', 'Your TRX wallet has been increased with 3 TRX by system.', NULL, '2023-05-26 14:00:25', '2023-05-26 14:00:25'),
('d8030471-f64a-43fe-98d8-46836f09058c', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'Your BTC wallet has been increased with 99999999999.99999999 BTC by system.', '2023-06-05 10:49:36', '2023-05-28 09:02:56', '2023-06-05 10:49:36'),
('da8c7588-9c49-4e58-accb-7eb99525294d', 'e7862d9c-fba8-4509-b59b-a4cb4f71ba04', 'Your BTC wallet has been increased with 6000 BTC by system.', NULL, '2024-02-06 14:02:27', '2024-02-06 14:02:27'),
('daff56cd-33fb-4264-96c4-39ce5db349d7', 'e7862d9c-fba8-4509-b59b-a4cb4f71ba04', 'Your USD wallet has been increased with 478 USD by system.', NULL, '2023-07-25 06:28:03', '2023-07-25 06:28:03'),
('db4d2b5a-c4f6-41f5-bdf4-c771abb3c425', '4737ffad-8afe-4bbe-9c76-9ece9d55068f', 'Your account\'s role has been changed by admin.', NULL, '2023-11-22 09:12:32', '2023-11-22 09:12:32'),
('dc3111fc-888e-4e1e-8fb9-96c5beb3d113', 'd2b09976-3be3-43e8-81ef-d0dd81784cdf', 'Your TRX wallet has been increased with 2000 TRX by system.', NULL, '2023-07-28 06:01:09', '2023-07-28 06:01:09'),
('dc48ff27-46e9-4882-b320-bd4d4f5342bd', 'db5d841b-d90a-4437-957a-c7fb5fa86319', 'Your ETH wallet has been increased with 99999999999.99999999 ETH by system.', NULL, '2023-05-28 08:58:45', '2023-05-28 08:58:45'),
('dcb73c80-76d7-40b2-bb5a-f92afeeefa9f', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'Your TRX wallet has been increased with 1000000 TRX by system.', '2023-05-22 14:26:38', '2023-05-14 02:30:44', '2023-05-22 14:26:38'),
('dd2a2d6a-a0e0-4db4-9a30-b99d6775230b', 'ea3c376d-8e83-4e18-be5c-25fda612432f', 'دسترسی کاربری شما توسط مدیر تغییر کرد.', NULL, '2023-05-08 02:02:12', '2023-05-08 02:02:12'),
('dd8e6a27-d270-42c5-a086-7d179f5b3b2e', 'b9ec7d63-015c-4814-b253-eb1d45eae4dd', 'Your USD wallet has been increased with 10000 USD by system.', NULL, '2023-06-20 13:48:13', '2023-06-20 13:48:13'),
('deea6a2f-16ca-417d-96e2-a2519d0a5fa3', 'd2b09976-3be3-43e8-81ef-d0dd81784cdf', 'Your USDT wallet has been increased with 160 USDT by system.', NULL, '2023-07-26 10:02:50', '2023-07-26 10:02:50'),
('e15d38bb-f273-46db-b9f6-2191422e38d1', 'c71eeafd-849d-4cb7-8275-1ebcd9ac93d8', 'Your USDT wallet has been increased with 250000 USDT by system.', NULL, '2024-02-27 05:05:35', '2024-02-27 05:05:35'),
('e1b8724a-52d9-4f44-8cff-6966a601ac08', '86f3c2c9-e4c3-4192-ad1e-d34a6b188833', 'Your USDT wallet has been increased with 25 USDT by system.', NULL, '2023-07-28 20:58:18', '2023-07-28 20:58:18'),
('e5aefd04-4e2b-41ac-a2c0-57d3dc872908', 'cb74f45c-280c-42fd-a06e-a4672280c040', 'Your USDT wallet has been increased with 35000 USDT by system.', NULL, '2023-12-18 12:05:09', '2023-12-18 12:05:09'),
('e9b53404-9e01-40a7-af8c-a2ea38f5b89f', '675d5181-9662-4d5a-8e29-924e2b58b24f', 'Your USD wallet has been increased with 750 USD by system.', NULL, '2023-07-25 17:36:52', '2023-07-25 17:36:52'),
('ea611701-566f-4c5c-ae5e-2cb0270118ff', '6dd2b333-abab-4c57-b4f5-d33e4dd70f39', 'Your BTC wallet has been increased with 10000000000 BTC by system.', NULL, '2023-08-04 16:52:38', '2023-08-04 16:52:38'),
('eb77c10c-874f-4455-afb5-7461ff004b2a', '675d5181-9662-4d5a-8e29-924e2b58b24f', 'Your TRX wallet has been increased with 23 TRX by system.', NULL, '2023-09-28 16:55:25', '2023-09-28 16:55:25'),
('f0fb3d69-127a-40b4-86ca-a8303cd1b2a4', '60145862-0641-4106-af67-8de47b916abe', 'Your USDT wallet has been increased with 29000 USDT by system.', NULL, '2023-10-23 14:23:30', '2023-10-23 14:23:30'),
('f30bdf8c-0653-473e-a2ab-8f4957e8a45c', 'd2b09976-3be3-43e8-81ef-d0dd81784cdf', 'Your USDT wallet has been increased with 1000000 USDT by system.', NULL, '2023-08-14 11:00:08', '2023-08-14 11:00:08'),
('f37e5b94-4515-4fd0-9012-4692920eba80', 'a502eb20-d81c-4f3e-a56f-11444fe1e4cb', 'Your account\'s role has been changed by admin.', NULL, '2023-09-17 18:30:17', '2023-09-17 18:30:17'),
('f3b9573b-74f7-43ea-b20c-3d4d925ac551', 'ecbb1278-fb14-4952-8ef9-fc77aef93d3d', 'Your USDT wallet has been increased with 43000 USDT by system.', NULL, '2024-02-06 13:58:29', '2024-02-06 13:58:29'),
('f4d3cbe6-a04e-44d4-ae18-5b7dd32d4af2', 'e7862d9c-fba8-4509-b59b-a4cb4f71ba04', 'Your USDT wallet has been increased with 35500 USDT by system.', NULL, '2024-02-06 15:05:10', '2024-02-06 15:05:10'),
('f503887c-3c46-4e05-ac16-e2a9a813eda8', '52523c96-98e6-4e75-a1d8-e3cf094993a1', 'کیف پول TRX توسط مدیر به میزان 4 TRX افزایش یافت.', NULL, '2023-08-25 07:54:19', '2023-08-25 07:54:19'),
('f555d6d1-e2f8-4f54-a574-7933df877f67', 'b9ec7d63-015c-4814-b253-eb1d45eae4dd', 'Your account\'s role has been changed by admin.', NULL, '2023-06-20 13:47:34', '2023-06-20 13:47:34'),
('f6ab7eca-013d-48ef-a022-c904e150d304', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'Your USD wallet has been increased with 8000000000 USD by system.', '2023-03-07 10:46:06', '2023-03-07 10:39:55', '2023-03-07 10:46:06'),
('f7516388-d8fb-4db3-a1ba-99f0702151d1', '36f5887f-2b9b-4144-879c-9be2cff7e466', 'Your ETH wallet has been increased with 2100 ETH by system.', NULL, '2023-06-22 23:05:02', '2023-06-22 23:05:02'),
('f82af858-aae7-41e5-b88d-ce6731a9eab1', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'Your withdrawal request of 5000.00000000 USDT has been completed.', '2023-07-12 14:35:55', '2023-06-14 18:00:20', '2023-07-12 14:35:55'),
('f86d80ca-9496-43cc-8d6b-67fb766944c0', 'd2b09976-3be3-43e8-81ef-d0dd81784cdf', 'Your USDT wallet has been increased with 11800 USDT by system.', NULL, '2023-07-26 10:02:41', '2023-07-26 10:02:41'),
('f94e2cce-7165-4cd5-86bd-a9c714162a17', '32769d8c-4dca-40d5-83ec-99b68df4b130', 'Your USDT wallet has been increased with 10000 USDT by system.', NULL, '2023-05-30 10:15:28', '2023-05-30 10:15:28'),
('fa63ad7a-6275-405b-83e7-d3c38e40530d', 'd2b09976-3be3-43e8-81ef-d0dd81784cdf', 'Your USDT wallet has been increased with 10000 USDT by system.', NULL, '2023-11-23 00:10:48', '2023-11-23 00:10:48'),
('fbea9498-5460-42ef-8ce0-b2b4c33bfd1e', 'a502eb20-d81c-4f3e-a56f-11444fe1e4cb', 'You just changed your account\'s password.', NULL, '2023-09-10 15:04:04', '2023-09-10 15:04:04'),
('fd4de8e4-e475-4354-98f7-3110404dd17d', 'c71eeafd-849d-4cb7-8275-1ebcd9ac93d8', 'Your USDT wallet has been increased with 5450 USDT by system.', NULL, '2024-02-27 05:06:21', '2024-02-27 05:06:21'),
('fdbe5cc2-38a0-42eb-9ca0-85da09ab6fc7', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'Your BTC wallet has been increased with 11000 BTC by system.', '2023-06-08 18:28:43', '2023-05-09 03:18:35', '2023-06-08 18:28:43'),
('ff3c8935-34d6-4bd2-9606-856b7c94c0b4', '47eaf168-5901-4ccb-8b9c-d7f9c754ed04', 'Your BTC wallet has been increased with 5000 BTC by system.', NULL, '2023-05-31 10:29:23', '2023-05-31 10:29:23'),
('fff0e789-c255-4316-b81a-4bcacc5208f2', 'd2b09976-3be3-43e8-81ef-d0dd81784cdf', 'Your ETH wallet has been increased with 14960 ETH by system.', NULL, '2023-07-28 06:00:47', '2023-07-28 06:00:47');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` char(36) NOT NULL,
  `user_id` char(36) NOT NULL,
  `trade_coin` varchar(10) NOT NULL,
  `base_coin` varchar(10) NOT NULL,
  `trade_pair` varchar(20) NOT NULL,
  `category` varchar(20) NOT NULL,
  `type` varchar(20) NOT NULL,
  `price` decimal(32,8) UNSIGNED DEFAULT NULL,
  `amount` decimal(32,8) UNSIGNED DEFAULT NULL,
  `total` decimal(32,8) UNSIGNED DEFAULT NULL,
  `exchanged` decimal(32,8) UNSIGNED NOT NULL DEFAULT 0.00000000,
  `canceled` decimal(32,8) UNSIGNED NOT NULL DEFAULT 0.00000000,
  `stop_limit` decimal(32,8) UNSIGNED DEFAULT NULL,
  `maker_fee_in_percent` decimal(5,2) UNSIGNED NOT NULL,
  `taker_fee_in_percent` decimal(5,2) UNSIGNED NOT NULL,
  `thirdparty` varchar(150) DEFAULT NULL,
  `thirdparty_order_id` char(36) DEFAULT NULL,
  `thirdparty_fee` decimal(32,8) DEFAULT NULL,
  `thirdparty_fee_symbol` varchar(30) DEFAULT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `trade_coin`, `base_coin`, `trade_pair`, `category`, `type`, `price`, `amount`, `total`, `exchanged`, `canceled`, `stop_limit`, `maker_fee_in_percent`, `taker_fee_in_percent`, `thirdparty`, `thirdparty_order_id`, `thirdparty_fee`, `thirdparty_fee_symbol`, `status`, `created_at`, `updated_at`) VALUES
('05c61727-7767-4c3f-b6c3-8463e3ac32c5', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'BTC', 'USDT', 'BTC_USDT', 'market', 'buy', NULL, 535767.60314444, 36271466732.87831879, 0.00000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'pending', '2024-04-04 11:46:17', '2024-04-04 11:46:17'),
('064cc197-6341-4d89-aacb-350f1823ef27', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', 'USDT', 'IRT', 'USDT_IRT', 'limit', 'sell', 58699.00000000, 247.29000000, 247.29000000, 0.00000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'pending', '2024-02-28 05:26:00', '2024-02-28 05:26:00'),
('0834a75e-e823-4e65-882c-1e509b4890c4', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'BTC', 'USDT', 'BTC_USDT', 'market', 'sell', 3029.00000000, 0.00050000, 0.00050000, 0.00000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'pending', '2023-09-17 18:35:27', '2023-09-17 18:35:27'),
('089eda57-ddb5-4d7a-929c-c360e9faefdf', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'BTC', 'USDT', 'BTC_USDT', 'market', 'sell', 3029.00000000, 0.00048000, 1.45392000, 0.00000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'pending', '2023-10-17 18:27:28', '2023-10-17 18:27:28'),
('0983c8d0-82e5-4b27-8742-d26099293a70', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', 'USDT', 'IRT', 'USDT_IRT', 'limit', 'sell', 503530.00000000, 393.60000000, 393.60000000, 393.60000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'completed', '2023-09-05 08:43:00', '2023-09-05 08:43:00'),
('0b74c705-53ec-4611-b6ad-82fcd8a0ef16', '44d4809d-28e1-4685-b15c-dc11134fdf1d', 'TRX', 'DOGE', 'TRX_DOGE', 'market', 'sell', 1.00000000, 1000.00000000, 1000.00000000, 1000.00000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'completed', '2023-12-16 11:49:27', '2023-12-16 11:49:27'),
('0e2a698e-1347-4187-9f30-a9022e1a1206', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'BTC', 'USDT', 'BTC_USDT', 'limit', 'buy', 70303.80000000, 1.00000000, 70303.80000000, 1.00000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'completed', '2024-04-09 10:45:09', '2024-04-09 10:45:09'),
('0efbdc9b-76be-4739-9df3-a3578924c535', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', 'USDT', 'IRT', 'USDT_IRT', 'limit', 'buy', 503600.00000000, 134.10000000, 134.10000000, 134.10000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'completed', '2023-09-05 08:44:00', '2023-09-05 08:44:00'),
('12178a4c-a714-4ad6-9fc2-ae5b939d0e77', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', 'USDT', 'IRT', 'USDT_IRT', 'limit', 'buy', 503880.00000000, 3133.28000000, 3133.28000000, 0.00000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'completed', '2023-09-05 08:44:00', '2023-09-05 08:44:00'),
('15d82e7a-11e7-47cd-ae3a-e34c24e39772', 'c71eeafd-849d-4cb7-8275-1ebcd9ac93d8', 'TRX', 'DOGE', 'TRX_DOGE', 'market', 'sell', 1.00000000, 1000.00000000, 1000.00000000, 1000.00000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'completed', '2023-12-16 12:37:07', '2023-12-16 12:37:07'),
('19e126b3-77f7-4af7-8a9b-74f9ce8f8381', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', 'USDT', 'IRT', 'USDT_IRT', 'limit', 'sell', 503530.00000000, 357.29000000, 357.29000000, 357.29000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'completed', '2023-09-05 08:45:00', '2023-09-05 08:45:00'),
('1a5b018a-5007-49d7-b008-67abe98b9ff6', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', 'USDT', 'IRT', 'USDT_IRT', 'limit', 'buy', 503880.00000000, 2776.24000000, 2776.24000000, 0.00000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'completed', '2023-09-05 08:45:00', '2023-09-05 08:45:00'),
('1b2c2965-ccb9-4cb9-afe7-34df5369df45', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', 'USDT', 'IRT', 'USDT_IRT', 'limit', 'buy', 503990.00000000, 9781.37000000, 9781.37000000, 0.00000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'completed', '2023-09-05 08:38:00', '2023-09-05 08:38:00'),
('1c91fb33-86f6-4c92-a5a0-afbedd65c324', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', 'USDT', 'IRT', 'USDT_IRT', 'limit', 'buy', 503880.00000000, 573.86000000, 573.86000000, 0.00000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'completed', '2023-09-05 08:45:00', '2023-09-05 08:45:00'),
('1cb52969-980d-49ab-98de-aafc4619b358', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', 'USDT', 'IRT', 'USDT_IRT', 'limit', 'buy', 503890.00000000, 95.72000000, 95.72000000, 95.72000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'completed', '2023-09-05 08:48:00', '2023-09-05 08:48:00'),
('1f10571d-7270-472b-848d-d4d2c9dba86d', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', 'USDT', 'IRT', 'USDT_IRT', 'limit', 'buy', 503890.00000000, 99.68000000, 99.68000000, 99.68000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'completed', '2023-09-05 08:43:00', '2023-09-05 08:43:00'),
('1f7be565-40d3-4fc5-b205-60f9f8ab3963', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'BTC', 'USDT', 'BTC_USDT', 'market', 'sell', 3029.00000000, 0.00040000, 0.00040000, 0.00000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'pending', '2023-09-17 19:10:08', '2023-09-17 19:10:08'),
('20b9185f-2d38-49a7-9a0e-be2200b3cfd7', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'BTC', 'USDT', 'BTC_USDT', 'market', 'sell', 3029.00000000, 0.00050000, 0.00050000, 0.00000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'pending', '2023-09-17 19:11:53', '2023-09-17 19:11:53'),
('21229cf5-3bdc-4ae3-be47-40d0b37c58e6', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'BTC', 'USDT', 'BTC_USDT', 'limit', 'buy', 41076.00000000, 311614.00907300, 12799857036.68254800, 0.00000000, 311614.00907300, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'canceled', '2024-01-22 02:47:29', '2024-01-31 05:05:00'),
('2405039f-c121-4572-a530-fb9302476256', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'BTC', 'USDT', 'BTC_USDT', 'market', 'sell', 3029.00000000, 0.00006000, 0.00006000, 0.00000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'pending', '2023-09-17 19:14:43', '2023-09-17 19:14:43'),
('24ccbc58-63fe-4464-801e-d27bd528d9af', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'TRX', 'DOGE', 'TRX_DOGE', 'market', 'sell', NULL, 10.00000000, 10.00000000, 10.00000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'completed', '2023-10-27 05:29:30', '2023-10-27 05:29:30'),
('275d236b-f569-4338-9314-bcdce1db979d', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', 'USDT', 'IRT', 'USDT_IRT', 'limit', 'sell', 503880.00000000, 573.86000000, 573.86000000, 0.00000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'completed', '2023-09-05 08:45:00', '2023-09-05 08:45:00'),
('2c53e4fb-9c72-49ab-82d9-85b36f07618b', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'BTC', 'USDT', 'BTC_USDT', 'limit', 'buy', 65158.00000000, 4.00000000, 260632.00000000, 0.00000000, 4.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'canceled', '2024-03-21 15:36:56', '2024-04-09 01:44:56'),
('31a5b708-6b42-46b7-b0b7-e52246231c3b', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'TRX', 'DOGE', 'TRX_DOGE', 'market', 'sell', 1.00000000, 200.00000000, 200.00000000, 200.00000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'completed', '2023-12-15 05:30:56', '2023-12-15 05:30:56'),
('31e9f089-be14-4d8a-a4c6-d1ec44acef0d', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'TRX', 'USDT', 'TRX_USDT', 'market', 'sell', 0.10393000, 115.46233041, 12.00000000, 0.00000000, 115.46233041, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'canceled', '2023-12-07 19:38:14', '2024-01-31 05:05:00'),
('33eb159f-73e4-4da5-9aae-7be788537755', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', 'USDT', 'IRT', 'USDT_IRT', 'limit', 'sell', 503890.00000000, 95.72000000, 95.72000000, 0.00000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'pending', '2023-09-05 08:48:00', '2023-09-05 08:48:00'),
('35f0521d-6d93-4241-9323-ed1c22c89aa1', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'BTC', 'USDT', 'BTC_USDT', 'limit', 'buy', 41075.86000000, 233711.30336679, 9599892777.51179468, 0.00060000, 233711.30276679, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'canceled', '2024-01-22 02:48:02', '2024-01-31 05:05:10'),
('379761e9-b954-41bd-928c-055541e089c8', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'BTC', 'USDT', 'BTC_USDT', 'limit', 'buy', 43914.26000000, 364342.28255285, 15999821725.01931864, 0.00000000, 364342.28255285, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'canceled', '2023-12-09 05:51:14', '2024-01-31 05:05:00'),
('391b4dda-539a-48ac-a24d-d40b9c048d28', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', 'USDT', 'IRT', 'USDT_IRT', 'limit', 'sell', 503880.00000000, 573.86000000, 573.86000000, 0.00000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'pending', '2023-09-05 08:45:00', '2023-09-05 08:45:00'),
('3aa82832-45d2-4d4b-8792-672a66ebf33f', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'BTC', 'USDT', 'BTC_USDT', 'market', 'sell', 3029.00000000, 99886138927.78547668, 99886138927.78547668, 0.00000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'pending', '2023-10-05 16:47:35', '2023-10-05 16:47:35'),
('4015e8b4-841a-4531-9f31-010c56ea4415', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'BTC', 'USDT', 'BTC_USDT', 'market', 'sell', 68371.89000000, 34342.21343988, 2348042039.66799688, 0.00000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'pending', '2024-03-16 13:10:31', '2024-03-16 13:10:31'),
('41b64b5e-cbeb-41b2-8919-ad7015e34e84', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', 'USDT', 'IRT', 'USDT_IRT', 'limit', 'sell', 50892.00000000, 74.82000000, 74.82000000, 0.00000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'pending', '2023-11-30 06:25:00', '2023-11-30 06:25:00'),
('4789d02d-e579-4689-a33f-7c926d46b5b6', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'BTC', 'USDT', 'BTC_USDT', 'market', 'sell', 3029.00000000, 111111111.00000000, 111111111.00000000, 0.00000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'pending', '2023-10-05 06:12:33', '2023-10-05 06:12:33'),
('49e4934d-7ea0-49f3-8fdf-986cccf69212', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'BTC', 'USDT', 'BTC_USDT', 'market', 'sell', 3029.00000000, 0.00007000, 0.00007000, 0.00000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'pending', '2023-09-17 19:06:50', '2023-09-17 19:06:50'),
('4c16bf8e-1c65-4bda-b01e-f312a487e937', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'TRX', 'DOGE', 'TRX_DOGE', 'market', 'sell', NULL, 13.00000000, 13.00000000, 13.00000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'completed', '2023-10-27 05:30:16', '2023-10-27 05:30:16'),
('4c61a6e7-bfd9-4d7b-a31f-ce0402c6452e', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'BTC', 'USDT', 'BTC_USDT', 'market', 'buy', NULL, 1.00000000, 70356.07000000, 1.00000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'completed', '2024-04-09 10:45:27', '2024-04-09 10:45:27'),
('4de3489f-c3c9-4266-bf24-856503cde551', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'BTC', 'USDT', 'BTC_USDT', 'market', 'buy', NULL, 0.03000000, 1287.43980000, 0.03000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'completed', '2023-12-15 05:56:05', '2023-12-15 05:56:05'),
('4e42dcd2-29fd-4f2a-a2cb-afec629abc8b', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'BTC', 'USDT', 'BTC_USDT', 'limit', 'buy', 70202.82000000, 1.00000000, 70202.82000000, 1.00000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'completed', '2024-04-09 10:41:20', '2024-04-09 10:41:20'),
('4ff3f357-0958-4679-bd58-857b742ecc85', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'BTC', 'USDT', 'BTC_USDT', 'limit', 'sell', 70202.82000000, 1.00000000, 70202.82000000, 1.00000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'completed', '2024-04-09 10:41:44', '2024-04-09 10:41:44'),
('506670a2-ac01-44af-a4bc-c7096931ae49', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'BTC', 'USDT', 'BTC_USDT', 'limit', 'buy', 43000.17000000, 0.00300000, 129.00051000, 0.00300000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'completed', '2024-01-31 05:05:28', '2024-01-31 05:05:28'),
('53f485b2-dab5-4aff-8092-5d74f033e1d5', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'BTC', 'USDT', 'BTC_USDT', 'limit', 'buy', 43918.14000000, 291448.07544253, 12799857380.01559449, 0.00000000, 291448.07544253, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'canceled', '2023-12-09 05:51:34', '2024-01-31 05:05:00'),
('5447f2a8-a728-4222-ae96-6e2aaa47a429', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', 'USDT', 'IRT', 'USDT_IRT', 'limit', 'buy', 503530.00000000, 357.29000000, 357.29000000, 357.29000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'completed', '2023-09-05 08:45:00', '2023-09-05 08:45:00'),
('566756e7-9a3c-4df0-b2ef-b793715e74d8', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'BTC', 'USDT', 'BTC_USDT', 'limit', 'buy', 65158.00000000, 4.00000000, 260632.00000000, 4.00000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'completed', '2024-04-09 01:44:41', '2024-04-09 01:44:41'),
('57602cdf-fae3-4ff4-9fc4-0932f47b5081', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'BTC', 'USDT', 'BTC_USDT', 'market', 'sell', 3029.00000000, 0.00006000, 0.00006000, 0.00000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'pending', '2023-09-17 19:08:06', '2023-09-17 19:08:06'),
('5b6f4550-d2ca-4e71-b5f2-1c02ebb4f22a', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', 'USDT', 'IRT', 'USDT_IRT', 'limit', 'sell', 504000.00000000, 1670.00000000, 1670.00000000, 0.00000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'completed', '2023-09-05 08:41:00', '2023-09-05 08:41:00'),
('5bd6b512-258d-4519-abb6-69bcce95bc78', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'BTC', 'USDT', 'BTC_USDT', 'market', 'sell', 3029.00000000, 0.00060000, 0.00060000, 0.00060000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'completed', '2023-09-17 18:57:21', '2023-09-17 18:57:21'),
('5e4fe8b2-43d3-44bd-b6d3-47e9845e7c94', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'TRX', 'DOGE', 'TRX_DOGE', 'market', 'sell', 1.00000000, 1000.00000000, 1000.00000000, 1000.00000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'completed', '2023-12-24 17:44:32', '2023-12-24 17:44:32'),
('5e5a3b85-d22a-496a-ab7b-6b671f016c4b', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'BTC', 'USDT', 'BTC_USDT', 'limit', 'buy', 41055.93000000, 95400.50007940, 3916756253.22484084, 0.00000000, 95400.50007940, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'canceled', '2024-01-22 02:48:29', '2024-01-31 05:05:00'),
('60c5740f-d5d2-4eb2-9cef-c56584f794fe', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', 'USDT', 'IRT', 'USDT_IRT', 'limit', 'buy', 64139.00000000, 20.10000000, 20.10000000, 0.00000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'pending', '2024-04-09 10:39:00', '2024-04-09 10:39:00'),
('64ccba98-d4d2-42df-b1f7-cd41e036e2ba', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'USDT', 'IRT', 'USDT_IRT', 'market', 'buy', NULL, 100.00000000, 5869900.00000000, 0.00000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'pending', '2024-03-22 09:06:06', '2024-03-22 09:06:06'),
('66d804c7-6b9d-4561-b8f4-f47b50b63523', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'BTC', 'USDT', 'BTC_USDT', 'limit', 'sell', 65158.00000000, 4.00000000, 260632.00000000, 4.00000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'completed', '2024-04-09 01:23:29', '2024-04-09 01:23:29'),
('68cb39e4-bdd6-40f7-92de-8880bb6360b9', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'BTC', 'USDT', 'BTC_USDT', 'market', 'buy', 0.00033014, 100.00000000, 100.00000000, 0.00000000, 100.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'completed', '2023-09-17 04:58:41', '2023-09-17 04:58:41'),
('6bd08239-b188-46c4-a1d4-4c523770e39b', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', 'USDT', 'IRT', 'USDT_IRT', 'limit', 'buy', 503600.00000000, 20.00000000, 20.00000000, 0.00000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'completed', '2023-09-05 08:48:00', '2023-09-05 08:48:00'),
('6c11ebd9-c3d6-41ad-a5d5-6f05543a86bf', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', 'USDT', 'IRT', 'USDT_IRT', 'limit', 'sell', 503600.00000000, 134.10000000, 134.10000000, 0.00000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'pending', '2023-09-05 08:44:00', '2023-09-05 08:44:00'),
('6c70e7fd-1604-4401-9bc7-deeaeb6f3237', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'DOGE', 'USDT', 'DOGE_USDT', 'market', 'buy', NULL, 10000000.00000000, 1825400.00000000, 0.00000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'pending', '2024-04-04 11:48:34', '2024-04-04 11:48:34'),
('7072cf1f-47f7-44cd-84a5-abe4b7d674d8', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'BTC', 'USDT', 'BTC_USDT', 'market', 'buy', NULL, 0.00200000, 85.89204000, 0.00200000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'completed', '2023-12-15 05:54:31', '2023-12-15 05:54:31'),
('70d6fb6f-309c-4468-9e63-0db1baeecb91', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'USDT', 'IRT', 'USDT_IRT', 'market', 'buy', 58699.00000000, 100.00000000, 5869900.00000000, 0.00000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'pending', '2024-03-22 09:07:01', '2024-03-22 09:07:01'),
('7728be97-bf8d-4dc8-bc54-f59ec49841fb', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', 'USDT', 'IRT', 'USDT_IRT', 'limit', 'sell', 503880.00000000, 3133.28000000, 3133.28000000, 0.00000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'completed', '2023-09-05 08:44:00', '2023-09-05 08:44:00'),
('77962bb1-93f5-4a59-b5f3-812654eb2685', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', 'USDT', 'IRT', 'USDT_IRT', 'limit', 'sell', 503880.00000000, 2776.24000000, 2776.24000000, 0.00000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'completed', '2023-09-05 08:45:00', '2023-09-05 08:45:00'),
('77f985eb-ff01-45c5-898d-e13b4cc752b8', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'BTC', 'USDT', 'BTC_USDT', 'limit', 'buy', 41060.00000000, 38156.41746931, 1566702501.28986860, 0.00000000, 38156.41746931, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'canceled', '2024-01-22 02:48:35', '2024-01-31 05:05:00'),
('781b6d0b-adf6-4d69-af5b-a9100500a3ef', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', 'USDT', 'IRT', 'USDT_IRT', 'limit', 'sell', 503520.00000000, 84.96000000, 84.96000000, 0.00000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'completed', '2023-09-05 08:52:00', '2023-09-05 08:52:00'),
('84c478b5-f7c4-49ef-afcd-db4fb476227d', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', 'USDT', 'IRT', 'USDT_IRT', 'limit', 'buy', 504000.00000000, 1670.00000000, 1670.00000000, 0.00000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'completed', '2023-09-05 08:41:00', '2023-09-05 08:41:00'),
('86ab3dac-4f4a-43b3-9bcd-83a4e9fff247', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', 'USDT', 'IRT', 'USDT_IRT', 'limit', 'sell', 503890.00000000, 99.68000000, 99.68000000, 0.00000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'completed', '2023-09-05 08:43:00', '2023-09-05 08:43:00'),
('8896b4eb-9096-484e-a257-4e9595f7e163', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'BTC', 'USDT', 'BTC_USDT', 'limit', 'buy', 41066.70000000, 84154.83591095, 3455961399.90421036, 0.00000000, 84154.83591095, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'canceled', '2024-01-22 02:48:19', '2024-01-31 05:05:00'),
('89ae1cf3-ef30-4a64-96af-31d23880b303', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', 'USDT', 'IRT', 'USDT_IRT', 'limit', 'buy', 58699.00000000, 247.29000000, 247.29000000, 0.00000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'pending', '2024-02-28 05:26:00', '2024-02-28 05:26:00'),
('8b05aa2e-218e-4b06-9c79-fe5c41056cb2', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'BTC', 'USDT', 'BTC_USDT', 'limit', 'sell', 70303.80000000, 1.00000000, 70303.80000000, 1.00000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'completed', '2024-04-09 10:44:51', '2024-04-09 10:44:51'),
('8c57b37e-a2da-4bdb-b978-d081b18bd393', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'DOGE', 'USDT', 'DOGE_USDT', 'market', 'buy', NULL, 1000.00000000, 182.35000000, 0.00000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'pending', '2024-04-04 11:48:27', '2024-04-04 11:48:27'),
('8e9182f3-5971-4b5a-807a-0854c8c42c18', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', 'USDT', 'IRT', 'USDT_IRT', 'limit', 'sell', 503900.00000000, 145.00000000, 145.00000000, 0.00000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'completed', '2023-09-05 08:53:00', '2023-09-05 08:53:00'),
('93e50d16-1d7b-41f6-a29b-c5cb6fa83ab0', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', 'USDT', 'IRT', 'USDT_IRT', 'limit', 'buy', 503520.00000000, 84.96000000, 84.96000000, 0.00000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'completed', '2023-09-05 08:52:00', '2023-09-05 08:52:00'),
('94c37c3b-d0e5-4e14-88af-6935dd129501', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'BTC', 'USDT', 'BTC_USDT', 'market', 'sell', 3029.00000000, 0.00005000, 0.00005000, 0.00000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'pending', '2023-09-17 19:05:41', '2023-09-17 19:05:41'),
('94e120de-4bea-4fee-892a-d8568cb72095', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', 'USDT', 'IRT', 'USDT_IRT', 'limit', 'buy', 503880.00000000, 573.86000000, 573.86000000, 0.00000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'pending', '2023-09-05 08:45:00', '2023-09-05 08:45:00'),
('976083a6-94de-4fe0-9a41-be2e34451315', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', 'USDT', 'IRT', 'USDT_IRT', 'limit', 'buy', 503890.00000000, 99.68000000, 99.68000000, 0.00000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'completed', '2023-09-05 08:43:00', '2023-09-05 08:43:00'),
('9a98273c-ace6-417b-bf1b-c2744fe9272c', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'BTC', 'USDT', 'BTC_USDT', 'market', 'sell', 3029.00000000, 0.00070000, 0.00070000, 0.00000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'pending', '2023-09-17 19:03:21', '2023-09-17 19:03:21'),
('a01c266d-c8c8-4a2b-9218-10f1008c1bf0', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', 'USDT', 'IRT', 'USDT_IRT', 'limit', 'sell', 503990.00000000, 9781.37000000, 9781.37000000, 0.00000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'completed', '2023-09-05 08:38:00', '2023-09-05 08:38:00'),
('a0585de5-64cd-4754-b982-e9905aac5b98', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'DOGE', 'USDT', 'DOGE_USDT', 'market', 'buy', NULL, 10000.00000000, 1823.30000000, 0.00000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'pending', '2024-04-04 11:48:21', '2024-04-04 11:48:21'),
('a29d2603-ee5c-444d-b59c-3fa78bd43cee', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'TRX', 'DOGE', 'TRX_DOGE', 'market', 'sell', 1.00000000, 20.00000000, 20.00000000, 20.00000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'completed', '2023-12-15 10:20:03', '2023-12-15 10:20:03'),
('b1b2d759-09ce-4aa8-b61b-061f3894fba2', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'BTC', 'USDT', 'BTC_USDT', 'market', 'sell', 3029.00000000, 0.00007000, 0.00007000, 0.00000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'pending', '2023-09-17 19:00:18', '2023-09-17 19:00:18'),
('b223b1c4-3d79-443b-bee5-b5fbe0d11233', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'BTC', 'USDT', 'BTC_USDT', 'market', 'sell', 3029.00000000, 1.00000000, 1.00000000, 0.00000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'pending', '2023-10-03 20:51:40', '2023-10-03 20:51:40'),
('b2a799b1-5151-4806-be4f-f01b761a46fb', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', 'USDT', 'IRT', 'USDT_IRT', 'limit', 'buy', 503890.00000000, 95.72000000, 95.72000000, 95.72000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'completed', '2023-09-05 08:51:00', '2023-09-05 08:51:00'),
('b2c7ccd8-3074-4579-96fa-b30204f6254c', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', 'USDT', 'IRT', 'USDT_IRT', 'limit', 'sell', 503890.00000000, 99.68000000, 99.68000000, 99.68000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'completed', '2023-09-05 08:43:00', '2023-09-05 08:43:00'),
('b5c42e49-cc15-4e2d-810c-b9bbe6d770c4', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'BTC', 'USDT', 'BTC_USDT', 'limit', 'sell', 43000.17000000, 0.00300000, 129.00051000, 0.00300000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'completed', '2024-01-31 05:05:46', '2024-01-31 05:05:46'),
('b82ebbec-c66f-41d7-b386-2509fa46b4bd', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', 'USDT', 'IRT', 'USDT_IRT', 'limit', 'buy', 503530.00000000, 393.60000000, 393.60000000, 0.00000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'pending', '2023-09-05 08:43:00', '2023-09-05 08:43:00'),
('b8d2061f-a272-418c-a00b-c70da3eea188', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'BTC', 'USDT', 'BTC_USDT', 'market', 'buy', NULL, 1.00000000, 68887.60000000, 0.00000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'pending', '2024-04-04 16:10:06', '2024-04-04 16:10:06'),
('bb61080a-d8b1-4687-98e4-b7dda23dfa67', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'BTC', 'USDT', 'BTC_USDT', 'limit', 'buy', 43897.98000000, 455596.75311425, 19999777156.27428421, 0.00000000, 455596.75311425, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'canceled', '2023-12-09 05:50:40', '2024-01-31 05:05:00'),
('bb7a1c9f-881f-4304-bd95-da913c3b3c14', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', 'USDT', 'IRT', 'USDT_IRT', 'limit', 'buy', 503900.00000000, 145.00000000, 145.00000000, 0.00000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'completed', '2023-09-05 08:53:00', '2023-09-05 08:53:00'),
('c11c141f-9d6b-48ea-bed4-efb2c8df99cf', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', 'USDT', 'IRT', 'USDT_IRT', 'limit', 'buy', 50892.00000000, 74.82000000, 74.82000000, 0.00000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'pending', '2023-11-30 06:25:00', '2023-11-30 06:25:00'),
('c32a1678-f14f-4f9b-8784-1eb0533b0795', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', 'USDT', 'IRT', 'USDT_IRT', 'limit', 'sell', 64139.00000000, 20.10000000, 20.10000000, 0.00000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'pending', '2024-04-09 10:39:00', '2024-04-09 10:39:00'),
('c345ae07-32eb-4f2c-8c08-d4cfa57da96e', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'BTC', 'USDT', 'BTC_USDT', 'market', 'buy', NULL, 1.00000000, 52069.61000000, 1.00000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'completed', '2024-02-16 19:55:32', '2024-02-16 19:55:32'),
('c4450e66-27eb-4a62-9423-0951752da6a8', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'BTC', 'USDT', 'BTC_USDT', 'market', 'sell', 52152.14000000, 1.00000000, 52152.14000000, 1.00000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'completed', '2024-02-19 05:17:54', '2024-02-19 05:17:54'),
('ce4b5347-99c7-44b7-b91e-82bdeb4b7a50', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'BTC', 'USDT', 'BTC_USDT', 'market', 'sell', 3029.00000000, 0.00060000, 0.00060000, 0.00000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'pending', '2023-09-17 18:58:36', '2023-09-17 18:58:36'),
('cea831cc-aa4e-4a96-9a96-857d64554dbe', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'BTC', 'USDT', 'BTC_USDT', 'market', 'sell', 3029.00000000, 0.00007000, 0.00007000, 0.00000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'pending', '2023-09-17 19:00:29', '2023-09-17 19:00:29'),
('d0a98ee5-f59c-43a2-b498-5c74dae8b9b7', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', 'USDT', 'IRT', 'USDT_IRT', 'limit', 'sell', 503600.00000000, 20.00000000, 20.00000000, 0.00000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'completed', '2023-09-05 08:48:00', '2023-09-05 08:48:00'),
('d30a2ca0-a3bc-4819-bf94-5f18bd780c79', 'e7862d9c-fba8-4509-b59b-a4cb4f71ba04', 'BTC', 'USDT', 'BTC_USDT', 'market', 'sell', 3029.00000000, 158000.00000000, 158000.00000000, 0.00000000, 158000.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'completed', '2023-09-07 13:15:07', '2023-09-07 13:15:07'),
('d3e5c548-ecfa-4425-b74d-089340bccb36', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', 'USDT', 'IRT', 'USDT_IRT', 'limit', 'buy', 503530.00000000, 367.23000000, 367.23000000, 0.00000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'completed', '2023-09-05 08:45:00', '2023-09-05 08:45:00'),
('daf2f6c8-01aa-4106-83a7-ad4d1a9091e1', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'BTC', 'USDT', 'BTC_USDT', 'limit', 'buy', 65158.00000000, 4.00000000, 260632.00000000, 0.00000000, 4.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'canceled', '2024-03-21 15:36:54', '2024-04-09 01:44:56'),
('db28c884-e5e1-405e-b87e-b7e08048806d', '44d4809d-28e1-4685-b15c-dc11134fdf1d', 'TRX', 'DOGE', 'TRX_DOGE', 'market', 'sell', 1.00000000, 1000.00000000, 1000.00000000, 1000.00000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'completed', '2023-12-16 11:35:09', '2023-12-16 11:35:09'),
('e127d573-6cc1-47b8-88a5-3e3b569e7c27', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', 'USDT', 'IRT', 'USDT_IRT', 'limit', 'sell', 503880.00000000, 3097.39000000, 3097.39000000, 0.00000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'pending', '2023-09-05 08:44:00', '2023-09-05 08:44:00'),
('e1bacfa4-83db-4e87-ad79-7894f069dd59', '44d4809d-28e1-4685-b15c-dc11134fdf1d', 'TRX', 'DOGE', 'TRX_DOGE', 'market', 'sell', 1.00000000, 100.00000000, 100.00000000, 100.00000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'completed', '2023-12-16 11:37:20', '2023-12-16 11:37:20'),
('e30f5622-3ac6-4f1c-9bc6-9c9326bdbb83', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', 'USDT', 'IRT', 'USDT_IRT', 'limit', 'sell', 503890.00000000, 95.72000000, 95.72000000, 0.00000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'pending', '2023-09-05 08:51:00', '2023-09-05 08:51:00'),
('e79a5a4b-0294-4e3c-bbfb-52186e0675b8', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'BTC', 'USDT', 'BTC_USDT', 'market', 'sell', 3029.00000000, 0.00070000, 0.00070000, 0.00000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'pending', '2023-09-17 19:38:14', '2023-09-17 19:38:14'),
('e8cd173c-d92d-4a1e-bf1c-44a30cdf73b0', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'DOGE', 'USDT', 'DOGE_USDT', 'market', 'buy', NULL, 100000.00000000, 18239.00000000, 0.00000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'pending', '2024-04-04 11:48:14', '2024-04-04 11:48:14'),
('ea52d351-ac9e-4053-8fc0-7454b1ec7907', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'DOGE', 'USDT', 'DOGE_USDT', 'market', 'buy', NULL, 100000.00000000, 18239.00000000, 0.00000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'pending', '2024-04-04 11:48:18', '2024-04-04 11:48:18'),
('eda335c3-fc43-4125-9900-f7e39b4c4ebf', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'BTC', 'USDT', 'BTC_USDT', 'market', 'sell', 3029.00000000, 0.00007000, 0.00007000, 0.00000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'pending', '2023-09-17 19:07:19', '2023-09-17 19:07:19'),
('ee1b742c-ba74-4c46-8c19-ab684dc8c134', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'DOGE', 'USDT', 'DOGE_USDT', 'market', 'buy', NULL, 1000.00000000, 182.35000000, 0.00000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'pending', '2024-04-04 11:48:23', '2024-04-04 11:48:23'),
('efa689ad-5dc8-476d-a397-7b4ab78a2373', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', 'USDT', 'IRT', 'USDT_IRT', 'limit', 'buy', 503880.00000000, 3097.39000000, 3097.39000000, 68.06000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'pending', '2023-09-05 08:44:00', '2023-09-05 08:44:00'),
('f170f96f-b104-4a4d-a404-b22846daf4d4', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'BTC', 'USDT', 'BTC_USDT', 'limit', 'buy', 41070.11000000, 140246.41439984, 5759935666.50701278, 0.00000000, 140246.41439984, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'canceled', '2024-01-22 02:48:11', '2024-01-31 05:05:00'),
('f687fdf7-c21b-48f3-a839-717df3176ee4', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', 'USDT', 'IRT', 'USDT_IRT', 'limit', 'sell', 503530.00000000, 367.23000000, 367.23000000, 0.00000000, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'completed', '2023-09-05 08:45:00', '2023-09-05 08:45:00'),
('fd8de1a4-2b7f-47d3-8199-a1316de50a3c', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'BTC', 'USDT', 'BTC_USDT', 'market', 'buy', NULL, 34342.18085788, 1410032251.16091132, 34342.18085788, 0.00000000, NULL, 0.50, 0.20, NULL, NULL, NULL, NULL, 'completed', '2024-01-22 02:48:47', '2024-01-22 02:48:47');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` longtext DEFAULT NULL,
  `published_at` timestamp NULL DEFAULT NULL,
  `settings` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `is_home_page` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `slug`, `title`, `body`, `published_at`, `settings`, `meta_title`, `meta_description`, `meta_keywords`, `is_home_page`, `created_at`, `updated_at`) VALUES
(1, 'terms-and-conditions', 'Terms And Conditions', '<section class=\"cmb_section\" data-cmb-wrapper=\"cmb_section\" data-cmb-id=\"5\" data-cmb-element-type=\"static-layout\"><div class=\"section-overlay\"><div class=\"cmb_container container\" data-cmb-wrapper=\"cmb_container\" data-cmb-id=\"1\"><div class=\"cmb_row row\" data-cmb-wrapper=\"cmb_row\" data-cmb-id=\"2\"><div class=\"cmb_column col-sm-12\" data-cmb-wrapper=\"cmb_column\" data-cmb-id=\"3\"><div class=\"cmb_editable_text\" data-cmb-wrapper=\"cmb_editable_text\" data-cmb-id=\"4\"><div class=\"cmb-editable-text\"><div class=\"cmb-editable-text-container\" data-cmb-lang-id=\"1\"></div></div></div></div></div></div></div></section>', '2020-11-03 07:09:21', '{\"top_nav\": \"0\", \"side_nav\": \"0\", \"side_nav_fixed\": \"0\", \"hide_breadcrumb\": \"0\", \"navigation_type\": \"0\", \"top_nav_transparent\": \"0\", \"logo_inversed_top_nav\": \"0\", \"logo_inversed_side_nav\": \"0\"}', NULL, NULL, NULL, 0, '2022-06-28 20:00:59', '2023-05-16 01:00:29'),
(2, 'home', 'Home', '<section class=\"cmb_section\" data-cmb-wrapper=\"cmb_section\" data-cmb-id=\"42\" data-cmb-element-type=\"static-layout\"><div class=\"section-overlay\"><div class=\"cmb_container container\" data-cmb-wrapper=\"cmb_container\" data-cmb-element-type=\"static-layout\" data-cmb-id=\"58\"><div class=\"cmb_row row\" data-cmb-wrapper=\"cmb_row\" data-cmb-element-type=\"static-layout\" data-cmb-id=\"59\"><div class=\"cmb_column col-sm-12\" data-cmb-wrapper=\"cmb_column\" data-cmb-element-type=\"static-layout\" data-cmb-id=\"60\"><div class=\"cmb_row row mb-5\" data-cmb-wrapper=\"cmb_row\" data-cmb-element-type=\"static-layout\" data-cmb-id=\"30\"><div class=\"cmb_column col-sm-12\" data-cmb-wrapper=\"cmb_column\" data-cmb-id=\"32\" data-cmb-element-type=\"static-layout\"><div class=\"cmb-margin-bottom cmb-default-title-wrapper cmb_default_title cmb-element cmb-title-center mb-0\" data-cmb-wrapper=\"cmb_default_title\" data-cmb-id=\"31\" data-cmb-element-type=\"static-layout\"><h2 class=\"cmb-title\"><span class=\"cmb-title-part-1 cmb-single-line-editable-text\" data-cmb-lang-id=\"3\"></span> <span class=\"cmb-title-part-2 cmb-single-line-editable-text\" data-cmb-lang-id=\"4\"></span></h2></div></div><div class=\"cmb_column col-sm-8 offset-2\" data-cmb-wrapper=\"cmb_column\" data-cmb-id=\"34\" data-cmb-element-type=\"static-layout\"><div class=\"cmb_editable_text\" data-cmb-wrapper=\"cmb_editable_text\" data-cmb-element-type=\"static-layout\" data-cmb-id=\"35\"><div class=\"cmb-editable-text\"><div class=\"cmb-editable-text-container\" data-cmb-lang-id=\"49\"></div></div></div></div></div></div><div class=\"cmb_column col-sm-7 pt-5\" data-cmb-wrapper=\"cmb_column\" data-cmb-id=\"1\" data-cmb-element-type=\"static-layout\"> <div class=\"cmb_row row\" data-cmb-wrapper=\"cmb_row\" data-cmb-id=\"2\" data-cmb-element-type=\"static-layout\"> <div class=\"cmb_column col-sm-6\" data-cmb-wrapper=\"cmb_column\" data-cmb-element-type=\"static-layout\" data-cmb-id=\"5\" data-cmb-classes=\"\"> <div class=\"portfolio_list cmb_port-icon py-3\" data-cmb-wrapper=\"cmb_port-icon\" data-cmb-id=\"11\" data-cmb-element-type=\"static-layout\"> <div class=\"media\"> <div class=\"port-icon\"> <i class=\"fa custom-icon fa-bar-chart\"></i> </div> <div class=\"media-body\"> <h4 class=\"mt-0 cmb-icon-box-title\"><span class=\"cmb-single-line-editable-text\" data-cmb-lang-id=\"1657438524668\"></span></h4> <p class=\"cmb-port-icon-content\"><span class=\"cmb-single-line-editable-text\" data-cmb-lang-id=\"1657438524701\"></span></p> <p><a href=\"#\" class=\"btn btn-sm cmb-port-icon-btn d-none\"><span class=\"cmb-single-line-editable-text\" data-cmb-lang-id=\"1657438524734\"></span></a></p> </div> </div> </div><div class=\"portfolio_list cmb_port-icon py-3\" data-cmb-wrapper=\"cmb_port-icon\" data-cmb-id=\"9\" data-cmb-element-type=\"static-layout\"> <div class=\"media\"> <div class=\"port-icon\"> <i class=\"fa custom-icon fa-lock\"></i> </div> <div class=\"media-body\"> <h4 class=\"mt-0 cmb-icon-box-title\"><span class=\"cmb-single-line-editable-text\" data-cmb-lang-id=\"1657438570341\"></span></h4> <p class=\"cmb-port-icon-content\"><span class=\"cmb-single-line-editable-text\" data-cmb-lang-id=\"1657438570258\"></span></p> <p><a href=\"#\" class=\"btn btn-sm cmb-port-icon-btn d-none\"><span class=\"cmb-single-line-editable-text\" data-cmb-lang-id=\"1657438570260\"></span></a></p> </div> </div> </div></div> <div class=\"cmb_column col-sm-6\" data-cmb-wrapper=\"cmb_column\" data-cmb-element-type=\"static-layout\" data-cmb-id=\"7\"> <div class=\"portfolio_list cmb_port-icon py-3\" data-cmb-wrapper=\"cmb_port-icon\" data-cmb-id=\"6\" data-cmb-element-type=\"static-layout\"> <div class=\"media\"> <div class=\"port-icon\"> <i class=\"fa custom-icon fa-check-square\"></i> </div> <div class=\"media-body\"> <h4 class=\"mt-0 cmb-icon-box-title\"><span class=\"cmb-single-line-editable-text\" data-cmb-lang-id=\"1657438686357\"></span></h4> <p class=\"cmb-port-icon-content\"><span class=\"cmb-single-line-editable-text\" data-cmb-lang-id=\"1657438686355\"></span></p> <p><a href=\"#\" class=\"btn btn-sm cmb-port-icon-btn d-none\"><span class=\"cmb-single-line-editable-text\" data-cmb-lang-id=\"1657438686342\"></span></a></p> </div> </div> </div><div class=\"portfolio_list cmb_port-icon py-3\" data-cmb-wrapper=\"cmb_port-icon\" data-cmb-id=\"8\" data-cmb-element-type=\"static-layout\"> <div class=\"media\"> <div class=\"port-icon\"> <i class=\"fa custom-icon fa-tablet\"></i> </div> <div class=\"media-body\"> <h4 class=\"mt-0 cmb-icon-box-title\"><span class=\"cmb-single-line-editable-text\" data-cmb-lang-id=\"1657438743244\"></span></h4> <p class=\"cmb-port-icon-content\"><span class=\"cmb-single-line-editable-text\" data-cmb-lang-id=\"1657438743274\"></span></p> <p><a href=\"#\" class=\"btn btn-sm cmb-port-icon-btn d-none\"><span class=\"cmb-single-line-editable-text\" data-cmb-lang-id=\"1657438743293\"></span></a></p> </div> </div> </div></div> </div></div><div class=\"cmb_column col-sm-5\" data-cmb-wrapper=\"cmb_column\" data-cmb-id=\"3\" data-cmb-element-type=\"static-layout\"> <a class=\"cmb_img portfolio_img\" href=\"#\" data-cmb-wrapper=\"cmb_img\" data-cmb-id=\"4\" data-cmb-element-type=\"static-layout\" data-cmb-classes=\"portfolio_img\"><img class=\"img-fluid\" src=\"/storage/images/regular_site/portfoilo.jpg\" alt=\"\"></a></div></div></div></div></section> <div class=\"section-overlay\"></div> <section class=\"cmb_section\" data-cmb-wrapper=\"cmb_section\" data-cmb-id=\"12\" data-cmb-element-type=\"static-layout\"> <div class=\"section-overlay\"><div class=\"cmb_container container\" data-cmb-wrapper=\"cmb_container\" data-cmb-id=\"10\" data-cmb-element-type=\"static-layout\"><div class=\"cmb_row row mb-5\" data-cmb-wrapper=\"cmb_row\" data-cmb-id=\"13\" data-cmb-element-type=\"static-layout\"><div class=\"cmb_column col-sm-12\" data-cmb-wrapper=\"cmb_column\" data-cmb-id=\"14\" data-cmb-element-type=\"static-layout\"> <div class=\"cmb-margin-bottom cmb-default-title-wrapper cmb_default_title cmb-element cmb-title-center mb-0\" data-cmb-wrapper=\"cmb_default_title\" data-cmb-id=\"15\" data-cmb-element-type=\"static-layout\"> <h2 class=\"cmb-title\"><span class=\"cmb-title-part-1 cmb-single-line-editable-text\" data-cmb-lang-id=\"1657439643708\"></span> <span class=\"cmb-title-part-2 cmb-single-line-editable-text\" data-cmb-lang-id=\"1657439643685\"></span></h2> </div><div class=\"cmb_editable_text\" data-cmb-wrapper=\"cmb_editable_text\" data-cmb-id=\"16\" data-cmb-element-type=\"static-layout\"><div class=\"cmb-editable-text\"><div class=\"cmb-editable-text-container\" data-cmb-lang-id=\"1657439707928\"></div></div></div></div></div><div class=\"cmb_row row\" data-cmb-wrapper=\"cmb_row\" data-cmb-id=\"17\" data-cmb-element-type=\"static-layout\"><div class=\"cmb_column col-sm-12\" data-cmb-wrapper=\"cmb_column\" data-cmb-id=\"18\" data-cmb-element-type=\"static-layout\"> <div class=\"cmb_row row\" data-cmb-wrapper=\"cmb_row\" data-cmb-id=\"19\" data-cmb-element-type=\"static-layout\"> <div class=\"cmb_column col-md-4\" data-cmb-wrapper=\"cmb_column\" data-cmb-element-type=\"static-layout\" data-cmb-id=\"20\"> <div class=\"card trade-app-content cmb_card_box py-3\" data-cmb-wrapper=\"cmb_card_box\" data-cmb-id=\"21\" data-cmb-element-type=\"static-layout\"> <div class=\"card-body\"> <span class=\"card-icon-box\"> <i class=\"fa custom-icon fa-tablet\"></i> </span> <h4 class=\"mt-0 card-title cmb-card-box-title\"><span class=\"cmb-single-line-editable-text\" data-cmb-lang-id=\"1657442425444\"></span></h4> <p><span class=\"cmb-single-line-editable-text\" data-cmb-lang-id=\"1657442425476\"></span></p> <a href=\"#\" class=\"btn btn-sm cmb-port-icon-btn\"><span class=\"cmb-single-line-editable-text\" data-cmb-lang-id=\"1657442425397\"></span></a> </div> </div></div> <div class=\"cmb_column col-md-4\" data-cmb-wrapper=\"cmb_column\" data-cmb-element-type=\"static-layout\" data-cmb-id=\"22\"> <div class=\"card trade-app-content cmb_card_box py-3\" data-cmb-wrapper=\"cmb_card_box\" data-cmb-id=\"23\" data-cmb-element-type=\"static-layout\"> <div class=\"card-body\"> <span class=\"card-icon-box\"> <i class=\"fa custom-icon fa-desktop\"></i> </span> <h4 class=\"mt-0 card-title cmb-card-box-title\"><span class=\"cmb-single-line-editable-text\" data-cmb-lang-id=\"1657442448873\"></span></h4> <p><span class=\"cmb-single-line-editable-text\" data-cmb-lang-id=\"1657442448850\"></span></p> <a href=\"#\" class=\"btn btn-sm cmb-port-icon-btn\"><span class=\"cmb-single-line-editable-text\" data-cmb-lang-id=\"1657442448861\"></span></a> </div> </div></div> <div class=\"cmb_column col-md-4\" data-cmb-wrapper=\"cmb_column\" data-cmb-element-type=\"static-layout\" data-cmb-id=\"24\"> <div class=\"card trade-app-content cmb_card_box py-3\" data-cmb-wrapper=\"cmb_card_box\" data-cmb-id=\"25\" data-cmb-element-type=\"static-layout\"> <div class=\"card-body\"> <span class=\"card-icon-box\"> <i class=\"fa custom-icon fa-mixcloud\"></i> </span> <h4 class=\"mt-0 card-title cmb-card-box-title\"><span class=\"cmb-single-line-editable-text\" data-cmb-lang-id=\"1657442476005\"></span></h4> <p><span class=\"cmb-single-line-editable-text\" data-cmb-lang-id=\"1657442476044\"></span></p> <a href=\"#\" class=\"btn btn-sm cmb-port-icon-btn\"><span class=\"cmb-single-line-editable-text\" data-cmb-lang-id=\"1657442476043\"></span></a> </div> </div></div> </div></div></div></div></div> </section> <section class=\"cmb_section\" data-cmb-wrapper=\"cmb_section\" data-cmb-id=\"26\" data-cmb-element-type=\"static-layout\"> <div class=\"section-overlay\"><div class=\"cmb_container container\" data-cmb-wrapper=\"cmb_container\" data-cmb-id=\"27\" data-cmb-element-type=\"static-layout\"><div class=\"cmb_row row\" data-cmb-wrapper=\"cmb_row\" data-cmb-id=\"28\" data-cmb-element-type=\"static-layout\"><div class=\"cmb_column col-sm-12\" data-cmb-wrapper=\"cmb_column\" data-cmb-id=\"29\" data-cmb-element-type=\"static-layout\"> <div class=\"cmb-margin-bottom cmb-default-title-wrapper cmb_default_title cmb-element cmb-title-center mb-0\" data-cmb-wrapper=\"cmb_default_title\" data-cmb-id=\"33\" data-cmb-element-type=\"static-layout\"> <h2 class=\"cmb-title\"><span class=\"cmb-title-part-1 cmb-single-line-editable-text\" data-cmb-lang-id=\"1657444367631\"></span> <span class=\"cmb-title-part-2 cmb-single-line-editable-text\" data-cmb-lang-id=\"1657444367666\"></span></h2> </div><div class=\"cmb_editable_text\" data-cmb-wrapper=\"cmb_editable_text\" data-cmb-id=\"36\" data-cmb-element-type=\"static-layout\"><div class=\"cmb-editable-text\"><div class=\"cmb-editable-text-container\" data-cmb-lang-id=\"1657444469778\"></div></div></div><div class=\"cmb_row row\" data-cmb-wrapper=\"cmb_row\" data-cmb-id=\"37\" data-cmb-element-type=\"static-layout\"><div class=\"cmb_column col-sm-12\" data-cmb-wrapper=\"cmb_column\" data-cmb-id=\"38\" data-cmb-element-type=\"static-layout\"> <div class=\"cmb_row row\" data-cmb-wrapper=\"cmb_row\" data-cmb-id=\"39\" data-cmb-element-type=\"static-layout\"> <div class=\"cmb_column col-md-4\" data-cmb-wrapper=\"cmb_column\" data-cmb-element-type=\"static-layout\" data-cmb-id=\"40\"> <div class=\"promo cmb_promo_box py-3\" data-cmb-wrapper=\"cmb_promo_box\" data-cmb-id=\"41\" data-cmb-element-type=\"static-layout\"> <div class=\"promo-content\"> <div class=\"promo-content-img\"> <img class=\"img-fluid custom-svg\" src=\"/storage/images/cart-icons/protect.svg\" alt=\"\"> </div> <h3><span class=\"cmb-single-line-editable-text\" data-cmb-lang-id=\"1657444576507\"></span></h3> <p><span class=\"cmb-single-line-editable-text\" data-cmb-lang-id=\"1657444576472\"></span></p> </div> </div></div> <div class=\"cmb_column col-md-4\" data-cmb-wrapper=\"cmb_column\" data-cmb-element-type=\"static-layout\" data-cmb-id=\"43\"> <div class=\"promo cmb_promo_box py-3\" data-cmb-wrapper=\"cmb_promo_box\" data-cmb-id=\"44\" data-cmb-element-type=\"static-layout\"> <div class=\"promo-content\"> <div class=\"promo-content-img\"> <img class=\"img-fluid custom-svg\" src=\"/storage/images/cart-icons/cyber.svg\" alt=\"\"> </div> <h3><span class=\"cmb-single-line-editable-text\" data-cmb-lang-id=\"1657444595893\"></span></h3> <p><span class=\"cmb-single-line-editable-text\" data-cmb-lang-id=\"1657444595877\"></span></p> </div> </div></div> <div class=\"cmb_column col-md-4\" data-cmb-wrapper=\"cmb_column\" data-cmb-element-type=\"static-layout\" data-cmb-id=\"45\"> <div class=\"promo cmb_promo_box py-3\" data-cmb-wrapper=\"cmb_promo_box\" data-cmb-id=\"46\" data-cmb-element-type=\"static-layout\"> <div class=\"promo-content\"> <div class=\"promo-content-img\"> <img class=\"img-fluid custom-svg\" src=\"/storage/images/cart-icons/finance.svg\" alt=\"\"> </div> <h3><span class=\"cmb-single-line-editable-text\" data-cmb-lang-id=\"1657444602054\"></span></h3> <p><span class=\"cmb-single-line-editable-text\" data-cmb-lang-id=\"1657444602063\"></span></p> </div> </div></div> </div></div></div></div></div></div></div> </section>', '2020-11-03 07:09:21', '{\"navigation_type\":\"0\",\"top_nav\":\"0\",\"logo_inversed_top_nav\":\"0\",\"top_nav_transparent\":\"0\",\"hide_breadcrumb\":\"1\",\"side_nav\":\"0\",\"logo_inversed_side_nav\":\"0\",\"side_nav_fixed\":\"0\"}', NULL, NULL, NULL, 1, '2022-06-28 20:00:59', '2023-07-15 03:04:52'),
(3, 'privacy-policy', 'Privacy Policy', '<section class=\"cmb_section\" data-cmb-wrapper=\"cmb_section\" data-cmb-id=\"5\" data-cmb-element-type=\"static-layout\"><div class=\"section-overlay\"><div class=\"cmb_container container\" data-cmb-wrapper=\"cmb_container\" data-cmb-id=\"1\"><div class=\"cmb_row row\" data-cmb-wrapper=\"cmb_row\" data-cmb-id=\"2\"><div class=\"cmb_column col-sm-12\" data-cmb-wrapper=\"cmb_column\" data-cmb-id=\"3\"><div class=\"cmb_editable_text\" data-cmb-wrapper=\"cmb_editable_text\" data-cmb-id=\"4\"><div class=\"cmb-editable-text\"><div class=\"cmb-editable-text-container\" data-cmb-lang-id=\"1\"></div></div></div></div></div></div></div></section>', '2020-11-03 07:09:21', '{\"top_nav\": \"0\", \"side_nav\": \"0\", \"side_nav_fixed\": \"0\", \"hide_breadcrumb\": \"1\", \"navigation_type\": \"2\", \"top_nav_transparent\": \"0\", \"logo_inversed_top_nav\": \"0\", \"logo_inversed_side_nav\": \"0\"}', NULL, NULL, NULL, 0, '2022-06-28 20:00:59', '2023-05-16 01:00:29'),
(4, 'referral-programs', 'Referral Programs', '<section class=\"cmb_section\" data-cmb-wrapper=\"cmb_section\" data-cmb-id=\"16\" data-cmb-element-type=\"static-layout\"><div class=\"section-overlay\"><div class=\"cmb_container container\" data-cmb-wrapper=\"cmb_container\" data-cmb-id=\"1\"><div class=\"cmb_row row\" data-cmb-wrapper=\"cmb_row\" data-cmb-id=\"3\"><div class=\"cmb_column col-sm-12\" data-cmb-wrapper=\"cmb_column\" data-cmb-id=\"5\"><div class=\"cmb_editable_text\" data-cmb-wrapper=\"cmb_editable_text\" data-cmb-id=\"11\"><div class=\"cmb-editable-text\"><div class=\"cmb-editable-text-container\" data-cmb-lang-id=\"16\"></div></div></div></div></div></div><div class=\"cmb_container container\" data-cmb-wrapper=\"cmb_container\" data-cmb-id=\"2\"><div class=\"cmb_row row\" data-cmb-wrapper=\"cmb_row\" data-cmb-id=\"4\"><div class=\"cmb_column col-lg-4 col-md-6\" data-cmb-wrapper=\"cmb_column\" data-cmb-id=\"6\"><div class=\"cmb_content_box cmb-element\" data-cmb-wrapper=\"cmb_content_box\" data-cmb-id=\"12\"><div class=\"cmb-main\"><div class=\"cmb-content-box-icon\"><i class=\"fa cmb-icon fa-gg\"></i></div><div class=\"cmb-content\"><h3 class=\"cmb-content-box-title\"><span class=\"cmb-single-line-editable-text\" data-cmb-lang-id=\"1\"></span></h3><div class=\"cmb-content-box-content\"><span class=\"cmb-single-line-editable-text\" data-cmb-lang-id=\"2\"></span></div></div></div><div class=\"cmb-content-box-link d-none\"><a href=\"\" class=\"btn btn-success cmb-content-box-btn d-none\"><span class=\"cmb-single-line-editable-text\" data-cmb-lang-id=\"3\"></span></a></div></div></div><div class=\"cmb_column col-md-6 col-lg-4\" data-cmb-wrapper=\"cmb_column\" data-cmb-id=\"7\"><div class=\"cmb_content_box cmb-element\" data-cmb-wrapper=\"cmb_content_box\" data-cmb-id=\"17\"><div class=\"cmb-main\"><div class=\"cmb-content-box-icon\"><i class=\"fa cmb-icon fa-gg\"></i></div><div class=\"cmb-content\"><h3 class=\"cmb-content-box-title\"><span class=\"cmb-single-line-editable-text\" data-cmb-lang-id=\"4\"></span></h3><div class=\"cmb-content-box-content\"><span class=\"cmb-single-line-editable-text\" data-cmb-lang-id=\"5\"></span></div></div></div><div class=\"cmb-content-box-link d-none\"><a href=\"\" class=\"btn btn-success cmb-content-box-btn d-none\"><span class=\"cmb-single-line-editable-text\" data-cmb-lang-id=\"7\"></span></a></div></div></div><div class=\"cmb_column col-md-12 col-lg-4\" data-cmb-wrapper=\"cmb_column\" data-cmb-id=\"8\"><div class=\"cmb_content_box cmb-element\" data-cmb-wrapper=\"cmb_content_box\" data-cmb-id=\"18\"><div class=\"cmb-main\"><div class=\"cmb-content-box-icon\"><i class=\"fa cmb-icon fa-gg\"></i></div><div class=\"cmb-content\"><h3 class=\"cmb-content-box-title\"><span class=\"cmb-single-line-editable-text\" data-cmb-lang-id=\"8\"></span></h3><div class=\"cmb-content-box-content\"><span class=\"cmb-single-line-editable-text\" data-cmb-lang-id=\"9\"></span></div></div></div><div class=\"cmb-content-box-link d-none\"><a href=\"\" class=\"btn btn-success cmb-content-box-btn d-none\"><span class=\"cmb-single-line-editable-text\" data-cmb-lang-id=\"11\"></span></a></div></div></div><div class=\"cmb_column col-md-12\" data-cmb-wrapper=\"cmb_column\" data-cmb-id=\"9\"><div class=\"cmb_content_box cmb-element\" data-cmb-wrapper=\"cmb_content_box\" data-cmb-id=\"19\"><div class=\"cmb-main\"><div class=\"cmb-content-box-icon\"><i class=\"fa cmb-icon fa-gg\"></i></div><div class=\"cmb-content\"><h3 class=\"cmb-content-box-title\"><span class=\"cmb-single-line-editable-text\" data-cmb-lang-id=\"12\"></span></h3><div class=\"cmb-content-box-content\"><span class=\"cmb-single-line-editable-text\" data-cmb-lang-id=\"13\"></span></div></div></div><div class=\"cmb-content-box-link d-none\"><a href=\"\" class=\"btn btn-success cmb-content-box-btn d-none\"><span class=\"cmb-single-line-editable-text\" data-cmb-lang-id=\"15\"></span></a></div></div></div><div class=\"cmb_column col-md-4\" data-cmb-wrapper=\"cmb_column\" data-cmb-id=\"10\"></div></div></div></div></section>', '2020-11-03 07:09:21', '{\"top_nav\": \"0\", \"side_nav\": \"0\", \"side_nav_fixed\": \"0\", \"hide_breadcrumb\": \"1\", \"navigation_type\": \"2\", \"top_nav_transparent\": \"0\", \"logo_inversed_top_nav\": \"0\", \"logo_inversed_side_nav\": \"0\"}', NULL, NULL, NULL, 0, '2022-06-28 20:00:59', '2023-05-16 01:00:29'),
(5, 'about-us', 'About Us', '<section class=\"cmb_section\" data-cmb-wrapper=\"cmb_section\" data-cmb-id=\"9\" data-cmb-element-type=\"static-layout\"><div class=\"section-overlay\"><div class=\"cmb_container container\" data-cmb-wrapper=\"cmb_container\" data-cmb-id=\"1\"><div class=\"cmb_row row\" data-cmb-wrapper=\"cmb_row\" data-cmb-id=\"2\"><div class=\"cmb_column col-sm-12\" data-cmb-wrapper=\"cmb_column\" data-cmb-id=\"3\"><div class=\"cmb_editable_text\" data-cmb-wrapper=\"cmb_editable_text\" data-cmb-id=\"6\"><div class=\"cmb-editable-text\"><div class=\"cmb-editable-text-container\" data-cmb-lang-id=\"1\"></div></div></div></div><div class=\"cmb_column col-sm-6\" data-cmb-wrapper=\"cmb_column\" data-cmb-id=\"4\"></div></div><div class=\"cmb_row row\" data-cmb-wrapper=\"cmb_row\" data-cmb-id=\"5\" data-cmb-element-type=\"static-layout\">\n                    <div class=\"cmb_column col-md-3 col-sm-5\" data-cmb-wrapper=\"cmb_column\" data-cmb-element-type=\"static-layout\" data-cmb-id=\"7\">\n                        <div class=\"cmb_editable_text\" data-cmb-wrapper=\"cmb_editable_text\" data-cmb-element-type=\"static-layout\" data-cmb-id=\"8\"><div class=\"cmb-editable-text\"><div class=\"cmb-editable-text-container\" data-cmb-lang-id=\"1690026173904\"></div></div></div>\n                    </div>\n                    <div class=\"cmb_column col-md-9 col-sm-7\" data-cmb-wrapper=\"cmb_column\" data-cmb-element-type=\"static-layout\" data-cmb-id=\"10\">\n                        <div class=\"cmb_editable_text\" data-cmb-wrapper=\"cmb_editable_text\" data-cmb-element-type=\"static-layout\" data-cmb-id=\"11\"><div class=\"cmb-editable-text\"><div class=\"cmb-editable-text-container\" data-cmb-lang-id=\"1690026173965\"></div></div></div>\n                    </div>\n                </div></div></div></section>', '2020-11-03 07:09:21', '{\"top_nav\": \"0\", \"side_nav\": \"0\", \"side_nav_fixed\": \"0\", \"hide_breadcrumb\": \"0\", \"navigation_type\": \"2\", \"top_nav_transparent\": \"0\", \"logo_inversed_top_nav\": \"0\", \"logo_inversed_side_nav\": \"0\"}', NULL, NULL, NULL, 0, '2022-06-28 20:00:59', '2023-07-22 08:19:48'),
(6, 'public-api', 'Public API', '<section class=\"cmb_section\" data-cmb-wrapper=\"cmb_section\" data-cmb-id=\"5\" data-cmb-element-type=\"static-layout\"><div class=\"section-overlay\"><div class=\"cmb_container container\" data-cmb-wrapper=\"cmb_container\" data-cmb-id=\"1\"><div class=\"cmb_row row\" data-cmb-wrapper=\"cmb_row\" data-cmb-id=\"2\"><div class=\"cmb_column col-sm-12\" data-cmb-wrapper=\"cmb_column\" data-cmb-id=\"3\"><div class=\"cmb_editable_text\" data-cmb-wrapper=\"cmb_editable_text\" data-cmb-id=\"4\"><div class=\"cmb-editable-text\"><div class=\"cmb-editable-text-container\" data-cmb-lang-id=\"1\"></div></div></div></div></div></div></div></section>', '2020-11-03 07:09:21', '{\"top_nav\": \"0\", \"side_nav\": \"0\", \"side_nav_fixed\": \"0\", \"hide_breadcrumb\": \"1\", \"navigation_type\": \"2\", \"top_nav_transparent\": \"0\", \"logo_inversed_top_nav\": \"0\", \"logo_inversed_side_nav\": \"0\"}', NULL, NULL, NULL, 0, '2022-06-28 20:00:59', '2023-05-16 01:00:29'),
(7, 'private-api', 'Private API', '<section class=\"cmb_section\" data-cmb-wrapper=\"cmb_section\" data-cmb-id=\"5\" data-cmb-element-type=\"static-layout\"><div class=\"section-overlay\"><div class=\"cmb_container container\" data-cmb-wrapper=\"cmb_container\" data-cmb-id=\"1\"><div class=\"cmb_row row\" data-cmb-wrapper=\"cmb_row\" data-cmb-id=\"2\"><div class=\"cmb_column col-sm-12\" data-cmb-wrapper=\"cmb_column\" data-cmb-id=\"3\"><div class=\"cmb_editable_text\" data-cmb-wrapper=\"cmb_editable_text\" data-cmb-id=\"4\"><div class=\"cmb-editable-text\"><div class=\"cmb-editable-text-container\" data-cmb-lang-id=\"1\"></div></div></div></div></div></div></div></section>', '2020-11-03 07:09:21', '{\"top_nav\": \"0\", \"side_nav\": \"0\", \"side_nav_fixed\": \"0\", \"hide_breadcrumb\": \"1\", \"navigation_type\": \"2\", \"top_nav_transparent\": \"0\", \"logo_inversed_top_nav\": \"0\", \"logo_inversed_side_nav\": \"0\"}', NULL, NULL, NULL, 0, '2022-06-28 20:00:59', '2023-05-16 01:00:29'),
(9, 'terms-for-registration', 'Terms for Registration', '<section class=\"cmb_section\" data-cmb-wrapper=\"cmb_section\" data-cmb-id=\"5\" data-cmb-element-type=\"static-layout\"><div class=\"section-overlay\"><div class=\"cmb_container container\" data-cmb-wrapper=\"cmb_container\" data-cmb-id=\"1\"><div class=\"cmb_row row\" data-cmb-wrapper=\"cmb_row\" data-cmb-id=\"2\"><div class=\"cmb_column col-sm-12 mb-5\" data-cmb-wrapper=\"cmb_column\" data-cmb-id=\"3\"><div class=\"cmb_editable_text\" data-cmb-wrapper=\"cmb_editable_text\" data-cmb-id=\"4\"><div class=\"cmb-editable-text\"><div class=\"cmb-editable-text-container\" data-cmb-lang-id=\"1\"></div></div></div></div></div></div></div></section>', '2022-07-29 23:27:51', '{\"top_nav\": \"0\", \"side_nav\": \"0\", \"side_nav_fixed\": \"0\", \"hide_breadcrumb\": \"0\", \"navigation_type\": \"2\", \"top_nav_transparent\": \"0\", \"logo_inversed_top_nav\": \"0\", \"logo_inversed_side_nav\": \"0\"}', NULL, NULL, NULL, 0, '2022-07-29 23:27:38', '2023-05-16 01:00:29'),
(10, 'terms-for-withdrawal-of-funds', 'Terms for Withdrawal of Funds', '<section class=\"cmb_section\" data-cmb-wrapper=\"cmb_section\" data-cmb-id=\"5\" data-cmb-element-type=\"static-layout\"><div class=\"section-overlay\"><div class=\"cmb_container container\" data-cmb-wrapper=\"cmb_container\" data-cmb-id=\"1\"><div class=\"cmb_row row\" data-cmb-wrapper=\"cmb_row\" data-cmb-id=\"2\"><div class=\"cmb_column col-sm-12\" data-cmb-wrapper=\"cmb_column\" data-cmb-id=\"3\"><div class=\"cmb_editable_text\" data-cmb-wrapper=\"cmb_editable_text\" data-cmb-id=\"4\"><div class=\"cmb-editable-text\"><div class=\"cmb-editable-text-container\" data-cmb-lang-id=\"1\"></div></div></div></div></div></div></div></section>', '2022-07-29 23:27:51', '{\"navigation_type\":\"2\",\"top_nav\":\"0\",\"logo_inversed_top_nav\":\"0\",\"top_nav_transparent\":\"0\",\"hide_breadcrumb\":\"0\",\"side_nav\":\"0\",\"logo_inversed_side_nav\":\"0\",\"side_nav_fixed\":\"0\"}', NULL, NULL, NULL, 0, '2022-08-04 07:14:17', '2023-05-16 01:00:29');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\Core\\User', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'Flutter', '1bba0860c6d1bc5b8bde2d860829e6b23541529af53743a6e60cf53d00aa735a', '[\"*\"]', '2023-09-09 19:16:19', '2023-02-27 13:23:49', '2023-09-09 19:16:19'),
(2, 'App\\Models\\Core\\User', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'PostmanRuntime/7.30.0', 'e5874a9540804c16da394b5d59e2121eb6bbc37559d7827a31fa4fffeeecb1a5', '[\"*\"]', NULL, '2023-03-02 13:39:51', '2023-03-02 13:39:51'),
(3, 'App\\Models\\Core\\User', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'PostmanRuntime/7.30.0', '3091165084c1aead550a85a633f1c0ea5df0c49f963be1b2d131ad9cc547dac8', '[\"*\"]', NULL, '2023-03-02 13:43:29', '2023-03-02 13:43:29'),
(4, 'App\\Models\\Core\\User', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'PostmanRuntime/7.29.2', '1ba7517f9aa8aa26fd7f308b330e3365f3fa4b162a44be9b8bc963c2533f0c32', '[\"*\"]', NULL, '2023-03-02 13:49:08', '2023-03-02 13:49:08'),
(5, 'App\\Models\\Core\\User', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'PostmanRuntime/7.29.2', '1fa6cf8328ef8fd482b599391726a7f6b1470754524521be51e14756274c6554', '[\"*\"]', NULL, '2023-03-02 13:49:29', '2023-03-02 13:49:29'),
(6, 'App\\Models\\Core\\User', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'PostmanRuntime/7.29.2', '10b34e0c4924194b95b4e5979766395fe09322badff100763bdeec5dc216111e', '[\"*\"]', NULL, '2023-03-02 13:49:34', '2023-03-02 13:49:34'),
(7, 'App\\Models\\Core\\User', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'PostmanRuntime/7.29.2', '958cbb7d55732076338288c9d678b95b601ca4ac016fe89631df197e38694479', '[\"*\"]', NULL, '2023-03-02 13:50:17', '2023-03-02 13:50:17'),
(8, 'App\\Models\\Core\\User', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'PostmanRuntime/7.29.2', '1f243aa8f86ada9265eab24e16ced80be3c6886fa4dab75607f2d25fd2dbf026', '[\"*\"]', NULL, '2023-03-02 14:08:56', '2023-03-02 14:08:56'),
(9, 'App\\Models\\Core\\User', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'PostmanRuntime/7.29.2', '77c5eaed175694e753b88c2d916c609addc159581dcf047f5910649bdd9c2d32', '[\"*\"]', NULL, '2023-03-02 14:10:03', '2023-03-02 14:10:03'),
(10, 'App\\Models\\Core\\User', '6eb3595c-031c-4f55-abee-80cf6d8c816b', 'PostmanRuntime/7.31.1', '266c78e62dec0d8684e15ed7ae5aa9b24bb3b3a5c5ff137e10e5c7200929367e', '[\"*\"]', NULL, '2023-03-02 14:56:34', '2023-03-02 14:56:34'),
(11, 'App\\Models\\Core\\User', 'a502eb20-d81c-4f3e-a56f-11444fe1e4cb', 'PostmanRuntime/7.31.1', 'a5f3b1525ccaae00625b690bed5a67d14c8b386b103f68baeb92147601778c43', '[\"*\"]', NULL, '2023-03-02 15:01:25', '2023-03-02 15:01:25'),
(12, 'App\\Models\\Core\\User', '22fe5dc1-07ab-4809-8f56-8590c68d9ab3', 'PostmanRuntime/7.31.1', 'e4010d478c70dac68280b92436f41b9b040087a1fb82330869626ed1f0d14ad6', '[\"*\"]', NULL, '2023-03-02 15:03:32', '2023-03-02 15:03:32'),
(13, 'App\\Models\\Core\\User', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'PostmanRuntime/7.31.1', '647236124ca0874c99dc2edd8a2d25e73ba0c8e7cd882f24887da01d14eedc38', '[\"*\"]', NULL, '2023-03-02 16:25:59', '2023-03-02 16:25:59'),
(14, 'App\\Models\\Core\\User', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'PostmanRuntime/7.31.1', 'c776fe31517b78b07e9e19dea73d51a7cd1d1a5412ae9b4adf383266fa1a5f4e', '[\"*\"]', NULL, '2023-03-02 16:26:25', '2023-03-02 16:26:25'),
(15, 'App\\Models\\Core\\User', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'PostmanRuntime/7.31.1', 'c57e15b90c38cead1ed4164fb631ee6ab253ff0b2ad565429877ba0536dae12a', '[\"*\"]', NULL, '2023-03-03 03:55:37', '2023-03-03 03:55:37'),
(16, 'App\\Models\\Core\\User', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'PostmanRuntime/7.31.1', '04fa5c231cadb4b858b9d864296b0c6e398313dfb2bae787444fc4de2fb07d23', '[\"*\"]', NULL, '2023-03-03 04:35:26', '2023-03-03 04:35:26'),
(17, 'App\\Models\\Core\\User', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'PostmanRuntime/7.31.1', '7bb2bbffde38b425795bf5f0891f6020304368110c361c98b14cfe548c6f0a63', '[\"*\"]', NULL, '2023-03-03 04:47:00', '2023-03-03 04:47:00'),
(18, 'App\\Models\\Core\\User', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'PostmanRuntime/7.31.1', '223a3d91ff6c1192accdc379918fe9e52028be6dd88588233bab4031b85c7686', '[\"*\"]', NULL, '2023-03-03 04:47:15', '2023-03-03 04:47:15'),
(19, 'App\\Models\\Core\\User', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'Dalvik/2.1.0 (Linux; U; Android 10; Android SDK built for x86 Build/QSR1.190920.001)', 'ecd665c0d9d64b4bea3cacd1319316f0d6690d89b09abb36f5fc141391fd5e4b', '[\"*\"]', NULL, '2023-03-03 04:52:15', '2023-03-03 04:52:15'),
(20, 'App\\Models\\Core\\User', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'Dalvik/2.1.0 (Linux; U; Android 10; Android SDK built for x86 Build/QSR1.190920.001)', '3b1a99ab53f5119df891bb5c340d4581cba0a4d9a8ce68bea7b672d908fcb1e9', '[\"*\"]', NULL, '2023-03-03 04:55:00', '2023-03-03 04:55:00'),
(21, 'App\\Models\\Core\\User', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'Dalvik/2.1.0 (Linux; U; Android 10; Android SDK built for x86 Build/QSR1.190920.001)', '813a2c30c04e1824f32ba5dd89ffa8abd10fe4c3f056e3067c4535aec3f49206', '[\"*\"]', NULL, '2023-03-03 04:59:54', '2023-03-03 04:59:54'),
(22, 'App\\Models\\Core\\User', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'Dalvik/2.1.0 (Linux; U; Android 10; Android SDK built for x86 Build/QSR1.190920.001)', 'b38235e02b7802ec522c4c25daff8ee0c1478672c6010ebdbe5c836a96e1905c', '[\"*\"]', NULL, '2023-03-03 05:05:48', '2023-03-03 05:05:48'),
(24, 'App\\Models\\Core\\User', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'Dalvik/2.1.0 (Linux; U; Android 10; Android SDK built for x86 Build/QSR1.190920.001)', 'eeb37600a6f1f21b6d6a99662a1d4b2b1360e8d0e8cb2087c20a8af618ce7692', '[\"*\"]', NULL, '2023-03-03 05:09:41', '2023-03-03 05:09:41'),
(25, 'App\\Models\\Core\\User', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'Dalvik/2.1.0 (Linux; U; Android 10; Android SDK built for x86 Build/QSR1.190920.001)', '363cbf7a584a2efd7ded1ecd60ec21b95d51e04f4b6cefde4cdcec64f9901cc4', '[\"*\"]', NULL, '2023-03-03 05:12:35', '2023-03-03 05:12:35'),
(26, 'App\\Models\\Core\\User', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'Dalvik/2.1.0 (Linux; U; Android 10; Android SDK built for x86 Build/QSR1.190920.001)', 'b011a7b2ab852ba5f35a54daabbfed2d97d305876755c41597c312b7af0bf54b', '[\"*\"]', NULL, '2023-03-03 05:36:29', '2023-03-03 05:36:29'),
(27, 'App\\Models\\Core\\User', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'Dalvik/2.1.0 (Linux; U; Android 10; Android SDK built for x86 Build/QSR1.190920.001)', '2fc0bf0070732b144f67072ee9dfb883cd4d27b3f80580ae84a68da3bb0846b7', '[\"*\"]', NULL, '2023-03-03 06:05:14', '2023-03-03 06:05:14'),
(28, 'App\\Models\\Core\\User', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'PostmanRuntime/7.31.1', '951b658f9d0e3dfdddb4f6fb66534abe209e20f0cd4688a4224c0ccbcbc1aabf', '[\"*\"]', NULL, '2023-03-30 18:34:41', '2023-03-30 18:34:41'),
(29, 'App\\Models\\Core\\User', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'PostmanRuntime/7.31.3', '9f8e0479d14e54a4738ac9247939c7a9cea141e4f728ceeab3ab7cc466f722d0', '[\"*\"]', NULL, '2023-04-03 17:18:19', '2023-04-03 17:18:19'),
(30, 'App\\Models\\Core\\User', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'Dalvik/2.1.0 (Linux; U; Android 10; Android SDK built for x86 Build/QSR1.190920.001)', '12682ac053194f14f13c0e258a6b8a48d093c39d4ccddf9b1d050c561cae533b', '[\"*\"]', NULL, '2023-04-03 17:18:59', '2023-04-03 17:18:59'),
(31, 'App\\Models\\Core\\User', '9fad722d-6b02-4504-b431-ed6f14b20847', 'Dalvik/2.1.0 (Linux; U; Android 10; Android SDK built for x86 Build/QSR1.190920.001)', 'fe37cba6efbce1d0b0c34d30f47d661e0e1c337a73f9a03c05ae74871089209b', '[\"*\"]', NULL, '2023-04-03 18:13:42', '2023-04-03 18:13:42'),
(32, 'App\\Models\\Core\\User', '04b781e1-0a41-4703-888f-468243ebda36', 'Dalvik/2.1.0 (Linux; U; Android 10; Android SDK built for x86 Build/QSR1.190920.001)', '95d47464489db8780a17d07d1876c3c83e0f0a70f67f5d3c67c2a08a0e417b38', '[\"*\"]', NULL, '2023-04-03 18:33:53', '2023-04-03 18:33:53'),
(33, 'App\\Models\\Core\\User', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'Dalvik/2.1.0 (Linux; U; Android 10; Android SDK built for x86 Build/QSR1.190920.001)', '91802aa4ce4bd632799cae2830156e49cea2174b08925d7a26eb4bd88e498850', '[\"*\"]', '2023-04-04 11:03:08', '2023-04-03 19:03:49', '2023-04-04 11:03:08'),
(34, 'App\\Models\\Core\\User', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'Dalvik/2.1.0 (Linux; U; Android 10; Android SDK built for x86 Build/QSR1.190920.001)', '9aaac089fdf37f5c4c8745bd9a7c4c9e2ec3657f7f5a117346443ec23f01dcc2', '[\"*\"]', NULL, '2023-04-04 11:05:06', '2023-04-04 11:05:06'),
(35, 'App\\Models\\Core\\User', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'Dalvik/2.1.0 (Linux; U; Android 10; Android SDK built for x86 Build/QSR1.190920.001)', '108a2e210475278d80794bd681f5b824fa55db23d5014d663403b524c03a4d6f', '[\"*\"]', NULL, '2023-04-04 11:10:17', '2023-04-04 11:10:17'),
(36, 'App\\Models\\Core\\User', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'PostmanRuntime/7.31.3', '9c076b714198ae1d8def08253fc3f9d67d660ec4cd531e64eea765dc8daf8148', '[\"*\"]', NULL, '2023-04-04 11:12:21', '2023-04-04 11:12:21'),
(37, 'App\\Models\\Core\\User', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'PostmanRuntime/7.31.3', '9745433bcc0af39eecf6b1e9edbbdf406ba9be9b9b98d78d2076d7bd2c187001', '[\"*\"]', NULL, '2023-04-04 11:15:19', '2023-04-04 11:15:19'),
(38, 'App\\Models\\Core\\User', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'PostmanRuntime/7.31.3', 'f2e43275ea814b83551a9e2662f9acfd9f4d79de1005f7c2c72b3f12177426d2', '[\"*\"]', NULL, '2023-04-04 11:15:34', '2023-04-04 11:15:34'),
(39, 'App\\Models\\Core\\User', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'Dalvik/2.1.0 (Linux; U; Android 10; Android SDK built for x86 Build/QSR1.190920.001)', 'd93519ccad6414374fa107b44193057248b90a978faffcc4281ee20092e07df1', '[\"*\"]', NULL, '2023-04-04 11:32:04', '2023-04-04 11:32:04'),
(40, 'App\\Models\\Core\\User', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'PostmanRuntime/7.31.3', '3f3df80c1d9834613fe3f40fb1dd6012216c8d598c4f09baa495a8ebdc61b31c', '[\"*\"]', NULL, '2023-04-04 13:01:01', '2023-04-04 13:01:01'),
(41, 'App\\Models\\Core\\User', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'Dalvik/2.1.0 (Linux; U; Android 10; Android SDK built for x86 Build/QSR1.190920.001)', 'b72e844060426bc2a316fcd77043de8872aa508adb92166cce4e747b01a52d3c', '[\"*\"]', NULL, '2023-04-04 13:01:41', '2023-04-04 13:01:41'),
(42, 'App\\Models\\Core\\User', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'Dalvik/2.1.0 (Linux; U; Android 10; Android SDK built for x86 Build/QSR1.190920.001)', 'ef955400ff26e16b5692b290e7241abbc860cdac071e4704e439fa3b66b9575e', '[\"*\"]', NULL, '2023-04-04 13:08:21', '2023-04-04 13:08:21'),
(43, 'App\\Models\\Core\\User', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'Dalvik/2.1.0 (Linux; U; Android 10; Android SDK built for x86 Build/QSR1.190920.001)', 'ca7353b414379764f27c1a7cf06bb9cb42a44f723932f1fdee36b14189692b34', '[\"*\"]', NULL, '2023-04-04 13:09:11', '2023-04-04 13:09:11'),
(44, 'App\\Models\\Core\\User', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'Dalvik/2.1.0 (Linux; U; Android 10; Android SDK built for x86 Build/QSR1.190920.001)', '06d50da1b6d3e551459ef312588486b0853e32ca161b5187f722b4b4110ca6dc', '[\"*\"]', NULL, '2023-04-04 13:10:13', '2023-04-04 13:10:13'),
(45, 'App\\Models\\Core\\User', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'Dalvik/2.1.0 (Linux; U; Android 10; Android SDK built for x86 Build/QSR1.190920.001)', '43109e086550cabe3e57336a520085a55f12907a5e165da5e626f1a1ad39f3f1', '[\"*\"]', NULL, '2023-04-04 13:11:51', '2023-04-04 13:11:51'),
(46, 'App\\Models\\Core\\User', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'Dalvik/2.1.0 (Linux; U; Android 10; Android SDK built for x86 Build/QSR1.190920.001)', '39b0ccc1b970807ad5d9179835b03c2e636d7db63b9a67de9e2fea6f3131a23f', '[\"*\"]', '2023-04-04 15:24:15', '2023-04-04 13:13:12', '2023-04-04 15:24:15'),
(47, 'App\\Models\\Core\\User', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'Dalvik/2.1.0 (Linux; U; Android 10; Android SDK built for x86 Build/QSR1.190920.001)', '6f89eea612eaf78652442dfa0c9e7f63ae9b47a27386a7826ffd494cf3ae1782', '[\"*\"]', '2023-04-04 15:26:50', '2023-04-04 15:26:36', '2023-04-04 15:26:50'),
(48, 'App\\Models\\Core\\User', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'Dalvik/2.1.0 (Linux; U; Android 10; Android SDK built for x86 Build/QSR1.190920.001)', '380fe113dd2d376210b81ab64d2a6c8f94c7882cc0bb9bf8c9f6f12c3d64e9b5', '[\"*\"]', NULL, '2023-04-04 15:28:46', '2023-04-04 15:28:46'),
(49, 'App\\Models\\Core\\User', '8bc2d325-279d-4cb5-8245-87e524f33587', 'PostmanRuntime/7.31.3', 'b65a13031e0e93ff8199ebe6379c5f623f88fef6e7068448e328533faedfe9c2', '[\"*\"]', NULL, '2023-04-04 15:34:21', '2023-04-04 15:34:21'),
(50, 'App\\Models\\Core\\User', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'PostmanRuntime/7.31.3', 'b7d95e6b91c8dea514531c28252a8e49c27953a88c651e7de04cae2a364d7d9f', '[\"*\"]', NULL, '2023-04-04 15:38:13', '2023-04-04 15:38:13'),
(51, 'App\\Models\\Core\\User', '8208d769-48db-4e2f-8831-f48ead232203', 'PostmanRuntime/7.31.3', '30bd04019ecb74208b48340084769dff3446f4798bf62c2bc101b0ff5e4d235c', '[\"*\"]', NULL, '2023-04-04 15:53:03', '2023-04-04 15:53:03'),
(52, 'App\\Models\\Core\\User', '8208d769-48db-4e2f-8831-f48ead232203', 'PostmanRuntime/7.31.3', 'e47a95e8360282e17e88ab6c4b0081d66fb06efb4a25012f1d24a4fc6dd0e7ec', '[\"*\"]', NULL, '2023-04-04 15:53:41', '2023-04-04 15:53:41'),
(53, 'App\\Models\\Core\\User', '8208d769-48db-4e2f-8831-f48ead232203', 'Dalvik/2.1.0 (Linux; U; Android 10; Android SDK built for x86 Build/QSR1.190920.001)', 'd0f461e55a679085c0eb1ebd2f1d77a2ee48f48e135b3771a9f8cd66605ee334', '[\"*\"]', NULL, '2023-04-04 15:55:22', '2023-04-04 15:55:22'),
(54, 'App\\Models\\Core\\User', '8208d769-48db-4e2f-8831-f48ead232203', 'Dalvik/2.1.0 (Linux; U; Android 10; Android SDK built for x86 Build/QSR1.190920.001)', 'ad6effdb65a6943c340a61d92b189cbba70e5db8e7daf54ec435176bb7923fb1', '[\"*\"]', NULL, '2023-04-04 15:57:19', '2023-04-04 15:57:19'),
(55, 'App\\Models\\Core\\User', '8208d769-48db-4e2f-8831-f48ead232203', 'Dalvik/2.1.0 (Linux; U; Android 10; Android SDK built for x86 Build/QSR1.190920.001)', 'b3769125868a510dc6970644aac274cc820d79da7a217c8ac58fe37d0018dee9', '[\"*\"]', NULL, '2023-04-04 15:57:39', '2023-04-04 15:57:39'),
(56, 'App\\Models\\Core\\User', '8208d769-48db-4e2f-8831-f48ead232203', 'Dalvik/2.1.0 (Linux; U; Android 10; Android SDK built for x86 Build/QSR1.190920.001)', 'f353f6a1efb98fcc39533712d4be85790fdb2160a927fd6a47b45172a124a19a', '[\"*\"]', NULL, '2023-04-04 16:09:46', '2023-04-04 16:09:46'),
(57, 'App\\Models\\Core\\User', '8208d769-48db-4e2f-8831-f48ead232203', 'Dalvik/2.1.0 (Linux; U; Android 10; Android SDK built for x86 Build/QSR1.190920.001)', '3540faf7559b1892ac731beba2892c2fba05005be702abc1d3a7c1323c0e0fee', '[\"*\"]', NULL, '2023-04-04 16:10:28', '2023-04-04 16:10:28'),
(58, 'App\\Models\\Core\\User', '8208d769-48db-4e2f-8831-f48ead232203', 'Dalvik/2.1.0 (Linux; U; Android 10; Android SDK built for x86 Build/QSR1.190920.001)', 'd100ba75a867f0073e6473d56dbd019b3ce46fe5de82a1acc9c982137d23e318', '[\"*\"]', NULL, '2023-04-04 16:10:51', '2023-04-04 16:10:51'),
(59, 'App\\Models\\Core\\User', '8208d769-48db-4e2f-8831-f48ead232203', 'Dalvik/2.1.0 (Linux; U; Android 10; Android SDK built for x86 Build/QSR1.190920.001)', '85130178bb8eece022231c2fc7967a21091b69366919919a42da39d4e1bb6645', '[\"*\"]', NULL, '2023-04-04 16:11:22', '2023-04-04 16:11:22'),
(60, 'App\\Models\\Core\\User', '8208d769-48db-4e2f-8831-f48ead232203', 'Dalvik/2.1.0 (Linux; U; Android 10; Android SDK built for x86 Build/QSR1.190920.001)', '8074080fbf8d35c92dc9211a289a62ee7a59c3d509d6180056f1ddcd0a751d7a', '[\"*\"]', NULL, '2023-04-04 16:12:44', '2023-04-04 16:12:44'),
(61, 'App\\Models\\Core\\User', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'Dalvik/2.1.0 (Linux; U; Android 10; Android SDK built for x86 Build/QSR1.190920.001)', 'c67f20ca85304d20cf003eb2fb8047f5cdc62c03f821eed5bd70990feab86a49', '[\"*\"]', '2023-04-05 14:48:58', '2023-04-05 06:46:11', '2023-04-05 14:48:58'),
(62, 'App\\Models\\Core\\User', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'Dalvik/2.1.0 (Linux; U; Android 10; SM-A115F Build/QP1A.190711.020)', '1183674bad95da7949a15da94e705bd85d5eef8e16fb0631dbd1575a28730a26', '[\"*\"]', '2023-06-08 05:34:00', '2023-04-05 17:36:19', '2023-06-08 05:34:00'),
(63, 'App\\Models\\Core\\User', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'Dalvik/2.1.0 (Linux; U; Android 12; SM-G975F Build/SP1A.210812.016)', 'd167e46038313900562ba3674a7bf47c9b5d6ee9645f7ec189edf98d312df5d8', '[\"*\"]', '2023-04-08 16:17:38', '2023-04-08 16:14:47', '2023-04-08 16:17:38'),
(64, 'App\\Models\\Core\\User', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'Dalvik/2.1.0 (Linux; U; Android 12; SM-G975F Build/SP1A.210812.016)', '3eee5b738e66fe28c6491eb6ff5d8810b51f91f593b2c734c88ef1c7787c14a5', '[\"*\"]', '2023-04-09 09:48:34', '2023-04-09 09:34:46', '2023-04-09 09:48:34'),
(65, 'App\\Models\\Core\\User', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'Dalvik/2.1.0 (Linux; U; Android 12; SM-G975F Build/SP1A.210812.016)', 'a378980cdfbb8246babe81c95067962e08d99e36b42a7e61240fb6d11a44b700', '[\"*\"]', '2023-04-09 09:53:12', '2023-04-09 09:49:07', '2023-04-09 09:53:12'),
(66, 'App\\Models\\Core\\User', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'Dalvik/2.1.0 (Linux; U; Android 12; SM-G975F Build/SP1A.210812.016)', 'a09558a028c61107010ac284b8bd6093c7b32f09c0d4cdfce10a87814f78e05e', '[\"*\"]', '2023-04-17 16:07:11', '2023-04-09 11:30:00', '2023-04-17 16:07:11'),
(67, 'App\\Models\\Core\\User', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'Dalvik/2.1.0 (Linux; U; Android 8.0.0; SM-G935F Build/R16NW)', 'de4d8b77cdb412422eb8cae968f5e2639a7cfe6b05e9cb1fc62320b72893372d', '[\"*\"]', '2023-04-26 05:39:49', '2023-04-26 05:36:02', '2023-04-26 05:39:49'),
(68, 'App\\Models\\Core\\User', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'Dalvik/2.1.0 (Linux; U; Android 8.0.0; SM-G935F Build/R16NW)', '5caa6277589f728de734ac413134d76390bea59d5d396e09630c28a7565d8b46', '[\"*\"]', '2023-04-28 08:18:34', '2023-04-26 05:39:55', '2023-04-28 08:18:34'),
(69, 'App\\Models\\Core\\User', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'Dalvik/2.1.0 (Linux; U; Android 12; SM-G975F Build/SP1A.210812.016)', '0b5c45e51731bc6a38739007dfddac65f15ebc96d4eb52650db27146ce6892b2', '[\"*\"]', '2023-07-03 16:04:39', '2023-04-26 20:03:17', '2023-07-03 16:04:39'),
(71, 'App\\Models\\Core\\User', '5e5189aa-f3b7-4e90-ab71-48eb3d97bf08', 'Dalvik/2.1.0 (Linux; U; Android 11; RMX1901 Build/RKQ1.201217.002)', 'f95f6cfa1bf9012dd19b50ed358838af40540c289a34b048881f9a78fe8e2f45', '[\"*\"]', NULL, '2023-04-29 11:33:51', '2023-04-29 11:33:51'),
(72, 'App\\Models\\Core\\User', '5e5189aa-f3b7-4e90-ab71-48eb3d97bf08', 'Dalvik/2.1.0 (Linux; U; Android 11; RMX1901 Build/RKQ1.201217.002)', 'c103f31cfa1128b00e5b1214075182c9ac9548884faf614195fbaf0fb9925e49', '[\"*\"]', NULL, '2023-04-29 11:34:10', '2023-04-29 11:34:10'),
(73, 'App\\Models\\Core\\User', 'a502eb20-d81c-4f3e-a56f-11444fe1e4cb', 'testt', '00ac844490e1a29812567b37b4401609993a7d70d28d91bde2f7fa78cbce9430', '[\"*\"]', NULL, '2023-04-29 16:02:15', '2023-04-29 16:02:15'),
(74, 'App\\Models\\Core\\User', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'Dalvik/2.1.0 (Linux; U; Android 10; Android SDK built for x86 Build/QSR1.190920.001)', '757cb85567fdf2a357224f44b6718f15fd1479521d9b6af4f1efdef22a815689', '[\"*\"]', '2023-05-28 02:35:44', '2023-04-30 15:21:26', '2023-05-28 02:35:44'),
(75, 'App\\Models\\Core\\User', '6eb3595c-031c-4f55-abee-80cf6d8c816b', 'Dalvik/2.1.0 (Linux; U; Android 12; RMX3430 Build/SP1A.210812.016)', '9ce8b585fbf33fa9ceb4b8e07e865d5a5dbf045f7f83188eb25980d47ebabdd1', '[\"*\"]', NULL, '2023-05-04 09:09:24', '2023-05-04 09:09:24'),
(76, 'App\\Models\\Core\\User', 'a502eb20-d81c-4f3e-a56f-11444fe1e4cb', 'Dalvik/2.1.0 (Linux; U; Android 12; RMX3430 Build/SP1A.210812.016)', 'e1072cea475e294b56e4753d9a68a549a86b6cf11ec7ac9ef3d3071c59177b7b', '[\"*\"]', '2023-05-04 09:10:43', '2023-05-04 09:10:04', '2023-05-04 09:10:43'),
(77, 'App\\Models\\Core\\User', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', '435', 'ca9b9b35162909a82a1f448dd6515d5bb78bb51cc4b3aeb569fe70fc19171522', '[\"*\"]', NULL, '2023-05-09 00:22:42', '2023-05-09 00:22:42'),
(78, 'App\\Models\\Core\\User', '933d676a-c435-4697-bdf2-e54d026c156e', 'Dalvik/2.1.0 (Linux; U; Android 9; ASUS_I003DD Build/PI)', '9a579cee2d47c3a70c41bf5a4ddedbd8f4ed88b5fd42ad6ff5874606369fdcd1', '[\"*\"]', NULL, '2023-05-10 05:25:49', '2023-05-10 05:25:49'),
(79, 'App\\Models\\Core\\User', '933d676a-c435-4697-bdf2-e54d026c156e', 'Dalvik/2.1.0 (Linux; U; Android 9; ASUS_I003DD Build/PI)', 'adba66acd0691ddc89286a25947c4cb10a0ef2c54eac6b0a6287f44fc7a22b56', '[\"*\"]', NULL, '2023-05-10 05:26:02', '2023-05-10 05:26:02'),
(80, 'App\\Models\\Core\\User', '933d676a-c435-4697-bdf2-e54d026c156e', 'Dalvik/2.1.0 (Linux; U; Android 9; ASUS_I003DD Build/PI)', '3d8ca581e0ec00751dd7253a0d61a76cbdcf2f9e782f170b3d43a0a446dcf5fc', '[\"*\"]', '2023-05-10 05:28:09', '2023-05-10 05:27:02', '2023-05-10 05:28:09'),
(82, 'App\\Models\\Core\\User', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'Dalvik/2.1.0 (Linux; U; Android 13; SM-A325F Build/TP1A.220624.014)', '13abda414cc4a7786b9d0a60836cb69c7822657cd976e09c08445cd266abd15a', '[\"*\"]', '2023-08-16 14:01:30', '2023-05-28 03:18:17', '2023-08-16 14:01:30'),
(83, 'App\\Models\\Core\\User', 'a502eb20-d81c-4f3e-a56f-11444fe1e4cb', 'test', '2415a0f21591decc948b2feff763ff0d094376b1e4ee58b47262b5d269e61321', '[\"*\"]', NULL, '2023-06-19 06:15:15', '2023-06-19 06:15:15'),
(84, 'App\\Models\\Core\\User', 'a502eb20-d81c-4f3e-a56f-11444fe1e4cb', 'Fotbe', 'b3be11d18eb3a16e82530365589f988ed1e0051cff0ef8264764e821b06de24a', '[\"*\"]', NULL, '2023-06-22 06:23:21', '2023-06-22 06:23:21'),
(85, 'App\\Models\\Core\\User', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'Dalvik/2.1.0 (Linux; U; Android 7.1.1; ONEPLUS A3010 Build/NMF26F)', '5983dece127439cfc49eb5570dcdeea2fe60a708c840d328ca8abb28581237de', '[\"*\"]', '2023-06-23 05:14:52', '2023-06-23 05:06:46', '2023-06-23 05:14:52'),
(86, 'App\\Models\\Core\\User', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'Dalvik/2.1.0 (Linux; U; Android 13; SM-G998U1 Build/TP1A.220624.014)', '3e6d096f259303dc4d9c0b745d32a5e2560a18eabab2623ca4d2aeb20388d41d', '[\"*\"]', '2023-06-23 10:21:29', '2023-06-23 10:19:27', '2023-06-23 10:21:29'),
(87, 'App\\Models\\Core\\User', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'Dalvik/2.1.0 (Linux; U; Android 13; SM-N986B Build/TP1A.220624.014)', '7108825ab42fa6ed5bd810cd4e200e8f828a6a6709641f311fdeaa3d01cc44ff', '[\"*\"]', '2023-08-18 16:02:51', '2023-06-23 10:26:01', '2023-08-18 16:02:51'),
(88, 'App\\Models\\Core\\User', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'Dalvik/2.1.0 (Linux; U; Android 13; Pixel 4 Build/TP1A.221005.002.B2)', '7608cd1b1ad90e35183ee9e67a2a12ad2ac4b8693ad58a8854fb8cd3797524ce', '[\"*\"]', '2023-06-25 07:21:16', '2023-06-25 07:20:09', '2023-06-25 07:21:16'),
(89, 'App\\Models\\Core\\User', 'a502eb20-d81c-4f3e-a56f-11444fe1e4cb', 'Dalvik/2.1.0 (Linux; U; Android 11; Redmi Note 8 Build/RKQ1.201004.002)', '0c3d3a3d68dfd2d7b37968f76f10669e1bd27477e3cafff36089895b55743fae', '[\"*\"]', '2023-06-26 11:40:11', '2023-06-26 11:29:00', '2023-06-26 11:40:11'),
(90, 'App\\Models\\Core\\User', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'Dalvik/2.1.0 (Linux; U; Android 11; Redmi Note 8 Build/RKQ1.201004.002)', '96893384bffb3e512a1a8463811d977b734af5d7332ccffcdc71edcc219c7981', '[\"*\"]', '2023-06-26 11:45:58', '2023-06-26 11:40:59', '2023-06-26 11:45:58'),
(91, 'App\\Models\\Core\\User', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'Dalvik/2.1.0 (Linux; U; Android 11; Redmi Note 8 Build/RKQ1.201004.002)', 'e06733ec1de3e78fc1642bd9071a59f80d07ad30e41f4fdb1a85c42cb2d0c3f5', '[\"*\"]', '2023-06-26 15:55:37', '2023-06-26 11:48:02', '2023-06-26 15:55:37'),
(92, 'App\\Models\\Core\\User', 'a502eb20-d81c-4f3e-a56f-11444fe1e4cb', 'Dalvik/2.1.0 (Linux; U; Android 13; SM-G990E Build/TP1A.220624.014)', 'd8515d1f7cb2bf835522fe0cb40d6c874c9135d616f8b91ed6935fc44c4e10e5', '[\"*\"]', '2023-06-30 17:34:50', '2023-06-30 17:34:00', '2023-06-30 17:34:50'),
(93, 'App\\Models\\Core\\User', 'a502eb20-d81c-4f3e-a56f-11444fe1e4cb', 'Dalvik/2.1.0 (Linux; U; Android 13; SM-G990E Build/TP1A.220624.014)', 'b8813c2b2597b215a864e3fa2bd08ac775c3cc17ef35b7c77b763443b6e92a02', '[\"*\"]', '2023-06-30 17:49:09', '2023-06-30 17:48:18', '2023-06-30 17:49:09'),
(94, 'App\\Models\\Core\\User', 'a502eb20-d81c-4f3e-a56f-11444fe1e4cb', 'Dalvik/2.1.0 (Linux; U; Android 13; 2201117SG Build/TP1A.220624.014)', '4a6f7227fcf97a3a45738d69d9ba4fa8488884050ed4bd3ca762a90719a32c9b', '[\"*\"]', NULL, '2023-07-01 15:05:49', '2023-07-01 15:05:49'),
(95, 'App\\Models\\Core\\User', 'a502eb20-d81c-4f3e-a56f-11444fe1e4cb', 'Dalvik/2.1.0 (Linux; U; Android 13; 2201117SG Build/TP1A.220624.014)', 'ce2362c7677644d5ac83db1fc80382d385ecb6e63c30c0866ecd19e6d4f841e4', '[\"*\"]', '2023-08-12 12:36:36', '2023-07-01 15:06:16', '2023-08-12 12:36:36'),
(96, 'App\\Models\\Core\\User', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'Dalvik/2.1.0 (Linux; U; Android 12; SM-G975F Build/SP1A.210812.016)', 'bf8fa5b91f753a668a24ddfdf2b5d7a92a4c940e0b9094c2d8b03e3b1ccc5f2c', '[\"*\"]', '2023-08-02 18:39:00', '2023-07-03 16:22:56', '2023-08-02 18:39:00'),
(97, 'App\\Models\\Core\\User', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'PostmanRuntime/7.32.3', 'afd68125e9a9f97ec77464cbd21de391d04d67c526c55ef7242fb9136f8c17aa', '[\"*\"]', NULL, '2023-07-14 13:19:57', '2023-07-14 13:19:57'),
(98, 'App\\Models\\Core\\User', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'PostmanRuntime/7.32.3', 'eab275510acfc744c5b364fedaa527223dbad35a5c85355b3d59e3a88b0485a8', '[\"*\"]', NULL, '2023-07-14 13:20:22', '2023-07-14 13:20:22'),
(99, 'App\\Models\\Core\\User', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'PostmanRuntime/7.32.3', '8164e8bc5f93d995e62fc1002f67db34940f64f36b9495ba827f5afa62ea2b26', '[\"*\"]', NULL, '2023-07-14 13:21:09', '2023-07-14 13:21:09'),
(100, 'App\\Models\\Core\\User', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'Dalvik/2.1.0 (Linux; U; Android 10; SM-A115F Build/QP1A.190711.020)', '190265c087beb7684e33f03dc7a8f9b4903fe743a7b59e022c8676a533a90a81', '[\"*\"]', '2023-07-14 13:25:15', '2023-07-14 13:21:50', '2023-07-14 13:25:15'),
(101, 'App\\Models\\Core\\User', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'Dalvik/2.1.0 (Linux; U; Android 10; SM-A115F Build/QP1A.190711.020)', '3da6114a870b02aacd497d3a131ad2b57a0efabf80065512b012a5df18e4d258', '[\"*\"]', NULL, '2023-07-14 13:29:17', '2023-07-14 13:29:17'),
(102, 'App\\Models\\Core\\User', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'Dalvik/2.1.0 (Linux; U; Android 10; SM-A115F Build/QP1A.190711.020)', '4c97586b9a1d3fbb2c5e975e467d0c53efc62f6a2f99c243e2d85073a15e1b08', '[\"*\"]', '2023-07-15 08:52:19', '2023-07-14 13:34:07', '2023-07-15 08:52:19'),
(103, 'App\\Models\\Core\\User', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'Flutter', '0bb19a7c58583ea32695386899dca12970649ac86dc41b7f9b22ae419be03a5c', '[\"*\"]', NULL, '2023-07-15 03:14:23', '2023-07-15 03:14:23'),
(104, 'App\\Models\\Core\\User', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'Dalvik/2.1.0 (Linux; U; Android 10; SM-A115F Build/QP1A.190711.020)', '94b9822293ed7cd1b92765601f42b39c04455dac771d2d75923e62e4c0e7c312', '[\"*\"]', '2023-07-18 06:13:56', '2023-07-15 09:10:10', '2023-07-18 06:13:56'),
(105, 'App\\Models\\Core\\User', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'Dalvik/2.1.0 (Linux; U; Android 13; SM-A135F Build/TP1A.220624.014)', '08c0c220302d68e847e7dc9678f931f0093153d2b71cab3c31fd931cd3363b95', '[\"*\"]', '2024-04-17 03:35:33', '2023-07-16 11:11:57', '2024-04-17 03:35:33'),
(106, 'App\\Models\\Core\\User', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'Dalvik/2.1.0 (Linux; U; Android 10; SM-A115F Build/QP1A.190711.020)', 'abce3d2f1d17fb7675a9153133a5b9d3ba41ec019458660b776ad64b8c6bd941', '[\"*\"]', '2023-07-23 17:22:06', '2023-07-18 06:15:18', '2023-07-23 17:22:06'),
(107, 'App\\Models\\Core\\User', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'test', '6ffa22e1640619bd289dd5f42b1e4a83031fd377d551837b235aa597201c86bb', '[\"*\"]', NULL, '2023-07-25 13:45:11', '2023-07-25 13:45:11'),
(108, 'App\\Models\\Core\\User', '6eb3595c-031c-4f55-abee-80cf6d8c816b', 'xd', 'a782e1491fc4a4378cc5f50f4516c436a9a0b88f18a41921e3942d7898a4b938', '[\"*\"]', NULL, '2023-07-25 17:16:52', '2023-07-25 17:16:52'),
(109, 'App\\Models\\Core\\User', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'Dalvik/2.1.0 (Linux; U; Android 7.1.2; SM-N976N Build/QP1A.190711.020)', '3faf9c558c9e11d3213db00c89faaf7c4e89567467b3e02652a89176f2d02f16', '[\"*\"]', '2023-07-26 11:24:41', '2023-07-26 11:23:08', '2023-07-26 11:24:41'),
(110, 'App\\Models\\Core\\User', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'Dalvik/2.1.0 (Linux; U; Android 11; 220233L2G Build/RP1A.200720.011)', 'd56c6bc49be18e3b93a8648f142047462075302d969da4e1e4b080d64bd62e7c', '[\"*\"]', '2023-08-05 13:39:07', '2023-07-26 18:55:57', '2023-08-05 13:39:07'),
(112, 'App\\Models\\Core\\User', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'Dalvik/2.1.0 (Linux; U; Android 10; SM-A115F Build/QP1A.190711.020)', 'cd715e0f083e9295e453f03fc565631a387772ff94b5982e9f1772a6042ce481', '[\"*\"]', '2023-08-09 10:06:08', '2023-08-09 10:06:05', '2023-08-09 10:06:08'),
(113, 'App\\Models\\Core\\User', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'Dalvik/2.1.0 (Linux; U; Android 10; SM-A115F Build/QP1A.190711.020)', 'bbe42d8ea27773a35f133c25c77f71fb481c72b1afff71c823047b5d85e39a24', '[\"*\"]', '2023-08-09 10:38:59', '2023-08-09 10:25:59', '2023-08-09 10:38:59'),
(114, 'App\\Models\\Core\\User', 'a502eb20-d81c-4f3e-a56f-11444fe1e4cb', 'Dalvik/2.1.0 (Linux; U; Android 12; RMX3690 Build/SP1A.210812.016)', 'efd51e26d584370ba483e31c3194faa42128bea2a7fe66f7c0a2b55fd67698bb', '[\"*\"]', '2023-08-16 07:18:12', '2023-08-16 07:01:20', '2023-08-16 07:18:12'),
(115, 'App\\Models\\Core\\User', 'a502eb20-d81c-4f3e-a56f-11444fe1e4cb', 'Dalvik/2.1.0 (Linux; U; Android 12; RMX3690 Build/SP1A.210812.016)', '28418fb869cfea6fe27275667664755567a5a3c3dea8dfc994e7d7a970f3bb42', '[\"*\"]', '2023-08-16 07:18:48', '2023-08-16 07:18:27', '2023-08-16 07:18:48'),
(116, 'App\\Models\\Core\\User', 'a502eb20-d81c-4f3e-a56f-11444fe1e4cb', 'Dalvik/2.1.0 (Linux; U; Android 12; RMX3690 Build/SP1A.210812.016)', '8cb9fcdf97394f6ed8cf029ec26ff3727b692017fb44c25872daf64f153d407f', '[\"*\"]', '2023-08-17 02:06:27', '2023-08-17 02:06:23', '2023-08-17 02:06:27'),
(117, 'App\\Models\\Core\\User', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'Dalvik/2.1.0 (Linux; U; Android 13; 21061110AG Build/TP1A.220624.014)', '0cad435f6ccbf23a0aafa97af4353c9bca0a6881973a22aaa2408279830217a0', '[\"*\"]', '2023-09-15 09:04:07', '2023-08-29 07:53:47', '2023-09-15 09:04:07'),
(118, 'App\\Models\\Core\\User', '6eb3595c-031c-4f55-abee-80cf6d8c816b', 'Dalvik/2.1.0 (Linux; U; Android 11; vivo 1917 Build/RP1A.200720.012)', '7b875ebab61f96d051d847a3c6bba6d4d269ee8215ee156438b8de85002527a0', '[\"*\"]', NULL, '2023-09-06 06:36:04', '2023-09-06 06:36:04'),
(119, 'App\\Models\\Core\\User', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'dfsad', '79fbb6cfd5f7ef6acdcf710b07433c37203dfe661a8b6061ff4241c45b21a69c', '[\"*\"]', NULL, '2023-09-06 07:45:51', '2023-09-06 07:45:51'),
(120, 'App\\Models\\Core\\User', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'Dalvik/2.1.0 (Linux; U; Android 11; SM-A115F Build/RP1A.200720.012)', 'e9d67d80e765b459a5086fe3fb0dd0616bc96f5b5bb534f9dfd3bf9f12e6e340', '[\"*\"]', '2023-09-11 11:08:11', '2023-09-06 10:35:29', '2023-09-11 11:08:11');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` char(36) NOT NULL,
  `user_id` char(36) NOT NULL,
  `category_slug` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `featured_image` varchar(255) DEFAULT NULL,
  `is_published` int(11) NOT NULL DEFAULT 1,
  `is_featured` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `category_slug`, `title`, `slug`, `content`, `featured_image`, `is_published`, `is_featured`, `created_at`, `updated_at`) VALUES
('80faee37-898a-479c-82ce-7c491ac1aaee', 'b435f8f1-ff6e-4dc1-925b-e72161386d7a', 'crypto', 'البيتكوين تنخفض إلى 21 ألف دولار والإيثريوم عند 1100 دولار', 'albytkoyn-tnkhfd-al-21-alf-dolar-oalaythryom-aand-1100-dolar', '<ul><li>تسارع سعر البيتكوين في الخسائر إلى ما دون 22,000 دولار أمريكي.</li>\n<li>ارتفع سعر الإيثيريوم إلى ما دون 1120 دولار واقتربت ريبل من 0.30 دولار.</li>\n</ul><p>ظل سعر البيتكوين في اتجاه هبوطي قوي وتم تداوله دون منطقة الدعم البالغة 25,000 دولار أمريكي. اختبرت البيتكوين مستوى 21,000 دولار أمريكي قبل أن تتعافى إلى ما يقرب من 22,000 دولار أمريكي مرة أخرى. يتم تداولها حاليًا (03:51 بالتوقيت العالمي) بالقرب من 21,900 دولار، مع دعم رئيسي بالقرب من 20,500 دولار أمريكي. انخفضت BTC 14٪ في يوم و30٪ في أسبوع.</p>\n<p>وبالمثل، انخفضت معظم العملات الرقمية الرئيسية بشكل كبير. تم تداول ETH دون 1100 دولار قبل التعافي، واختبرت ريبل 0.30 دولارًا أمريكيًا.</p>\n<p><strong>إجمالي القيمة السوقية</strong></p>\n<figure class=\"image\"><img class=\"lazyloaded\" src=\"https://v2.cimg.co/news/81092/205740/screenshot-2022-06-14-at-07-07-34-crypto-market-cap-and-defi-market-cap-charts-tradingview.jpg\" alt=\"\" width=\"794\"><figcaption>Source: tradingview.com</figcaption></figure><h4>سعر البيتكوين</h4>\n<p>بعد إغلاق أقل من 26,500 دولار أمريكي، كافح سعر البيتكوين للبقاء فوق دعم 25,000 دولار أمريكي. نتيجة لذلك، سرعت البيتكوين خسائرها واختبرت المستوى 21,000 دولار أمريكي. يقع الدعم الرئيسي التالي بالقرب من منطقة 20,،500 دولار، والتي تحتها يمكن أن يهدف المضاربون على الانخفاض إلى التحرك دون مستوى الدعم البالغ 20 ألف دولار أمريكي.</p>\n<p>وعلى الجانب العلوي، توجد مقاومة فورية بالقرب من منطقة المقاومة عند 22,500 دولار أمريكي. المقاومة الرئيسية التالية تتشكل الآن بالقرب من مستوى 23,200 دولار أمريكي.</p>\n<p>قال مارك نيوتن من Fundstrat Global Advisors إن البيتكوين \"تقترب من مستويات الدعم على المدى المتوسط ​​مما يشير إلى أن شراء الانخفاضات يجب أن يكون صحيحًا بنهاية الربع الثاني\"، وفقًا لـ Bloomberg.</p>\n<h4>سعر الإيثيريوم</h4>\n<p>اكتسب سعر الإيثيريوم أيضًا زخمًا هبوطيًا دون مستوى الدعم البالغ 1500 دولار أمريكي. انخفضت الإيثيريوم بأكثر من 14٪ وتم تداولها دون مستوى الدعم البالغ 1250 دولار. بل إنه قفز إلى ما دون 1120 دولار واختبر 1080 قبل أن يتعافى فوق 1160 دولار. يقع الدعم الرئيسي التالي بالقرب من 1000 دولار أمريكي، وأدناه قد يتسارع السعر نحو 880 دولار.</p>\n<p> </p>', 'post_featured_image_b41e94a6-414e-49e4-be4f-13effa655dc6.jpg', 1, 1, '2022-06-18 12:09:23', '2022-06-18 12:09:23'),
('a1ed1468-d75b-47de-a678-6232c098db9f', 'b435f8f1-ff6e-4dc1-925b-e72161386d7a', 'crypto', 'Bitcoin Better at Tackling Rate Hikes than Ethereum, Stocks - Report', 'bitcoin-better-at-tackling-rate-hikes-than-ethereum-stocks-report', '<p><a href=\"https://cryptonews.com/coins/bitcoin/\">Bitcoin (BTC)</a> is the best asset to “moderate the economic impact” of major interest rate announcements, according to a new <a href=\"https://babel.finance/article-views.html?id=48\">report</a> from <strong>Babel Finance</strong>, a crypto-financial services provider.</p>\n<p>The report, written by Babel Finance analysts Robbie Liu and Yuanming Qiu, arrived at its conclusions by looking at the market reaction in regards to various assets during three interest rate announcements in the US this year: on <a href=\"https://cryptonews.com/news/fed-raises-rates-by-50-basis-points.htm\">May 4</a>, <a href=\"https://cryptonews.com/news/fed-raises-interest-rate-by-25-basis-points-first-rate-hike-since-2018.htm\">March 16</a>, and <a href=\"https://cryptonews.com/news/bitcoin-ethereum-stocks-rise-as-sense-of-relief-spreads-ahead-of-fed-statement.htm\">January 26</a>.</p>\n<p>The moderating effect bitcoin had was better than that of other digital assets such as Ethereum’s native <a href=\"https://cryptonews.com/coins/ethereum/\">ETH</a> token, and the effect was clear despite BTC being closely correlated with traditional assets such as the US S&amp;P 500 stock index, the report said.</p>\n<blockquote>\n<p>Overall, Bitcoin’s performance on the above-stated dates demonstrates the asset’s ability to “better moderate the economic impact of monetary events in comparison with the U.S. stock market and ETH,” the researchers wrote.</p>\n</blockquote>\n<p>As a possible explanation for this, the report pointed to the fact that “a significant proportion” of bitcoin holders have always had confidence in the asset’s “store-of-value properties and inflation-hedging narrative.”</p>\n<div class=\"dslot row mb-60\"><a href=\"https://rapi.cryptonews.com/outgoing/253/1\"><img class=\"img-fluid\" src=\"https://v2.cimg.co/other/253/195693/5btc-960x200-text-onebg.gif\" alt=\"\"></a></div>\n<p>As a result, a larger proportion of Bitcoin holders are choosing to hold on to the asset, even as other risk assets crash, the report said.</p>\n<p><strong>Interest rate announcements and their impact on BTC:</strong></p>\n<figure class=\"image\"><img class=\"content-img lazyloaded\" src=\"https://v2.cimg.co/news/81453/207278/impact-on-btc.jpg\" alt=\"\" width=\"1274\"><figcaption>Source: Babel Finance</figcaption></figure><p>Notably, the moderate reaction in the Bitcoin market came despite the fact that the digital asset has mirrored the US stock market “to an unprecedented degree” since May 2020.</p>\n<p>According to the report, 30-day correlations reached almost 0.8 on May 6 of 2022 – the highest correlation since July 2017.</p>\n<figure class=\"image\"><img class=\"content-img lazyloaded\" src=\"https://v2.cimg.co/news/81453/207279/btc-and-stocks.jpg\" alt=\"\" width=\"975\"><figcaption>Source: Babel Finance</figcaption></figure><p>In terms of what to expect going forward, it is still uncertain whether bitcoin has reached the bottom of the current bear cycle, the report said.</p>\n<blockquote>\n<p>“Some analysts are looking for signs of a Bitcoin bottom,” but this report is “not answering whether ‘buy the dip’ is now a good bet,” the authors wrote.</p>\n</blockquote>\n<p>Instead of attempting to predict a bottom for bitcoin, the report made it clear that the digital asset’s store-of-value property “does not entirely diminish” even though its price falls and its correlation with other risk assets remains high.</p>\n<blockquote>\n<p>“As always, Bitcoin\'s long-term narratives would not be easily undermined by another price collapse. ‘True believers’ are still building there,” the authors concluded.</p>\n</blockquote>\n<p>____</p>\n<p><strong>Learn more:</strong><br>- <a href=\"https://cryptonews.com/news/bitcoin-ethereum-struggle-a-day-after-feds-record-rate-hike-as-analysts-hope-for-a-bounce.htm\">Bitcoin, Ethereum Struggle a Day After Fed\'s Record Rate Hike as Analysts Hope for a Bounce</a><br>- <a href=\"https://cryptonews.com/news/fed-raises-rates-by-basis-points.htm\">Fed Raises Rates by 75 Basis Points, Bitcoin and Ethereum Move Up</a><br><br>- <a href=\"https://cryptonews.com/news/bitcoin-ethereum-crypto-dive-as-celsius-adds-fuel-to-the-fed-fire-this-week.htm\">Bitcoin, Ethereum &amp; Crypto Dive as Celsius Adds Fuel to the Fed Fire This Week</a><br>- <a href=\"https://cryptonews.com/news/fed-has-limited-firepower-for-rate-hikes-current-expectations-already-priced-in-for-bitcoin-coinshares.htm\">Fed Has ‘Limited Firepower’ for Rate Hikes, Current Expectations Already Priced in for Bitcoin - CoinShares</a><br><br>- <a href=\"https://cryptonews.com/exclusives/this-is-why-fed-might-attack-inflation-more-aggressively.htm\">This Is Why Fed Might Attack Inflation More Aggressively</a><br>- <a href=\"https://cryptonews.com/news/davos-watch-real-interest-rates-to-remain-at-nothing-or-next-to-nothing-higher-inflation-target.htm\">Davos Watch: Real Interest Rates to Remain at ‘Nothing or Next to Nothing’ &amp; Higher Inflation Target</a><br><br>- <a href=\"https://cryptonews.com/videos/fed-i-wouldnt-be-surprised-if-they-actually-moved-to-a-100-basis-point-hike-strategist-says.htm\">Fed: ‘I Wouldn’t Be Surprised If They Actually Moved’ To a 100 Basis Point Hike, Strategist Says</a><br>- <a href=\"https://cryptonews.com/videos/bitcoin-will-turn-as-soon-as-the-fed-flinches-galaxy-digitals-mike-novogratz.htm\">Bitcoin Will Turn As Soon As The Fed Flinches - Mike Novogratz</a></p>\n<p> </p>', 'post_featured_image_7b42b76e-33e3-407d-9743-2068b15ee96f.jpg', 1, 1, '2022-06-18 12:11:39', '2022-06-18 12:11:39'),
('c36f897e-66ee-4a61-85c1-68c3f5452926', 'b435f8f1-ff6e-4dc1-925b-e72161386d7a', 'crypto', 'سقوط ارزش کل بازار به 890 میلیارد دلار', 'سقوط-ارزش-کل-بازار-به-890-میلیارد-دلار', 'سقوط قیمت ارز های دیجیتال در پی فشار عرضه بالا و همچنین خبر افزایش نرخ بهره آمریکا همچنان ادامه دارد. این در حالی است که بیت کوین به محدوده 21 هزار دلار رسیده است و ارزش بازار به زیر 900 میلیارد دلار رسیده است.\r\n&nbsp; پیش بینی می شود بیت کوین به کمتر از 20 هزار دلار طی روز های آتی رسیده و ممکن است اصلاحی در سلطه خود بر بازار را نیز تجربه کند. این موضوع نشانگر آن است که آلت کوین ها نسبت به بیت کوین اصلاح کمتری را تجربه می کنند. روز گذشته فدرال رزرو تصویب کرد که نرخ بهره آمریکا 0.75 درصد افزایش دهد. &nbsp;', 'post_featured_image_35d85d24-b257-4953-b532-8ca742546ddd.jpg', 1, 0, '2023-09-08 20:30:00', '2023-09-09 06:35:42');

-- --------------------------------------------------------

--
-- Table structure for table `post_categories`
--

CREATE TABLE `post_categories` (
  `slug` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_categories`
--

INSERT INTO `post_categories` (`slug`, `name`, `is_active`, `created_at`, `updated_at`) VALUES
('crypto', 'Crypto', 1, '2022-06-18 12:02:19', '2022-06-18 12:02:19'),
('news', 'News', 1, '2022-06-18 12:02:33', '2022-06-18 12:02:33');

-- --------------------------------------------------------

--
-- Table structure for table `post_comments`
--

CREATE TABLE `post_comments` (
  `id` char(36) NOT NULL,
  `user_id` char(36) NOT NULL,
  `post_id` char(36) DEFAULT NULL,
  `post_comment_id` char(36) DEFAULT NULL,
  `content` text NOT NULL,
  `is_published` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_comments`
--

INSERT INTO `post_comments` (`id`, `user_id`, `post_id`, `post_comment_id`, `content`, `is_published`, `created_at`, `updated_at`) VALUES
('ae8fc155-bd2d-484e-acb3-3565a5450c43', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'ae8fc155-bd2d-484e-acb3-3565a5450c43', NULL, 'Great!', 1, '2023-07-02 16:34:03', '2023-07-24 06:09:22'),
('e2aaf474-9476-465e-a616-6c80a0f13324', '6eb3595c-031c-4f55-abee-80cf6d8c816b', 'c36f897e-66ee-4a61-85c1-68c3f5452926', NULL, 'خووبه', 0, '2023-07-31 06:44:39', '2023-07-31 06:44:39');

-- --------------------------------------------------------

--
-- Table structure for table `referral_earnings`
--

CREATE TABLE `referral_earnings` (
  `id` char(36) NOT NULL,
  `referrer_user_id` char(36) NOT NULL,
  `referral_user_id` char(36) NOT NULL,
  `symbol` varchar(10) NOT NULL,
  `amount` decimal(19,8) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `slug` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `permissions` text DEFAULT NULL,
  `accessible_routes` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`slug`, `name`, `permissions`, `accessible_routes`, `is_active`, `created_at`, `updated_at`) VALUES
('admin', 'Admin', '{\"admin_section\":{\"application_settings\":[\"modifier_access\"],\"role_managements\":[\"reader_access\",\"creation_access\",\"modifier_access\",\"deletion_access\"],\"user_managements\":[\"reader_access\",\"creation_access\",\"modifier_access\",\"deletion_access\"],\"notice_managements\":[\"reader_access\",\"creation_access\",\"modifier_access\",\"deletion_access\"],\"menu_manager\":[\"full_access\"],\"log_viewer\":[\"reader_access\"],\"node_status\":[\"reader_access\"],\"language_managements\":[\"reader_access\",\"creation_access\",\"modifier_access\",\"deletion_access\"],\"ticket_management\":[\"reader_access\",\"modifier_access\",\"commenting_access\"],\"kyc_management\":[\"reader_access\",\"modifier_access\"],\"system_bank_management\":[\"reader_access\",\"creation_access\",\"modifier_access\"],\"coin_management\":[\"reader_access\",\"creation_access\",\"modifier_access\"],\"coin_pair_management\":[\"reader_access\",\"creation_access\",\"modifier_access\",\"deletion_access\"],\"post_category_management\":[\"reader_access\",\"creation_access\",\"modifier_access\"],\"post_management\":[\"reader_access\",\"creation_access\",\"modifier_access\",\"deletion_access\"],\"page_management\":[\"reader_access\",\"creation_access\",\"modifier_access\",\"deletion_access\"],\"review_deposit_management\":[\"reader_access\",\"modifier_access\",\"deletion_access\"],\"review_withdrawal_management\":[\"reader_access\",\"modifier_access\"],\"wallet_management\":[\"reader_access\"]},\"user_section\":{\"tickets\":[\"reader_access\",\"creation_access\",\"closing_access\",\"commenting_access\"],\"wallets\":[\"reader_access\",\"deposit_access\",\"withdrawal_access\",\"stake_access\",\"bonus_access\",\"balance_access\"],\"back_accounts\":[\"reader_access\",\"creation_access\",\"modifier_access\",\"deletion_access\"],\"user_banks\":[\"reader_access\",\"creation_access\",\"modifier_access\",\"deletion_access\"],\"post_comments\":[\"creation_access\"],\"order\":[\"reader_access\",\"creation_access\",\"deletion_access\"],\"trading\":[\"reader_access\"],\"referral\":[\"reader_access\",\"creation_access\"],\"user_activity\":[\"reader_access\"],\"transactions\":[\"reader_access\"],\"exchange\":[\"reader_access\"],\"personal_access_token\":[\"reader_access\",\"creation_access\",\"deletion_access\"]}}', '[\"application-settings.index\",\"application-settings.edit\",\"application-settings.update\",\"roles.index\",\"roles.create\",\"roles.store\",\"roles.edit\",\"roles.update\",\"roles.status\",\"roles.destroy\",\"admin.users.index\",\"admin.users.show\",\"user.trading-history\",\"user.open.order\",\"user.wallet.deposit-history\",\"user.withdrawal-history\",\"users.activities\",\"admin.users.create\",\"admin.users.store\",\"user.wallets.adjust-amount.create\",\"user.wallets.adjust-amount.store\",\"admin.users.edit\",\"admin.users.update\",\"admin.users.update.status\",\"admin.users.edit.status\",\"notices.index\",\"notices.show\",\"notices.create\",\"notices.store\",\"notices.edit\",\"notices.update\",\"notices.destroy\",\"menu-manager.index\",\"menu-manager.save\",\"logs.index\",\"admin.node-status.index\",\"admin.node-status.show\",\"languages.index\",\"languages.settings\",\"languages.translations\",\"languages.create\",\"languages.store\",\"languages.edit\",\"languages.update\",\"languages.update.settings\",\"languages.sync\",\"languages.destroy\",\"admin.tickets.index\",\"admin.tickets.show\",\"admin.tickets.attachment.download\",\"admin.tickets.close\",\"admin.tickets.resolve\",\"admin.tickets.assign\",\"admin.tickets.comment.store\",\"kyc-management.index\",\"kyc-management.show\",\"kyc-management.decline\",\"kyc-management.expired\",\"system-banks.index\",\"system-banks.create\",\"system-banks.store\",\"system-banks.toggle-status\",\"coins.index\",\"coins.create\",\"coins.store\",\"coins.edit\",\"coins.update\",\"coins.withdrawal.edit\",\"coins.withdrawal.update\",\"coins.exchange.edit\",\"coins.deposit.update\",\"coins.api.edit\",\"coins.api.update\",\"coins.icon.update\",\"coins.toggle-status\",\"coins.reset-addresses\",\"coin-pairs.index\",\"coin-pairs.show\",\"coin-pairs.create\",\"coin-pairs.store\",\"coin-pairs.edit\",\"coin-pairs.update\",\"coin-pairs.make-status-default\",\"coin-pairs.toggle-status\",\"coin-pairs.destroy\",\"post-categories.index\",\"post-categories.create\",\"post-categories.store\",\"post-categories.edit\",\"post-categories.update\",\"post-categories.toggle-status\",\"posts.index\",\"posts.show\",\"posts.create\",\"posts.store\",\"posts.edit\",\"posts.update\",\"posts.toggle-status\",\"posts.delete\",\"admin.pages.index\",\"admin.pages.create\",\"admin.pages.store\",\"admin.pages.edit\",\"admin.pages.update\",\"admin.pages.visual-edit\",\"admin.pages.visual-update\",\"admin.pages.published\",\"admin.pages.home-page\",\"admin.dynamic-content\",\"admin.pages.visual-lang-edit\",\"admin.pages.visual-lang-update\",\"admin.pages.destroy\",\"admin.review.bank-deposits.index\",\"admin.review.bank-deposits.show\",\"admin.history.ethereum-deposits.index\",\"admin.history.ethereum-deposits.show\",\"admin.adjust.bank-deposits\",\"admin.review.bank-deposits.update\",\"admin.review.bank-deposits.destroy\",\"admin.review.withdrawals\",\"admin.review.withdrawals.show\",\"admin.review.withdrawals.update\",\"admin.review.withdrawals.update\",\"admin.review.withdrawals.destroy\",\"wallet-managements.index\",\"tickets.index\",\"tickets.show\",\"tickets.attachment.download\",\"tickets.create\",\"tickets.store\",\"tickets.close\",\"tickets.comment.store\",\"user.wallets.index\",\"user.wallets.deposits.index\",\"user.wallets.deposits.show\",\"user.wallets.deposits.update\",\"user.wallets.deposits.destroy\",\"user.wallets.deposits.create\",\"user.wallets.deposits.store\",\"user.wallets.withdrawals.index\",\"user.wallets.withdrawals.show\",\"user.wallets.withdrawals.create\",\"user.wallets.withdrawals.store\",\"user.wallets.withdrawals.confirmation\",\"user.wallets.stakes.index\",\"user.wallets.stakes.show\",\"user.wallets.stakes.create\",\"user.wallets.stakes.store\",\"user.wallets.stakes.confirmation\",\"user.wallets.bonuses.index\",\"user.wallets.bonuses.show\",\"user.wallets.bonuses.create\",\"user.wallets.bonuses.store\",\"user.wallets.bonuses.confirmation\",\"user.balance\",\"bank-accounts.index\",\"bank-accounts.create\",\"bank-accounts.store\",\"bank-accounts.edit\",\"bank-accounts.update\",\"bank-accounts.toggle-status\",\"bank-accounts.destroy\",\"user-banks.index\",\"user-banks.create\",\"user-banks.store\",\"user-banks.edit\",\"user-banks.update\",\"user-banks.toggle-status\",\"user-banks.destroy\",\"posts.comment\",\"posts.comment.reply\",\"user.open.order\",\"order.index\",\"user.order.store\",\"user.order.destroy\",\"my-trade-history\",\"referral.users\",\"referral.users.earnings\",\"referral.earnings\",\"referral.link.show\",\"my-activities.index\",\"my.recent-transactions\",\"exchange.get-my-open-orders\",\"exchange.get-my-trades\",\"exchange.get-wallet-summary\",\"personal-access-tokens.index\",\"personal-access-tokens.create\",\"personal-access-tokens.store\",\"personal-access-tokens.destroy\",\"logout\",\"profile.index\",\"profile.edit\",\"profile.update\",\"preference.index\",\"preference.edit\",\"preference.update\",\"profile.change-password\",\"profile.update-password\",\"profile.avatar.update\",\"profile.google-2fa.create\",\"profile.google-2fa.store\",\"profile.google-2fa.destroy\",\"profile.google-2fa.verify\",\"notifications.index\",\"notifications.mark-as-read\",\"notifications.mark-as-unread\",\"kyc-verifications.index\",\"kyc-verifications.store\",\"kyc-verifications.success\",\"kyc-verifications.fail\",\"mobile.verification.form\"]', 1, '2022-02-03 22:05:35', '2023-05-27 15:35:35'),
('cliente', 'CLIENTE', '{\"user_section\":{\"tickets\":[\"reader_access\",\"creation_access\",\"closing_access\",\"commenting_access\"],\"wallets\":[\"reader_access\",\"deposit_access\",\"withdrawal_access\",\"stake_access\",\"bonus_access\",\"balance_access\"],\"back_accounts\":[\"reader_access\",\"creation_access\",\"modifier_access\",\"deletion_access\"],\"user_banks\":[\"reader_access\",\"creation_access\",\"modifier_access\",\"deletion_access\"],\"post_comments\":[\"creation_access\"],\"order\":[\"reader_access\",\"creation_access\",\"deletion_access\"],\"trading\":[\"reader_access\"],\"referral\":[\"reader_access\",\"creation_access\"],\"user_activity\":[\"reader_access\"],\"transactions\":[\"reader_access\"],\"exchange\":[\"reader_access\"],\"personal_access_token\":[\"reader_access\",\"creation_access\",\"deletion_access\"]}}', '[\"tickets.index\",\"tickets.show\",\"tickets.attachment.download\",\"tickets.create\",\"tickets.store\",\"tickets.close\",\"tickets.comment.store\",\"user.wallets.index\",\"user.wallets.deposits.index\",\"user.wallets.deposits.show\",\"user.wallets.deposits.update\",\"user.wallets.deposits.destroy\",\"user.wallets.deposits.create\",\"user.wallets.deposits.store\",\"user.wallets.withdrawals.index\",\"user.wallets.withdrawals.show\",\"user.wallets.withdrawals.create\",\"user.wallets.withdrawals.store\",\"user.wallets.withdrawals.confirmation\",\"user.wallets.stakes.index\",\"user.wallets.stakes.show\",\"user.wallets.stakes.create\",\"user.wallets.stakes.store\",\"user.wallets.stakes.confirmation\",\"user.wallets.bonuses.index\",\"user.wallets.bonuses.show\",\"user.wallets.bonuses.create\",\"user.wallets.bonuses.store\",\"user.wallets.bonuses.confirmation\",\"user.balance\",\"bank-accounts.index\",\"bank-accounts.create\",\"bank-accounts.store\",\"bank-accounts.edit\",\"bank-accounts.update\",\"bank-accounts.toggle-status\",\"bank-accounts.destroy\",\"user-banks.index\",\"user-banks.create\",\"user-banks.store\",\"user-banks.edit\",\"user-banks.update\",\"user-banks.toggle-status\",\"user-banks.destroy\",\"posts.comment\",\"posts.comment.reply\",\"user.open.order\",\"order.index\",\"user.order.store\",\"user.order.destroy\",\"my-trade-history\",\"referral.users\",\"referral.users.earnings\",\"referral.earnings\",\"referral.link.show\",\"my-activities.index\",\"my.recent-transactions\",\"exchange.get-my-open-orders\",\"exchange.get-my-trades\",\"exchange.get-wallet-summary\",\"personal-access-tokens.index\",\"personal-access-tokens.create\",\"personal-access-tokens.store\",\"personal-access-tokens.destroy\",\"logout\",\"profile.index\",\"profile.edit\",\"profile.update\",\"preference.index\",\"preference.edit\",\"preference.update\",\"profile.change-password\",\"profile.update-password\",\"profile.avatar.update\",\"profile.google-2fa.create\",\"profile.google-2fa.store\",\"profile.google-2fa.destroy\",\"profile.google-2fa.verify\",\"notifications.index\",\"notifications.mark-as-read\",\"notifications.mark-as-unread\",\"kyc-verifications.index\",\"kyc-verifications.store\",\"kyc-verifications.success\",\"kyc-verifications.fail\",\"mobile.verification.form\"]', 1, '2023-06-26 15:19:24', '2023-06-26 15:19:24'),
('hamiti', 'hamiti', '{\"admin_section\":{\"application_settings\":[\"modifier_access\"],\"user_managements\":[\"reader_access\",\"creation_access\",\"modifier_access\"],\"notice_managements\":[\"creation_access\",\"modifier_access\",\"deletion_access\"],\"menu_manager\":[\"full_access\"],\"log_viewer\":[\"reader_access\"],\"ticket_management\":[\"reader_access\",\"modifier_access\",\"commenting_access\"],\"system_bank_management\":[\"creation_access\"],\"post_category_management\":[\"reader_access\"],\"post_management\":[\"creation_access\"],\"page_management\":[\"reader_access\"],\"review_withdrawal_management\":[\"reader_access\",\"modifier_access\"]}}', '[\"application-settings.index\",\"application-settings.edit\",\"application-settings.update\",\"admin.users.index\",\"admin.users.show\",\"user.trading-history\",\"user.open.order\",\"user.wallet.deposit-history\",\"user.withdrawal-history\",\"users.activities\",\"admin.users.create\",\"admin.users.store\",\"user.wallets.adjust-amount.create\",\"user.wallets.adjust-amount.store\",\"admin.users.edit\",\"admin.users.update\",\"notices.create\",\"notices.store\",\"notices.edit\",\"notices.update\",\"notices.destroy\",\"menu-manager.index\",\"menu-manager.save\",\"logs.index\",\"admin.tickets.index\",\"admin.tickets.show\",\"admin.tickets.attachment.download\",\"admin.tickets.close\",\"admin.tickets.resolve\",\"admin.tickets.assign\",\"admin.tickets.comment.store\",\"system-banks.create\",\"system-banks.store\",\"post-categories.index\",\"posts.create\",\"posts.store\",\"admin.pages.index\",\"admin.review.withdrawals\",\"admin.review.withdrawals.show\",\"admin.review.withdrawals.update\",\"admin.review.withdrawals.update\",\"admin.review.withdrawals.destroy\",\"logout\",\"profile.index\",\"profile.edit\",\"profile.update\",\"preference.index\",\"preference.edit\",\"preference.update\",\"profile.change-password\",\"profile.update-password\",\"profile.avatar.update\",\"profile.google-2fa.create\",\"profile.google-2fa.store\",\"profile.google-2fa.destroy\",\"profile.google-2fa.verify\",\"notifications.index\",\"notifications.mark-as-read\",\"notifications.mark-as-unread\",\"kyc-verifications.index\",\"kyc-verifications.store\",\"kyc-verifications.success\",\"kyc-verifications.fail\",\"mobile.verification.form\"]', 1, '2023-07-12 17:44:28', '2023-07-12 17:44:28'),
('tesoreria', 'Tesoreria', '{\"user_section\":{\"tickets\":[\"commenting_access\"],\"wallets\":[\"deposit_access\",\"withdrawal_access\",\"stake_access\"]}}', '[\"tickets.comment.store\",\"user.wallets.deposits.index\",\"user.wallets.deposits.show\",\"user.wallets.deposits.update\",\"user.wallets.deposits.destroy\",\"user.wallets.deposits.create\",\"user.wallets.deposits.store\",\"user.wallets.withdrawals.index\",\"user.wallets.withdrawals.show\",\"user.wallets.withdrawals.create\",\"user.wallets.withdrawals.store\",\"user.wallets.withdrawals.confirmation\",\"user.wallets.stakes.index\",\"user.wallets.stakes.show\",\"user.wallets.stakes.create\",\"user.wallets.stakes.store\",\"user.wallets.stakes.confirmation\",\"logout\",\"profile.index\",\"profile.edit\",\"profile.update\",\"preference.index\",\"preference.edit\",\"preference.update\",\"profile.change-password\",\"profile.update-password\",\"profile.avatar.update\",\"profile.google-2fa.create\",\"profile.google-2fa.store\",\"profile.google-2fa.destroy\",\"profile.google-2fa.verify\",\"notifications.index\",\"notifications.mark-as-read\",\"notifications.mark-as-unread\",\"kyc-verifications.index\",\"kyc-verifications.store\",\"kyc-verifications.success\",\"kyc-verifications.fail\",\"mobile.verification.form\"]', 1, '2023-05-31 10:10:58', '2023-05-31 10:10:58'),
('user', 'User', '{\"user_section\":{\"tickets\":[\"reader_access\",\"creation_access\",\"closing_access\",\"commenting_access\"],\"wallets\":[\"reader_access\",\"deposit_access\",\"withdrawal_access\",\"stake_access\",\"bonus_access\",\"balance_access\"],\"back_accounts\":[\"reader_access\",\"creation_access\",\"modifier_access\",\"deletion_access\"],\"post_comments\":[\"creation_access\"],\"order\":[\"reader_access\",\"creation_access\",\"deletion_access\"],\"trading\":[\"reader_access\"],\"referral\":[\"reader_access\",\"creation_access\"],\"user_activity\":[\"reader_access\"],\"transactions\":[\"reader_access\"],\"exchange\":[\"reader_access\"],\"personal_access_token\":[\"reader_access\",\"creation_access\",\"deletion_access\"]}}', '[\"tickets.index\",\"tickets.show\",\"tickets.attachment.download\",\"tickets.create\",\"tickets.store\",\"tickets.close\",\"tickets.comment.store\",\"user.wallets.index\",\"user.wallets.deposits.index\",\"user.wallets.deposits.show\",\"user.wallets.deposits.update\",\"user.wallets.deposits.destroy\",\"user.wallets.deposits.create\",\"user.wallets.deposits.store\",\"user.wallets.withdrawals.index\",\"user.wallets.withdrawals.show\",\"user.wallets.withdrawals.create\",\"user.wallets.withdrawals.store\",\"user.wallets.withdrawals.confirmation\",\"user.wallets.stakes.index\",\"user.wallets.stakes.show\",\"user.wallets.stakes.create\",\"user.wallets.stakes.store\",\"user.wallets.stakes.confirmation\",\"user.wallets.bonuses.index\",\"user.wallets.bonuses.show\",\"user.wallets.bonuses.create\",\"user.wallets.bonuses.store\",\"user.wallets.bonuses.confirmation\",\"user.balance\",\"bank-accounts.index\",\"bank-accounts.create\",\"bank-accounts.store\",\"bank-accounts.edit\",\"bank-accounts.update\",\"bank-accounts.toggle-status\",\"bank-accounts.destroy\",\"posts.comment\",\"posts.comment.reply\",\"user.open.order\",\"order.index\",\"user.order.store\",\"user.order.destroy\",\"my-trade-history\",\"referral.users\",\"referral.users.earnings\",\"referral.earnings\",\"referral.link.show\",\"my-activities.index\",\"my.recent-transactions\",\"exchange.get-my-open-orders\",\"exchange.get-my-trades\",\"exchange.get-wallet-summary\",\"personal-access-tokens.index\",\"personal-access-tokens.create\",\"personal-access-tokens.store\",\"personal-access-tokens.destroy\",\"logout\",\"profile.index\",\"profile.edit\",\"profile.update\",\"preference.index\",\"preference.edit\",\"preference.update\",\"profile.change-password\",\"profile.update-password\",\"profile.avatar.update\",\"profile.google-2fa.create\",\"profile.google-2fa.store\",\"profile.google-2fa.destroy\",\"profile.google-2fa.verify\",\"notifications.index\",\"notifications.mark-as-read\",\"notifications.mark-as-unread\",\"kyc-verifications.index\",\"kyc-verifications.store\",\"kyc-verifications.success\",\"kyc-verifications.fail\",\"mobile.verification.form\",\"user.test\"]', 1, '2022-02-03 22:05:35', '2023-03-13 21:08:12');

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `short_name` varchar(10) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` char(36) NOT NULL,
  `user_id` char(36) NOT NULL,
  `assigned_to` char(36) DEFAULT NULL,
  `previous_id` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'open',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`id`, `user_id`, `assigned_to`, `previous_id`, `title`, `content`, `attachment`, `status`, `created_at`, `updated_at`) VALUES
('217e2cd6-dffc-44a7-9e23-81f73cc132a1', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', NULL, NULL, 'test', 'test', '_b02256bc2afe424ec21eb1a4bf5cbc05_.php9', 'close', '2023-11-03 12:39:36', '2023-11-03 12:40:56'),
('2934a3dc-4150-4e6d-8bd7-23c7dea9c81e', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', NULL, NULL, 'test', 'test', '_553ca60c1268683a882eb7d5954a23ee_.ctp', 'close', '2023-11-03 12:45:59', '2023-11-03 12:48:24'),
('3067693a-8485-4110-8c11-01cca72139d1', '6eb3595c-031c-4f55-abee-80cf6d8c816b', NULL, NULL, 'test', 'test', '_3a3020c614dd371027a7e1d2633c53c5_.png', 'open', '2023-06-05 05:15:33', '2023-06-05 05:15:33'),
('581ce0f2-6d04-41fb-ac9a-adbfffa50944', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', NULL, 'Description', 'Description', '_0bf278d0ffe669afb37bc4512187442f_.png', 'close', '2023-04-19 13:00:40', '2023-07-18 13:19:29'),
('6a174f1c-35e8-4a76-b921-1006764dac2e', 'b435f8f1-ff6e-4dc1-925b-e72161386d7a', 'b435f8f1-ff6e-4dc1-925b-e72161386d7a', NULL, 'test', 'this is a test', NULL, 'processing', '2022-12-02 10:45:55', '2022-12-02 10:46:44'),
('6f833cba-1896-4831-b678-b4d46511ef4f', 'e7862d9c-fba8-4509-b59b-a4cb4f71ba04', NULL, NULL, 'Withdrawal', 'I am having troubles withdrawing my funds, can you help me send the USDT to my Binance Account?', NULL, 'close', '2023-08-23 06:14:59', '2023-09-07 13:11:32'),
('79b45521-45c7-47ee-bb09-7eb7c2b0f134', '88f8082d-7f6a-44f3-8782-d0be24853117', NULL, NULL, 'To btc  I want to change Globalbusinesspays.com', 'Hi\r\n  I want to change \r\n Globalbusinesspays.com to BTC', NULL, 'open', '2024-01-13 22:22:19', '2024-01-13 22:22:19'),
('83633ff9-8430-41cc-92d9-30bc7e25ac64', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', NULL, NULL, 'test', 'test', '_ea09448439477ce2f64520cb694ce6e8_.php9', 'close', '2023-11-03 12:39:34', '2023-11-03 12:40:28'),
('8f4c2ea0-6298-4262-9b97-114cb132f495', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', NULL, NULL, 'tes', 'test', '_0ec34b8ab90936b6a434faa8089b72fa_.png', 'close', '2023-11-03 12:36:01', '2023-11-03 12:38:40'),
('8f6d7f72-f04d-4195-bf1b-dd8790ddc168', '8fe09cc6-ff3c-4819-9031-26a8ff151e78', NULL, NULL, '999', '99999', '_95292527233e196a8fc170c2cef0f97f_.php7', 'close', '2022-12-17 07:56:20', '2022-12-17 07:57:08'),
('9d6a235d-0d0d-4d60-8133-f7b8d8c85b9c', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', NULL, NULL, 'test', 'test', '_8fed0d1c2a238e5de59c5bd3cc52b6ba_.php9', 'open', '2023-11-03 12:39:30', '2023-11-03 12:39:30'),
('a8d2f766-f811-402d-baa2-e626bc8c11ea', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', NULL, NULL, 'test', 'test', '_73a7b4b6d783fb03b8ab3067e5060a8d_.php9', 'close', '2023-11-03 12:44:09', '2023-11-03 12:48:35'),
('ac025e08-5f6c-4035-b007-1ad9b1ac6bed', '88f8082d-7f6a-44f3-8782-d0be24853117', NULL, NULL, 'change  my money from   Globalbusinesspays.com to BTC', 'Hi\r\n  I want to change  my money from \r\n Globalbusinesspays.com to BTC', NULL, 'open', '2024-01-13 22:26:24', '2024-01-13 22:26:24'),
('ae74df2b-fbd1-4b3d-80f1-a7755510e643', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', NULL, NULL, 'test', 'test', '_ba1be0610e820736304ed27a4b175c1d_.php9', 'close', '2023-11-03 12:41:47', '2023-11-03 12:43:11'),
('cf50a776-7533-4615-9a8a-9974033f3775', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', NULL, NULL, 'jacob thompson', 'he is the best', NULL, 'close', '2023-07-18 13:19:01', '2023-07-18 13:19:16'),
('d6dc9f44-363d-43bf-bae8-480de688536b', '8fe09cc6-ff3c-4819-9031-26a8ff151e78', NULL, NULL, '444', '12112', '_5574f1e7d49ff5b5e51fe4ccf9eaff00_.php8', 'close', '2022-12-17 07:51:40', '2022-12-17 07:55:38'),
('dbf604b7-0c43-4259-9d30-451d14afd057', '8fe09cc6-ff3c-4819-9031-26a8ff151e78', NULL, NULL, '555', '5555', '_5e5718a27d7572ca2c51319a40d6b245_.PHP8', 'close', '2022-12-17 07:45:48', '2022-12-17 07:47:16'),
('e72e5512-dd8b-429e-960d-768bbb464322', 'a502eb20-d81c-4f3e-a56f-11444fe1e4cb', NULL, NULL, 's', 'f', NULL, 'resolved', '2023-07-02 16:16:57', '2023-07-14 18:13:09');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_comments`
--

CREATE TABLE `ticket_comments` (
  `user_id` char(36) NOT NULL,
  `ticket_id` char(36) NOT NULL,
  `content` text NOT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ticket_comments`
--

INSERT INTO `ticket_comments` (`user_id`, `ticket_id`, `content`, `attachment`, `created_at`, `updated_at`) VALUES
('6eb3595c-031c-4f55-abee-80cf6d8c816b', '3067693a-8485-4110-8c11-01cca72139d1', 'Hi', '_acb707a3c2d1ee7d332111266f8c82b7_.png', '2023-06-05 05:16:25', '2023-06-05 05:16:25'),
('b435f8f1-ff6e-4dc1-925b-e72161386d7a', '6a174f1c-35e8-4a76-b921-1006764dac2e', 'checking', NULL, '2022-12-02 10:46:59', '2022-12-02 10:46:59'),
('b435f8f1-ff6e-4dc1-925b-e72161386d7a', '6a174f1c-35e8-4a76-b921-1006764dac2e', 'Test Pasokh.', NULL, '2023-01-02 13:02:07', '2023-01-02 13:02:07'),
('b435f8f1-ff6e-4dc1-925b-e72161386d7a', '6a174f1c-35e8-4a76-b921-1006764dac2e', 'HYUHYUHU', NULL, '2023-02-03 21:44:44', '2023-02-03 21:44:44'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', '581ce0f2-6d04-41fb-ac9a-adbfffa50944', 'test', '_3954bd1fe0dcee2a0c9eff6f4e083e65_.png', '2023-07-25 13:21:34', '2023-07-25 13:21:34');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` char(36) NOT NULL,
  `assigned_role` varchar(20) NOT NULL,
  `referrer_id` char(36) DEFAULT NULL,
  `referral_code` varchar(255) DEFAULT NULL,
  `username` varchar(256) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `google2fa_secret` varchar(30) DEFAULT NULL,
  `verify_code` varchar(30) DEFAULT NULL,
  `is_id_verified` tinyint(1) NOT NULL DEFAULT 0,
  `is_email_verified` tinyint(1) NOT NULL DEFAULT 0,
  `is_mobile_verified` tinyint(1) NOT NULL DEFAULT 0,
  `is_financial_active` tinyint(1) NOT NULL DEFAULT 1,
  `is_accessible_under_maintenance` tinyint(1) NOT NULL DEFAULT 0,
  `is_super_admin` tinyint(1) NOT NULL DEFAULT 0,
  `status` varchar(20) NOT NULL DEFAULT 'active',
  `remember_token` varchar(100) DEFAULT NULL,
  `level` tinyint(2) NOT NULL DEFAULT 0,
  `created_by` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `assigned_role`, `referrer_id`, `referral_code`, `username`, `email`, `mobile`, `password`, `avatar`, `google2fa_secret`, `verify_code`, `is_id_verified`, `is_email_verified`, `is_mobile_verified`, `is_financial_active`, `is_accessible_under_maintenance`, `is_super_admin`, `status`, `remember_token`, `level`, `created_by`, `created_at`, `updated_at`) VALUES
('01bac2f0-2e3c-4116-a7fb-61c4d149a2e6', 'user', NULL, '18e22c2e-791d-40f3-8190-6cc02241967b', 'paola1', 'pao1979@hotmail.es', '+34603354914', '$2y$10$MLTaIpmV.PWytGisGRs9xuLK1bMhOpJjwDGcowYi0I7NCdcve0rHy', NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', NULL, 0, NULL, '2023-06-12 10:22:18', '2023-06-12 10:22:18'),
('04b781e1-0a41-4703-888f-468243ebda36', 'user', NULL, 'a518c5a8-3493-4508-9d9f-5723536d2906', 'amir', 'aaa@gmail.com', '+978465132', '$2y$10$B1uQ6mrW2tVxl9ZugaA/TOIql7/fIWoznhadsnM.7gzvzYTjwkCJG', NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', NULL, 0, NULL, '2023-04-03 18:33:53', '2023-04-03 18:33:53'),
('07178aa8-bbd6-4f8b-9fbf-48711485ab8d', 'user', '', NULL, 'robot.trader', 'robottrader@gmail.com', NULL, '$2y$10$ZJDVY7cUezlOrBFngKjngONo//pjf/QIncPdGBIfZtWPouHE79Vtq', NULL, NULL, NULL, 1, 1, 1, 1, 0, 0, 'active', NULL, 0, NULL, '2023-03-18 09:03:10', '2023-03-18 09:03:10'),
('07b97174-b6d2-48b5-a9a2-f8c1443eaf3e', 'user', NULL, '49c2b221-2b68-489d-90b5-6c76189b8ebe', 'Azhar', 'Xayowfarax@gmail.com', '+252612123568', '$2y$10$860Xh/f8acVaTfgVYOB2f.N50Ug0ZmFtMPbWSGwGgQ73MGxS7B83i', NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', NULL, 0, NULL, '2024-02-19 11:06:14', '2024-02-19 11:06:14'),
('09ae0ce6-3b8a-4a8a-ac2f-3919888e47aa', 'user', NULL, '203b403c-29c8-466e-bfa7-ce770dc5a265', 'keithanderson', 'andersonthebold@gmail.com', '+234 815 034 8476', '$2y$10$en4UZGAo/1DfeQi349xKEeh8r//bGF27MgFtmzBrLOVbzEXzkynxa', NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', 'PLK4fVfqEjXE0XhzmMOljtXxiY6mtCEj1cmhhdHFbyY0sLVESVTbRopGEKyn', 0, NULL, '2023-03-21 17:02:18', '2023-03-21 17:02:18'),
('12a277f5-c2ee-44a6-82da-f6f5e03758a9', 'user', NULL, '1c67c147-e1bc-43ce-bec5-5e014b2db4f3', 'silva', 'diego.silvaforex2020@gmail.com', '+584125937867', '$2y$10$QviHlobQJaVy8X78RD0U2uBz8RPuMxTstzt1IQOBfLLkVY4A5SnnS', NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', 'zqepYb9ILo2ow48JxQiiX0ZD4lDpySMYjUjcJZnxc5BWPVrKxWZ1DbHinT4k', 0, NULL, '2023-06-01 13:16:13', '2023-06-01 13:16:13'),
('1ac9db2f-613b-4351-ba36-aa8a8e502079', 'user', NULL, '1ebbacce-15a2-4c62-b5eb-010ff0118364', 'alvarez1', 'enricoalvarez@hotmail.com', '+593983083444', '$2y$10$4JOAQQ.Vxk20ymBr5q3IwuB5Xj/ygERDt8iMu3jjEfbsut7b0978u', NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', NULL, 0, NULL, '2023-06-02 16:36:16', '2023-06-02 16:36:16'),
('1ba19fda-1281-47fd-9059-c26571b6edc8', 'user', NULL, 'cbac706c-8954-45ee-8168-67858cc578d7', 'mostafa4875', 'support@Juki.network', '+989108771046', '$2y$10$jXcZ45OMIAjnvOASHYHIOuVxUME1PHKMxBT4//1CYExJJD4zVbbGW', NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', NULL, 0, NULL, '2024-02-01 21:53:45', '2024-02-01 21:53:45'),
('22fe5dc1-07ab-4809-8f56-8590c68d9ab3', 'user', NULL, '272f798c-11f9-47e3-94ce-90e0c7245e86', 'test', 'test@codemen.me', '+989331057002', '$2y$10$cMwN3d94G4sb4c/YVIl6S.IHBFJ.rApVbzs16WRd9kLGuTJutat8m', NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', NULL, 0, NULL, '2023-03-02 15:03:32', '2023-03-02 15:03:32'),
('2446118a-33ae-4cb4-8ca9-4e1c8dd68f4f', 'user', NULL, '076c15a7-2814-4e61-9143-c9e88293dfed', 'DIEGO2023', 'diego2023@gmail.com', '+573129977999', '$2y$10$5fTFZnF2.bbnAaZzeuWVPu9oDeYZxQ7oaS4kHAz/7LGv6yX78hNyy', NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', NULL, 0, NULL, '2023-10-17 18:53:19', '2023-10-17 18:53:19'),
('2ad4f58d-4cf4-446a-b767-e840add77549', 'user', NULL, '0d5160d2-06af-443a-af69-99ced68a0297', 'vural2123', 'vrlsatuci@gmail.com', '+905373195123', '$2y$10$i3skbDdVpZfzXdWgI8XJouno//SAN02t8vWQ/HjS9XfUdUoayMt7a', NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', NULL, 0, NULL, '2023-02-27 08:58:16', '2023-02-27 08:58:16'),
('3197597e-5470-45e4-afc1-0b2292d2158e', 'user', NULL, '095edadb-3492-4652-b23c-ce486774143d', 'test1234', 'mitchm672@gmail.com', '+234 813 356 4971', '$2y$10$4QunYSIS36IOgsZXr4SdGOjQXWkOmDomrf/mMD8H.BCRpA84Wgqf6', NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', NULL, 0, NULL, '2023-12-17 22:33:42', '2023-12-17 22:33:42'),
('32769d8c-4dca-40d5-83ec-99b68df4b130', 'user', NULL, '00963fa8-926d-42af-9766-3e1ff0a68bb9', 'jorbthebest88', 'appcolombia2019@gmail.com', '+573242920205', '$2y$10$W4DGj5Yn/zyt1ezXrH5D4.rmpxKiPO9TmtgK7VS3BM9Es0guS.cEO', NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', NULL, 0, NULL, '2023-03-06 12:10:50', '2023-03-06 12:10:50'),
('34d2fe8e-ad62-4960-ba47-82234f81520b', 'cliente', NULL, '490a1ed4-6efd-4f7a-9b85-8cdc378ee31a', 'jesus', 'visjesus9@gmail.com', '', '$2y$10$Z2sOCMRjVBuz.3uKFfj6teZWyglDSjt7oNkIZcTTbeJxuDneZSD8G', NULL, NULL, NULL, 0, 1, 0, 1, 1, 0, 'active', NULL, 0, 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', '2023-11-19 16:19:28', '2023-11-19 16:27:13'),
('36f5887f-2b9b-4144-879c-9be2cff7e466', 'user', NULL, 'c6342558-7d57-44ba-a19f-5abe1b611479', 'MARCIAL1', 'stansow@gmail.com', '+51952832938', '$2y$10$ZR5QtpOr2iQjnHfWeHcVQ.gIHVurGS8oZQI/8nTwfBtG6G/b2fQju', NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', NULL, 0, NULL, '2023-06-13 01:18:02', '2023-06-13 01:18:02'),
('3b4df004-bb15-4c73-b23e-f7d614f64b8e', 'user', NULL, '03be8a1c-7b68-43ad-9d1a-3ed39bc3b640', 'mramirg', 'amirloveking@ymail.com', '+989396206108', '$2y$10$Dv59FhHfIRMfuXxiYO2sP.HRvYKDnsRZb4kpU8zdrrIjZy8nu8EfG', NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', '5QrMvYQjwVJV4C9FjpIHK5bMWLTonTn0cmgEsujLdums6aQs4COxc745szHf', 0, NULL, '2023-11-05 16:40:11', '2023-11-05 16:40:11'),
('424f12e9-bdd0-4ccb-9b38-8cdb74477600', 'user', NULL, '2df5918b-4599-4fd5-8daf-e647cacf1e37', 'chuducanh', 'Vietb2198@gmail.com', '+840945906993', '$2y$10$90jGKDuGCvoDZPPjxwppXuHl3cRiZQV6oGiMZOux9.dmweo68OG.i', NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', '82owK3SOuN9Yt44BAkKXL4Jy0bdZrsNPzmF89tvHpsjmSj638KytdK3XMnEX', 0, NULL, '2024-03-15 05:39:22', '2024-03-15 05:39:22'),
('44d4809d-28e1-4685-b15c-dc11134fdf1d', 'user', NULL, '0deebbb8-5e12-4a3f-a4ea-fa199314a31a', 'jose2023', 'jlrodriguez28@gmail.com', '+34609126078', '$2y$10$ylDwM38SInkc6OA2Ri9OOuT4hzlmpjsIzFVtcjklTkT/sFiNwE4wG', NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', 'MBIH4bJwllChJtOMz37OCG4Hpil72OTpi8aKeOR1tfJoa4aO4e8cc07ljyAX', 0, NULL, '2023-07-20 09:58:46', '2023-12-04 14:09:11'),
('467671a6-55bc-4527-ba1f-d0d2b562fca4', 'user', NULL, 'fe55dad8-d4de-4b1d-a195-3faf7683a256', 'juan1', 'juanpp1928@hotmail.com', '+34677958104', '$2y$10$KT0wnVxnFuP/qe6eeppDceIkx6OAMQedPmHZQifsggupWpmw05jFK', NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', 'ZGs7Z9w2Tl4221YlWT7RygeVwIRfNmByPZAEY3ZrxWmYgUbwKlUIidvA1FuN', 0, NULL, '2023-06-06 14:15:44', '2023-06-06 14:15:44'),
('4737ffad-8afe-4bbe-9c76-9ece9d55068f', 'user', NULL, '990e94d3-e2fb-4567-b45d-681723441ec1', 'miguel2023', 'bentazirun@gmail.com', '+34649442928', '$2y$10$hnaMz41vAHhf9kNT6z6kLeNa5u02WAR7h4HCIjJ5Z36Aq2GPOUtuq', 'user_avatar_4737ffad-8afe-4bbe-9c76-9ece9d55068f.png', NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', NULL, 0, NULL, '2023-06-14 13:49:44', '2023-06-14 15:15:43'),
('47dea59c-e88d-4c15-ad52-fa0dc6de1631', 'user', NULL, '0052e5b4-1324-4a2b-84c2-78f3359987d2', 'kojoe', 'errtoo5@gmail.com', '+959789175335', '$2y$10$5i2wFQLUEafl0QoFp/mM8OAP1g7D/flHJARgoMZQ5OsxBr49OXghG', NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', NULL, 0, NULL, '2023-10-25 04:43:52', '2023-10-25 04:43:52'),
('47eaf168-5901-4ccb-8b9c-d7f9c754ed04', 'user', NULL, 'a84bab36-ea40-4aca-af39-b4cf5c975765', 'jorb2023', 'paypal.appcolombia@gmail.com', '+573242920203', '$2y$10$0GVyZvx8BM6vU3hCjHo8SuyGJzOk0jCqZbsJNaYxoRLRpqwJ1QN5C', NULL, NULL, NULL, 0, 1, 0, 1, 0, 0, 'active', 'WwvZ2uH7Yz12TULzaX3M1h0bQfELH8H0FjWq82RVLx04zp2odTV5DOEWHsRF', 0, NULL, '2023-05-31 10:02:57', '2023-05-31 11:32:58'),
('48073e55-f172-4b10-b11b-7203b2b5dbd1', 'user', NULL, '08299d4d-9fbc-4e45-9957-d97d9932d4a0', 'Sansan222rus', 'Sansan222rus@gmail.com', '+79831898159', '$2y$10$vm8RpCSbVseKRHvlaXRBwu/vzB9lNY0Ej6Gne3kls4vIdRocOCpp6', NULL, NULL, NULL, 0, 1, 0, 1, 0, 0, 'active', NULL, 0, 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', '2024-01-22 03:33:47', '2024-01-22 03:33:47'),
('48ace508-5a29-483a-92d6-e1dc362baee8', 'user', NULL, 'ecb24565-a12d-4b84-a39d-6bfe426601f8', 'azartheme', 'azar@gmail.com', '+989911893829', '$2y$10$DumAhDbLyWanIU58KDUZuOVDwruFUOQIarGpfqd8t/8cDwaBEAMFy', NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', NULL, 0, NULL, '2023-04-20 03:57:59', '2023-04-20 03:57:59'),
('492e02b7-cab9-42f2-9b42-6a6d373b2e24', 'user', NULL, '832c1c7d-2daf-4d73-b68f-93da77fdab53', 'charley6', 'charles@icloud.com', '+14806452142', '$2y$10$Eujf6qoyP9A2hzZj0lctxOLr5xDkiqD37GwOOXmenVBhvwJc4zTJ2', NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', NULL, 0, NULL, '2023-03-12 20:45:35', '2023-03-12 20:45:35'),
('52523c96-98e6-4e75-a1d8-e3cf094993a1', 'user', NULL, 'dc3db7d8-1c00-4d75-9662-bd4adfd8455d', 'dgarcia', 'dgarcia@yopmail.net', '+34620339211', '$2y$10$k6oI.52s86kZqqf6FwcxUuGOS3vfowy0JFFxp6TpnSUSCT1KepZQa', NULL, NULL, NULL, 0, 1, 0, 1, 0, 0, 'active', NULL, 0, NULL, '2023-08-20 08:45:28', '2023-08-20 08:46:00'),
('54bf8b4a-15aa-4277-9cee-3de49dd47367', 'user', NULL, 'edf68c36-de4e-43d0-991f-95cdfa05dc35', 'jembot', 'jikasusertani@gmail.com', '+91888888', '$2y$10$mYvORO3t.9dHFGy2m49s8.7Nbt5DjQxLSlIGvjtjCtZlfUAhZN2tS', NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', NULL, 0, NULL, '2024-03-15 06:54:18', '2024-03-15 06:54:18'),
('557a1889-0d7e-4e8c-a314-14e6c4004ee3', 'user', NULL, '2cff0fbb-bec6-4902-8589-8e6d4baf7d2a', 'Tester', 'test1234@trademen.com', '+234701234567', '$2y$10$WW6bp1wRUgbmxWhSnCkt5uDmwSIWhSYcHmctiP.x6nrLcXRhrXfQm', NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', NULL, 0, NULL, '2023-12-15 20:53:09', '2023-12-15 20:53:09'),
('57cfdde8-b3bb-4020-bd29-83cc9575bdcf', 'admin', NULL, '035be1a6-4e1c-4158-8f1c-2fb6c374f021', 'fxinvestpro2023', 'admin@fxinvestpro.com', '+15012320237', '$2y$10$HF.xolhewMMkRaVx2idlUOw0zZaw4SeBvVjXQCw0uHqWbV.d9gjdG', NULL, NULL, NULL, 0, 1, 0, 0, 0, 0, 'deleted', NULL, 0, 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', '2023-05-30 10:29:47', '2023-05-30 14:26:23'),
('5a03c1e3-f18c-41da-b6c6-d372ca6ade8c', 'user', NULL, 'c25f8aeb-4cf1-4477-b1a3-7bd4cd54f1d3', 'a5yearold', 'cryptoishy@gmail.com', '+16475888484', '$2y$10$IBe3njNux11t/1/YoxFfledlR/kPC7c/ls2STo4bSBI71CnXfvOm2', NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', NULL, 0, NULL, '2023-03-03 02:19:35', '2023-03-03 02:19:35'),
('5b4cd7b8-8ae3-4a91-a25b-cc785c061b14', 'admin', NULL, 'd6348a3c-ce6e-49ff-ac39-2e7b56607ef6', 'adminpro', 'info@fxinvestpro.com', '+57 324 2920200', '$2y$10$zIM/flG0CnQFKt5U.WEmNugm/BKxF2XK.qWk4O8eQmFSvC1o01sFq', NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', 'OHoFd5hybc2idZBXIXktzQCOb234iU6HPu8tpp2GZjv4DU1E6d8exQ6nSU5n', 0, NULL, '2023-06-05 10:54:16', '2023-06-05 10:54:16'),
('5e5189aa-f3b7-4e90-ab71-48eb3d97bf08', 'user', NULL, '44b362c4-b48a-43fa-8ac3-2040d0343ed8', 'sskumar', 'skumar@gmail.com', '+917428459401', '$2y$10$Eq1Hjv7TANmp097m9raROOpTLrZLOSxS3XIN9YCOu3Eh65I9qaC7S', NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', NULL, 0, NULL, '2023-04-29 11:33:51', '2023-04-29 11:33:51'),
('60145862-0641-4106-af67-8de47b916abe', 'user', NULL, '4e676b2f-b86c-47c3-90fc-c8c226e2b467', 'Favour2023', 'josepefre@gmail.com', '+34666437980', '$2y$10$AIiC5iagfYGfeh972Qf81.STu6M0wCYW8LZ/pFYhKOP.sXdPeaM/K', NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', NULL, 0, NULL, '2023-06-05 09:54:36', '2023-06-05 09:54:36'),
('625c7cbe-2e20-406b-911b-a8ae59dfe2fe', 'user', NULL, '1c923e63-9056-45a5-8158-24c971cb84bc', 'mmdrexaaaaaaa12', 'mmdrexaaaaaa12@gmail.com', '+49823828242', '$2y$10$eTnavUSXtMCPOuay0B.ZjO0EiPplKwbkABq.QP2g8Cra5y/MGpOZa', NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', NULL, 0, NULL, '2023-10-23 07:09:31', '2023-10-23 07:09:31'),
('62cb835b-6592-459f-a2e4-f6dc5b7ac7f1', 'user', NULL, 'c4b8d692-3ad4-4b9b-aeb6-644201c4371b', 'babash', 'npokypop@list.ru', '+901234567', '$2y$10$osnxVJsY3F8H0O8/wNcXTeM0BuEI/Xk4o/jYXgpPq4gO/sw9l1C0i', NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', NULL, 0, NULL, '2023-03-21 19:12:27', '2023-03-21 19:12:27'),
('66a1e840-7ddb-4a17-988f-da8c948dc2a7', 'user', NULL, 'acb3571c-65c0-4bf7-a05d-b3eaccebcbce', 'alireza', 'haj.akbaraeesi@yahoo.com', '+989385348617', '$2y$10$imh8Go/fD0UcZzC8XzMIVexScRGLerHPJulmppvsSOgWzgOhy2RbS', NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', NULL, 0, NULL, '2023-03-11 10:39:55', '2023-03-11 10:39:55'),
('675d5181-9662-4d5a-8e29-924e2b58b24f', 'user', NULL, 'cf091bb8-5d44-441d-b181-b50beb66d1da', 'IGNACIO2023', 'ignacio.ruiz.rdc@gmail.com', '+34687799519', '$2y$10$NnMWvLL16N54NbX58ErCZu067JuU89.Bz/4Sw0mfOqhsfyyf.sd7G', NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', NULL, 0, NULL, '2023-07-25 15:39:19', '2023-07-25 15:39:19'),
('6800875b-c059-49a2-aec7-8612c7d402a1', 'user', NULL, '9279b359-d419-430a-8712-67ad2e10f577', 'feihong', 'feihongengr@gmail.com', '+13152353054', '$2y$10$oF0TULQXjODd1fZGDnTvB.F3zMywBalQs3pbBdftbvgyWAfwwDUCW', NULL, NULL, '36711', 0, 0, 0, 1, 0, 0, 'active', NULL, 0, NULL, '2023-09-09 22:04:27', '2023-09-09 22:04:27'),
('6b45b07e-0969-4bae-bd21-fc7e7597ef8d', 'user', NULL, 'abfe68f4-db9f-4b5e-8ace-e388e0001e6c', 'papadim', 'costispapadim@gmail.com', '+306932454266', '$2y$10$TGrnqwIokvAMYwKU2WMB5ePAwgUzsJZpoeH72pAyPeysug97vAA9G', NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', NULL, 0, NULL, '2023-12-28 09:54:53', '2023-12-28 09:54:53'),
('6bb43481-d32b-4038-9358-85a962250b5c', 'user', NULL, 'fe86cde5-3fb1-479b-a3da-edd2ae1b4144', 'kinda', 'kindahall@gmail.com', '+33760387123', '$2y$10$629tG.UP2FDkguUctQJn.eIxsJzJHbdJgEMY82avOxUVKFZNj7RWq', NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', 'bPB2WeR3GuDo4rpM6eCmrosifMZEK3wK6ARHQVIZdJxXUqHcjJZXBfNyuRRw', 0, NULL, '2023-04-29 08:37:43', '2023-04-29 08:37:43'),
('6c2de49b-66b3-482d-bf48-8b690f86deff', 'user', NULL, '26cdeb6c-df56-4080-8e07-3be9ca496331', 'rahatitltd', 'rahatit2017@gmail.com', '+8801739456494', '$2y$10$hPRR2DCSguUTNqeQA4GhEuTEttgE4TFIoaLw2dKPANuK3x6qdvoxO', NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', 'TOtLOZbuz1F7RwNVBlgTlFKqIMsfbglrJOHUD5y5Mnc5wccEUVBXuO6zWIvS', 0, NULL, '2023-12-11 08:46:05', '2023-12-11 08:46:05'),
('6c9d2b9b-812c-4ba7-9bbe-66d940eaa5bb', 'user', NULL, '51cda47d-8a06-4206-8609-0ee14345dc29', 'deadman', 'sarayi.cactux@gmail.com', '+989182861738', '$2y$10$yox4Kh9H/DHboMWdzqhUquOSNsWGcpLCk2mkTVRMzaxIePIzOB7b.', NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', 'GVRoZsEiHYYj84AGPOjqoNkt238zl2apOpmhnmLvG5b499BywRCMEf1YNGV0', 0, NULL, '2023-04-05 10:38:05', '2023-04-05 10:38:05'),
('6cd1a9e7-a910-43c8-a930-95dcb2c8edca', 'user', NULL, '3666ddc0-8e18-4c5f-b9b9-55391e57a017', 'Higinio2023', 'gino1679@hotmail.com', '+529841663943', '$2y$10$cDyYGj3ouysrV1siz09mgOx0wdnSYkRaIUEkKzws.rXO94gH.uU.e', NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', NULL, 0, NULL, '2023-08-07 18:13:47', '2023-08-07 18:13:47'),
('6dd2b333-abab-4c57-b4f5-d33e4dd70f39', 'user', NULL, '925de5b4-7141-48d8-8f67-17b1011f722d', 'Dani2023', 'daniela_9229@hotmail.com', '+529241155805', '$2y$10$v1dtxOCYt1A8QEHKWphl2eEf3ORdY0NrYRtPBIcw1Z5yZlYu26F7K', NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', NULL, 0, NULL, '2023-08-04 16:40:57', '2023-08-04 16:40:57'),
('6eb3595c-031c-4f55-abee-80cf6d8c816b', 'user', NULL, 'fec42e78-358c-4551-b0fe-e8ea3333d980', 'admin', 'admin@codemen.me', '+989131057001', '$2y$10$.HuXdYPMX7JgI4c..tK.TurF4gVZCpUJCk/C4Mk0Oi3q4vnfa5JMe', 'user_avatar_6eb3595c-031c-4f55-abee-80cf6d8c816b.png', NULL, '59462', 0, 0, 0, 1, 0, 0, 'active', 'OW9Wb6QgygxsVrBVli77ETyiVCmToNYrVte9DjNgmCd4r7S6BoS1ZtkJ9FK6', 0, NULL, '2023-03-02 14:56:34', '2023-09-10 14:58:21'),
('6f1ba6d2-22bf-4291-977d-534ac1aff4d8', 'user', NULL, '7b4ae337-904a-41b1-b8c1-62542865e38b', 'neilcarlton80', 'neilcarlton80@gmail.com', '+16336426326324', '$2y$10$zdiyWg.h6XEx85tNcKrRa.tLi35nIN7g8BbyU/CMTa8bZI1dByst2', NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', NULL, 0, NULL, '2023-12-24 08:03:47', '2023-12-24 08:03:47'),
('7109c567-63f7-4d17-a2d5-a518e560408e', 'user', NULL, 'e187ab2e-a4d1-4c77-9aff-dc7d911fd5d6', 'eliezer2023', 'eliazer145cerron@gmail.com', '+51932692060', '$2y$10$ARA58mcnxO5i0KH6htANIOs8t9YPb1nJ84g6dENAcBYeh.ycOSxF.', 'user_avatar_7109c567-63f7-4d17-a2d5-a518e560408e.png', NULL, NULL, 0, 1, 0, 1, 1, 0, 'active', 'ZkGXgFpL2HyyVoSeMGfY79CEHmPkQaMMKzaBMi7srQbJUTjWOtbbrGce7hRv', 0, NULL, '2023-08-03 17:57:26', '2023-08-11 13:41:15'),
('794254a9-ab67-4e67-8f36-861c423c29a8', 'user', NULL, '5ee4b354-f2cb-4969-b1d1-13d9e11903fe', 'mos-kh', 'mos.khodaei@gmail.com', '+98091712345678', '$2y$10$C5fpmrKO1K0dkPrkPMgxMuYySXf11NIL3OdvA3jw9pLmyNQof94ha', NULL, NULL, '30067', 0, 0, 0, 1, 0, 0, 'active', NULL, 0, NULL, '2023-09-12 02:41:44', '2023-09-12 02:41:44'),
('7b621b7c-6760-4430-9a30-10d8134b442e', 'user', NULL, 'c823f809-e180-4d23-af54-a71e5af5b467', 'mmdshry', 'unshields@gmail.com', '+98 919 075 5375', '$2y$10$9iOFRs/kknKr2KeB8t4BH.7LamU9OdQoz7QYWOKU5s.5H.Hiobwse', NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', NULL, 0, NULL, '2023-09-18 09:41:17', '2023-09-18 09:41:17'),
('7cde25b7-e520-4fb3-85df-f5fcf89305d3', 'user', NULL, '9890b8e8-971f-4def-927a-b70bd824405b', 'fuentes1', 'FUENREAL@HOTMAIL.COM', '+34635539895', '$2y$10$gKtijTG5xTcjR3/hEABkveaU3U0.8FIr2Inu0zT8JJra5TMUGA7/6', NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', NULL, 0, NULL, '2023-06-09 13:43:35', '2023-06-09 13:43:35'),
('7db45872-7279-474d-aa0d-d56723822162', 'user', NULL, 'a3592a92-1d6d-40d1-9af7-ac85d5bfabad', 'nahen48942', 'nahen48942@utwoko.com', '+09130899098', '$2y$10$cGuddE3mZGQgHRey/rM3qeeuu9Wu5KvF8z7mDlXyisMschhKhDguK', NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', NULL, 0, NULL, '2023-09-19 09:16:09', '2023-09-19 09:16:09'),
('8208d769-48db-4e2f-8831-f48ead232203', 'user', NULL, 'd41dc12e-ea01-446b-bdff-fd0d445e559f', 'bbbbbbbp', 'tipok32701@cyclesat.com', '+9856554857', '$2y$10$c275PtbAPFQet5TbiXgrnOhqmEwxqTjgr52V.gBj0jF3zppX2thEW', NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', NULL, 0, NULL, '2023-04-04 15:53:03', '2023-04-04 15:53:03'),
('84344fd1-cc94-49dc-9872-21ce71be3f99', 'user', NULL, '4a4fcf4f-800c-48a3-bc2e-3b4540fc2e6c', 'amir20', 'amyrbdyy207@gmail.com', '+9809916928411', '$2y$10$IMZlGsHHqi/SFNdk2NkEeOisQesIuEBEXH4PepsYSjVV1JTnpqCIy', NULL, NULL, NULL, 0, 1, 0, 1, 1, 0, 'active', NULL, 0, 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', '2024-03-05 10:54:42', '2024-03-05 10:54:42'),
('86f3c2c9-e4c3-4192-ad1e-d34a6b188833', 'user', NULL, '469b5a22-62ab-4700-9c12-5b9c1400ccaa', 'raquel78', 'raquelcermeno2291@gmail.com', '+52 665 653 5405', '$2y$10$tXGAPU6ktSNq4O7BsWOCTeArVTlhwUIE4e.KJwSCNPG6ThS3Hkr7O', NULL, NULL, NULL, 0, 1, 0, 1, 0, 0, 'active', '4YBLZp1T550ON8iq1CSObXIKlCxcU7JYcPZ8N7GJvVsYL0CxIH8cOJ4sQVlo', 0, NULL, '2023-07-18 20:16:27', '2023-07-24 20:29:59'),
('88f8082d-7f6a-44f3-8782-d0be24853117', 'user', NULL, 'd3c322ed-9aa6-46b5-83a4-167ae91b3bf5', 'mojoudi', 'mojoudigsm@yahoo.com', '+989121774168', '$2y$10$GPozALaHtOa3BK6yun58qurTLw1weqeJ1Uc.RAsMKr0lzvYBlV1d6', NULL, NULL, '98569', 0, 0, 0, 1, 0, 0, 'active', 'eXUXbdVXfrcMdRUjCi5jNivNoGrmYk35CYGBMtdNbv1qYWj6dIa3HJQa9S7G', 0, NULL, '2023-09-10 14:17:32', '2023-09-10 14:56:12'),
('89e4087c-1287-47c9-b101-f87da3cd0acb', 'user', NULL, 'bcbd2874-3776-4d07-a929-05269467d85f', 'nariman', 'tccgsky@gmail.com', '+989393311097', '$2y$10$8oYv.IhMbPlbdfLMvH8zPOfwgYAjIwWfbGUR8uVtCSMVtG0cyJSCe', NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', NULL, 0, NULL, '2024-01-24 06:50:23', '2024-01-24 06:50:23'),
('8bc2d325-279d-4cb5-8245-87e524f33587', 'user', NULL, '283a6596-7a2a-48bc-a201-944829df5a64', 'bbbbbbb', 'momino8792@cyclesat.com', '+9856554858', '$2y$10$Ug75NGTwljqmua2pQB2fzeUQUtUFLUUFmlxve4dMZTgUO/KtIXmxq', NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', NULL, 0, NULL, '2023-04-04 15:34:21', '2023-04-04 15:34:21'),
('8dec10ce-9070-4fa3-b678-2ce86b550204', 'user', NULL, '0618fbdd-e248-42ed-a982-8eb9a12ec152', 'eaisdfsfj', 'mohammadebi385@gmail.com', '+9899005478', '$2y$10$l4UX.9VU/ionQcbXCMjOdeYSay8zMO0xS/ES7g7OqLh3b0nJ2IKqW', NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', NULL, 0, NULL, '2024-02-29 07:35:48', '2024-02-29 07:35:48'),
('923956af-60ea-40f0-8065-aac5c4fb3791', 'user', NULL, '8721aef4-cd09-4ce1-a320-6ea879de3009', 'jerryk', 'mysaviour256@gmail.com', '+256789290280', '$2y$10$KN2MUxnWa9zRauXkiicnhea5PsR/97PwlrPwI/35.AM8znp7VT5ym', NULL, NULL, '63617', 0, 0, 0, 1, 0, 0, 'active', NULL, 0, NULL, '2023-09-14 11:32:26', '2023-09-14 11:32:26'),
('933d676a-c435-4697-bdf2-e54d026c156e', 'user', NULL, '957c41fa-f9ed-4589-8624-0f944ff18786', 'alireza1', 'Newpm1978@gmail.com', '+111111111', '$2y$10$1RNwOqG2iPKbAkzeT8gP4.42qRFgHvSpwjIE/hhEMewIj8ML6pexa', NULL, NULL, NULL, 0, 1, 0, 1, 0, 0, 'active', NULL, 0, NULL, '2023-05-10 05:25:49', '2023-05-10 05:26:13'),
('934ad33c-0304-4461-b0e5-ba8b3ca61ca1', 'user', NULL, 'af903c91-5425-436c-a8a5-7c7e83098ff8', 'jorb8888', 'jesusrengel88new@gmail.com', '+573241514478', '$2y$10$UAbSDiCCwRvti9AtGYTdK.dsgdKD9Z5nPgDlI12OHCyh66eNfc3mq', NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', NULL, 0, NULL, '2023-03-06 12:12:00', '2023-03-06 12:12:00'),
('96f24f53-91db-4ab4-80ae-589139774970', 'user', NULL, 'db87dfef-5b27-4ebf-9083-c71350a0c18a', 'test123', 'user@email.com', '+23470123456789', '$2y$10$GL5qqUP2jzVDzRlwc0AI9OShpWogQXXtTYHTbMEa33QyhfaW2KBZG', NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', 'oVFJe2NNLfrM2QNAwmgzArwGzaFVxB9h224AOAFOUJnErwRLkHyiaGZzVwdy', 0, NULL, '2023-12-14 07:45:24', '2023-12-14 07:45:24'),
('98697609-12a9-4415-a700-07de18f31ba9', 'user', NULL, '1e83df40-4fc7-4271-918f-b737dbd0555b', 'jesus12079', 'mnyt5-er4r@hide.biz.st', '+573232243546', '$2y$10$3sWEi1EHwNIZwMgRuo/kruilPkcXjMYnfJNpjmX7m0BU3nm3e9CPO', NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', NULL, 0, NULL, '2023-07-18 08:34:19', '2023-07-18 08:34:19'),
('9ac62313-2179-4a80-8dcd-add2bba979e3', 'user', NULL, 'e7214df0-4a70-43c5-bb83-08bca95da3a4', 'polysakv', 'polysakv@gmail.com', '+1245022374', '$2y$10$sQ6pDhJDEgSkGNMTRukVg.WbuvT0bIGZZO2qa3YfJzOstxNPDee3u', NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', NULL, 0, NULL, '2024-02-29 22:36:58', '2024-02-29 22:36:58'),
('9be6a33a-4881-4556-a74d-41b341fbb550', 'user', NULL, '9fbd2e57-71af-48f9-8d36-b4c4674f9365', 'luckbox2019', 'luckbox2019@protonmail.com', '+439429948294', '$2y$10$PXhxEeTmpyjyz2zZqxgXrOGsTnqG6cv4Mj20tmKIbtDkES8yhXGZ2', NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', NULL, 0, NULL, '2024-03-04 17:14:49', '2024-03-04 17:14:49'),
('9e207066-ad6c-4c73-b26a-22142f5d6eec', 'user', NULL, 'fda87ccf-a346-4f22-91ab-a4b905b64be1', 'JOSEMAN', 'iskonzept@gmail.com', '+34665846017', '$2y$10$ds8SnN68L0rbRpYBFcTw0.fgfg2bAbyB9guuqewvr0fO6UC4iZ/ey', NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', NULL, 0, NULL, '2023-10-23 14:18:32', '2023-10-23 14:18:32'),
('9fad722d-6b02-4504-b431-ed6f14b20847', 'user', NULL, '32593226-8038-42f2-99cb-6b411f53a4a5', 'amirrezaeee', 'rrralirr1234@gmail.com', '+9636963266', '$2y$10$e3tV8LULwvif/ZJtW2GYj.XuJsWiSkzwrnREvQkRdUnbxFmsO2mp.', NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', NULL, 0, NULL, '2023-04-03 18:13:42', '2023-04-03 18:13:42'),
('a01cd4e5-4cbb-48ab-bfde-2b558ab60d88', 'user', NULL, 'a809baf8-8b37-4031-8fbf-f4d4b40dd696', 'eduar2023', 'eduaralbertopg0202@outlook.com', '++34695035298', '$2y$10$rMt1Ol3hNXaMfwEl1gOygeBt1PJpOHRzvhbXBlt3ZF.fX9S/tYVmG', NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', '03uI4UJbFtzUozXeAhDZgW0eS9Cy3mRBaZRer5HgzBOJy0UBU8f6vA2hxhuS', 0, NULL, '2023-07-20 08:02:36', '2023-07-20 08:02:36'),
('a502eb20-d81c-4f3e-a56f-11444fe1e4cb', 'user', NULL, '8c8d78cd-e9f3-49eb-80c9-f268874fd8cb', 'user', 'user@codemen.me', '+989331057001', '$2y$10$v1zEtY5W8tSFlGIU8oJAceeoAslOaW4fSlQgzk6F0wJziUKncObSC', 'user_avatar_a502eb20-d81c-4f3e-a56f-11444fe1e4cb.png', NULL, NULL, 1, 1, 1, 1, 0, 0, 'active', 'C3q8nW8a5cCIunI7WAzDnhFpSUwmqMtK5BbGHxCQPzoWx6pRLua6QnoSQOzO', 0, NULL, '2023-03-02 15:01:25', '2023-09-10 15:04:04'),
('abe08840-cedb-437d-9054-f6ca53045f5d', 'user', NULL, '9b9d061e-1354-44b8-b033-f3f7e4fd2aeb', 'Iceman555', 'mitchm6722@gmail.com', '+2348035209144', '$2y$10$GEmgO.6XJQ4dxZiL4t3NJOyg3Q7PCvdjhIsoF.YRnNL4thISOAj.i', NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', NULL, 0, NULL, '2023-12-17 22:28:23', '2023-12-17 22:28:23'),
('adc69fe5-342e-4db7-83d6-1aa6b50e4217', 'user', NULL, '0b327546-c401-4e10-8f45-e3ba373644e9', 'Jorb1988', 'app2025tube@gmail.com', '+573232546677', '$2y$10$rGi.Aaovw1U0yym6CLbTNeU6JZfI3xUxKuYL0ZUgt8Y9fV135D6tm', NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', NULL, 0, NULL, '2023-04-21 13:12:52', '2023-04-21 13:12:52'),
('b5ecfddf-3c71-4e11-912e-2712607bddef', 'user', NULL, '7fdcbca4-3997-445f-83f3-15436b5ee6aa', 'Abcd', 'onlinebiznes7@gmail.com', '+491231231234', '$2y$10$6yQC8XmbgHUXuyv6ByILleyf0p.nB/1l9VZAbk0iecTq/ynUuZLKy', NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', 'yZsCyQQfPIFhMAqR3DAUhuuwH9dOrxNrLX7ku1AYl7OaUX5l5npC93tfDVkd', 0, NULL, '2024-04-09 17:09:57', '2024-04-09 17:09:57'),
('b9ec7d63-015c-4814-b253-eb1d45eae4dd', 'user', NULL, '9d7d7780-b94a-4de5-8716-d8ac17ffc0bd', 'useritest9090', 'Ttt@tttt.com', '+383 44 123 456', '$2y$10$qcXRIOjhb7SMcBeTEGXr6OYWWzhHFnFRTVFJ3on6A8/y8NrLEhyYi', NULL, NULL, NULL, 0, 1, 0, 1, 0, 0, 'active', NULL, 0, NULL, '2023-06-07 13:12:27', '2023-06-20 13:48:53'),
('c034dc12-2661-4cd4-b118-febdc33c27e6', 'user', NULL, 'f80ce5ab-5798-4c77-8f4d-d76bde0d10e2', 'CAMENFORTE1', 'erika_erika2015@hotmail.com', '+34669058188', '$2y$10$yQ2tVSd1FB4sUjn7A6xJG.ABvsyxwj6BVdwclX2miHwWKy8jjqWOa', NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', NULL, 0, NULL, '2023-10-04 10:27:03', '2023-10-04 10:27:03'),
('c275436b-9379-4114-9770-9e6d376488cd', 'user', NULL, '941d6a44-4432-4f21-b845-447a18e16423', 'usman56', 'muhammadusman5649@gmail.com', '+923127093849', '$2y$10$0wJG4VLZFbHhEERvra/x2eFGW02i7skg2pArrm8qSvlnFdfl6L0s6', NULL, NULL, NULL, 0, 1, 0, 1, 0, 0, 'active', 'egTpZCcsmn8hYJTTXXSoEUgDbftzo5eYDK74qCjBRbUTY9TwIXL4akZtFvD5', 0, NULL, '2023-05-20 11:07:25', '2023-05-20 11:08:53'),
('c71eeafd-849d-4cb7-8275-1ebcd9ac93d8', 'user', NULL, '853941f1-7fd8-41d7-933b-9abd42489614', 'escobar1', 'daec22@gmail.com', '+50371607345', '$2y$10$cKW7T8odffRKZ7L/n/9j2.ggiIG2Q41MIy7Sn2irRaGSEnCLUMppe', NULL, NULL, NULL, 0, 1, 0, 1, 1, 0, 'active', NULL, 0, NULL, '2023-06-04 15:02:20', '2023-06-04 20:13:10'),
('cb74f45c-280c-42fd-a06e-a4672280c040', 'user', NULL, 'edab8925-fc81-4f08-8d96-20ed360a7dce', 'MUR2023', 'Rmumarcos@hotmail.com', '+34678536401', '$2y$10$OFvhdtZsoRhL/Rqt45MmWe8rtozNrpAiHQwoJ174aaHi9oy8Iubrq', NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', 'tEvtX8I9GyYX5br4mqLgV34CnwaGF86PoYktZ8qXgqTtZ7fSQv5IYoY0eskU', 0, NULL, '2023-07-21 16:30:06', '2023-07-21 16:30:06'),
('cda51314-c8fb-414d-9f56-fb848e43077a', 'user', NULL, '5ad55285-7b94-46ec-baba-ad3cc90a4635', 'jasmine', 'tastimoltu@gufum.com', '+9196325874101', '$2y$10$eiZBA3AgUddL4gSrVHxsW.l4//f6m0ge7QlGMBemMvepDyYMRUc3G', NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', NULL, 0, NULL, '2023-09-18 08:28:42', '2023-09-18 08:28:42'),
('cdc7f9c6-150b-4b90-bc4a-8ce2f71f5c83', 'user', NULL, '25e148eb-d628-4228-bce5-0703309edc63', 'baeza1', 'diego.silva@gmail.com', '+52 665 199 8781', '$2y$10$UgE/KtHnoR5X/stYWB/mwedl3H1SBfzN7f80DdQgOumOlwU8yyQ1q', NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', NULL, 0, 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', '2023-06-01 13:06:38', '2023-06-01 13:06:38'),
('cf37d061-aa9c-460d-9701-66439afc812d', 'user', NULL, '232f0705-9d05-4e51-a076-29c4cb52b17a', 'marinieves', 'nievesmbrion@gmail.com', '+34680359005', '$2y$10$Fb2ZHdAUadJHEKsgQjB0eevmYMnmUU2FjVJ9BrhpxiL2lr6fVlFZO', NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', 'kkUoa3GkA3P5tbIIDy3Wxlyl4g4Re1zAMIuDslnsfiCm1x2yZxl4HkuPfkB6', 0, NULL, '2023-06-13 13:21:15', '2023-06-13 13:21:15'),
('d2b09976-3be3-43e8-81ef-d0dd81784cdf', 'user', NULL, '1fdb0890-f054-42d9-9268-7228e21667c4', 'Monica2023', 'mkeller@empuriabrava.net', '+3465598677', '$2y$10$zKwVDiFUOw8i6x4S9LE8X.D5BCjg0JTXiei6pPPtvwY8uh5Vyue0C', NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', 'd89F8volXcHfRgTo09yhaMEo8BtFjjQsCqe3yZGG5csaGgPjd6fZ4GKib6iV', 0, NULL, '2023-07-26 10:01:28', '2023-07-26 10:01:28'),
('d6ac746d-90e7-4a93-981d-5602b6324d4f', 'user', NULL, '853126ef-642a-438d-9196-4475b6dd10c5', 'gkbmarcel123', 'cl9312948@gmail.com', '+113262008946', '$2y$10$uCLrm6GpzAZzA4W0wG81luWu6HWytRJbYP.YBXe0HrJlyVkBrBc7S', NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', NULL, 0, NULL, '2023-09-29 09:43:08', '2023-09-29 09:43:08'),
('d72e5177-9169-4d3b-a805-aa9a45da9c32', 'user', NULL, 'b05e5cff-7e5c-478f-b2e5-a0b7f36d4b01', 'aurelio2023', 'aureliomannque60@gmail.com', '+34608724954', '$2y$10$zdxYF0F4HcaLux5UMJ8txuTAed/SIU.BK63iYMSCBXRkSYDDtUC8e', NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', 'QuqxPmTt76w0ExYAlThDhaN51V1tV8UylPbp7d2CjJs2bWRURrvUu9Fh0Kfy', 0, NULL, '2023-06-05 09:35:46', '2023-06-05 09:35:46'),
('d7b4541b-1859-430b-889a-ed2af56aaf85', 'user', NULL, '6804a8ad-5a78-4142-b428-c5cf512fe870', 'AMIRI', 'hoshnma@gmail.com', '+989916928411', '$2y$10$LFgdCKCbgTC8G/32UYklIOnaxQ0HqWlfDqEVCsTCazczUIqy8ttM2', NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', NULL, 0, NULL, '2024-03-03 13:00:28', '2024-03-03 13:00:28'),
('d7ce0527-5843-4fd4-9253-ec190e726a4a', 'user', NULL, '38fbcf9c-3e53-4882-9930-5508293adcd0', 'luckyman1aaqaz', '45crucial@desertsundesigns.com', '+919876543231', '$2y$10$AoCuloLMP7l1KDhy6hAfneA.dHkhymgfskkmZW9QevpLkmulEOdGu', NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', NULL, 0, NULL, '2024-01-07 08:46:06', '2024-01-07 08:46:06'),
('d86b3a4d-3a57-426e-8e1e-95a6be996bb5', 'user', NULL, '3f77eeba-4cd1-4aff-986f-f22c8477407d', 'banfa2023', 'banfasuso1@gmli.com', '+34605168186', '$2y$10$K5h8qfjMAPEnDn/A7FwP5.HmvrYu6UtV8vsH1G/UXoTWUKZpIntnC', 'user_avatar_d86b3a4d-3a57-426e-8e1e-95a6be996bb5.png', NULL, NULL, 0, 1, 0, 0, 0, 0, 'inactive', NULL, 0, NULL, '2023-07-19 11:01:40', '2023-08-16 12:33:16'),
('da77601a-40e5-4bb1-b584-2b82bd26370f', 'user', NULL, '917fcded-5303-4307-8855-d1eea51d91f4', 'test2', 'test2@gmail.com', '+98 913 105 7006', '$2y$10$qpU8odwU3jt3jjamP5Cij.JBM8oXItr7nrbuxRrs1oFbJbtw5A3aq', NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', NULL, 0, NULL, '2023-07-18 04:32:54', '2023-07-18 04:32:54'),
('db5d841b-d90a-4437-957a-c7fb5fa86319', 'user', NULL, '015ec233-0599-44c6-8b49-990e016ba2e0', 'momoinbkk', 'bob26job@yahoo.com', '+989212829558', '$2y$10$b4K46szZclw4skblEiLVM.p.KPCbWzBFTsvRxbF/g.PGJR1HcOPga', NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 'deleted', NULL, 0, NULL, '2023-05-25 12:50:06', '2023-05-30 14:26:44'),
('dff7716d-646f-48ee-8d87-a1f8461230d9', 'user', NULL, '3aa7dffb-b3a8-4c78-aa0d-5979f18f5563', 'faikcan', 'aeddeooki@10mail.org', '+9055467821', '$2y$10$kQeXZHF4y/57.ixDpH63SuzLvLxTqojh9ZNXJeaXehYIAC/B9WWIW', NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', NULL, 0, NULL, '2023-03-30 10:13:16', '2023-03-30 10:13:16'),
('e18c768d-25b2-4d22-bf2c-1a9115c7ec71', 'user', NULL, '2365e69a-9159-45f8-b8da-9f3915d9b340', 'dgfchjm', 'gfhjkl@gmail.com', '+19995895565', '$2y$10$fE0XK6RjWnlHwEgWpcdHGOGFL5.ADqhbffCIkPiSMlfUg02IsIMG.', NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', 'eYB5lXEgYSF1MWo1qVxU0BOZuboPC8aTuzLL3XAKI1s8ZDqcbHQNc4yylNHk', 0, NULL, '2023-03-02 08:49:16', '2023-03-02 08:49:16'),
('e5720c7b-8502-4a3a-9ee9-8896436a41d4', 'user', NULL, '2931847e-cd1b-4bf0-a43c-bbdbf7d66a08', 'raquel2023', 'raquelcermeno78@gmail.com', '+526656535406', '$2y$10$o22ibfBc2dzcBCYouM0UGOq2gvvM4q5KO4fcVw36VV5cMnNdhy8ca', NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 'deleted', NULL, 0, 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', '2023-07-18 20:08:22', '2023-07-18 20:13:19'),
('e7862d9c-fba8-4509-b59b-a4cb4f71ba04', 'user', NULL, '47655849-8bee-4fba-8774-baea375cbc08', 'JORGE2023', 'jorgemdantart@gmail.com', '+34630892075', '$2y$10$J.k.ljzj8p3jcnuvCoZjpuyoE8rk.Bpj0a1Vz0Nv7O8wVaxqRgBhS', NULL, NULL, '78261', 0, 1, 0, 1, 1, 0, 'active', '5tQY85PwlhCDLQNyyyMD2OY9aghiiJzuHPbJx1T1SLsBPy3ubEFu2UeIRtzC', 0, NULL, '2023-07-25 05:19:47', '2023-09-01 11:02:01'),
('e7c629dd-0b1e-4094-bc83-6c928f77b357', 'user', NULL, 'ec85b751-db20-4f9e-8758-93f19e7ba02c', 'Maaney', 'Maaney39@gmail.com', '+252617438181', '$2y$10$CgzKLzRxJ2wiiqs/yRP4ROiDAcSmfnK5.Eowsnw2U7acPhtyR8tye', NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', NULL, 0, NULL, '2024-02-20 15:07:47', '2024-02-20 15:07:47'),
('ea3c376d-8e83-4e18-be5c-25fda612432f', 'user', NULL, '24c16604-1d4c-42ca-8fd3-40625247d14a', 'adminqc3', 'admin@gmail.com', '+98 991 189 3829', '$2y$10$ZVU0HYYm8SiVcbQ/AdFgnOWy/MIBkvkzu7T0l6o/JklZUXeRTnHee', NULL, NULL, NULL, 0, 1, 0, 1, 0, 0, 'active', NULL, 0, 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', '2023-05-07 06:37:12', '2023-05-07 06:37:12'),
('eb0d5cb2-a937-4d7e-9e4d-cbd10c9948a3', 'user', NULL, '06e24fef-25c1-49b1-a399-ce33fa29b982', 'Alihsh2023', '3ali6mahbub9@gmail.com', '+989138179270', '$2y$10$gz/Y75CC4L9Y40WaoolBCeP.P3rJtakaPMCvXAVT1NuWJ44f14aim', NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', NULL, 0, NULL, '2023-03-13 08:46:02', '2023-05-15 00:57:32'),
('ecbb1278-fb14-4952-8ef9-fc77aef93d3d', 'user', NULL, 'fe4e6b2b-2dd8-47f7-9c54-58169b18c47b', 'demotunde', 'demotunde@gmail.com', '+2347011637195', '$2y$10$hwYjIPqU21.pWAms6WdhBOh57O4LLNEDRA5NbOmzFMycVKsuSzaU6', NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', NULL, 0, NULL, '2023-08-14 19:22:20', '2023-08-14 19:22:20'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'admin', NULL, '2ba72d57-3539-4ff7-a078-a8fda886c6db', 'superadmin', 'codemenco@gmail.com', '+1 (205) 724-9145', '$2y$10$l8Xm0pUwHdeMOLCkL185SeOOhYCJ8NrW17ggkmVfV11StKz9xkYb.', 'user_avatar_ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d.png', NULL, NULL, 1, 1, 1, 1, 1, 1, 'active', 'YDuSWEIKBmHO80clNHZhCndEJ5T8MDQX9U1k2WePigF7GLM72k70TTsydvS3', 0, NULL, '2023-02-25 06:25:58', '2023-11-03 12:53:34'),
('ee485282-d5d5-415c-8946-16fa57fd8f79', 'user', NULL, '95d0fac3-4c04-4200-a68c-0e3e5865acaf', 'jabba', 'jabba@jabba.com', '+905551112233', '$2y$10$slUpJjqWbxSC4iSrVGBQyuBJvOSGI.259Ia3c8DHoJ.f7stqZpMTC', NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', NULL, 0, NULL, '2023-12-28 01:45:37', '2023-12-28 01:45:37'),
('eeb02b68-6521-4a40-84ad-21a2d21aa440', 'user', NULL, '624efc8c-e05d-4feb-a1c0-7c3a42663388', 'Gonzales', 'francisco.ryy@gmail.vom', '+573135684122', '$2y$10$pkydUg7yH.7YINxMapEjYOAdgen/bkxa86dZBVEuX/3IoaIaFSLq6', NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', NULL, 0, NULL, '2023-03-06 12:15:25', '2023-03-06 12:15:25'),
('eee37105-c97d-4f77-a933-910a0c6e68bc', 'user', NULL, 'cb4bc9b7-7961-496e-ac74-716fdd627d9f', 'testpayment', 'mmdrezaaahis@gmail.com', '+989338486722', '$2y$10$hKIKLpwx7wvBGGhN2L9smOQj8H2lUonAE3OgnbQnd5V7uC0E35ArW', NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', NULL, 0, NULL, '2023-10-21 21:22:10', '2023-10-21 21:22:10'),
('f28bca5b-f561-4150-94f6-dd67ff4f8470', 'user', NULL, '30d5d8b6-9167-49ef-bf29-056385db06e9', 'amirrezabadie', 'amirrezabadie91@gmail.co', '+98 991 692 8417', '$2y$10$kw6OmJJjqcvdp5ETizArr.Or9wmoZBq2ux4hEOxqIsgeQISluglF6', NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', NULL, 0, NULL, '2024-03-22 05:40:24', '2024-03-22 05:40:24'),
('f978562a-6102-47ef-b44c-00962596e9e4', 'user', NULL, 'd64e0c91-cfa0-4f30-8492-8938cb0f0e7c', 'ANA1', 'isabelscar1983@gmail.com', '+34643535107', '$2y$10$4tNlhqn.ur2sBadE2Qsh0enKGul.QSsg.xnKnzfmzRPYAvK4Mzioe', NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', NULL, 0, NULL, '2023-06-12 10:53:36', '2023-06-12 10:53:36'),
('f9ca05bf-6025-4a42-87f1-78001c65886c', 'user', NULL, '7ed08173-7e73-4374-b1c3-83109cc91da5', 'kvng656', 'kvng656@gmail.com', '+23499661835', '$2y$10$L6MABJTcpWu9Ae1eyezYTOIy4q6F2dgihscZtlEcsUPVYzjIyzvoq', NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', 'QFb3BgDqAl4MmyQbRdR8Yu9PhOFC6Kl5a0L3hKS6qw9uxaFiQpxBFmJHARtb', 0, NULL, '2023-11-25 06:54:38', '2023-11-25 06:54:38'),
('fb30fcec-0d29-4e8a-aba9-6ec50a6c03fc', 'user', NULL, 'f5159039-af4a-497d-8061-814053f230e8', 'lsms', 'mf66426623@gmail.com', '+9809351218937', '$2y$10$Pf52foIrXAdILScrTer87.Csyd.sd5flJRLa0olBIjB7iZHYg994i', NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', NULL, 0, NULL, '2024-04-20 06:46:37', '2024-04-20 06:46:37'),
('fb35867d-1db8-4b6d-9f19-54ab0b2ddab1', 'user', NULL, '655cb74b-557c-49df-b876-2914487d72ab', 'ADDEL1', 'azizfuen@gmail.com', '+34645630968', '$2y$10$w2cOfP26eJs7XdBaPoiKp.eEht25UcsOaQo2Dil8Y2az1f73g.PFW', NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', 'hYGpe9fljei6PHesG6tbXdMcZ4oycihS9ydM5JCMwie0XPBYfYHIbKfvN06R', 0, NULL, '2023-06-01 14:17:57', '2023-06-01 18:21:22'),
('fd1358e0-095d-4123-8649-e56751a08017', 'user', NULL, 'a68b9e4e-49ea-475a-8857-71919fe5b702', 'Hhhffgggg', 'rabdi2844@gmail.com', '+252617963035', '$2y$10$ywYZQtuqjB1JzTkBX1WcUexSd0gCQFkY/8W1Klmkie74/jS.rg5rS', NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', NULL, 0, NULL, '2024-02-19 10:12:15', '2024-02-19 10:12:15'),
('ff225515-4168-45de-929a-3c1dfb38cabf', 'user', NULL, '6d945c5f-5be9-4f06-a7f2-2393431433d4', 'maraliso', 'maralisocom@gmail.com', '+989905593854', '$2y$10$azFHRsW8RWJEOJsXbI/Qze5sQPBiWYn0tPVH94vSEnvkQ0SL3Pk5K', NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', NULL, 0, NULL, '2024-04-18 20:06:03', '2024-04-18 20:06:03'),
('ff837428-0711-4c3c-91a6-dd44e69ca5e7', 'user', NULL, '14755899-38ed-41f8-9573-9760a86b54ff', 'sanjay', 'drsanjay69@gmail.com', '+917878645301', '$2y$10$rDoJxqahXegJhK7FDx3vmOMGcH96JLpkhaQuGdcg4bNwoc4JM5vBu', NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 'active', NULL, 0, NULL, '2023-10-28 11:06:50', '2023-10-28 11:06:50'),
('kocoina8-bbd6-4f8b-9fbf-48711485ab8d', 'user', '', NULL, 'kucoin', 'kucoin@codemen.me', NULL, '$2y$10$ZJDVY7cUezlOrBFngKjngONo//pjf/QIncPdGBIfZtWPouHE79Vtq', NULL, NULL, NULL, 1, 1, 1, 1, 0, 0, 'active', NULL, 0, NULL, '2023-03-18 09:03:10', '2023-03-18 09:03:10');

-- --------------------------------------------------------

--
-- Table structure for table `user_activities`
--

CREATE TABLE `user_activities` (
  `user_id` char(36) NOT NULL,
  `device` varchar(255) DEFAULT NULL,
  `browser` varchar(255) NOT NULL,
  `operating_system` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL COMMENT 'country',
  `ip_address` varchar(255) NOT NULL,
  `note` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_activities`
--

INSERT INTO `user_activities` (`user_id`, `device`, `browser`, `operating_system`, `location`, `ip_address`, `note`, `created_at`, `updated_at`) VALUES
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'phone', 'Safari version-16.6', 'iOS', 'Colombia', '191.156.34.164', 'login', '2023-09-11 00:41:58', '2023-09-11 00:41:58'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Firefox version-117.0', 'OS X', 'Iran', '69.194.109.239', 'login', '2023-09-11 10:08:03', '2023-09-11 10:08:03'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Firefox version-117.0', 'OS X', 'Iran', '69.194.109.239', 'logout', '2023-09-11 10:08:23', '2023-09-11 10:08:23'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Firefox version-117.0', 'OS X', 'Iran', '69.194.109.239', 'login', '2023-09-11 10:08:51', '2023-09-11 10:08:51'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Firefox version-117.0', 'OS X', 'Iran', '69.194.109.239', 'logout', '2023-09-11 10:09:06', '2023-09-11 10:09:06'),
('6eb3595c-031c-4f55-abee-80cf6d8c816b', 'phone', 'Chrome version-116.0.0.0', 'AndroidOS', 'Germany', '104.28.158.213', 'login', '2023-09-11 11:13:58', '2023-09-11 11:13:58'),
('e7862d9c-fba8-4509-b59b-a4cb4f71ba04', 'desktop', 'Safari version-16.6', 'OS X', 'Spain', '188.26.196.158', 'login', '2023-09-11 14:44:45', '2023-09-11 14:44:45'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-116.0.0.0', 'Windows', 'Venezuela', '38.45.34.183', 'login', '2023-09-11 14:45:18', '2023-09-11 14:45:18'),
('86f3c2c9-e4c3-4192-ad1e-d34a6b188833', 'desktop', 'Chrome version-116.0.0.0', 'Windows', 'Colombia', '181.56.221.151', 'login', '2023-09-11 21:13:31', '2023-09-11 21:13:31'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-116.0.0.0', 'Windows', 'Colombia', '181.56.221.151', 'login', '2023-09-13 02:49:03', '2023-09-13 02:49:03'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-116.0.0.0', 'Windows', 'Colombia', '181.56.221.151', 'logout', '2023-09-13 02:50:34', '2023-09-13 02:50:34'),
('86f3c2c9-e4c3-4192-ad1e-d34a6b188833', 'desktop', 'Chrome version-116.0.0.0', 'Windows', 'Colombia', '181.56.221.151', 'login', '2023-09-13 02:50:48', '2023-09-13 02:50:48'),
('86f3c2c9-e4c3-4192-ad1e-d34a6b188833', 'desktop', 'Chrome version-116.0.0.0', 'Windows', 'Colombia', '181.56.221.151', 'logout', '2023-09-13 02:51:06', '2023-09-13 02:51:06'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-116.0.0.0', 'Windows', 'Colombia', '181.56.221.151', 'login', '2023-09-13 02:51:42', '2023-09-13 02:51:42'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-116.0.0.0', 'Windows', 'Colombia', '181.56.221.151', 'logout', '2023-09-13 02:53:03', '2023-09-13 02:53:03'),
('a01cd4e5-4cbb-48ab-bfde-2b558ab60d88', 'desktop', 'Chrome version-116.0.0.0', 'Windows', 'Colombia', '181.56.221.151', 'login', '2023-09-13 02:53:19', '2023-09-13 02:53:19'),
('a01cd4e5-4cbb-48ab-bfde-2b558ab60d88', 'desktop', 'Chrome version-116.0.0.0', 'Windows', 'Colombia', '181.56.221.151', 'logout', '2023-09-13 02:53:30', '2023-09-13 02:53:30'),
('86f3c2c9-e4c3-4192-ad1e-d34a6b188833', 'desktop', 'Chrome version-116.0.0.0', 'Windows', 'Colombia', '181.56.221.151', 'login', '2023-09-13 02:54:00', '2023-09-13 02:54:00'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Edge version-116.0.1938.81', 'Windows', 'Spain', '87.221.227.84', 'login', '2023-09-13 12:15:30', '2023-09-13 12:15:30'),
('e7862d9c-fba8-4509-b59b-a4cb4f71ba04', 'desktop', 'Safari version-16.6', 'OS X', 'Spain', '188.26.196.158', 'login', '2023-09-14 10:50:52', '2023-09-14 10:50:52'),
('923956af-60ea-40f0-8065-aac5c4fb3791', 'phone', 'Chrome version-107.0.0.0', 'AndroidOS', 'Uganda', '41.75.179.122', 'login', '2023-09-14 12:01:46', '2023-09-14 12:01:46'),
('923956af-60ea-40f0-8065-aac5c4fb3791', 'desktop', 'Edge version-116.0.1938.54', 'Windows', 'Uganda', '41.75.179.122', 'login', '2023-09-14 12:48:41', '2023-09-14 12:48:41'),
('923956af-60ea-40f0-8065-aac5c4fb3791', 'phone', 'Chrome version-107.0.0.0', 'AndroidOS', 'Uganda', '41.75.174.31', 'login', '2023-09-14 17:28:02', '2023-09-14 17:28:02'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-116.0.0.0', 'Windows', 'Colombia', '181.56.221.151', 'login', '2023-09-14 22:15:41', '2023-09-14 22:15:41'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Opera version-101.0.0.0', 'Windows', 'Finland', '65.109.186.70', 'login', '2023-09-17 04:40:19', '2023-09-17 04:40:19'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Opera version-101.0.0.0', 'Windows', 'Finland', '65.109.186.70', 'logout', '2023-09-17 04:56:25', '2023-09-17 04:56:25'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Opera version-101.0.0.0', 'Windows', 'Finland', '65.109.186.70', 'login', '2023-09-17 04:56:39', '2023-09-17 04:56:39'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Opera version-101.0.0.0', 'Windows', 'Finland', '65.109.186.70', 'login', '2023-09-17 10:03:31', '2023-09-17 10:03:31'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Firefox version-117.0', 'OS X', 'Iran', '5.53.58.218', 'login', '2023-09-17 15:52:21', '2023-09-17 15:52:21'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-108.0.0.0', 'Windows', 'United Kingdom', '5.66.3.129', 'login', '2023-09-17 18:24:53', '2023-09-17 18:24:53'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-116.0.0.0', 'Windows', 'Israel', '176.228.131.228', 'login', '2023-09-17 18:30:56', '2023-09-17 18:30:56'),
('cda51314-c8fb-414d-9f56-fb848e43077a', 'desktop', 'Chrome version-116.0.0.0', 'Windows', 'India', '122.173.110.203', 'login', '2023-09-18 08:29:33', '2023-09-18 08:29:33'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-116.0.0.0', 'Windows', 'Luxembourg', '185.221.132.251', 'login', '2023-09-18 09:43:46', '2023-09-18 09:43:46'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'phone', ' version-', 'AndroidOS', 'Iran', '94.176.38.136', 'login', '2023-09-19 09:03:02', '2023-09-19 09:03:02'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'phone', ' version-', 'AndroidOS', 'Iran', '94.176.38.136', 'login', '2023-09-19 09:08:37', '2023-09-19 09:08:37'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-116.0.0.0', 'Windows', 'Iran', '94.176.38.136', 'login', '2023-09-19 09:10:28', '2023-09-19 09:10:28'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', ' version-', '0', 'United States', '54.86.50.139', 'login', '2023-09-19 09:42:21', '2023-09-19 09:42:21'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', ' version-', '0', 'United States', '54.86.50.139', 'login', '2023-09-19 09:43:21', '2023-09-19 09:43:21'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', ' version-', '0', 'United States', '54.86.50.139', 'login', '2023-09-19 09:44:52', '2023-09-19 09:44:52'),
('e7862d9c-fba8-4509-b59b-a4cb4f71ba04', 'desktop', 'Safari version-16.6', 'OS X', 'Spain', '188.26.196.158', 'login', '2023-09-21 05:30:02', '2023-09-21 05:30:02'),
('d86b3a4d-3a57-426e-8e1e-95a6be996bb5', 'phone', 'Chrome version-116.0.0.0', 'AndroidOS', 'Spain', '85.51.21.141', 'login', '2023-09-22 16:37:48', '2023-09-22 16:37:48'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'phone', 'Safari version-16.6', 'iOS', 'Germany', '148.251.78.212', 'login', '2023-09-24 15:02:36', '2023-09-24 15:02:36'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'phone', 'Safari version-12.1.2', 'iOS', 'Croatia', '91.199.42.14', 'login', '2023-09-25 05:51:15', '2023-09-25 05:51:15'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Edge version-117.0.2045.36', 'Windows', 'United States', '104.234.58.191', 'login', '2023-09-25 08:30:44', '2023-09-25 08:30:44'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-109.0.0.0', 'Windows', 'Iran', '217.219.227.98', 'login', '2023-09-26 05:06:12', '2023-09-26 05:06:12'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Edge version-117.0.2045.36', 'Windows', 'Iran', '2.147.11.44', 'login', '2023-09-26 09:16:57', '2023-09-26 09:16:57'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-116.0.0.0', 'Windows', 'United Arab Emirates', '217.165.52.79', 'login', '2023-09-26 11:46:02', '2023-09-26 11:46:02'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Firefox version-117.0', 'Ubuntu', 'Iran', '5.112.215.191', 'login', '2023-09-26 12:28:38', '2023-09-26 12:28:38'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-116.0.0.0', 'Windows', 'Sweden', '45.8.147.107', 'login', '2023-09-27 13:19:42', '2023-09-27 13:19:42'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-114.0.0.0', 'Windows', 'Japan', '64.176.36.245', 'login', '2023-09-27 16:43:04', '2023-09-27 16:43:04'),
('e7862d9c-fba8-4509-b59b-a4cb4f71ba04', 'desktop', 'Safari version-16.6', 'OS X', 'Spain', '188.26.196.158', 'login', '2023-09-28 10:40:51', '2023-09-28 10:40:51'),
('e7862d9c-fba8-4509-b59b-a4cb4f71ba04', 'desktop', 'Safari version-16.6', 'OS X', 'Spain', '188.26.196.158', 'logout', '2023-09-28 10:41:49', '2023-09-28 10:41:49'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Safari version-17.0', 'OS X', 'Nigeria', '105.112.96.64', 'login', '2023-09-28 16:45:53', '2023-09-28 16:45:53'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-116.0.0.0', 'Windows', 'France', '51.158.235.12', 'login', '2023-09-29 15:09:44', '2023-09-29 15:09:44'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-117.0.0.0', 'Windows', 'United Arab Emirates', '92.97.194.151', 'login', '2023-09-30 14:32:53', '2023-09-30 14:32:53'),
('e7862d9c-fba8-4509-b59b-a4cb4f71ba04', 'desktop', 'Safari version-17.0', 'OS X', 'Spain', '188.26.196.158', 'login', '2023-10-02 11:11:28', '2023-10-02 11:11:28'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-117.0.0.0', 'Windows', 'Colombia', '181.56.221.151', 'login', '2023-10-02 18:12:31', '2023-10-02 18:12:31'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Edge version-117.0.2045.47', 'Windows', 'Spain', '87.221.226.135', 'login', '2023-10-03 03:00:30', '2023-10-03 03:00:30'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-117.0.5938.132', 'Windows', 'Spain', '87.221.226.135', 'login', '2023-10-03 03:04:13', '2023-10-03 03:04:13'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-117.0.0.0', 'Windows', 'France', '78.194.161.48', 'login', '2023-10-03 20:49:36', '2023-10-03 20:49:36'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-116.0.0.0', 'Windows', 'Vietnam', '171.225.185.97', 'login', '2023-10-03 23:35:15', '2023-10-03 23:35:15'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Edge version-117.0.2045.47', 'Windows', 'Iran', '2.191.133.24', 'login', '2023-10-04 02:37:12', '2023-10-04 02:37:12'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-117.0.0.0', 'Windows', 'Venezuela', '38.45.34.183', 'login', '2023-10-04 10:27:26', '2023-10-04 10:27:26'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Firefox version-118.0', 'OS X', 'Germany', '148.251.78.212', 'login', '2023-10-05 04:58:35', '2023-10-05 04:58:35'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-117.0.0.0', 'Windows', 'India', '122.168.71.205', 'login', '2023-10-05 06:08:20', '2023-10-05 06:08:20'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-117.0.0.0', 'Windows', 'India', '122.168.71.205', 'logout', '2023-10-05 06:17:19', '2023-10-05 06:17:19'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-117.0.0.0', 'Windows', 'Kosovo', '185.67.177.184', 'login', '2023-10-05 11:30:48', '2023-10-05 11:30:48'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-117.0.0.0', 'Windows', 'Rwanda', '102.22.139.55', 'login', '2023-10-05 11:31:01', '2023-10-05 11:31:01'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Safari version-16.3', 'OS X', 'Iran', '94.182.194.156', 'login', '2023-10-05 15:47:12', '2023-10-05 15:47:12'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-117.0.0.0', 'OS X', 'Turkey', '151.135.185.206', 'login', '2023-10-05 16:46:49', '2023-10-05 16:46:49'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Edge version-117.0.2045.47', 'Windows', 'Iran', '5.106.228.107', 'login', '2023-10-05 20:52:47', '2023-10-05 20:52:47'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Edge version-117.0.2045.47', 'Windows', 'Iran', '5.106.228.107', 'logout', '2023-10-05 20:53:15', '2023-10-05 20:53:15'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-117.0.0.0', 'Windows', 'Venezuela', '38.45.34.183', 'login', '2023-10-05 21:01:11', '2023-10-05 21:01:11'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Firefox version-118.0', 'OS X', 'Germany', '148.251.78.212', 'login', '2023-10-07 12:34:03', '2023-10-07 12:34:03'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Firefox version-118.0', 'OS X', 'Germany', '148.251.78.212', 'login', '2023-10-07 15:18:33', '2023-10-07 15:18:33'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Firefox version-118.0', 'OS X', 'Germany', '148.251.78.212', 'login', '2023-10-08 09:16:26', '2023-10-08 09:16:26'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'phone', 'Safari version-17.0.1', 'iOS', 'Kosovo', '46.99.11.228', 'login', '2023-10-09 08:48:34', '2023-10-09 08:48:34'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-117.0.0.0', 'Windows', 'Kosovo', '185.67.177.184', 'login', '2023-10-10 06:18:10', '2023-10-10 06:18:10'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Firefox version-118.0', 'OS X', 'Germany', '148.251.78.212', 'login', '2023-10-10 07:31:29', '2023-10-10 07:31:29'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-117.0.0.0', 'OS X', 'Iran', '5.75.79.24', 'login', '2023-10-10 07:31:47', '2023-10-10 07:31:47'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-117.0.0.0', 'Windows', 'Netherlands', '146.70.35.198', 'login', '2023-10-10 10:47:53', '2023-10-10 10:47:53'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-116.0.0.0', 'Windows', 'France', '145.239.208.82', 'login', '2023-10-10 11:52:57', '2023-10-10 11:52:57'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-117.0.0.0', 'Windows', 'Venezuela', '38.92.114.55', 'login', '2023-10-11 16:58:39', '2023-10-11 16:58:39'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-117.0.0.0', 'Windows', 'Venezuela', '38.92.114.55', 'logout', '2023-10-11 17:04:37', '2023-10-11 17:04:37'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-117.0.0.0', 'Windows', 'Venezuela', '38.92.114.55', 'login', '2023-10-11 17:04:47', '2023-10-11 17:04:47'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-117.0.0.0', 'Windows', 'Venezuela', '38.92.114.55', 'logout', '2023-10-11 17:11:05', '2023-10-11 17:11:05'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-117.0.0.0', 'Windows', 'Venezuela', '38.92.114.55', 'login', '2023-10-11 17:11:23', '2023-10-11 17:11:23'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-117.0.0.0', 'Windows', 'Venezuela', '38.92.114.55', 'update password', '2023-10-11 17:12:03', '2023-10-11 17:12:03'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-117.0.0.0', 'Windows', 'Venezuela', '38.92.114.55', 'login', '2023-10-11 17:13:11', '2023-10-11 17:13:11'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-117.0.0.0', 'Windows', 'Venezuela', '38.92.114.55', 'update password', '2023-10-11 17:13:31', '2023-10-11 17:13:31'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-117.0.0.0', 'Windows', 'Spain', '193.111.53.184', 'login', '2023-10-11 17:13:51', '2023-10-11 17:13:51'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Firefox version-118.0', 'OS X', 'Iran', '5.124.193.8', 'login', '2023-10-16 17:08:38', '2023-10-16 17:08:38'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-117.0.0.0', 'Windows', 'Kosovo', '185.67.177.184', 'login', '2023-10-17 08:42:19', '2023-10-17 08:42:19'),
('eeb02b68-6521-4a40-84ad-21a2d21aa440', 'phone', 'Safari version-17.0.1', 'iOS', 'Cyprus', '31.153.47.168', 'login', '2023-10-17 17:58:57', '2023-10-17 17:58:57'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Safari version-16.6', 'OS X', 'Spain', '45.67.99.48', 'login', '2023-10-17 18:15:08', '2023-10-17 18:15:08'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Safari version-16.6', 'OS X', 'Spain', '45.67.99.45', 'logout', '2023-10-17 18:23:03', '2023-10-17 18:23:03'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Safari version-16.6', 'OS X', 'Spain', '45.67.99.44', 'login', '2023-10-17 18:25:37', '2023-10-17 18:25:37'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Safari version-16.6', 'OS X', 'Spain', '45.67.99.45', 'logout', '2023-10-17 18:29:04', '2023-10-17 18:29:04'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Safari version-16.6', 'OS X', 'Spain', '45.67.99.45', 'login', '2023-10-17 18:30:13', '2023-10-17 18:30:13'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Safari version-16.6', 'OS X', 'Spain', '45.67.99.48', 'logout', '2023-10-17 18:46:43', '2023-10-17 18:46:43'),
('2446118a-33ae-4cb4-8ca9-4e1c8dd68f4f', 'desktop', 'Safari version-16.6', 'OS X', 'Spain', '45.67.99.49', 'login', '2023-10-17 18:53:51', '2023-10-17 18:53:51'),
('2446118a-33ae-4cb4-8ca9-4e1c8dd68f4f', 'desktop', 'Safari version-16.6', 'OS X', 'Spain', '45.67.99.45', 'logout', '2023-10-17 18:57:51', '2023-10-17 18:57:51'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Safari version-16.6', 'OS X', 'Spain', '45.67.99.44', 'login', '2023-10-17 18:57:58', '2023-10-17 18:57:58'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Safari version-16.6', 'OS X', 'Spain', '45.67.99.49', 'logout', '2023-10-17 19:09:30', '2023-10-17 19:09:30'),
('2446118a-33ae-4cb4-8ca9-4e1c8dd68f4f', 'desktop', 'Safari version-16.6', 'OS X', 'Spain', '45.67.99.49', 'login', '2023-10-17 19:09:49', '2023-10-17 19:09:49'),
('2446118a-33ae-4cb4-8ca9-4e1c8dd68f4f', 'desktop', 'Safari version-16.6', 'OS X', 'Spain', '45.67.99.48', 'logout', '2023-10-17 19:14:19', '2023-10-17 19:14:19'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Safari version-16.6', 'OS X', 'Spain', '45.67.99.44', 'login', '2023-10-17 19:14:30', '2023-10-17 19:14:30'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Safari version-16.6', 'OS X', 'Spain', '45.67.99.44', 'logout', '2023-10-17 19:22:33', '2023-10-17 19:22:33'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Safari version-17.0', 'OS X', 'South Africa', '165.255.244.41', 'login', '2023-10-18 05:58:15', '2023-10-18 05:58:15'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Safari version-17.0', 'OS X', 'South Africa', '165.255.244.41', 'logout', '2023-10-18 06:04:33', '2023-10-18 06:04:33'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-118.0.0.0', 'OS X', 'Iran', '5.123.55.31', 'login', '2023-10-18 10:46:10', '2023-10-18 10:46:10'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Firefox version-118.0', 'OS X', 'Iran', '5.123.55.31', 'login', '2023-10-18 10:52:02', '2023-10-18 10:52:02'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Firefox version-118.0', 'OS X', 'Iran', '5.123.55.31', 'logout', '2023-10-18 11:15:48', '2023-10-18 11:15:48'),
('e7862d9c-fba8-4509-b59b-a4cb4f71ba04', 'desktop', 'Safari version-17.0', 'OS X', 'Spain', '188.26.196.158', 'login', '2023-10-18 14:26:04', '2023-10-18 14:26:04'),
('e7862d9c-fba8-4509-b59b-a4cb4f71ba04', 'desktop', 'Safari version-17.0', 'OS X', 'Spain', '188.26.196.158', 'logout', '2023-10-18 14:26:37', '2023-10-18 14:26:37'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Safari version-16.3', 'OS X', 'Iran', '5.210.136.147', 'login', '2023-10-19 04:36:16', '2023-10-19 04:36:16'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Firefox version-118.0', 'OS X', 'Colombia', '186.84.90.174', 'login', '2023-10-20 12:22:13', '2023-10-20 12:22:13'),
('eee37105-c97d-4f77-a933-910a0c6e68bc', 'desktop', 'Safari version-16.3', 'OS X', 'Germany', '45.76.84.49', 'login', '2023-10-21 21:22:21', '2023-10-21 21:22:21'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Firefox version-118.0', 'Windows', 'Iran', '5.235.33.132', 'login', '2023-10-22 05:13:34', '2023-10-22 05:13:34'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-118.0.0.0', 'Windows', 'Venezuela', '38.92.114.55', 'login', '2023-10-23 14:01:58', '2023-10-23 14:01:58'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-118.0.0.0', 'Windows', 'Venezuela', '38.92.114.55', 'update password', '2023-10-23 14:13:21', '2023-10-23 14:13:21'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-117.0.0.0', 'Windows', 'Venezuela', '38.92.114.55', 'login', '2023-10-23 14:13:58', '2023-10-23 14:13:58'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-117.0.0.0', 'Windows', 'Venezuela', '38.92.114.55', 'logout', '2023-10-23 14:14:15', '2023-10-23 14:14:15'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-117.0.0.0', 'Windows', 'Venezuela', '38.92.114.55', 'login', '2023-10-23 14:18:44', '2023-10-23 14:18:44'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-117.0.0.0', 'Windows', 'Venezuela', '38.92.114.55', 'logout', '2023-10-23 14:29:44', '2023-10-23 14:29:44'),
('12a277f5-c2ee-44a6-82da-f6f5e03758a9', 'desktop', 'Chrome version-117.0.0.0', 'Windows', 'Venezuela', '38.92.114.55', 'login', '2023-10-23 14:29:54', '2023-10-23 14:29:54'),
('eee37105-c97d-4f77-a933-910a0c6e68bc', 'desktop', 'Safari version-16.3', 'OS X', 'Germany', '164.90.180.248', 'login', '2023-10-23 14:47:58', '2023-10-23 14:47:58'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Firefox version-119.0', 'OS X', 'Iran', '5.123.90.2', 'login', '2023-10-26 00:17:49', '2023-10-26 00:17:49'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'phone', 'Chrome version-118.0.0.0', 'AndroidOS', 'Indonesia', '103.111.200.158', 'login', '2023-10-26 16:21:28', '2023-10-26 16:21:28'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'phone', 'Chrome version-118.0.0.0', 'AndroidOS', 'Myanmar', '37.111.4.225', 'login', '2023-10-27 04:50:16', '2023-10-27 04:50:16'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-118.0.0.0', 'Windows', 'Myanmar', '202.165.86.206', 'login', '2023-10-27 05:12:42', '2023-10-27 05:12:42'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'phone', 'Safari version-17.0.1', 'iOS', 'Germany', '148.251.78.212', 'login', '2023-10-27 23:55:22', '2023-10-27 23:55:22'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-108.0.0.0', 'OS X', 'Nepal', '45.123.222.50', 'login', '2023-10-28 10:48:04', '2023-10-28 10:48:04'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-108.0.0.0', 'OS X', 'Nepal', '45.123.222.50', 'logout', '2023-10-28 10:53:47', '2023-10-28 10:53:47'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-118.0.0.0', 'Windows', 'India', '122.161.51.11', 'login', '2023-10-28 10:54:39', '2023-10-28 10:54:39'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-118.0.0.0', 'Windows', 'India', '122.161.51.11', 'logout', '2023-10-28 11:01:04', '2023-10-28 11:01:04'),
('ff837428-0711-4c3c-91a6-dd44e69ca5e7', 'desktop', 'Chrome version-118.0.0.0', 'Windows', 'India', '122.161.51.11', 'login', '2023-10-28 11:07:10', '2023-10-28 11:07:10'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Firefox version-119.0', 'OS X', 'Germany', '148.251.78.212', 'login', '2023-10-29 02:18:36', '2023-10-29 02:18:36'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Firefox version-119.0', 'OS X', 'Iran', '5.123.227.212', 'login', '2023-10-30 06:01:47', '2023-10-30 06:01:47'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-118.0.0.0', 'Windows', 'France', '162.19.18.203', 'login', '2023-11-03 12:22:42', '2023-11-03 12:22:42'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Edge version-119.0.0.0', 'OS X', 'Iran', '185.115.169.206', 'login', '2023-11-05 14:32:51', '2023-11-05 14:32:51'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Firefox version-119.0', 'Windows', 'Iran', '84.47.236.13', 'login', '2023-11-05 15:45:49', '2023-11-05 15:45:49'),
('3b4df004-bb15-4c73-b23e-f7d614f64b8e', 'desktop', 'Chrome version-119.0.0.0', 'Windows', 'Iran', '37.32.33.28', 'login', '2023-11-05 16:41:02', '2023-11-05 16:41:02'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Firefox version-119.0', 'OS X', 'Germany', '148.251.78.212', 'login', '2023-11-07 04:07:44', '2023-11-07 04:07:44'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Firefox version-119.0', 'OS X', 'Germany', '148.251.78.212', 'logout', '2023-11-07 04:08:30', '2023-11-07 04:08:30'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'phone', 'Firefox version-119.0', 'OS X', 'Germany', '148.251.78.212', 'login', '2023-11-07 04:12:22', '2023-11-07 04:12:22'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Edge version-119.0.0.0', 'Windows', 'Spain', '87.221.226.135', 'login', '2023-11-07 06:12:28', '2023-11-07 06:12:28'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'phone', 'Firefox version-119.0', 'OS X', 'Germany', '148.251.78.212', 'login', '2023-11-07 19:24:15', '2023-11-07 19:24:15'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Firefox version-115.0', 'Linux', 'Iran', '2.147.21.141', 'login', '2023-11-08 17:35:29', '2023-11-08 17:35:29'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Firefox version-115.0', 'Linux', 'Iran', '2.147.21.141', 'logout', '2023-11-08 17:36:17', '2023-11-08 17:36:17'),
('c034dc12-2661-4cd4-b118-febdc33c27e6', 'desktop', 'Chrome version-119.0.0.0', 'Windows', 'Venezuela', '38.92.114.50', 'login', '2023-11-09 12:19:01', '2023-11-09 12:19:01'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-119.0.0.0', 'Windows', 'Colombia', '181.56.221.151', 'login', '2023-11-09 12:24:13', '2023-11-09 12:24:13'),
('c034dc12-2661-4cd4-b118-febdc33c27e6', 'desktop', 'Chrome version-119.0.0.0', 'Windows', 'Venezuela', '38.92.114.50', 'logout', '2023-11-09 12:25:00', '2023-11-09 12:25:00'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-119.0.0.0', 'Windows', 'Venezuela', '38.92.114.50', 'login', '2023-11-09 12:27:37', '2023-11-09 12:27:37'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-119.0.0.0', 'Windows', 'Iran', '188.211.40.68', 'login', '2023-11-11 16:21:29', '2023-11-11 16:21:29'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Firefox version-119.0', 'OS X', 'Germany', '148.251.78.212', 'login', '2023-11-12 04:26:29', '2023-11-12 04:26:29'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'phone', 'Firefox version-119.0', 'OS X', 'Germany', '148.251.78.212', 'login', '2023-11-12 04:45:42', '2023-11-12 04:45:42'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'phone', 'Chrome version-119.0.0.0', 'AndroidOS', 'United Kingdom', '178.79.136.122', 'login', '2023-11-12 07:01:25', '2023-11-12 07:01:25'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-119.0.0.0', 'OS X', 'Iran', '5.121.159.124', 'login', '2023-11-12 08:49:17', '2023-11-12 08:49:17'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Firefox version-119.0', 'OS X', 'Germany', '148.251.78.212', 'login', '2023-11-12 09:48:38', '2023-11-12 09:48:38'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Firefox version-115.0', 'Linux', 'Netherlands', '185.94.188.150', 'login', '2023-11-13 09:13:27', '2023-11-13 09:13:27'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-119.0.0.0', 'Windows', 'Kosovo', '185.67.177.184', 'login', '2023-11-13 14:03:19', '2023-11-13 14:03:19'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-119.0.0.0', 'Windows', 'Venezuela', '38.92.114.50', 'login', '2023-11-14 09:56:29', '2023-11-14 09:56:29'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-119.0.0.0', 'Windows', 'India', '103.142.120.112', 'login', '2023-11-14 23:58:21', '2023-11-14 23:58:21'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Firefox version-119.0', 'OS X', 'Germany', '148.251.78.212', 'login', '2023-11-15 06:31:19', '2023-11-15 06:31:19'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Firefox version-119.0', 'OS X', 'Germany', '148.251.78.212', 'login', '2023-11-16 07:56:55', '2023-11-16 07:56:55'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Firefox version-119.0', 'OS X', 'Armenia', '62.89.5.232', 'login', '2023-11-17 13:50:55', '2023-11-17 13:50:55'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-119.0.0.0', 'Windows', 'Iran', '164.138.166.115', 'login', '2023-11-18 06:20:23', '2023-11-18 06:20:23'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Safari version-16.6', 'OS X', 'Spain', '45.67.99.53', 'login', '2023-11-19 16:13:57', '2023-11-19 16:13:57'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Safari version-16.6', 'OS X', 'Spain', '45.67.99.39', 'logout', '2023-11-19 16:20:52', '2023-11-19 16:20:52'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Safari version-16.6', 'OS X', 'Spain', '45.67.99.50', 'login', '2023-11-19 16:25:00', '2023-11-19 16:25:00'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-119.0.0.0', 'Windows', 'Venezuela', '38.92.114.50', 'login', '2023-11-20 05:37:44', '2023-11-20 05:37:44'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-119.0.0.0', 'OS X', 'Turkey', '151.135.178.216', 'login', '2023-11-20 17:54:35', '2023-11-20 17:54:35'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-119.0.0.0', 'Windows', 'Venezuela', '38.92.114.50', 'logout', '2023-11-23 00:35:30', '2023-11-23 00:35:30'),
('d2b09976-3be3-43e8-81ef-d0dd81784cdf', 'desktop', 'Chrome version-119.0.0.0', 'Windows', 'Venezuela', '38.92.114.50', 'login', '2023-11-23 00:35:46', '2023-11-23 00:35:46'),
('d2b09976-3be3-43e8-81ef-d0dd81784cdf', 'desktop', 'Chrome version-119.0.0.0', 'Windows', 'Venezuela', '38.92.114.50', 'logout', '2023-11-23 00:38:20', '2023-11-23 00:38:20'),
('d2b09976-3be3-43e8-81ef-d0dd81784cdf', 'desktop', 'Chrome version-119.0.0.0', 'Windows', 'Venezuela', '38.92.114.50', 'login', '2023-11-23 00:40:14', '2023-11-23 00:40:14'),
('d2b09976-3be3-43e8-81ef-d0dd81784cdf', 'desktop', 'Chrome version-119.0.0.0', 'Windows', 'Venezuela', '38.92.114.50', 'logout', '2023-11-23 00:40:43', '2023-11-23 00:40:43'),
('d2b09976-3be3-43e8-81ef-d0dd81784cdf', 'desktop', 'Chrome version-119.0.0.0', 'Windows', 'Venezuela', '38.92.114.50', 'login', '2023-11-23 00:41:14', '2023-11-23 00:41:14'),
('d2b09976-3be3-43e8-81ef-d0dd81784cdf', 'desktop', 'Chrome version-119.0.0.0', 'Windows', 'Venezuela', '38.92.114.50', 'logout', '2023-11-23 00:42:14', '2023-11-23 00:42:14'),
('d2b09976-3be3-43e8-81ef-d0dd81784cdf', 'desktop', 'Chrome version-119.0.0.0', 'Windows', 'Venezuela', '38.92.114.50', 'login', '2023-11-23 00:42:26', '2023-11-23 00:42:26'),
('d2b09976-3be3-43e8-81ef-d0dd81784cdf', 'desktop', 'Chrome version-119.0.0.0', 'Windows', 'Venezuela', '38.92.114.50', 'logout', '2023-11-23 00:42:52', '2023-11-23 00:42:52'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-119.0.0.0', 'Windows', 'Venezuela', '38.92.114.50', 'login', '2023-11-23 21:06:36', '2023-11-23 21:06:36'),
('f9ca05bf-6025-4a42-87f1-78001c65886c', 'phone', 'Chrome version-119.0.0.0', 'AndroidOS', 'Nigeria', '102.91.4.245', 'login', '2023-11-25 06:54:49', '2023-11-25 06:54:49'),
('f9ca05bf-6025-4a42-87f1-78001c65886c', 'phone', 'Firefox version-120.0', 'AndroidOS', 'Nigeria', '102.91.4.17', 'login', '2023-11-25 07:01:52', '2023-11-25 07:01:52'),
('f9ca05bf-6025-4a42-87f1-78001c65886c', 'phone', 'Chrome version-118.0.0.0', 'AndroidOS', 'Nigeria', '197.210.76.138', 'login', '2023-11-25 07:02:52', '2023-11-25 07:02:52'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Firefox version-119.0', 'OS X', 'Finland', '65.21.14.57', 'login', '2023-11-25 11:42:49', '2023-11-25 11:42:49'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Firefox version-119.0', 'OS X', 'Iran', '158.58.104.253', 'login', '2023-11-25 14:59:47', '2023-11-25 14:59:47'),
('f9ca05bf-6025-4a42-87f1-78001c65886c', 'desktop', 'Chrome version-119.0.0.0', 'Linux', 'Germany', '156.146.33.78', 'login', '2023-11-26 10:03:52', '2023-11-26 10:03:52'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-119.0.0.0', 'Windows', 'Turkey', '85.108.129.77', 'login', '2023-11-27 16:04:22', '2023-11-27 16:04:22'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-119.0.0.0', 'Windows', 'Germany', '148.251.78.229', 'login', '2023-11-28 11:19:07', '2023-11-28 11:19:07'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-119.0.0.0', 'Windows', 'Germany', '145.224.75.88', 'login', '2023-11-30 07:03:43', '2023-11-30 07:03:43'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'phone', 'Chrome version-99.0.4844.88', 'AndroidOS', 'Libya', '41.254.70.49', 'login', '2023-11-30 17:21:05', '2023-11-30 17:21:05'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-119.0.0.0', 'Windows', 'Venezuela', '38.92.114.50', 'login', '2023-12-01 11:14:12', '2023-12-01 11:14:12'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-119.0.0.0', 'Windows', 'Iran', '94.176.39.50', 'login', '2023-12-02 08:13:17', '2023-12-02 08:13:17'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Firefox version-120.0', 'OS X', 'Iran', '5.123.169.121', 'login', '2023-12-04 05:17:07', '2023-12-04 05:17:07'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-119.0.0.0', 'Windows', 'Venezuela', '38.92.114.50', 'login', '2023-12-04 14:05:47', '2023-12-04 14:05:47'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-119.0.0.0', 'Windows', 'Venezuela', '38.92.114.50', 'logout', '2023-12-04 14:06:02', '2023-12-04 14:06:02'),
('44d4809d-28e1-4685-b15c-dc11134fdf1d', 'desktop', 'Chrome version-119.0.0.0', 'Windows', 'Venezuela', '38.92.114.50', 'login', '2023-12-04 14:06:27', '2023-12-04 14:06:27'),
('44d4809d-28e1-4685-b15c-dc11134fdf1d', 'desktop', 'Chrome version-119.0.0.0', 'Windows', 'Venezuela', '38.92.114.50', 'update password', '2023-12-04 14:09:11', '2023-12-04 14:09:11'),
('44d4809d-28e1-4685-b15c-dc11134fdf1d', 'desktop', 'Chrome version-119.0.0.0', 'Windows', 'Venezuela', '38.92.114.50', 'login', '2023-12-04 14:09:20', '2023-12-04 14:09:20'),
('44d4809d-28e1-4685-b15c-dc11134fdf1d', 'desktop', 'Chrome version-119.0.0.0', 'Windows', 'Venezuela', '38.92.114.50', 'logout', '2023-12-04 14:09:31', '2023-12-04 14:09:31'),
('44d4809d-28e1-4685-b15c-dc11134fdf1d', 'desktop', 'Chrome version-119.0.0.0', 'Windows', 'Venezuela', '38.92.114.50', 'login', '2023-12-04 14:09:54', '2023-12-04 14:09:54'),
('44d4809d-28e1-4685-b15c-dc11134fdf1d', 'desktop', 'Chrome version-119.0.0.0', 'Windows', 'Venezuela', '38.92.114.50', 'logout', '2023-12-04 14:10:08', '2023-12-04 14:10:08'),
('44d4809d-28e1-4685-b15c-dc11134fdf1d', 'desktop', 'Chrome version-119.0.0.0', 'Windows', 'Venezuela', '38.92.114.50', 'login', '2023-12-04 14:13:28', '2023-12-04 14:13:28'),
('44d4809d-28e1-4685-b15c-dc11134fdf1d', 'desktop', 'Chrome version-119.0.0.0', 'Windows', 'Venezuela', '38.92.114.50', 'logout', '2023-12-04 14:15:52', '2023-12-04 14:15:52'),
('44d4809d-28e1-4685-b15c-dc11134fdf1d', 'desktop', 'Chrome version-119.0.0.0', 'Windows', 'Spain', '87.222.45.58', 'login', '2023-12-04 14:18:39', '2023-12-04 14:18:39'),
('44d4809d-28e1-4685-b15c-dc11134fdf1d', 'desktop', 'Chrome version-119.0.0.0', 'Windows', 'Spain', '87.222.45.58', 'logout', '2023-12-04 14:23:37', '2023-12-04 14:23:37'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-119.0.0.0', 'Windows', 'Venezuela', '38.92.114.50', 'login', '2023-12-04 17:58:39', '2023-12-04 17:58:39'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-119.0.0.0', 'Windows', 'Venezuela', '38.92.114.50', 'logout', '2023-12-04 19:39:43', '2023-12-04 19:39:43'),
('c71eeafd-849d-4cb7-8275-1ebcd9ac93d8', 'phone', 'Chrome version-115.0.0.0', 'AndroidOS', 'El Salvador', '190.62.15.86', 'login', '2023-12-05 09:05:45', '2023-12-05 09:05:45'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-119.0.0.0', 'Windows', 'Venezuela', '38.92.114.50', 'login', '2023-12-05 09:12:34', '2023-12-05 09:12:34'),
('c71eeafd-849d-4cb7-8275-1ebcd9ac93d8', 'phone', 'Chrome version-115.0.0.0', 'AndroidOS', 'El Salvador', '190.62.15.86', 'logout', '2023-12-05 09:20:32', '2023-12-05 09:20:32'),
('c71eeafd-849d-4cb7-8275-1ebcd9ac93d8', 'phone', 'Chrome version-115.0.0.0', 'AndroidOS', 'El Salvador', '190.62.15.86', 'login', '2023-12-05 09:20:55', '2023-12-05 09:20:55'),
('c71eeafd-849d-4cb7-8275-1ebcd9ac93d8', 'phone', 'Chrome version-115.0.0.0', 'AndroidOS', 'El Salvador', '190.62.15.86', 'logout', '2023-12-05 09:28:13', '2023-12-05 09:28:13'),
('c71eeafd-849d-4cb7-8275-1ebcd9ac93d8', 'phone', 'Chrome version-115.0.0.0', 'AndroidOS', 'El Salvador', '190.62.15.86', 'login', '2023-12-05 09:29:09', '2023-12-05 09:29:09'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-119.0.0.0', 'Windows', 'Venezuela', '38.92.114.50', 'logout', '2023-12-05 09:32:17', '2023-12-05 09:32:17'),
('d2b09976-3be3-43e8-81ef-d0dd81784cdf', 'desktop', 'Chrome version-119.0.0.0', 'Windows', 'Venezuela', '38.92.114.50', 'login', '2023-12-05 09:40:39', '2023-12-05 09:40:39'),
('d2b09976-3be3-43e8-81ef-d0dd81784cdf', 'desktop', 'Chrome version-119.0.0.0', 'Windows', 'Venezuela', '38.92.114.50', 'logout', '2023-12-05 09:51:22', '2023-12-05 09:51:22'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-119.0.0.0', 'Windows', 'Venezuela', '38.92.114.50', 'login', '2023-12-05 09:51:28', '2023-12-05 09:51:28'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-119.0.0.0', 'Windows', 'Venezuela', '38.92.114.50', 'logout', '2023-12-05 09:59:42', '2023-12-05 09:59:42'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-119.0.0.0', 'Windows', 'Venezuela', '38.92.114.50', 'login', '2023-12-05 10:02:46', '2023-12-05 10:02:46'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-119.0.0.0', 'Windows', 'Venezuela', '38.92.114.50', 'login', '2023-12-05 10:02:46', '2023-12-05 10:02:46'),
('44d4809d-28e1-4685-b15c-dc11134fdf1d', 'desktop', 'Chrome version-119.0.0.0', 'Windows', 'Spain', '87.222.45.58', 'login', '2023-12-05 11:41:04', '2023-12-05 11:41:04'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-119.0.0.0', 'Windows', 'Venezuela', '38.92.114.50', 'login', '2023-12-06 15:10:31', '2023-12-06 15:10:31'),
('44d4809d-28e1-4685-b15c-dc11134fdf1d', 'desktop', 'Chrome version-119.0.0.0', 'Windows', 'Spain', '87.222.45.58', 'login', '2023-12-06 15:12:06', '2023-12-06 15:12:06'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-119.0.0.0', 'Windows', 'Turkey', '176.42.142.145', 'login', '2023-12-07 19:31:43', '2023-12-07 19:31:43'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Firefox version-120.0', 'OS X', 'Iran', '5.124.69.189', 'login', '2023-12-08 12:38:44', '2023-12-08 12:38:44'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'phone', 'Safari version-17.1.2', 'iOS', 'Finland', '65.21.14.57', 'login', '2023-12-08 12:58:47', '2023-12-08 12:58:47'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Firefox version-120.0', 'Windows', 'Sweden', '188.149.177.200', 'login', '2023-12-09 02:03:45', '2023-12-09 02:03:45'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'phone', 'Safari version-17.1.2', 'iOS', 'Finland', '65.21.14.57', 'login', '2023-12-09 03:43:11', '2023-12-09 03:43:11'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'phone', 'Safari version-17.1.2', 'iOS', 'Malaysia', '180.75.249.65', 'login', '2023-12-09 05:23:25', '2023-12-09 05:23:25'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-120.0.0.0', 'Windows', 'Malaysia', '180.75.249.65', 'login', '2023-12-09 05:42:05', '2023-12-09 05:42:05'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Firefox version-120.0', 'OS X', 'Iran', '5.124.69.189', 'login', '2023-12-09 06:49:21', '2023-12-09 06:49:21'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-120.0.0.0', 'Windows', 'Malaysia', '180.75.249.65', 'login', '2023-12-09 10:06:21', '2023-12-09 10:06:21'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-120.0.0.0', 'Windows', 'Malaysia', '180.75.249.65', 'login', '2023-12-09 10:06:25', '2023-12-09 10:06:25'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Firefox version-120.0', 'OS X', 'Iran', '5.124.69.189', 'login', '2023-12-09 12:50:02', '2023-12-09 12:50:02'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-119.0.0.0', 'Windows', 'Germany', '3.76.251.80', 'login', '2023-12-10 12:29:51', '2023-12-10 12:29:51'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-119.0.0.0', 'Windows', 'Germany', '3.76.251.80', 'logout', '2023-12-10 12:35:14', '2023-12-10 12:35:14'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-119.0.0.0', 'Windows', 'Germany', '3.76.251.80', 'login', '2023-12-10 12:41:56', '2023-12-10 12:41:56'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-119.0.0.0', 'Windows', 'Germany', '172.104.153.177', 'login', '2023-12-10 13:35:49', '2023-12-10 13:35:49'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-120.0.0.0', 'Windows', 'Turkey', '176.42.142.145', 'login', '2023-12-10 14:47:08', '2023-12-10 14:47:08'),
('6c2de49b-66b3-482d-bf48-8b690f86deff', 'desktop', 'Chrome version-120.0.0.0', 'Windows', 'Bangladesh', '103.120.165.69', 'login', '2023-12-11 08:46:12', '2023-12-11 08:46:12'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-119.0.0.0', 'Windows', 'Germany', '18.194.105.5', 'login', '2023-12-12 03:35:48', '2023-12-12 03:35:48'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Firefox version-120.0', 'OS X', 'Finland', '65.21.14.57', 'login', '2023-12-12 05:13:38', '2023-12-12 05:13:38'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-120.0.0.0', 'Windows', 'Iran', '5.232.62.17', 'login', '2023-12-12 13:04:43', '2023-12-12 13:04:43'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Safari version-16.1', 'OS X', 'United Kingdom', '188.92.250.61', 'login', '2023-12-13 13:06:35', '2023-12-13 13:06:35'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-120.0.0.0', 'Windows', 'Venezuela', '38.92.114.50', 'login', '2023-12-14 00:40:29', '2023-12-14 00:40:29'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Firefox version-120.0', 'OS X', 'Finland', '65.21.14.57', 'login', '2023-12-14 02:26:30', '2023-12-14 02:26:30'),
('96f24f53-91db-4ab4-80ae-589139774970', 'desktop', 'Chrome version-119.0.0.0', 'Windows', 'Nigeria', '197.210.76.244', 'login', '2023-12-14 07:45:40', '2023-12-14 07:45:40'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-120.0.0.0', 'Windows', 'Venezuela', '38.92.114.50', 'login', '2023-12-14 12:58:06', '2023-12-14 12:58:06'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-120.0.0.0', 'Windows', 'Venezuela', '38.92.114.50', 'logout', '2023-12-14 12:58:18', '2023-12-14 12:58:18'),
('9e207066-ad6c-4c73-b26a-22142f5d6eec', 'desktop', 'Chrome version-120.0.0.0', 'Windows', 'Venezuela', '38.92.114.50', 'login', '2023-12-14 12:58:27', '2023-12-14 12:58:27'),
('9e207066-ad6c-4c73-b26a-22142f5d6eec', 'desktop', 'Chrome version-120.0.0.0', 'Windows', 'Venezuela', '38.92.114.50', 'logout', '2023-12-14 12:58:39', '2023-12-14 12:58:39'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-120.0.0.0', 'Windows', 'Venezuela', '38.92.114.50', 'login', '2023-12-14 12:58:50', '2023-12-14 12:58:50'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-120.0.0.0', 'Windows', 'Russia', '109.197.206.120', 'login', '2023-12-14 17:17:41', '2023-12-14 17:17:41'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-120.0.0.0', 'Windows', 'Venezuela', '38.92.114.50', 'login', '2023-12-14 18:04:07', '2023-12-14 18:04:07'),
('96f24f53-91db-4ab4-80ae-589139774970', 'desktop', 'Chrome version-119.0.0.0', 'Windows', 'Nigeria', '102.91.69.140', 'logout', '2023-12-15 04:20:34', '2023-12-15 04:20:34'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-119.0.0.0', 'Windows', 'Nigeria', '197.210.76.179', 'login', '2023-12-15 04:21:12', '2023-12-15 04:21:12'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'phone', 'Chrome version-120.0.0.0', 'AndroidOS', 'Nigeria', '102.90.44.150', 'login', '2023-12-15 04:47:16', '2023-12-15 04:47:16'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-120.0.0.0', 'Windows', 'Turkey', '176.42.142.145', 'login', '2023-12-15 07:30:01', '2023-12-15 07:30:01'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'phone', 'Chrome version-119.0.6045.169', 'iOS', 'Nigeria', '102.91.46.93', 'login', '2023-12-15 10:16:53', '2023-12-15 10:16:53'),
('c71eeafd-849d-4cb7-8275-1ebcd9ac93d8', 'phone', 'Chrome version-115.0.0.0', 'AndroidOS', 'El Salvador', '190.86.105.166', 'login', '2023-12-15 19:12:11', '2023-12-15 19:12:11'),
('c71eeafd-849d-4cb7-8275-1ebcd9ac93d8', 'phone', 'Chrome version-115.0.0.0', 'AndroidOS', 'El Salvador', '190.86.105.166', 'logout', '2023-12-15 19:58:44', '2023-12-15 19:58:44'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'phone', 'Chrome version-119.0.6045.169', 'iOS', 'Nigeria', '102.91.46.96', 'logout', '2023-12-15 20:46:13', '2023-12-15 20:46:13'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'phone', 'Chrome version-119.0.6045.169', 'iOS', 'Nigeria', '197.210.53.90', 'login', '2023-12-15 20:48:54', '2023-12-15 20:48:54'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'phone', 'Chrome version-119.0.6045.169', 'iOS', 'Nigeria', '102.91.48.99', 'logout', '2023-12-15 20:50:38', '2023-12-15 20:50:38'),
('557a1889-0d7e-4e8c-a314-14e6c4004ee3', 'phone', 'Chrome version-119.0.6045.169', 'iOS', 'Nigeria', '102.91.48.99', 'login', '2023-12-15 20:53:33', '2023-12-15 20:53:33'),
('557a1889-0d7e-4e8c-a314-14e6c4004ee3', 'phone', 'Chrome version-119.0.6045.169', 'iOS', 'Nigeria', '102.91.55.77', 'login', '2023-12-16 02:21:33', '2023-12-16 02:21:33'),
('557a1889-0d7e-4e8c-a314-14e6c4004ee3', 'phone', 'Chrome version-119.0.6045.169', 'iOS', 'Nigeria', '102.91.52.149', 'logout', '2023-12-16 02:22:35', '2023-12-16 02:22:35'),
('557a1889-0d7e-4e8c-a314-14e6c4004ee3', 'phone', 'Mozilla version-', 'iOS', 'United Arab Emirates', '94.57.67.178', 'login', '2023-12-16 02:23:35', '2023-12-16 02:23:35'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-120.0.0.0', 'Windows', 'Russia', '104.28.196.109', 'login', '2023-12-16 03:17:32', '2023-12-16 03:17:32'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'phone', 'Safari version-17.1.2', 'iOS', 'Belgium', '141.134.16.57', 'login', '2023-12-16 05:03:32', '2023-12-16 05:03:32'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'phone', 'Safari version-17.1.2', 'iOS', 'Belgium', '141.134.16.57', 'logout', '2023-12-16 05:07:00', '2023-12-16 05:07:00'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-120.0.0.0', 'Windows', 'Iran', '87.107.38.130', 'login', '2023-12-16 08:06:06', '2023-12-16 08:06:06'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-120.0.0.0', 'Windows', 'Turkey', '176.42.142.145', 'login', '2023-12-16 08:18:36', '2023-12-16 08:18:36'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-120.0.0.0', 'Windows', 'Venezuela', '38.92.114.50', 'login', '2023-12-16 11:29:47', '2023-12-16 11:29:47'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-120.0.0.0', 'Windows', 'Venezuela', '38.92.114.50', 'logout', '2023-12-16 11:31:39', '2023-12-16 11:31:39'),
('c034dc12-2661-4cd4-b118-febdc33c27e6', 'desktop', 'Chrome version-120.0.0.0', 'Windows', 'Venezuela', '38.92.114.50', 'login', '2023-12-16 11:31:46', '2023-12-16 11:31:46'),
('c034dc12-2661-4cd4-b118-febdc33c27e6', 'desktop', 'Chrome version-120.0.0.0', 'Windows', 'Venezuela', '38.92.114.50', 'logout', '2023-12-16 11:31:58', '2023-12-16 11:31:58'),
('44d4809d-28e1-4685-b15c-dc11134fdf1d', 'desktop', 'Chrome version-120.0.0.0', 'Windows', 'Venezuela', '38.92.114.50', 'login', '2023-12-16 11:32:08', '2023-12-16 11:32:08'),
('44d4809d-28e1-4685-b15c-dc11134fdf1d', 'desktop', 'Chrome version-120.0.0.0', 'Windows', 'Venezuela', '38.92.114.50', 'logout', '2023-12-16 11:43:02', '2023-12-16 11:43:02'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-120.0.0.0', 'Windows', 'Venezuela', '38.92.114.50', 'login', '2023-12-16 11:43:17', '2023-12-16 11:43:17'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-120.0.0.0', 'Windows', 'Venezuela', '38.92.114.50', 'logout', '2023-12-16 11:44:42', '2023-12-16 11:44:42'),
('44d4809d-28e1-4685-b15c-dc11134fdf1d', 'phone', 'Safari version-604.1', 'iOS', 'Venezuela', '38.92.114.50', 'login', '2023-12-16 11:46:09', '2023-12-16 11:46:09'),
('9e207066-ad6c-4c73-b26a-22142f5d6eec', 'desktop', 'Chrome version-120.0.0.0', 'Windows', 'Venezuela', '38.92.114.50', 'login', '2023-12-16 12:02:41', '2023-12-16 12:02:41'),
('9e207066-ad6c-4c73-b26a-22142f5d6eec', 'desktop', 'Chrome version-120.0.0.0', 'Windows', 'Venezuela', '38.92.114.50', 'logout', '2023-12-16 12:15:20', '2023-12-16 12:15:20'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-120.0.0.0', 'Windows', 'Venezuela', '38.92.114.50', 'login', '2023-12-16 12:15:26', '2023-12-16 12:15:26'),
('c71eeafd-849d-4cb7-8275-1ebcd9ac93d8', 'phone', 'Chrome version-115.0.0.0', 'AndroidOS', 'El Salvador', '190.62.15.86', 'login', '2023-12-16 12:27:34', '2023-12-16 12:27:34'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-120.0.0.0', 'Windows', 'Venezuela', '38.92.114.50', 'logout', '2023-12-16 12:35:58', '2023-12-16 12:35:58'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-120.0.0.0', 'OS X', 'United Kingdom', '188.92.250.61', 'login', '2023-12-16 13:42:11', '2023-12-16 13:42:11');
INSERT INTO `user_activities` (`user_id`, `device`, `browser`, `operating_system`, `location`, `ip_address`, `note`, `created_at`, `updated_at`) VALUES
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-120.0.0.0', 'OS X', 'Spain', '87.221.226.135', 'login', '2023-12-17 14:11:19', '2023-12-17 14:11:19'),
('3197597e-5470-45e4-afc1-0b2292d2158e', 'phone', 'Chrome version-106.0.0.0', 'AndroidOS', 'Nigeria', '197.210.78.205', 'login', '2023-12-17 22:35:13', '2023-12-17 22:35:13'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-120.0.0.0', 'Windows', 'Venezuela', '38.92.114.50', 'login', '2023-12-18 12:03:30', '2023-12-18 12:03:30'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-120.0.0.0', 'Windows', 'Venezuela', '38.92.114.50', 'login', '2023-12-18 14:49:46', '2023-12-18 14:49:46'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-120.0.0.0', 'Windows', 'Ethiopia', '196.190.61.30', 'login', '2023-12-20 10:47:48', '2023-12-20 10:47:48'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-120.0.0.0', 'Windows', 'Ethiopia', '196.191.60.206', 'logout', '2023-12-20 10:54:08', '2023-12-20 10:54:08'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-120.0.0.0', 'Windows', 'Ethiopia', '196.191.60.206', 'login', '2023-12-20 10:58:08', '2023-12-20 10:58:08'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-120.0.0.0', 'Windows', 'Iran', '86.57.57.196', 'login', '2023-12-21 02:57:28', '2023-12-21 02:57:28'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-120.0.0.0', 'Windows', 'The Netherlands', '91.198.77.216', 'login', '2023-12-21 10:04:02', '2023-12-21 10:04:02'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-120.0.0.0', 'Windows', 'Türkiye', '31.206.133.225', 'login', '2023-12-21 20:29:22', '2023-12-21 20:29:22'),
('6f1ba6d2-22bf-4291-977d-534ac1aff4d8', 'phone', 'Safari version-17.2', 'iOS', 'Nigeria', '129.205.113.175', 'login', '2023-12-24 08:04:06', '2023-12-24 08:04:06'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-120.0.0.0', 'Windows', 'Germany', '49.13.156.5', 'login', '2023-12-24 08:38:56', '2023-12-24 08:38:56'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-120.0.0.0', 'Windows', 'Türkiye', '176.42.142.145', 'login', '2023-12-24 14:49:43', '2023-12-24 14:49:43'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-120.0.0.0', 'Windows', 'Germany', '84.247.59.39', 'login', '2023-12-24 16:09:05', '2023-12-24 16:09:05'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-120.0.0.0', 'Windows', 'Germany', '84.247.59.39', 'logout', '2023-12-24 17:47:51', '2023-12-24 17:47:51'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-120.0.0.0', 'Windows', 'Germany', '49.13.156.5', 'login', '2023-12-25 11:01:58', '2023-12-25 11:01:58'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-120.0.0.0', 'Windows', 'Germany', '49.13.156.5', 'login', '2023-12-26 16:16:38', '2023-12-26 16:16:38'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'phone', 'Chrome version-120.0.0.0', 'AndroidOS', 'Germany', '49.13.156.5', 'login', '2023-12-26 16:42:03', '2023-12-26 16:42:03'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'phone', 'Chrome version-120.0.0.0', 'AndroidOS', 'Germany', '49.13.156.5', 'logout', '2023-12-26 16:43:12', '2023-12-26 16:43:12'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-120.0.0.0', 'Windows', 'Germany', '49.13.156.5', 'logout', '2023-12-26 16:53:24', '2023-12-26 16:53:24'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-120.0.0.0', 'Windows', 'Germany', '49.13.156.5', 'login', '2023-12-26 16:54:50', '2023-12-26 16:54:50'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'phone', ' version-', 'AndroidOS', 'Türkiye', '176.42.142.145', 'login', '2023-12-28 01:42:55', '2023-12-28 01:42:55'),
('ee485282-d5d5-415c-8946-16fa57fd8f79', 'phone', ' version-', 'AndroidOS', 'Türkiye', '176.42.142.145', 'login', '2023-12-28 01:45:58', '2023-12-28 01:45:58'),
('ee485282-d5d5-415c-8946-16fa57fd8f79', 'phone', 'Chrome version-120.0.0.0', 'AndroidOS', 'Türkiye', '176.42.142.145', 'login', '2023-12-28 01:48:19', '2023-12-28 01:48:19'),
('ee485282-d5d5-415c-8946-16fa57fd8f79', 'phone', 'Chrome version-120.0.0.0', 'AndroidOS', 'Türkiye', '176.42.142.145', 'logout', '2023-12-28 01:52:14', '2023-12-28 01:52:14'),
('6b45b07e-0969-4bae-bd21-fc7e7597ef8d', 'desktop', 'Safari version-16.6', 'OS X', 'Greece', '85.74.92.13', 'login', '2023-12-28 09:54:59', '2023-12-28 09:54:59'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-120.0.0.0', 'Windows', 'Türkiye', '176.42.142.145', 'login', '2023-12-28 18:24:43', '2023-12-28 18:24:43'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-120.0.0.0', 'Windows', 'Türkiye', '176.42.142.145', 'login', '2023-12-29 11:34:19', '2023-12-29 11:34:19'),
('6b45b07e-0969-4bae-bd21-fc7e7597ef8d', 'desktop', 'Safari version-16.6', 'OS X', 'Greece', '85.74.92.13', 'login', '2023-12-29 13:42:33', '2023-12-29 13:42:33'),
('6b45b07e-0969-4bae-bd21-fc7e7597ef8d', 'desktop', 'Safari version-16.6', 'OS X', 'Greece', '85.74.92.13', 'logout', '2023-12-29 13:49:27', '2023-12-29 13:49:27'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Edge version-120.0.0.0', 'Windows', 'Iran', '151.241.217.15', 'login', '2023-12-30 01:48:22', '2023-12-30 01:48:22'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-119.0.0.0', 'Linux', 'Iran', '94.183.230.241', 'login', '2023-12-30 04:23:04', '2023-12-30 04:23:04'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Firefox version-121.0', 'Windows', 'Iran', '151.240.246.141', 'login', '2023-12-30 08:35:15', '2023-12-30 08:35:15'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Safari version-17.2.1', 'OS X', 'Türkiye', '45.156.30.5', 'login', '2024-01-01 18:27:33', '2024-01-01 18:27:33'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-120.0.0.0', 'OS X', 'Türkiye', '45.156.30.5', 'login', '2024-01-01 18:38:55', '2024-01-01 18:38:55'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-120.0.0.0', 'Windows', 'Iran', '151.246.212.89', 'login', '2024-01-04 04:28:34', '2024-01-04 04:28:34'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-120.0.0.0', 'Windows', 'Iran', '37.137.13.249', 'login', '2024-01-06 12:02:33', '2024-01-06 12:02:33'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-120.0.0.0', 'Windows', 'Iran', '37.221.18.77', 'login', '2024-01-07 05:27:52', '2024-01-07 05:27:52'),
('d7ce0527-5843-4fd4-9253-ec190e726a4a', 'desktop', 'Chrome version-120.0.0.0', 'Windows', 'India', '136.185.191.98', 'login', '2024-01-07 08:46:17', '2024-01-07 08:46:17'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-120.0.0.0', 'Windows', 'United Kingdom', '198.244.198.101', 'login', '2024-01-08 03:54:41', '2024-01-08 03:54:41'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-120.0.0.0', 'Windows', 'Turkey', '185.17.136.148', 'login', '2024-01-09 09:31:08', '2024-01-09 09:31:08'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Firefox version-121.0', 'Windows', 'Sweden', '188.149.177.200', 'login', '2024-01-09 11:41:42', '2024-01-09 11:41:42'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Firefox version-121.0', 'Windows', 'Iran', '5.190.74.3', 'login', '2024-01-10 06:47:28', '2024-01-10 06:47:28'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-120.0.0.0', 'Windows', 'Iran', '94.139.165.230', 'login', '2024-01-11 04:37:51', '2024-01-11 04:37:51'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'phone', 'Safari version-17.1.2', 'iOS', 'Iran', '93.110.231.71', 'login', '2024-01-11 04:37:57', '2024-01-11 04:37:57'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-120.0.0.0', 'Windows', 'Finland', '65.108.27.221', 'login', '2024-01-13 03:25:28', '2024-01-13 03:25:28'),
('88f8082d-7f6a-44f3-8782-d0be24853117', 'phone', 'Chrome version-120.0.0.0', 'AndroidOS', 'Iran', '95.38.229.61', 'login', '2024-01-13 22:13:54', '2024-01-13 22:13:54'),
('88f8082d-7f6a-44f3-8782-d0be24853117', 'phone', 'Chrome version-120.0.0.0', 'AndroidOS', 'United States', '5.161.100.12', 'login', '2024-01-14 10:25:22', '2024-01-14 10:25:22'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-120.0.0.0', 'Windows', 'France', '151.80.10.33', 'login', '2024-01-15 09:25:09', '2024-01-15 09:25:09'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Firefox version-121.0', 'OS X', 'Germany', '148.251.78.203', 'login', '2024-01-16 04:00:02', '2024-01-16 04:00:02'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-109.0.0.0', 'Windows', 'Türkiye', '45.156.29.152', 'login', '2024-01-18 16:00:59', '2024-01-18 16:00:59'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-109.0.0.0', 'Windows', 'Türkiye', '45.156.29.152', 'logout', '2024-01-18 16:07:20', '2024-01-18 16:07:20'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'phone', 'Chrome version-120.0.0.0', 'AndroidOS', 'The Netherlands', '163.172.222.177', 'login', '2024-01-19 13:56:05', '2024-01-19 13:56:05'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Firefox version-121.0', 'Windows', 'Iran', '178.131.131.109', 'login', '2024-01-19 18:19:31', '2024-01-19 18:19:31'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-120.0.0.0', 'Windows', 'Switzerland', '146.70.134.177', 'login', '2024-01-20 05:56:44', '2024-01-20 05:56:44'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'phone', 'Safari version-17.1.2', 'iOS', 'Germany', '148.251.78.203', 'login', '2024-01-20 06:14:51', '2024-01-20 06:14:51'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Firefox version-121.0', 'Windows', 'Switzerland', '146.70.134.177', 'login', '2024-01-20 06:15:13', '2024-01-20 06:15:13'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-118.0.0.0', 'Windows', 'Russia', '178.187.71.122', 'login', '2024-01-22 02:40:20', '2024-01-22 02:40:20'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-118.0.0.0', 'Windows', 'Russia', '178.187.71.122', 'logout', '2024-01-22 02:44:45', '2024-01-22 02:44:45'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-118.0.0.0', 'Windows', 'Russia', '178.187.71.122', 'login', '2024-01-22 02:45:23', '2024-01-22 02:45:23'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-118.0.0.0', 'Windows', 'Russia', '178.187.71.122', 'login', '2024-01-22 02:46:24', '2024-01-22 02:46:24'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-118.0.0.0', 'Windows', 'Russia', '178.187.71.122', 'logout', '2024-01-22 03:12:35', '2024-01-22 03:12:35'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'phone', ' version-', 'AndroidOS', 'Russia', '85.140.162.43', 'login', '2024-01-22 03:13:12', '2024-01-22 03:13:12'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-118.0.0.0', 'Windows', 'Russia', '178.187.71.122', 'login', '2024-01-22 03:13:30', '2024-01-22 03:13:30'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-118.0.0.0', 'Windows', 'Russia', '178.187.71.122', 'login', '2024-01-23 05:27:47', '2024-01-23 05:27:47'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-118.0.0.0', 'Windows', 'Russia', '178.187.71.122', 'login', '2024-01-23 05:27:47', '2024-01-23 05:27:47'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'phone', 'Chrome version-120.0.0.0', 'AndroidOS', 'Russia', '85.140.162.199', 'login', '2024-01-23 14:14:36', '2024-01-23 14:14:36'),
('89e4087c-1287-47c9-b101-f87da3cd0acb', 'desktop', 'Safari version-17.2.1', 'OS X', 'Iran', '2.147.200.1', 'login', '2024-01-24 06:50:28', '2024-01-24 06:50:28'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-120.0.0.0', 'Windows', 'India', '45.120.59.122', 'login', '2024-01-26 10:47:45', '2024-01-26 10:47:45'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'phone', 'Safari version-16.1', 'iOS', 'India', '157.49.81.110', 'login', '2024-01-26 15:05:21', '2024-01-26 15:05:21'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-109.0.0.0', 'Windows', 'Türkiye', '194.29.55.152', 'login', '2024-01-27 16:24:40', '2024-01-27 16:24:40'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-109.0.0.0', 'Windows', 'Türkiye', '194.29.55.152', 'login', '2024-01-27 16:24:40', '2024-01-27 16:24:40'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-118.0.0.0', 'Windows', 'Russia', '37.23.82.134', 'login', '2024-01-28 06:02:56', '2024-01-28 06:02:56'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'phone', 'Chrome version-120.0.0.0', 'AndroidOS', 'Russia', '85.140.160.81', 'login', '2024-01-28 06:53:44', '2024-01-28 06:53:44'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'phone', 'Chrome version-120.0.0.0', 'AndroidOS', 'Russia', '85.140.160.81', 'login', '2024-01-28 06:54:15', '2024-01-28 06:54:15'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-120.0.0.0', 'Windows', 'Iran', '5.202.172.219', 'login', '2024-01-28 08:45:31', '2024-01-28 08:45:31'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-120.0.0.0', 'OS X', 'Canada', '207.47.197.32', 'login', '2024-01-28 23:36:12', '2024-01-28 23:36:12'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-109.0.0.0', 'Windows', 'Iran', '2.147.51.57', 'login', '2024-01-29 18:10:33', '2024-01-29 18:10:33'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-120.0.0.0', 'Windows', 'India', '45.120.59.122', 'login', '2024-01-30 08:20:41', '2024-01-30 08:20:41'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Firefox version-122.0', 'OS X', 'Germany', '148.251.78.203', 'login', '2024-01-31 05:02:13', '2024-01-31 05:02:13'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-120.0.0.0', 'Windows', 'Germany', '104.28.249.87', 'login', '2024-01-31 08:31:22', '2024-01-31 08:31:22'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Firefox version-122.0', 'OS X', 'Germany', '148.251.78.203', 'login', '2024-02-01 09:20:29', '2024-02-01 09:20:29'),
('1ba19fda-1281-47fd-9059-c26571b6edc8', 'desktop', 'Firefox version-122.0', 'Windows', 'Iran', '62.102.134.32', 'login', '2024-02-01 21:53:51', '2024-02-01 21:53:51'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-121.0.0.0', 'Windows', 'Turkey', '188.213.34.178', 'login', '2024-02-02 05:15:25', '2024-02-02 05:15:25'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-121.0.0.0', 'Windows', 'Venezuela', '38.92.114.50', 'login', '2024-02-06 13:56:19', '2024-02-06 13:56:19'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-121.0.0.0', 'Windows', 'India', '45.120.59.122', 'login', '2024-02-09 11:14:44', '2024-02-09 11:14:44'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'phone', 'Chrome version-120.0.0.0', 'AndroidOS', 'Germany', '38.242.194.141', 'login', '2024-02-10 17:45:15', '2024-02-10 17:45:15'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-121.0.0.0', 'Windows', 'Germany', '5.75.198.152', 'login', '2024-02-11 10:17:20', '2024-02-11 10:17:20'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-121.0.0.0', 'Windows', 'Germany', '5.75.198.152', 'logout', '2024-02-11 10:36:21', '2024-02-11 10:36:21'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'phone', 'Chrome version-121.0.0.0', 'AndroidOS', 'Russia', '85.140.160.50', 'login', '2024-02-12 14:19:04', '2024-02-12 14:19:04'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'phone', 'Chrome version-121.0.0.0', 'AndroidOS', 'Russia', '85.140.160.50', 'login', '2024-02-12 14:19:08', '2024-02-12 14:19:08'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Firefox version-122.0', 'Windows', 'Iran', '178.131.128.16', 'login', '2024-02-12 16:14:17', '2024-02-12 16:14:17'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-120.0.0.0', 'Windows', 'Russia', '37.23.90.219', 'login', '2024-02-13 20:08:24', '2024-02-13 20:08:24'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-121.0.0.0', 'Windows', 'United Kingdom', '188.92.250.203', 'login', '2024-02-14 09:59:09', '2024-02-14 09:59:09'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-121.0.0.0', 'Windows', 'Iran', '5.115.86.176', 'login', '2024-02-16 19:52:15', '2024-02-16 19:52:15'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-120.0.0.0', 'Windows', 'Russia', '178.187.141.184', 'login', '2024-02-19 05:05:25', '2024-02-19 05:05:25'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-120.0.0.0', 'Windows', 'Russia', '178.187.141.184', 'login', '2024-02-19 05:05:29', '2024-02-19 05:05:29'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-120.0.0.0', 'Windows', 'Russia', '178.187.141.184', 'login', '2024-02-19 05:05:29', '2024-02-19 05:05:29'),
('fd1358e0-095d-4123-8649-e56751a08017', 'phone', 'Chrome version-121.0.0.0', 'AndroidOS', 'Somalia', '192.145.168.41', 'login', '2024-02-19 10:12:22', '2024-02-19 10:12:22'),
('07b97174-b6d2-48b5-a9a2-f8c1443eaf3e', 'phone', 'Safari version-17.2', 'iOS', 'Somalia', '192.145.174.141', 'login', '2024-02-19 11:06:27', '2024-02-19 11:06:27'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-121.0.0.0', 'Linux', 'Iran', '94.183.230.241', 'login', '2024-02-20 08:22:30', '2024-02-20 08:22:30'),
('e7c629dd-0b1e-4094-bc83-6c928f77b357', 'phone', 'Chrome version-121.0.0.0', 'AndroidOS', 'Switzerland', '37.120.213.238', 'login', '2024-02-20 15:08:13', '2024-02-20 15:08:13'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Safari version-16.3', 'OS X', 'Iran', '94.182.194.156', 'login', '2024-02-24 04:11:07', '2024-02-24 04:11:07'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Firefox version-122.0', 'Windows', 'Germany', '148.251.78.246', 'login', '2024-02-26 05:50:10', '2024-02-26 05:50:10'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-122.0.0.0', 'OS X', 'Iran', '94.183.230.241', 'login', '2024-02-26 08:23:52', '2024-02-26 08:23:52'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-121.0.0.0', 'Windows', 'Iran', '5.232.141.165', 'login', '2024-02-26 15:47:54', '2024-02-26 15:47:54'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-121.0.0.0', 'Windows', 'Iran', '5.232.141.165', 'logout', '2024-02-26 16:01:22', '2024-02-26 16:01:22'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-121.0.0.0', 'Windows', 'Venezuela', '38.92.114.30', 'login', '2024-02-27 05:03:02', '2024-02-27 05:03:02'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Firefox version-122.0', 'OS X', 'Germany', '148.251.78.246', 'login', '2024-02-28 05:32:48', '2024-02-28 05:32:48'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-121.0.0.0', 'Windows', 'Indonesia', '103.55.224.78', 'login', '2024-02-28 15:12:44', '2024-02-28 15:12:44'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-122.0.0.0', 'Windows', 'India', '45.120.59.124', 'login', '2024-02-29 09:05:44', '2024-02-29 09:05:44'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-122.0.0.0', 'Windows', 'India', '45.120.59.124', 'logout', '2024-02-29 12:49:59', '2024-02-29 12:49:59'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-122.0.0.0', 'Windows', 'India', '45.120.59.124', 'login', '2024-02-29 12:50:42', '2024-02-29 12:50:42'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'phone', 'Chrome version-105.0.0.0', 'AndroidOS', 'Iran', '5.124.117.37', 'login', '2024-02-29 14:26:55', '2024-02-29 14:26:55'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'phone', 'Chrome version-105.0.0.0', 'AndroidOS', 'Iran', '5.124.117.37', 'logout', '2024-02-29 14:31:25', '2024-02-29 14:31:25'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'phone', 'Chrome version-105.0.0.0', 'AndroidOS', 'Iran', '5.124.117.37', 'login', '2024-02-29 14:34:34', '2024-02-29 14:34:34'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-122.0.0.0', 'OS X', 'United States', '45.88.222.15', 'login', '2024-02-29 22:38:47', '2024-02-29 22:38:47'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-122.0.0.0', 'OS X', 'United States', '45.88.222.15', 'logout', '2024-02-29 22:42:06', '2024-02-29 22:42:06'),
('9ac62313-2179-4a80-8dcd-add2bba979e3', 'desktop', 'Chrome version-122.0.0.0', 'OS X', 'United States', '45.88.222.15', 'login', '2024-02-29 22:42:17', '2024-02-29 22:42:17'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-122.0.0.0', 'Windows', 'India', '45.120.59.124', 'login', '2024-02-29 22:44:00', '2024-02-29 22:44:00'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'phone', 'Chrome version-105.0.0.0', 'AndroidOS', 'Iran', '5.124.208.143', 'login', '2024-03-02 08:05:13', '2024-03-02 08:05:13'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'phone', 'Chrome version-105.0.0.0', 'AndroidOS', 'Iran', '5.124.67.253', 'login', '2024-03-02 14:50:54', '2024-03-02 14:50:54'),
('9ac62313-2179-4a80-8dcd-add2bba979e3', 'desktop', 'Chrome version-122.0.0.0', 'OS X', 'United States', '66.111.61.210', 'login', '2024-03-03 04:42:09', '2024-03-03 04:42:09'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-122.0.0.0', 'Windows', 'Türkiye', '185.217.143.167', 'login', '2024-03-03 11:27:18', '2024-03-03 11:27:18'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-122.0.0.0', 'Windows', 'Finland', '65.109.206.247', 'login', '2024-03-03 13:06:42', '2024-03-03 13:06:42'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'phone', 'Chrome version-105.0.0.0', 'AndroidOS', 'Iran', '5.218.143.173', 'login', '2024-03-04 08:17:35', '2024-03-04 08:17:35'),
('9be6a33a-4881-4556-a74d-41b341fbb550', 'desktop', 'Chrome version-117.0.0.0', 'Linux', 'United States', '104.225.112.165', 'login', '2024-03-04 17:15:00', '2024-03-04 17:15:00'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'phone', 'Chrome version-105.0.0.0', 'AndroidOS', 'Iran', '5.124.118.180', 'login', '2024-03-05 10:47:19', '2024-03-05 10:47:19'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-122.0.0.0', 'Windows', 'Iran', '5.212.254.254', 'login', '2024-03-08 11:52:41', '2024-03-08 11:52:41'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-122.0.0.0', 'Windows', 'Iran', '37.75.245.178', 'login', '2024-03-10 05:25:05', '2024-03-10 05:25:05'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-122.0.0.0', 'Windows', 'Iran', '5.160.52.234', 'login', '2024-03-11 08:53:43', '2024-03-11 08:53:43'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'phone', 'Chrome version-105.0.0.0', 'AndroidOS', 'Iran', '5.124.253.12', 'login', '2024-03-14 12:44:41', '2024-03-14 12:44:41'),
('424f12e9-bdd0-4ccb-9b38-8cdb74477600', 'desktop', 'Chrome version-121.0.0.0', 'Windows', 'Vietnam', '42.115.111.96', 'login', '2024-03-15 05:39:34', '2024-03-15 05:39:34'),
('424f12e9-bdd0-4ccb-9b38-8cdb74477600', 'desktop', 'Chrome version-122.0.0.0', 'Windows', 'Vietnam', '27.67.86.197', 'login', '2024-03-15 05:42:22', '2024-03-15 05:42:22'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'phone', 'Chrome version-105.0.0.0', 'AndroidOS', 'Iran', '5.123.112.10', 'login', '2024-03-16 05:32:03', '2024-03-16 05:32:03'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-122.0.0.0', 'Windows', 'Germany', '162.19.204.60', 'login', '2024-03-16 13:09:08', '2024-03-16 13:09:08'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Firefox version-123.0', 'OS X', 'Iran', '5.209.112.100', 'login', '2024-03-17 11:53:01', '2024-03-17 11:53:01'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'phone', 'Chrome version-105.0.0.0', 'AndroidOS', 'Iran', '5.124.116.173', 'login', '2024-03-18 05:49:32', '2024-03-18 05:49:32'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-122.0.0.0', 'Windows', 'Cambodia', '58.97.228.106', 'login', '2024-03-20 16:32:50', '2024-03-20 16:32:50'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'phone', 'Chrome version-105.0.0.0', 'AndroidOS', 'Iran', '5.124.153.236', 'login', '2024-03-21 07:18:48', '2024-03-21 07:18:48'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'phone', 'Chrome version-105.0.0.0', 'AndroidOS', 'Iran', '5.124.132.167', 'login', '2024-03-21 14:35:14', '2024-03-21 14:35:14'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-122.0.0.0', 'Windows', 'Indonesia', '103.55.224.132', 'login', '2024-03-21 15:34:56', '2024-03-21 15:34:56'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-122.0.0.0', 'Windows', 'Iran', '37.98.91.13', 'login', '2024-03-21 18:19:29', '2024-03-21 18:19:29'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'phone', 'Chrome version-105.0.0.0', 'AndroidOS', 'Iran', '5.123.104.116', 'login', '2024-03-22 05:52:11', '2024-03-22 05:52:11'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-122.0.0.0', 'Windows', 'Iran', '5.127.249.51', 'login', '2024-03-22 09:03:20', '2024-03-22 09:03:20'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-122.0.0.0', 'Windows', 'Iran', '5.127.249.51', 'logout', '2024-03-22 09:21:01', '2024-03-22 09:21:01'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-123.0.0.0', 'Windows', 'The Netherlands', '51.15.73.89', 'login', '2024-03-25 07:21:09', '2024-03-25 07:21:09'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-123.0.0.0', 'Windows', 'Iran', '2.190.22.84', 'login', '2024-03-30 08:04:08', '2024-03-30 08:04:08'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Firefox version-124.0', 'Windows', 'The Netherlands', '185.107.69.24', 'login', '2024-04-03 07:07:01', '2024-04-03 07:07:01'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-123.0.0.0', 'Windows', 'Greece', '31.152.189.126', 'login', '2024-04-04 11:42:11', '2024-04-04 11:42:11'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-123.0.0.0', 'Windows', 'Greece', '31.152.189.126', 'login', '2024-04-04 16:09:41', '2024-04-04 16:09:41'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-123.0.0.0', 'Windows', 'Greece', '31.152.189.126', 'login', '2024-04-04 21:00:11', '2024-04-04 21:00:11'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-123.0.0.0', 'Windows', 'Greece', '62.169.195.58', 'login', '2024-04-05 11:40:31', '2024-04-05 11:40:31'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-123.0.0.0', 'OS X', 'Iran', '37.156.155.68', 'login', '2024-04-08 13:13:03', '2024-04-08 13:13:03'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Firefox version-124.0', 'OS X', 'Iran', '5.209.163.214', 'login', '2024-04-09 01:21:42', '2024-04-09 01:21:42'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Firefox version-124.0', 'OS X', 'Germany', '148.251.78.246', 'login', '2024-04-09 10:41:05', '2024-04-09 10:41:05'),
('b5ecfddf-3c71-4e11-912e-2712607bddef', 'desktop', 'Chrome version-123.0.0.0', 'Windows', 'Germany', '103.75.197.8', 'login', '2024-04-09 17:10:19', '2024-04-09 17:10:19'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'phone', 'Chrome version-122.0.0.0', 'AndroidOS', 'Iran', '89.198.226.241', 'login', '2024-04-10 16:43:09', '2024-04-10 16:43:09'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-123.0.0.0', 'Windows', 'Türkiye', '176.42.136.52', 'login', '2024-04-11 11:10:29', '2024-04-11 11:10:29'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-123.0.0.0', 'Windows', 'Türkiye', '176.42.136.52', 'logout', '2024-04-11 12:44:12', '2024-04-11 12:44:12'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-123.0.0.0', 'Windows', 'Iran', '5.120.196.205', 'login', '2024-04-15 06:24:02', '2024-04-15 06:24:02'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-123.0.0.0', 'Windows', 'Iran', '178.131.139.34', 'login', '2024-04-15 06:39:53', '2024-04-15 06:39:53'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Firefox version-124.0', 'OS X', 'Germany', '148.251.78.246', 'login', '2024-04-16 04:26:09', '2024-04-16 04:26:09'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-123.0.0.0', 'Windows', 'Venezuela', '38.45.34.182', 'login', '2024-04-16 12:26:26', '2024-04-16 12:26:26'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-123.0.0.0', 'Linux', 'Iran', '5.115.15.221', 'login', '2024-04-18 14:21:55', '2024-04-18 14:21:55'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Firefox version-124.0', 'Windows', 'Germany', '116.202.98.42', 'login', '2024-04-19 07:09:11', '2024-04-19 07:09:11'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-124.0.0.0', 'Windows', 'Türkiye', '5.47.149.142', 'login', '2024-04-20 06:43:13', '2024-04-20 06:43:13'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-124.0.0.0', 'Windows', 'Türkiye', '5.47.149.142', 'logout', '2024-04-20 06:44:37', '2024-04-20 06:44:37'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-124.0.0.0', 'Windows', 'Türkiye', '5.47.149.142', 'logout', '2024-04-20 06:44:47', '2024-04-20 06:44:47'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-123.0.0.0', 'Windows', 'Iran', '5.160.122.242', 'login', '2024-04-20 07:19:47', '2024-04-20 07:19:47'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-123.0.0.0', 'Windows', 'Türkiye', '176.42.136.140', 'login', '2024-04-20 16:13:22', '2024-04-20 16:13:22'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-123.0.0.0', 'Windows', 'Iran', '151.244.209.239', 'login', '2024-04-20 21:04:43', '2024-04-20 21:04:43'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'desktop', 'Chrome version-123.0.0.0', 'Windows', 'Iran', '5.160.122.242', 'login', '2024-04-21 07:32:12', '2024-04-21 07:32:12'),
('ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'phone', 'Chrome version-117.0.0.0', 'AndroidOS', 'Iran', '5.117.5.48', 'login', '2024-04-21 09:10:21', '2024-04-21 09:10:21');

-- --------------------------------------------------------

--
-- Table structure for table `user_preferences`
--

CREATE TABLE `user_preferences` (
  `id` char(36) NOT NULL,
  `user_id` char(36) NOT NULL,
  `default_language` char(36) DEFAULT NULL,
  `default_coin_pair` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_preferences`
--

INSERT INTO `user_preferences` (`id`, `user_id`, `default_language`, `default_coin_pair`) VALUES
('1c6152c0-bc1f-4f84-8804-1e51fdd59052', '66a1e840-7ddb-4a17-988f-da8c948dc2a7', 'en', NULL),
('27067053-f3ac-4f11-9409-a4fa7f673427', 'c71eeafd-849d-4cb7-8275-1ebcd9ac93d8', 'en', 'USDT_BTC'),
('34e77f63-41d6-482c-8204-54998cfb748a', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'en', 'BTC_USDT'),
('38d03d63-b131-42e1-8963-099421897a9e', '6c2de49b-66b3-482d-bf48-8b690f86deff', 'en', NULL),
('55c21455-ef96-4446-8155-4fd5a85dd1c4', 'e7862d9c-fba8-4509-b59b-a4cb4f71ba04', 'en', NULL),
('5a814cf7-21a1-495c-95e4-0d6f5a8cf6e5', '6eb3595c-031c-4f55-abee-80cf6d8c816b', 'en', NULL),
('6aae7066-911f-40e1-ae3b-17b9b5edb4a3', 'a502eb20-d81c-4f3e-a56f-11444fe1e4cb', 'fa', 'TRX_USDT'),
('79ec0137-ebfb-48b6-afa1-8954c24cb6d2', '96f24f53-91db-4ab4-80ae-589139774970', 'en', NULL),
('80a8e123-cf88-4974-ba70-c3963dcab4a6', '7109c567-63f7-4d17-a2d5-a518e560408e', 'en', NULL),
('81c8a75a-8ab9-406b-85a2-bcff528b4c50', '6b45b07e-0969-4bae-bd21-fc7e7597ef8d', 'en', 'BTC_USDT'),
('8226ac59-76f8-4541-9e15-176382964f1b', '2446118a-33ae-4cb4-8ca9-4e1c8dd68f4f', 'en', 'ETH_USDT'),
('82cd7369-eaf6-4d64-ad18-a15872b021e9', 'eb0d5cb2-a937-4d7e-9e4d-cbd10c9948a3', 'fa', NULL),
('89610e5b-7087-4dae-a01a-5cfbf92f213a', '3b4df004-bb15-4c73-b23e-f7d614f64b8e', 'fa', NULL),
('9e23154c-c32d-4ade-ad7e-25706438d03c', '88f8082d-7f6a-44f3-8782-d0be24853117', 'fa', NULL),
('bd8740b6-dfa3-42e1-bede-a6ed10093e5c', '44d4809d-28e1-4685-b15c-dc11134fdf1d', 'en', NULL),
('d878225c-f54d-4497-95d1-5ab9c9ab1dac', 'e18c768d-25b2-4d22-bf2c-1a9115c7ec71', 'en', NULL),
('dabc1b09-86db-41fe-96a7-9ab639edc19f', 'eeb02b68-6521-4a40-84ad-21a2d21aa440', 'en', NULL),
('dabf9ebe-4186-409d-a01e-839ddfec5bc4', 'b5ecfddf-3c71-4e11-912e-2712607bddef', 'en', NULL),
('f2640d25-8529-4c06-a033-27ea0cfc5bfc', '557a1889-0d7e-4e8c-a314-14e6c4004ee3', 'en', NULL),
('f92b2c22-7c70-4566-8a0c-e50315982dae', 'd86b3a4d-3a57-426e-8e1e-95a6be996bb5', 'en', NULL),
('fa6d20ad-ada6-44a6-b0d5-ebf65a4b3691', '47eaf168-5901-4ccb-8b9c-d7f9c754ed04', 'en', NULL),
('ffaf8370-05d4-4904-a402-4436c31f2a21', '12a277f5-c2ee-44a6-82da-f6f5e03758a9', 'en', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_profiles`
--

CREATE TABLE `user_profiles` (
  `id` char(36) NOT NULL,
  `user_id` char(36) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `address` text DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_profiles`
--

INSERT INTO `user_profiles` (`id`, `user_id`, `first_name`, `last_name`, `address`, `phone`, `birthday`, `created_at`, `updated_at`) VALUES
('01767d44-d04c-409a-97d6-c47b41cb054d', '557a1889-0d7e-4e8c-a314-14e6c4004ee3', 'Test', 'Test', NULL, NULL, '1999-12-15 00:00:00', '2023-12-15 20:53:09', '2023-12-15 20:53:09'),
('05105cbe-6de9-403a-b366-23669814b023', 'da77601a-40e5-4bb1-b584-2b82bd26370f', 'Test', 'Testawd', NULL, NULL, '2005-07-07 00:00:00', '2023-07-18 04:32:54', '2023-07-18 04:32:54'),
('07227bab-7933-4e86-80dc-170e7b9f4336', '6dd2b333-abab-4c57-b4f5-d33e4dd70f39', 'DANI', 'ARGELIA', NULL, NULL, '1992-12-29 00:00:00', '2023-08-04 16:40:57', '2023-08-04 16:40:57'),
('08131676-0bf3-4e5e-a676-6d481c898850', 'ff225515-4168-45de-929a-3c1dfb38cabf', 'محمد', 'بداقی', NULL, NULL, '2005-02-10 00:00:00', '2024-04-18 20:06:03', '2024-04-18 20:06:03'),
('0829f021-6c49-4f17-82f5-3a449fbfe9b1', 'ea3c376d-8e83-4e18-be5c-25fda612432f', 'اذر', 'حیدری', 'تست', NULL, NULL, '2023-05-07 06:37:12', '2023-05-08 02:02:12'),
('0c98ef57-21a4-4d2e-8730-098eb5a01392', '934ad33c-0304-4461-b0e5-ba8b3ca61ca1', 'jesus', 'rengel', NULL, NULL, '1988-07-14 00:00:00', '2023-03-06 12:12:00', '2023-03-06 12:12:00'),
('0d4b761b-b647-46ef-afaa-46c96e25425b', '6c2de49b-66b3-482d-bf48-8b690f86deff', 'Zahid', 'Kabir', NULL, NULL, '2004-02-09 00:00:00', '2023-12-11 08:46:05', '2023-12-11 08:46:05'),
('0fa5cbe3-5824-4396-8af5-6d4be7255156', 'c71eeafd-849d-4cb7-8275-1ebcd9ac93d8', 'MIGUEL ANGEL', 'CASINOS VALERO', '', NULL, '1964-05-22 00:00:00', '2023-06-04 15:02:20', '2024-02-27 05:04:56'),
('0fef559a-8a11-43ee-9232-ca7b965b9976', '62cb835b-6592-459f-a2e4-f6dc5b7ac7f1', 'Kanka', 'Sanka', NULL, NULL, '1999-01-01 00:00:00', '2023-03-21 19:12:27', '2023-03-21 19:12:27'),
('120f29be-0d81-49f2-b5f4-3bcea4aadcdb', '84344fd1-cc94-49dc-9872-21ce71be3f99', 'Amir', 'badie', 'Sss', NULL, NULL, '2024-03-05 10:54:42', '2024-03-05 10:54:42'),
('127ed330-0d3a-4a04-a74b-17fa6ac8571c', '4737ffad-8afe-4bbe-9c76-9ece9d55068f', 'JOSE ANTONIO', 'ECHEITA', '', NULL, '1954-05-11 00:00:00', '2023-06-14 13:49:44', '2023-11-22 09:12:32'),
('130f532e-aef9-4afe-973f-80f93e370794', '47eaf168-5901-4ccb-8b9c-d7f9c754ed04', 'jesus', 'rengel', NULL, NULL, '1988-07-14 00:00:00', '2023-05-31 10:02:57', '2023-05-31 10:02:57'),
('140a89dc-d0ba-46d0-b3a5-58bb074a7040', 'eb0d5cb2-a937-4d7e-9e4d-cbd10c9948a3', 'Ali', 'Hosseini', NULL, NULL, '1983-08-29 00:00:00', '2023-03-13 08:46:02', '2023-03-13 08:46:02'),
('146c839e-5279-48de-82b9-9e742605036a', '8208d769-48db-4e2f-8831-f48ead232203', 'tempp', 'tempp', NULL, NULL, NULL, '2023-04-04 15:53:03', '2023-04-04 15:53:03'),
('1a450862-d0e2-4bd1-b0ec-a6bea8675e90', '5e5189aa-f3b7-4e90-ab71-48eb3d97bf08', 'Ss', 'Kumar', NULL, NULL, '2023-04-06 00:00:00', '2023-04-29 11:33:51', '2023-04-29 11:33:51'),
('1b01edd1-ff2b-42dd-8858-48114d84ebc8', '5a03c1e3-f18c-41da-b6c6-d372ca6ade8c', 'ish', 'aaa', NULL, NULL, '1990-03-13 00:00:00', '2023-03-03 02:19:35', '2023-03-03 02:19:35'),
('1c630f3f-951d-47a9-8ac0-fd045cb3cb6f', 'f9ca05bf-6025-4a42-87f1-78001c65886c', 'Kvng', 'Kvng', NULL, NULL, '1999-10-14 00:00:00', '2023-11-25 06:54:38', '2023-11-25 06:54:38'),
('1d604dd5-9d26-4e05-b65c-cf089fcc6cac', 'd7ce0527-5843-4fd4-9253-ec190e726a4a', 'Lucky', 'man', NULL, NULL, '2029-04-17 00:00:00', '2024-01-07 08:46:06', '2024-01-07 08:46:06'),
('1eea3fe2-64b9-4a0d-9bbd-1c568648a3e3', '794254a9-ab67-4e67-8f36-861c423c29a8', 'مصطفی', 'خدایی', NULL, NULL, '2002-08-14 00:00:00', '2023-09-12 02:41:44', '2023-09-12 02:41:44'),
('1ffc0636-db03-42bd-8537-f516695e8d8a', '48073e55-f172-4b10-b11b-7203b2b5dbd1', 'Alexander', 'Khudyakov', '/ava/Raznoe_150x200/29.png', NULL, NULL, '2024-01-22 03:33:47', '2024-01-22 03:33:47'),
('216cd706-4590-4b68-8e37-4ee1f3fab30c', '492e02b7-cab9-42f2-9b42-6a6d373b2e24', 'charles', 'croy', NULL, NULL, '1982-01-30 00:00:00', '2023-03-12 20:45:35', '2023-03-12 20:45:35'),
('2557922a-90bc-4b6c-ae88-d34ece8c8523', 'e18c768d-25b2-4d22-bf2c-1a9115c7ec71', 'aaa', 'bbbb', NULL, NULL, '2000-11-21 00:00:00', '2023-03-02 08:49:16', '2023-03-02 08:49:16'),
('2a40b703-4ae1-46b7-9938-04d3ffdac29e', 'd86b3a4d-3a57-426e-8e1e-95a6be996bb5', 'Banfa', 'suso', 'Avda Juan Carlos 1 51 Baja B Corralejo zip code 35660 Las palmas', NULL, '1950-01-01 00:00:00', '2023-07-19 11:01:40', '2023-07-21 09:02:30'),
('30702134-623d-4438-a091-b2748d251102', 'd6ac746d-90e7-4a93-981d-5602b6324d4f', 'Raymond', 'Rager', NULL, NULL, '2000-02-01 00:00:00', '2023-09-29 09:43:08', '2023-09-29 09:43:08'),
('338d2a3b-5ede-4021-8f57-03e339c92885', '424f12e9-bdd0-4ccb-9b38-8cdb74477600', 'Chu', 'Đức Anh', NULL, NULL, '2005-05-17 00:00:00', '2024-03-15 05:39:22', '2024-03-15 05:39:22'),
('3746d133-28e2-408f-a815-4f59ab4c3041', '6b45b07e-0969-4bae-bd21-fc7e7597ef8d', 'costis', 'papadim', NULL, NULL, '1968-01-27 00:00:00', '2023-12-28 09:54:53', '2023-12-28 09:54:53'),
('389bd649-cbea-41a0-9c9b-02896f6ee67f', '52523c96-98e6-4e75-a1d8-e3cf094993a1', 'Francesc', 'Jean', '', NULL, '1985-06-12 00:00:00', '2023-08-20 08:45:28', '2023-11-14 10:04:09'),
('39b8a10f-cc1e-49a2-b206-b39a6060b995', '2ad4f58d-4cf4-446a-b767-e840add77549', 'Vural', 'Satıcı', NULL, NULL, '2000-02-27 00:00:00', '2023-02-27 08:58:16', '2023-02-27 08:58:16'),
('3a2a7edf-e5b2-4994-9c31-b521f6762dc2', 'd72e5177-9169-4d3b-a805-aa9a45da9c32', 'AURELIO', 'QUISPE', NULL, NULL, '1999-05-04 00:00:00', '2023-06-05 09:35:46', '2023-06-05 09:35:46'),
('3ca3c98c-c56d-11ed-b896-040300000000', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', 'Robot', 'Trader', 'Trader Robot', '+1 (205) 724-9145', NULL, '2023-03-18 09:13:12', '2023-03-18 09:13:12'),
('3e5cc6d9-786c-43dd-a36b-bd219cb95b92', '923956af-60ea-40f0-8065-aac5c4fb3791', 'Jerry', 'Kt', NULL, NULL, '2000-07-13 00:00:00', '2023-09-14 11:32:26', '2023-09-14 11:32:26'),
('444860d6-a84d-4da5-88f4-3d04eb64fb29', 'db5d841b-d90a-4437-957a-c7fb5fa86319', 'bob', 'willard', NULL, NULL, '2000-01-01 00:00:00', '2023-05-25 12:50:06', '2023-05-25 12:50:06'),
('4539ff05-d5c3-40f3-bb67-f9b20902f5e7', 'a01cd4e5-4cbb-48ab-bfde-2b558ab60d88', 'Eduar Alberto', 'paiba', NULL, NULL, '1977-02-02 00:00:00', '2023-07-20 08:02:36', '2023-07-20 08:02:36'),
('4a42521e-3af6-4862-8f13-7117ad077f93', '933d676a-c435-4697-bdf2-e54d026c156e', 'alirez', 'alireza', NULL, NULL, '1980-01-01 00:00:00', '2023-05-10 05:25:49', '2023-05-10 05:25:49'),
('4f7e4371-9354-4979-b7e0-4f2bfad523d4', '22fe5dc1-07ab-4809-8f56-8590c68d9ab3', 'test', 'test', NULL, NULL, '2005-03-02 00:00:00', '2023-03-02 15:03:32', '2023-03-02 15:03:32'),
('4ffeeb40-b258-425e-a90c-b4e3fc47f84e', 'f978562a-6102-47ef-b44c-00962596e9e4', 'ANA', 'CARRILLO', NULL, NULL, '1983-12-14 00:00:00', '2023-06-12 10:53:36', '2023-06-12 10:53:36'),
('5140d189-8022-4d08-9183-79a3d0c44fe9', 'eeb02b68-6521-4a40-84ad-21a2d21aa440', 'Carlos', 'Gonzalez', NULL, NULL, '2000-10-03 00:00:00', '2023-03-06 12:15:25', '2023-03-06 12:15:25'),
('535b9fd0-3c1f-45a6-a3bc-52f141fbb632', '6c9d2b9b-812c-4ba7-9bbe-66d940eaa5bb', 'mohamad', 'sarayi', NULL, NULL, '1989-03-16 00:00:00', '2023-04-05 10:38:05', '2023-04-05 10:38:05'),
('56c30866-410c-4686-abdd-3530affff7c0', 'ff837428-0711-4c3c-91a6-dd44e69ca5e7', 'sanjay', 'shukla', NULL, NULL, '1989-11-22 00:00:00', '2023-10-28 11:06:50', '2023-10-28 11:06:50'),
('587c938d-e6e7-43c4-b7a8-695bd5efb056', 'cda51314-c8fb-414d-9f56-fb848e43077a', 'ghkmgvj', 'Vpkuser', NULL, NULL, '1999-03-11 00:00:00', '2023-09-18 08:28:42', '2023-09-18 08:28:42'),
('5b172b60-de41-4b22-a1c1-07cc5cc7c3a9', 'fd1358e0-095d-4123-8649-e56751a08017', 'Jj', 'Iii', NULL, NULL, '2000-03-02 00:00:00', '2024-02-19 10:12:15', '2024-02-19 10:12:15'),
('5c558034-8d91-4f0d-9e51-620e2c23dada', '48ace508-5a29-483a-92d6-e1dc362baee8', 'azar', 'theme', NULL, NULL, '1995-02-06 00:00:00', '2023-04-20 03:57:59', '2023-04-20 03:57:59'),
('5d7d2107-8d18-46a1-8b60-353ab3018ab1', '01bac2f0-2e3c-4116-a7fb-61c4d149a2e6', 'paola', 'Arteaga', NULL, NULL, '1979-11-28 00:00:00', '2023-06-12 10:22:18', '2023-06-12 10:22:18'),
('5f264392-c71b-4b7c-a437-f3830f15429a', '09ae0ce6-3b8a-4a8a-ac2f-3919888e47aa', 'keith', 'anderson', NULL, NULL, '1999-05-08 00:00:00', '2023-03-21 17:02:18', '2023-03-21 17:02:18'),
('5fc15040-0de9-4e13-9b00-07407e0f0d5c', '7db45872-7279-474d-aa0d-d56723822162', 'aaa', 'reee', '', NULL, NULL, '2023-09-19 09:16:09', '2023-10-04 10:32:37'),
('61addfe8-7406-4121-bf73-641331419c9f', 'a502eb20-d81c-4f3e-a56f-11444fe1e4cb', 'user', 'user', '', NULL, NULL, '2023-03-02 15:01:25', '2023-09-17 18:30:17'),
('61fad74f-0908-4a3f-9cfc-d55cd7562f97', 'dff7716d-646f-48ee-8d87-a1f8461230d9', 'faik', 'can', NULL, NULL, '1900-03-15 00:00:00', '2023-03-30 10:13:16', '2023-03-30 10:13:16'),
('671a693d-e122-43b8-a27f-1bc6f91d4fb8', 'fb35867d-1db8-4b6d-9f19-54ab0b2ddab1', 'Abdelaziz', 'Elmghari', NULL, NULL, '1980-08-26 00:00:00', '2023-06-01 14:17:57', '2023-06-01 14:17:57'),
('6861bd39-c19c-4d98-bee3-f2388b5821b4', '96f24f53-91db-4ab4-80ae-589139774970', 'test', 'test', NULL, NULL, '1999-12-28 00:00:00', '2023-12-14 07:45:24', '2023-12-14 07:45:24'),
('69a9ff02-91a4-424d-87d5-aa96d390d368', '7109c567-63f7-4d17-a2d5-a518e560408e', 'Eliezer', 'Flores', NULL, NULL, '2000-04-11 00:00:00', '2023-08-03 17:57:26', '2023-08-03 17:57:26'),
('6f27f046-e3f3-467e-9c94-157e1bd33d2a', '7b621b7c-6760-4430-9a30-10d8134b442e', 'Mohammad', 'Shahriari Fard', NULL, NULL, '1998-06-28 00:00:00', '2023-09-18 09:41:17', '2023-09-18 09:41:17'),
('731a43cb-261b-4110-bb30-ddd00483f249', '6800875b-c059-49a2-aec7-8612c7d402a1', 'Fei', 'Hong', NULL, NULL, '1960-02-03 00:00:00', '2023-09-09 22:04:27', '2023-09-09 22:04:27'),
('74215a00-d811-4e0e-95e0-6cc53fccee04', '34d2fe8e-ad62-4960-ba47-82234f81520b', 'jesus', 'vis', '', NULL, NULL, '2023-11-19 16:19:28', '2023-11-19 16:19:28'),
('77b998d3-31ec-4c90-b7d6-f27a4a237827', '66a1e840-7ddb-4a17-988f-da8c948dc2a7', 'ali', 'ali', NULL, NULL, '1980-01-01 00:00:00', '2023-03-11 10:39:55', '2023-03-11 10:39:55'),
('7ad12144-a943-4e46-832a-fe5c34db3a26', 'cb74f45c-280c-42fd-a06e-a4672280c040', 'ZAMAN', 'AGHA', '', NULL, '1964-07-09 00:00:00', '2023-07-21 16:30:06', '2023-12-18 16:25:25'),
('7dcccb13-f061-493b-9d3a-97bd6ceccd67', '1ba19fda-1281-47fd-9059-c26571b6edc8', 'mostafa', 'alizadeh', NULL, NULL, '1999-07-15 00:00:00', '2024-02-01 21:53:45', '2024-02-01 21:53:45'),
('7e0ef050-54b0-4d5f-926a-b7dae33573f8', '9be6a33a-4881-4556-a74d-41b341fbb550', 'Sophie', 'Marshall', NULL, NULL, '1980-08-12 00:00:00', '2024-03-04 17:14:49', '2024-03-04 17:14:49'),
('818e76a5-c496-4320-8272-4dc4efb74222', 'd7b4541b-1859-430b-889a-ed2af56aaf85', 'AMIR', 'BADIE', NULL, NULL, '2005-07-29 00:00:00', '2024-03-03 13:00:28', '2024-03-03 13:00:28'),
('825cb638-283d-4b69-9774-9e1bfd615085', '6bb43481-d32b-4038-9358-85a962250b5c', 'longo', 'jimmy', NULL, NULL, '2000-06-15 00:00:00', '2023-04-29 08:37:43', '2023-04-29 08:37:43'),
('85104f8a-1d97-4ceb-b3ba-eb9fa8678977', '1ac9db2f-613b-4351-ba36-aa8a8e502079', 'enrique', 'alvarez', NULL, NULL, '1969-12-15 00:00:00', '2023-06-02 16:36:16', '2023-06-02 16:36:16'),
('86dc2cb8-c503-4289-8835-668c0a77d720', '8dec10ce-9070-4fa3-b678-2ce86b550204', 'ebi', 'mo', NULL, NULL, '2005-07-14 00:00:00', '2024-02-29 07:35:48', '2024-02-29 07:35:48'),
('87924560-3088-4d26-bfea-acd0710b162e', '89e4087c-1287-47c9-b101-f87da3cd0acb', 'سپهر', 'صفایی', NULL, NULL, '2000-01-03 00:00:00', '2024-01-24 06:50:23', '2024-01-24 06:50:23'),
('892536e2-bf6b-4465-8a44-eccbb5eca6e2', '98697609-12a9-4415-a700-07de18f31ba9', 'Andres', 'Gonzales', '', NULL, '1984-07-18 00:00:00', '2023-07-18 08:34:19', '2023-07-18 20:12:49'),
('8bd3d040-f8ef-46f2-8766-d98c2fb0877c', 'd2b09976-3be3-43e8-81ef-d0dd81784cdf', 'MONICA', 'KELLER', NULL, NULL, '1969-03-27 00:00:00', '2023-07-26 10:01:28', '2023-07-26 10:01:28'),
('8d2bc7ca-1b35-4bfe-b0d6-a7917323c90c', '6eb3595c-031c-4f55-abee-80cf6d8c816b', 'admin', 'admin', NULL, NULL, '2023-02-12 00:00:00', '2023-03-02 14:56:34', '2023-03-02 14:56:34'),
('8d603849-c329-4c7a-84f0-bcaa5c6b60ff', '12a277f5-c2ee-44a6-82da-f6f5e03758a9', 'diego', 'genoveva', NULL, NULL, '1985-11-28 00:00:00', '2023-06-01 13:16:13', '2023-06-01 13:16:13'),
('91358793-af16-45ce-8830-d0cf6cd92e87', '57cfdde8-b3bb-4020-bd29-83cc9575bdcf', 'Jeremias', 'Investpro', 'Estados unidos', NULL, NULL, '2023-05-30 10:29:47', '2023-05-30 10:29:47'),
('9269f001-92d6-4a86-b8b3-14d22b75e0f0', 'e5720c7b-8502-4a3a-9ee9-8896436a41d4', 'raquel', 'cermeno', '', NULL, NULL, '2023-07-18 20:08:22', '2023-07-18 20:08:22'),
('95770398-677a-43c6-8dfb-a5c4b12811f7', '9e207066-ad6c-4c73-b26a-22142f5d6eec', 'JOSE', 'MANCILLA', NULL, NULL, '1968-02-10 00:00:00', '2023-10-23 14:18:32', '2023-10-23 14:18:32'),
('9775e164-bb42-43d9-8632-3eadb3e78bcb', 'ecbb1278-fb14-4952-8ef9-fc77aef93d3d', 'demo', 'tunde', NULL, NULL, '1996-05-06 00:00:00', '2023-08-14 19:22:20', '2023-08-14 19:22:20'),
('9b9cf51b-593d-461c-91c5-98a89311ad2c', '86f3c2c9-e4c3-4192-ad1e-d34a6b188833', 'raquel', 'cermeno', NULL, NULL, '1956-12-27 00:00:00', '2023-07-18 20:16:27', '2023-07-18 20:16:27'),
('9bb9ebc4-d10c-44ba-82c1-34cc00f75424', '2446118a-33ae-4cb4-8ca9-4e1c8dd68f4f', 'DIEGO', 'DIEGO', NULL, NULL, '2014-06-03 00:00:00', '2023-10-17 18:53:19', '2023-10-17 18:53:19'),
('a1ae5462-83cb-4616-abfb-10a4be0229e0', 'abe08840-cedb-437d-9054-f6ca53045f5d', 'Jodi', 'Vinson', NULL, NULL, '2001-03-08 00:00:00', '2023-12-17 22:28:23', '2023-12-17 22:28:23'),
('a258eec4-81b6-42fb-97f6-5378929b5073', '3b4df004-bb15-4c73-b23e-f7d614f64b8e', 'امیر', 'غفاری', NULL, NULL, '1995-06-03 00:00:00', '2023-11-05 16:40:11', '2023-11-05 16:40:11'),
('a2e34325-065a-4e86-9f04-12e132646641', '6f1ba6d2-22bf-4291-977d-534ac1aff4d8', 'Neil', 'Carl', NULL, NULL, '1999-06-07 00:00:00', '2023-12-24 08:03:47', '2023-12-24 08:03:47'),
('a574990f-fc7d-4cc4-8287-4da8d5e5a5d5', 'c275436b-9379-4114-9770-9e6d376488cd', 'usman', 'shamas', NULL, NULL, '2000-11-28 00:00:00', '2023-05-20 11:07:25', '2023-05-20 11:07:25'),
('ad59fa10-198b-4e56-ab8a-13224913f708', '47dea59c-e88d-4c15-ad52-fa0dc6de1631', 'ko', 'joe', NULL, NULL, '1990-03-07 00:00:00', '2023-10-25 04:43:52', '2023-10-25 04:43:52'),
('b0b43f64-072f-4039-8163-9cda6c9bf978', '625c7cbe-2e20-406b-911b-a8ae59dfe2fe', 'aliiii', 'testttt', NULL, NULL, NULL, '2023-10-23 07:09:31', '2023-10-23 07:09:31'),
('b767bde9-cbb1-4f57-8693-bd919814edf5', 'b5ecfddf-3c71-4e11-912e-2712607bddef', 'Ab', 'Cd', NULL, NULL, '2000-02-01 00:00:00', '2024-04-09 17:09:57', '2024-04-09 17:09:57'),
('b87231f2-d560-4f4d-a725-95799a2b8696', 'adc69fe5-342e-4db7-83d6-1aa6b50e4217', 'Jesus', 'Rengel', NULL, NULL, '1990-02-14 00:00:00', '2023-04-21 13:12:52', '2023-04-21 13:12:52'),
('bb0ec226-0078-4898-b819-b7f1114c8426', 'c034dc12-2661-4cd4-b118-febdc33c27e6', 'Mara', 'camenforte', NULL, NULL, '1952-09-15 00:00:00', '2023-10-04 10:27:03', '2023-10-04 10:27:03'),
('bc988f6b-fe75-4260-a36a-80b8441f5f6e', '6cd1a9e7-a910-43c8-a930-95dcb2c8edca', 'Higinio Cordoba', 'Sanchez', NULL, NULL, '1979-12-16 00:00:00', '2023-08-07 18:13:48', '2023-08-07 18:13:48'),
('bed297ae-2cce-4017-9cde-692bf3d81c74', '04b781e1-0a41-4703-888f-468243ebda36', 'amir', 'amir', NULL, NULL, '2023-04-06 00:00:00', '2023-04-03 18:33:53', '2023-04-03 18:33:53'),
('c0725985-bf06-4141-ae94-c1b48eba2722', 'cdc7f9c6-150b-4b90-bc4a-8ce2f71f5c83', 'Baeza', 'genoveva', '', NULL, NULL, '2023-06-01 13:06:38', '2023-06-01 13:09:42'),
('c34d00c2-2d67-4350-92c0-fc7e9267ac53', '467671a6-55bc-4527-ba1f-d0d2b562fca4', 'Juan', 'Perez', NULL, NULL, '1975-10-09 00:00:00', '2023-06-06 14:15:44', '2023-06-06 14:15:44'),
('c5f621f2-5414-40a2-afdc-4b5206e65989', '36f5887f-2b9b-4144-879c-9be2cff7e466', 'JOSE', 'MARCIAL', NULL, NULL, '1949-01-01 00:00:00', '2023-06-13 01:18:02', '2023-06-13 01:18:02'),
('c6ca4658-2c04-4c66-beab-f150cc8cf350', '8bc2d325-279d-4cb5-8245-87e524f33587', 'temp', 'temp', NULL, NULL, NULL, '2023-04-04 15:34:21', '2023-04-04 15:34:21'),
('c6d0610b-952a-407c-8c51-1736fdc76c79', 'cf37d061-aa9c-460d-9701-66439afc812d', 'Mari', 'nieves muatiz brion', '', NULL, '1957-12-24 00:00:00', '2023-06-13 13:21:15', '2023-07-03 11:29:52'),
('ce5c143c-e200-4f3a-886d-6f24397bc88a', '07b97174-b6d2-48b5-a9a2-f8c1443eaf3e', 'Abdisamad', 'Mohamed sheikh Abdullahi', NULL, NULL, '1994-06-01 00:00:00', '2024-02-19 11:06:14', '2024-02-19 11:06:14'),
('cea42d7b-a21f-4f37-b9f6-2f0e2fad67a7', '54bf8b4a-15aa-4277-9cee-3de49dd47367', 'Kiiiiu', 'Jssjjw', NULL, NULL, '0006-06-23 00:00:00', '2024-03-15 06:54:18', '2024-03-15 06:54:18'),
('d03391f3-57c0-46e3-b4bd-d91b5640581f', '32769d8c-4dca-40d5-83ec-99b68df4b130', 'jesus', 'rengel', NULL, NULL, '1988-07-14 00:00:00', '2023-03-06 12:10:50', '2023-03-06 12:10:50'),
('d05635d7-ccca-4e1e-b1b4-74dfff9c5d1e', 'ee485282-d5d5-415c-8946-16fa57fd8f79', 'John', 'Doe', NULL, NULL, '2023-12-03 00:00:00', '2023-12-28 01:45:37', '2023-12-28 01:45:37'),
('d4d9adfa-6796-40ae-9c9a-fc1afcfdcb60', 'f28bca5b-f561-4150-94f6-dd67ff4f8470', 'amir', 'badie', NULL, NULL, '1354-07-01 00:00:00', '2024-03-22 05:40:24', '2024-03-22 05:40:24'),
('d5811aac-32cb-4988-a505-eeb9bff6ce72', 'fb30fcec-0d29-4e8a-aba9-6ec50a6c03fc', 'mohammad fallah', 'Fallah', NULL, NULL, '1980-06-04 00:00:00', '2024-04-20 06:46:37', '2024-04-20 06:46:37'),
('d659669f-e5f8-485a-97bd-47b6d8533839', '44d4809d-28e1-4685-b15c-dc11134fdf1d', 'jose luis', 'rodriguez vega', NULL, NULL, '1947-08-30 00:00:00', '2023-07-20 09:58:46', '2023-07-20 09:58:46'),
('decbb090-f357-45ab-ba20-d84fb4d7b0dc', '7cde25b7-e520-4fb3-85df-f5fcf89305d3', 'Iris', 'fuentes real', NULL, NULL, '1971-12-03 00:00:00', '2023-06-09 13:43:35', '2023-06-09 13:43:35'),
('df0fdc53-4f02-4b8d-b38b-03a2c9d860cf', '9ac62313-2179-4a80-8dcd-add2bba979e3', 'Caleb', 'Unity', NULL, NULL, '1991-06-20 00:00:00', '2024-02-29 22:36:58', '2024-02-29 22:36:58'),
('e45147d1-b4c0-4013-a4bf-fd410251fc40', 'b9ec7d63-015c-4814-b253-eb1d45eae4dd', 'Dolores', 'Gutierrez Gonzalez', '', NULL, '1989-01-18 00:00:00', '2023-06-07 13:12:27', '2023-06-20 13:49:25'),
('e4b03178-bfd2-4ac7-85d1-f8d1eb8d85c8', '3197597e-5470-45e4-afc1-0b2292d2158e', 'Chinedu', 'Edeh', NULL, NULL, '2004-08-27 00:00:00', '2023-12-17 22:33:42', '2023-12-17 22:33:42'),
('ed7e9254-6a82-4318-b46b-9fe58fac4021', 'eee37105-c97d-4f77-a933-910a0c6e68bc', 'test', 'payment', NULL, NULL, '2004-06-15 00:00:00', '2023-10-21 21:22:10', '2023-10-21 21:22:10'),
('ef0a5c1f-7086-4ae1-a8e3-a71674556cc1', 'e7c629dd-0b1e-4094-bc83-6c928f77b357', 'Abdurahman', 'Abduqadir', NULL, NULL, '1999-07-14 00:00:00', '2024-02-20 15:07:47', '2024-02-20 15:07:47'),
('f4a0dce8-07bf-4ad6-bcfb-2896399c7348', 'e7862d9c-fba8-4509-b59b-a4cb4f71ba04', 'CRISTIAN', 'ROBLES', '', NULL, '1945-01-19 00:00:00', '2023-07-25 05:19:47', '2024-02-06 15:05:40'),
('f5838254-38ea-4921-a9f9-ad3d29cbae43', '675d5181-9662-4d5a-8e29-924e2b58b24f', 'IGNACIO', 'RUIZ', NULL, NULL, '1992-10-19 00:00:00', '2023-07-25 15:39:19', '2023-07-25 15:39:19'),
('f5c43463-26ff-4228-9fb2-fb63fc5c22e1', '88f8082d-7f6a-44f3-8782-d0be24853117', 'Mohammad', 'Mojoudi', NULL, NULL, '1970-03-29 00:00:00', '2023-09-10 14:17:32', '2023-09-10 14:17:32'),
('f7dffae7-2cac-4467-a61f-dd04fdebaf14', '5b4cd7b8-8ae3-4a91-a25b-cc785c061b14', 'jeremias', 'fxinvestpro', NULL, NULL, '1965-06-18 00:00:00', '2023-06-05 10:54:16', '2023-06-05 10:54:16'),
('f7e9a3fd-2896-4872-8fa0-4845e24dada2', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'Codemen', 'Co', NULL, NULL, NULL, '2023-02-25 06:25:58', '2023-02-25 06:25:58'),
('fc617070-2627-45a2-90d1-fb934ec1d1b7', '9fad722d-6b02-4504-b431-ed6f14b20847', 'amirr', 'rezaeeee', NULL, NULL, '2023-04-12 00:00:00', '2023-04-03 18:13:42', '2023-04-03 18:13:42'),
('fdebc5ac-6bed-408b-a0a0-f93cd3dd5e1f', '60145862-0641-4106-af67-8de47b916abe', 'MARIANO', 'DIEZ IZQUIERDO', '', NULL, '1999-06-15 00:00:00', '2023-06-05 09:54:36', '2023-12-14 13:00:47'),
('kocoin8c-c56d-11ed-b896-040300000000', 'kocoina8-bbd6-4f8b-9fbf-48711485ab8d', 'Kucoin', 'Api', 'Kucoin', '+1 (205) 724-9145', NULL, '2023-03-18 09:13:12', '2023-03-18 09:13:12');

-- --------------------------------------------------------

--
-- Table structure for table `wallets`
--

CREATE TABLE `wallets` (
  `id` char(36) NOT NULL,
  `user_id` char(36) NOT NULL,
  `symbol` varchar(255) NOT NULL,
  `primary_balance` decimal(32,8) UNSIGNED NOT NULL DEFAULT 0.00000000,
  `address` varchar(255) DEFAULT NULL,
  `passphrase` text DEFAULT NULL,
  `public_key` text DEFAULT NULL,
  `private_key` text DEFAULT NULL,
  `is_system_wallet` int(11) NOT NULL DEFAULT 0,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wallets`
--

INSERT INTO `wallets` (`id`, `user_id`, `symbol`, `primary_balance`, `address`, `passphrase`, `public_key`, `private_key`, `is_system_wallet`, `is_active`, `created_at`, `updated_at`) VALUES
('004334f2-8954-4363-b6b9-47d5f33ac9a8', 'cb74f45c-280c-42fd-a06e-a4672280c040', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-07-21 16:30:06', '2023-07-21 16:30:06'),
('004dd7f6-3a38-4180-8ad4-470a91f0581d', '5a03c1e3-f18c-41da-b6c6-d372ca6ade8c', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:33:02', '2023-05-21 10:33:02'),
('004f3262-00af-4c35-8926-8628970b1c42', '625c7cbe-2e20-406b-911b-a8ae59dfe2fe', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('00730b5f-91fa-4bd9-bf5b-df54706fb765', '62cb835b-6592-459f-a2e4-f6dc5b7ac7f1', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:31:50', '2023-05-21 10:31:50'),
('0104763f-c7fc-42ce-b175-12488de3b232', 'c71eeafd-849d-4cb7-8275-1ebcd9ac93d8', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('0120214d-e0da-4720-b52b-e68aa688e5c7', 'db5d841b-d90a-4437-957a-c7fb5fa86319', 'USD', 99999999999.99999999, NULL, NULL, NULL, NULL, 0, 1, '2023-05-25 12:50:06', '2023-05-28 08:59:36'),
('0186f4a2-bad6-487f-97d2-38cf37464e15', '7db45872-7279-474d-aa0d-d56723822162', 'TRX', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('01e3ab91-2c7d-4071-b67b-54ff358e5bca', 'kocoina8-bbd6-4f8b-9fbf-48711485ab8d', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:31:50', '2023-05-21 10:31:50'),
('01ed1896-0cda-4913-98e2-f84a913c7682', 'adc69fe5-342e-4db7-83d6-1aa6b50e4217', 'USD', 10000.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:33:02', '2023-05-30 10:21:02'),
('01ee2d65-c799-42d0-854a-83e464bf110e', '675d5181-9662-4d5a-8e29-924e2b58b24f', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-07-25 15:39:19', '2023-07-25 15:39:19'),
('0248f780-c142-45fb-8fc9-45309d0f6fac', '2446118a-33ae-4cb4-8ca9-4e1c8dd68f4f', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('029f0572-4b3c-4f85-9b28-943a59cd7c3e', '48ace508-5a29-483a-92d6-e1dc362baee8', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:25:43', '2023-05-21 10:25:43'),
('02eb1b9c-d680-4378-8060-f30896571301', '89e4087c-1287-47c9-b101-f87da3cd0acb', 'TRX', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('02ee2559-0747-4d0a-b3e6-f82bd710d493', '5e5189aa-f3b7-4e90-ab71-48eb3d97bf08', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:25:43', '2023-05-21 10:25:43'),
('03372e3f-d07a-4d16-a6dc-5a962c161203', '6b45b07e-0969-4bae-bd21-fc7e7597ef8d', 'USDT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('03e626fc-b41d-45b6-932f-d0af17eb5ca0', '6800875b-c059-49a2-aec7-8612c7d402a1', 'USDT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-09-09 22:04:27', '2023-09-09 22:04:27'),
('0449e966-cf3a-494b-a96e-8b6170093e83', 'dff7716d-646f-48ee-8d87-a1f8461230d9', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:25:43', '2023-05-21 10:25:43'),
('04a1bafd-e468-46e3-a68f-1bac9eab60a3', '2ad4f58d-4cf4-446a-b767-e840add77549', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:31:50', '2023-05-21 10:31:50'),
('04cca79b-a72a-413b-bcee-857c34b3f66f', '3b4df004-bb15-4c73-b23e-f7d614f64b8e', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('051bdca5-cfa6-43b2-81c5-fff2b8b0cfb0', '6dd2b333-abab-4c57-b4f5-d33e4dd70f39', 'TRX', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-08-04 16:40:57', '2023-08-04 16:42:03'),
('051c560f-da5b-401f-b6bb-4e7f03816665', 'e5720c7b-8502-4a3a-9ee9-8896436a41d4', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('05254bad-8c5c-4070-9d6e-9815906cb146', 'c034dc12-2661-4cd4-b118-febdc33c27e6', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('056c93c3-b591-4d54-b53b-fa9a3066859a', '7109c567-63f7-4d17-a2d5-a518e560408e', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('05d5f95f-d20a-46b6-835a-4f0bbb2fadc8', 'eee37105-c97d-4f77-a933-910a0c6e68bc', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('06aa9844-98db-42c5-91c4-eab1f8ddc8fd', '89e4087c-1287-47c9-b101-f87da3cd0acb', 'USDT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('06d25a31-fdf7-4df2-b7c1-dd33118b9880', 'c034dc12-2661-4cd4-b118-febdc33c27e6', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('0749789f-fe48-4792-82d4-0f64bd43ef79', 'cdc7f9c6-150b-4b90-bc4a-8ce2f71f5c83', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('0812e984-4b48-4798-b7c9-38ed5ab273ac', 'd86b3a4d-3a57-426e-8e1e-95a6be996bb5', 'USDT', 11000.00000000, 'TNDTZhLQiuzd1fdbdiLdiihW6uvEx7TeVt', NULL, 'eyJpdiI6IldsV0ZjZXk5SDZjaENPeHNrUGtFWGc9PSIsInZhbHVlIjoibG82b1FqRkJUSjVVZ1hyY2hsSWliVGRtMXd5d0x5L2cvZEl6V2ZLUkRQN1lBb2E5MTZ0M2VwMllJWnQ2T1BHYWlXYzVRMHI3d09pQWlKL2xYUm0zc0MwbnRZb3l5b1BCMmtxTmRQbHBxdnoyaHJLV2FvTFJKWVhjZldMTjU1QTlIdFFUVnlHaGJoNmFpMVZiMGhWVkQ2Rk80RFNEbFVidnhzZXFzcllpUUNXUmlPaTFtYk1lQ3c1YVplY2wzUWtIIiwibWFjIjoiYTUzMTUxMDM4ODc2YTNhYzdkODM4MDg2OTNjNGJmOWU0YzE1NWZhMDZmNDYzYjgxOTk0ZWRlNWZlNzFlYjdiMiIsInRhZyI6IiJ9', 'eyJpdiI6IldLZ2RyTmZDVzN3elUrWk9MUi94NkE9PSIsInZhbHVlIjoiWjZYN3ZVdlovZW1ZMGNReXNiS0NOekxJNmhyRnRRUjY0c0QzZVQ2dTNjamcvdVIwUXdMUjYxUFFJWVlYK3Z5Nmk0WXg4NGIyQlpiOGFNUHoyQ1A1elpsNVIva3VsZjMrbDkxUzg4bUdJQWM9IiwibWFjIjoiMDBmOGUwYmYyYjhiOWRiNDA5OTEyY2JlOTU4NGYyZGY0ZDkyNjFkY2QzM2M4MDAxNzFjODRlZjA1N2I2NWQ2NCIsInRhZyI6IiJ9', 0, 1, '2023-07-19 11:01:40', '2023-08-16 13:25:47'),
('08156c02-184a-4e50-a6dc-cae9abb6849f', '6c2de49b-66b3-482d-bf48-8b690f86deff', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('085718f3-3fb3-452e-a86d-1133cc05e551', 'fb35867d-1db8-4b6d-9f19-54ab0b2ddab1', 'USDT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-01 14:17:57', '2023-06-01 14:50:32'),
('0876a18b-4c8e-4ec5-a469-761632706848', '48ace508-5a29-483a-92d6-e1dc362baee8', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('0881a150-cf49-44b0-afc7-e52f8be11508', 'fb35867d-1db8-4b6d-9f19-54ab0b2ddab1', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('08ab3cfc-8718-4845-8f8f-bb7201c4eca6', '7109c567-63f7-4d17-a2d5-a518e560408e', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-08-03 17:57:26', '2023-08-03 17:57:26'),
('08b673eb-d26b-4b6f-b666-5757ccb2378e', '492e02b7-cab9-42f2-9b42-6a6d373b2e24', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:31:50', '2023-05-21 10:31:50'),
('0937df93-d3bb-46db-a79a-bffaea22cd2b', '12a277f5-c2ee-44a6-82da-f6f5e03758a9', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('09dc2b7d-2179-4090-9bde-eaf97e15ee31', 'eeb02b68-6521-4a40-84ad-21a2d21aa440', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:31:50', '2023-05-21 10:31:50'),
('0a45a6d5-17bd-4eab-9eaf-65acfaa29ab1', '22fe5dc1-07ab-4809-8f56-8590c68d9ab3', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:29:14', '2023-05-21 10:29:14'),
('0a53b82f-84a4-49f3-9004-3dc6b9746aec', '2ad4f58d-4cf4-446a-b767-e840add77549', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:36:02', '2023-05-21 10:36:02'),
('0a73fc14-492f-4820-80c7-1a7241e14754', '9fad722d-6b02-4504-b431-ed6f14b20847', 'TRX', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:23:31', '2023-05-21 10:23:31'),
('0aac3f7d-049d-49da-b7d1-82bbb62d0d03', 'b9ec7d63-015c-4814-b253-eb1d45eae4dd', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-07 13:12:27', '2023-10-11 17:01:42'),
('0b7ae84d-4894-4733-bcc7-8b04e47d8075', 'd6ac746d-90e7-4a93-981d-5602b6324d4f', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('0ba06f50-a153-40aa-add6-00fdf3f58b8c', '34d2fe8e-ad62-4960-ba47-82234f81520b', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('0bad60bb-d82d-4190-a8c8-0164b499c11a', 'e7862d9c-fba8-4509-b59b-a4cb4f71ba04', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-07-25 05:19:47', '2023-07-25 05:19:47'),
('0bc3fc10-6f61-48bc-a901-677ecc3b6d66', '1ba19fda-1281-47fd-9059-c26571b6edc8', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-01 21:53:47', '2024-02-01 21:53:47'),
('0c17f6a8-11cc-40b0-b5dc-3c692ff8d697', '47eaf168-5901-4ccb-8b9c-d7f9c754ed04', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-31 10:02:57', '2023-05-31 10:02:57'),
('0c5b4230-2e03-47e7-899a-adba171ecab5', '52523c96-98e6-4e75-a1d8-e3cf094993a1', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-08-20 08:45:28', '2023-08-20 08:45:28'),
('0cfd13c1-f6c5-4b8c-b998-bb225b3aecb4', '5b4cd7b8-8ae3-4a91-a25b-cc785c061b14', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-05 10:54:16', '2023-06-05 10:54:16'),
('0d13dc2b-1c72-4f3a-86f4-6345aaa30c4c', 'ecbb1278-fb14-4952-8ef9-fc77aef93d3d', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-08-14 19:22:20', '2023-08-14 19:22:20'),
('0d40c79c-e6a1-468f-8efe-4a6b3b4fa43c', '7cde25b7-e520-4fb3-85df-f5fcf89305d3', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-09 13:43:35', '2023-06-09 13:43:35'),
('0daf04ca-4084-4ca2-b82f-943cfac3a1a6', '2446118a-33ae-4cb4-8ca9-4e1c8dd68f4f', 'USDT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('0debca32-1c38-48dc-8a20-e209dba57c9c', '47eaf168-5901-4ccb-8b9c-d7f9c754ed04', 'USD', 5000.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-31 10:02:57', '2023-05-31 10:45:57'),
('0deef7b2-7a06-43c5-94ae-b673d3b83e20', 'f9ca05bf-6025-4a42-87f1-78001c65886c', 'TRX', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('0e7533ee-2ba5-42a3-9d31-9283bfff9d67', '52523c96-98e6-4e75-a1d8-e3cf094993a1', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('0e94e105-9e4f-4fc1-86fe-78a681e57781', '1ac9db2f-613b-4351-ba36-aa8a8e502079', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('0e9c0f13-871f-4660-a748-2348e7be4591', '01bac2f0-2e3c-4116-a7fb-61c4d149a2e6', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-12 10:22:18', '2023-06-12 10:22:18'),
('0e9c17e0-34a5-45f4-bc8a-c6a3821261d6', '09ae0ce6-3b8a-4a8a-ac2f-3919888e47aa', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:36:02', '2023-05-21 10:36:02'),
('0eb61e0c-931a-42b3-a7dc-ecda3a596c57', '48073e55-f172-4b10-b11b-7203b2b5dbd1', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('0ec5d024-6131-4fc7-ab7f-54e133f70c82', '6dd2b333-abab-4c57-b4f5-d33e4dd70f39', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('0f13db00-a296-4021-923e-6154730ca6a1', '12a277f5-c2ee-44a6-82da-f6f5e03758a9', 'TRX', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-01 13:16:13', '2023-06-01 13:25:20'),
('0f195853-338d-4702-9ea2-4caca0b58b5a', 'd86b3a4d-3a57-426e-8e1e-95a6be996bb5', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-07-19 11:01:40', '2023-07-19 11:01:40'),
('0f55c265-a7b5-4b5b-9244-ff3d6e1929d7', 'f978562a-6102-47ef-b44c-00962596e9e4', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-12 10:53:36', '2023-06-12 10:53:36'),
('0f6fd391-3e53-4604-8c29-54fb5affdde8', 'e18c768d-25b2-4d22-bf2c-1a9115c7ec71', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:31:50', '2023-05-21 10:31:50'),
('0faf2c1e-e9da-469a-8897-f47040e3cc81', 'cdc7f9c6-150b-4b90-bc4a-8ce2f71f5c83', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-14 18:00:21', '2023-06-14 18:00:21'),
('104ac946-2fc9-4662-8566-f4683b619de8', '60145862-0641-4106-af67-8de47b916abe', 'TRX', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-05 09:54:36', '2023-06-05 09:55:16'),
('105eb3c5-8bcd-4f9f-85aa-cd546ea6390c', '6eb3595c-031c-4f55-abee-80cf6d8c816b', 'USDT', 150000.00000000, 'TMwGs2ertTKd9RbEQDccAGgVL9DXYYRbiD', NULL, 'eyJpdiI6IkE0TnJRcWNWWUdsbjFmb05zUXBlS2c9PSIsInZhbHVlIjoick1CL0RuRzNFb0RNT2c1ZGxRU1RjRTJGSVZZZmRMTFQ3K3lnRmdYL0txNm1RdkIyOGp2ZG00QkVkam9lbFhRTzFZNzB2cnpvemRuVGQxSW1SbStuMm1jVmxpMGhHMnlzV0g2M3RESkQ0eXY4OTM3RFNTOStxc0VXS1RNYWJkMDFvWE43Sm1MYmdVMjJoMTVjazFxWUpYVlBGOWdvMFRnY3prbExVcEc2VVZMVUo0a0E4SEZRNWZ5b2FYdEVoVW1SIiwibWFjIjoiMjg3ZmMzNTc5ODZhZjBhM2ZhNmM0NjM5OTU0NGFmZmU4ZDNmNDJjZDViMWNkZjBkMGQxMmFhMmYwMmYzODY5NSIsInRhZyI6IiJ9', 'eyJpdiI6ImQrRkdkZE5vNXRYS29tSnVJeEhQRGc9PSIsInZhbHVlIjoiS3h5NFRJM3kzYlN6K1RpZkJXZTVVV2ZkY3RkUEs1Q2J4ZzQxdzBJWmFFM1RVaUVmQjIyVEZSQ0VVRTcvaDlINUdQNFNUbitycXhJSDg0YzkxRjJtb1RzUUtwMXdDQmdibExrTG9RSmh1R1k9IiwibWFjIjoiNmY1ZmVjMzUzMzBhZjgzYjBkYjJjNzVlMTYzMzgwMGU4Y2QwNmU0MWFkYjc0OTkxODg3YmY4ZmQ5YTYyNDE0MyIsInRhZyI6IiJ9', 0, 1, '2023-05-21 10:27:23', '2023-09-17 18:28:37'),
('10b4c151-b2be-4c3c-a719-2f69e44e78a1', '3b4df004-bb15-4c73-b23e-f7d614f64b8e', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('10fe16c7-a7bc-45bb-ad83-b45199aaf109', 'f9ca05bf-6025-4a42-87f1-78001c65886c', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('1196a093-5086-47bb-8982-b1d541e38863', 'd72e5177-9169-4d3b-a805-aa9a45da9c32', 'TRX', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-05 09:35:46', '2023-06-05 09:37:04'),
('119f084a-1c57-4e94-99be-e1b0498dabd7', '7109c567-63f7-4d17-a2d5-a518e560408e', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-08-03 17:57:26', '2023-08-11 13:39:12'),
('11e2de78-4c90-4f50-ab39-3f21e4e47a3d', '3197597e-5470-45e4-afc1-0b2292d2158e', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('11ec4857-1891-4aac-9e5e-e0fd7fb8c12e', '96f24f53-91db-4ab4-80ae-589139774970', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('12848a5b-5c2d-4f54-8527-2da29d70d087', 'c71eeafd-849d-4cb7-8275-1ebcd9ac93d8', 'USDT', 5910.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-04 15:02:20', '2024-02-27 05:07:49'),
('12dc414e-410a-45b1-9810-4da27cbf49ed', '2446118a-33ae-4cb4-8ca9-4e1c8dd68f4f', 'TRX', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('12e79621-7db0-4a62-8b9d-250a5ff1b9ef', 'd2b09976-3be3-43e8-81ef-d0dd81784cdf', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-07-26 10:01:28', '2023-07-28 06:00:47'),
('1366858d-20e0-490f-8829-b892a2b4f3b7', '47eaf168-5901-4ccb-8b9c-d7f9c754ed04', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('138fb6ff-b6eb-4848-b5e2-341b70fdeeca', '3b4df004-bb15-4c73-b23e-f7d614f64b8e', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('1394ddc8-9113-4f8c-bc8a-090459c9387a', '44d4809d-28e1-4685-b15c-dc11134fdf1d', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-07-20 09:58:46', '2023-07-20 09:58:46'),
('13fa43ca-7f32-4bb6-a009-fd9c0e7451f4', '34d2fe8e-ad62-4960-ba47-82234f81520b', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('14044dd2-8a75-4d40-9641-837fb4e82b79', 'a502eb20-d81c-4f3e-a56f-11444fe1e4cb', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('14ad1d1a-792b-4b6d-aeb0-7c20cce85fc6', 'a502eb20-d81c-4f3e-a56f-11444fe1e4cb', 'ETH', 0.00000000, 'TSZsQpLG8BSXAtkhRGJzFsXDERTrk3Npia', NULL, 'eyJpdiI6IlFxWUoxMVNRNDVvSlZYVCtYSlZ3cVE9PSIsInZhbHVlIjoibTE0V2dpTm1JSnR5L0tyajY0TFpyMzR2aWxqcDNBZ0gwNExBQ2dZcmMxdGhpSTRIZndDU0lIOWNyYzFxc3ZyMmlMNm5XSlFJZjAzc2ZzMG1IeGVtT1ZyUXp5L1Buc1czT1RCeFk1Y2VxTklqbWc2VURESlJlNStHeGVacDJYcVJRaUlrVHB4bVJnT3JlZVE3MEFadnhFcWJkYWhpZzhaVllLQWR0TjJSc21yTzVySDBldUUwbmhoanFBNUkveXRlIiwibWFjIjoiYjBmOTc4MGZiMjM0ZTRkZjE1MTExNTA0ZjU0YTU2YzIyZTBlY2RlYTk4ZGQ3NDZkNGMwNTZlYzQ5OWEzNDg4MSIsInRhZyI6IiJ9', 'eyJpdiI6IkFwN3lqNUFBMzJnU0tSQWZqRVBXS2c9PSIsInZhbHVlIjoiVWxyTnkrOFFXSldkY251Sm1Ob0JuV3lsb0hxSll3bWhueHo1cFdQUHRVUkd2S0VqM0JDTXkxYkZEYzlJOGt5NjhxM0hYMkJkdW9UcFFERVJJTkVKK0lydzVVbUZZLzlYN3FtVkt6bE44RzA9IiwibWFjIjoiY2JmZTczZWU3NzQzNTk3OWIxZjY5ZDVmYmQzNDUxOTVlMzk3MmU1YmFiZmJiM2YwYzgyMjM5MGRkZTEwNmY1NiIsInRhZyI6IiJ9', 0, 1, '2023-05-21 10:29:14', '2023-05-26 10:06:25'),
('1505fb15-c5de-4f9c-af90-dca9e890630a', '52523c96-98e6-4e75-a1d8-e3cf094993a1', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-08-20 08:45:28', '2023-08-20 08:45:28'),
('1515ebb4-6f4d-43f1-8974-47cf75a443f2', '09ae0ce6-3b8a-4a8a-ac2f-3919888e47aa', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:29:14', '2023-05-21 10:29:14'),
('15232196-70e5-4197-a80b-d566f8190ee6', '66a1e840-7ddb-4a17-988f-da8c948dc2a7', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('1548c9b1-5c38-4520-a20b-0ba1e4c386ee', '5e5189aa-f3b7-4e90-ab71-48eb3d97bf08', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:29:14', '2023-05-21 10:29:14'),
('1570ff5a-1b7d-4c66-9375-e1cfa86503d8', '66a1e840-7ddb-4a17-988f-da8c948dc2a7', 'USDT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:27:23', '2023-05-21 10:27:23'),
('15b6c656-90d6-45c9-a756-d8d6f32327cb', '934ad33c-0304-4461-b0e5-ba8b3ca61ca1', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('15daacd6-7579-4c8a-a4a3-fa40f1e056c1', '6cd1a9e7-a910-43c8-a930-95dcb2c8edca', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-08-07 18:13:48', '2023-08-07 18:13:48'),
('15f8a00c-a392-4779-99b3-cdc5758d4e89', 'db5d841b-d90a-4437-957a-c7fb5fa86319', 'TRX', 5.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-25 12:50:06', '2023-05-26 14:00:25'),
('16b74528-6580-4653-b6a7-297a255a9524', '60145862-0641-4106-af67-8de47b916abe', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-05 09:54:36', '2023-06-05 09:54:36'),
('16c1bb47-ee79-4fdf-8d65-9731ee5aa5e7', '923956af-60ea-40f0-8065-aac5c4fb3791', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-09-14 11:32:26', '2023-09-14 11:32:26'),
('16f2c3d5-9921-487c-9349-2af1ea8683d2', '3b4df004-bb15-4c73-b23e-f7d614f64b8e', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('16f476f7-d177-4f29-9011-d3a3db3ade04', '1ba19fda-1281-47fd-9059-c26571b6edc8', 'USDT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-01 21:53:47', '2024-02-01 21:53:47'),
('17fec260-788b-494c-9f6f-99403346bdba', 'd2b09976-3be3-43e8-81ef-d0dd81784cdf', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-07-26 10:01:28', '2023-11-23 00:10:18'),
('18028d4a-c771-4f37-b685-6c51d506236a', 'd6ac746d-90e7-4a93-981d-5602b6324d4f', 'TRX', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('181b3596-2e7c-48f8-b62c-c24965c927e7', 'd86b3a4d-3a57-426e-8e1e-95a6be996bb5', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-07-19 11:01:40', '2023-07-19 11:01:40'),
('1869fd11-8c55-4432-b8ce-cf2d534536b0', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'DOGE', 0.00000000, 'TPBLaHbawLTXQMPKSLQjd43gS52YnXykiu', NULL, 'eyJpdiI6ImZqRnY2Qm1aV0NXYjJNdUgxRFF1UGc9PSIsInZhbHVlIjoiWnlBLzdwc1RXVWhiQ0FQRXJ4bytkVFl0OXJ6UmNYeHdGeGx0ZDZvUlNZMnFXQXBBN3huZXZDZkdDS01ZMHdOaFpVYk5iN05uUE93Q0p2SzcxTk9mTzJlNFNkQkZmRlR4TGx3Zys4NnNQWFFYbUtRaWFYYTliVGExbTJ3dXFINEU2Q0Znb00rMEcxNWVDU2tGVTRqTXRHSlRpVzcwVmxNUXM2aTFnczREOWhGRnN3MzBrNUFPREFxVmpNSDVZYWprIiwibWFjIjoiZmU5ODVjMDcxNDk2NDdlZTI0Y2NhNWE2YzM4NWRiNWU2MjQ4ZTYyMDY5YWM5MWE5NWEzZmM1YWQ1MTliOWUyZCIsInRhZyI6IiJ9', 'eyJpdiI6IkthWStwT2JWRjVIMHR0MGJtZnAwTWc9PSIsInZhbHVlIjoiZS9QOEdJOEhxVkxERDZrbGxYQWthOVVDNDBXUWUrakpSVFBIWVNYUThleDhkY292cFl0S0ZMVXRKbVZYRU5DcXFaWlhrS2ZUSXpocFhMV1VTNWcxNEs5MGZSb0NBWTJZcjNmOXc0MXROK3M9IiwibWFjIjoiNjViOWQ0OGFjNzNkYTM1OGFhMmZiZmI3ZGQ1YzgwNjE1ZWI0YzI5ZjM5YzVjMzFmMTRlNzE3YzI2ZmMyN2Q2NiIsInRhZyI6IiJ9', 1, 1, '2023-05-21 10:31:50', '2023-05-21 10:31:58'),
('19042625-1cb0-483c-bfe9-4b709279e7e4', '5a03c1e3-f18c-41da-b6c6-d372ca6ade8c', 'USDT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:27:23', '2023-05-21 10:27:23'),
('19151071-36e3-4e25-9628-40fa88154220', '5a03c1e3-f18c-41da-b6c6-d372ca6ade8c', 'TRX', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:23:31', '2023-05-21 10:23:31'),
('19322888-52e8-4183-b34c-4458fefa3eb8', '923956af-60ea-40f0-8065-aac5c4fb3791', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('19692457-7150-4dbb-84bf-040c0bbba1de', 'd2b09976-3be3-43e8-81ef-d0dd81784cdf', 'BTC', 18960.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-07-26 10:01:28', '2023-11-23 00:13:41'),
('199f84cb-6349-4ce3-8f55-411e6f0de2df', '09ae0ce6-3b8a-4a8a-ac2f-3919888e47aa', 'TRX', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:23:31', '2023-05-21 10:23:31'),
('19b2da46-a3c0-4b53-90ab-62a39d4008cf', 'eeb02b68-6521-4a40-84ad-21a2d21aa440', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:33:02', '2023-05-21 10:33:02'),
('19e16837-aa7f-43cf-ab77-f2fd16c2d8dc', '2ad4f58d-4cf4-446a-b767-e840add77549', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('1a2485c4-0871-4556-a8b2-66597e6d7ad0', '7db45872-7279-474d-aa0d-d56723822162', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('1a2b64ae-f1d3-4a2f-9f07-d86057bd7ecf', 'cda51314-c8fb-414d-9f56-fb848e43077a', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('1a88f100-bb50-47d6-a1be-21f7b326b53f', '66a1e840-7ddb-4a17-988f-da8c948dc2a7', 'TRX', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:23:31', '2023-05-21 10:23:31'),
('1b12769b-9520-4f43-a5bd-a45d2fc4c4c7', '66a1e840-7ddb-4a17-988f-da8c948dc2a7', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:31:50', '2023-05-21 10:31:50'),
('1b23279c-c462-423d-bcd5-7119f2ca7e11', '04b781e1-0a41-4703-888f-468243ebda36', 'USDT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:27:23', '2023-05-21 10:27:23'),
('1b7aa54b-25ad-4149-b28b-20d36fe12367', 'abe08840-cedb-437d-9054-f6ca53045f5d', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('1ba17eba-0643-43ba-91a2-b393e0efc8e6', 'ea3c376d-8e83-4e18-be5c-25fda612432f', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:29:14', '2023-05-21 10:29:14'),
('1bb60758-4fb8-4192-b072-e7d8dc143450', '9e207066-ad6c-4c73-b26a-22142f5d6eec', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('1bfb13f6-39a2-40f9-976c-0f6a666f73b2', 'kocoina8-bbd6-4f8b-9fbf-48711485ab8d', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:36:02', '2023-05-21 10:36:02'),
('1c033b8f-549a-4072-a8bf-c20856ae922a', '467671a6-55bc-4527-ba1f-d0d2b562fca4', 'TRX', 2.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-06 14:15:45', '2023-06-06 14:15:45'),
('1c410978-a961-44df-9641-f04aaf30ef9c', '7db45872-7279-474d-aa0d-d56723822162', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('1c5d139e-a679-46b3-b622-8ca88167dfa4', 'e7c629dd-0b1e-4094-bc83-6c928f77b357', 'TRX', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-20 15:07:49', '2024-02-20 15:07:49'),
('1c8ac355-3195-4567-9ea2-3b5ff2ff9453', '07b97174-b6d2-48b5-a9a2-f8c1443eaf3e', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 11:06:15', '2024-02-19 11:06:15'),
('1c8ba30b-d428-49fe-8bb8-15ae379e4f97', 'f9ca05bf-6025-4a42-87f1-78001c65886c', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('1cb04937-47e0-4506-aec8-4b4b59075fcb', '6f1ba6d2-22bf-4291-977d-534ac1aff4d8', 'USDT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('1cb5a4d2-1a3a-4e62-8c90-7f972c028bfc', '66a1e840-7ddb-4a17-988f-da8c948dc2a7', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:36:02', '2023-05-21 10:36:02'),
('1e4b9ed7-9346-498d-8627-f3abd95e53b5', '6cd1a9e7-a910-43c8-a930-95dcb2c8edca', 'USD', 200.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-08-07 18:13:48', '2023-08-07 18:14:20'),
('1e840395-e17d-448d-a69f-6404f19e6ebe', '6f1ba6d2-22bf-4291-977d-534ac1aff4d8', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('1ecf7704-eab0-4c17-ae18-81bc7e173667', 'da77601a-40e5-4bb1-b584-2b82bd26370f', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('1f0aa022-e820-46cf-a5ba-cd0d35b8e2bb', '6bb43481-d32b-4038-9358-85a962250b5c', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:31:50', '2023-05-21 10:31:50'),
('1f24f413-0234-482b-92e2-ac13f1e12166', '7b621b7c-6760-4430-9a30-10d8134b442e', 'TRX', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('1fd60d17-705c-43a3-bcba-2a5226777092', '12a277f5-c2ee-44a6-82da-f6f5e03758a9', 'USDT', 47000.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-01 13:16:13', '2023-06-01 13:23:31'),
('20a3cfad-768c-47fd-882a-2b1d08ec4846', '6b45b07e-0969-4bae-bd21-fc7e7597ef8d', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('20ad094a-591e-413a-a5b7-c17fb54e1f59', '934ad33c-0304-4461-b0e5-ba8b3ca61ca1', 'TRX', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:23:31', '2023-05-21 10:23:31'),
('20b84e42-58fd-4ae8-80ea-362e230db3c7', '6cd1a9e7-a910-43c8-a930-95dcb2c8edca', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-08-07 18:13:48', '2023-08-07 18:13:48'),
('20f905ae-88ee-4276-878e-6bb2bf612d14', '9e207066-ad6c-4c73-b26a-22142f5d6eec', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('2101f7e0-64a8-4f0d-ad36-f074451387b6', 'ff837428-0711-4c3c-91a6-dd44e69ca5e7', 'TRX', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('214a358e-3d42-4d9e-beee-cd4898384c6e', '01bac2f0-2e3c-4116-a7fb-61c4d149a2e6', 'USDT', 1750.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-12 10:22:18', '2023-06-12 10:22:59'),
('2193c6af-d46f-4611-a20a-d730d2b47dfc', '794254a9-ab67-4e67-8f36-861c423c29a8', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('219845e3-d2c7-43a4-8894-7c8c85efdcbc', 'e7c629dd-0b1e-4094-bc83-6c928f77b357', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-20 15:07:49', '2024-02-20 15:07:49'),
('21f1de5f-fd32-4490-8af3-5139be7879d0', 'adc69fe5-342e-4db7-83d6-1aa6b50e4217', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('223e6dbe-b787-4f89-9951-7fe82f5f5ee9', 'eeb02b68-6521-4a40-84ad-21a2d21aa440', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:25:43', '2023-05-21 10:25:43'),
('2365c11e-4c57-4662-8a83-69be4d059199', '57cfdde8-b3bb-4020-bd29-83cc9575bdcf', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-14 18:00:21', '2023-06-14 18:00:21'),
('23dd75a3-4fb9-4e26-8a1d-ccf65dcf00ba', 'c275436b-9379-4114-9770-9e6d376488cd', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:36:02', '2023-05-21 10:36:02'),
('23e6c0e8-c046-4462-a26d-bfe077ed2c3d', '3197597e-5470-45e4-afc1-0b2292d2158e', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('24247618-4828-4839-a8ff-136c789d109c', 'cda51314-c8fb-414d-9f56-fb848e43077a', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('257f42d7-07d4-4f8c-bfbc-7de4034ee99f', '22fe5dc1-07ab-4809-8f56-8590c68d9ab3', 'USDT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:27:23', '2023-05-21 10:27:23'),
('261b772b-02e6-4b0e-bc16-226260091125', '5b4cd7b8-8ae3-4a91-a25b-cc785c061b14', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('269032b2-3ab1-493b-a4a4-e2da70235ccc', '7cde25b7-e520-4fb3-85df-f5fcf89305d3', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-09 13:43:35', '2023-06-09 13:43:35'),
('26df6987-c187-4dd5-b334-ed34654a2ffd', '36f5887f-2b9b-4144-879c-9be2cff7e466', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-13 01:18:02', '2023-06-13 01:18:02'),
('27aa98b9-9c31-4910-a21b-ca2032fb93de', 'c71eeafd-849d-4cb7-8275-1ebcd9ac93d8', 'TRX', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-04 15:02:20', '2023-12-16 12:37:07'),
('27e77047-832b-45e4-9df9-895418556bb0', 'f978562a-6102-47ef-b44c-00962596e9e4', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-12 10:53:36', '2023-06-12 10:53:36'),
('2818dd7b-bc35-4fc1-a2a4-933ca44515f1', '04b781e1-0a41-4703-888f-468243ebda36', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:29:14', '2023-05-21 10:29:14'),
('282ca2df-1048-4d7c-bf38-d2dae867099d', '96f24f53-91db-4ab4-80ae-589139774970', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('283fca61-02c3-4ac7-a6f2-5a948b86f490', 'd86b3a4d-3a57-426e-8e1e-95a6be996bb5', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-07-19 11:01:40', '2023-07-19 11:01:40'),
('2841b674-54f2-46ab-a0d3-c55065b70a77', 'e7862d9c-fba8-4509-b59b-a4cb4f71ba04', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('2865459c-0f28-417b-bd89-97317ecd8c7c', '98697609-12a9-4415-a700-07de18f31ba9', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-07-18 08:34:19', '2023-07-18 08:34:19'),
('28db10cf-93dd-488c-a78c-64bb5d00af74', 'dff7716d-646f-48ee-8d87-a1f8461230d9', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:29:14', '2023-05-21 10:29:14'),
('28f41c17-cb2f-4d40-9f6f-790e6b2855ca', '5b4cd7b8-8ae3-4a91-a25b-cc785c061b14', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-05 10:54:16', '2023-06-05 10:54:16'),
('290c1c50-a0a1-4b2f-ba3d-0e4f0ab667c6', '7109c567-63f7-4d17-a2d5-a518e560408e', 'USDT', 10000.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-08-03 17:57:26', '2023-10-17 18:38:52'),
('2947a6cc-ce0d-4731-96c1-3e8d746a3a52', '8208d769-48db-4e2f-8831-f48ead232203', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:29:14', '2023-05-21 10:29:14'),
('29f8255a-7c8e-46ea-bc59-0a9d1b8299d0', '22fe5dc1-07ab-4809-8f56-8590c68d9ab3', 'TRX', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:23:31', '2023-05-21 10:23:31'),
('2a68402e-a368-40ed-87b5-f99405bacdca', '6b45b07e-0969-4bae-bd21-fc7e7597ef8d', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('2b28ac27-b05b-4435-a39d-d166a0e0cd7e', '7b621b7c-6760-4430-9a30-10d8134b442e', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('2bd56475-2097-4f85-a9ba-fd838c38b597', 'a01cd4e5-4cbb-48ab-bfde-2b558ab60d88', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('2c1de0bc-e6ef-4cea-a13a-7e776f11f738', 'adc69fe5-342e-4db7-83d6-1aa6b50e4217', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('2c5a7598-fe23-4a0e-8f14-f19885b13286', '9e207066-ad6c-4c73-b26a-22142f5d6eec', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('2ca50f4b-b32e-4fc8-b62a-e1f8e7ad9bd5', '6c2de49b-66b3-482d-bf48-8b690f86deff', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('2cbd9b23-3ea5-4abc-a58f-8d4b8d2ea88a', '98697609-12a9-4415-a700-07de18f31ba9', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-07-18 08:34:19', '2023-07-18 08:34:19'),
('2cd877a2-801c-4301-a562-5375b7b64b67', '88f8082d-7f6a-44f3-8782-d0be24853117', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-09-10 14:17:32', '2023-09-10 14:17:32'),
('2d4b852e-ba73-4a3a-8972-9251cc88852a', '6c2de49b-66b3-482d-bf48-8b690f86deff', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('2d6fd228-fc05-4451-8de0-e6f3044a86ab', '794254a9-ab67-4e67-8f36-861c423c29a8', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('2dabc786-484b-49d5-8cc9-e6b4af97914f', 'c71eeafd-849d-4cb7-8275-1ebcd9ac93d8', 'DOGE', 1000.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-04 15:02:20', '2023-06-04 15:02:20'),
('2e75076e-82c9-44ed-ad11-24c47fb5ff82', '492e02b7-cab9-42f2-9b42-6a6d373b2e24', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:29:14', '2023-05-21 10:29:14'),
('2ec93634-7680-453e-8a1b-67b7be0152bf', '47eaf168-5901-4ccb-8b9c-d7f9c754ed04', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('2f32b974-89a9-4a80-8dc2-9f1d95a9a535', '9fad722d-6b02-4504-b431-ed6f14b20847', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('306a5738-0abf-4a35-9ff1-e3cd58c8b4ce', '6800875b-c059-49a2-aec7-8612c7d402a1', 'TRX', 2.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-09-09 22:04:27', '2023-09-09 22:04:27'),
('31094170-783e-4264-98aa-25c9bf50fba6', 'ea3c376d-8e83-4e18-be5c-25fda612432f', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:36:02', '2023-05-21 10:36:02'),
('318962fa-6102-4a1e-a359-aa03e662407f', '6b45b07e-0969-4bae-bd21-fc7e7597ef8d', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('31b3e838-d96e-47d2-a674-50c0963b0989', '07b97174-b6d2-48b5-a9a2-f8c1443eaf3e', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 11:06:15', '2024-02-19 11:06:15'),
('31e4e41d-c8ff-45f3-9c86-92645c96e43a', 'ecbb1278-fb14-4952-8ef9-fc77aef93d3d', 'USDT', 43000.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-08-14 19:22:20', '2024-02-06 13:58:29'),
('32282d00-d145-483b-8b8b-de526c0f3746', '47dea59c-e88d-4c15-ad52-fa0dc6de1631', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('326253ca-ae91-4c25-bbf4-ab3e77ce4263', 'c034dc12-2661-4cd4-b118-febdc33c27e6', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('32c2938f-f2aa-4970-aed0-0f61f9452956', '48ace508-5a29-483a-92d6-e1dc362baee8', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('32cb3f68-945d-42c4-8dde-1c9bcf9cc40c', 'c71eeafd-849d-4cb7-8275-1ebcd9ac93d8', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-04 15:02:20', '2023-06-04 15:10:36'),
('33874cd0-4883-47bb-b9b2-b46917242e0e', '4737ffad-8afe-4bbe-9c76-9ece9d55068f', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-14 13:49:44', '2023-06-14 13:49:44'),
('33be3aa2-b2e5-4880-a92a-78b42e32e689', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'DOGE', 1243.00000000, 'TSz8ZGBdd8HpWKSYuu8Hk69UgCDc3ktDGW', NULL, 'eyJpdiI6IjZnVFdvODlXdmQ4SEVpMzVtMGJRb1E9PSIsInZhbHVlIjoiT3NqYnZlUVhTNS9FN3d2ZEJvdFZhYk5XTEdyVEhxTTBMbHBpVlhPa2wwdVlZUnFxclU3WmxiUHVlbFlXZnZrWExZU3cwNmFDN3hBZXk4cGM0T3FQK1J5OUI4RENyTk0wbkRvYU5VVlBxV2Y4R091cUNFcGZodEJaZU9FYmxkUGhOaFp5V1d3VTh5bGdOWXlCUXo0Z3BHQnBDYWg1WjV4QjZnWlUzRHkyOFlrMTlaNlpFMWd1WlhpQUFMb0NLMXZlIiwibWFjIjoiMTZhNmI4NzVjNjI3ZjIyYzU5NjU1MTIwOGY0MTM2OTllZTA1NjM5MWQzMzU3ZTYzMTkzMzVkZGQxNGRmY2I2ZiIsInRhZyI6IiJ9', 'eyJpdiI6IkdweUNqOU9sZFZmNzVnSTZIckkwQ2c9PSIsInZhbHVlIjoiQ0pCanNmZHArUW1IcUl0dVJmU1A5M2NxdUd3V0tZSU1qa2gza0tHRUdoS0ZyU0pIU0VqYWtjeGpkazlsQjE5L0oyZFNqL3pyR281VkhDM3lhNHYyREUwRWJkSmZmRWlhMHZyYmRvVW9GdkU9IiwibWFjIjoiNjBhZTY2M2RjNmQyNmU1NTczNjBmNDViMjAwZDZhYTM5ZGE2MDg4ZjUzNWIzNjE2ZWYxMjQ0NjI1ZTA0MzIyNyIsInRhZyI6IiJ9', 0, 1, '2023-05-21 10:31:50', '2023-05-22 14:17:14'),
('33c54e11-22fe-42f2-8bb5-2a6d984f4da7', '9fad722d-6b02-4504-b431-ed6f14b20847', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:29:14', '2023-05-21 10:29:14'),
('33cf5959-eca1-45fa-b453-eaeab7ca8885', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('343bae12-623a-4f78-9245-ed3cc7a0a3ac', '467671a6-55bc-4527-ba1f-d0d2b562fca4', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-06 14:15:45', '2023-06-06 14:15:45'),
('347ec344-2d85-411b-8bc2-3af4bd3fd9e2', '625c7cbe-2e20-406b-911b-a8ae59dfe2fe', 'USDT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('34836a13-a419-4a9b-b723-811b745abb06', '3b4df004-bb15-4c73-b23e-f7d614f64b8e', 'TRX', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('34bcda6d-f7db-4141-bc3f-bbf1c81a396f', 'a01cd4e5-4cbb-48ab-bfde-2b558ab60d88', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-07-20 08:02:36', '2023-07-20 08:02:36'),
('34d44ace-e8ea-4fce-87b3-2d29c60b5090', '04b781e1-0a41-4703-888f-468243ebda36', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('3522f6a6-dbb7-4549-80a3-bb672459e3c1', 'eee37105-c97d-4f77-a933-910a0c6e68bc', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('35584614-0a30-41e7-bd57-5fc65c143e37', '98697609-12a9-4415-a700-07de18f31ba9', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('35cd1a89-23ed-4b81-a5a4-d77a6241d99f', 'a502eb20-d81c-4f3e-a56f-11444fe1e4cb', 'USDT', 120748.25952000, 'TSZsQpLG8BSXAtkhRGJzFsXDERTrk3Npia', NULL, 'eyJpdiI6Im05S203SFlNVm4vV2xvam1yQkRSU0E9PSIsInZhbHVlIjoiSzZMQmREQUM0UnpVenI1enFvVW5kN1hsUWNTU0xobFVVWlVFcXFFcVR0UVUwQlp2VTlZTk9ETmlMcFA1NU8wSFJZSnBUNFI3ck0xUzArOExuejEyQ1hWWmhQd0lTMjZRZVdNQkIzbUVZSkc1VTdPRzc1bGczSjlYWDVTS1VJbHRsNk1YTkhoaU1UL0t4anR5YW9Zejl3T3IvMDJsNUs0WURTdDluNFBkQnhkWVZGV0NSUHZVa0xoZVQ4VjIzbFB5IiwibWFjIjoiYTJkY2Y0ZjFhYjg2Y2Y4OTAwNDAyZmEwMjBkZjViZWI1ZjRiZjVhYTBjNmExMWM3ODY5ZjM2NWU4NjdhMjZhZCIsInRhZyI6IiJ9', 'eyJpdiI6IlQ5YkhzeGJ6NUpjb3NCL05ReW4yOUE9PSIsInZhbHVlIjoiQmNZV2RlSVVFVmdvZm1STzlndUE5Q01aTkVlOHJYam9pN1owTGZiZTFzNkdEM2JqOHdZa3cwd05SdFExK1k1ZVZXK3crS0hLd3pYN01CYzdUWk1XMTVUR1ZtU0JYbmxBQ3h1eW1mc0Jaa3c9IiwibWFjIjoiZTBlYTRkNTk1ZjMwZjg1YmU4YzU3NWIyMGJmZGY1ZTJhYTM2ZDNlNDg3MGM3MjBiZjNmYmQ1NGI4Zjk4NDQwOCIsInRhZyI6IiJ9', 0, 1, '2023-05-21 10:27:23', '2023-08-16 05:37:14'),
('36a5cb4a-48fd-49ee-971f-e98b9aadbba7', 'e18c768d-25b2-4d22-bf2c-1a9115c7ec71', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('36b57cec-40b7-4c66-b9c1-d8164bff9192', 'e7c629dd-0b1e-4094-bc83-6c928f77b357', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-20 15:07:49', '2024-02-20 15:07:49'),
('379c7a23-6923-4aa7-8d11-67b0da07fb2f', '66a1e840-7ddb-4a17-988f-da8c948dc2a7', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('379d8775-16a0-4242-bdd3-fa9214c706b5', '6bb43481-d32b-4038-9358-85a962250b5c', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('37f602dd-b933-4131-8a94-b1f00542b06f', '48073e55-f172-4b10-b11b-7203b2b5dbd1', 'TRX', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('3848296e-2ae7-4fe5-91d2-eb8375c2fc7d', '492e02b7-cab9-42f2-9b42-6a6d373b2e24', 'USDT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:27:23', '2023-05-21 10:27:23'),
('38b8cd98-5997-4ffc-997e-86e436bdbfba', 'e18c768d-25b2-4d22-bf2c-1a9115c7ec71', 'TRX', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:23:31', '2023-05-21 10:23:31'),
('38d30e02-aaa7-4e6b-a0ed-ce13e494ce32', '8bc2d325-279d-4cb5-8245-87e524f33587', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:33:02', '2023-05-21 10:33:02'),
('392ec0d6-c924-47a9-9669-1968a30e6606', '8208d769-48db-4e2f-8831-f48ead232203', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('3a245f5d-50cd-4743-914b-e67025b85ecf', 'ee485282-d5d5-415c-8946-16fa57fd8f79', 'TRX', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('3a810fb5-9e85-4f2d-81d1-b169576f349f', '60145862-0641-4106-af67-8de47b916abe', 'USDT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-05 09:54:36', '2023-12-14 00:41:38'),
('3aa7f9c9-9b47-442d-bbdf-c170cb52eafe', '933d676a-c435-4697-bdf2-e54d026c156e', 'USD', 1000.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:33:02', '2023-05-31 12:19:17'),
('3ad396db-e614-4dc2-94c8-d55fc1173bcc', 'd86b3a4d-3a57-426e-8e1e-95a6be996bb5', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-07-19 11:01:40', '2023-07-19 11:01:40'),
('3afbf705-19bd-49e6-973a-9e1e289b0b11', '923956af-60ea-40f0-8065-aac5c4fb3791', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-09-14 11:32:26', '2023-09-14 11:32:26'),
('3b50916a-cd00-4be0-ab9d-dee7ffae0397', '36f5887f-2b9b-4144-879c-9be2cff7e466', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-13 01:18:02', '2023-06-13 01:18:02'),
('3b9d36c9-ff17-46de-aa30-a5ff40ce0781', '5e5189aa-f3b7-4e90-ab71-48eb3d97bf08', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('3baff745-89f9-4922-afb9-fa8e8af1a9ce', '66a1e840-7ddb-4a17-988f-da8c948dc2a7', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:33:02', '2023-05-21 10:33:02'),
('3bf5f97a-00e5-4be4-a81c-6cfd4ff2a531', 'fd1358e0-095d-4123-8649-e56751a08017', 'USDT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 10:12:17', '2024-02-19 10:12:17'),
('3c1275a3-f6fb-495f-8f75-7df589332c0d', 'd2b09976-3be3-43e8-81ef-d0dd81784cdf', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-07-26 10:01:28', '2023-07-26 10:01:28'),
('3c9ef563-c637-4162-9610-6346a249ca5a', '8208d769-48db-4e2f-8831-f48ead232203', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:33:02', '2023-05-21 10:33:02'),
('3ca38254-e832-498b-93ad-217b27cf5933', '794254a9-ab67-4e67-8f36-861c423c29a8', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-09-12 02:41:44', '2023-09-12 02:41:44'),
('3cc1f9fd-4ba1-4b5b-be94-27222ebc58e8', '6b45b07e-0969-4bae-bd21-fc7e7597ef8d', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('3d54a7a0-c430-4ca6-bdcd-8adcb8b563aa', '52523c96-98e6-4e75-a1d8-e3cf094993a1', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('3d62ab02-4ee4-48d8-aac7-d49b1b8b61a2', 'e5720c7b-8502-4a3a-9ee9-8896436a41d4', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-07-18 20:08:23', '2023-07-18 20:08:23'),
('3d88964c-f2d4-4c60-9ab1-131c6b77a953', 'a502eb20-d81c-4f3e-a56f-11444fe1e4cb', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('3d9c2ada-564b-4452-9dc3-aac84ee17b3f', '3197597e-5470-45e4-afc1-0b2292d2158e', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('3da32c7b-b9a3-4ecf-870a-4762bd20b901', '6b45b07e-0969-4bae-bd21-fc7e7597ef8d', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('3db23a73-9c73-4427-b554-9edfc3b36cb0', 'ea3c376d-8e83-4e18-be5c-25fda612432f', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:31:50', '2023-05-21 10:31:50'),
('3dff1488-e15c-4e06-9518-c9be89f75dae', '7db45872-7279-474d-aa0d-d56723822162', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('3e3e5d4a-7641-4172-90da-4af9d5258da1', 'eee37105-c97d-4f77-a933-910a0c6e68bc', 'TRX', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('3e7019ae-87e8-4463-88fe-c7d9ded75e18', '6f1ba6d2-22bf-4291-977d-534ac1aff4d8', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('3e82e255-555e-4f38-b465-8fdbee8b597b', 'abe08840-cedb-437d-9054-f6ca53045f5d', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('3eb6940c-bdda-4084-b388-80121d9659c2', '34d2fe8e-ad62-4960-ba47-82234f81520b', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('3f601c59-632b-4a50-b5c7-1cfa328804bc', '01bac2f0-2e3c-4116-a7fb-61c4d149a2e6', 'TRX', 2.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-12 10:22:18', '2023-06-12 10:22:18'),
('3f8c113e-1461-49d7-aeab-b24a15f70dae', 'd6ac746d-90e7-4a93-981d-5602b6324d4f', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('3fafcb1e-3bac-47f0-8c15-85ad1217f055', '57cfdde8-b3bb-4020-bd29-83cc9575bdcf', 'USDT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-14 18:00:21', '2023-06-14 18:00:21'),
('3ff16fbc-a3a4-4e59-bbc2-294359165aeb', '934ad33c-0304-4461-b0e5-ba8b3ca61ca1', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:25:43', '2023-05-21 10:25:43'),
('3ff36276-e51f-4f2a-9d07-791929360b5e', 'cf37d061-aa9c-460d-9701-66439afc812d', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('4004a1a6-3f7f-423d-aaa9-65ab255744c5', 'd7ce0527-5843-4fd4-9253-ec190e726a4a', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('404ec601-ed48-4a06-a125-6266a8ce3d62', '60145862-0641-4106-af67-8de47b916abe', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-05 09:54:36', '2023-06-05 09:54:36'),
('40d0cdcf-e07b-4c10-929a-eb484fa2f7ed', '9e207066-ad6c-4c73-b26a-22142f5d6eec', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('412074a8-fb19-4613-89b2-7c4a08b2a4ae', '07b97174-b6d2-48b5-a9a2-f8c1443eaf3e', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 11:06:15', '2024-02-19 11:06:15'),
('4151cc8a-ac81-432d-b45f-79a2eb959784', 'ecbb1278-fb14-4952-8ef9-fc77aef93d3d', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('415cd9ec-222c-40bf-92e3-f97e3d2517e8', '492e02b7-cab9-42f2-9b42-6a6d373b2e24', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:33:02', '2023-05-21 10:33:02'),
('419554cf-b329-4e1d-a54a-e4cae3c1b71d', '794254a9-ab67-4e67-8f36-861c423c29a8', 'TRX', 2.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-09-12 02:41:44', '2023-09-12 02:41:44'),
('419692a4-acf5-4bea-8e7e-c1c27689e07c', 'e7862d9c-fba8-4509-b59b-a4cb4f71ba04', 'TRX', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-07-25 05:19:47', '2023-08-29 04:05:10'),
('41aa2720-e7b8-4370-a176-ed93c9c42a84', '6b45b07e-0969-4bae-bd21-fc7e7597ef8d', 'TRX', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('41b9cc96-5a27-4d0a-ab2e-46ea343fd953', '2ad4f58d-4cf4-446a-b767-e840add77549', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:29:14', '2023-05-21 10:29:14'),
('4257e16c-4cdf-4b62-a0ef-58a7ac4ae2fd', '625c7cbe-2e20-406b-911b-a8ae59dfe2fe', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('425ac7a7-8d2b-44ba-b596-6d8cf11e0dd7', '3197597e-5470-45e4-afc1-0b2292d2158e', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('427c007d-ba2f-4972-baac-20715e5eef12', '625c7cbe-2e20-406b-911b-a8ae59dfe2fe', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('42b175e1-d025-43f0-a4a2-b45d1c9b3a42', 'f978562a-6102-47ef-b44c-00962596e9e4', 'USDT', 1750.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-12 10:53:36', '2023-06-12 10:54:11'),
('43bb0d06-5afc-44b4-98c7-16f3cf6f721f', 'd6ac746d-90e7-4a93-981d-5602b6324d4f', 'USDT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('43d00244-e98a-47be-ba60-1fb28417f10a', '96f24f53-91db-4ab4-80ae-589139774970', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('43d8dbfa-1915-4788-87ee-b1dd5a2a354d', '12a277f5-c2ee-44a6-82da-f6f5e03758a9', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-01 13:16:13', '2023-06-01 13:16:13'),
('4418c69c-191e-49df-aeaf-9e5b3d447848', 'adc69fe5-342e-4db7-83d6-1aa6b50e4217', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:25:43', '2023-05-21 10:25:43'),
('4431022b-5a1f-406a-8e45-e1e5383a68c1', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('44431169-e96e-441b-83c8-812cc2d2234b', '88f8082d-7f6a-44f3-8782-d0be24853117', 'USDT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-09-10 14:17:32', '2023-09-10 14:17:32'),
('4457bd3b-a1ff-4d31-acef-b8d4d30734ea', 'd6ac746d-90e7-4a93-981d-5602b6324d4f', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('4537953c-8077-4693-b17c-46bb75cd46ba', '933d676a-c435-4697-bdf2-e54d026c156e', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:25:43', '2023-05-21 10:25:43'),
('4590d2d2-3b0c-41f1-8f21-3e8f528ebce7', '675d5181-9662-4d5a-8e29-924e2b58b24f', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-07-25 15:39:19', '2023-07-25 17:36:52'),
('4591796c-5c74-47b4-aedf-b2eb9dd51a8e', 'eee37105-c97d-4f77-a933-910a0c6e68bc', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('45ed31e1-df05-4af5-bb35-ea802fb81c9c', '9fad722d-6b02-4504-b431-ed6f14b20847', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:36:02', '2023-05-21 10:36:02'),
('462069bb-2fba-4182-ac50-9e792a44aebf', 'e5720c7b-8502-4a3a-9ee9-8896436a41d4', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-07-18 20:08:23', '2023-07-18 20:08:23'),
('46273b6c-c2e4-4539-ae85-afa9bd583d8c', '9fad722d-6b02-4504-b431-ed6f14b20847', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:25:43', '2023-05-21 10:25:43'),
('467537ab-4258-449b-b557-c8645c3a28ca', '44d4809d-28e1-4685-b15c-dc11134fdf1d', 'DOGE', 2100.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-07-20 09:58:46', '2023-07-20 09:58:46'),
('467ec077-2daa-4ad9-9afa-6f2d54478d11', '557a1889-0d7e-4e8c-a314-14e6c4004ee3', 'USDT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00');
INSERT INTO `wallets` (`id`, `user_id`, `symbol`, `primary_balance`, `address`, `passphrase`, `public_key`, `private_key`, `is_system_wallet`, `is_active`, `created_at`, `updated_at`) VALUES
('469a2aee-c0ee-4e05-87b4-14c56b155ca3', '6c9d2b9b-812c-4ba7-9bbe-66d940eaa5bb', 'TRX', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:23:31', '2023-05-21 10:23:31'),
('46ced942-cd4f-40b1-b950-65fa61b95600', '934ad33c-0304-4461-b0e5-ba8b3ca61ca1', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:29:14', '2023-05-21 10:29:14'),
('46f60488-c51c-4180-be44-7609f28b9510', 'eee37105-c97d-4f77-a933-910a0c6e68bc', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('47417a81-a1e0-4e94-8af8-8f5ead0a5a54', 'c71eeafd-849d-4cb7-8275-1ebcd9ac93d8', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('47abbe00-6b82-4f77-a55f-2e651c48afc5', 'dff7716d-646f-48ee-8d87-a1f8461230d9', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('47b6e972-39dc-4299-a433-c30d78621598', '794254a9-ab67-4e67-8f36-861c423c29a8', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-09-12 02:41:44', '2023-09-12 02:41:44'),
('47c25304-9184-4fc0-b5b2-a5c1bb7eb0ac', 'c034dc12-2661-4cd4-b118-febdc33c27e6', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('488dad36-dfe9-48e4-be24-9d9f21184ed4', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', 'TRX', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:23:31', '2023-05-21 10:23:31'),
('488e63ca-2fa0-4fe0-bb35-5d6cfa95d826', 'ee485282-d5d5-415c-8946-16fa57fd8f79', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('48ea9512-e1ac-4ff8-bf31-a6b93f0acf13', '6f1ba6d2-22bf-4291-977d-534ac1aff4d8', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('492ce888-4d74-432b-b82c-2e5509cec250', '933d676a-c435-4697-bdf2-e54d026c156e', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:31:50', '2023-05-21 10:31:50'),
('49de4812-a0db-4f56-99e8-add96add3b73', 'ff837428-0711-4c3c-91a6-dd44e69ca5e7', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('4a532013-0fd0-472b-a2c8-f1951e03efa7', '3b4df004-bb15-4c73-b23e-f7d614f64b8e', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('4aa7c608-9a8f-474c-8a0a-85a92bd8c91d', '794254a9-ab67-4e67-8f36-861c423c29a8', 'USDT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-09-12 02:41:44', '2023-09-12 02:41:44'),
('4ac390a6-acc6-4da4-8c4a-506fcb9af0ea', 'ea3c376d-8e83-4e18-be5c-25fda612432f', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:33:02', '2023-05-21 10:33:02'),
('4b042662-8799-41e4-8d26-5e3ea0affd26', '6c9d2b9b-812c-4ba7-9bbe-66d940eaa5bb', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:29:14', '2023-05-21 10:29:14'),
('4b0deffa-bfa1-478b-81c3-841625693a9a', 'kocoina8-bbd6-4f8b-9fbf-48711485ab8d', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('4b4b974b-38f5-48da-b85e-f0e852fe045e', 'd6ac746d-90e7-4a93-981d-5602b6324d4f', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('4c6e79b2-4d46-4a66-9302-f2bfc6a62bf3', '6bb43481-d32b-4038-9358-85a962250b5c', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:33:02', '2023-05-21 10:33:02'),
('4cbaa397-c953-41c6-819b-d70b3f3a4d81', 'dff7716d-646f-48ee-8d87-a1f8461230d9', 'TRX', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:23:31', '2023-05-21 10:23:31'),
('4cd7ae4d-269f-489a-8986-34f831940afa', '625c7cbe-2e20-406b-911b-a8ae59dfe2fe', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('4d1cea15-e4c4-420a-831e-0aa796308969', '4737ffad-8afe-4bbe-9c76-9ece9d55068f', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-14 13:49:44', '2023-06-14 13:49:44'),
('4d58c3b2-d281-43e4-a8dd-e3a77b68ebf3', '6cd1a9e7-a910-43c8-a930-95dcb2c8edca', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-08-07 18:13:48', '2023-08-07 18:13:48'),
('4e419c97-2569-4c19-b603-89bf8c94af5e', 'c275436b-9379-4114-9770-9e6d376488cd', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:29:14', '2023-05-21 10:29:14'),
('4e683ec8-2bad-433c-92bc-aabc263a1357', '4737ffad-8afe-4bbe-9c76-9ece9d55068f', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-14 13:49:44', '2023-11-22 09:14:12'),
('4e6c0a78-24e7-4ac0-97c1-0fa7fb417ff8', 'eee37105-c97d-4f77-a933-910a0c6e68bc', 'USDT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('4ea68b90-f3e4-4638-8928-09a39e6dcf82', '6f1ba6d2-22bf-4291-977d-534ac1aff4d8', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('4eb7d82e-1708-45c0-824b-d504626a23d6', '6c2de49b-66b3-482d-bf48-8b690f86deff', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('4eba8830-4ff2-4e30-9a04-d48d6a80f5d8', '36f5887f-2b9b-4144-879c-9be2cff7e466', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-13 01:18:02', '2023-06-13 01:18:02'),
('4f051d00-4647-440a-b157-e84f3ff5779c', 'e5720c7b-8502-4a3a-9ee9-8896436a41d4', 'USDT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-07-18 20:08:23', '2023-07-18 20:08:23'),
('4f11a0df-7b64-44b7-9690-5aa065883cd4', 'e18c768d-25b2-4d22-bf2c-1a9115c7ec71', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:29:14', '2023-05-21 10:29:14'),
('4f77509a-ef2a-4b7c-b005-c019e4ca2662', 'adc69fe5-342e-4db7-83d6-1aa6b50e4217', 'TRX', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:23:31', '2023-05-21 10:23:31'),
('4fd9835a-a57c-4802-ae57-d263646166ab', '52523c96-98e6-4e75-a1d8-e3cf094993a1', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-08-20 08:45:28', '2023-08-20 08:45:28'),
('4fe45dbb-210c-4198-a6d5-ccee1009a6ed', '3197597e-5470-45e4-afc1-0b2292d2158e', 'USDT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('4fe673c7-d0f3-4700-9295-410baeace069', '1ac9db2f-613b-4351-ba36-aa8a8e502079', 'ETH', 70000.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-02 16:36:16', '2023-06-02 16:53:39'),
('501d4362-3a6e-4daa-be1b-34a9d74592e9', '934ad33c-0304-4461-b0e5-ba8b3ca61ca1', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:33:02', '2023-05-21 10:33:02'),
('503bc197-7898-464a-bd33-a3f660bbbf18', 'abe08840-cedb-437d-9054-f6ca53045f5d', 'TRX', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('50809a27-6efc-4943-9fca-9d0b7162cc40', '96f24f53-91db-4ab4-80ae-589139774970', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('512c94ff-a20f-4eda-a8a5-74ec7cd4d75a', '57cfdde8-b3bb-4020-bd29-83cc9575bdcf', 'TRX', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-14 18:00:21', '2023-06-14 18:00:21'),
('512f010b-dc9d-416f-8e35-00f8b3fc6d3b', '5b4cd7b8-8ae3-4a91-a25b-cc785c061b14', 'TRX', 2.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-05 10:54:16', '2023-06-05 10:54:16'),
('515d8939-7bc4-4288-b40d-d021f2ce581f', 'eb0d5cb2-a937-4d7e-9e4d-cbd10c9948a3', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:33:02', '2023-05-21 10:33:02'),
('51e20a68-f410-4f4d-b6b2-36c659231231', '57cfdde8-b3bb-4020-bd29-83cc9575bdcf', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('524d8711-a41e-4597-874f-b1c05b2a005c', '5a03c1e3-f18c-41da-b6c6-d372ca6ade8c', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:29:14', '2023-05-21 10:29:14'),
('52b41e52-fae5-48a6-b7a6-370e4aae2556', '34d2fe8e-ad62-4960-ba47-82234f81520b', 'USDT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('52db9530-6fd1-4e40-b967-d6eb243e2c8f', '557a1889-0d7e-4e8c-a314-14e6c4004ee3', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('535644cc-f4d8-4940-a2aa-c984d509fc91', 'd86b3a4d-3a57-426e-8e1e-95a6be996bb5', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('53c0a861-6025-4ab5-9cb5-e1dd8b65cca5', '09ae0ce6-3b8a-4a8a-ac2f-3919888e47aa', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:33:02', '2023-05-21 10:33:02'),
('53e416f2-eea2-4cd8-abbb-a797e1f727e5', 'fd1358e0-095d-4123-8649-e56751a08017', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 10:12:17', '2024-02-19 10:12:17'),
('549e4ffa-5874-4145-b916-8ba0f7fb1e91', '6eb3595c-031c-4f55-abee-80cf6d8c816b', 'TRX', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:23:31', '2023-05-21 10:23:31'),
('55326c75-f20d-4e52-93ef-4cb5604cb277', '32769d8c-4dca-40d5-83ec-99b68df4b130', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('565ea7a5-5e7c-4fad-883a-cde998ed3b5c', 'e18c768d-25b2-4d22-bf2c-1a9115c7ec71', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:25:43', '2023-05-21 10:25:43'),
('569ea637-843c-4cec-8e8f-cdfeac501b73', 'db5d841b-d90a-4437-957a-c7fb5fa86319', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('570196d0-5873-4b87-9214-c401e0a31707', '1ac9db2f-613b-4351-ba36-aa8a8e502079', 'TRX', 2.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-02 16:36:16', '2023-06-02 16:36:16'),
('5739268d-6196-41ae-9374-cbead8cc4117', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('578fdc7d-5e4f-4c03-8b7a-1725417aad50', 'ee485282-d5d5-415c-8946-16fa57fd8f79', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('57e8c84b-c37f-4cb3-b0ee-26b3daf7d253', 'cb74f45c-280c-42fd-a06e-a4672280c040', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('57fec5e6-dd6b-45eb-b38d-38ff431cd46a', '557a1889-0d7e-4e8c-a314-14e6c4004ee3', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('58149a35-cd95-4c9b-8fd6-e37d5cec6557', '2ad4f58d-4cf4-446a-b767-e840add77549', 'USDT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:27:23', '2023-05-21 10:27:23'),
('582a0fff-748c-4c44-a186-6374923d0bc1', '32769d8c-4dca-40d5-83ec-99b68df4b130', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('58c19806-2b8a-4ce2-9536-19594d3cbc64', 'ee485282-d5d5-415c-8946-16fa57fd8f79', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('59160b0f-6a06-48dd-b101-65bdcaa1d8e9', 'db5d841b-d90a-4437-957a-c7fb5fa86319', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('5954043b-deb6-445f-9da2-f21072ff4575', '7db45872-7279-474d-aa0d-d56723822162', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('59c79b78-f214-4af3-a79b-934787ddfea7', '88f8082d-7f6a-44f3-8782-d0be24853117', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('5a09bd42-9fac-4d59-8431-8fad863b71af', '36f5887f-2b9b-4144-879c-9be2cff7e466', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('5a254b67-66c2-414f-97d2-4ff7e7a109b2', 'fb35867d-1db8-4b6d-9f19-54ab0b2ddab1', 'BTC', 2000.00000000, 'TVeqBqbW3XDUM5RY3oWfrMqzj8wxsmvs92', NULL, 'eyJpdiI6IkpnaTdBcnRUZENCL0dnYStKQUtDeXc9PSIsInZhbHVlIjoiQjd2cUpVL0JxNWNPWFBhdGptQ3JBeVE0NW9nUHBOQlJReFo1YjNSQVhjdXltOFZmOG03UVNlNmdjSHYzOWJrODJYWWRobVJlcEowUk5lRlFtZ0JWVm1KUlIrUmpaVGZnNDNlalErOWdUVlN6dTFLZ1dpTVcyNTRmNzRVdGtHQ3JQbUNjdUNMRGJNbTQ2M1hPS1d1clFQaXZJY1JucW5wM1BOSytnczdqS3FLRDBqVloxenI4SnFXYTlaQnN3QXF5IiwibWFjIjoiNTkyZmM1MmI3ZTQ0OTU4ZGM0MGE1YWJlYjc3ZTcxMjRlOGQyYTFlNjE2NjIzMTYwZDg1ZDc3ZDA0N2NjYTE1MCIsInRhZyI6IiJ9', 'eyJpdiI6InRwd0thYllDN212SHRQYUNNM3VueFE9PSIsInZhbHVlIjoiUXlGdEVLMnM3SStUYXhkVFBqN0N4eHh6VWFLZE9Jcm13SWFGaUpaY1NoUFpaSVpjYXpLZ0ZaL09vQ3l0M2libUpQRm92TWJ2NnpNdlA5bEp6ZFZ2amJrajEzRmRpWXFuN1pBbjZKUmdlVmc9IiwibWFjIjoiYWM4ODZmNWZhNmE3NGNjMTU4NGZiZTA1NWJjZGM3YWNjMTdhNzgwMjQ3N2U1ZTZmMTY1ZTZjNjgyNTNmYjA1MiIsInRhZyI6IiJ9', 0, 1, '2023-06-01 14:17:57', '2023-06-20 15:03:56'),
('5b63f433-1049-4ae0-a36c-b9f31e7f6a3b', 'db5d841b-d90a-4437-957a-c7fb5fa86319', 'DOGE', 99999999999.99999999, NULL, NULL, NULL, NULL, 0, 1, '2023-05-25 12:50:06', '2023-05-28 09:00:13'),
('5b68865d-c74b-4872-b782-f0d882bc036f', '467671a6-55bc-4527-ba1f-d0d2b562fca4', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-06 14:15:45', '2023-06-06 14:15:45'),
('5baaa31d-3e0e-4890-9aad-1f005aa8d9fa', '62cb835b-6592-459f-a2e4-f6dc5b7ac7f1', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:36:02', '2023-05-21 10:36:02'),
('5bd99158-5c6b-4e6a-8b92-42e29067b22d', '1ba19fda-1281-47fd-9059-c26571b6edc8', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-01 21:53:47', '2024-02-01 21:53:47'),
('5c06c824-6cb5-442a-b460-b917c1eb7ec6', '86f3c2c9-e4c3-4192-ad1e-d34a6b188833', 'TRX', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-07-18 20:16:27', '2023-07-19 09:49:53'),
('5c0c423f-67c9-4dfc-b8c1-1347052bc908', '1ba19fda-1281-47fd-9059-c26571b6edc8', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-01 21:53:47', '2024-02-01 21:53:47'),
('5c62da12-4f0e-4cb3-8eaf-f16855995019', 'f9ca05bf-6025-4a42-87f1-78001c65886c', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('5cac0f0e-57f0-45b2-a361-4712b243801f', 'e18c768d-25b2-4d22-bf2c-1a9115c7ec71', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:36:02', '2023-05-21 10:36:02'),
('5cd57438-e5bb-4b3d-b212-f52016ada2fe', 'f978562a-6102-47ef-b44c-00962596e9e4', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-12 10:53:36', '2023-06-12 10:53:36'),
('5d1c13a4-68c0-4e3b-9dc1-d6b53138bba3', '96f24f53-91db-4ab4-80ae-589139774970', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('5d5460c0-5ba7-4a4c-8a9f-72d9c87e1855', '47dea59c-e88d-4c15-ad52-fa0dc6de1631', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('5dd3cee3-e14a-4755-bb98-bfa7c9355781', '44d4809d-28e1-4685-b15c-dc11134fdf1d', 'TRX', 1000.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-07-20 09:58:46', '2023-12-16 11:49:27'),
('5ddd630c-5c17-4039-9b49-49e81553642a', '6dd2b333-abab-4c57-b4f5-d33e4dd70f39', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('5ddd9c82-6450-44db-84d5-6f153b5ace27', 'd72e5177-9169-4d3b-a805-aa9a45da9c32', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('5e6a387e-3b54-45bf-b9db-22d994263a84', '3b4df004-bb15-4c73-b23e-f7d614f64b8e', 'USDT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('5e7bfd50-f6c5-4ff4-b24b-2a3e6d5f6e51', 'f9ca05bf-6025-4a42-87f1-78001c65886c', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('5ea270a8-f1a0-4b03-8ca8-73b849666bcc', '467671a6-55bc-4527-ba1f-d0d2b562fca4', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-06 14:15:45', '2023-06-06 14:15:45'),
('5f51a245-c5e5-437a-b934-517feafa2740', 'ff837428-0711-4c3c-91a6-dd44e69ca5e7', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('5f5e458f-3be9-414a-8b6a-bb6e2672eeac', '5a03c1e3-f18c-41da-b6c6-d372ca6ade8c', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:36:02', '2023-05-21 10:36:02'),
('5f91476e-fd32-487f-9f60-ab7ca7a3a634', '57cfdde8-b3bb-4020-bd29-83cc9575bdcf', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-14 18:00:21', '2023-06-14 18:00:21'),
('5f95016e-8238-4b82-93de-80b6a65082ba', '7b621b7c-6760-4430-9a30-10d8134b442e', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('5fe55a53-48a8-4cb8-8b9e-4a614ac4c943', '492e02b7-cab9-42f2-9b42-6a6d373b2e24', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:36:02', '2023-05-21 10:36:02'),
('6039f93d-6deb-473e-a6c8-85bdc41c5821', 'ee485282-d5d5-415c-8946-16fa57fd8f79', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('603e3b97-89f1-4e2f-98b2-3a641ab966bc', 'eee37105-c97d-4f77-a933-910a0c6e68bc', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('60d86ca2-e374-46fe-b766-da0f6eb9e1a6', '6bb43481-d32b-4038-9358-85a962250b5c', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:36:02', '2023-05-21 10:36:02'),
('610c84b2-a770-471e-9347-2c73405d3a75', '4737ffad-8afe-4bbe-9c76-9ece9d55068f', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-14 13:49:44', '2023-06-14 13:49:44'),
('6126e975-0e73-4e61-917a-72a4a863dc40', '6c2de49b-66b3-482d-bf48-8b690f86deff', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('614066f6-c663-4928-a4b1-6e4e81160185', '7b621b7c-6760-4430-9a30-10d8134b442e', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('618eb3cf-6632-4f55-8f8a-434ca8f23b08', '6b45b07e-0969-4bae-bd21-fc7e7597ef8d', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('622d3c45-5c65-450e-a571-2c6c21790bb8', '48ace508-5a29-483a-92d6-e1dc362baee8', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:33:02', '2023-05-21 10:33:02'),
('6338871b-0f65-4e5e-b050-a32bdb46df71', '7db45872-7279-474d-aa0d-d56723822162', 'USDT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('6351daee-8231-4056-a8fe-bff7dac0e4d2', 'c275436b-9379-4114-9770-9e6d376488cd', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:25:43', '2023-05-21 10:25:43'),
('63bbac9c-514a-48af-8617-378e16e69ea2', '6f1ba6d2-22bf-4291-977d-534ac1aff4d8', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('6400859e-7021-4487-8481-8ba016d35f34', '32769d8c-4dca-40d5-83ec-99b68df4b130', 'USDT', 10000.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:27:23', '2023-05-30 10:15:28'),
('6407393d-1bad-4135-bdda-558db408e6cf', 'eee37105-c97d-4f77-a933-910a0c6e68bc', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('6423e365-439b-447c-856d-d303f3ad5411', '2446118a-33ae-4cb4-8ca9-4e1c8dd68f4f', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('64362082-ce52-4ab2-bc7f-eaa58de06113', '88f8082d-7f6a-44f3-8782-d0be24853117', 'TRX', 2.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-09-10 14:17:32', '2023-09-10 14:17:32'),
('6462f3b1-6bcf-460f-94bb-b3307dbe660c', '48073e55-f172-4b10-b11b-7203b2b5dbd1', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('64749d2d-5197-468d-8ee7-9d085a2182d3', '923956af-60ea-40f0-8065-aac5c4fb3791', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-09-14 11:32:26', '2023-09-14 11:32:26'),
('64885a8a-f717-42eb-82f8-4701f9cddc6a', '7cde25b7-e520-4fb3-85df-f5fcf89305d3', 'USDT', 13500.00000000, 'TMVnBuf4R1aJfSQEMK81CqV7sDPZGNywBr', NULL, 'eyJpdiI6Ik5lVGtMbVdiUmFXL3B0aWtVQTgxM3c9PSIsInZhbHVlIjoiU010YnIwdlcrTXdKUFhQN1NNeDNGKzZIckNkTE12cDNjUFpZK1F5T2w0TXN4VnNxUWI5Q1RWUmRZT0o5TFJ1eFZuSTdPUDhIZG1zNE0wYU9xOEtTbGRJUzd2OFlzYnBTK0M0TnJESTFtQVFCZVpUeXp4SDcvbjl4TlpSdG1adm44RkFMYTdjMGN0MFdTd1dtT0g2bXFvZVBnLzltMkZrS1dNcVNNaERNY3pDZnQ4dEFUZWhWQ3V4RXhyaG13dm53IiwibWFjIjoiMjc3OGEyZGMyYWJiMjI5YjJlMzkzNTAyZmYxMjgxZjkzOWQ4NjNhNGE1YzAzOGU4OTA2ZTQxYzY0NzUyNjM3ZSIsInRhZyI6IiJ9', 'eyJpdiI6ImpUOStnL0Z1THRvcU1ydDRNaXVBdmc9PSIsInZhbHVlIjoiNkY1ZUozWjlMYllpTU1raUs0WlZUZUhXb2ZLMnowWVZBemd0UHlrdUViaFBkd2t4WHlIMmFhRGVDemlSaUV5K1FpZ2ZZbXptbmxUUGdGRWgzR2tWNUorN2hGWWhrd1B4c3MwdlhxV0ZoYUE9IiwibWFjIjoiMTgzNGY2ZWZjY2ZlYzg1NDE5ZGNmZDEzNmY1Mjg1YmE0NWE0YzU3ZjliMjRmOTA0YjA1Njk5OWNjNzZmNTIzYSIsInRhZyI6IiJ9', 0, 1, '2023-06-09 13:43:35', '2023-06-12 13:00:08'),
('6492d299-daaa-4c93-a2b0-c4fcadb8bcbe', 'f9ca05bf-6025-4a42-87f1-78001c65886c', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('64a27469-3a4f-489c-be61-9718b47e1cec', 'd7ce0527-5843-4fd4-9253-ec190e726a4a', 'TRX', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('64d5d686-18ab-4db9-8430-7840bcaf66e9', 'e7c629dd-0b1e-4094-bc83-6c928f77b357', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-20 15:07:49', '2024-02-20 15:07:49'),
('64e8c242-8efe-41a9-8b1a-e173c0962df6', '22fe5dc1-07ab-4809-8f56-8590c68d9ab3', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:25:43', '2023-05-21 10:25:43'),
('64f8195e-484a-4558-81d3-96d03760048c', '6c9d2b9b-812c-4ba7-9bbe-66d940eaa5bb', 'USDT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:27:23', '2023-05-21 10:27:23'),
('65580154-7093-4b04-8b1e-4d060b9d611b', '6f1ba6d2-22bf-4291-977d-534ac1aff4d8', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('65d81edd-036b-494f-beda-c816811fa041', '60145862-0641-4106-af67-8de47b916abe', 'BTC', 35000.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-05 09:54:36', '2023-12-14 12:59:45'),
('6696fd1a-f277-4f58-a4fc-a596e47e2818', 'b9ec7d63-015c-4814-b253-eb1d45eae4dd', 'TRX', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-07 13:12:27', '2023-06-20 13:47:54'),
('66d1f930-dd13-409c-854f-0a182d9bd280', '492e02b7-cab9-42f2-9b42-6a6d373b2e24', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:25:43', '2023-05-21 10:25:43'),
('66f141ab-4792-482d-9be1-dd480847459e', 'c275436b-9379-4114-9770-9e6d376488cd', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:33:02', '2023-05-21 10:33:02'),
('6713e61c-bac5-4338-a685-d886803938ec', 'da77601a-40e5-4bb1-b584-2b82bd26370f', 'TRX', 4.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-07-18 04:32:54', '2023-07-18 12:18:02'),
('67420015-55b7-45b5-b885-40735b607d8a', 'f9ca05bf-6025-4a42-87f1-78001c65886c', 'USDT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('676341bf-ec74-4094-9eef-018cbd06b624', '04b781e1-0a41-4703-888f-468243ebda36', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:31:50', '2023-05-21 10:31:50'),
('67a0d881-92be-4f8a-9ffd-8aafdbcc17b5', '98697609-12a9-4415-a700-07de18f31ba9', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('6802778d-9bed-41b5-84d3-0c594e46b268', '01bac2f0-2e3c-4116-a7fb-61c4d149a2e6', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-12 10:22:18', '2023-06-12 10:22:18'),
('682d04d9-81f8-4e4f-aa5c-77f570b2e4a1', 'ee485282-d5d5-415c-8946-16fa57fd8f79', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('688e1b5b-94aa-4845-a06f-df2c30461c8e', 'fd1358e0-095d-4123-8649-e56751a08017', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 10:12:17', '2024-02-19 10:12:17'),
('688f6167-142b-499a-9bd9-5c38b5d56457', 'ff837428-0711-4c3c-91a6-dd44e69ca5e7', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('68a6ef97-04e9-4045-a3ab-06f42861174b', 'e7862d9c-fba8-4509-b59b-a4cb4f71ba04', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-07-25 05:19:47', '2024-02-06 14:03:10'),
('69548152-72de-4de8-87e2-c5238e18f0a3', 'dff7716d-646f-48ee-8d87-a1f8461230d9', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:31:50', '2023-05-21 10:31:50'),
('69ed0894-ae34-4860-a6f9-212e808b8c06', '47dea59c-e88d-4c15-ad52-fa0dc6de1631', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('6a9d8860-0440-4c25-88f7-29bc790f7721', 'ee485282-d5d5-415c-8946-16fa57fd8f79', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('6ac5c8ed-3544-4e76-8f5f-9a122dd89bba', '794254a9-ab67-4e67-8f36-861c423c29a8', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-09-12 02:41:44', '2023-09-12 02:41:44'),
('6af07be6-430e-45ec-969c-7118a26958c1', '9fad722d-6b02-4504-b431-ed6f14b20847', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:31:50', '2023-05-21 10:31:50'),
('6b010fda-e7d0-4573-b253-28b8171b92fd', 'd86b3a4d-3a57-426e-8e1e-95a6be996bb5', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-07-19 11:01:40', '2023-07-19 11:01:40'),
('6b5993ad-88f3-45a2-9661-eb210e6ca902', '47dea59c-e88d-4c15-ad52-fa0dc6de1631', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('6bf86214-1ed2-4c71-a9b5-99b9afdcf018', 'dff7716d-646f-48ee-8d87-a1f8461230d9', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('6c62f2fb-fb83-4ccb-b118-d39001d1f6c0', '86f3c2c9-e4c3-4192-ad1e-d34a6b188833', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-07-18 20:16:27', '2023-07-18 20:16:27'),
('6c95fa3c-75e3-452f-aa40-c7f10bfd558c', '6800875b-c059-49a2-aec7-8612c7d402a1', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-09-09 22:04:27', '2023-09-09 22:04:27'),
('6d524134-f5b6-400a-ac07-0a17685850cc', '36f5887f-2b9b-4144-879c-9be2cff7e466', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('6d5870b6-9438-4163-8085-da093ec4140b', '3b4df004-bb15-4c73-b23e-f7d614f64b8e', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('6e579983-e6ed-4b25-a4ff-91a7fbb2fcf2', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'USDT', 326441716755.15049355, 'TSz8ZGBdd8HpWKSYuu8Hk69UgCDc3ktDGW', NULL, 'eyJpdiI6ImZCL2ZvMzkvdWFNcFVEdldQMTlGcXc9PSIsInZhbHVlIjoiUzl4TW5TeDBVN092Ty92ZFFTcGVPdHhpU25FYVlIT1lGRmQ5M3A4Z1hoUTZmWisreldlZ3NYYUp5dnRKdGc5eWk5OHpUK1dobHY0U3ZXV3ZYT0ovbUhqNkQ0MUU4RDl6WThYRFp5QVVSNGF6VVIvbXhhZlRKUzB4MDc5UTJTeFJTS3BDMFAyUnBTdFlSMGRISFBBckFxYUM4K3lDZHhXYkRxV0dRckFWcW83c0R6aHZKelM3N29CVHJyR3ArUmp5IiwibWFjIjoiNTdmMGQ4NWQ3NDdjNzk1NzhkNWU5MzY1ODE4M2MzZjYzZmE3M2U1YmRhYThlMGU0Yjk3MGU4ZGFhYzI2NzdkYiIsInRhZyI6IiJ9', 'eyJpdiI6ImxqNm1adjNSZ1Nnc21pZ29NUFkxdkE9PSIsInZhbHVlIjoiTE5vaGx6NTQvSEFXNEw5WFNjUGluS1JwSFRYcVdDeFpWbXMyMmFFQy82b2RBaE51Y2NxbnU2UnFKR0xLTHpRZC8vd1RwYmdKQm1OM0RSV3RlUzdTVUwrTWJOUTV1NnQ4L0VUbHh1dVIwTlk9IiwibWFjIjoiMGFmYmQzODE5OTFmMWI0NDRhNjRlZTUzNWNkYTk2OGNlYjNmZDZhNzM2ZWQyMjMyODhiODI2NTljNjUzNjMzYiIsInRhZyI6IiJ9', 0, 1, '2023-05-21 10:27:23', '2024-04-09 10:45:27'),
('6e6ff2ea-25b1-4d77-98cb-cafde558c52b', '5b4cd7b8-8ae3-4a91-a25b-cc785c061b14', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-05 10:54:16', '2023-06-05 10:54:16'),
('6f04a6f1-6bc0-4199-8c7b-4d2acf37e835', 'fb35867d-1db8-4b6d-9f19-54ab0b2ddab1', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('6f209956-6ec0-402c-b880-1c0188715117', '6dd2b333-abab-4c57-b4f5-d33e4dd70f39', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-08-04 16:40:57', '2023-08-04 16:40:57'),
('6f37b2a0-5760-4236-87c6-0b9b1ff8b16a', 'abe08840-cedb-437d-9054-f6ca53045f5d', 'USDT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('6f447202-06f0-4dc5-bacf-f8a360642d9b', 'fd1358e0-095d-4123-8649-e56751a08017', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 10:12:17', '2024-02-19 10:12:17'),
('6f7039c1-41cb-4a24-98a4-5f70facbd9b8', '86f3c2c9-e4c3-4192-ad1e-d34a6b188833', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-07-18 20:16:27', '2023-07-18 20:16:27'),
('6fb5edde-2fc1-4f04-9680-775e9babaf13', 'a502eb20-d81c-4f3e-a56f-11444fe1e4cb', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:36:02', '2023-05-21 10:36:02'),
('7011c372-dfd3-40fb-8f53-abe38bab5b19', '12a277f5-c2ee-44a6-82da-f6f5e03758a9', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-01 13:16:13', '2023-06-01 13:16:13'),
('70d46a06-1565-4257-a188-8154a6014df7', '22fe5dc1-07ab-4809-8f56-8590c68d9ab3', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:31:50', '2023-05-21 10:31:50'),
('710eb809-240c-4ba4-bb9d-42f76786ea36', 'd7ce0527-5843-4fd4-9253-ec190e726a4a', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('7115463b-4e02-42c6-ae1e-2171c8b53a9d', 'd2b09976-3be3-43e8-81ef-d0dd81784cdf', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('71273c36-200b-4d6b-bc74-9db6d8e30950', '2ad4f58d-4cf4-446a-b767-e840add77549', 'TRX', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:23:31', '2023-05-21 10:23:31'),
('7197d04c-30ef-4a58-964e-0d1bc69dde7c', 'e7862d9c-fba8-4509-b59b-a4cb4f71ba04', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-07-25 05:19:47', '2023-07-25 05:19:47'),
('71a67c46-0fdc-40c3-88b4-fb44a7153464', '2446118a-33ae-4cb4-8ca9-4e1c8dd68f4f', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('722563cc-e112-4101-a27a-44dcab186306', 'b9ec7d63-015c-4814-b253-eb1d45eae4dd', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-07 13:12:27', '2023-06-07 13:12:27'),
('725a37f6-e071-4e16-8b90-d634d20a5ca0', 'e18c768d-25b2-4d22-bf2c-1a9115c7ec71', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:33:02', '2023-05-21 10:33:02'),
('72b3556e-1a56-4f25-a1e8-2699e0c178a0', '48073e55-f172-4b10-b11b-7203b2b5dbd1', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('72b9d0fa-62a0-4fb9-a029-b604315299cf', 'd6ac746d-90e7-4a93-981d-5602b6324d4f', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('72c0e3bc-0f74-4bed-acf5-a387970fd92a', 'adc69fe5-342e-4db7-83d6-1aa6b50e4217', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:31:50', '2023-05-21 10:31:50'),
('73475723-89a5-48b4-9602-cb381d24b478', '89e4087c-1287-47c9-b101-f87da3cd0acb', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('73ab9093-d2a2-440b-9353-74d9c8de60ae', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:33:02', '2023-05-21 10:33:02'),
('74672a34-6723-4570-81d3-823ab6a0d28e', '675d5181-9662-4d5a-8e29-924e2b58b24f', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-07-25 15:39:19', '2023-07-25 15:39:19'),
('74739060-4cab-40bf-aa0a-dc1e31ee50ba', 'cb74f45c-280c-42fd-a06e-a4672280c040', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-07-21 16:30:06', '2023-07-21 16:30:06'),
('747f67f8-4bce-46a0-9918-81e78887bc00', '6eb3595c-031c-4f55-abee-80cf6d8c816b', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:36:02', '2023-05-21 10:36:02'),
('74a5608a-4788-4ac5-a8b4-8c48df7a1cb8', 'eb0d5cb2-a937-4d7e-9e4d-cbd10c9948a3', 'TRX', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:23:31', '2023-05-21 10:23:31'),
('74d33404-7144-468e-bc1c-dbc52c98d6b4', '1ba19fda-1281-47fd-9059-c26571b6edc8', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-01 21:53:47', '2024-02-01 21:53:47'),
('757c5f3c-6aba-4a78-ad6f-337f3b999106', 'f9ca05bf-6025-4a42-87f1-78001c65886c', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('75b45252-9d77-4b36-b327-407eca72cf32', '2446118a-33ae-4cb4-8ca9-4e1c8dd68f4f', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('75c5c452-70f8-4eb4-9719-892ab6707da4', '62cb835b-6592-459f-a2e4-f6dc5b7ac7f1', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:25:43', '2023-05-21 10:25:43'),
('760bdc14-2dd1-4804-b3ab-e81be76d6cdc', '22fe5dc1-07ab-4809-8f56-8590c68d9ab3', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:33:02', '2023-05-21 10:33:02'),
('761aadd3-cf34-44bb-86ce-28628da4d063', '7b621b7c-6760-4430-9a30-10d8134b442e', 'USDT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('764c5611-5cf1-4df8-b25e-091ac243a83a', '5e5189aa-f3b7-4e90-ab71-48eb3d97bf08', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:31:50', '2023-05-21 10:31:50'),
('76ef77ae-5a5c-4d02-84b9-9365b1d489fe', '07b97174-b6d2-48b5-a9a2-f8c1443eaf3e', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 11:06:15', '2024-02-19 11:06:15'),
('773b74e2-1638-4841-80d7-57d6074758e8', 'd2b09976-3be3-43e8-81ef-d0dd81784cdf', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-07-26 10:01:28', '2023-07-26 10:01:28'),
('77a11e04-9b8e-4dd4-8bf6-a61e9db23422', 'f9ca05bf-6025-4a42-87f1-78001c65886c', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('77d280c0-8ed8-404c-a3b8-82790006a986', '96f24f53-91db-4ab4-80ae-589139774970', 'TRX', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('77fdba37-d5f8-4098-9ab3-ad0e5c486347', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:31:50', '2023-05-21 10:31:50'),
('78151385-e5eb-4d42-b0e4-13a793a6cef0', '6b45b07e-0969-4bae-bd21-fc7e7597ef8d', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('78ad4343-2e56-48a7-a1f6-e1d38ed4b4a4', 'd72e5177-9169-4d3b-a805-aa9a45da9c32', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-05 09:35:46', '2023-06-05 09:35:46'),
('78ef941e-e132-4001-94d6-6c16918ede1f', 'ee485282-d5d5-415c-8946-16fa57fd8f79', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('7980f901-cf0e-4907-9b6d-fb88972b2d32', '7cde25b7-e520-4fb3-85df-f5fcf89305d3', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('798ee532-802c-4161-84ee-a7ab19ab87dd', 'abe08840-cedb-437d-9054-f6ca53045f5d', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('79a71f08-71f8-4c51-81b7-423191491ce3', '5b4cd7b8-8ae3-4a91-a25b-cc785c061b14', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('7a32c5c1-3f05-4753-aae6-da68d1adbda9', '6eb3595c-031c-4f55-abee-80cf6d8c816b', 'ETH', 0.00000000, 'TMwGs2ertTKd9RbEQDccAGgVL9DXYYRbiD', NULL, 'eyJpdiI6IjE0eVlMTnlWWWIySWlVTDkxSGdIWkE9PSIsInZhbHVlIjoiQ3RGb0pWU0ZpUi9WN1VJOEpVUmpZRDNEM0t5WDZVRWhOOVowWEpkbEI3T3VWTC96bS9jejEzTnBiNUZzckswVVlSU2VnYzNXUmo5M3d5d2txN1ZGOExQUjJoREJaOXp5NDlwTHRDK1l5SUVYeDVHUHhyVlBEWldBWkZLSFNTM3VqTHVZRTlVU2tLY1NJNmZOU2RzSGhIOVlKV3dBa1ZkUTRwWGxmZlk0SFk1ckhOWDV5UHRhc1F2bGlVR0swZTdLIiwibWFjIjoiNThjMjQyNDlhNDU3YmZhNzkzYmQ4ZWIwYzdlYmNiODAyZjRkY2ExMjc0ZGY4MjM2ZGRlMjk4MDgyNmMzM2U3ZSIsInRhZyI6IiJ9', 'eyJpdiI6IkxUaW40SVNVa3FKcHFkdmwzZTEyRlE9PSIsInZhbHVlIjoiQXNEbTRzc3BwbXhaMGh3SFN5SGdhQUV3VE45YjM5N3JnNnlUMGZZQXQrTUhxUVBBZGNPRXNua0dLZUk4S0FFOUxXRk44Q3MrNmgxZW9JZHRIWTc1UnpDK1REUCtadEpSTktKQi81S1l2b009IiwibWFjIjoiN2Q5ZmRlNDE0MDg4NGU4Yzk3ZmIxMWRmY2Y2ZmJkZjc5ODNiNGUzZTkxMTEzNjE5MzZlYzhkM2NiZGFkOTE4MiIsInRhZyI6IiJ9', 0, 1, '2023-05-21 10:29:14', '2023-06-09 12:58:43'),
('7a8ea38c-7242-41a6-a431-446f195af674', '2ad4f58d-4cf4-446a-b767-e840add77549', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:25:43', '2023-05-21 10:25:43'),
('7b65a2b1-fa9d-4fcc-b4fd-b63ff42ba569', '7cde25b7-e520-4fb3-85df-f5fcf89305d3', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-09 13:43:35', '2023-06-09 13:43:35'),
('7b74b8c3-d61d-4e5f-80e9-3e0567683aa9', 'eb0d5cb2-a937-4d7e-9e4d-cbd10c9948a3', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('7b9a1b2e-c9eb-4672-a157-c4cf80780d96', '9fad722d-6b02-4504-b431-ed6f14b20847', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('7bf71abc-9506-499f-954e-9a8b402b39b5', '32769d8c-4dca-40d5-83ec-99b68df4b130', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:36:02', '2023-05-21 10:36:02'),
('7cbe78a5-08bb-4d45-8d15-8d1e05643710', '88f8082d-7f6a-44f3-8782-d0be24853117', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-09-10 14:17:32', '2023-09-10 14:17:32'),
('7d93da06-244b-409d-acca-b150f1f8fae2', 'kocoina8-bbd6-4f8b-9fbf-48711485ab8d', 'USDT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:27:23', '2023-05-21 10:27:23'),
('7dc9fe74-fa5b-4e1e-aeee-6f9671fc14c0', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'IRT', 46148300.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:36:02', '2024-03-22 09:07:01'),
('7df17a75-39e1-4fc8-861c-435530bd50ac', '7b621b7c-6760-4430-9a30-10d8134b442e', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('7e120e91-d8b9-4efc-a986-93791bcebc4c', 'f978562a-6102-47ef-b44c-00962596e9e4', 'TRX', 2.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-12 10:53:36', '2023-06-12 10:53:36'),
('7e1df42f-f7bb-46d5-b779-8de31014bb31', '6800875b-c059-49a2-aec7-8612c7d402a1', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('7e3abe16-7154-495a-820b-184a3d4d97b6', 'eb0d5cb2-a937-4d7e-9e4d-cbd10c9948a3', 'USDT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:27:23', '2023-05-21 10:27:23'),
('7f1a422b-cc33-4b19-b1ec-d58c90539fc7', '32769d8c-4dca-40d5-83ec-99b68df4b130', 'USD', 10000.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:33:02', '2023-05-30 10:16:26'),
('7f56a473-7b22-43be-83cb-776b1456b1c6', 'c034dc12-2661-4cd4-b118-febdc33c27e6', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('7f6dd85b-263d-40ec-b7d1-cdf9e445acb1', 'd7ce0527-5843-4fd4-9253-ec190e726a4a', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('7fe7f745-1c69-4cf8-a98a-0a3a22e98259', 'e5720c7b-8502-4a3a-9ee9-8896436a41d4', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-07-18 20:08:23', '2023-07-18 20:08:23'),
('7fecf090-d63d-4552-abbf-89d7b70bac14', 'b9ec7d63-015c-4814-b253-eb1d45eae4dd', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('80a2d97c-c8b3-4557-ba4b-5468c517f05f', 'c71eeafd-849d-4cb7-8275-1ebcd9ac93d8', 'ETH', 0.00000000, 'TREmDjbq1nnfxzfzgvm4o1znL6zSooMv7Y', NULL, 'eyJpdiI6ImJXT2puRCtuSDJmWVJkd1V2dUJKQUE9PSIsInZhbHVlIjoiekEySW9vSGlLRU9RNHkwYStaWDB5VTVGSUdtN3NweHI2UU5WUzFuUmNXN1RPd3lGenkvQWZ5Mi9xTnI3djhhUzNJaEdDZGU5eG1raHNYNTBKOXRHT2R2UFVOZHIydFZ0MlJmVndLdXVMN0oybXVLSnl5UHZIdDZ6d0lyWDRGNFNLR1BhMFFXS3o0UTZpNzhFTFhNbytRaFJnZ0lBeUVLNFgveVZaM3dpTUxPTnhmaFJ0RTdVSCttZC9uM282cTRYIiwibWFjIjoiZWY4YTZlOWY5OGY1Nzk2NGUzOGNiZWVlNTBhNmZhZTUzYmNlMjU3OTI3M2M4ZjA1OTAzMjU1N2YwZjNiZDU0ZiIsInRhZyI6IiJ9', 'eyJpdiI6IkdXK3VDNzZ0SG82OGFvVkREUzhjN0E9PSIsInZhbHVlIjoiRHJwaS9XT25sRkluTEdBOURxZFBlZ3hYT3o4OUxvK3V1R0szY1BpUmpnRm9lU0trUUhpK0w3WFFMVmNCOFUwYnk1RmZQVmd0anFQQ3BRRi9laVY1V1Y2WUwwKzNraUZYcFlBclNtdURSTG89IiwibWFjIjoiMTFiNGQ2NjM5OTdlZTJiZTI3Y2VhOGRjOGFkYzNmZjE2MGVhZjFkMDI0ZjdjMjAwM2RmZWVlNGVmY2I2ZDE2ZiIsInRhZyI6IiJ9', 0, 1, '2023-06-04 15:02:20', '2023-12-04 17:59:30'),
('80e72669-d4f6-4026-bb95-78a67c2615aa', '36f5887f-2b9b-4144-879c-9be2cff7e466', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-13 01:18:02', '2023-06-24 13:58:51'),
('8108dd0c-51e2-4491-b253-2a993feeb152', '675d5181-9662-4d5a-8e29-924e2b58b24f', 'TRX', 25.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-07-25 15:39:19', '2023-09-28 16:55:25'),
('81559541-ed77-4f39-851f-098e83d68a06', '8208d769-48db-4e2f-8831-f48ead232203', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:36:02', '2023-05-21 10:36:02'),
('81b47eca-e254-416e-8456-31221d2869e4', 'eb0d5cb2-a937-4d7e-9e4d-cbd10c9948a3', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:36:02', '2023-05-21 10:36:02'),
('81b96a29-64a9-4ee0-8f72-de7a8b064232', '933d676a-c435-4697-bdf2-e54d026c156e', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:36:02', '2023-05-21 10:36:02'),
('821449f0-8ed5-443d-b0f9-3e830c68014f', '12a277f5-c2ee-44a6-82da-f6f5e03758a9', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-01 13:16:13', '2023-06-01 13:16:13'),
('826f12da-2934-47f9-80bb-31b9a42021b3', 'e7862d9c-fba8-4509-b59b-a4cb4f71ba04', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('82998dff-0a42-45df-b3ca-b38f37c5d44b', '2446118a-33ae-4cb4-8ca9-4e1c8dd68f4f', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('8340bf17-f03e-40df-a708-0e59a318346b', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'MATIC', 0.00000000, 'TPBLaHbawLTXQMPKSLQjd43gS52YnXykiu', NULL, 'eyJpdiI6Ikp2WmxUcXRZbFZUMjhqaUJXNk9sUFE9PSIsInZhbHVlIjoiZTNpM2YyQW1CdzIrTHZKdTJxeGNEOUVyVjJveUdhQVd1UjRJcmMyUVhvSlJTWXl0MzhoNnBGVDNaeVZlcWF5eTkwMXJWMFdhWkloODNVaFA1V0w2bm12T1hhTlJ5UUVFUHFZOTM0U1I0ZXNiNlNHRGRmNnNQTVJpbkNaYzl0WW56dkhqczUrZWQzb3hCM2l6ZHFmRWc3Q25pSllUQlpoNGRUTm1TczJNazhwa244OHB3SnZoUjRtTWZzZkQ1UTQzIiwibWFjIjoiZmU0OWFjOTc0ZjhmN2ZiMjNjZjYyYzNiMmQzZmZjMDM2YTE1OWVhZjE0NTlmMTJlZTAzZTkyMGQ5NGRkZTY3MCIsInRhZyI6IiJ9', 'eyJpdiI6Ink0YTBSWnVqSmYzMG5VRDY1Vno2c1E9PSIsInZhbHVlIjoiYVRUNklKaTZjamt5WEdGWGZkQmVXeEE3SGpEOE10dnVWQS9pTThidDZGK1lFOW1EYkZ3aXBCVGR4MDlzY2tobUh5dlBkNTZmNEtNWEpOejh1c2pocFhhZ0J2d0hEUkxzN1c4blhOQkZqZ3M9IiwibWFjIjoiMTExNGZkZmI2M2U4YTg2Mjc4MmY2Yjg3ODFiYmIwMzNiNjE5M2M2NmUzNGYxZjQ4M2JkMDNmOTVlMzUwYjc1YiIsInRhZyI6IiJ9', 1, 1, '2024-02-19 05:26:40', '2024-02-19 05:31:46'),
('8370616b-8897-4a57-9a44-a5ce6f5b6946', '96f24f53-91db-4ab4-80ae-589139774970', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('83ded5f4-f09b-4ff8-a797-b9f2451c8746', 'f978562a-6102-47ef-b44c-00962596e9e4', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-12 10:53:36', '2023-06-12 10:53:36'),
('8438e97a-540c-4552-933d-13767133c3fe', '04b781e1-0a41-4703-888f-468243ebda36', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('84ab09ba-a26c-4f48-bf2b-e9e973424262', 'c71eeafd-849d-4cb7-8275-1ebcd9ac93d8', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-04 15:02:20', '2023-06-04 15:02:20'),
('854e2fe9-518f-4f1e-bd57-1461292f09f7', 'a01cd4e5-4cbb-48ab-bfde-2b558ab60d88', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-07-20 08:02:36', '2023-07-20 08:02:36'),
('860805de-7d39-4825-990d-bdf9805af726', 'd7ce0527-5843-4fd4-9253-ec190e726a4a', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('86b5a58f-2fa9-4b0f-bccc-95ed28b17c6d', '32769d8c-4dca-40d5-83ec-99b68df4b130', 'BTC', 10000.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:25:43', '2023-05-30 10:16:04'),
('86c7a5d2-2bac-47fc-964c-dae23c531920', 'cf37d061-aa9c-460d-9701-66439afc812d', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-13 13:21:15', '2023-06-13 13:21:15'),
('87304986-9990-476e-908f-eaf87f816802', 'cdc7f9c6-150b-4b90-bc4a-8ce2f71f5c83', 'USDT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-14 18:00:21', '2023-06-14 18:00:21'),
('8734c641-5ce2-4fe0-9298-700721e91f6f', 'b9ec7d63-015c-4814-b253-eb1d45eae4dd', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-07 13:12:27', '2023-06-07 13:12:27'),
('874329b4-5fe2-48b3-9808-6e0d0f9dcb79', 'c034dc12-2661-4cd4-b118-febdc33c27e6', 'USDT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('8776dabc-4b31-47ca-a4cc-44d33e106a10', 'a01cd4e5-4cbb-48ab-bfde-2b558ab60d88', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('87bd45e9-40ad-4960-845f-01c014d85289', '22fe5dc1-07ab-4809-8f56-8590c68d9ab3', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('87fa811e-83a4-4946-b6eb-a9860088b169', 'a502eb20-d81c-4f3e-a56f-11444fe1e4cb', 'TRX', 0.00000000, 'TSZsQpLG8BSXAtkhRGJzFsXDERTrk3Npia', NULL, 'eyJpdiI6IldvVGc1VjZFNHRsemdsMk9aRnR3bnc9PSIsInZhbHVlIjoiaWMxekpUMTZyZUlEMm1mdUIrR3M1dDQxaU15TzZkS2dQaXMycE9weUNnTGFxUFpEcks3OGhON0d3WmI5ZU5GREhWVmlSWE5aOEdjUjZEdnE5Slk5elEyY0xwNURqV2VoMmVETDlKOVZHNjZsR1YwenJ3bFQ5ODdsR2dlSTZBUTc0dnV0eVdKK2I5eElXYUJiZlNBdHN5bXhXV1U4RE9MZkNKd2hFRDJmbWRNQW5Xc1kvOWxYZXA0VEw4V1pZUWhNIiwibWFjIjoiZjIxODY4Y2FiZjlkNTU2MTVmYmQyMzI5OTUyOTMxN2M1NDYyZDI1NGI0NDZkYzIzOTNlYjQ1YjZiNGRkY2NiNyIsInRhZyI6IiJ9', 'eyJpdiI6IlpIeFhnQUxqNzJVdW1kb3hqaThxb2c9PSIsInZhbHVlIjoiNlVZR05pbHVkM04rTHdvWWs4QVFRQ2Nmd0FWazJhNW5IYStraFAxYmt2RlRrbFJNaC9lQjNFVE9URVltWjI0OWkxQnJLZFNDWjVYQ1RSVmdudS9kYVMzQng5UWZQVEZCZ3BlQnBmSFZPUDQ9IiwibWFjIjoiOTY4ZDExNzljNzcyODQ5YmJhZmNlZWEzNzhlZmVjNmU1NDFkZjU4ZGQ2YmQxODFlNDI0MjJmMWNiYzE5ZWE1MCIsInRhZyI6IiJ9', 0, 1, '2023-05-21 10:23:31', '2023-06-25 16:45:33'),
('88007af4-b27c-4b9a-9161-0912c836ce04', '47dea59c-e88d-4c15-ad52-fa0dc6de1631', 'TRX', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('885a1b9f-c068-4ef4-8312-fddac172bc8b', '62cb835b-6592-459f-a2e4-f6dc5b7ac7f1', 'TRX', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:23:31', '2023-05-21 10:23:31'),
('8875a9a8-c2d9-41db-bf30-8f400a4a0fb5', '86f3c2c9-e4c3-4192-ad1e-d34a6b188833', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-07-18 20:16:27', '2023-07-18 20:16:27'),
('8912d538-fc90-45ea-a49f-5842a5768055', '923956af-60ea-40f0-8065-aac5c4fb3791', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-09-14 11:32:26', '2023-09-14 11:32:26'),
('89bcd1de-efd3-493b-9c5e-5c6f2287ffe4', '6b45b07e-0969-4bae-bd21-fc7e7597ef8d', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('89dd6f6d-370d-447a-8138-bc76d57ee6c8', 'a502eb20-d81c-4f3e-a56f-11444fe1e4cb', 'BTC', 59.99000000, 'TSZsQpLG8BSXAtkhRGJzFsXDERTrk3Npia', NULL, 'eyJpdiI6IkNIdFUrdFh3YStVYkIvYUgzTjJYOUE9PSIsInZhbHVlIjoidmlBT1FnSXpRSDNrVS9ob3ZvejVhVllkeDdocXNmZG0wWGhkSXdDMm9sZVJHRjVKTmlPNlBYMXltUzdoQllDWWc5dXIzUDBTalpIUFhCOWY1OHBFZHVaQUlMbm9NRGFEdWZkeStXcXZjU00zQnM5c2IxeDMrcDdsd1Z1TjRwWjgyOGphYnd5Y2tCcmZGSHZrY3c2YTZ5NEsreXkzdGlydXFZZkwzdkFCeU45dVdxcWUwYTdCcW1GUjdFcnk3SFRxIiwibWFjIjoiYTM5NWZmYTYzYjRjMDYxNGUwMjY4NmFjMTU4OTk1MjI3OWE5ZmNiOTMwNjAzMTg1YjViZTQ3NTUzNDk3ZjczNyIsInRhZyI6IiJ9', 'eyJpdiI6IjhicTFnZVVGZlE5dVJVdnRqS0RnQ0E9PSIsInZhbHVlIjoiWmlNQnR3Tis1czA1ZTh0MnN0a3UzeEoyOC9HR0hBQjF3bXAyMU8rQnVZcmN3ZkdtSEQ1R0ZLVldIaWd4YXM3aGRYTWlxeGVaOUV0SzVEaVFVZTVNd2xKazFRN2lobDE1WEdFNVM0WTlNVEk9IiwibWFjIjoiNDQ0NGRkOGY4MmYzYzgzODYzZWY2MjUyYzdjYzY5MDZhZjczMzBjNmQwZmVkOGJlNTk1Zjg5Mjk1N2E4ZjZiNSIsInRhZyI6IiJ9', 0, 1, '2023-05-21 10:25:43', '2023-08-04 20:21:07'),
('89f3856f-d970-43b9-bafb-333d470b8cad', '5b4cd7b8-8ae3-4a91-a25b-cc785c061b14', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-05 10:54:16', '2023-06-05 10:54:16'),
('8a0ac534-86d8-43be-bb8e-480ee94b1090', 'eeb02b68-6521-4a40-84ad-21a2d21aa440', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('8ac2b3a6-d580-48fb-9d9f-79ff5d23b4f9', 'ecbb1278-fb14-4952-8ef9-fc77aef93d3d', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-08-14 19:22:20', '2023-08-14 19:22:20'),
('8ae65dff-b95e-4040-8631-f79da7991c46', 'da77601a-40e5-4bb1-b584-2b82bd26370f', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-07-18 04:32:54', '2023-07-18 04:32:54'),
('8af5bbf4-1c20-4632-babb-d35a6cfe4557', '6c2de49b-66b3-482d-bf48-8b690f86deff', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('8b161324-0ec5-48d3-9c30-b53931874c18', '6c2de49b-66b3-482d-bf48-8b690f86deff', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('8b3a16e2-771b-42aa-90db-f71920fe13ac', 'fb35867d-1db8-4b6d-9f19-54ab0b2ddab1', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-01 14:17:57', '2023-06-01 14:17:57'),
('8b679b09-db4b-4acf-88dd-09765bc4d08d', 'cb74f45c-280c-42fd-a06e-a4672280c040', 'USDT', 35000.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-07-21 16:30:06', '2023-12-18 16:24:41'),
('8bc65d97-afc9-44d6-b6e1-5c00b670606b', '4737ffad-8afe-4bbe-9c76-9ece9d55068f', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-14 13:49:44', '2023-06-14 13:49:44'),
('8c1fe07d-3cec-4adc-853f-9f7bf1c5c0c8', '6c9d2b9b-812c-4ba7-9bbe-66d940eaa5bb', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:36:02', '2023-05-21 10:36:02'),
('8c4c7e0d-3d26-4ed2-970f-6fa76ad845b3', 'cb74f45c-280c-42fd-a06e-a4672280c040', 'TRX', 2.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-07-21 16:30:06', '2023-07-21 16:30:06'),
('8c601c15-603c-450c-bb54-14c4c492220c', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'USDT', 55913453.26696250, 'TPBLaHbawLTXQMPKSLQjd43gS52YnXykiu', NULL, 'eyJpdiI6InBteVpnVzBRK0FJaXhoaG5nMkpxN2c9PSIsInZhbHVlIjoiOVV2V0tMSTc1V0syU2dMcjRVU2NsaU55RXdNMU9BS0JqZWNJRElkR1NVSjIwWndNaGFhdDRMVkxQc3FBSlpuTStpQ092TGxDRkFka0dBSkpQc0JpelF3cnBNcjIyVnhQTFNRazdtTDhjSUJPQzZyL0ZMWHdHa2lJR2lvUWY5S2JTckFteDFxOVBtTjh1UVZzYjgrTXFLLytsSWFDYUlCcisrTEQxMGc4M3d6U0RpK2pwRFlqS2xiMXhBcmZxRExwIiwibWFjIjoiMWQwYmU4ZWI3MTUxNzNkMDAwNTNmZTAxNGEwZDYwMjZiMWJhNWM1ZDVkMDM0MTA0YTczNmM1MzZhZWVjZGMyNyIsInRhZyI6IiJ9', 'eyJpdiI6Ino1TmxMUXZ5bXZSN1NYOUc0UTVmMVE9PSIsInZhbHVlIjoiQ1ZQWHZuOVJJUjZ5a3BoMUE3NkJKUFpmb1huQ3RGZU95WTBvWnBOeHhueHZweDZmN0l2aGhXbHNGWFJOSUt6S3BkZTArdVczemJaQU5qbXd4OEhtMVIxYzlDbHdZbnFDK2l4SEsvcUpCdVk9IiwibWFjIjoiYTNjMjAxZDkwNmU5NzRiNjhiNTBmNDI0MjIyOWMxZTY4NDE2NTFmOTU2M2U4YTZjMWIwNDhhNTFlZGNiYjExNSIsInRhZyI6IiJ9', 1, 1, '2023-05-21 10:27:23', '2023-05-21 10:27:29'),
('8cca9e88-b0e0-451a-8b0a-a9fbd9b641e4', 'cda51314-c8fb-414d-9f56-fb848e43077a', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('8ce5b808-fb7c-4c67-811b-da7fb8fa6dcd', '8bc2d325-279d-4cb5-8245-87e524f33587', 'TRX', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:23:31', '2023-05-21 10:23:31'),
('8cfa1dd1-0261-406f-aa11-501e70d23635', 'cf37d061-aa9c-460d-9701-66439afc812d', 'TRX', 2.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-13 13:21:15', '2023-06-13 13:21:15');
INSERT INTO `wallets` (`id`, `user_id`, `symbol`, `primary_balance`, `address`, `passphrase`, `public_key`, `private_key`, `is_system_wallet`, `is_active`, `created_at`, `updated_at`) VALUES
('8d0983ec-3fa3-49b0-b250-9f81aa93f07c', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'ETH', 99999998979.99999999, 'TSz8ZGBdd8HpWKSYuu8Hk69UgCDc3ktDGW', NULL, 'eyJpdiI6IjBSUEk4NVRVOEtlNjRQNVMrK3dwR1E9PSIsInZhbHVlIjoiNDFoOVlvUEY4b1cxYy9UY1BYTHl2SFoxK0lSUHE1K1k4ZXJWdVNqeGxzaHI1N0cwSjZIeVlPUDFRNEt1T080RHQzUUo4K1dnekhTQ0pEWVF1VytaYlFoYnFLajRMR3pkaFJPZDFzaUt3c1Y3VVFOeWQ0b28xOGF2OCtOMVBxWGl0M1hBcW9maDJrN3FBRUtpQlVkcDJUNUx1MXV1b0Rxa2x6UzYvdmZ2UUk5dnhwczZ3U0dubFZFVXVoM0ZRNXJmIiwibWFjIjoiYzU3ODE3NGJkZmI1NTg1OWZlZjFiYzliNjJkMjUzNTI5ZDkxZGVmMzNlMjZjNmU5MTFkM2M2MjY2NDdlYWIzZiIsInRhZyI6IiJ9', 'eyJpdiI6IjBHaDdxM25CUDZQRGNDUmdsVDhBQnc9PSIsInZhbHVlIjoiNnhSZ3NKR00ybEJlNHllVFhBWmNXYzRoQkpXRmtZWGkxZy9qRjBEWEtzWEMrNHpDYnZFajdDQkY3bHdSanZ1dEpnaDJ2MWR0a3B3Umd1OHphUE1oUXM0N3pPaUdOL3BLbGFkYURFSkhNeWc9IiwibWFjIjoiZmYwODRlN2MzMTk4OTliMDBhMTNjNDU3MWNhOTMzN2U4MTFlNDgzNGQxNWJjYzU3YmIzYjYzNjM3NzJmMWU0OCIsInRhZyI6IiJ9', 0, 1, '2023-05-21 10:29:14', '2023-12-24 17:43:47'),
('8db27d2c-1591-4a99-ae2b-b8bb8c8e15d1', 'd86b3a4d-3a57-426e-8e1e-95a6be996bb5', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('8e2314bc-7aab-485b-9aab-c4f7a6226292', '3197597e-5470-45e4-afc1-0b2292d2158e', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('8e47164a-c40b-4d9c-bf49-238bd5c133b9', '47eaf168-5901-4ccb-8b9c-d7f9c754ed04', 'USDT', 8000.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-31 10:02:57', '2023-06-14 18:00:21'),
('8ebb082d-6499-448d-9e0e-6bfef428ef0f', 'cf37d061-aa9c-460d-9701-66439afc812d', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-13 13:21:15', '2023-06-13 13:21:15'),
('8eefb298-0dc9-4045-8b86-2c624f071d78', '86f3c2c9-e4c3-4192-ad1e-d34a6b188833', 'USDT', 200.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-07-18 20:16:27', '2023-07-28 21:24:32'),
('8f4e4b3c-4bc5-4291-a28c-64424a6c8607', 'fb35867d-1db8-4b6d-9f19-54ab0b2ddab1', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-01 14:17:57', '2023-06-01 14:17:57'),
('900786ce-ee13-4f34-afb6-69546d96aca3', 'a502eb20-d81c-4f3e-a56f-11444fe1e4cb', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:33:02', '2023-05-21 10:33:02'),
('9011842e-4439-4887-9538-48d440bca670', '34d2fe8e-ad62-4960-ba47-82234f81520b', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('90247d86-a887-407f-a5be-877451d8b5f1', '1ba19fda-1281-47fd-9059-c26571b6edc8', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('9024aad4-3161-49d3-9b67-77a87533bc70', '86f3c2c9-e4c3-4192-ad1e-d34a6b188833', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('90379bb0-c028-433b-ac9e-8790a62652cd', '6dd2b333-abab-4c57-b4f5-d33e4dd70f39', 'BTC', 10000029100.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-08-04 16:40:57', '2023-08-04 16:53:33'),
('91104785-76b0-4b3f-9b11-d5017b2209e4', '9fad722d-6b02-4504-b431-ed6f14b20847', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:33:02', '2023-05-21 10:33:02'),
('914b49d0-1ab4-44ba-a34c-7b28354c7521', 'e7c629dd-0b1e-4094-bc83-6c928f77b357', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-20 15:07:49', '2024-02-20 15:07:49'),
('9170a302-8057-40ef-b665-dabb14bfec26', '6bb43481-d32b-4038-9358-85a962250b5c', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('9181a4e0-68d5-4841-a845-74b189311744', '934ad33c-0304-4461-b0e5-ba8b3ca61ca1', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('91b82b68-7b94-49ce-a2a0-b4f73fc1acff', 'eeb02b68-6521-4a40-84ad-21a2d21aa440', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:29:14', '2023-05-21 10:29:14'),
('9233aba0-1aa5-4638-94f8-d6b65e5bf108', '6eb3595c-031c-4f55-abee-80cf6d8c816b', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('92afcda2-876f-40e9-bba1-e4825ad0df66', 'a01cd4e5-4cbb-48ab-bfde-2b558ab60d88', 'USDT', 8000.00000000, 'TFVkVNTzLc6BvhqgbJiMkTZaJZVfYmQzdv', NULL, 'eyJpdiI6InA1NnFGcDBRRDNjcTFIOW81T2FvUnc9PSIsInZhbHVlIjoiNFB5LzVjK0s0R2tXejd0ZGZudSsySWowWXI3QXVLVzIwRDREZHFCcjNLd2txVTlqVEN1YVA5N2VzRnpCZmZoR1R2d04yVTFuQXNmK1ZBL3pqdld1ay95aWhya3hUdWZncHJHbFhtOHVnbGlkVENjUEo1VzVpN3pLbXM4Z0RKMzV1UDZOQStUMFFvc1hKT2N5b3YwWWNGVlN0UUNkTWxnMTlxcC96NXNldC9ZOU1mMXBFcGNzRDVlNTZIc0lXZXJhIiwibWFjIjoiNDFkN2VkYjIyMzhmYThkMjgxNzc0OTE2ZDQ0NjNlMjdjZDlmNTIzMjQzZjllYjdmNWQ3NTYwMDgzZjQxMTg1ZiIsInRhZyI6IiJ9', 'eyJpdiI6IlRxMytrT29ib3kreFJMOE5iVGN2VlE9PSIsInZhbHVlIjoiVGNqS3hGUGkvY2MyejZ2djRNOUkvL0hxRHFpdVNOcFN1azhodDFVS05OdzZNSTZtNUU4b3hiV1BnL01COCtHM1paMEpkL2dlR2JPbUJ0NDBBNTlIMzZkVUhEdWhLYTNPWUJTL29aYUxmT1U9IiwibWFjIjoiN2YzMDBmNzU2NjZjMzRmNGJhZTdkNmVmZGU2M2VmZGVjZjk1MWY1MTJjN2E5MTkxYzliNzlmZWNlZTgzODUzOSIsInRhZyI6IiJ9', 0, 1, '2023-07-20 08:02:36', '2023-07-20 08:50:42'),
('92b1500b-13a1-449b-8f09-abd71036a5b6', '557a1889-0d7e-4e8c-a314-14e6c4004ee3', 'TRX', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('9306be68-a19d-4c1b-9bd0-f1c55f854a5f', '492e02b7-cab9-42f2-9b42-6a6d373b2e24', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('93468741-85f8-4c0c-a7da-7c48b0ce7825', 'adc69fe5-342e-4db7-83d6-1aa6b50e4217', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:36:02', '2023-05-21 10:36:02'),
('9347ef17-711e-4ffa-8f2f-2d49b24df4bf', '98697609-12a9-4415-a700-07de18f31ba9', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-07-18 08:34:19', '2023-07-18 08:34:19'),
('9356f968-cf4b-4898-a6ad-5ce972de2b84', 'ecbb1278-fb14-4952-8ef9-fc77aef93d3d', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-08-14 19:22:20', '2023-08-14 19:22:20'),
('93ee982e-1669-48ff-836a-fde488f36517', 'eb0d5cb2-a937-4d7e-9e4d-cbd10c9948a3', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:29:14', '2023-05-21 10:29:14'),
('94418e96-679b-437a-982e-cb8123000edd', '933d676a-c435-4697-bdf2-e54d026c156e', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('947727e3-4cb6-4088-85f3-de9e0b551cd8', '467671a6-55bc-4527-ba1f-d0d2b562fca4', 'USDT', 11500.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-06 14:15:45', '2023-06-06 14:17:59'),
('94afce9b-a7e3-43ff-8570-8efd9e7dddd3', 'ea3c376d-8e83-4e18-be5c-25fda612432f', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('94d225c0-5a86-45ce-87d0-40f73b922e7f', 'd7ce0527-5843-4fd4-9253-ec190e726a4a', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('94d68bfa-7b6d-4a73-8809-9ff8424d459d', 'cda51314-c8fb-414d-9f56-fb848e43077a', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('94da310e-d055-429c-be60-58c33d1679ed', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'BTC', 100.98500000, 'TSz8ZGBdd8HpWKSYuu8Hk69UgCDc3ktDGW', NULL, 'eyJpdiI6Im1wVTJyQ0pjZmdOVE1ma0dEQUp0ZHc9PSIsInZhbHVlIjoiZU5UbWYwK0ZsWlNZTVc1T0kwSG53VmFIOVE3c2drZzNSa1RRbkZQckNhQ0F1SFJPNVdzamR2bWpjcW54b1FXajFrTy81YTFZVHM0dDA4MjkvTHVzWENETkNjRXFKTEhjQzk2UUNHVTg1TVBuV29EY3Fha3RsZGozODI5Q1d0b1BQR3pzUGNEN0h2Rnh2YlFoamJOUk1POTJQVFBqL0tRMW1FaFFUYjBpM0JhUm44elMvUGVmUzlUc3hKSEhqRVY3IiwibWFjIjoiY2IxM2U4Mzk5M2FiYzY0NTU0NGM0MDlkMDEzN2JlNTAxNzI3NDI4OGQwMTFjZTVlZTdjZDE5OTllZjUyMjFhNiIsInRhZyI6IiJ9', 'eyJpdiI6InVOcER1aTJTUHhaOVUvR0J2NjlDQ1E9PSIsInZhbHVlIjoiTW94aGtFOElwZkpLZlNVUVhxYTNTQWo2M0R1RnhlQTBsSnM1K0JsbWJaTUVKdlJjM2VmcVN5cGlPdWtLc0R2bXp2Ym9nWElpRVVLcnNHR3JpOGgwRHhTKzIxWjIzMVRJUjljdXVqeEpTRmc9IiwibWFjIjoiZDVmZGMyM2JmMjg1MDcxMGFmNzUyYzU4Njk1Y2Q2MmYzZDAwMzQ5MTQ4MGQ5YzlmNTdkNzI1YjY4Yzk2MzczYyIsInRhZyI6IiJ9', 0, 1, '2023-05-21 10:25:43', '2024-04-09 10:44:51'),
('95106f29-4ab5-4f84-9810-76601bedf7a6', '3197597e-5470-45e4-afc1-0b2292d2158e', 'TRX', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('955e95f0-d894-47c1-b824-81325769ec97', '07b97174-b6d2-48b5-a9a2-f8c1443eaf3e', 'TRX', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 11:06:15', '2024-02-19 11:06:15'),
('95941a0c-32a9-46a6-8f5f-8622c5fc4231', 'c034dc12-2661-4cd4-b118-febdc33c27e6', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('95ddb1e3-6924-4134-bb83-24f4770ad433', 'e7c629dd-0b1e-4094-bc83-6c928f77b357', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-20 15:07:49', '2024-02-20 15:07:49'),
('962cdf00-b2fb-4191-a580-a8b0e8590774', '675d5181-9662-4d5a-8e29-924e2b58b24f', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-07-25 15:39:19', '2023-07-25 15:39:19'),
('97322777-a1f5-4bc7-ac4f-5f22ca1e0e6d', '675d5181-9662-4d5a-8e29-924e2b58b24f', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-07-25 15:39:19', '2023-07-25 15:39:19'),
('974c3c57-f187-44a5-a6f1-af6d2d0bced5', 'e7c629dd-0b1e-4094-bc83-6c928f77b357', 'USDT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-20 15:07:49', '2024-02-20 15:07:49'),
('9772c7b9-7257-42fb-a964-eb4fd122f4f8', 'abe08840-cedb-437d-9054-f6ca53045f5d', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('97e5483d-0f01-4b8a-afe3-ee07feee2fdb', '22fe5dc1-07ab-4809-8f56-8590c68d9ab3', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:36:02', '2023-05-21 10:36:02'),
('984f3a3a-bb97-4cf4-8048-b03d26dbcdaa', '44d4809d-28e1-4685-b15c-dc11134fdf1d', 'USDT', 180521.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-07-20 09:58:46', '2023-12-06 15:43:34'),
('98ad60ef-c2b7-4779-9579-6743d223ecb7', 'eeb02b68-6521-4a40-84ad-21a2d21aa440', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:36:02', '2023-05-21 10:36:02'),
('98d9604a-e689-4d51-ab65-ba7a68b07978', '60145862-0641-4106-af67-8de47b916abe', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-05 09:54:36', '2023-06-05 09:54:36'),
('9a3b5e00-c3e0-4723-9916-87490f730561', 'fd1358e0-095d-4123-8649-e56751a08017', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 10:12:17', '2024-02-19 10:12:17'),
('9a8ebc5a-c591-4216-9627-0cc0742ad4fc', '3197597e-5470-45e4-afc1-0b2292d2158e', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('9aaf2c05-4693-497e-9f52-7dad6a254eb0', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('9b16d442-c938-4597-b3f3-53fe70d8bed5', 'ff837428-0711-4c3c-91a6-dd44e69ca5e7', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('9b7efc97-c147-453e-bfb0-0f98ceb5db9d', '01bac2f0-2e3c-4116-a7fb-61c4d149a2e6', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-12 10:22:18', '2023-06-12 10:22:18'),
('9bea3cef-b81e-4fe0-84b5-22bca2d4ecc1', 'd2b09976-3be3-43e8-81ef-d0dd81784cdf', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('9c0dbb68-ad47-4c8a-b7a7-e008499dae5f', '47eaf168-5901-4ccb-8b9c-d7f9c754ed04', 'BTC', 44767.50000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-31 10:02:57', '2023-06-14 18:00:21'),
('9c1e8bf8-90f5-476b-9d44-b65c31577d66', 'abe08840-cedb-437d-9054-f6ca53045f5d', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('9c40e2b0-61c1-4ba0-bc3c-0228d2f845a2', '98697609-12a9-4415-a700-07de18f31ba9', 'USDT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-07-18 08:34:19', '2023-07-18 08:34:19'),
('9c46c4aa-6dd7-4347-8f40-3be3a613f68c', '62cb835b-6592-459f-a2e4-f6dc5b7ac7f1', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:33:02', '2023-05-21 10:33:02'),
('9c87cac3-1804-496c-a95e-2a1fc63eec16', '47dea59c-e88d-4c15-ad52-fa0dc6de1631', 'USDT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('9ca58080-2f80-49c0-8d09-4bbb527cc66a', '6bb43481-d32b-4038-9358-85a962250b5c', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:25:43', '2023-05-21 10:25:43'),
('9cd65711-e251-4d73-8ceb-9f97ffbdf601', '57cfdde8-b3bb-4020-bd29-83cc9575bdcf', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-14 18:00:20', '2023-06-14 18:00:20'),
('9ce7db21-29e8-4eb4-b4e9-060ab835e8d7', '98697609-12a9-4415-a700-07de18f31ba9', 'TRX', 2.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-07-18 08:34:19', '2023-07-18 08:34:19'),
('9d8632ac-309a-4877-b005-45373fbf1045', '933d676a-c435-4697-bdf2-e54d026c156e', 'TRX', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:23:31', '2023-05-21 10:23:31'),
('9d999d5f-564d-40db-b0d5-d9e3b18d254c', '7b621b7c-6760-4430-9a30-10d8134b442e', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('9dbfc5b8-c8ca-4f56-a654-c2438b9882e5', '48073e55-f172-4b10-b11b-7203b2b5dbd1', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('9e467442-2027-456c-be5e-c896edda985d', '47dea59c-e88d-4c15-ad52-fa0dc6de1631', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('9f2d6fbb-c74a-4c23-86c1-be769cc9ed2a', 'fd1358e0-095d-4123-8649-e56751a08017', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 10:12:17', '2024-02-19 10:12:17'),
('9f89a2e9-56f9-49b9-82b0-d0c1003f7498', 'cf37d061-aa9c-460d-9701-66439afc812d', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-13 13:21:15', '2023-06-13 13:21:15'),
('9f8a2271-7d45-407b-a3f7-dc76c0d2bd88', '2446118a-33ae-4cb4-8ca9-4e1c8dd68f4f', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('9fe63db3-032f-4177-87da-2b2e6e39b980', 'kocoina8-bbd6-4f8b-9fbf-48711485ab8d', 'TRX', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:23:31', '2023-05-21 10:23:31'),
('a028b692-2a0e-44a4-af18-893d9609924a', '47eaf168-5901-4ccb-8b9c-d7f9c754ed04', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-31 10:02:57', '2023-05-31 10:02:57'),
('a02da14e-66ed-4b14-80de-c72d87729819', '6800875b-c059-49a2-aec7-8612c7d402a1', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-09-09 22:04:27', '2023-09-09 22:04:27'),
('a04cacb7-6672-4e6c-8f35-4925e6e1cd2d', 'e7862d9c-fba8-4509-b59b-a4cb4f71ba04', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-07-25 05:19:47', '2023-07-25 05:19:47'),
('a1220731-cbd1-47d4-84e2-0608ee9b2a5c', '6eb3595c-031c-4f55-abee-80cf6d8c816b', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:33:02', '2023-05-21 10:33:02'),
('a209dc66-9204-4faa-9f90-086d1f16d4ca', '34d2fe8e-ad62-4960-ba47-82234f81520b', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('a239a775-ba98-48be-862d-cf2fa778b50a', 'eeb02b68-6521-4a40-84ad-21a2d21aa440', 'USDT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:27:23', '2023-05-21 10:27:23'),
('a26c7e0a-7f6a-4c80-8a01-8b3d3ed076c8', 'd2b09976-3be3-43e8-81ef-d0dd81784cdf', 'TRX', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-07-26 10:01:28', '2023-11-23 00:12:34'),
('a4100818-0372-4ca4-a70b-e90c59e37d3d', '492e02b7-cab9-42f2-9b42-6a6d373b2e24', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('a446c4d0-612f-43b6-b3c1-0e503648430a', '7109c567-63f7-4d17-a2d5-a518e560408e', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-08-03 17:57:26', '2023-08-03 17:57:26'),
('a4741ba6-7ad6-4e97-b695-c49dda74dc42', '6f1ba6d2-22bf-4291-977d-534ac1aff4d8', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('a488ccea-1a57-4562-bbfa-8ff153815b70', 'cb74f45c-280c-42fd-a06e-a4672280c040', 'BTC', 1200.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-07-21 16:30:06', '2023-12-18 16:03:16'),
('a4e8da03-d705-41a3-aed4-ad9b80c57615', '933d676a-c435-4697-bdf2-e54d026c156e', 'USDT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:27:23', '2023-05-21 10:27:23'),
('a56d45f3-8ac7-481d-8eff-89d8ff97dfd9', '44d4809d-28e1-4685-b15c-dc11134fdf1d', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('a57dd431-e347-4952-bdef-ebe16788fcce', 'd72e5177-9169-4d3b-a805-aa9a45da9c32', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('a599ae14-bdfd-4eec-b7b2-710c90b7e2c6', '625c7cbe-2e20-406b-911b-a8ae59dfe2fe', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('a6b1ef08-c87c-42c7-aebd-e128d65dbb1a', '8bc2d325-279d-4cb5-8245-87e524f33587', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('a6e16dcc-262d-404b-b8ca-767536cd4efe', 'c275436b-9379-4114-9770-9e6d376488cd', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:31:50', '2023-05-21 10:31:50'),
('a701362e-d591-45eb-ac8d-440f3a93cafc', '47eaf168-5901-4ccb-8b9c-d7f9c754ed04', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-31 10:02:57', '2023-05-31 10:02:57'),
('a7501efe-18bd-40b9-90c6-007507528e0f', '675d5181-9662-4d5a-8e29-924e2b58b24f', 'USDT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-07-25 15:39:19', '2023-07-25 17:57:52'),
('a754c87e-c2ed-44c8-a9ca-afa9a13125b5', '07b97174-b6d2-48b5-a9a2-f8c1443eaf3e', 'USDT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 11:06:15', '2024-02-19 11:06:15'),
('a793db74-64cd-4fa5-afa4-5c786362d460', '6c9d2b9b-812c-4ba7-9bbe-66d940eaa5bb', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:25:43', '2023-05-21 10:25:43'),
('a7cb46bb-c777-45ad-beca-ed06b9492ead', '09ae0ce6-3b8a-4a8a-ac2f-3919888e47aa', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:25:43', '2023-05-21 10:25:43'),
('a7dfda95-1a12-4115-b87d-cb5742f0c94a', 'da77601a-40e5-4bb1-b584-2b82bd26370f', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-07-18 04:32:54', '2023-07-18 04:32:54'),
('a8285bbb-d1da-47b0-ac01-f34deaf1d7db', '5e5189aa-f3b7-4e90-ab71-48eb3d97bf08', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:36:02', '2023-05-21 10:36:02'),
('a82c0c6b-de7c-47e3-a82a-3aa6f7346877', '8bc2d325-279d-4cb5-8245-87e524f33587', 'USDT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:27:23', '2023-05-21 10:27:23'),
('a9164011-d448-4efb-82f2-afe024597f6f', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'TRX', 3999998757.00000000, 'TRASdtLsUGasVvjzBsbKnuigL1MV87cjWh', NULL, NULL, NULL, 0, 1, '2023-05-21 10:23:31', '2024-01-31 05:05:00'),
('a9323620-d9e3-4b49-8a75-7898606914a3', 'd72e5177-9169-4d3b-a805-aa9a45da9c32', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-05 09:35:46', '2023-06-05 09:35:46'),
('a95c3cab-d540-4037-9c0e-02b5633cc6ab', '933d676a-c435-4697-bdf2-e54d026c156e', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:29:14', '2023-05-21 10:29:14'),
('a9a54483-4545-4a83-bff7-efb1c76d2d58', 'cdc7f9c6-150b-4b90-bc4a-8ce2f71f5c83', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('a9bd85ab-72dd-4f2b-9b7e-bfd11f3df640', 'ee485282-d5d5-415c-8946-16fa57fd8f79', 'USDT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('aa1a1867-cc79-4bd5-a64a-3af7f279ff63', 'cda51314-c8fb-414d-9f56-fb848e43077a', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('aa232f75-25f0-4ba5-9649-6ffe6fd429cb', '8bc2d325-279d-4cb5-8245-87e524f33587', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('ab060bde-db8d-439f-93ee-bcbf45b0a41b', '60145862-0641-4106-af67-8de47b916abe', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-05 09:54:36', '2023-06-05 09:54:36'),
('ab35fa0f-b757-4ed9-959f-1c8a63afd415', 'ea3c376d-8e83-4e18-be5c-25fda612432f', 'TRX', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:23:31', '2023-05-21 10:23:31'),
('ab388bc6-57e0-4ee8-8c32-cbb183ec708a', 'db5d841b-d90a-4437-957a-c7fb5fa86319', 'BTC', 99999999999.99999999, NULL, NULL, NULL, NULL, 0, 1, '2023-05-25 12:50:06', '2023-05-28 09:00:40'),
('ab816eff-9c33-4766-a9d7-f9f66cf32dba', '3b4df004-bb15-4c73-b23e-f7d614f64b8e', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('abbcbd6d-57d8-4436-b026-659cf05318ae', '7109c567-63f7-4d17-a2d5-a518e560408e', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-08-03 17:57:26', '2023-08-03 17:57:26'),
('abe73536-d215-4dac-b89c-990a77236a4d', 'cb74f45c-280c-42fd-a06e-a4672280c040', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('ac4aeddf-6a71-4af8-b9e9-0f70d7333baf', '557a1889-0d7e-4e8c-a314-14e6c4004ee3', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('ac6c0b5a-de9c-49ef-860b-2b7a1626017f', '44d4809d-28e1-4685-b15c-dc11134fdf1d', 'BTC', 2000.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-07-20 09:58:46', '2023-12-16 11:44:28'),
('ac882f1f-4350-4911-a3f1-2a3fda6fa7be', '47dea59c-e88d-4c15-ad52-fa0dc6de1631', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('ac9779fb-beb8-4c2b-bf57-f7ef15541c07', '467671a6-55bc-4527-ba1f-d0d2b562fca4', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-06 14:15:45', '2023-06-06 14:15:45'),
('ad1d11c1-14e1-404b-b36d-4bba257096f3', '6cd1a9e7-a910-43c8-a930-95dcb2c8edca', 'USDT', 200.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-08-07 18:13:48', '2023-08-07 18:14:36'),
('ad1d3123-0e4a-4fbe-8147-f00d5798ff9b', '1ba19fda-1281-47fd-9059-c26571b6edc8', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-01 21:53:47', '2024-02-01 21:53:47'),
('ad438346-551c-49b9-9fbf-160797736673', '34d2fe8e-ad62-4960-ba47-82234f81520b', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('ad594080-7237-400e-8f19-2d6ab8d9bda5', '557a1889-0d7e-4e8c-a314-14e6c4004ee3', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('ad92a015-fbdf-4ee6-8bf0-beb491a103d6', '933d676a-c435-4697-bdf2-e54d026c156e', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('ae132485-05bd-402d-ac43-2d395fd97b67', 'ea3c376d-8e83-4e18-be5c-25fda612432f', 'USDT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:27:23', '2023-05-21 10:27:23'),
('af229e07-79d5-4cab-8139-c061c303afe4', '6c2de49b-66b3-482d-bf48-8b690f86deff', 'USDT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('af530802-7611-4dd2-b704-83ac5a3abab0', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 1, 1, '2023-05-21 10:33:02', '2023-05-21 10:33:02'),
('afc243b4-08be-428f-80bb-b037f16a760e', '923956af-60ea-40f0-8065-aac5c4fb3791', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-09-14 11:32:26', '2023-09-14 11:32:26'),
('afe12c22-5223-4e35-b342-d611b814d12c', 'c275436b-9379-4114-9770-9e6d376488cd', 'TRX', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:23:31', '2023-05-21 10:23:31'),
('b03fd8ed-d6df-4ded-95f1-605b98e2d8a3', '2ad4f58d-4cf4-446a-b767-e840add77549', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('b0f3603b-3c94-46b8-af4f-8abff9907ee9', '01bac2f0-2e3c-4116-a7fb-61c4d149a2e6', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('b1c0f4f7-0ab4-40f3-b72e-2fe0b963f1ab', '09ae0ce6-3b8a-4a8a-ac2f-3919888e47aa', 'USDT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:27:23', '2023-05-21 10:27:23'),
('b219629f-060f-49ba-b129-c241d80d853e', '52523c96-98e6-4e75-a1d8-e3cf094993a1', 'TRX', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-08-20 08:45:28', '2023-11-14 10:01:50'),
('b21dd105-c7ed-4482-8dd5-c2946e4145ae', '9fad722d-6b02-4504-b431-ed6f14b20847', 'USDT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:27:23', '2023-05-21 10:27:23'),
('b2371d73-c5bb-4c08-b4d4-80bcc43b0720', 'cb74f45c-280c-42fd-a06e-a4672280c040', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-07-21 16:30:06', '2023-07-21 16:30:06'),
('b27c1a47-3ccf-47f2-83ad-5630541c09fb', 'c275436b-9379-4114-9770-9e6d376488cd', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('b2c68aad-ca87-4508-b1c8-920fdfd6e2b6', '44d4809d-28e1-4685-b15c-dc11134fdf1d', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-07-20 09:58:46', '2023-07-20 09:58:46'),
('b2d87f66-c552-4f96-aa1b-ae3772f0194e', 'ee485282-d5d5-415c-8946-16fa57fd8f79', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('b3857003-adfb-4199-9aaf-a30a68ede184', 'da77601a-40e5-4bb1-b584-2b82bd26370f', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('b3b49668-31bb-4ce3-9b3b-4badbd21c41c', 'dff7716d-646f-48ee-8d87-a1f8461230d9', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:33:02', '2023-05-21 10:33:02'),
('b3c32b15-acbc-4624-8900-35c2f1848b8b', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:29:14', '2023-05-21 10:29:14'),
('b3ed86f7-e939-473c-acfa-4fa375c37792', '60145862-0641-4106-af67-8de47b916abe', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('b3ef3da3-ab85-41ca-8a03-42a6fbf31737', '36f5887f-2b9b-4144-879c-9be2cff7e466', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-13 01:18:02', '2023-06-13 01:18:02'),
('b4352197-fbe6-4a95-92b9-22c706e0dc36', '98697609-12a9-4415-a700-07de18f31ba9', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-07-18 08:34:19', '2023-07-18 08:34:19'),
('b4b47d12-ad97-4771-9e73-07c237544503', 'kocoina8-bbd6-4f8b-9fbf-48711485ab8d', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('b52fefbb-3942-4552-bb5c-7cd2388b609c', 'kocoina8-bbd6-4f8b-9fbf-48711485ab8d', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:25:43', '2023-05-21 10:25:43'),
('b5d64025-2d70-4380-90f5-a6bead656dc5', '86f3c2c9-e4c3-4192-ad1e-d34a6b188833', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-07-18 20:16:27', '2023-07-18 20:16:27'),
('b5d8c8b1-d0d7-4d96-a512-1a98f0d15bf6', '89e4087c-1287-47c9-b101-f87da3cd0acb', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('b5f2be9b-fef9-405b-baad-a53cea5aaa8b', 'cf37d061-aa9c-460d-9701-66439afc812d', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-13 13:21:15', '2023-06-13 13:21:15'),
('b67d7049-b07c-4db0-9c90-6bcc2a83f725', '6eb3595c-031c-4f55-abee-80cf6d8c816b', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:31:50', '2023-05-21 10:31:50'),
('b77c4314-9aa7-4c97-889d-a0bf0cb1dd8d', '923956af-60ea-40f0-8065-aac5c4fb3791', 'TRX', 2.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-09-14 11:32:26', '2023-09-14 11:32:26'),
('b7941b0c-9d52-48c0-b93e-5826f85dacf1', '625c7cbe-2e20-406b-911b-a8ae59dfe2fe', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('b7d169c7-f511-4dd7-9597-1470bb257b16', '22fe5dc1-07ab-4809-8f56-8590c68d9ab3', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('b807598f-bbe4-4faf-85cb-0ca0eb0c806b', '1ac9db2f-613b-4351-ba36-aa8a8e502079', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-02 16:36:16', '2023-06-02 16:36:16'),
('b877ebb4-b0fd-46a9-8e7a-71d0cb9fbe1f', 'cda51314-c8fb-414d-9f56-fb848e43077a', 'USDT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('b8edcf49-7f61-4cc4-941a-82f421fd391b', '5a03c1e3-f18c-41da-b6c6-d372ca6ade8c', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('b9245434-c511-4ae6-ab10-be4757615ff6', 'e18c768d-25b2-4d22-bf2c-1a9115c7ec71', 'USDT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:27:23', '2023-05-21 10:27:23'),
('b95e3380-947f-4332-b76b-68d9463ee89c', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', 'USDT', 11744836578.41761955, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:27:23', '2023-05-21 10:27:23'),
('ba29fdf8-b540-49f2-8650-a5ffcca5d562', 'ea3c376d-8e83-4e18-be5c-25fda612432f', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:25:43', '2023-05-21 10:25:43'),
('ba4e800e-6fe9-4eec-b6af-c2acf7e1f63d', 'cda51314-c8fb-414d-9f56-fb848e43077a', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('bb97757d-0924-43e9-a6a1-672d62a92039', 'da77601a-40e5-4bb1-b584-2b82bd26370f', 'USDT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-07-18 04:32:54', '2023-07-18 04:32:54'),
('bbafd468-e0cb-46a0-aa0a-ec2f2c676d6e', '6800875b-c059-49a2-aec7-8612c7d402a1', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('bbcdf168-854d-4111-b37a-29fe51d35798', '6dd2b333-abab-4c57-b4f5-d33e4dd70f39', 'USDT', 200.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-08-04 16:40:57', '2023-08-04 16:41:52'),
('bbde499f-3dfa-4b25-8ffa-3c79df482b3d', 'eeb02b68-6521-4a40-84ad-21a2d21aa440', 'TRX', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:23:31', '2023-05-21 10:23:31'),
('bbf78321-fa94-472c-a6d9-9b939ac654db', '01bac2f0-2e3c-4116-a7fb-61c4d149a2e6', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-12 10:22:18', '2023-06-12 10:22:18'),
('bc0b0f4a-3169-495b-836c-30c8265ce32a', 'b9ec7d63-015c-4814-b253-eb1d45eae4dd', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-07 13:12:27', '2023-06-07 13:12:27'),
('bc0b9b3f-1cc9-41c9-ab18-68186480e993', '32769d8c-4dca-40d5-83ec-99b68df4b130', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:31:50', '2023-05-21 10:31:50'),
('bc3c2275-405e-42e6-a3dd-62b9fab90616', 'db5d841b-d90a-4437-957a-c7fb5fa86319', 'ETH', 99999999999.99999999, NULL, NULL, NULL, NULL, 0, 1, '2023-05-25 12:50:06', '2023-05-28 08:58:45'),
('bcaf32c0-d8d9-4693-bf38-ade1e6178db5', '557a1889-0d7e-4e8c-a314-14e6c4004ee3', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('bcd0ebd9-8168-4ac1-b53c-26f5acae2f66', '6bb43481-d32b-4038-9358-85a962250b5c', 'USDT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:27:23', '2023-05-21 10:27:23'),
('bcf0ac60-aa27-459e-8f08-b86de73efa8f', 'a01cd4e5-4cbb-48ab-bfde-2b558ab60d88', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-07-20 08:02:36', '2023-07-20 08:02:36'),
('bd502782-c864-44a4-a065-7cfec46a3861', 'e7c629dd-0b1e-4094-bc83-6c928f77b357', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-20 15:07:49', '2024-02-20 15:07:49'),
('bdea2b85-b027-46fb-9cd5-de4c94f293c8', '52523c96-98e6-4e75-a1d8-e3cf094993a1', 'USDT', 25000.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-08-20 08:45:28', '2023-11-14 10:02:17'),
('be294345-be2f-4ac3-ab01-9271f47ec0a6', '01bac2f0-2e3c-4116-a7fb-61c4d149a2e6', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('be6fd108-a213-4e95-9c5b-860ca1316473', '7109c567-63f7-4d17-a2d5-a518e560408e', 'TRX', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-08-03 17:57:26', '2023-08-03 17:59:48'),
('beaaebd7-6921-4f28-a7d9-f19243439ce8', 'f978562a-6102-47ef-b44c-00962596e9e4', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('beac4749-a0cd-4102-9151-bf27b96b7766', '89e4087c-1287-47c9-b101-f87da3cd0acb', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('bee33066-f30f-4a70-b32e-36962d88b5da', '5a03c1e3-f18c-41da-b6c6-d372ca6ade8c', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:25:43', '2023-05-21 10:25:43'),
('bf6ea861-964b-4b6b-b1f4-49339c2efc15', 'd7ce0527-5843-4fd4-9253-ec190e726a4a', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('bfc14683-b35e-43a9-900a-e6062f29ac33', '07b97174-b6d2-48b5-a9a2-f8c1443eaf3e', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 11:06:15', '2024-02-19 11:06:15'),
('bfd388ea-8478-4147-80f0-a8c44007477d', '2ad4f58d-4cf4-446a-b767-e840add77549', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:33:02', '2023-05-21 10:33:02'),
('c00cf0f5-f357-4ed8-bce1-8caa41d64130', '8bc2d325-279d-4cb5-8245-87e524f33587', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:29:14', '2023-05-21 10:29:14'),
('c02306b1-e173-481d-a60a-805491c5eec3', '7cde25b7-e520-4fb3-85df-f5fcf89305d3', 'TRX', 2.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-09 13:43:35', '2023-06-09 13:43:35'),
('c03b0190-eae9-4559-ac9f-5ab08151927c', 'ff837428-0711-4c3c-91a6-dd44e69ca5e7', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('c03e1bc2-744a-48cb-84a0-28eba77d256c', '47dea59c-e88d-4c15-ad52-fa0dc6de1631', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('c0561a59-0376-40ff-87e0-eeb25f05e9b7', 'adc69fe5-342e-4db7-83d6-1aa6b50e4217', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:29:14', '2023-05-21 10:29:14'),
('c0589b53-7c3e-42b8-aed0-ca21d078b4ad', 'd6ac746d-90e7-4a93-981d-5602b6324d4f', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('c06bd11a-2f1a-4ccd-a397-5ebf8a86f4a4', '04b781e1-0a41-4703-888f-468243ebda36', 'TRX', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:23:31', '2023-05-21 10:23:31'),
('c09de434-56fd-4763-863e-42eae6bdefe5', '96f24f53-91db-4ab4-80ae-589139774970', 'USDT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('c1434cf4-48b5-481e-ac19-2828e9757981', '57cfdde8-b3bb-4020-bd29-83cc9575bdcf', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-14 18:00:20', '2023-06-14 18:00:20'),
('c1d1a8bd-4863-4521-9e38-c64bfb4bf329', 'd6ac746d-90e7-4a93-981d-5602b6324d4f', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('c1e38736-540a-4c88-91cf-5e62c8683bc6', '467671a6-55bc-4527-ba1f-d0d2b562fca4', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('c2a0297d-c34c-4f6d-bf16-cbef2531d313', '5b4cd7b8-8ae3-4a91-a25b-cc785c061b14', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-05 10:54:16', '2023-06-05 10:54:16'),
('c2d94d0c-8eae-4c63-ac1a-a9ce55eda0a2', '48073e55-f172-4b10-b11b-7203b2b5dbd1', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('c310ccd4-a862-4055-9e9d-fbb6e3f310ac', 'cdc7f9c6-150b-4b90-bc4a-8ce2f71f5c83', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-14 18:00:21', '2023-06-14 18:00:21'),
('c37000fa-52dc-40e6-b08b-04ec602c574e', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'ETH', 0.30000000, 'TPBLaHbawLTXQMPKSLQjd43gS52YnXykiu', NULL, 'eyJpdiI6Ik11aUZLTlJmNURGVnJsRk5kc2pEa1E9PSIsInZhbHVlIjoiUHNXUU9lcjk5Mzc2aEtPMEZKZ3dhZWVWelNYV1dqaUpNUk81bDB0TXpVbk5kRnMxeTB3bVRxbFRGT1R0MlpORWpQckxqVVBHM0xmbEQ3R0NmZFAyVStLWktqbkVSOG0rVWpWRmlrTVRIRFRNcmYyOVNvZnpTdFJIaUxlUW1CaDM2Z3JxQ2RuR29PZVJLL3RiZnlRSnBWbGNvWS82b0svdHVoaG9NbFR5NXpFQXNLZUZmcVNjK0ovMklQNmdSSXRGIiwibWFjIjoiNDZjNDVlOTMwMTA3ZmM2OGE5YTMzYjJiMTIwODhiNWQ4MDRmY2NmZjU0OGUyZDlmMmY5OTE5YmE3OTA4Y2FmNSIsInRhZyI6IiJ9', 'eyJpdiI6Im04MXFiRWMwV0lyTmpLMWk2ZG4rZlE9PSIsInZhbHVlIjoiTEcraThqT0c0N2o3TFhQbEl2U0p1K1BYNzVjd0hMME9vV2NsSFBTamdtTEx1RmdwSDA2VkZBSS9MWktvRVRQRkFCcVZLQWhxTDk4Rkp6RHFNWUZ4c0RRZTcvdWNQenZLVGhrVUxwQkIvQzg9IiwibWFjIjoiM2JmNTk3Y2ZkZjI5N2U3NWRmYTA0MGVmNTZmNTdkNTAwYmZiOWVmMTE4ZjY4NWFkZDM3MGIzZTVlMmQ2MWJiYSIsInRhZyI6IiJ9', 1, 1, '2023-05-21 10:29:14', '2023-12-24 17:43:47'),
('c4d1a61a-8802-4c4e-a016-a8a4e26c2801', 'd7ce0527-5843-4fd4-9253-ec190e726a4a', 'USDT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('c5147166-4ba2-4cc3-a975-90eeb61ef344', '6cd1a9e7-a910-43c8-a930-95dcb2c8edca', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('c5255216-e8d1-48aa-9bae-5d7257fa0bd9', '8bc2d325-279d-4cb5-8245-87e524f33587', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:25:43', '2023-05-21 10:25:43'),
('c54c9192-5634-4bc4-a851-32f553486f29', 'eb0d5cb2-a937-4d7e-9e4d-cbd10c9948a3', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('c57baee2-7a33-46f7-8a14-41f2e70df233', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'USD', 9999989.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:33:02', '2023-08-24 06:28:16'),
('c5cca858-24bb-4c50-a4ed-0e08566d37b6', '6eb3595c-031c-4f55-abee-80cf6d8c816b', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('c61dc422-3d4c-42b7-b84d-6a23f03d82c3', 'eb0d5cb2-a937-4d7e-9e4d-cbd10c9948a3', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:25:43', '2023-05-21 10:25:43'),
('c6343237-d1b2-462a-85e6-8203aeddd340', '32769d8c-4dca-40d5-83ec-99b68df4b130', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:29:14', '2023-05-21 10:29:14'),
('c66227cf-7f20-489a-b0a5-fc4f0a259d24', 'e18c768d-25b2-4d22-bf2c-1a9115c7ec71', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('c69b07ae-1e16-4a50-91fd-4f69a316a957', 'kocoina8-bbd6-4f8b-9fbf-48711485ab8d', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:29:14', '2023-05-21 10:29:14'),
('c6fec430-d041-4b9e-a7e6-eced2da98de8', '625c7cbe-2e20-406b-911b-a8ae59dfe2fe', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('c7127bc7-ab62-4f0b-8fdb-b4b982864985', '8208d769-48db-4e2f-8831-f48ead232203', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:31:50', '2023-05-21 10:31:50'),
('c72d2eb9-a835-41a9-845d-ee1406293df3', '5e5189aa-f3b7-4e90-ab71-48eb3d97bf08', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:33:02', '2023-05-21 10:33:02'),
('c7a15d2b-93d3-4490-a96b-96febcf2488e', '36f5887f-2b9b-4144-879c-9be2cff7e466', 'TRX', 2.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-13 01:18:02', '2023-06-13 01:18:02'),
('c7a98b51-10eb-40d2-a986-2f65c90de737', 'e5720c7b-8502-4a3a-9ee9-8896436a41d4', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-07-18 20:08:23', '2023-07-18 20:08:23'),
('c7aac327-d037-45eb-8703-b97bf954cd7e', '1ba19fda-1281-47fd-9059-c26571b6edc8', 'TRX', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-01 21:53:47', '2024-02-01 21:53:47'),
('c89d4ccd-041a-40ba-bc5a-d30392547c0c', '09ae0ce6-3b8a-4a8a-ac2f-3919888e47aa', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('c89e14aa-782a-48a4-b071-46b49a8a9f27', 'da77601a-40e5-4bb1-b584-2b82bd26370f', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-07-18 04:32:54', '2023-07-18 04:32:54'),
('c8f08e62-e290-428e-b33b-bb8907352f98', 'abe08840-cedb-437d-9054-f6ca53045f5d', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('c9297b7e-c644-41bf-b498-f70b22cccb51', '6c9d2b9b-812c-4ba7-9bbe-66d940eaa5bb', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('c944516c-d166-4a9d-84cf-d45d6a1a5a84', '7db45872-7279-474d-aa0d-d56723822162', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('c99745a3-e75a-4d72-a9b9-711ad428a0d6', 'dff7716d-646f-48ee-8d87-a1f8461230d9', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:36:02', '2023-05-21 10:36:02'),
('c9c27e6c-e5ab-411e-a3ed-a68d1548b068', '9e207066-ad6c-4c73-b26a-22142f5d6eec', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('ca0b7f76-0ba4-4087-a917-65d17e6f3f32', 'c034dc12-2661-4cd4-b118-febdc33c27e6', 'TRX', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('cac2ab77-7483-41f3-8377-315419aa6762', '89e4087c-1287-47c9-b101-f87da3cd0acb', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('cac8a358-8a9e-4cc0-8cc0-ceccec8c1eea', '6c9d2b9b-812c-4ba7-9bbe-66d940eaa5bb', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:33:02', '2023-05-21 10:33:02'),
('caf863d4-e582-45bb-a908-e7172f58bdfa', 'a01cd4e5-4cbb-48ab-bfde-2b558ab60d88', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-07-20 08:02:36', '2023-07-20 08:02:36'),
('cb34e0c0-c127-42fa-8486-fc304d9ef0a7', '5e5189aa-f3b7-4e90-ab71-48eb3d97bf08', 'USDT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:27:23', '2023-05-21 10:27:23'),
('cb685dac-fb4b-4332-be17-7ba9199a8e6f', 'ecbb1278-fb14-4952-8ef9-fc77aef93d3d', 'TRX', 2.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-08-14 19:22:20', '2023-08-14 19:22:20'),
('cbb0fb3e-58a3-4a30-b971-d6098c39ccbf', 'd6ac746d-90e7-4a93-981d-5602b6324d4f', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('cc047bb6-f19f-4f51-8424-24a32151f612', 'b9ec7d63-015c-4814-b253-eb1d45eae4dd', 'USDT', 150000.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-07 13:12:27', '2023-10-11 17:00:29'),
('cc3d6369-d8a5-4538-b8cb-faf2bc447d1a', 'ecbb1278-fb14-4952-8ef9-fc77aef93d3d', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-08-14 19:22:20', '2023-08-14 19:22:20'),
('cc871614-3160-49db-abac-1373845380ca', '62cb835b-6592-459f-a2e4-f6dc5b7ac7f1', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('ccb4d2e2-bb45-4b61-b097-9175e7ee4953', 'fb35867d-1db8-4b6d-9f19-54ab0b2ddab1', 'TRX', 2.00000000, 'TVeqBqbW3XDUM5RY3oWfrMqzj8wxsmvs92', NULL, 'eyJpdiI6IlRlVTlXUW1hQzNrd2NzVUcvN2lseFE9PSIsInZhbHVlIjoicjF1eEJyNCt3dldkVmwzZmMvWjZvVUhLeDMxTklIOHJLSGh1bDRoMWd5VVJCT1NpNE1FZnVZUXZzQXp6V1ZYOVNGWS9lRlpQM2s1ZUhBbm9BVlI5aVFmV21qcVFvUmtubFZRMHdIdThudzZqYzlFTkgxWmFJSFB3NktzaWFwTEdPZHRJb1c2NTdnbk1EYWpnb2dGTEZzNnp3cWVjazJQRUpqTGNRbXlMNDU4ZEhkcnp2a0ZxZldRT2FFYWFIWjFKIiwibWFjIjoiMjExNDM5MGMwMDZhNWZhZDg1YzEzMWRjODViZmEyZGM1NzhjMWI1MTgxNWQ2MWRmM2JjMGM2NjM4OWI1M2RiYiIsInRhZyI6IiJ9', 'eyJpdiI6IndJdEhBTWJlZXIvTjkvOE9waUtnamc9PSIsInZhbHVlIjoiaUdyNU85K29CYUQ0d1hNYU1pa2RGbnd4emVkZTlEWHp3OFA2RmovdURVazdDYlkrTEJ0bk9scHRlMFd5NGFIcnNXN2dSTTh5SGFSZ2xqMjJJdkpYd1ZJK0NUbXpXVGM3VGw2U0tKMmowODA9IiwibWFjIjoiZmRmNThiNDdkYmI4OWE3NzRkZjZkMmYwODMxODUwYjRhMDdiNGQxN2ZjMjk1MDIyNzc5MDU2NTRlMzU4NTdiNiIsInRhZyI6IiJ9', 0, 1, '2023-06-01 14:17:57', '2023-06-01 15:25:18'),
('ccbeba2e-92a5-4819-a1f1-0cafca178cb5', '492e02b7-cab9-42f2-9b42-6a6d373b2e24', 'TRX', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:23:31', '2023-05-21 10:23:31'),
('cd578dce-7c27-4e38-9eca-bf091d9ab207', '96f24f53-91db-4ab4-80ae-589139774970', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('cd8252e1-2ee8-4656-832d-8501afa4e784', '6bb43481-d32b-4038-9358-85a962250b5c', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:29:14', '2023-05-21 10:29:14'),
('cda8611c-0074-4630-965a-8a7547cd98a8', '6800875b-c059-49a2-aec7-8612c7d402a1', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-09-09 22:04:27', '2023-09-09 22:04:27'),
('ce3ef81c-664f-4a5b-ad90-df5b584e32e7', 'cf37d061-aa9c-460d-9701-66439afc812d', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-13 13:21:15', '2023-06-13 13:21:15'),
('ce9b1456-aa7c-4926-ba86-d210cf5726f1', '467671a6-55bc-4527-ba1f-d0d2b562fca4', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-06 14:15:45', '2023-06-06 14:15:45'),
('cf04c27a-4726-4b9b-a6bc-b14bf8d2d429', 'c034dc12-2661-4cd4-b118-febdc33c27e6', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('cf0a629d-565b-4c5c-9492-04116d2394b2', 'da77601a-40e5-4bb1-b584-2b82bd26370f', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-07-18 04:32:54', '2023-07-18 04:32:54'),
('cf15f8bf-b254-488f-a544-4124c49e2ada', '32769d8c-4dca-40d5-83ec-99b68df4b130', 'TRX', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:23:31', '2023-05-21 10:23:31'),
('cf655b3b-1ae5-4b96-813f-4a404870ebbd', 'cb74f45c-280c-42fd-a06e-a4672280c040', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-07-21 16:30:06', '2023-07-21 16:30:06'),
('cf712ac4-0bb4-442c-a3e7-9cb6810ed92d', '44d4809d-28e1-4685-b15c-dc11134fdf1d', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-07-20 09:58:46', '2023-07-20 09:58:46'),
('cf9ebee1-68ae-4435-9119-8ec2062eb995', 'abe08840-cedb-437d-9054-f6ca53045f5d', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('cff5a147-babd-471f-9415-b027a5946842', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 1, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('d036a6d1-0cbc-4d94-a591-74ec2133d66a', '60145862-0641-4106-af67-8de47b916abe', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('d05716dc-13a1-41e2-ad26-8de93620d393', '5e5189aa-f3b7-4e90-ab71-48eb3d97bf08', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('d060b0f2-d993-411d-8861-35bf594fa5d8', '923956af-60ea-40f0-8065-aac5c4fb3791', 'USDT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-09-14 11:32:26', '2023-09-14 11:32:26'),
('d0ae3a88-02c5-44b8-8bb9-78eec1f4af14', 'c275436b-9379-4114-9770-9e6d376488cd', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('d10f1f04-d1f6-4bf4-b6bd-f1045a49565a', '934ad33c-0304-4461-b0e5-ba8b3ca61ca1', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:31:50', '2023-05-21 10:31:50'),
('d113c49d-0e67-4524-96af-b0b85bd63bbc', '3197597e-5470-45e4-afc1-0b2292d2158e', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('d1311b32-852d-4ced-9f04-5671a893d6fe', '7109c567-63f7-4d17-a2d5-a518e560408e', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-08-03 17:57:26', '2023-08-03 17:57:26'),
('d16f1504-0000-4b87-8b72-d158c0491cfb', 'fd1358e0-095d-4123-8649-e56751a08017', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 10:12:17', '2024-02-19 10:12:17'),
('d1b6906d-563c-4264-8a0f-c00d136f4757', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', 'IRT', 595200165143922.09170874, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:36:02', '2023-05-21 10:36:02'),
('d1fc5275-1a5c-4fc9-bf93-a89236959de8', '5e5189aa-f3b7-4e90-ab71-48eb3d97bf08', 'TRX', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:23:31', '2023-05-21 10:23:31'),
('d26014b9-0451-4c92-b1e4-ead0b1e56bf1', 'f978562a-6102-47ef-b44c-00962596e9e4', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('d36d2561-c07b-48de-9b4e-dd82f08b15fa', '7b621b7c-6760-4430-9a30-10d8134b442e', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('d3ceb291-4194-4a42-83a2-1e6ff76175ce', '04b781e1-0a41-4703-888f-468243ebda36', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:36:02', '2023-05-21 10:36:02'),
('d3e2b8cd-883d-4efc-b186-1aaa4b0dbde3', 'c034dc12-2661-4cd4-b118-febdc33c27e6', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('d430fc23-f985-4bec-b9d2-3fa748a5d6dd', '9e207066-ad6c-4c73-b26a-22142f5d6eec', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('d43aa25b-e97a-4354-8d83-ef440a80f1cc', 'd72e5177-9169-4d3b-a805-aa9a45da9c32', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-05 09:35:46', '2023-06-05 09:35:46'),
('d4654d1d-3814-45bc-99b5-8aac57548b63', 'e5720c7b-8502-4a3a-9ee9-8896436a41d4', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-07-18 20:08:23', '2023-07-18 20:08:23'),
('d49055c3-9fd4-439b-b6f8-9763724c46cb', '6dd2b333-abab-4c57-b4f5-d33e4dd70f39', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-08-04 16:40:57', '2023-08-04 16:40:57'),
('d4ab5f40-cac7-44f7-a8d1-554937dfcf93', '6c2de49b-66b3-482d-bf48-8b690f86deff', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('d4b1b07e-3344-4c8e-89e0-9c87513024b3', '8208d769-48db-4e2f-8831-f48ead232203', 'TRX', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:23:31', '2023-05-21 10:23:31'),
('d4f72fe9-899c-4921-9fce-2288bcf23a8f', '04b781e1-0a41-4703-888f-468243ebda36', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:25:43', '2023-05-21 10:25:43'),
('d51eec46-6ad3-4b0e-9c52-9af49e634156', '625c7cbe-2e20-406b-911b-a8ae59dfe2fe', 'TRX', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('d5872d2c-d4e7-4133-b6cb-dc67d771cb77', '66a1e840-7ddb-4a17-988f-da8c948dc2a7', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:25:43', '2023-05-21 10:25:43'),
('d5af7a16-2d9c-487d-93e1-557e8a8f4fd1', '923956af-60ea-40f0-8065-aac5c4fb3791', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('d5b81da6-0b01-47d9-863b-4cad333f818d', '9e207066-ad6c-4c73-b26a-22142f5d6eec', 'TRX', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('d5f18cef-0755-4d41-957d-3be7dabb00f0', '7109c567-63f7-4d17-a2d5-a518e560408e', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('d6308e15-2c8f-42cd-b902-96055367c942', '09ae0ce6-3b8a-4a8a-ac2f-3919888e47aa', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:31:50', '2023-05-21 10:31:50'),
('d6349714-2d19-4e6f-969c-aa32e857ad03', 'db5d841b-d90a-4437-957a-c7fb5fa86319', 'USDT', 99999999999.99999999, NULL, NULL, NULL, NULL, 0, 1, '2023-05-25 12:50:06', '2023-05-28 09:00:26'),
('d6517eaf-3374-4065-a6ed-e0a44e4f57ae', '1ba19fda-1281-47fd-9059-c26571b6edc8', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-01 21:53:47', '2024-02-01 21:53:47');
INSERT INTO `wallets` (`id`, `user_id`, `symbol`, `primary_balance`, `address`, `passphrase`, `public_key`, `private_key`, `is_system_wallet`, `is_active`, `created_at`, `updated_at`) VALUES
('d658de1c-343b-4f2f-8773-c810d341c3d6', 'fd1358e0-095d-4123-8649-e56751a08017', 'TRX', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 10:12:17', '2024-02-19 10:12:17'),
('d6e7ca73-e0bf-418b-82f6-383a2dc372e7', '794254a9-ab67-4e67-8f36-861c423c29a8', 'USD', 15000.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-09-12 02:41:44', '2023-09-17 18:26:59'),
('d7392776-5a92-45be-9f86-bc59847ac484', '8208d769-48db-4e2f-8831-f48ead232203', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:25:43', '2023-05-21 10:25:43'),
('d921a8c1-5f17-4738-8c27-d015b48b2406', 'cdc7f9c6-150b-4b90-bc4a-8ce2f71f5c83', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-14 18:00:21', '2023-06-14 18:00:21'),
('d9736734-c111-48ad-8211-4948eaf2bbf8', '6c2de49b-66b3-482d-bf48-8b690f86deff', 'TRX', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('d9bd9dbe-23ad-4dbe-a2d8-6cb17f113048', 'eee37105-c97d-4f77-a933-910a0c6e68bc', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('d9f19d9b-4544-4dc9-8731-6bc52a4b295a', '2446118a-33ae-4cb4-8ca9-4e1c8dd68f4f', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('da44e299-30ee-4f6a-a647-298cd1f3fead', '34d2fe8e-ad62-4960-ba47-82234f81520b', 'TRX', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('da467ddf-db51-46c5-a055-0d643b1d1512', 'cf37d061-aa9c-460d-9701-66439afc812d', 'USDT', 24000.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-13 13:21:15', '2023-06-13 13:24:15'),
('da48e6a4-ba64-4f86-a87c-1ea743d8c275', '1ac9db2f-613b-4351-ba36-aa8a8e502079', 'USDT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-02 16:36:16', '2023-06-02 16:36:16'),
('daa4fa42-7eb9-4972-b93f-3085a4ff218b', '34d2fe8e-ad62-4960-ba47-82234f81520b', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('daaf0dbd-1045-4fca-9683-3298a2017cec', '5b4cd7b8-8ae3-4a91-a25b-cc785c061b14', 'USDT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-05 10:54:16', '2023-06-05 10:54:16'),
('dab0ed2e-10d3-4b34-ad7a-3c4b5da1a328', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'BTC', 0.24006800, 'TPBLaHbawLTXQMPKSLQjd43gS52YnXykiu', NULL, 'eyJpdiI6InZ6ODNsTUpsa05oVHpOSUdNT1FqUFE9PSIsInZhbHVlIjoid2w1ZTlUK3M3R1lxTmlSaUpER2cwd1QwWmVJM3ZYdXNWMGdqMEVqNklhVW1uRmNEdFVETHBMa0lHZVUyd2F0dGdpN0R2YUg4eUlHUDNEbDQ2Q2tlUytQNHNnOTh4Ky9jTVdLZEpMRWQ3aHJBbGEzTk52aUdjdnFpSnY2VmV3UlZ5OUhCRVdENmtMNjIrZEFURXZDd2FlYnJkY2s3djhOTXF4SmJqdmNKL3RGdWZqM1B2UUYvemZRU0JsUGQwWk8yIiwibWFjIjoiZjA4NjA3YjFiMTIyZGJmNmI1ZTBkMzcxZDRlNjU5OTliODNhMzY0ZWI4M2ZkYWVkOWQzMWQxMjU5MjZmYWUyOSIsInRhZyI6IiJ9', 'eyJpdiI6IkJqaTFwS1RqZ2JFWmRXei9KTENaaFE9PSIsInZhbHVlIjoidHlSSmhjTHNxRkJVTnJzZHlwWkVTKzNyN0Zzb0VoYURiRjBKYmc3YlcwaXEyTDU4YVc4R0hpZncwNlFWcnhhV2RvM0swZjJWYnlqVjVlYkhhTEJtMmJtcnJuV3NNckl1SFliNkl0M204YU09IiwibWFjIjoiMjE0YWM4NGYzMzFhMGQzMTk2MjZlMTFiYmZjMjUzODJmMmEyM2RhZGVlYjA2ZTQwYTU5MmU1N2JmM2Y1ZTM0NiIsInRhZyI6IiJ9', 1, 1, '2023-05-21 10:25:43', '2023-06-20 15:03:56'),
('daceb475-8627-4c6f-a57c-26a74ddd00e0', '89e4087c-1287-47c9-b101-f87da3cd0acb', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('dada869d-7dfa-442d-9082-75b2e08f6f77', 'ff837428-0711-4c3c-91a6-dd44e69ca5e7', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('db1067f2-2665-4712-a29c-0803b67d22ec', '6dd2b333-abab-4c57-b4f5-d33e4dd70f39', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-08-04 16:40:57', '2023-08-04 16:40:57'),
('db5ccfe0-0e5b-40fd-9487-04bf22958e8d', '3b4df004-bb15-4c73-b23e-f7d614f64b8e', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('db624dd2-ff01-4c54-8c26-41906a4de10b', 'eb0d5cb2-a937-4d7e-9e4d-cbd10c9948a3', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:31:50', '2023-05-21 10:31:50'),
('db672969-07ab-4a35-9597-38cbb1bf2a78', '48073e55-f172-4b10-b11b-7203b2b5dbd1', 'USDT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('dbf5c78b-4978-4490-8f90-37171762c26d', '7cde25b7-e520-4fb3-85df-f5fcf89305d3', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('dc0d7b12-dc6f-4819-b48b-67e709d29baf', '48ace508-5a29-483a-92d6-e1dc362baee8', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:29:14', '2023-05-21 10:29:14'),
('dc819fd7-deb4-4212-9a6b-b37f6bd52616', '52523c96-98e6-4e75-a1d8-e3cf094993a1', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-08-20 08:45:28', '2023-08-20 08:45:28'),
('dc88088f-46f2-4a13-993f-6f20371df727', 'd72e5177-9169-4d3b-a805-aa9a45da9c32', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-05 09:35:46', '2023-06-05 09:35:46'),
('dca4ea26-c155-4708-9876-0656f4227c3f', '04b781e1-0a41-4703-888f-468243ebda36', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:33:02', '2023-05-21 10:33:02'),
('dce74b1f-3304-466e-8656-dc705e607e7d', 'cdc7f9c6-150b-4b90-bc4a-8ce2f71f5c83', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-14 18:00:21', '2023-06-14 18:00:21'),
('dd0c160f-bb2f-4bb6-ab11-d972a3018b0c', '2446118a-33ae-4cb4-8ca9-4e1c8dd68f4f', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('dd7cac30-7b32-4937-a929-ee42176f5fc3', '8208d769-48db-4e2f-8831-f48ead232203', 'USDT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:27:23', '2023-05-21 10:27:23'),
('ddad8607-bfe9-4b92-822b-fe6e5887332f', '47dea59c-e88d-4c15-ad52-fa0dc6de1631', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('ddeca52c-410a-4b81-9d0d-b45a54219d35', '8bc2d325-279d-4cb5-8245-87e524f33587', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:36:02', '2023-05-21 10:36:02'),
('de893fd3-9999-47e5-851d-c43f068e9f6c', '48ace508-5a29-483a-92d6-e1dc362baee8', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:31:50', '2023-05-21 10:31:50'),
('de90d97d-11c8-45b7-aebb-e65cfa574c89', '5a03c1e3-f18c-41da-b6c6-d372ca6ade8c', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('df6dc4f1-a57a-44a3-92ee-c342d6e7a22c', 'kocoina8-bbd6-4f8b-9fbf-48711485ab8d', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:33:02', '2023-05-21 10:33:02'),
('df993f33-7dd6-4671-b005-90c7cb686999', '4737ffad-8afe-4bbe-9c76-9ece9d55068f', 'TRX', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-14 13:49:44', '2023-06-14 13:50:21'),
('e03e04fd-2d86-47b7-b619-57dcb2cb51cb', '98697609-12a9-4415-a700-07de18f31ba9', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-07-18 08:34:19', '2023-07-18 08:34:19'),
('e0bf6fc0-cbb7-499a-9392-c21fb6340cd3', '44d4809d-28e1-4685-b15c-dc11134fdf1d', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('e0d7ef5c-b66e-4b09-b2ec-3bc6f5ccfebc', '96f24f53-91db-4ab4-80ae-589139774970', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('e0e90ce7-2b7b-41a6-9526-795fb00d7217', '6cd1a9e7-a910-43c8-a930-95dcb2c8edca', 'BTC', 2000000000.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-08-07 18:13:48', '2023-08-07 18:14:54'),
('e1428e1c-026a-4791-99b6-dd892b628858', '89e4087c-1287-47c9-b101-f87da3cd0acb', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('e1488bde-6ef5-4caa-8ba6-8498849d517d', 'f9ca05bf-6025-4a42-87f1-78001c65886c', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('e1522c9a-7378-40cf-a1a6-22a671e40e7d', '557a1889-0d7e-4e8c-a314-14e6c4004ee3', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('e1add801-5604-4f99-94d3-194cfad1d50b', 'b9ec7d63-015c-4814-b253-eb1d45eae4dd', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('e28ebcee-b812-4317-bd81-2d12e9769871', 'db5d841b-d90a-4437-957a-c7fb5fa86319', 'IRT', 300000000000.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-25 12:50:06', '2023-05-25 12:50:06'),
('e2ebf47a-5181-4ba7-bbb2-1cc94a7a76eb', '4737ffad-8afe-4bbe-9c76-9ece9d55068f', 'USDT', 35000.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-14 13:49:44', '2023-11-22 09:13:55'),
('e3082576-3eb4-4b51-8c86-a814f7a9d28e', 'ea3c376d-8e83-4e18-be5c-25fda612432f', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('e3907feb-7a3c-4d55-92d0-b9995708ef5e', '89e4087c-1287-47c9-b101-f87da3cd0acb', 'USD', 10000.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-03-14 12:53:09'),
('e3c85494-c9f5-4d6a-8aa1-dc4eda42338b', '557a1889-0d7e-4e8c-a314-14e6c4004ee3', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('e3cc916e-6745-438a-8108-ee440310cfdf', '1ac9db2f-613b-4351-ba36-aa8a8e502079', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-02 16:36:16', '2023-06-02 16:36:16'),
('e3fd7af6-77f2-4c4c-bb17-b29ef9567da8', 'adc69fe5-342e-4db7-83d6-1aa6b50e4217', 'USDT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:27:23', '2023-05-21 10:27:23'),
('e43eea7b-04a5-489e-bf21-e52877650323', '8208d769-48db-4e2f-8831-f48ead232203', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('e45c38b5-95cd-4980-9111-04106f5af044', 'e7c629dd-0b1e-4094-bc83-6c928f77b357', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-20 15:07:49', '2024-02-20 15:07:49'),
('e4692911-c16f-4630-8b49-4aba87b55d89', 'da77601a-40e5-4bb1-b584-2b82bd26370f', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-07-18 04:32:54', '2023-07-18 04:32:54'),
('e4924c05-b655-4704-8c03-ac622eb21aec', '6cd1a9e7-a910-43c8-a930-95dcb2c8edca', 'TRX', 2.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-08-07 18:13:48', '2023-08-07 18:13:48'),
('e4dff565-d3e9-45f5-aee4-afc148add813', '7db45872-7279-474d-aa0d-d56723822162', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('e50c2cba-d620-4578-8748-f35e931cdcf7', '675d5181-9662-4d5a-8e29-924e2b58b24f', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('e5242127-7747-4c3a-b406-785f407bd17c', 'eee37105-c97d-4f77-a933-910a0c6e68bc', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('e53c5009-c0c7-46aa-bb26-0ffdfa26f39e', '934ad33c-0304-4461-b0e5-ba8b3ca61ca1', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:36:02', '2023-05-21 10:36:02'),
('e551f663-aa15-42d8-8ccf-0f81c0d2c150', '62cb835b-6592-459f-a2e4-f6dc5b7ac7f1', 'USDT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:27:23', '2023-05-21 10:27:23'),
('e55f93c0-eaf8-4880-a9df-652229844eb0', 'abe08840-cedb-437d-9054-f6ca53045f5d', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('e57ef4d5-e9e2-4872-a8dc-ffaef6051abd', '48ace508-5a29-483a-92d6-e1dc362baee8', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:36:02', '2023-05-21 10:36:02'),
('e5850d87-ce24-4408-b8f2-766b88d319d7', 'a01cd4e5-4cbb-48ab-bfde-2b558ab60d88', 'TRX', 2.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-07-20 08:02:36', '2023-07-20 08:02:36'),
('e6248982-f37a-45be-a5eb-a9c54fca2eee', '12a277f5-c2ee-44a6-82da-f6f5e03758a9', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('e62c84fb-c2ac-42ce-b835-e4e7309b06fa', 'cdc7f9c6-150b-4b90-bc4a-8ce2f71f5c83', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-14 18:00:21', '2023-06-14 18:00:21'),
('e68da106-fd0c-4938-9cf4-b1f8c9c65fb2', '89e4087c-1287-47c9-b101-f87da3cd0acb', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('e694ef20-9fa1-4e69-9e78-63ce144ca485', '07b97174-b6d2-48b5-a9a2-f8c1443eaf3e', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 11:06:15', '2024-02-19 11:06:15'),
('e699173e-6866-4186-a5e7-6777b39984aa', '1ac9db2f-613b-4351-ba36-aa8a8e502079', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-02 16:36:16', '2023-06-02 16:36:16'),
('e6f2c4c7-fbcb-48ad-b368-2ddc68d2fc18', '9e207066-ad6c-4c73-b26a-22142f5d6eec', 'USDT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('e758aff4-f505-4234-ad8f-39ba858aa1b8', '07b97174-b6d2-48b5-a9a2-f8c1443eaf3e', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 11:06:15', '2024-02-19 11:06:15'),
('e7683d68-1cc2-45be-b9aa-848895b9b061', '794254a9-ab67-4e67-8f36-861c423c29a8', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-09-12 02:41:44', '2023-09-12 02:41:44'),
('e855faee-56c7-42bc-b363-dc3ea89f81c3', 'd86b3a4d-3a57-426e-8e1e-95a6be996bb5', 'TRX', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-07-19 11:01:40', '2023-07-19 11:02:53'),
('e8568009-5242-412a-972f-d4a0738c3cf5', '48ace508-5a29-483a-92d6-e1dc362baee8', 'USDT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:27:23', '2023-05-21 10:27:23'),
('e874723d-ee2c-4ddc-ac5a-253f434bbbe1', '6dd2b333-abab-4c57-b4f5-d33e4dd70f39', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-08-04 16:40:57', '2023-08-04 16:40:57'),
('e8981697-14dc-432e-ac73-41d6b1ee5a9d', 'eeb02b68-6521-4a40-84ad-21a2d21aa440', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('e92884f6-9f36-4bcd-9d16-c1ca4d939b2c', '6800875b-c059-49a2-aec7-8612c7d402a1', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-09-09 22:04:27', '2023-09-09 22:04:27'),
('e94973ab-1eb2-4cf0-9e47-0998102fc527', 'e7862d9c-fba8-4509-b59b-a4cb4f71ba04', 'USDT', 7500.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-07-25 05:19:47', '2024-02-06 15:05:10'),
('e95dd98e-b106-45f8-a2ba-264a6ec316ba', 'cda51314-c8fb-414d-9f56-fb848e43077a', 'TRX', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('e97e209f-66c5-4f30-9cf9-2f9dd0c4c420', '48073e55-f172-4b10-b11b-7203b2b5dbd1', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('e989c4ec-91ae-4131-8bda-4c3a7688c026', '6f1ba6d2-22bf-4291-977d-534ac1aff4d8', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('e99498f1-cc79-4781-b16a-589215963e1a', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'TRX', 0.00000000, 'TPBLaHbawLTXQMPKSLQjd43gS52YnXykiu', NULL, 'eyJpdiI6ImNscDVva05tVnRRVlJGdDZVY1E3blE9PSIsInZhbHVlIjoiRHRtZTIzeUcxZmtKSGd5OXJWVGt0ZDlldDk3b1BWU3RuLzRvcFZjc1dBM3owTnk5ZmN4a0pFK0o4MTEzUng1ZXRRVllJTzdOTG9kQ1ZDNHdzeUpxbEhkN1NpRXFPaHJZWmxrUGtLK2xQWFhRSmloNHhQL1RVM00rRzc4ei8yMkM5ZW45eEtWQkV1UTJuNnk2WXNnVnZnRnViK2FpdXFqR0pEQVZDbXhUWFc5SVJ0Z3hkUnZlSGZPcjl0RStFaFFVIiwibWFjIjoiYTE4MTVmYWI4YzNkYjY2ZGVjYzAwNzI0NjgyOTU0ODQyNGI0Zjk1YWFhZTRmMTkwNzI3MWU3Njg0MTNhNDBiNCIsInRhZyI6IiJ9', 'eyJpdiI6Im9CdENwT043aTRnWWRWSlgwWFB3RHc9PSIsInZhbHVlIjoiNU4xTUxaVGE5cWRJNEZiemFQRGRMVktUMzF4RWl0cFhZVG1tUFJ3SktBcjZBdEdqditsR2U4dVhaYVgxOTdxMTNnbmdEblVERmlaTW1LSW1SK2I4NmtLWWxzbFJsR1pIdGU1UVRaU25ORTg9IiwibWFjIjoiYzI0ZjA3YTA4YTk0OWY4OTQzMWEyYTQ3MTczNmJlZDdiOGUzNjNhZDRkZjdlYjlkOTc2NTViOWIzZWM1MjlkNyIsInRhZyI6IiJ9', 1, 1, '2023-05-21 10:23:31', '2023-05-21 10:23:46'),
('e9d163a5-2a52-427f-8ab8-8072cc5bf6ee', '57cfdde8-b3bb-4020-bd29-83cc9575bdcf', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-14 18:00:21', '2023-06-14 18:00:21'),
('ea02ec00-2783-4099-a34d-2389a61ac327', '6c9d2b9b-812c-4ba7-9bbe-66d940eaa5bb', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('ea131741-e581-4a31-8310-3b3d91d5f855', '625c7cbe-2e20-406b-911b-a8ae59dfe2fe', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('ea1eb1b6-b203-4668-9d8f-a2f6f4d05a31', '86f3c2c9-e4c3-4192-ad1e-d34a6b188833', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-07-18 20:16:27', '2023-07-18 20:16:27'),
('ea2572f0-af8f-44ce-9eef-41b5c980bb7a', '7db45872-7279-474d-aa0d-d56723822162', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('ea56511a-2436-4b3b-b1d6-add3f954893f', '8bc2d325-279d-4cb5-8245-87e524f33587', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:31:50', '2023-05-21 10:31:50'),
('eb0b5a12-7226-4da2-b466-6348553419b5', '9e207066-ad6c-4c73-b26a-22142f5d6eec', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('eb668c21-b82e-4c39-936d-f43885116fe2', '1ac9db2f-613b-4351-ba36-aa8a8e502079', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-02 16:36:16', '2023-06-02 16:36:16'),
('eb689941-7c40-47dc-a026-1f3a11e41fb0', '01bac2f0-2e3c-4116-a7fb-61c4d149a2e6', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-12 10:22:18', '2023-06-12 10:22:18'),
('eb91f745-5d4a-4ac2-bbe6-b527a961fc89', '62cb835b-6592-459f-a2e4-f6dc5b7ac7f1', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:29:14', '2023-05-21 10:29:14'),
('eb937dc0-7f76-4ac7-b61d-d13d3a4e5d36', '6bb43481-d32b-4038-9358-85a962250b5c', 'TRX', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:23:31', '2023-05-21 10:23:31'),
('ec3e6d57-a8ac-40e5-b95e-571b74ab8418', '48ace508-5a29-483a-92d6-e1dc362baee8', 'TRX', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:23:31', '2023-05-21 10:23:31'),
('ec53805a-1f25-4f95-a252-0c2e972ba2f5', '6eb3595c-031c-4f55-abee-80cf6d8c816b', 'BTC', 0.00000000, 'TMwGs2ertTKd9RbEQDccAGgVL9DXYYRbiD', NULL, 'eyJpdiI6InFhc28vS2FvUm1HRFJhcUR2dk9XUUE9PSIsInZhbHVlIjoiU01NMFZtUjhrTXpocGhqR2crSmdQdFFLNUJ3ZUZSVWd5T3JndG0yMmV0bUYvVzNyNVpvTW5jL0oxYXBCTnpzQ3UyRHpOWWdrTTMyWkE3SWxVMUpoQmoyQStaenFtWjBscFErMXU0K043eksybXVYRk93U2tSb1FyakhnZFQxalQ2VzU2Z2p2Rm5GV0VTbVJvNmJCSERUdGtWblRWdEk0WWxKd0xUREJZOURsaVpjRUdoclIzUWFrTFRNWFJya1ZJIiwibWFjIjoiMGUxZDAxZTUwMGQ2NTU5ZTExMWU0YzJhMzBkYzVlYTNjYWJiMDQzMjY5ZTU4MTU2OWE0OTRiODZjMTUzMTBlNSIsInRhZyI6IiJ9', 'eyJpdiI6IkVnbFhyaU40VVBBcDZMaHM1RFJlU2c9PSIsInZhbHVlIjoidVo5M01LL1lQcERLUmt4RnNDTGNGNmF4NXpPZDQvNDNKMlgwYUhZRVdNaWphdnJ2ekdxNkxCdUJDQWhpWmo4ZmhYcG1hTVgxVElzMzlkQllFUWs0cXMyMmgrZGVGcWFJRWQ5VWZ6S3VaOEk9IiwibWFjIjoiMjExNDQyMTI5NWQ5ZGVjZmNhMTMzNGEzMTdiOGJmMWI5MjVkZmY5MThlYmFkNjRkNzJiZGQ1MmNkNzg2NWRjYyIsInRhZyI6IiJ9', 0, 1, '2023-05-21 10:25:43', '2023-07-20 09:28:07'),
('ecaa1098-57d2-43c6-8880-9d00c8e55910', '48073e55-f172-4b10-b11b-7203b2b5dbd1', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('ed06c1f4-b87a-4c2a-964c-3876e8cb6ecf', 'cda51314-c8fb-414d-9f56-fb848e43077a', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('ed21b305-1ee9-490e-91e1-242069fcca5c', 'cf37d061-aa9c-460d-9701-66439afc812d', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('ed3e6aa2-9709-4d2f-a85d-b3973b86f55a', '34d2fe8e-ad62-4960-ba47-82234f81520b', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('ed4297aa-90e4-4fb4-89fb-2aad5256a900', '7db45872-7279-474d-aa0d-d56723822162', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('eda0e812-3741-4aa7-a6a7-682eecf4e81a', '5a03c1e3-f18c-41da-b6c6-d372ca6ade8c', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:31:50', '2023-05-21 10:31:50'),
('ee047b07-3ffc-44f8-bc29-e649400680f6', 'a01cd4e5-4cbb-48ab-bfde-2b558ab60d88', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-07-20 08:02:36', '2023-07-20 08:02:36'),
('ee1acd80-bec6-4294-ab07-54ca60fb987b', '6cd1a9e7-a910-43c8-a930-95dcb2c8edca', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('eec25138-ee20-43cb-b755-ad188308dbaf', '6800875b-c059-49a2-aec7-8612c7d402a1', 'USD', 95000.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-09-09 22:04:27', '2023-11-22 17:14:03'),
('ef52ac7f-6af3-437e-975a-2917a4f45e90', '1ac9db2f-613b-4351-ba36-aa8a8e502079', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('efaea0ed-dad7-4585-a800-aaae20bdc728', '675d5181-9662-4d5a-8e29-924e2b58b24f', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('f0ef5d8f-ffcb-4d39-93a4-d5db0981646b', 'e5720c7b-8502-4a3a-9ee9-8896436a41d4', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('f0f1eff7-164e-4dcf-a074-0ba57914d7a4', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:25:43', '2023-05-21 10:25:43'),
('f114bf75-73eb-40c9-8f38-ac22c5902cc2', '934ad33c-0304-4461-b0e5-ba8b3ca61ca1', 'USDT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:27:23', '2023-05-21 10:27:23'),
('f1a23391-f7d7-4b11-b6dc-ddfce9fbabf1', '7b621b7c-6760-4430-9a30-10d8134b442e', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('f1fdef4f-2e9c-4fd9-9167-757ea9344ebb', '88f8082d-7f6a-44f3-8782-d0be24853117', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('f2025a3e-2bda-4555-81cf-e27483dcfb86', 'ff837428-0711-4c3c-91a6-dd44e69ca5e7', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('f2045bbd-1aab-4504-b4dc-969e4785ba74', 'ecbb1278-fb14-4952-8ef9-fc77aef93d3d', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('f22409e5-1d8c-40c6-a087-ca6662d23676', 'd72e5177-9169-4d3b-a805-aa9a45da9c32', 'USDT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-05 09:35:46', '2023-06-07 11:12:38'),
('f24cfed5-eafd-4645-9d6c-7dcc15fec37c', '6c9d2b9b-812c-4ba7-9bbe-66d940eaa5bb', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:31:50', '2023-05-21 10:31:50'),
('f32c521a-3a5c-498d-b68a-078454bc6c20', 'b9ec7d63-015c-4814-b253-eb1d45eae4dd', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-07 13:12:27', '2023-06-07 13:12:27'),
('f334d777-a92f-4625-8548-e3832a01ba9f', 'ecbb1278-fb14-4952-8ef9-fc77aef93d3d', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-08-14 19:22:20', '2023-08-14 19:22:20'),
('f338fc30-0812-4e74-aadd-5e8927a4cd45', '9e207066-ad6c-4c73-b26a-22142f5d6eec', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('f383c28f-466d-4835-b012-f1931c317605', '557a1889-0d7e-4e8c-a314-14e6c4004ee3', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('f3bedd76-4ec2-45df-9d58-11562a337e31', 'fb35867d-1db8-4b6d-9f19-54ab0b2ddab1', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-01 14:17:57', '2023-06-01 14:17:57'),
('f3ca78a7-787e-4424-b641-f720e94a04d1', '12a277f5-c2ee-44a6-82da-f6f5e03758a9', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-01 13:16:13', '2023-06-01 13:16:13'),
('f3e3e2d1-b13e-4878-a3a5-d9f2e5137b8e', 'd7ce0527-5843-4fd4-9253-ec190e726a4a', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('f401ca1b-048f-4218-ba05-374e5afabd9a', 'a502eb20-d81c-4f3e-a56f-11444fe1e4cb', 'DOGE', 0.00000000, 'TSZsQpLG8BSXAtkhRGJzFsXDERTrk3Npia', NULL, 'eyJpdiI6IktuMm5xdmZhWkZVSGRsOVhEdkJOVEE9PSIsInZhbHVlIjoiTEgraTJwMjVHT1Iyb21QdzM0empma1RnQXp6N3dzY0Z5RXJCMlZBd1MxWEpRRkEvUTR2KzZ1T1gyRitEVlYwbFd5Mi9PN2FrTFFVVE9hOGhrNnFMbTl2SDN1a3oydDc2Ynk5V1hUN3dJWm41em5oZDREREtSMnVQUGw4YUhuNXdnWFNVSWo0TmM5ejBjd3F6anU4V08zNnp5eGx6Y29xcjZCaXN4dG1ML2ZTN0lNZldUMG9HOVZ4S0dKdDBHSlZSIiwibWFjIjoiN2NkNDg4OTRkMjcyMGJkYmQ5NjdlMGI2OWRmZTU2ZDY2ZGMxMGRlMmMzNzcyYzAxZWI2NDc5NDQxNWIyZDE5NiIsInRhZyI6IiJ9', 'eyJpdiI6Ik8rYjhWSHdXVDdlWGs0V2swTllPenc9PSIsInZhbHVlIjoicjNoZkVUbER0OTdpVlBBY2ttZWpFZjEvSzk1TDVObmhyNjU1Q28zWG1kWWFZalAyUFJZUW5pQ1daU25UU3l0THhRVnV0OGdZMmo3Z0VuWUcrRnVXeXpGR2FSZVBSMVlMNHJhT0xkUExwVE09IiwibWFjIjoiNDI4MTVjN2VkZjQ0ZjRmNGQ1YzQ3ODgwNmJmNmZiYWNjN2ExNWU1ZWNiZTFiY2VjNDdmOTI3MGEzY2ZjNzQ4NSIsInRhZyI6IiJ9', 0, 1, '2023-05-21 10:31:50', '2023-07-13 11:40:46'),
('f4306bfb-86c4-4db4-a632-57547c221df3', 'ff837428-0711-4c3c-91a6-dd44e69ca5e7', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('f44c6484-d865-4921-a996-1fa718b78d42', '12a277f5-c2ee-44a6-82da-f6f5e03758a9', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-01 13:16:13', '2023-06-01 13:16:13'),
('f462be3d-3dc1-4eb0-a4d1-49b629533666', '86f3c2c9-e4c3-4192-ad1e-d34a6b188833', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('f48ba1d3-0fe8-482f-84f5-78531dcb21e9', '88f8082d-7f6a-44f3-8782-d0be24853117', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-09-10 14:17:32', '2023-09-10 14:17:32'),
('f551b80e-7352-4da9-96dd-1d9c823eb976', '36f5887f-2b9b-4144-879c-9be2cff7e466', 'USDT', 80000.00000000, 'TLBxK5CDtYuzghrL6rb6dEEc35HyzhGm56', NULL, 'eyJpdiI6InQwR3hzUkxKUlhPMzNXeTlZYmRGUnc9PSIsInZhbHVlIjoibEE4ZDNRalJHa2ZhYnp4Nk5DTWYvRE1jV1hac2FValNkbllSKzFJUkNIWEhtcGtzaUdySWZMUU80ZXRrQThWd1pGS2tjbUVLMzZtQWlLZXFTL1NqcHlKdThaUTJ6Q0MrSnYvZDNOVk11TWZLd1lVdDBaK2NMYVNyS0tQTjE3b0VWS2RSbHZDMURsWDVueEcxS2RHK25RNkczbVU0cGhKYWlack1EYSsySUVrc0VVQ0ZJSTRmTWprNUR6RGlkS0xJIiwibWFjIjoiNWI4ZmM1YmU3Zjc2MDAyZWU4Njk3MzM0ZDNlMjVjZDUxMGFiNTcyY2RkYjgwYTRlYmYwNGMyYmJlYWM2MzVjOCIsInRhZyI6IiJ9', 'eyJpdiI6IjFCWEM0OGtQWVZ1ajhvTUFwaTlRemc9PSIsInZhbHVlIjoiaXdGa3EwYXdrb2JVSkFzYndIZ1Q5YnlvVXR5aGltMWxIZjFMUEVNTk5mUlNwTmhNRjNjcDVhcVk2TGlqcUN6UW85emhXMHhoRVF0bGZ5VklLVVlkSkR6dTlvTmh2S01yNUlwTTJVc3YyTGc9IiwibWFjIjoiOTc1NDY3YTE2NTgxN2YxODc0ZGZlNmUwYjFjN2E3MTljMjNhYTVlNDZkODhlZTE3NzYzODY4NWUzODA5OWY1ZiIsInRhZyI6IiJ9', 0, 1, '2023-06-13 01:18:02', '2023-06-22 14:03:56'),
('f5920b57-591a-461c-ab34-3d0443233bbf', 'e7862d9c-fba8-4509-b59b-a4cb4f71ba04', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-07-25 05:19:47', '2024-02-06 14:02:27'),
('f59b4bb3-0eb4-4723-b47a-87cf5ae9ee3a', 'cda51314-c8fb-414d-9f56-fb848e43077a', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('f5c7c2a5-7414-4bba-9681-70ea53b52e61', '7cde25b7-e520-4fb3-85df-f5fcf89305d3', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-09 13:43:35', '2023-06-09 13:43:35'),
('f5d6f71b-20af-4dbe-9771-d276f69c2eb8', '4737ffad-8afe-4bbe-9c76-9ece9d55068f', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('f5df28e0-96ac-4bcb-ab39-404ee560a191', 'dff7716d-646f-48ee-8d87-a1f8461230d9', 'USDT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:27:23', '2023-05-21 10:27:23'),
('f6109d78-14be-420d-81ef-39e9df742030', 'd72e5177-9169-4d3b-a805-aa9a45da9c32', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-05 09:35:46', '2023-06-05 09:35:46'),
('f61dea18-4257-4080-844f-6d65de49e70e', '88f8082d-7f6a-44f3-8782-d0be24853117', 'IRT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-09-10 14:17:32', '2023-09-10 14:17:32'),
('f65f1ce2-14ab-43d3-96b3-404445c228cc', '57cfdde8-b3bb-4020-bd29-83cc9575bdcf', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('f73f1038-5e5d-4599-8e26-65e26d215dac', '47eaf168-5901-4ccb-8b9c-d7f9c754ed04', 'TRX', 2.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-31 10:02:57', '2023-05-31 10:02:57'),
('f746c490-877b-47d0-9b1c-0c6808c904d0', '62cb835b-6592-459f-a2e4-f6dc5b7ac7f1', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('f8c76469-d0ed-40fe-b58e-dec8cffcfc73', '4737ffad-8afe-4bbe-9c76-9ece9d55068f', 'MATIC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 05:26:40', '2024-02-19 05:26:40'),
('f952cecc-9c95-44a0-bfbf-5c04d4573a3c', 'd2b09976-3be3-43e8-81ef-d0dd81784cdf', 'USDT', 7000.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-07-26 10:01:28', '2023-11-23 00:11:46'),
('f9e6e49a-92cd-474e-8d0a-280b96cef9a2', '467671a6-55bc-4527-ba1f-d0d2b562fca4', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('fa6ff129-e83d-4939-b22a-9d1b0895ebfd', 'ff837428-0711-4c3c-91a6-dd44e69ca5e7', 'USDT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('fae23fc3-b3f7-4838-a974-0648aa1e4936', '7b621b7c-6760-4430-9a30-10d8134b442e', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('fb1fcd77-f77c-404f-b087-d15eaeb96795', '52523c96-98e6-4e75-a1d8-e3cf094993a1', 'BTC', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-08-20 08:45:28', '2023-08-20 08:45:28'),
('fb9e71e5-53d4-403a-abf7-4323b8d2ab77', '3197597e-5470-45e4-afc1-0b2292d2158e', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('fbb7b6ab-93d8-411f-92bb-c3a0482a9471', 'fd1358e0-095d-4123-8649-e56751a08017', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-02-19 10:12:17', '2024-02-19 10:12:17'),
('fbea749d-e0a5-4f94-b1fe-b09ef1ae2ec6', 'fb35867d-1db8-4b6d-9f19-54ab0b2ddab1', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-01 14:17:57', '2023-06-01 14:17:57'),
('fc084c6c-4607-4de3-ad35-ae4102b5e69c', 'f978562a-6102-47ef-b44c-00962596e9e4', 'USD', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-12 10:53:36', '2023-06-12 10:53:36'),
('fc11a914-fe82-47ca-86dc-7dd214611c50', '6f1ba6d2-22bf-4291-977d-534ac1aff4d8', 'TRX', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('fc6de65c-014a-413d-a086-56b5f11ea81f', 'd7ce0527-5843-4fd4-9253-ec190e726a4a', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('fd5f67fe-8ea8-4c85-b28a-a955a2d3e5f1', 'cdc7f9c6-150b-4b90-bc4a-8ce2f71f5c83', 'TRX', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-14 18:00:21', '2023-06-14 18:00:21'),
('fd9222ca-a1af-45bb-9702-3dccce11f70c', 'c275436b-9379-4114-9770-9e6d376488cd', 'USDT', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:27:23', '2023-05-21 10:27:23'),
('fe4b4e4b-8e62-4c87-9330-aa28be09dee5', 'e5720c7b-8502-4a3a-9ee9-8896436a41d4', 'TRX', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-07-18 20:08:23', '2023-07-18 20:08:23'),
('fe53693c-7710-4463-ac32-5417e6151bdc', '66a1e840-7ddb-4a17-988f-da8c948dc2a7', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-05-21 10:29:14', '2023-05-21 10:29:14'),
('fe8b6a37-079f-4467-8bf6-259dec1b793b', '48073e55-f172-4b10-b11b-7203b2b5dbd1', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('ff1be954-75cb-44f2-b846-b46f227667a9', '7cde25b7-e520-4fb3-85df-f5fcf89305d3', 'DOGE', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-06-09 13:43:35', '2023-06-09 13:43:35'),
('ff38a76c-c323-4437-903a-7f820d1bddb9', '09ae0ce6-3b8a-4a8a-ac2f-3919888e47aa', 'GRMS', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2024-01-31 05:05:00', '2024-01-31 05:05:00'),
('ff763661-aff8-4483-bfbf-0cbfb376257e', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'IRT', 1347834331121.41960862, NULL, NULL, NULL, NULL, 1, 1, '2023-05-21 10:36:02', '2023-05-21 10:36:02'),
('ff8b81e9-6df3-4aaa-8050-3de7f9b7b111', 'c71eeafd-849d-4cb7-8275-1ebcd9ac93d8', 'BTC', 0.00000000, 'TREmDjbq1nnfxzfzgvm4o1znL6zSooMv7Y', NULL, 'eyJpdiI6IjFObUg4N0ZndUt3VkFVL2VDdTN1M1E9PSIsInZhbHVlIjoiVU1sdk1IQmNFdTlBRXdmcCtKdzlGZ0xkVk9aUUlMVFhUekxGTGVjOTc1UE5YOWpMdGtMcXVIeTRuUUlWSVFVWlIwM3ExYmMycGZyQnR5c1VDTjBPczdiQmdnWGw2QlNsUGc5OEFJRjNEa1QvZEhsaVdIR3U2N3FYcVlXUzNFeG1jK1pLeGNyM1ZTV29vVVYrZzVDNGRzRzJYMW5tRUtoMjB5cFVFOGpoR1NCbXl3YkJDWmpTUGdDMGZFSnJ6MVk1IiwibWFjIjoiNGE0YTU1NDNmMTY2ZTcxNThlNTRkZDA4NTFjM2E2MThkNjZlNWNjOTk3Y2JkMzdhN2ZjNzlkNGNhN2Q2ODQzNCIsInRhZyI6IiJ9', 'eyJpdiI6IjZuYW80VGdWQllYdjNmVmkwZ2tCQWc9PSIsInZhbHVlIjoiUWVOVStuc09TNW9yUkdGa1lXd2RWTEpDWnZDSGRBWTFuRFBtYk1MeEExbmh1S1laaXZHWkFpQlI2Ulp4QjhSYVNYT3NTYzd4TUlvaG4zbkFsRWI3ZmRER1BFcUtmVGZLZFJtdEhMbGpZOFU9IiwibWFjIjoiYjYzMTg2Y2Y5NGRlNmQxOWNhMWY5YmJhODNmM2QxNjI0MmNkN2UzMDFkYjcwYTRkYmU5YzdhZTI2MmRkMzYxOCIsInRhZyI6IiJ9', 0, 1, '2023-06-04 15:02:20', '2023-06-04 18:49:29'),
('ffe4bbcb-357e-4f34-ae20-a18a0aaee50e', '88f8082d-7f6a-44f3-8782-d0be24853117', 'ETH', 0.00000000, NULL, NULL, NULL, NULL, 0, 1, '2023-09-10 14:17:32', '2023-09-10 14:17:32');

-- --------------------------------------------------------

--
-- Table structure for table `wallet_bonuses`
--

CREATE TABLE `wallet_bonuses` (
  `id` char(36) NOT NULL,
  `user_id` char(36) NOT NULL,
  `wallet_id` char(36) NOT NULL,
  `package_id` char(36) NOT NULL,
  `symbol` varchar(10) NOT NULL,
  `amount` decimal(19,8) UNSIGNED NOT NULL,
  `bonus_usage_count` int(10) UNSIGNED NOT NULL,
  `earning` varchar(20) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'processing',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wallet_deposits`
--

CREATE TABLE `wallet_deposits` (
  `id` char(36) NOT NULL,
  `user_id` char(36) NOT NULL,
  `wallet_id` char(36) NOT NULL,
  `bank_account_id` char(36) DEFAULT NULL,
  `symbol` varchar(10) NOT NULL,
  `system_bank_account_id` char(36) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `amount` decimal(19,8) UNSIGNED NOT NULL,
  `system_fee` decimal(19,8) UNSIGNED NOT NULL DEFAULT 0.00000000,
  `txn_id` varchar(255) DEFAULT NULL,
  `api` varchar(255) DEFAULT NULL,
  `platform` varchar(255) DEFAULT NULL,
  `receipt` varchar(100) DEFAULT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wallet_deposits`
--

INSERT INTO `wallet_deposits` (`id`, `user_id`, `wallet_id`, `bank_account_id`, `symbol`, `system_bank_account_id`, `address`, `amount`, `system_fee`, `txn_id`, `api`, `platform`, `receipt`, `status`, `created_at`, `updated_at`) VALUES
('017ef1f5-984d-4e44-91ca-b63d247ab2ab', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'c57baee2-7a33-46f7-8a14-41f2e70df233', NULL, 'USD', NULL, NULL, 120000.00000000, 1.00000000, NULL, 'ADVCashApi', NULL, NULL, 'pending', '2023-08-20 12:51:14', '2023-08-20 12:51:14'),
('044d0c5e-d6dc-41fa-a589-9237ce090218', 'c71eeafd-849d-4cb7-8275-1ebcd9ac93d8', '27aa98b9-9c31-4910-a21b-ca2032fb93de', NULL, 'TRX', NULL, NULL, 20000.00000000, 0.00000000, 'd00658d1-b860-400d-8a6a-8fd6740b7bc5', 'Internal', NULL, NULL, 'completed', '2023-12-04 18:00:00', '2023-12-04 18:00:00'),
('0636d19f-f6ab-41af-8383-66190a11f43a', 'e7862d9c-fba8-4509-b59b-a4cb4f71ba04', 'e94973ab-1eb2-4cf0-9e47-0998102fc527', NULL, 'USDT', NULL, NULL, 43200.00000000, 0.00000000, '4b2d06da-d495-49cf-9543-ed145da022aa', 'Internal', NULL, NULL, 'completed', '2024-02-06 14:02:11', '2024-02-06 14:02:11'),
('09175f54-62cf-4e3b-a4e3-cb014ce80132', 'a502eb20-d81c-4f3e-a56f-11444fe1e4cb', '89dd6f6d-370d-447a-8138-bc76d57ee6c8', NULL, 'BTC', NULL, 'TSZsQpLG8BSXAtkhRGJzFsXDERTrk3Npia', 10.00000000, 0.00000000, '2925aaee-ec46-4938-ac18-d9db55508f95', 'Internal', NULL, NULL, 'completed', '2023-07-18 13:27:32', '2023-07-18 13:27:32'),
('0cddc689-97ba-407d-887d-f8d4aa6260ee', '32769d8c-4dca-40d5-83ec-99b68df4b130', '6400859e-7021-4487-8481-8ba016d35f34', NULL, 'USDT', NULL, NULL, 10000.00000000, 0.00000000, '6f8e3a4f-3ac6-448d-9fdb-26ba77b8a0cd', 'Internal', NULL, NULL, 'completed', '2023-05-30 10:15:28', '2023-05-30 10:15:28'),
('0debf611-96e8-48f0-b039-5e1fd562d8d6', 'c71eeafd-849d-4cb7-8275-1ebcd9ac93d8', '12848a5b-5c2d-4f54-8527-2da29d70d087', NULL, 'USDT', NULL, NULL, 5910.00000000, 0.00000000, '08fcb965-f532-45be-9259-a5b1fff9f62f', 'Internal', NULL, NULL, 'completed', '2024-02-27 05:07:49', '2024-02-27 05:07:49'),
('11b7e3f9-0d77-4d5b-bb42-1e5738adb303', 'c71eeafd-849d-4cb7-8275-1ebcd9ac93d8', '27aa98b9-9c31-4910-a21b-ca2032fb93de', NULL, 'TRX', NULL, NULL, 20002.00000000, 0.00000000, '9de79e98-c84c-4378-8c1d-965c546dfaa6', 'Internal', NULL, NULL, 'completed', '2023-12-04 18:00:52', '2023-12-04 18:00:52'),
('12baf7b3-c427-46a4-827b-cb2d4e24f4ea', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'c57baee2-7a33-46f7-8a14-41f2e70df233', 'dc598cda-202d-4801-9045-1e9ee333064a', 'USD', NULL, NULL, 120000.00000000, 1.00000000, NULL, 'BankApi', NULL, NULL, 'pending', '2023-08-20 12:52:11', '2023-08-20 12:52:11'),
('14154668-cc85-43da-b734-748b8fc6b1e5', 'd86b3a4d-3a57-426e-8e1e-95a6be996bb5', '0812e984-4b48-4798-b7c9-38ed5ab273ac', NULL, 'USDT', NULL, NULL, 11000.00000000, 0.00000000, '469d4c13-bd99-4bf6-844d-adc040882ed8', 'Internal', NULL, NULL, 'completed', '2023-07-19 11:03:13', '2023-07-19 11:03:13'),
('151aff6d-bd65-457e-ad5a-37f5195083ba', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'c57baee2-7a33-46f7-8a14-41f2e70df233', NULL, 'USD', NULL, NULL, 1000.00000000, 1.00000000, NULL, 'ADVCashApi', NULL, NULL, 'pending', '2023-05-30 11:57:54', '2023-05-30 11:57:54'),
('1560d2a9-d89a-4247-8e68-8dba9d35b34a', '44d4809d-28e1-4685-b15c-dc11134fdf1d', '5dd3cee3-e14a-4755-bb98-bfa7c9355781', NULL, 'TRX', NULL, NULL, 4500.00000000, 0.00000000, 'eec15dcd-9a5f-4131-a5dc-866b5c819a75', 'Internal', NULL, NULL, 'completed', '2023-07-24 13:39:04', '2023-07-24 13:39:04'),
('16371c17-566f-40c5-a501-7a0c12d41408', '7109c567-63f7-4d17-a2d5-a518e560408e', '119f084a-1c57-4e94-99be-e1b0498dabd7', NULL, 'USD', NULL, NULL, 50.00000000, 0.00000000, '6cb9447f-4997-4d7e-8d44-352eb13971bc', 'Internal', NULL, NULL, 'completed', '2023-08-07 14:02:55', '2023-08-07 14:02:55'),
('18415c78-aed0-4024-ad7a-a768172385e5', 'fb35867d-1db8-4b6d-9f19-54ab0b2ddab1', '085718f3-3fb3-452e-a86d-1133cc05e551', NULL, 'USDT', NULL, NULL, 2500.00000000, 0.00000000, '37e1673c-3ce4-46df-aed2-b70fa814c43f', 'Internal', NULL, NULL, 'completed', '2023-06-01 14:39:40', '2023-06-01 14:39:40'),
('18b4342c-169c-41e3-8abb-780b31889e3a', '4737ffad-8afe-4bbe-9c76-9ece9d55068f', '4e683ec8-2bad-433c-92bc-aabc263a1357', NULL, 'USD', NULL, NULL, 560000.00000000, 0.00000000, '60bc2e36-8bae-47ef-8abd-4ef616354825', 'Internal', NULL, NULL, 'completed', '2023-06-15 23:18:30', '2023-06-15 23:18:30'),
('18f78a81-f870-4586-a7dd-20a8cb469d69', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'c57baee2-7a33-46f7-8a14-41f2e70df233', NULL, 'USD', NULL, NULL, 9999999.00000000, 0.00000000, 'f55a0831-55a5-4f54-bcb8-399f29e84733', 'Internal', NULL, NULL, 'completed', '2023-05-31 12:22:06', '2023-05-31 12:22:06'),
('19dd5986-a353-4331-9f05-59910e964c53', '47eaf168-5901-4ccb-8b9c-d7f9c754ed04', '0debca32-1c38-48dc-8a20-e209dba57c9c', NULL, 'USD', NULL, NULL, 5000.00000000, 0.00000000, '55e54b89-b6ec-4498-9ab9-daece09017fb', 'Internal', NULL, NULL, 'completed', '2023-05-31 10:45:57', '2023-05-31 10:45:57'),
('1bea62aa-a657-4217-9b19-726d068ea4a8', 'cf37d061-aa9c-460d-9701-66439afc812d', 'da467ddf-db51-46c5-a055-0d643b1d1512', NULL, 'USDT', NULL, NULL, 24000.00000000, 0.00000000, 'a37ce33d-19d5-4d58-8353-16e097119b66', 'Internal', NULL, NULL, 'completed', '2023-06-13 13:24:15', '2023-06-13 13:24:15'),
('1c3e3c4c-bbba-43f5-94bb-705482bac931', 'e7862d9c-fba8-4509-b59b-a4cb4f71ba04', 'e94973ab-1eb2-4cf0-9e47-0998102fc527', NULL, 'USDT', NULL, NULL, 2200.00000000, 0.00000000, 'ba430840-01ef-493f-a284-fecede46c64f', 'Internal', NULL, NULL, 'completed', '2023-07-26 09:03:01', '2023-07-26 09:03:01'),
('1d5be6ff-1b7c-4c98-ba39-eef6f796d618', '4737ffad-8afe-4bbe-9c76-9ece9d55068f', 'e2ebf47a-5181-4ba7-bbb2-1cc94a7a76eb', NULL, 'USDT', NULL, NULL, 35000.00000000, 0.00000000, '6d7555b4-7e2e-41b8-a1b0-c143aa271a09', 'Internal', NULL, NULL, 'completed', '2023-11-22 09:13:55', '2023-11-22 09:13:55'),
('1e8a6ff5-2925-4b9f-941a-2d42bdaa67bc', 'a502eb20-d81c-4f3e-a56f-11444fe1e4cb', '6fb5edde-2fc1-4f04-9680-775e9babaf13', NULL, 'IRT', NULL, NULL, 50000.00000000, 0.00000000, NULL, 'MellatApi', NULL, NULL, 'pending', '2023-08-28 16:36:16', '2023-08-28 16:36:16'),
('22a71145-4300-44f8-ad3a-6c65d99edd7f', 'd2b09976-3be3-43e8-81ef-d0dd81784cdf', '19692457-7150-4dbb-84bf-040c0bbba1de', NULL, 'BTC', NULL, NULL, 1000.00000000, 0.00000000, '18a9aa6b-d07c-46c1-8db1-c7a733199b4b', 'Internal', NULL, NULL, 'completed', '2023-11-23 00:10:01', '2023-11-23 00:10:01'),
('24a64cf3-9f11-4973-a533-c4204858ab0d', 'a502eb20-d81c-4f3e-a56f-11444fe1e4cb', '6fb5edde-2fc1-4f04-9680-775e9babaf13', NULL, 'IRT', NULL, NULL, 500000.00000000, 0.00000000, NULL, 'MellatApi', NULL, NULL, 'pending', '2023-08-28 16:35:59', '2023-08-28 16:35:59'),
('254b1195-da5d-409f-8d05-3840f3e84f6b', '60145862-0641-4106-af67-8de47b916abe', '3a810fb5-9e85-4f2d-81d1-b169576f349f', NULL, 'USDT', NULL, NULL, 42300.00000000, 0.00000000, 'f6471d55-f071-4b07-98e2-c37a3887893c', 'Internal', NULL, NULL, 'completed', '2023-10-23 14:23:41', '2023-10-23 14:23:41'),
('28a24d1c-1f75-41fe-b977-5d1d83735e9d', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', '7dc9fe74-fa5b-4e1e-aeee-6f9671fc14c0', NULL, 'IRT', NULL, NULL, 40000.00000000, 0.00000000, NULL, 'MellatApi', NULL, NULL, 'pending', '2023-10-18 11:15:22', '2023-10-18 11:15:22'),
('29b8b128-4a5c-470e-bd36-4dcef817dfd2', 'd2b09976-3be3-43e8-81ef-d0dd81784cdf', '17fec260-788b-494c-9f6f-99403346bdba', NULL, 'USD', NULL, NULL, 2000.00000000, 0.00000000, '696931ee-9fd2-4013-b0d7-fdf490f4fd20', 'Internal', NULL, NULL, 'completed', '2023-11-23 00:10:18', '2023-11-23 00:10:18'),
('29d6a803-8ba5-495e-92c0-6dd80b9092f3', '52523c96-98e6-4e75-a1d8-e3cf094993a1', 'b219629f-060f-49ba-b129-c241d80d853e', NULL, 'TRX', NULL, NULL, 4.00000000, 0.00000000, '0ae0a018-dc40-478f-ac19-9faa176b62fa', 'Internal', NULL, NULL, 'completed', '2023-08-25 07:54:19', '2023-08-25 07:54:19'),
('2d7ef0ff-a20c-4692-a1db-ec4403fbc9b3', '6cd1a9e7-a910-43c8-a930-95dcb2c8edca', '1e4b9ed7-9346-498d-8627-f3abd95e53b5', NULL, 'USD', NULL, NULL, 200.00000000, 0.00000000, '3046604b-bbdb-47f1-8a30-2523d4719c39', 'Internal', NULL, NULL, 'completed', '2023-08-07 18:14:20', '2023-08-07 18:14:20'),
('2db5461f-5136-48ea-b349-542841d9de49', '6cd1a9e7-a910-43c8-a930-95dcb2c8edca', 'ad1d11c1-14e1-404b-b36d-4bba257096f3', NULL, 'USDT', NULL, NULL, 200.00000000, 0.00000000, 'c09bb847-12cf-4495-bcf6-50ee8aab38c2', 'Internal', NULL, NULL, 'completed', '2023-08-07 18:14:36', '2023-08-07 18:14:36'),
('2df235fd-3132-4d97-894b-ed7f8e2c4975', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', '7dc9fe74-fa5b-4e1e-aeee-6f9671fc14c0', NULL, 'IRT', NULL, NULL, 2000.00000000, 0.00000000, NULL, 'MellatApi', NULL, NULL, 'pending', '2023-07-16 06:41:15', '2023-07-16 06:41:15'),
('300c11f1-69ce-42dd-8926-a0e126daeda7', 'd2b09976-3be3-43e8-81ef-d0dd81784cdf', '17fec260-788b-494c-9f6f-99403346bdba', NULL, 'USD', NULL, NULL, 220.00000000, 0.00000000, '97362d8d-79f0-47c1-9bbd-5a1f9e49c3a1', 'Internal', NULL, NULL, 'completed', '2023-07-28 05:58:57', '2023-07-28 05:58:57'),
('382f804d-39b6-4f70-ac76-5568da7008fa', 'b9ec7d63-015c-4814-b253-eb1d45eae4dd', '6696fd1a-f277-4f58-a4fc-a596e47e2818', NULL, 'TRX', NULL, NULL, 2.00000000, 0.00000000, '3be985b1-1e17-4f2a-914c-1086f0f37a6a', 'Internal', NULL, NULL, 'completed', '2023-06-20 13:47:54', '2023-06-20 13:47:54'),
('384bfe6d-01fe-415b-9b80-3954f94cdf9f', '4737ffad-8afe-4bbe-9c76-9ece9d55068f', 'df993f33-7dd6-4671-b005-90c7cb686999', NULL, 'TRX', NULL, NULL, 2.00000000, 0.00000000, '5ce4183a-8b9d-44be-8085-db7467ae6dd4', 'Internal', NULL, NULL, 'completed', '2023-06-14 13:50:21', '2023-06-14 13:50:21'),
('3904e6eb-806b-4cef-a9ef-dc4d18addc0d', 'e7862d9c-fba8-4509-b59b-a4cb4f71ba04', 'f5920b57-591a-461c-ab34-3d0443233bbf', NULL, 'BTC', NULL, NULL, 152000.00000000, 0.00000000, '9840ac89-1a95-42a0-be60-b5287a6fb389', 'Internal', NULL, NULL, 'completed', '2023-09-11 14:47:15', '2023-09-11 14:47:15'),
('39b49763-d43c-4cb9-931b-5671385d6f9e', '52523c96-98e6-4e75-a1d8-e3cf094993a1', 'bdea2b85-b027-46fb-9cd5-de4c94f293c8', NULL, 'USDT', NULL, NULL, 25000.00000000, 0.00000000, '8e8ad2a8-1155-4ce4-a67d-e42575211174', 'Internal', NULL, NULL, 'completed', '2023-11-14 10:02:17', '2023-11-14 10:02:17'),
('3b693db2-3346-47a8-a442-4fdba6f320f0', 'e7862d9c-fba8-4509-b59b-a4cb4f71ba04', 'e94973ab-1eb2-4cf0-9e47-0998102fc527', NULL, 'USDT', NULL, NULL, 100000.00000000, 0.00000000, '1c8b539e-4f6e-42e7-ad2b-6c30c0f4820a', 'Internal', NULL, NULL, 'completed', '2024-02-06 14:01:52', '2024-02-06 14:01:52'),
('3f73107e-6909-40f9-a7e3-ce95cd181b08', 'd2b09976-3be3-43e8-81ef-d0dd81784cdf', '17fec260-788b-494c-9f6f-99403346bdba', NULL, 'USD', NULL, NULL, 1020.00000000, 0.00000000, 'd66144e1-9560-4602-bf93-d45652ce0fe5', 'Internal', NULL, NULL, 'completed', '2023-07-26 10:03:29', '2023-07-26 10:03:29'),
('41bcacff-4fe8-433b-ba1c-37832fb3f8f6', '01bac2f0-2e3c-4116-a7fb-61c4d149a2e6', '214a358e-3d42-4d9e-beee-cd4898384c6e', NULL, 'USDT', NULL, NULL, 1750.00000000, 0.00000000, '658bde48-8190-424b-a5d5-ed0587fdf6eb', 'Internal', NULL, NULL, 'completed', '2023-06-12 10:22:59', '2023-06-12 10:22:59'),
('42287a20-a45c-4e37-a06d-cdb08a0e4004', 'd2b09976-3be3-43e8-81ef-d0dd81784cdf', 'a26c7e0a-7f6a-4c80-8a01-8b3d3ed076c8', NULL, 'TRX', NULL, NULL, 60.00000000, 0.00000000, '38410dc7-75aa-425d-8921-e64b9407529f', 'Internal', NULL, NULL, 'completed', '2023-11-23 00:12:34', '2023-11-23 00:12:34'),
('44543abe-5e77-4a4c-a59c-c1ef2c1c025b', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', '7dc9fe74-fa5b-4e1e-aeee-6f9671fc14c0', '113d42ba-abbc-40e5-aa2c-52211c8502aa', 'IRT', NULL, NULL, 120000.00000000, 0.00000000, NULL, 'BankApi', NULL, NULL, 'pending', '2023-08-20 12:48:48', '2023-08-20 12:48:48'),
('44be3f18-300b-4510-a841-a960d1342753', '4737ffad-8afe-4bbe-9c76-9ece9d55068f', '4e683ec8-2bad-433c-92bc-aabc263a1357', NULL, 'USD', NULL, NULL, 35000.00000000, 0.00000000, 'bfa704a4-6065-4aa7-8710-86b28e9c67b4', 'Internal', NULL, NULL, 'completed', '2023-11-22 09:13:30', '2023-11-22 09:13:30'),
('484726e5-6975-448a-ae86-af71ec5c89a5', 'e7862d9c-fba8-4509-b59b-a4cb4f71ba04', 'e94973ab-1eb2-4cf0-9e47-0998102fc527', NULL, 'USDT', NULL, NULL, 155000.00000000, 0.00000000, 'edeea77d-f763-4f86-aa78-6cbb47ea909d', 'Internal', NULL, NULL, 'completed', '2023-07-25 05:21:32', '2023-07-25 05:21:32'),
('4867b722-7ba1-48b5-b361-40bea95df365', 'c71eeafd-849d-4cb7-8275-1ebcd9ac93d8', '12848a5b-5c2d-4f54-8527-2da29d70d087', NULL, 'USDT', NULL, NULL, 5450.00000000, 0.00000000, 'fee9698e-4bf0-4423-81c3-6b60339c8b7c', 'Internal', NULL, NULL, 'completed', '2024-02-27 05:06:30', '2024-02-27 05:06:30'),
('48aaec0a-8a9e-4056-b119-fc5089a6cbea', 'd2b09976-3be3-43e8-81ef-d0dd81784cdf', 'f952cecc-9c95-44a0-bfbf-5c04d4573a3c', NULL, 'USDT', NULL, NULL, 891000.00000000, 0.00000000, 'b6e16c03-c1f9-4ce9-8b2a-dc6da9c9f437', 'Internal', NULL, NULL, 'completed', '2023-11-23 00:11:26', '2023-11-23 00:11:26'),
('498d4282-92ef-4e88-9832-da241c0c4107', '60145862-0641-4106-af67-8de47b916abe', '3a810fb5-9e85-4f2d-81d1-b169576f349f', NULL, 'USDT', NULL, NULL, 29000.00000000, 0.00000000, '6a9cf380-6aed-4e6f-889e-66ed74646013', 'Internal', NULL, NULL, 'completed', '2023-06-05 09:55:40', '2023-06-05 09:55:40'),
('4b6c457c-a311-49a8-916f-457bbbd249bc', '60145862-0641-4106-af67-8de47b916abe', '65d81edd-036b-494f-beda-c816811fa041', NULL, 'BTC', NULL, NULL, 25000.00000000, 0.00000000, '4f4d2dd3-9b5d-4b6a-9b42-b77c756684cb', 'Internal', NULL, NULL, 'completed', '2023-12-14 00:41:17', '2023-12-14 00:41:17'),
('4cabe7e6-c7fc-48c2-8742-ab6a747b8a36', '467671a6-55bc-4527-ba1f-d0d2b562fca4', '947727e3-4cb6-4088-85f3-de9e0b551cd8', NULL, 'USDT', NULL, NULL, 11500.00000000, 0.00000000, '7b14cdbc-67bb-42b4-90f7-f81b7d0fd6d7', 'Internal', NULL, NULL, 'completed', '2023-06-06 14:17:59', '2023-06-06 14:17:59'),
('4ce2b5a9-6113-44ef-beff-deb1d499f3b3', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', '7dc9fe74-fa5b-4e1e-aeee-6f9671fc14c0', NULL, 'IRT', NULL, NULL, 40000.00000000, 0.00000000, NULL, 'MellatApi', NULL, NULL, 'pending', '2023-10-18 11:14:53', '2023-10-18 11:14:53'),
('4da715aa-b120-4201-ad72-78cfc2954191', '89e4087c-1287-47c9-b101-f87da3cd0acb', 'e3907feb-7a3c-4d55-92d0-b9995708ef5e', NULL, 'USD', NULL, NULL, 10000.00000000, 0.00000000, 'f7633222-be15-48f7-a4dc-7604230521fc', 'Internal', NULL, NULL, 'completed', '2024-03-14 12:53:09', '2024-03-14 12:53:09'),
('4e245c2e-88fe-497b-8338-67ea41e0cb38', 'a502eb20-d81c-4f3e-a56f-11444fe1e4cb', '89dd6f6d-370d-447a-8138-bc76d57ee6c8', NULL, 'BTC', NULL, 'TSZsQpLG8BSXAtkhRGJzFsXDERTrk3Npia', 70.00000000, 0.00000000, 'ddd1413a-cb49-4e7f-b2f4-491d77e472aa', 'Internal', NULL, NULL, 'completed', '2023-07-18 13:27:48', '2023-07-18 13:27:48'),
('4eddf531-0c57-4f06-ac7b-40f4d7d82456', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', '7dc9fe74-fa5b-4e1e-aeee-6f9671fc14c0', NULL, 'IRT', NULL, NULL, 40000.00000000, 0.00000000, NULL, 'MellatApi', NULL, NULL, 'pending', '2023-10-18 11:09:35', '2023-10-18 11:09:35'),
('4f55dd77-c895-4dea-9182-50f30e59416d', 'e7862d9c-fba8-4509-b59b-a4cb4f71ba04', 'e94973ab-1eb2-4cf0-9e47-0998102fc527', NULL, 'USDT', NULL, NULL, 15000.00000000, 0.00000000, 'd5784510-091f-4d7e-8093-06fc7e5a6fdb', 'Internal', NULL, NULL, 'completed', '2024-02-06 14:01:34', '2024-02-06 14:01:34'),
('4f648407-974b-427f-bc60-68d2702be54c', '36f5887f-2b9b-4144-879c-9be2cff7e466', '80e72669-d4f6-4026-bb95-78a67c2615aa', NULL, 'ETH', NULL, NULL, 2320.00000000, 0.00000000, '6044d446-9b7b-4704-a9a2-5bf9c4682e1c', 'Internal', NULL, NULL, 'completed', '2023-06-24 13:58:51', '2023-06-24 13:58:51'),
('503cb05a-286d-4e3d-9999-3035b5f22166', '52523c96-98e6-4e75-a1d8-e3cf094993a1', 'b219629f-060f-49ba-b129-c241d80d853e', NULL, 'TRX', NULL, NULL, 44554545454.00000000, 0.00000000, 'a6567729-37a5-404e-acc1-d00abaf7da49', 'Internal', NULL, NULL, 'completed', '2023-09-09 13:55:56', '2023-09-09 13:55:56'),
('511da168-08f0-4ab4-abb4-667372555b04', 'da77601a-40e5-4bb1-b584-2b82bd26370f', '6713e61c-bac5-4338-a685-d886803938ec', NULL, 'TRX', NULL, NULL, 2.00000000, 0.00000000, 'bb0839af-cdf4-4211-b7bd-e00f99b5235e', 'Internal', NULL, NULL, 'completed', '2023-07-18 12:18:02', '2023-07-18 12:18:02'),
('523676fc-b3d7-49b3-af71-3ca2a76701c8', 'd2b09976-3be3-43e8-81ef-d0dd81784cdf', 'f952cecc-9c95-44a0-bfbf-5c04d4573a3c', NULL, 'USDT', NULL, NULL, 7000.00000000, 0.00000000, 'b8f716c0-94dd-4d40-b0cd-392be26ae267', 'Internal', NULL, NULL, 'completed', '2023-11-23 00:11:46', '2023-11-23 00:11:46'),
('53fb7362-cc6a-4e13-9d5d-28e2f0bdd3c5', 'b9ec7d63-015c-4814-b253-eb1d45eae4dd', 'cc047bb6-f19f-4f51-8424-24a32151f612', NULL, 'USDT', NULL, NULL, 150000.00000000, 0.00000000, '67d7d78b-24d5-4b07-af68-f82584f97c31', 'Internal', NULL, NULL, 'completed', '2023-10-11 17:00:29', '2023-10-11 17:00:29'),
('5411d444-0ab7-4037-8594-b2cbd1d65deb', '32769d8c-4dca-40d5-83ec-99b68df4b130', '7f1a422b-cc33-4b19-b1ec-d58c90539fc7', NULL, 'USD', NULL, NULL, 10000.00000000, 0.00000000, 'cceb2434-2496-44ed-b48e-48487b1b6264', 'Internal', NULL, NULL, 'completed', '2023-05-30 10:16:26', '2023-05-30 10:16:26'),
('552b3fa5-d26a-4e91-a205-871a81c57d91', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', '7dc9fe74-fa5b-4e1e-aeee-6f9671fc14c0', '40017e9a-c2a2-4e08-a2cc-125e2916c072', 'IRT', NULL, NULL, 7777.00000000, 0.00000000, NULL, 'BankApi', NULL, NULL, 'pending', '2023-10-19 04:37:06', '2023-10-19 04:37:06'),
('583fe493-cff1-45ec-94a3-2d4bf1822c98', '6dd2b333-abab-4c57-b4f5-d33e4dd70f39', '90379bb0-c028-433b-ac9e-8790a62652cd', NULL, 'BTC', NULL, NULL, 10000000000.00000000, 0.00000000, 'c902c223-08c2-4a02-9cae-f113184c2df1', 'Internal', NULL, NULL, 'completed', '2023-08-04 16:52:38', '2023-08-04 16:52:38'),
('585f6c46-113b-4d8b-9bda-3df41a69b3fb', 'd2b09976-3be3-43e8-81ef-d0dd81784cdf', 'a26c7e0a-7f6a-4c80-8a01-8b3d3ed076c8', NULL, 'TRX', NULL, NULL, 18900.00000000, 0.00000000, 'f6746929-99d7-49a0-b177-9fef73d5c66b', 'Internal', NULL, NULL, 'completed', '2023-11-23 00:12:21', '2023-11-23 00:12:21'),
('5b0e87be-994d-4408-a8ef-bbd655d80d40', '36f5887f-2b9b-4144-879c-9be2cff7e466', 'f551b80e-7352-4da9-96dd-1d9c823eb976', NULL, 'USDT', NULL, 'TLBxK5CDtYuzghrL6rb6dEEc35HyzhGm56', 80000.00000000, 0.00000000, '5ded6838-a8ef-473e-97bd-7a088f39d815', 'Internal', NULL, NULL, 'completed', '2023-06-22 14:03:56', '2023-06-22 14:03:56'),
('5c7f37f4-96b0-4ddb-9d5a-0a8864639bf1', 'db5d841b-d90a-4437-957a-c7fb5fa86319', '5b63f433-1049-4ae0-a36c-b9f31e7f6a3b', NULL, 'DOGE', NULL, NULL, 99999999999.99999999, 0.00000000, 'dd90057e-155e-48d6-ade9-6bd4bfa97d4c', 'Internal', NULL, NULL, 'completed', '2023-05-28 09:00:13', '2023-05-28 09:00:13'),
('5dc556ce-f7f9-46fd-8f18-8e41bbb4fefa', '36f5887f-2b9b-4144-879c-9be2cff7e466', '80e72669-d4f6-4026-bb95-78a67c2615aa', NULL, 'ETH', NULL, NULL, 2100.00000000, 0.00000000, 'c577c51e-d377-4c00-985c-6e15e9f47af8', 'Internal', NULL, NULL, 'completed', '2023-06-22 22:43:52', '2023-06-22 22:43:52'),
('5e19dda3-b9fb-4fa4-8594-da1f664122c3', 'db5d841b-d90a-4437-957a-c7fb5fa86319', 'ab388bc6-57e0-4ee8-8c32-cbb183ec708a', NULL, 'BTC', NULL, NULL, 99999999999.99999999, 0.00000000, '901c3f9e-d7db-4155-8fef-2032c55933d5', 'Internal', NULL, NULL, 'completed', '2023-05-28 09:00:40', '2023-05-28 09:00:40'),
('5fa61ed3-5c73-43aa-9fbc-64386698c1f7', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', '7dc9fe74-fa5b-4e1e-aeee-6f9671fc14c0', '321c30d1-04c3-495a-ab0c-56ef278e0c42', 'IRT', '14ea785d-94b2-464b-9723-8b3a4af60cc6', NULL, 1000000.00000000, 0.00000000, NULL, 'BankApi', NULL, '_5fa61ed3-5c73-43aa-9fbc-64386698c1f7_.png', 'reviewing', '2023-05-28 08:57:12', '2023-05-28 08:57:29'),
('606faab4-bb28-4f6a-a0b0-afc6284f58a8', 'e7862d9c-fba8-4509-b59b-a4cb4f71ba04', '68a6ef97-04e9-4045-a3ab-06f42861174b', NULL, 'USD', NULL, NULL, 43000.00000000, 0.00000000, '6309836a-c43a-4908-a6d0-3322bf2aec88', 'Internal', NULL, NULL, 'completed', '2024-02-06 14:01:05', '2024-02-06 14:01:05'),
('61c3d9d1-b1a7-4189-be9f-a96dcb9826eb', '6dd2b333-abab-4c57-b4f5-d33e4dd70f39', '90379bb0-c028-433b-ac9e-8790a62652cd', NULL, 'BTC', NULL, NULL, 29000.00000000, 0.00000000, 'ada5ee2c-8e68-412f-8769-0213ae25cca3', 'Internal', NULL, NULL, 'completed', '2023-08-04 16:50:56', '2023-08-04 16:50:56'),
('62425c29-32b5-4373-9e07-c121c8cd2c74', 'db5d841b-d90a-4437-957a-c7fb5fa86319', 'bc3c2275-405e-42e6-a3dd-62b9fab90616', NULL, 'ETH', NULL, NULL, 99999999999.99999999, 0.00000000, 'a576ef19-4135-4ceb-9fc6-78f06db9c200', 'Internal', NULL, NULL, 'completed', '2023-05-28 08:58:45', '2023-05-28 08:58:45'),
('629ed1cc-5d6d-4d54-8540-264a50e24297', 'e7862d9c-fba8-4509-b59b-a4cb4f71ba04', '68a6ef97-04e9-4045-a3ab-06f42861174b', NULL, 'USD', NULL, NULL, 478.00000000, 0.00000000, 'add3c2aa-2fe4-484d-b70b-68289e6173dd', 'Internal', NULL, NULL, 'completed', '2023-07-25 06:28:03', '2023-07-25 06:28:03'),
('64c857c3-3e7d-43bb-aa46-5c76a32effe8', 'd2b09976-3be3-43e8-81ef-d0dd81784cdf', '12e79621-7db0-4a62-8b9d-250a5ff1b9ef', NULL, 'ETH', NULL, NULL, 14960.00000000, 0.00000000, '2161a4b9-73ec-4be5-ae66-9d3416a95dae', 'Internal', NULL, NULL, 'completed', '2023-07-28 05:59:40', '2023-07-28 05:59:40'),
('64f8b7e3-21ed-4c0f-83ff-19ebae9a3a2e', 'c71eeafd-849d-4cb7-8275-1ebcd9ac93d8', '12848a5b-5c2d-4f54-8527-2da29d70d087', NULL, 'USDT', NULL, NULL, 250000.00000000, 0.00000000, '5283a5ea-2431-40f0-bcd3-abf6c4aa6835', 'Internal', NULL, NULL, 'completed', '2024-02-27 05:05:35', '2024-02-27 05:05:35'),
('688bd669-c30f-4f2b-aef1-7a99f161aad2', '6dd2b333-abab-4c57-b4f5-d33e4dd70f39', 'bbcdf168-854d-4111-b37a-29fe51d35798', NULL, 'USDT', NULL, NULL, 200.00000000, 0.00000000, '81ce3580-b740-4b5b-aad9-865404cca539', 'Internal', NULL, NULL, 'completed', '2023-08-04 16:41:52', '2023-08-04 16:41:52'),
('68efb7c1-9a70-4986-bd48-4c55d07bc1cc', 'd2b09976-3be3-43e8-81ef-d0dd81784cdf', 'a26c7e0a-7f6a-4c80-8a01-8b3d3ed076c8', NULL, 'TRX', NULL, NULL, 12960.00000000, 0.00000000, 'd5cbd22d-9b3a-4d6d-a07d-48ca61641d52', 'Internal', NULL, NULL, 'completed', '2023-07-28 06:00:09', '2023-07-28 06:00:09'),
('6a67e1e9-d254-400f-b61f-37e24cc4aee3', 'd2b09976-3be3-43e8-81ef-d0dd81784cdf', 'f952cecc-9c95-44a0-bfbf-5c04d4573a3c', NULL, 'USDT', NULL, NULL, 12960.00000000, 0.00000000, '49cf71f4-44c2-4c3a-a74e-52055a2e0e14', 'Internal', NULL, NULL, 'completed', '2023-07-26 11:31:23', '2023-07-26 11:31:23'),
('6aba3184-06fa-44b3-92bf-cfed93673473', 'd2b09976-3be3-43e8-81ef-d0dd81784cdf', '17fec260-788b-494c-9f6f-99403346bdba', NULL, 'USD', NULL, NULL, 760.00000000, 0.00000000, '40f6207d-538a-47a3-8842-d1ef6d4352be', 'Internal', NULL, NULL, 'completed', '2023-07-26 11:30:40', '2023-07-26 11:30:40'),
('6b15bbc5-1a4b-4de8-aeb5-204d89da90d2', '6800875b-c059-49a2-aec7-8612c7d402a1', 'eec25138-ee20-43cb-b755-ad188308dbaf', NULL, 'USD', NULL, NULL, 95000.00000000, 0.00000000, '85d7def7-919e-4cf4-9fd5-b5ab9606c236', 'Internal', NULL, NULL, 'completed', '2023-11-22 17:14:03', '2023-11-22 17:14:03'),
('6c058387-db5e-40fc-9ad4-780dee94ff52', '1ac9db2f-613b-4351-ba36-aa8a8e502079', '4fe673c7-d0f3-4700-9295-410baeace069', NULL, 'ETH', NULL, NULL, 88000.00000000, 0.00000000, '38731b7f-d45a-438e-a794-1564afbd3de4', 'Internal', NULL, NULL, 'completed', '2023-06-02 16:37:11', '2023-06-02 16:37:11'),
('6c7f0395-95a4-40d5-8600-64cab53d0c40', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', '7dc9fe74-fa5b-4e1e-aeee-6f9671fc14c0', '40017e9a-c2a2-4e08-a2cc-125e2916c072', 'IRT', NULL, NULL, 1500000.00000000, 0.00000000, NULL, 'BankApi', NULL, NULL, 'completed', '2024-03-14 12:55:44', '2024-03-14 12:55:44'),
('6c91d789-e7cf-485f-aa11-49d4a797f932', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', '7dc9fe74-fa5b-4e1e-aeee-6f9671fc14c0', NULL, 'IRT', NULL, NULL, 20000.00000000, 0.00000000, NULL, 'MellatApi', NULL, NULL, 'pending', '2023-07-17 05:57:12', '2023-07-17 05:57:12'),
('6fa4e4ef-f818-46c1-969f-11d26695c55a', '60145862-0641-4106-af67-8de47b916abe', '104ac946-2fc9-4662-8566-f4683b619de8', NULL, 'TRX', NULL, NULL, 2.00000000, 0.00000000, '355034d3-bcef-4fa2-be36-fdb3300c3ccb', 'Internal', NULL, NULL, 'completed', '2023-06-05 09:55:16', '2023-06-05 09:55:16'),
('719a421c-4977-4173-8671-d0e374cfc6d0', 'cb74f45c-280c-42fd-a06e-a4672280c040', '8b679b09-db4b-4acf-88dd-09765bc4d08d', NULL, 'USDT', NULL, NULL, 4700.00000000, 0.00000000, '03d84081-4363-4b04-bd8e-2abb302bb1a2', 'Internal', NULL, NULL, 'completed', '2023-12-18 16:01:46', '2023-12-18 16:01:46'),
('73f12a75-f855-41db-9fe6-8cf8f7b7f8a9', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'c57baee2-7a33-46f7-8a14-41f2e70df233', '113d42ba-abbc-40e5-aa2c-52211c8502aa', 'USD', NULL, NULL, 120000.00000000, 1.00000000, NULL, 'BankApi', NULL, NULL, 'pending', '2023-08-20 12:51:28', '2023-08-20 12:51:28'),
('740d2f02-3767-4a04-9043-ef598d7d11d2', '794254a9-ab67-4e67-8f36-861c423c29a8', 'd6e7ca73-e0bf-418b-82f6-383a2dc372e7', NULL, 'USD', NULL, NULL, 15000.00000000, 0.00000000, '94a85d0b-07e6-44fe-a3d2-907a04508c2c', 'Internal', NULL, NULL, 'completed', '2023-09-17 18:26:59', '2023-09-17 18:26:59'),
('75ea48d6-5dd4-456a-9ea7-82fcec58530a', 'c71eeafd-849d-4cb7-8275-1ebcd9ac93d8', '80a2d97c-c8b3-4557-ba4b-5468c517f05f', NULL, 'ETH', NULL, NULL, 250000.00000000, 0.00000000, 'a2b70973-8a45-484a-a7b9-3865522ece4d', 'Internal', NULL, NULL, 'completed', '2023-06-04 15:10:59', '2023-06-04 15:10:59'),
('76cf18f7-2186-49a4-9cdc-1c0fe91e4de3', 'b9ec7d63-015c-4814-b253-eb1d45eae4dd', '0aac3f7d-049d-49da-b7d1-82bbb62d0d03', NULL, 'USD', NULL, NULL, 10000.00000000, 0.00000000, '7176b815-989c-4822-99f8-166c2b86f05f', 'Internal', NULL, NULL, 'completed', '2023-06-20 13:48:13', '2023-06-20 13:48:13'),
('79528309-f0a6-4234-81bb-e405adf96dd9', 'ecbb1278-fb14-4952-8ef9-fc77aef93d3d', '31e4e41d-c8ff-45f3-9c86-92645c96e43a', NULL, 'USDT', NULL, NULL, 43000.00000000, 0.00000000, '02d8e157-1a81-4c9c-b517-cdeb3d8fa6cb', 'Internal', NULL, NULL, 'completed', '2024-02-06 13:58:29', '2024-02-06 13:58:29'),
('7b6a4c68-4928-461c-b9f8-50b7387b00dd', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', '94da310e-d055-429c-be60-58c33d1679ed', NULL, 'BTC', NULL, 'TSz8ZGBdd8HpWKSYuu8Hk69UgCDc3ktDGW', 100.00000000, 0.00000000, '9e85f2a2-362f-441e-a11c-66b8ce1d9eb0', 'Internal', NULL, NULL, 'completed', '2024-04-09 01:23:15', '2024-04-09 01:23:15'),
('7bc12007-ae48-4c4a-9368-88095c913866', '675d5181-9662-4d5a-8e29-924e2b58b24f', 'a7501efe-18bd-40b9-90c6-007507528e0f', NULL, 'USDT', NULL, NULL, 750.00000000, 0.00000000, 'a0b9e99d-a133-4b2e-8c55-b5c5d3cdc592', 'Internal', NULL, NULL, 'completed', '2023-07-25 15:40:26', '2023-07-25 15:40:26'),
('7c8d8b6c-76ad-4b3c-8dc3-742505cdbc05', '44d4809d-28e1-4685-b15c-dc11134fdf1d', '5dd3cee3-e14a-4755-bb98-bfa7c9355781', NULL, 'TRX', NULL, NULL, 2.00000000, 0.00000000, '81320479-8571-4c54-bcea-9658aea8cd9d', 'Internal', NULL, NULL, 'completed', '2023-07-20 09:59:19', '2023-07-20 09:59:19'),
('7c9d7499-693c-4132-b755-6350ec260480', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', '7dc9fe74-fa5b-4e1e-aeee-6f9671fc14c0', NULL, 'IRT', NULL, NULL, 2000.00000000, 0.00000000, NULL, 'MellatApi', NULL, NULL, 'pending', '2023-07-16 07:04:08', '2023-07-16 07:04:08'),
('8135936a-d1a4-4300-b225-25f1992209c4', 'fb35867d-1db8-4b6d-9f19-54ab0b2ddab1', '085718f3-3fb3-452e-a86d-1133cc05e551', NULL, 'USDT', NULL, NULL, 3000.00000000, 0.00000000, 'b8a9fc69-a49c-4907-8243-a4cf2152a7bf', 'Internal', NULL, NULL, 'completed', '2023-06-01 14:19:23', '2023-06-01 14:19:23'),
('8305ee87-5d4f-4775-afe9-648bdc4678b5', '7109c567-63f7-4d17-a2d5-a518e560408e', '119f084a-1c57-4e94-99be-e1b0498dabd7', NULL, 'USD', NULL, NULL, 10200.00000000, 0.00000000, '218a9861-5088-4f03-acc4-552be1e4b3dc', 'Internal', NULL, NULL, 'completed', '2023-08-11 13:39:12', '2023-08-11 13:39:12'),
('876b420a-e4b1-4fc2-a6e2-e1c508c293e7', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', '7dc9fe74-fa5b-4e1e-aeee-6f9671fc14c0', NULL, 'IRT', NULL, NULL, 40000.00000000, 0.00000000, NULL, 'MellatApi', NULL, NULL, 'pending', '2023-10-18 11:06:08', '2023-10-18 11:06:08'),
('8810e461-4c27-4901-90a5-60039385585f', 'a502eb20-d81c-4f3e-a56f-11444fe1e4cb', '900786ce-ee13-4f34-afb6-69546d96aca3', NULL, 'USD', NULL, NULL, 100.00000000, 1.00000000, NULL, 'PaypalApi', NULL, NULL, 'pending', '2023-08-16 07:18:12', '2023-08-16 07:18:12'),
('88a24b90-c2c5-4c14-be93-e5f6e6168f08', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', '7dc9fe74-fa5b-4e1e-aeee-6f9671fc14c0', NULL, 'IRT', NULL, NULL, 40000.00000000, 0.00000000, NULL, 'MellatApi', NULL, NULL, 'pending', '2023-10-18 11:02:46', '2023-10-18 11:02:46'),
('8be71285-08c8-4d5e-b0e3-f78bae92ccfd', 'a01cd4e5-4cbb-48ab-bfde-2b558ab60d88', '92afcda2-876f-40e9-bba1-e4825ad0df66', NULL, 'USDT', NULL, NULL, 8000.00000000, 0.00000000, '7ab4f278-25ac-4e15-be05-7a43d316f6ce', 'Internal', NULL, NULL, 'completed', '2023-07-20 08:21:28', '2023-07-20 08:21:28'),
('8bf0b960-1f8c-474f-879d-0a77302a75c2', '6eb3595c-031c-4f55-abee-80cf6d8c816b', '105eb3c5-8bcd-4f9f-85aa-cd546ea6390c', NULL, 'USDT', NULL, 'TMwGs2ertTKd9RbEQDccAGgVL9DXYYRbiD', 150000.00000000, 0.00000000, 'd2886b60-b3e5-494c-b5f7-33b361d48aae', 'Internal', NULL, NULL, 'completed', '2023-09-17 18:28:37', '2023-09-17 18:28:37'),
('8c6c82f4-2731-4392-a161-c3590a4f2dc2', '47eaf168-5901-4ccb-8b9c-d7f9c754ed04', '9c0dbb68-ad47-4c8a-b7a7-e008499dae5f', NULL, 'BTC', NULL, NULL, 10000.00000000, 0.00000000, '5351ea49-7ba2-4f96-8475-2d9ece19c309', 'Internal', NULL, NULL, 'completed', '2023-05-31 10:28:17', '2023-05-31 10:28:17'),
('8cf103eb-6fbe-4cd5-aa29-02f691957ac8', 'e7862d9c-fba8-4509-b59b-a4cb4f71ba04', '419692a4-acf5-4bea-8e7e-c1c27689e07c', NULL, 'TRX', NULL, NULL, 2201.00000000, 0.00000000, 'c15dc64c-c28d-40ba-9545-209623e3daf7', 'Internal', NULL, NULL, 'completed', '2023-07-25 06:20:12', '2023-07-25 06:20:12'),
('8db7063a-79c5-4623-bfbd-263a5e45deaa', '675d5181-9662-4d5a-8e29-924e2b58b24f', '4590d2d2-3b0c-41f1-8f21-3e8f528ebce7', NULL, 'USD', NULL, NULL, 750.00000000, 0.00000000, '705b6234-a465-4940-b185-03b9901c0cc7', 'Internal', NULL, NULL, 'completed', '2023-07-25 17:36:52', '2023-07-25 17:36:52'),
('8dfe8e3a-03ff-48d4-a1c3-50b9c7987993', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', '7dc9fe74-fa5b-4e1e-aeee-6f9671fc14c0', NULL, 'IRT', NULL, NULL, 2000.00000000, 0.00000000, NULL, 'MellatApi', NULL, NULL, 'pending', '2023-07-16 06:56:11', '2023-07-16 06:56:11'),
('8e837400-16c6-4aff-84fb-7ca53696995d', 'e7862d9c-fba8-4509-b59b-a4cb4f71ba04', 'f5920b57-591a-461c-ab34-3d0443233bbf', NULL, 'BTC', NULL, NULL, 6000.00000000, 0.00000000, 'fdb9795b-8ab9-439a-94a8-fb060160bcaf', 'Internal', NULL, NULL, 'completed', '2024-02-06 14:02:27', '2024-02-06 14:02:27'),
('8f2c4e99-8c12-4321-82e6-4b7ad5a40bb8', 'e7862d9c-fba8-4509-b59b-a4cb4f71ba04', 'e94973ab-1eb2-4cf0-9e47-0998102fc527', NULL, 'USDT', NULL, NULL, 156000.00000000, 0.00000000, 'bb578315-2c26-4f77-adab-35e8861e6a84', 'Internal', NULL, NULL, 'completed', '2023-08-30 08:56:26', '2023-08-30 08:56:26'),
('94380418-b600-4380-894c-25d453f7c664', 'd2b09976-3be3-43e8-81ef-d0dd81784cdf', 'f952cecc-9c95-44a0-bfbf-5c04d4573a3c', NULL, 'USDT', NULL, NULL, 1000000.00000000, 0.00000000, 'fea644de-d131-47ae-9e67-c9fec483aeb5', 'Internal', NULL, NULL, 'completed', '2023-08-14 11:00:08', '2023-08-14 11:00:08'),
('947a3775-9fe7-4147-b39f-e1dc68ed885a', 'db5d841b-d90a-4437-957a-c7fb5fa86319', 'd6349714-2d19-4e6f-969c-aa32e857ad03', NULL, 'USDT', NULL, NULL, 99999999999.99999999, 0.00000000, '84408786-4340-4ce1-b850-821c49dc7906', 'Internal', NULL, NULL, 'completed', '2023-05-28 09:00:26', '2023-05-28 09:00:26'),
('94a52b45-5a3f-481b-bb0c-7fda618c1ff7', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', '7dc9fe74-fa5b-4e1e-aeee-6f9671fc14c0', NULL, 'IRT', NULL, NULL, 40000.00000000, 0.00000000, NULL, 'MellatApi', NULL, NULL, 'pending', '2023-10-18 11:14:28', '2023-10-18 11:14:28'),
('9824a9b7-e4d2-4001-ad20-6649f7ee05fc', '36f5887f-2b9b-4144-879c-9be2cff7e466', '80e72669-d4f6-4026-bb95-78a67c2615aa', NULL, 'ETH', NULL, NULL, 220.00000000, 0.00000000, '2384b5c0-749c-470c-be74-b9f957c8761c', 'Internal', NULL, NULL, 'completed', '2023-06-24 12:41:43', '2023-06-24 12:41:43'),
('98d22db2-2256-4dcb-a216-e94ff77b8bb3', '4737ffad-8afe-4bbe-9c76-9ece9d55068f', '4e683ec8-2bad-433c-92bc-aabc263a1357', NULL, 'USD', NULL, NULL, 495000.00000000, 0.00000000, '5ce84bf2-67d1-49ce-a552-0ab677a91152', 'Internal', NULL, NULL, 'completed', '2023-11-22 09:13:07', '2023-11-22 09:13:07'),
('9ab3d609-f14e-4bf9-8396-e6e96cb6571c', 'e7862d9c-fba8-4509-b59b-a4cb4f71ba04', '68a6ef97-04e9-4045-a3ab-06f42861174b', NULL, 'USD', NULL, NULL, 78.00000000, 0.00000000, 'ad82e77b-1f1f-428c-bd9b-39b2b81e4dc9', 'Internal', NULL, NULL, 'completed', '2024-02-06 14:03:10', '2024-02-06 14:03:10'),
('9b37826a-bc15-451a-9d85-e466ec25e521', 'cb74f45c-280c-42fd-a06e-a4672280c040', '8b679b09-db4b-4acf-88dd-09765bc4d08d', NULL, 'USDT', NULL, NULL, 35500.00000000, 0.00000000, '6ad87a64-0d95-4d31-90d6-8510f35851ec', 'Internal', NULL, NULL, 'completed', '2023-07-21 16:30:54', '2023-07-21 16:30:54'),
('9b3ce5a8-c02d-4f7c-b90c-b658fdda6f6a', 'c71eeafd-849d-4cb7-8275-1ebcd9ac93d8', '32cb3f68-945d-42c4-8dde-1c9bcf9cc40c', NULL, 'IRT', NULL, NULL, 250000.00000000, 0.00000000, '82fce8cc-77f8-4b66-af06-65cf708a4275', 'Internal', NULL, NULL, 'completed', '2023-06-04 15:03:43', '2023-06-04 15:03:43'),
('9c3b6442-c220-4453-a2be-92b5094b6332', '4737ffad-8afe-4bbe-9c76-9ece9d55068f', '4e683ec8-2bad-433c-92bc-aabc263a1357', NULL, 'USD', NULL, NULL, 35000.00000000, 0.00000000, 'f631c555-3a90-415f-b9aa-5bf611102d27', 'Internal', NULL, NULL, 'completed', '2023-11-22 09:14:12', '2023-11-22 09:14:12'),
('9c8722a8-4d7d-43df-8667-cdc3d17a6a35', 'a502eb20-d81c-4f3e-a56f-11444fe1e4cb', '6fb5edde-2fc1-4f04-9680-775e9babaf13', NULL, 'IRT', NULL, NULL, 100000.00000000, 0.00000000, NULL, 'VandarApi', NULL, NULL, 'pending', '2023-06-02 18:49:20', '2023-06-02 18:49:20'),
('9e79f395-0da8-4cc5-b066-e86f1e38b0f6', '675d5181-9662-4d5a-8e29-924e2b58b24f', '4590d2d2-3b0c-41f1-8f21-3e8f528ebce7', NULL, 'USD', NULL, NULL, 750.00000000, 0.00000000, '9de1f74f-6059-4e1a-af67-1741906192c4', 'Internal', NULL, NULL, 'completed', '2023-07-25 15:41:01', '2023-07-25 15:41:01'),
('9f58a2b5-adb3-4ce8-8ccd-bc9f147cc010', '7109c567-63f7-4d17-a2d5-a518e560408e', 'be6fd108-a213-4e95-9c5b-860ca1316473', NULL, 'TRX', NULL, NULL, 2.00000000, 0.00000000, 'bb443e82-e38e-4fef-9282-ac61b09167ea', 'Internal', NULL, NULL, 'completed', '2023-08-03 17:59:48', '2023-08-03 17:59:48'),
('9faa1f21-1ace-4d23-93de-5da0a1afb0cd', 'cb74f45c-280c-42fd-a06e-a4672280c040', '8b679b09-db4b-4acf-88dd-09765bc4d08d', NULL, 'USDT', NULL, NULL, 35000.00000000, 0.00000000, 'f8fcd525-2fb2-4564-9255-111672fa150f', 'Internal', NULL, NULL, 'completed', '2023-12-18 12:05:09', '2023-12-18 12:05:09'),
('a00984d7-2e59-40fe-93ff-ad55acef241c', 'a502eb20-d81c-4f3e-a56f-11444fe1e4cb', '900786ce-ee13-4f34-afb6-69546d96aca3', NULL, 'USD', NULL, NULL, 500.00000000, 1.00000000, NULL, 'VandarApi', NULL, NULL, 'pending', '2023-06-26 11:35:56', '2023-06-26 11:35:56'),
('a229b663-3682-47a0-94cb-50da7733c66f', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', '7dc9fe74-fa5b-4e1e-aeee-6f9671fc14c0', NULL, 'IRT', NULL, NULL, 2000.00000000, 0.00000000, NULL, 'MellatApi', NULL, NULL, 'pending', '2023-07-16 07:03:04', '2023-07-16 07:03:04'),
('a23145ad-16f8-49eb-b0df-0e68fa4d11ab', '7cde25b7-e520-4fb3-85df-f5fcf89305d3', '64885a8a-f717-42eb-82f8-4701f9cddc6a', NULL, 'USDT', NULL, 'TMVnBuf4R1aJfSQEMK81CqV7sDPZGNywBr', 10000.00000000, 0.00000000, '1156c07f-88e7-402f-ad52-4ca65be14371', 'Internal', NULL, NULL, 'completed', '2023-06-12 13:00:08', '2023-06-12 13:00:08'),
('a41415b1-4986-4ca3-9645-747c383fda1f', 'd2b09976-3be3-43e8-81ef-d0dd81784cdf', 'f952cecc-9c95-44a0-bfbf-5c04d4573a3c', NULL, 'USDT', NULL, NULL, 99000.00000000, 0.00000000, '677133cd-9772-4a29-9245-d61747f4b975', 'Internal', NULL, NULL, 'completed', '2023-11-23 00:11:05', '2023-11-23 00:11:05'),
('a8d09abf-188c-487c-b0a5-b5367cedaf99', 'b9ec7d63-015c-4814-b253-eb1d45eae4dd', '0aac3f7d-049d-49da-b7d1-82bbb62d0d03', NULL, 'USD', NULL, NULL, 10000.00000000, 0.00000000, '038ab802-0a27-4ab8-97c5-e30c7a42ff85', 'Internal', NULL, NULL, 'completed', '2023-10-11 17:01:42', '2023-10-11 17:01:42'),
('a9e967d3-35b5-4dad-bdb6-bf207b410b1a', '44d4809d-28e1-4685-b15c-dc11134fdf1d', '5dd3cee3-e14a-4755-bb98-bfa7c9355781', NULL, 'TRX', NULL, NULL, 4500.00000000, 0.00000000, 'd18775c8-440c-4032-9caa-e27cdf175f6d', 'Internal', NULL, NULL, 'completed', '2023-12-06 15:11:59', '2023-12-06 15:11:59'),
('ab6a25b3-6a6f-4c66-80d4-cf9f872cd19f', 'e7862d9c-fba8-4509-b59b-a4cb4f71ba04', 'e94973ab-1eb2-4cf0-9e47-0998102fc527', NULL, 'USDT', NULL, NULL, 35500.00000000, 0.00000000, '4955bb0b-98a6-47f1-920e-2de8190ecd02', 'Internal', NULL, NULL, 'completed', '2024-02-06 15:05:10', '2024-02-06 15:05:10'),
('aba2f377-1c89-4184-8a60-70d37a912275', 'd72e5177-9169-4d3b-a805-aa9a45da9c32', '1196a093-5086-47bb-8982-b1d541e38863', NULL, 'TRX', NULL, NULL, 2.00000000, 0.00000000, '965f28ea-678b-4d5f-9978-a4d926dc030d', 'Internal', NULL, NULL, 'completed', '2023-06-05 09:37:04', '2023-06-05 09:37:04'),
('ac6127da-d48d-4678-9264-bd7d211d4d11', '60145862-0641-4106-af67-8de47b916abe', '3a810fb5-9e85-4f2d-81d1-b169576f349f', NULL, 'USDT', NULL, NULL, 29000.00000000, 0.00000000, 'a0839585-3e91-4447-9b4c-f854fde1a711', 'Internal', NULL, NULL, 'completed', '2023-10-23 14:23:30', '2023-10-23 14:23:30'),
('ae10c271-3ed3-4207-862e-27a672bfe872', 'c71eeafd-849d-4cb7-8275-1ebcd9ac93d8', '32cb3f68-945d-42c4-8dde-1c9bcf9cc40c', NULL, 'IRT', NULL, NULL, 250000.00000000, 0.00000000, 'f510556e-a229-4071-98f5-6cda0a6983bb', 'Internal', NULL, NULL, 'completed', '2023-06-04 15:10:36', '2023-06-04 15:10:36'),
('ae3a491e-bd2c-4ed8-b786-358feb3edb81', 'fb35867d-1db8-4b6d-9f19-54ab0b2ddab1', '085718f3-3fb3-452e-a86d-1133cc05e551', NULL, 'USDT', NULL, NULL, 8000.00000000, 0.00000000, 'f6b191f8-2ccf-442c-93d3-4fe076c6bb83', 'Internal', NULL, NULL, 'completed', '2023-06-01 14:50:32', '2023-06-01 14:50:32'),
('ae3b4258-44de-4768-b304-49ed7d6b87de', 'c71eeafd-849d-4cb7-8275-1ebcd9ac93d8', '27aa98b9-9c31-4910-a21b-ca2032fb93de', NULL, 'TRX', NULL, NULL, 1000.00000000, 0.00000000, 'fbd5fe7b-7039-4499-9041-96fdbe6b4d31', 'Internal', NULL, NULL, 'completed', '2023-12-16 12:35:00', '2023-12-16 12:35:00'),
('b1fcbb32-ecc4-4184-b830-8196a6728c09', 'e7862d9c-fba8-4509-b59b-a4cb4f71ba04', '419692a4-acf5-4bea-8e7e-c1c27689e07c', NULL, 'TRX', NULL, NULL, 2000.00000000, 0.00000000, 'fc29e9e2-7f5f-4faf-ac38-9a8e81b8b058', 'Internal', NULL, NULL, 'completed', '2023-07-25 05:22:15', '2023-07-25 05:22:15'),
('b2cf5fbf-9ca8-429c-ac0a-27e585aa069d', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', '8d0983ec-3fa3-49b0-b250-9f81aa93f07c', NULL, 'ETH', NULL, 'TSz8ZGBdd8HpWKSYuu8Hk69UgCDc3ktDGW', 99999999999.99999999, 0.00000000, '3ed0f390-1c3a-4c29-b519-f2b0d8b96564', 'Internal', NULL, NULL, 'completed', '2023-05-28 09:02:42', '2023-05-28 09:02:42'),
('b34ccff1-c391-401d-87c6-ba8ceebda026', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', '7dc9fe74-fa5b-4e1e-aeee-6f9671fc14c0', NULL, 'IRT', NULL, NULL, 2000.00000000, 0.00000000, NULL, 'MellatApi', NULL, NULL, 'pending', '2023-07-16 06:42:30', '2023-07-16 06:42:30'),
('b6abd258-5783-40fb-995b-92e6413bda64', '86f3c2c9-e4c3-4192-ad1e-d34a6b188833', '5c06c824-6cb5-442a-b460-b917c1eb7ec6', NULL, 'TRX', NULL, NULL, 2.00000000, 0.00000000, 'aa4b3f11-5c4f-4bc8-aceb-3e184a7ab74b', 'Internal', NULL, NULL, 'completed', '2023-07-19 09:49:53', '2023-07-19 09:49:53'),
('b7346b59-9346-4ab1-9adc-105bf98977b5', '6dd2b333-abab-4c57-b4f5-d33e4dd70f39', '90379bb0-c028-433b-ac9e-8790a62652cd', NULL, 'BTC', NULL, NULL, 100.00000000, 0.00000000, '9568f769-693b-441e-a55a-813ebb4303bb', 'Internal', NULL, NULL, 'completed', '2023-08-04 16:51:36', '2023-08-04 16:51:36'),
('b7f193a3-391a-4322-9c52-94ce5d2e553d', 'cb74f45c-280c-42fd-a06e-a4672280c040', '8b679b09-db4b-4acf-88dd-09765bc4d08d', NULL, 'USDT', NULL, NULL, 500.00000000, 0.00000000, '4811acaf-67cc-4265-89b4-1bd31e0f46df', 'Internal', NULL, NULL, 'completed', '2023-07-21 18:08:35', '2023-07-21 18:08:35'),
('bab9f244-ecbb-491d-ade4-de19ad2e1aac', '12a277f5-c2ee-44a6-82da-f6f5e03758a9', '0f13db00-a296-4021-923e-6154730ca6a1', NULL, 'TRX', NULL, NULL, 2.00000000, 0.00000000, '3c2495d4-4ad3-4d76-8daf-bfe0d1acbb1c', 'Internal', NULL, NULL, 'completed', '2023-06-01 13:25:20', '2023-06-01 13:25:20'),
('bb381058-5a5a-4ff6-a599-207fde6ea4de', '675d5181-9662-4d5a-8e29-924e2b58b24f', 'a7501efe-18bd-40b9-90c6-007507528e0f', NULL, 'USDT', NULL, NULL, 750.00000000, 0.00000000, '203048a3-5758-4909-80ff-18918e1c0a21', 'Internal', NULL, NULL, 'completed', '2023-07-25 17:45:27', '2023-07-25 17:45:27'),
('bb90f0d3-41ab-4e75-a1d6-38ed6d194f0b', 'e7862d9c-fba8-4509-b59b-a4cb4f71ba04', '68a6ef97-04e9-4045-a3ab-06f42861174b', NULL, 'USD', NULL, NULL, 43400.00000000, 0.00000000, '9181e649-c0cf-4f55-a92e-2b258c3fef36', 'Internal', NULL, NULL, 'completed', '2024-02-06 14:02:51', '2024-02-06 14:02:51'),
('bca53999-2389-4d6f-8864-538728fb1761', 'db5d841b-d90a-4437-957a-c7fb5fa86319', '0120214d-e0da-4720-b52b-e68aa688e5c7', NULL, 'USD', NULL, NULL, 99999999999.99999999, 0.00000000, 'c32024e8-ba5e-4e63-b079-9e2e4e1bf289', 'Internal', NULL, NULL, 'completed', '2023-05-28 08:59:36', '2023-05-28 08:59:36'),
('bfad4a3f-59e4-4470-b18e-2fc3d1a5d051', '47eaf168-5901-4ccb-8b9c-d7f9c754ed04', '9c0dbb68-ad47-4c8a-b7a7-e008499dae5f', NULL, 'BTC', NULL, NULL, 5000.00000000, 0.00000000, '50ce0698-7d1c-4c09-be1d-dea08a78bcf3', 'Internal', NULL, NULL, 'completed', '2023-05-31 10:29:23', '2023-05-31 10:29:23'),
('c0763253-f23f-4c48-acd9-89c3745eeccf', '44d4809d-28e1-4685-b15c-dc11134fdf1d', '5dd3cee3-e14a-4755-bb98-bfa7c9355781', NULL, 'TRX', NULL, NULL, 1100.00000000, 0.00000000, '63fcd86b-78bd-4df2-9638-098171165b13', 'Internal', NULL, NULL, 'completed', '2023-12-06 15:12:08', '2023-12-06 15:12:08'),
('c1aa15fb-bfe4-479e-9901-a2da24041b3e', '12a277f5-c2ee-44a6-82da-f6f5e03758a9', '1fd60d17-705c-43a3-bcba-2a5226777092', NULL, 'USDT', NULL, NULL, 50000.00000000, 0.00000000, '4be88ada-3440-429a-b385-729cf476dc50', 'Internal', NULL, NULL, 'completed', '2023-06-01 13:18:43', '2023-06-01 13:18:43'),
('c649ac4f-b171-4dbe-ba83-f569c0827ce5', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', '7dc9fe74-fa5b-4e1e-aeee-6f9671fc14c0', NULL, 'IRT', NULL, NULL, 2000.00000000, 0.00000000, NULL, 'MellatApi', NULL, NULL, 'pending', '2023-07-16 06:41:37', '2023-07-16 06:41:37'),
('c684e92b-2573-428f-9b6b-967a8a1b92f9', '60145862-0641-4106-af67-8de47b916abe', '65d81edd-036b-494f-beda-c816811fa041', NULL, 'BTC', NULL, NULL, 25000.00000000, 0.00000000, '3c6b0c2d-fa1a-43cf-9ead-5c560d8c9291', 'Internal', NULL, NULL, 'completed', '2023-12-14 12:59:37', '2023-12-14 12:59:37'),
('c6b4a4f1-4512-4530-b32d-0863b740b9ca', '32769d8c-4dca-40d5-83ec-99b68df4b130', '86b5a58f-2fa9-4b0f-bccc-95ed28b17c6d', NULL, 'BTC', NULL, NULL, 10000.00000000, 0.00000000, 'bdad105a-f73f-4703-af78-31555d82256a', 'Internal', NULL, NULL, 'completed', '2023-05-30 10:16:04', '2023-05-30 10:16:04'),
('c7099733-3a7b-44b9-95fe-b6a4c1d6e2fc', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', '7dc9fe74-fa5b-4e1e-aeee-6f9671fc14c0', NULL, 'IRT', NULL, NULL, 800000.00000000, 0.00000000, NULL, 'MellatApi', NULL, NULL, 'pending', '2024-03-30 08:17:13', '2024-03-30 08:17:13'),
('c78a81dd-9b90-4a8a-87e2-51502c0e1249', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', '7dc9fe74-fa5b-4e1e-aeee-6f9671fc14c0', '40017e9a-c2a2-4e08-a2cc-125e2916c072', 'IRT', NULL, NULL, 100.00000000, 0.00000000, NULL, 'BankApi', NULL, NULL, 'completed', '2024-02-29 09:13:09', '2024-02-29 09:13:09'),
('c93e9ebe-0a0e-4d1c-8260-c8a3cb7714d3', 'd2b09976-3be3-43e8-81ef-d0dd81784cdf', '12e79621-7db0-4a62-8b9d-250a5ff1b9ef', NULL, 'ETH', NULL, NULL, 14960.00000000, 0.00000000, 'a3076852-c88e-430c-8127-64c3f1d89c19', 'Internal', NULL, NULL, 'completed', '2023-07-28 06:00:47', '2023-07-28 06:00:47'),
('c95dad1a-812d-4d0d-a749-6354ab65b492', 'f978562a-6102-47ef-b44c-00962596e9e4', '42b175e1-d025-43f0-a4a2-b45d1c9b3a42', NULL, 'USDT', NULL, NULL, 1750.00000000, 0.00000000, '0e525bcd-c5bc-4b59-9c00-ba285d5fb173', 'Internal', NULL, NULL, 'completed', '2023-06-12 10:54:11', '2023-06-12 10:54:11'),
('ca1d47bc-ba0e-44d0-9ac7-3ccb58ffc1fe', '47eaf168-5901-4ccb-8b9c-d7f9c754ed04', '8e47164a-c40b-4d9c-bf49-238bd5c133b9', NULL, 'USDT', NULL, NULL, 10000.00000000, 0.00000000, '36bb2133-a301-4e6c-8e4f-a615b457e40f', 'Internal', NULL, NULL, 'completed', '2023-05-31 11:14:14', '2023-05-31 11:14:14'),
('ca2849f8-6f77-47ee-9ea3-7a3130d5a45d', '52523c96-98e6-4e75-a1d8-e3cf094993a1', 'b219629f-060f-49ba-b129-c241d80d853e', NULL, 'TRX', NULL, NULL, 44554545460.00000000, 0.00000000, '4b519bc2-d900-412d-b1c6-3c774d93668d', 'Internal', NULL, NULL, 'completed', '2023-11-14 10:01:50', '2023-11-14 10:01:50'),
('cd17d17f-9d3e-4b6b-9158-b1bed6ccf7f9', 'e7862d9c-fba8-4509-b59b-a4cb4f71ba04', '419692a4-acf5-4bea-8e7e-c1c27689e07c', NULL, 'TRX', NULL, NULL, 2002.00000000, 0.00000000, 'fa3d4798-d4ef-4e5f-9e7b-44fc7d6a4be0', 'Internal', NULL, NULL, 'completed', '2023-07-25 05:22:41', '2023-07-25 05:22:41'),
('cda39cd3-bd8a-46ab-a079-ec38c67b8c50', '7109c567-63f7-4d17-a2d5-a518e560408e', '119f084a-1c57-4e94-99be-e1b0498dabd7', NULL, 'USD', NULL, NULL, 10000.00000000, 0.00000000, '71da3e6f-d05a-4a4c-b9e3-252ca35226de', 'Internal', NULL, NULL, 'completed', '2023-08-09 16:52:30', '2023-08-09 16:52:30'),
('cda47b47-de29-4eb0-91db-fbb65a35c3c4', 'e7862d9c-fba8-4509-b59b-a4cb4f71ba04', 'e94973ab-1eb2-4cf0-9e47-0998102fc527', NULL, 'USDT', NULL, NULL, 43000.00000000, 0.00000000, '62601b83-0ae4-403c-af24-3deb09a54f5d', 'Internal', NULL, NULL, 'completed', '2024-02-06 14:03:24', '2024-02-06 14:03:24'),
('ce5099af-b6ff-4e44-8770-ff0adb797a21', '4737ffad-8afe-4bbe-9c76-9ece9d55068f', '4e683ec8-2bad-433c-92bc-aabc263a1357', NULL, 'USD', NULL, NULL, 55000.00000000, 0.00000000, '6afe2328-a879-48ed-a60d-79e43bc89326', 'Internal', NULL, NULL, 'completed', '2023-11-22 09:12:56', '2023-11-22 09:12:56'),
('ce58e783-d62b-45eb-9c69-6c53e222d006', 'fb35867d-1db8-4b6d-9f19-54ab0b2ddab1', '5a254b67-66c2-414f-97d2-4ff7e7a109b2', NULL, 'BTC', NULL, NULL, 8000.00000000, 0.00000000, 'c614aa1f-3697-4b0c-b269-cb78fbedc99c', 'Internal', NULL, NULL, 'completed', '2023-06-01 14:50:52', '2023-06-01 14:50:52'),
('cf3f5cc8-b777-430c-80b9-59afd9e8a294', 'd2b09976-3be3-43e8-81ef-d0dd81784cdf', 'f952cecc-9c95-44a0-bfbf-5c04d4573a3c', NULL, 'USDT', NULL, NULL, 10000.00000000, 0.00000000, '3f66af95-4509-40ad-9f85-a62640062345', 'Internal', NULL, NULL, 'completed', '2023-11-23 00:10:48', '2023-11-23 00:10:48'),
('d1538a7b-e2a7-44ed-97e4-510144eff84d', '7cde25b7-e520-4fb3-85df-f5fcf89305d3', '64885a8a-f717-42eb-82f8-4701f9cddc6a', NULL, 'USDT', NULL, NULL, 1000.00000000, 0.00000000, 'ba3b771d-ad0b-4b57-ad30-818af375fa99', 'Internal', NULL, NULL, 'completed', '2023-06-09 15:43:15', '2023-06-09 15:43:15'),
('d27c93c2-22af-441f-82a9-8752d6508ffc', 'a502eb20-d81c-4f3e-a56f-11444fe1e4cb', '6fb5edde-2fc1-4f04-9680-775e9babaf13', '28db6892-0a14-48f0-836c-ccfb9ccfea0d', 'IRT', NULL, NULL, 50000.00000000, 0.00000000, NULL, 'BankApi', NULL, NULL, 'pending', '2023-08-28 16:35:36', '2023-08-28 16:35:36'),
('d32283a7-a375-4beb-9449-f1b13514fdf7', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', '7dc9fe74-fa5b-4e1e-aeee-6f9671fc14c0', '113d42ba-abbc-40e5-aa2c-52211c8502aa', 'IRT', NULL, NULL, 100000.00000000, 0.00000000, NULL, 'BankApi', NULL, NULL, 'pending', '2023-07-17 05:04:24', '2023-07-17 05:04:24'),
('d44e177f-54fb-499e-83ad-5523976093a9', 'c71eeafd-849d-4cb7-8275-1ebcd9ac93d8', '80a2d97c-c8b3-4557-ba4b-5468c517f05f', NULL, 'ETH', NULL, 'TREmDjbq1nnfxzfzgvm4o1znL6zSooMv7Y', 250000.00000000, 0.00000000, '9c70e001-91b8-465c-b4ed-ec1c123241ce', 'Internal', NULL, NULL, 'completed', '2023-12-04 17:59:30', '2023-12-04 17:59:30'),
('d599ffd8-355e-4639-98c0-184628fca140', '4737ffad-8afe-4bbe-9c76-9ece9d55068f', '4e683ec8-2bad-433c-92bc-aabc263a1357', NULL, 'USD', NULL, NULL, 10000.00000000, 0.00000000, '6e9d44f3-6580-463e-85e5-c425cbf668fe', 'Internal', NULL, NULL, 'completed', '2023-07-10 10:27:40', '2023-07-10 10:27:40'),
('d5cf0230-e389-47c3-95ce-613cda945394', 'c71eeafd-849d-4cb7-8275-1ebcd9ac93d8', '12848a5b-5c2d-4f54-8527-2da29d70d087', NULL, 'USDT', NULL, NULL, 5450.00000000, 0.00000000, '2383bf37-d372-40bc-858c-650e2b4cd678', 'Internal', NULL, NULL, 'completed', '2024-02-27 05:06:21', '2024-02-27 05:06:21'),
('d60350b6-995c-4b99-849b-cdc55e921bee', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', '7dc9fe74-fa5b-4e1e-aeee-6f9671fc14c0', NULL, 'IRT', NULL, NULL, 40000.00000000, 0.00000000, NULL, 'MellatApi', NULL, NULL, 'pending', '2023-10-18 11:11:17', '2023-10-18 11:11:17'),
('d65c6d1e-c0a6-4bb4-add6-c04d0874aaef', '6dd2b333-abab-4c57-b4f5-d33e4dd70f39', '051bdca5-cfa6-43b2-81c5-fff2b8b0cfb0', NULL, 'TRX', NULL, NULL, 2.00000000, 0.00000000, '16701b35-82df-459a-b588-27021c5aa6d8', 'Internal', NULL, NULL, 'completed', '2023-08-04 16:42:03', '2023-08-04 16:42:03'),
('d7342085-dd0e-4b4f-8d1b-8bf97c7c4235', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', '7dc9fe74-fa5b-4e1e-aeee-6f9671fc14c0', NULL, 'IRT', NULL, NULL, 40000.00000000, 0.00000000, NULL, 'MellatApi', NULL, NULL, 'pending', '2023-10-18 11:10:55', '2023-10-18 11:10:55'),
('d804418b-e683-445e-a81d-d1e03da03740', '47eaf168-5901-4ccb-8b9c-d7f9c754ed04', '9c0dbb68-ad47-4c8a-b7a7-e008499dae5f', NULL, 'BTC', NULL, NULL, 10000.00000000, 0.00000000, '3eed3b7a-5e03-41b1-9f6c-aae54c258b84', 'Internal', NULL, NULL, 'completed', '2023-05-31 11:14:43', '2023-05-31 11:14:43'),
('d80823b6-c9f3-48f2-9b0c-6ddcd6af45e5', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', '6e579983-e6ed-4b25-a4ff-91a7fbb2fcf2', NULL, 'USDT', NULL, NULL, 99999999999.99999999, 0.00000000, 'c38b8166-b4a9-43ec-ab1c-41db2ff2d371', 'Internal', NULL, NULL, 'completed', '2023-05-28 09:02:31', '2023-05-28 09:02:31'),
('d862ca2a-fefc-4392-b17f-bd01315ee2f0', '675d5181-9662-4d5a-8e29-924e2b58b24f', 'a7501efe-18bd-40b9-90c6-007507528e0f', NULL, 'USDT', NULL, NULL, 750.00000000, 0.00000000, '4b15052c-4a17-43df-870b-a4cee84bf57a', 'Internal', NULL, NULL, 'completed', '2023-07-25 17:37:10', '2023-07-25 17:37:10'),
('d9e8650b-4409-49f5-add8-8725103f87b7', '44d4809d-28e1-4685-b15c-dc11134fdf1d', '984f3a3a-bb97-4cf4-8048-b03d26dbcdaa', NULL, 'USDT', NULL, NULL, 1021.00000000, 0.00000000, 'a7a8b672-5938-4dc0-b003-090f573d2672', 'Internal', NULL, NULL, 'completed', '2023-12-06 15:12:23', '2023-12-06 15:12:23');
INSERT INTO `wallet_deposits` (`id`, `user_id`, `wallet_id`, `bank_account_id`, `symbol`, `system_bank_account_id`, `address`, `amount`, `system_fee`, `txn_id`, `api`, `platform`, `receipt`, `status`, `created_at`, `updated_at`) VALUES
('da3d6827-f191-4867-ae06-01ee0f81afb7', 'd2b09976-3be3-43e8-81ef-d0dd81784cdf', 'a26c7e0a-7f6a-4c80-8a01-8b3d3ed076c8', NULL, 'TRX', NULL, NULL, 2000.00000000, 0.00000000, 'e05fdbf3-d6c0-4a82-922d-434fda19b4bd', 'Internal', NULL, NULL, 'completed', '2023-07-28 06:01:09', '2023-07-28 06:01:09'),
('db487a3e-6901-43e3-83b9-9588b037fb7f', '60145862-0641-4106-af67-8de47b916abe', '3a810fb5-9e85-4f2d-81d1-b169576f349f', NULL, 'USDT', NULL, NULL, 42300.00000000, 0.00000000, 'bf6ff900-7db7-4f0c-8df1-0fcbd2fffac6', 'Internal', NULL, NULL, 'completed', '2023-12-14 00:41:38', '2023-12-14 00:41:38'),
('db61013c-89a1-4d32-ba4b-19807b166bbb', 'd2b09976-3be3-43e8-81ef-d0dd81784cdf', '19692457-7150-4dbb-84bf-040c0bbba1de', NULL, 'BTC', NULL, NULL, 18960.00000000, 0.00000000, 'f4bd950c-9cf3-49e7-8ba3-10125cc58e44', 'Internal', NULL, NULL, 'completed', '2023-11-23 00:13:41', '2023-11-23 00:13:41'),
('dd426c35-5785-4022-ba77-760aa3e9d435', '7cde25b7-e520-4fb3-85df-f5fcf89305d3', '64885a8a-f717-42eb-82f8-4701f9cddc6a', NULL, 'USDT', NULL, NULL, 5500.00000000, 0.00000000, '37674103-19a7-44fa-b487-4f4c297ee8e7', 'Internal', NULL, NULL, 'completed', '2023-06-09 13:46:03', '2023-06-09 13:46:03'),
('dd62bf79-515c-473f-ad0c-84b5f5638c14', '44d4809d-28e1-4685-b15c-dc11134fdf1d', '984f3a3a-bb97-4cf4-8048-b03d26dbcdaa', NULL, 'USDT', NULL, NULL, 500.00000000, 0.00000000, 'afd6ef94-6021-49a6-8f9f-f01693116675', 'Internal', NULL, NULL, 'completed', '2023-12-06 15:43:34', '2023-12-06 15:43:34'),
('dd8fcebf-8f1f-4965-8a5d-3a0d3a046b37', 'cb74f45c-280c-42fd-a06e-a4672280c040', '8b679b09-db4b-4acf-88dd-09765bc4d08d', NULL, 'USDT', NULL, NULL, 15000.00000000, 0.00000000, '4030dea4-027f-4193-b5e6-294caa59c76b', 'Internal', NULL, NULL, 'completed', '2023-12-18 14:51:13', '2023-12-18 14:51:13'),
('de608de7-0ab7-4780-8131-c0e09dee346b', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'c57baee2-7a33-46f7-8a14-41f2e70df233', '113d42ba-abbc-40e5-aa2c-52211c8502aa', 'USD', NULL, NULL, 10.00000000, 1.00000000, NULL, 'BankApi', NULL, NULL, 'pending', '2023-08-24 06:27:16', '2023-08-24 06:27:16'),
('df271807-f9e6-4506-9f05-fc144bee7f9d', '933d676a-c435-4697-bdf2-e54d026c156e', '3aa7f9c9-9b47-442d-bbdf-c170cb52eafe', NULL, 'USD', NULL, NULL, 1000.00000000, 0.00000000, 'e8ca0bfa-daaf-4057-a221-2455c9577b57', 'Internal', NULL, NULL, 'completed', '2023-05-31 12:19:17', '2023-05-31 12:19:17'),
('df5d7e0e-1729-48da-900d-c2523a675458', '6cd1a9e7-a910-43c8-a930-95dcb2c8edca', 'e0e90ce7-2b7b-41a6-9526-795fb00d7217', NULL, 'BTC', NULL, NULL, 2000000000.00000000, 0.00000000, 'fa7d41cd-d386-45bd-8d66-ae2242c45686', 'Internal', NULL, NULL, 'completed', '2023-08-07 18:14:54', '2023-08-07 18:14:54'),
('e05319a3-fcd4-4d95-904f-7379018bf154', 'fb35867d-1db8-4b6d-9f19-54ab0b2ddab1', '085718f3-3fb3-452e-a86d-1133cc05e551', NULL, 'USDT', NULL, NULL, 2500.00000000, 0.00000000, 'd8480fe5-031b-4802-9c0a-32940f409888', 'Internal', NULL, NULL, 'completed', '2023-06-01 14:48:41', '2023-06-01 14:48:41'),
('e1bfae8a-5c7f-4640-8dae-d91e836f6e1c', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', '7dc9fe74-fa5b-4e1e-aeee-6f9671fc14c0', NULL, 'IRT', NULL, NULL, 40000.00000000, 0.00000000, NULL, 'MellatApi', NULL, NULL, 'pending', '2023-10-18 11:13:47', '2023-10-18 11:13:47'),
('e1ebeb7f-f852-4a25-aae5-dcbb4ac4503a', 'd2b09976-3be3-43e8-81ef-d0dd81784cdf', '19692457-7150-4dbb-84bf-040c0bbba1de', NULL, 'BTC', NULL, NULL, 1000.00000000, 0.00000000, 'e89b52c9-890c-4734-baca-4943d0416514', 'Internal', NULL, NULL, 'completed', '2023-08-14 10:54:10', '2023-08-14 10:54:10'),
('e2a8d498-e334-4f6b-a06d-b5ad27ae04b0', '675d5181-9662-4d5a-8e29-924e2b58b24f', '8108dd0c-51e2-4491-b253-2a993feeb152', NULL, 'TRX', NULL, NULL, 23.00000000, 0.00000000, 'a179542f-ebdd-4c2b-9f2f-56faa738a7ac', 'Internal', NULL, NULL, 'completed', '2023-09-28 16:55:25', '2023-09-28 16:55:25'),
('e4c4712c-9bda-490c-907d-600419d00e4e', '7109c567-63f7-4d17-a2d5-a518e560408e', '119f084a-1c57-4e94-99be-e1b0498dabd7', NULL, 'USD', NULL, NULL, 150.00000000, 0.00000000, '45626745-a4df-4eaf-b914-ea6c8f134baf', 'Internal', NULL, NULL, 'completed', '2023-08-03 18:27:57', '2023-08-03 18:27:57'),
('e5b3a26c-4b1b-4bcc-839c-c4e4fb1d2474', '44d4809d-28e1-4685-b15c-dc11134fdf1d', '984f3a3a-bb97-4cf4-8048-b03d26dbcdaa', NULL, 'USDT', NULL, NULL, 180000.00000000, 0.00000000, '2640f08f-2fc1-4a47-9c16-381eba8c1c96', 'Internal', NULL, NULL, 'completed', '2023-07-20 09:59:46', '2023-07-20 09:59:46'),
('e5c45032-f093-4fd5-ba49-87b5859a52ca', 'a502eb20-d81c-4f3e-a56f-11444fe1e4cb', '89dd6f6d-370d-447a-8138-bc76d57ee6c8', NULL, 'BTC', NULL, 'TSZsQpLG8BSXAtkhRGJzFsXDERTrk3Npia', 20.00000000, 0.00000000, '4ac9dab4-d6c1-40bd-b0a0-a6858fc8ed07', 'Internal', NULL, NULL, 'completed', '2023-07-18 13:27:41', '2023-07-18 13:27:41'),
('e8ce0096-aa48-464f-b0bf-1a07b5cbcc71', '7109c567-63f7-4d17-a2d5-a518e560408e', '119f084a-1c57-4e94-99be-e1b0498dabd7', NULL, 'USD', NULL, NULL, 300.00000000, 0.00000000, '5a0ed6dc-a7de-45f9-9bfe-3bb7309e1dfa', 'Internal', NULL, NULL, 'completed', '2023-08-03 17:59:29', '2023-08-03 17:59:29'),
('e990c569-f120-46a6-9a43-785b550b710a', 'd86b3a4d-3a57-426e-8e1e-95a6be996bb5', 'e855faee-56c7-42bc-b363-dc3ea89f81c3', NULL, 'TRX', NULL, NULL, 2.00000000, 0.00000000, '36214528-afa9-4127-b45b-8eb024e62769', 'Internal', NULL, NULL, 'completed', '2023-07-19 11:02:53', '2023-07-19 11:02:53'),
('ebb2ba3c-ef13-42f6-ac9e-139a1edabbe4', 'e7862d9c-fba8-4509-b59b-a4cb4f71ba04', 'f5920b57-591a-461c-ab34-3d0443233bbf', NULL, 'BTC', NULL, NULL, 158000.00000000, 0.00000000, '8478d4b0-fc24-4e0d-a5dc-495be51bf825', 'Internal', NULL, NULL, 'completed', '2023-08-29 04:05:32', '2023-08-29 04:05:32'),
('ec0c6413-91f7-4b89-8031-b54ed462bea2', '7cde25b7-e520-4fb3-85df-f5fcf89305d3', '64885a8a-f717-42eb-82f8-4701f9cddc6a', NULL, 'USDT', NULL, 'TMVnBuf4R1aJfSQEMK81CqV7sDPZGNywBr', 7000.00000000, 0.00000000, 'da85553e-28c3-4637-9e85-b94e53b2035a', 'Internal', NULL, NULL, 'completed', '2023-06-12 09:48:43', '2023-06-12 09:48:43'),
('ededef58-2797-4f97-b308-8558d28a2ee0', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', '7dc9fe74-fa5b-4e1e-aeee-6f9671fc14c0', NULL, 'IRT', NULL, NULL, 40000.00000000, 0.00000000, NULL, 'MellatApi', NULL, NULL, 'pending', '2023-10-18 11:08:54', '2023-10-18 11:08:54'),
('ee00c31a-559d-4c27-bfd6-50b1991ae6fe', 'c71eeafd-849d-4cb7-8275-1ebcd9ac93d8', '12848a5b-5c2d-4f54-8527-2da29d70d087', NULL, 'USDT', NULL, NULL, 250000.00000000, 0.00000000, '98dc107c-0ba8-4c91-b941-c314ce177be0', 'Internal', NULL, NULL, 'completed', '2023-12-05 09:13:38', '2023-12-05 09:13:38'),
('ee257e2f-985b-4c9c-9e19-27723b377cc7', '44d4809d-28e1-4685-b15c-dc11134fdf1d', '5dd3cee3-e14a-4755-bb98-bfa7c9355781', NULL, 'TRX', NULL, NULL, 2000.00000000, 0.00000000, '36b79074-e607-49bd-b02b-fbbf3747c36a', 'Internal', NULL, NULL, 'completed', '2023-12-16 11:44:07', '2023-12-16 11:44:07'),
('f001b805-173a-49b7-92cf-890db75da040', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', '7dc9fe74-fa5b-4e1e-aeee-6f9671fc14c0', NULL, 'IRT', NULL, NULL, 2000.00000000, 0.00000000, NULL, 'MellatApi', NULL, NULL, 'pending', '2023-07-16 06:59:11', '2023-07-16 06:59:11'),
('f092a2ac-bc0b-47c8-9e29-9f89c0e07bbe', '7109c567-63f7-4d17-a2d5-a518e560408e', '290c1c50-a0a1-4b2f-ba3d-0e4f0ab667c6', NULL, 'USDT', NULL, NULL, 10000.00000000, 0.00000000, '01df7870-c982-4ff3-9ba9-1a139dd6bec7', 'Internal', NULL, NULL, 'completed', '2023-10-17 18:38:52', '2023-10-17 18:38:52'),
('f14bbf85-d8ed-4a35-8789-7bb821e68ccf', 'd2b09976-3be3-43e8-81ef-d0dd81784cdf', 'a26c7e0a-7f6a-4c80-8a01-8b3d3ed076c8', NULL, 'TRX', NULL, NULL, 3998.00000000, 0.00000000, 'feae9f3c-04f3-472b-a4de-be818b3edd24', 'Internal', NULL, NULL, 'completed', '2023-07-29 07:18:00', '2023-07-29 07:18:00'),
('f1ac05c2-db57-4a16-93aa-a61ab7b88439', 'd72e5177-9169-4d3b-a805-aa9a45da9c32', 'f22409e5-1d8c-40c6-a087-ca6662d23676', NULL, 'USDT', NULL, NULL, 35000.00000000, 0.00000000, '19bc09f5-16b6-4ce1-a018-6627a784f8ad', 'Internal', NULL, NULL, 'completed', '2023-06-05 09:37:34', '2023-06-05 09:37:34'),
('f27bcc3e-e1d4-4a82-b750-3df94d2569a2', 'e7862d9c-fba8-4509-b59b-a4cb4f71ba04', '419692a4-acf5-4bea-8e7e-c1c27689e07c', NULL, 'TRX', NULL, NULL, 799.00000000, 0.00000000, 'f8cd63cf-76da-46a2-9bc4-22ca09b53a6a', 'Internal', NULL, NULL, 'completed', '2023-07-25 05:54:12', '2023-07-25 05:54:12'),
('f2d77f1c-f855-46ac-9967-58e7a2079313', 'cb74f45c-280c-42fd-a06e-a4672280c040', '8b679b09-db4b-4acf-88dd-09765bc4d08d', NULL, 'USDT', NULL, NULL, 10300.00000000, 0.00000000, '97bedbec-761e-46f7-ab5d-b53bc7e753b7', 'Internal', NULL, NULL, 'completed', '2023-12-18 16:24:41', '2023-12-18 16:24:41'),
('f36aa15d-a43e-4424-b452-3694812cf896', '44d4809d-28e1-4685-b15c-dc11134fdf1d', 'ac6c0b5a-de9c-49ef-860b-2b7a1626017f', NULL, 'BTC', NULL, NULL, 2000.00000000, 0.00000000, 'ce04a6cc-4805-4b4f-a92c-197389da8dfd', 'Internal', NULL, NULL, 'completed', '2023-12-16 11:44:28', '2023-12-16 11:44:28'),
('f39a8a9e-c43e-4764-84a5-94a863463315', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', '7dc9fe74-fa5b-4e1e-aeee-6f9671fc14c0', '321c30d1-04c3-495a-ab0c-56ef278e0c42', 'IRT', NULL, NULL, 25000000.00000000, 0.00000000, NULL, 'BankApi', NULL, NULL, 'completed', '2023-07-14 09:12:47', '2023-07-14 09:12:47'),
('f3ac159d-a866-4db6-b403-4205a6890032', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', '94da310e-d055-429c-be60-58c33d1679ed', NULL, 'BTC', NULL, 'TSz8ZGBdd8HpWKSYuu8Hk69UgCDc3ktDGW', 99999999999.99999999, 0.00000000, '49c5e405-eaa0-4d03-ae26-63cb38b27676', 'Internal', NULL, NULL, 'completed', '2023-05-28 09:02:56', '2023-05-28 09:02:56'),
('f44ea511-796c-4669-a5a4-fe6912c77c01', 'e7862d9c-fba8-4509-b59b-a4cb4f71ba04', '419692a4-acf5-4bea-8e7e-c1c27689e07c', NULL, 'TRX', NULL, NULL, 3000.00000000, 0.00000000, 'bfc05239-f359-44cb-8482-544a422c5662', 'Internal', NULL, NULL, 'completed', '2023-08-29 04:05:10', '2023-08-29 04:05:10'),
('f6406f29-e40d-4096-b32a-feced7c21936', '86f3c2c9-e4c3-4192-ad1e-d34a6b188833', '8eefb298-0dc9-4045-8b86-2c624f071d78', NULL, 'USDT', NULL, NULL, 25.00000000, 0.00000000, 'd6f3f4d1-c5db-49ae-a877-88c75e693470', 'Internal', NULL, NULL, 'completed', '2023-07-28 20:58:18', '2023-07-28 20:58:18'),
('f6e78306-5e68-4714-ab98-a3a411a6f917', 'db5d841b-d90a-4437-957a-c7fb5fa86319', '15f8a00c-a392-4779-99b3-cdc5758d4e89', NULL, 'TRX', NULL, NULL, 3.00000000, 0.00000000, '3f90a993-28c5-42a9-b3f5-cb4664dffeae', 'Internal', NULL, NULL, 'completed', '2023-05-26 14:00:25', '2023-05-26 14:00:25'),
('f708a5d8-3758-4314-a827-895777912143', '36f5887f-2b9b-4144-879c-9be2cff7e466', 'f551b80e-7352-4da9-96dd-1d9c823eb976', NULL, 'USDT', NULL, NULL, 80000.00000000, 0.00000000, '001f094d-d40c-46e1-99c6-5df3cd723630', 'Internal', NULL, NULL, 'completed', '2023-06-13 01:18:56', '2023-06-13 01:18:56'),
('f7769d8d-f9f7-4bee-8e29-47bf92263541', '1ac9db2f-613b-4351-ba36-aa8a8e502079', '4fe673c7-d0f3-4700-9295-410baeace069', NULL, 'ETH', NULL, NULL, 18000.00000000, 0.00000000, 'a09156fb-5992-4e9d-8dde-86c9a6b43255', 'Internal', NULL, NULL, 'completed', '2023-06-02 16:53:39', '2023-06-02 16:53:39'),
('f7c94a90-e44e-43b3-bfc7-3dc007fd9e45', 'd2b09976-3be3-43e8-81ef-d0dd81784cdf', 'f952cecc-9c95-44a0-bfbf-5c04d4573a3c', NULL, 'USDT', NULL, NULL, 11800.00000000, 0.00000000, '82de1045-d7bc-4163-97b3-8d579a63bb01', 'Internal', NULL, NULL, 'completed', '2023-07-26 10:02:41', '2023-07-26 10:02:41'),
('f934b7e2-18b5-4e8a-8c15-d174161291a6', '36f5887f-2b9b-4144-879c-9be2cff7e466', '80e72669-d4f6-4026-bb95-78a67c2615aa', NULL, 'ETH', NULL, NULL, 2100.00000000, 0.00000000, '0c3183f0-1a19-48c8-9196-631e028505bb', 'Internal', NULL, NULL, 'completed', '2023-06-22 23:05:02', '2023-06-22 23:05:02'),
('f9e3ec53-ca44-4c29-acf5-877d5ea3fc28', '86f3c2c9-e4c3-4192-ad1e-d34a6b188833', '8eefb298-0dc9-4045-8b86-2c624f071d78', NULL, 'USDT', NULL, NULL, 250.00000000, 0.00000000, '0eb65812-de84-43a2-9b1f-b895253aa904', 'Internal', NULL, NULL, 'completed', '2023-07-19 09:50:05', '2023-07-19 09:50:05'),
('fa0b52e5-abba-4fff-a995-0cf844e97e1d', '675d5181-9662-4d5a-8e29-924e2b58b24f', 'a7501efe-18bd-40b9-90c6-007507528e0f', NULL, 'USDT', NULL, NULL, 6750.00000000, 0.00000000, '9f43926a-abb4-4134-b4a0-f25c64d95daf', 'Internal', NULL, NULL, 'completed', '2023-07-25 15:40:42', '2023-07-25 15:40:42'),
('fa13c6d6-34be-495a-a4b2-941644e5f868', 'adc69fe5-342e-4db7-83d6-1aa6b50e4217', '01ed1896-0cda-4913-98e2-f84a913c7682', NULL, 'USD', NULL, NULL, 10000.00000000, 0.00000000, '3c6da767-6de8-4cd5-8d66-2b7a2a975db3', 'Internal', NULL, NULL, 'completed', '2023-05-30 10:21:02', '2023-05-30 10:21:02'),
('fb3f9798-94a7-4603-8ae6-79bbfd1865d0', '86f3c2c9-e4c3-4192-ad1e-d34a6b188833', '8eefb298-0dc9-4045-8b86-2c624f071d78', NULL, 'USDT', NULL, NULL, 75.00000000, 0.00000000, '778f9eed-986e-4f6a-b05d-975ec6657ecc', 'Internal', NULL, NULL, 'completed', '2023-07-28 21:24:32', '2023-07-28 21:24:32'),
('fd447b79-f4df-40c2-b75c-d8a3b10fcee6', '60145862-0641-4106-af67-8de47b916abe', '65d81edd-036b-494f-beda-c816811fa041', NULL, 'BTC', NULL, NULL, 35000.00000000, 0.00000000, '6df54dca-553a-4ff3-aff3-533d2ca95896', 'Internal', NULL, NULL, 'completed', '2023-12-14 12:59:45', '2023-12-14 12:59:45'),
('fd5f4763-0697-4cce-86cf-2ebd0ae55e84', 'cb74f45c-280c-42fd-a06e-a4672280c040', 'a488ccea-1a57-4562-bbfa-8ff153815b70', NULL, 'BTC', NULL, NULL, 1200.00000000, 0.00000000, '24c9bf90-cda3-4090-bc8d-760f2eaca424', 'Internal', NULL, NULL, 'completed', '2023-12-18 16:03:16', '2023-12-18 16:03:16'),
('fee491ab-7b50-4247-822f-3c2f7b2aa0af', 'd2b09976-3be3-43e8-81ef-d0dd81784cdf', 'f952cecc-9c95-44a0-bfbf-5c04d4573a3c', NULL, 'USDT', NULL, NULL, 160.00000000, 0.00000000, 'aaccdad1-4db1-461f-a957-f585605d6dbd', 'Internal', NULL, NULL, 'completed', '2023-07-26 10:02:50', '2023-07-26 10:02:50');

-- --------------------------------------------------------

--
-- Table structure for table `wallet_stakes`
--

CREATE TABLE `wallet_stakes` (
  `id` char(36) NOT NULL,
  `user_id` char(36) NOT NULL,
  `wallet_id` char(36) NOT NULL,
  `package_id` char(36) NOT NULL,
  `symbol` varchar(10) NOT NULL,
  `amount` decimal(19,8) UNSIGNED NOT NULL,
  `system_fee` decimal(19,8) UNSIGNED NOT NULL,
  `staking_months` int(10) UNSIGNED NOT NULL,
  `earning` varchar(20) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'processing',
  `completed_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wallet_stakes`
--

INSERT INTO `wallet_stakes` (`id`, `user_id`, `wallet_id`, `package_id`, `symbol`, `amount`, `system_fee`, `staking_months`, `earning`, `status`, `completed_at`, `created_at`, `updated_at`) VALUES
('0e7bc807-6a7c-4a6c-bb5f-e11f98c0cd28', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', '8d0983ec-3fa3-49b0-b250-9f81aa93f07c', '71c289ad-c2f9-442a-9672-dc15ef64e878', 'ETH', 999.90000000, 0.10000000, 1, '1000.00000000', 'processing', '2023-08-07 12:56:03', '2023-07-07 12:56:03', '2023-07-07 12:56:03'),
('117bfc7a-9dca-4eff-b858-67b7201d6b79', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', '8d0983ec-3fa3-49b0-b250-9f81aa93f07c', '71c289ad-c2f9-442a-9672-dc15ef64e878', 'ETH', 9.90000000, 0.10000000, 1, '10.00000000', 'processing', '2024-01-24 17:34:10', '2023-12-24 17:34:10', '2023-12-24 17:34:10'),
('552d07a8-a821-4a6e-a24e-947b2831602a', 'fb35867d-1db8-4b6d-9f19-54ab0b2ddab1', '5a254b67-66c2-414f-97d2-4ff7e7a109b2', '82644f55-66d2-4ca1-94a6-12d751ab1c85', 'BTC', 2999.99000000, 0.01000000, 1, '3000.00000000', 'processing', '2023-07-20 15:03:56', '2023-06-20 15:03:56', '2023-06-20 15:03:56'),
('76d4f4ce-92ae-48c7-97bf-a2a9972ee146', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', '8d0983ec-3fa3-49b0-b250-9f81aa93f07c', '71c289ad-c2f9-442a-9672-dc15ef64e878', 'ETH', 9.90000000, 0.10000000, 1, '10.00000000', 'processing', '2024-01-24 17:43:47', '2023-12-24 17:43:47', '2023-12-24 17:43:47');

-- --------------------------------------------------------

--
-- Table structure for table `wallet_withdrawals`
--

CREATE TABLE `wallet_withdrawals` (
  `id` char(36) NOT NULL,
  `user_id` char(36) NOT NULL,
  `wallet_id` char(36) NOT NULL,
  `bank_account_id` char(36) DEFAULT NULL,
  `symbol` varchar(10) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `amount` decimal(19,8) UNSIGNED NOT NULL,
  `system_fee` decimal(19,8) UNSIGNED NOT NULL DEFAULT 0.00000000,
  `txn_id` varchar(255) DEFAULT NULL,
  `api` varchar(20) DEFAULT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wallet_withdrawals`
--

INSERT INTO `wallet_withdrawals` (`id`, `user_id`, `wallet_id`, `bank_account_id`, `symbol`, `address`, `amount`, `system_fee`, `txn_id`, `api`, `status`, `created_at`, `updated_at`) VALUES
('12f865db-b471-49e5-b651-fb59ba84bd67', 'cb74f45c-280c-42fd-a06e-a4672280c040', '8b679b09-db4b-4acf-88dd-09765bc4d08d', NULL, 'USDT', 'TEGFxfQetWhpJsxZf1qbz7ZXnEEn3FkNnv', 36000.00000000, 0.00000000, NULL, 'TRC20Api', 'email_sent', '2023-07-21 18:16:59', '2023-07-21 18:16:59'),
('18e8324d-ae7e-4357-a676-f093fbfaab32', 'd2b09976-3be3-43e8-81ef-d0dd81784cdf', 'f952cecc-9c95-44a0-bfbf-5c04d4573a3c', NULL, 'USDT', 'TE48jWs8R961ytVZ7Mp75kNaeMoJgcHcCh', 12960.00000000, 0.00000000, NULL, 'TRC20Api', 'email_sent', '2023-07-26 11:35:52', '2023-07-26 11:35:52'),
('1bf74c50-a9d1-45d3-943c-4715039cecfe', '675d5181-9662-4d5a-8e29-924e2b58b24f', 'a7501efe-18bd-40b9-90c6-007507528e0f', NULL, 'USDT', 'TSq5aQ2aUBsFBJqbk9QAycvvUvjm7Doamx', 8250.00000000, 0.00000000, NULL, 'TRC20Api', 'email_sent', '2023-07-25 17:44:02', '2023-07-25 17:44:02'),
('27322017-22f5-4642-a9ae-8e5abcadaffd', '7cde25b7-e520-4fb3-85df-f5fcf89305d3', '64885a8a-f717-42eb-82f8-4701f9cddc6a', NULL, 'USDT', 'TBBKbPtMmgfCACdRtvad8vVqAuDiuxX3Gz', 10000.00000000, 0.00000000, NULL, 'TRC20Api', 'email_sent', '2023-06-12 12:00:51', '2023-06-12 12:00:51'),
('2b146893-4883-4cc7-a475-aec9d461f9bf', 'd2b09976-3be3-43e8-81ef-d0dd81784cdf', 'f952cecc-9c95-44a0-bfbf-5c04d4573a3c', NULL, 'USDT', 'TE48jWs8R961ytVZ7Mp75kNaeMoJgcHcCh', 11960.00000000, 0.00000000, NULL, 'TRC20Api', 'email_sent', '2023-07-26 10:12:58', '2023-07-26 10:12:58'),
('2f5437d2-1b2a-4482-8e0d-14ee44a709ac', '12a277f5-c2ee-44a6-82da-f6f5e03758a9', '1fd60d17-705c-43a3-bcba-2a5226777092', NULL, 'USDT', 'TUtfRhSkjZ1RrKfnXrvAurS8tAjrKZ46Sd', 1000.00000000, 0.00000000, NULL, 'TRC20Api', 'email_sent', '2023-06-01 13:21:59', '2023-06-01 13:21:59'),
('34ec131c-8b4b-4af6-a093-94b8b3cdab58', '12a277f5-c2ee-44a6-82da-f6f5e03758a9', '1fd60d17-705c-43a3-bcba-2a5226777092', NULL, 'USDT', 'TBBKbPtMmgfCACdRtvad8vVqAuDiuxX3Gz', 2000.00000000, 0.00000000, NULL, 'TRC20Api', 'email_sent', '2023-06-01 13:23:31', '2023-06-01 13:23:31'),
('54165e9d-e058-4163-9958-4168d69add3c', '675d5181-9662-4d5a-8e29-924e2b58b24f', 'a7501efe-18bd-40b9-90c6-007507528e0f', NULL, 'USDT', 'TSq5aQ2aUBsFBJqbk9QAycvvUvjm7Doamx', 750.00000000, 0.00000000, NULL, 'TRC20Api', 'email_sent', '2023-07-25 17:57:52', '2023-07-25 17:57:52'),
('7a4fd5a5-0684-425c-8ef6-0c755df91458', '36f5887f-2b9b-4144-879c-9be2cff7e466', '80e72669-d4f6-4026-bb95-78a67c2615aa', NULL, 'ETH', 'TBsQVojhz3UsKFfnXc46erMhgUd6JpYGCE', 2100.00000000, 0.00000000, NULL, 'TRC20Api', 'email_sent', '2023-06-22 23:00:19', '2023-06-22 23:00:19'),
('8dc94f62-04fd-4a2c-85c9-e4a7c05643c5', '36f5887f-2b9b-4144-879c-9be2cff7e466', 'f551b80e-7352-4da9-96dd-1d9c823eb976', NULL, 'USDT', 'TBsQVojhz3UsKFfnXc46erMhgUd6JpYGCE', 80000.00000000, 0.00000000, NULL, 'TRC20Api', 'email_sent', '2023-06-16 00:59:34', '2023-06-16 00:59:34'),
('98cbdcfa-dd1e-47ab-b48d-658c44ece092', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', '7dc9fe74-fa5b-4e1e-aeee-6f9671fc14c0', '40017e9a-c2a2-4e08-a2cc-125e2916c072', 'IRT', NULL, 20000000.00000000, 0.00000000, NULL, 'BankApi', 'reviewing', '2024-01-15 09:42:14', '2024-01-15 09:42:14'),
('9da2b433-47ac-42ac-8c42-3fb29112c4db', 'd72e5177-9169-4d3b-a805-aa9a45da9c32', 'f22409e5-1d8c-40c6-a087-ca6662d23676', NULL, 'USDT', 'TUDgb7377nvoVZnYqfc2Q2QdjB8edJRECx', 35000.00000000, 0.00000000, NULL, 'TRC20Api', 'email_sent', '2023-06-07 11:12:38', '2023-06-07 11:12:38'),
('b7626461-18bc-47f1-8b74-0211a7cd0368', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', 'c57baee2-7a33-46f7-8a14-41f2e70df233', '113d42ba-abbc-40e5-aa2c-52211c8502aa', 'USD', NULL, 10.00000000, 0.00000000, NULL, 'BankApi', 'reviewing', '2023-08-24 06:28:16', '2023-08-24 06:28:16'),
('cbb6970b-6171-47f4-864d-95a5ad766c54', 'fb35867d-1db8-4b6d-9f19-54ab0b2ddab1', '5a254b67-66c2-414f-97d2-4ff7e7a109b2', NULL, 'BTC', 'TVeqBqbW3XDUM5RY3oWfrMqzj8wxsmvs92', 3000.00000000, 0.00000000, NULL, 'TRC20Api', 'email_sent', '2023-06-01 16:59:52', '2023-06-01 16:59:52'),
('cc162af1-d75a-4243-9a6e-f63724c846ed', 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d', '6e579983-e6ed-4b25-a4ff-91a7fbb2fcf2', NULL, 'USDT', 'TRdF5XbLxmRDG347h71Yv9nDk8t898iwog', 5000.00000000, 0.00000000, NULL, 'TRC20Api', 'failed', '2023-06-08 18:29:20', '2023-06-14 18:00:20'),
('eaa32607-f55d-4bbb-8a4d-f0070a2e54f9', 'e7862d9c-fba8-4509-b59b-a4cb4f71ba04', 'e94973ab-1eb2-4cf0-9e47-0998102fc527', NULL, 'USDT', 'TQMHpAKbwqX8JadLuTs1WxAmnk8GRMg7HQ', 155000.00000000, 0.00000000, NULL, 'TRC20Api', 'email_sent', '2023-07-25 06:29:48', '2023-07-25 06:29:48');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `application_settings`
--
ALTER TABLE `application_settings`
  ADD PRIMARY KEY (`slug`);

--
-- Indexes for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bank_accounts_country_id_foreign` (`country_id`),
  ADD KEY `bank_accounts_user_id_index` (`user_id`),
  ADD KEY `bank_accounts_bank_name_index` (`bank_name`);

--
-- Indexes for table `coins`
--
ALTER TABLE `coins`
  ADD PRIMARY KEY (`symbol`);

--
-- Indexes for table `coin_bonuses`
--
ALTER TABLE `coin_bonuses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `symbol` (`symbol`);

--
-- Indexes for table `coin_pairs`
--
ALTER TABLE `coin_pairs`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `coin_pairs_trade_coin_base_coin_unique` (`trade_coin`,`base_coin`),
  ADD KEY `coin_pairs_base_coin_foreign` (`base_coin`);

--
-- Indexes for table `coin_stakes`
--
ALTER TABLE `coin_stakes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `symbol` (`symbol`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ethereum_deposits`
--
ALTER TABLE `ethereum_deposits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ethereum_deposits_user_id_index` (`user_id`);

--
-- Indexes for table `exchanges`
--
ALTER TABLE `exchanges`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exchanges_trade_coin_foreign` (`trade_coin`),
  ADD KEY `exchanges_base_coin_foreign` (`base_coin`),
  ADD KEY `exchanges_order_id_foreign` (`order_id`),
  ADD KEY `exchanges_related_order_id_foreign` (`related_order_id`),
  ADD KEY `exchanges_user_id_index` (`user_id`),
  ADD KEY `exchanges_trade_pair_index` (`trade_pair`),
  ADD KEY `exchanges_order_type_index` (`order_type`);

--
-- Indexes for table `exchange_data`
--
ALTER TABLE `exchange_data`
  ADD PRIMARY KEY (`date`,`trade_pair`),
  ADD KEY `exchange_data_trade_pair_index` (`trade_pair`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gateway_transactions`
--
ALTER TABLE `gateway_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gateway_transactions_logs`
--
ALTER TABLE `gateway_transactions_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `kyc_verifications`
--
ALTER TABLE `kyc_verifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kyc_verifications_user_id_index` (`user_id`),
  ADD KEY `kyc_verifications_status_index` (`status`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `languages_id_unique` (`id`),
  ADD UNIQUE KEY `languages_name_unique` (`name`),
  ADD UNIQUE KEY `languages_short_code_unique` (`short_code`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `navigations`
--
ALTER TABLE `navigations`
  ADD UNIQUE KEY `navigations_slug_unique` (`slug`);

--
-- Indexes for table `notices`
--
ALTER TABLE `notices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_user_id_index` (`user_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_trade_pair_index` (`user_id`,`trade_pair`),
  ADD KEY `orders_user_id_index` (`user_id`),
  ADD KEY `orders_trade_coin_index` (`trade_coin`),
  ADD KEY `orders_base_coin_index` (`base_coin`),
  ADD KEY `orders_trade_pair_index` (`trade_pair`),
  ADD KEY `orders_category_index` (`category`),
  ADD KEY `orders_type_index` (`type`),
  ADD KEY `orders_status_index` (`status`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`),
  ADD UNIQUE KEY `pages_title_unique` (`title`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`),
  ADD KEY `posts_user_id_index` (`user_id`),
  ADD KEY `posts_category_slug_index` (`category_slug`);

--
-- Indexes for table `post_categories`
--
ALTER TABLE `post_categories`
  ADD PRIMARY KEY (`slug`),
  ADD UNIQUE KEY `post_categories_name_unique` (`name`);

--
-- Indexes for table `post_comments`
--
ALTER TABLE `post_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_comments_post_id_foreign` (`post_id`),
  ADD KEY `post_comments_user_id_foreign` (`user_id`);

--
-- Indexes for table `referral_earnings`
--
ALTER TABLE `referral_earnings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `referral_earnings_referrer_user_id_symbol_index` (`referrer_user_id`,`symbol`),
  ADD KEY `referral_earnings_referral_user_id_symbol_index` (`referral_user_id`,`symbol`),
  ADD KEY `referral_earnings_symbol_foreign` (`symbol`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`slug`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`),
  ADD KEY `states_country_id_foreign` (`country_id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tickets_user_id_index` (`user_id`),
  ADD KEY `tickets_assigned_to_index` (`assigned_to`);

--
-- Indexes for table `ticket_comments`
--
ALTER TABLE `ticket_comments`
  ADD PRIMARY KEY (`user_id`,`ticket_id`,`created_at`),
  ADD KEY `ticket_comments_ticket_id_index` (`ticket_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `mobile` (`mobile`),
  ADD KEY `users_assigned_role_foreign` (`assigned_role`);

--
-- Indexes for table `user_activities`
--
ALTER TABLE `user_activities`
  ADD KEY `user_activities_user_id_index` (`user_id`);

--
-- Indexes for table `user_preferences`
--
ALTER TABLE `user_preferences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_preferences_user_id_foreign` (`user_id`);

--
-- Indexes for table `user_profiles`
--
ALTER TABLE `user_profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_profiles_user_id_foreign` (`user_id`);

--
-- Indexes for table `wallets`
--
ALTER TABLE `wallets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wallets_user_id_symbol_index` (`user_id`,`symbol`),
  ADD KEY `wallets_symbol_foreign` (`symbol`),
  ADD KEY `wallets_user_id_index` (`user_id`);

--
-- Indexes for table `wallet_bonuses`
--
ALTER TABLE `wallet_bonuses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wallet_withdrawals_user_id_symbol_index` (`user_id`,`symbol`),
  ADD KEY `wallet_withdrawals_symbol_foreign` (`symbol`),
  ADD KEY `wallet_withdrawals_user_id_index` (`user_id`),
  ADD KEY `wallet_withdrawals_wallet_id_index` (`wallet_id`),
  ADD KEY `package_id` (`package_id`);

--
-- Indexes for table `wallet_deposits`
--
ALTER TABLE `wallet_deposits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wallet_deposits_user_id_symbol_index` (`user_id`,`symbol`),
  ADD KEY `wallet_deposits_symbol_foreign` (`symbol`),
  ADD KEY `wallet_deposits_bank_account_id_foreign` (`bank_account_id`),
  ADD KEY `wallet_deposits_system_bank_account_id_foreign` (`system_bank_account_id`),
  ADD KEY `wallet_deposits_user_id_index` (`user_id`),
  ADD KEY `wallet_deposits_wallet_id_index` (`wallet_id`),
  ADD KEY `wallet_deposits_status_index` (`status`);

--
-- Indexes for table `wallet_stakes`
--
ALTER TABLE `wallet_stakes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wallet_withdrawals_user_id_symbol_index` (`user_id`,`symbol`),
  ADD KEY `wallet_withdrawals_symbol_foreign` (`symbol`),
  ADD KEY `wallet_withdrawals_user_id_index` (`user_id`),
  ADD KEY `wallet_withdrawals_wallet_id_index` (`wallet_id`),
  ADD KEY `package_id` (`package_id`);

--
-- Indexes for table `wallet_withdrawals`
--
ALTER TABLE `wallet_withdrawals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wallet_withdrawals_user_id_symbol_index` (`user_id`,`symbol`),
  ADD KEY `wallet_withdrawals_symbol_foreign` (`symbol`),
  ADD KEY `wallet_withdrawals_bank_account_id_foreign` (`bank_account_id`),
  ADD KEY `wallet_withdrawals_user_id_index` (`user_id`),
  ADD KEY `wallet_withdrawals_wallet_id_index` (`wallet_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=247;

--
-- AUTO_INCREMENT for table `ethereum_deposits`
--
ALTER TABLE `ethereum_deposits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `gateway_transactions`
--
ALTER TABLE `gateway_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=171179923383;

--
-- AUTO_INCREMENT for table `gateway_transactions_logs`
--
ALTER TABLE `gateway_transactions_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  ADD CONSTRAINT `bank_accounts_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `bank_accounts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `coin_bonuses`
--
ALTER TABLE `coin_bonuses`
  ADD CONSTRAINT `coin_bonuses_ibfk_1` FOREIGN KEY (`symbol`) REFERENCES `coins` (`symbol`);

--
-- Constraints for table `coin_pairs`
--
ALTER TABLE `coin_pairs`
  ADD CONSTRAINT `coin_pairs_base_coin_foreign` FOREIGN KEY (`base_coin`) REFERENCES `coins` (`symbol`) ON UPDATE CASCADE,
  ADD CONSTRAINT `coin_pairs_trade_coin_foreign` FOREIGN KEY (`trade_coin`) REFERENCES `coins` (`symbol`) ON UPDATE CASCADE;

--
-- Constraints for table `coin_stakes`
--
ALTER TABLE `coin_stakes`
  ADD CONSTRAINT `coin_stakes_ibfk_1` FOREIGN KEY (`symbol`) REFERENCES `coins` (`symbol`);

--
-- Constraints for table `ethereum_deposits`
--
ALTER TABLE `ethereum_deposits`
  ADD CONSTRAINT `ethereum_deposits_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `exchange_data`
--
ALTER TABLE `exchange_data`
  ADD CONSTRAINT `exchange_data_trade_pair_foreign` FOREIGN KEY (`trade_pair`) REFERENCES `coin_pairs` (`name`) ON UPDATE CASCADE;

--
-- Constraints for table `wallet_bonuses`
--
ALTER TABLE `wallet_bonuses`
  ADD CONSTRAINT `wallet_bonuses_ibfk_1` FOREIGN KEY (`package_id`) REFERENCES `coin_bonuses` (`id`),
  ADD CONSTRAINT `wallet_bonuses_ibfk_2` FOREIGN KEY (`wallet_id`) REFERENCES `wallets` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
