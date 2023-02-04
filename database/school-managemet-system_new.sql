-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 04, 2023 at 07:18 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `school-managemet-system`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_employee_salaries`
--

CREATE TABLE `account_employee_salaries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` int(11) NOT NULL COMMENT 'employee_id=user_id',
  `date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `account_other_costs`
--

CREATE TABLE `account_other_costs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `account_student_fees`
--

CREATE TABLE `account_student_fees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `year_id` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `fee_category_id` int(11) DEFAULT NULL,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assign_students`
--

CREATE TABLE `assign_students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` int(11) NOT NULL COMMENT 'user_id=student_id',
  `roll` int(11) DEFAULT NULL,
  `class_id` int(11) NOT NULL,
  `year_id` int(11) NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `shift_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `assign_students`
--

INSERT INTO `assign_students` (`id`, `student_id`, `roll`, `class_id`, `year_id`, `group_id`, `shift_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 1, 1, 1, '2023-01-29 15:01:03', '2023-01-29 15:01:03');

-- --------------------------------------------------------

--
-- Table structure for table `assign_subjects`
--

CREATE TABLE `assign_subjects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `class_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `full_mark` double NOT NULL,
  `pass_mark` double NOT NULL,
  `subjective_mark` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `designations`
--

CREATE TABLE `designations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `designations`
--

INSERT INTO `designations` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Front-End Developer', '2023-02-03 16:40:30', NULL),
(2, 'Back-End Developer', '2023-02-03 16:40:30', NULL),
(3, 'Mobile Developer', '2023-02-03 16:40:30', NULL),
(4, 'Security', '2023-02-03 16:40:30', NULL),
(5, 'Software Tester', '2023-02-03 16:40:30', NULL),
(6, 'Ui/Ux', '2023-02-03 16:40:30', NULL),
(7, 'Graphic Designer', '2023-02-03 16:40:30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `discount_students`
--

CREATE TABLE `discount_students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `assign_student_id` int(11) NOT NULL,
  `fee_category_id` int(11) DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_attendances`
--

CREATE TABLE `employee_attendances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` int(11) NOT NULL COMMENT 'employee_id=user_id',
  `date` date NOT NULL,
  `attend_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_leaves`
--

CREATE TABLE `employee_leaves` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` int(11) NOT NULL COMMENT 'employee_id=user_id',
  `leave_purpose_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_sallary_logs`
--

CREATE TABLE `employee_sallary_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` int(11) NOT NULL COMMENT 'employee_id=User_id',
  `previous_salary` int(11) DEFAULT NULL,
  `present_salary` int(11) DEFAULT NULL,
  `increment_salary` int(11) DEFAULT NULL,
  `effected_salary` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_types`
--

CREATE TABLE `exam_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exam_types`
--

INSERT INTO `exam_types` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'First Name Exam', '2023-01-29 10:25:10', '2023-01-29 10:25:10');

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
-- Table structure for table `fee_categories`
--

CREATE TABLE `fee_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fee_category_amounts`
--

CREATE TABLE `fee_category_amounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `fee_category_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leave_purposes`
--

CREATE TABLE `leave_purposes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `marks_grades`
--

CREATE TABLE `marks_grades` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `grade_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `grade_point` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_marks` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_marks` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_point` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_point` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remarks` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2020_11_23_192918_create_sessions_table', 1),
(7, '2020_11_27_191622_create_student_classes_table', 1),
(8, '2020_11_27_201955_create_student_years_table', 1),
(9, '2020_11_27_205317_create_student_groups_table', 1),
(10, '2020_11_27_212648_create_student_shifts_table', 1),
(11, '2020_11_28_184513_create_fee_categories_table', 1),
(12, '2020_11_28_193421_create_fee_category_amounts_table', 1),
(13, '2020_11_29_190907_create_exam_types_table', 1),
(14, '2020_11_29_193820_create_school_subjects_table', 1),
(15, '2020_11_30_192807_create_assign_subjects_table', 1),
(16, '2020_11_30_211919_create_designations_table', 1),
(17, '2020_12_02_191137_create_assign_students_table', 1),
(18, '2020_12_02_191735_create_discount_students_table', 1),
(19, '2020_12_09_192120_create_employee_sallary_logs_table', 1),
(20, '2020_12_11_205416_create_leave_purposes_table', 1),
(21, '2020_12_11_210033_create_employee_leaves_table', 1),
(22, '2020_12_13_192045_create_employee_attendances_table', 1),
(23, '2020_12_15_214223_create_student_marks_table', 1),
(24, '2020_12_16_202402_create_marks_grades_table', 1),
(25, '2020_12_18_191232_create_account_student_fees_table', 1),
(26, '2020_12_18_212912_create_account_employee_salaries_table', 1),
(27, '2020_12_20_192742_create_account_other_costs_table', 1),
(28, '2023_02_04_180251_create_table_verifications', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('aabdelrhim974@gmail.com', '$2y$10$Ms6QGI4ex/fusywCLxRcBOft.ripvo.Cu5ZXRHKs.dphdWtmgrXty', '2023-01-29 09:22:41'),
('abdelrhim.admin@gmail.com', '$2y$10$EN1ny73P/HlfKe6m5ekKE.nGd4zuZTKceHNnZtGIQXku47Plp.RBu', '2023-02-03 14:34:07');

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
-- Table structure for table `school_subjects`
--

CREATE TABLE `school_subjects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('PMmC3qtAiwVmLbnzNb4rMzehdVUopGHwYUkdZB5E', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'YTo3OntzOjY6Il90b2tlbiI7czo0MDoid2N6Y0dad0ZLeWk5dm5pdlpaaUNDUVptdUFHSWl6NUNLbElzTjUxRSI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjMwOiJodHRwOi8vMTI3LjAuMC4xOjEwNTAvZGF0YWJhc2UiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJDNQeXBOdUtnT2xKLy5xZVZsckJZME8yeVRpbzlLNUJqOTluTDhpRlQ2WVlNZi50ZVFFTFd5IjtzOjIxOiJwYXNzd29yZF9oYXNoX3NhbmN0dW0iO3M6NjA6IiQyeSQxMCQzUHlwTnVLZ09sSi8ucWVWbHJCWTBPMnlUaW85SzVCajk5bkw4aUZUNllZTWYudGVRRUxXeSI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9', 1675445662),
('sjCW7YMavbNTLf9q8CzZbqRbDqKiuf1oviwTp3F1', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'YTo3OntzOjM6InVybCI7YToxOntzOjg6ImludGVuZGVkIjtzOjMxOiJodHRwOi8vMTI3LjAuMC4xOjEwNTAvZGFzaGJvYXJkIjt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDM6Imh0dHA6Ly8xMjcuMC4wLjE6MTA1MC9wcm9maWxlL3Bhc3N3b3JkL3ZpZXciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjY6Il90b2tlbiI7czo0MDoiVjVTSGt1TWZ0S3FvVlRmd2pFTXFsWnZaR1VSU0R3Y0xadGpsUkNIeSI7czoyMToicGFzc3dvcmRfaGFzaF9zYW5jdHVtIjtzOjYwOiIkMnkkMTAkYTgxTUhEdzJYSC5hbk53UThGekpVZU9XclcvZXFSN2o0ekR1cmN4ak50T3k2eVJNMjNGRHkiO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjYwOiIkMnkkMTAkYTgxTUhEdzJYSC5hbk53UThGekpVZU9XclcvZXFSN2o0ekR1cmN4ak50T3k2eVJNMjNGRHkiO3M6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1675533767),
('Vc6HHqGFfOLzvUQnw3HYnxOV8apEz4grq7i0QTFo', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiQ0FoWEdsYTR0M3hldlJHZWZiVXphRFJaUXR2akxTeU1rc1ZxWVk4ViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xMjcuMC4wLjE6MTA1MC9kYXNoYm9hcmQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjIxOiJwYXNzd29yZF9oYXNoX3NhbmN0dW0iO3M6NjA6IiQyeSQxMCQzUHlwTnVLZ09sSi8ucWVWbHJCWTBPMnlUaW85SzVCajk5bkw4aUZUNllZTWYudGVRRUxXeSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCQzUHlwTnVLZ09sSi8ucWVWbHJCWTBPMnlUaW85SzVCajk5bkw4aUZUNllZTWYudGVRRUxXeSI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9', 1675381760);

-- --------------------------------------------------------

--
-- Table structure for table `student_classes`
--

CREATE TABLE `student_classes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student_classes`
--

INSERT INTO `student_classes` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Ahmed Abdelrhim', '2023-01-29 14:44:36', '2023-01-29 14:44:36');

-- --------------------------------------------------------

--
-- Table structure for table `student_groups`
--

CREATE TABLE `student_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_marks`
--

CREATE TABLE `student_marks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` int(11) NOT NULL COMMENT 'student_id=user_id',
  `id_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `year_id` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `assign_subject_id` int(11) DEFAULT NULL,
  `exam_type_id` int(11) DEFAULT NULL,
  `marks` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_shifts`
--

CREATE TABLE `student_shifts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_years`
--

CREATE TABLE `student_years` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student_years`
--

INSERT INTO `student_years` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Ahmed Abdelrhim', '2023-01-29 14:44:08', '2023-01-29 14:44:08');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `usertype` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Student,Employee,Admin',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `religion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'admin=head of sotware,operator=computer operator,user=employee',
  `join_date` date DEFAULT NULL,
  `designation_id` int(11) DEFAULT NULL,
  `salary` double DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=inactive,1=active',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `usertype`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `mobile`, `address`, `gender`, `image`, `fname`, `mname`, `religion`, `id_no`, `dob`, `code`, `role`, `join_date`, `designation_id`, `salary`, `status`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'Ahmed Abdelrhim', 'abdelrhim.admin@gmail.com', '2023-02-03 15:49:28', '$2y$10$a81MHDw2XH.anNwQ8FzJUeOWrW/eqR7j4zDurcxjNtOy6yRM23FDy', NULL, NULL, '01152067271', 'Egypt , Cairo , Helwan , Elamassara 12-st', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Muslim', NULL, '1999-11-10', NULL, 'Admin', NULL, 1, NULL, 1, 'F00Dxy3DL044fvIi1ofebeRRcrx8SRniLiF0wrpMydMILMtsSXWlnHZNdZyf', NULL, NULL, '2023-01-29 08:41:43', '2023-02-04 18:01:07'),
(2, 'Admin', 'Student One', 'student.one@example.com', '2023-02-03 15:49:28', '$2y$10$hGTXWHLgtXWLglZC/oLZue1ghPhr0k1TIC6Dm1pzPmpAzeH.u9jay', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2951', 'Operator', NULL, 5, NULL, 1, 'KMZabkns2H', NULL, NULL, '2023-01-29 10:45:53', '2023-02-03 16:50:35'),
(8, 'Admin', 'Test Student', 'test.student@gmail.com', '2023-02-03 15:49:28', '$2y$10$kx9Nrh6oOvH8Ky3huQCKguy8tyagOSyDq0zEIuwThx87GtzUDVWZO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '6718', 'Operator', NULL, 1, NULL, 1, 'KMZabkns2H', NULL, NULL, '2023-02-03 00:26:27', '2023-02-03 16:50:35'),
(12, 'Admin', 'Yolanda Lucas', 'syhogehori@mailinator.com', '2023-02-03 15:49:28', '$2y$10$MedG/z.hRAk17oeISjz1T.rOWmUu.t.FDY8kU2BJnR0VrWrGE3ZtG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Operator', NULL, 7, NULL, 1, 'KMZabkns2H', NULL, NULL, '2023-02-03 00:52:00', '2023-02-03 16:50:35'),
(13, 'Admin', 'Lane Wong', 'cahemyt@mailinator.com', '2023-02-03 15:49:28', '$2y$10$B3xG6GO3w90X3GJHFOM.cuLq4wlgCdoFDHGxVO5xON9XW1zMn6WD.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Operator', NULL, 2, NULL, 1, 'jtv6dcQER0', NULL, NULL, '2023-02-03 00:52:59', '2023-02-03 16:50:35'),
(14, 'Admin', 'Simone Finley', 'mahamaseky@mailinator.com', '2023-02-03 15:49:28', '$2y$10$.fQUR6.y3Nr3SbA77q2kpeXf0DATHAvwhNYMJocowAW1/ZbXzDQOO', NULL, NULL, NULL, NULL, 'Male', NULL, NULL, NULL, NULL, NULL, NULL, '', 'Admin', NULL, 3, NULL, 1, 'KMZabkns2H', NULL, NULL, '2023-02-03 00:53:55', '2023-02-03 16:50:35'),
(15, 'Admin', 'Celeste James', 'pesunek@mailinator.com', '2023-02-03 15:49:28', '$2y$10$wqj.DDmBb6MWbOfdgjHPjuNErsSLgoX6zW4E5YcN3LxshUuVLD17e', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Operator', NULL, 3, NULL, 1, 'YxkOVW414W', NULL, NULL, '2023-02-03 00:54:19', '2023-02-03 16:50:35'),
(16, 'Admin', 'Dr. Korbin Kunde', 'ken.grimes@example.net', '2023-02-03 15:49:28', '$2y$10$B1xPtHEOlya/kibx3JfM9u1tAVXWOr9fGTEC0FJ5yZROwRIUmvDgO', NULL, NULL, '0102343323', '32308 Wendell Trail\nLake Dallasside, NV 42921', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Jewish', NULL, '1982-11-14', NULL, 'Operator', NULL, 3, NULL, 1, '3Vtlyatxie', NULL, NULL, '2023-02-03 15:49:28', '2023-02-03 16:50:35'),
(17, 'Admin', 'Lavon Cummings', 'kenneth34@example.com', '2023-02-03 15:49:28', '$2y$10$p4fzBncYj0Z9fI2Ofyo2DOo3xIuzcKytFizrXGLYlWShuAMSm1D.S', NULL, NULL, '0122756239', '242 McGlynn Lock\nEthelland, WA 68253', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Jewish', NULL, '1972-11-27', NULL, 'Operator', NULL, 3, NULL, 1, 'linhvDbMqX', NULL, NULL, '2023-02-03 15:49:28', '2023-02-03 16:50:35'),
(18, 'Admin', 'Dr. Ferne Kuhlman', 'jordan.huels@example.net', '2023-02-03 15:49:28', '$2y$10$gTfhdkkld3cL1L6.bhQnku05N8IxhqWvUC.W/R2sNNVcNTIFPY2J2', NULL, NULL, '0125081317', '716 Paolo Unions\nPort Rethatown, OK 55471-4030', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Muslim', NULL, '1987-03-15', NULL, 'Operator', NULL, 2, NULL, 1, 'ji4BifuhjL', NULL, NULL, '2023-02-03 15:49:28', '2023-02-03 16:50:35'),
(19, 'Admin', 'Marie Steuber', 'cartwright.alexzander@example.org', '2023-02-03 15:49:28', '$2y$10$UQL4H1D0BeJv1Z5B2nFY0OocSFc191BBQnSahE/7/8LmCWHPPNUE2', NULL, NULL, '0121693041', '24298 Eula Stream\nPredovicstad, MO 13538', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Jewish', NULL, '1979-03-15', NULL, 'Operator', NULL, 5, NULL, 1, 'YxkOVW414W', NULL, NULL, '2023-02-03 15:49:28', '2023-02-03 16:50:35'),
(20, 'Admin', 'Mariano Zemlak', 'marilie82@example.com', '2023-02-03 15:49:28', '$2y$10$dUTKnS62loa/zpCzcCF9I.3f8LP7pGF5nL7gReunGIHShImVta7iC', NULL, NULL, '0119165654', '7593 Price Avenue Apt. 297\nWest Kendraside, DE 45309', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Atheist', NULL, '1990-05-31', NULL, 'Operator', NULL, 1, NULL, 1, '7Yy0CNJwOk', NULL, NULL, '2023-02-03 15:49:28', '2023-02-03 16:50:35'),
(21, 'Admin', 'Benton Spinka', 'wmcclure@example.com', '2023-02-03 15:49:28', '$2y$10$plfdLaJAMVtiwICvYEoBRe9bx/ZPXchCSGucdCSClaaDW.AbX6iti', NULL, NULL, '0108466439', '603 Jakubowski Corners\nPort Alfonzo, IN 52790-5877', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Atheist', NULL, '1996-10-13', NULL, 'Operator', NULL, 6, NULL, 1, 'KMZabkns2H', NULL, NULL, '2023-02-03 15:49:28', '2023-02-03 16:50:35'),
(22, 'Admin', 'Miss Abigayle Ryan IV', 'hbergstrom@example.com', '2023-02-03 15:49:28', '$2y$10$vMgjQGbJAevy7M9Ek.m6OeKo6wfE7GmACf0QGaIX5O6W5Va03Kye.', NULL, NULL, '0112789151', '62124 Jakob Corner Apt. 382\nHalvorsonstad, WV 85823-4491', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Muslim', NULL, '1984-02-16', NULL, 'Operator', NULL, 7, NULL, 1, 'h7NP9vbDIL', NULL, NULL, '2023-02-03 15:49:28', '2023-02-03 16:50:35'),
(23, 'Admin', 'Garrison Hermann', 'tmoen@example.net', '2023-02-03 15:49:28', '$2y$10$IySxYPdTovT5tGlKHbAsi.F604RUV2O2nOueASoO6SLCroR3K7TqG', NULL, NULL, '0124303759', '8727 Littel Port Suite 201\nSouth Annabel, CO 25089', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Atheist', NULL, '1987-12-01', NULL, 'Operator', NULL, 2, NULL, 1, 'vBYzKmv5LL', NULL, NULL, '2023-02-03 15:49:28', '2023-02-03 16:50:35'),
(24, 'Admin', 'Junior Rice', 'avery51@example.org', '2023-02-03 15:49:28', '$2y$10$kZx8LlsXpqlgHWYo2G8DJufyHl4zbqJyXvLOY6aVPrwAcJZEv8qV2', NULL, NULL, '0101220265', '83642 Connelly Springs Apt. 615\nSouth Enosmouth, CA 43446', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Atheist', NULL, '2002-03-21', NULL, 'Operator', NULL, 5, NULL, 1, 'NuiZxTXpli', NULL, NULL, '2023-02-03 15:49:28', '2023-02-03 16:50:35'),
(25, 'Admin', 'Rylan Ernser', 'ajohnson@example.com', '2023-02-03 15:49:28', '$2y$10$VRrfC1Gsp.Kyplj0PAj3K.MJNMKzE40j97FfKHYJ3LWFEXfKFujUm', NULL, NULL, '0123028886', '82288 Baby Tunnel Apt. 992\nWisozktown, IL 00425', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Muslim', NULL, '1993-09-18', NULL, 'Operator', NULL, 4, NULL, 1, 'XUwroyJELk', NULL, NULL, '2023-02-03 15:49:28', '2023-02-03 16:50:35'),
(26, 'Admin', 'Napoleon Schaefer', 'jarret62@example.net', '2023-02-03 15:49:28', '$2y$10$8qPMNZNAqXCfQgLE7g3m4eStqTHIms5hQxUYCmOZ8fvUJfyIHygNi', NULL, NULL, '0102920574', '93450 Gaston Vista\nSengermouth, OK 96590', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Atheist', NULL, '1994-08-25', NULL, 'Operator', NULL, 7, NULL, 1, 'jtv6dcQER0', NULL, NULL, '2023-02-03 15:49:28', '2023-02-03 16:50:35'),
(27, 'Admin', 'Lucas Kris', 'bjohnston@example.com', '2023-02-03 15:49:28', '$2y$10$/FnJhzSUyfztHdvAq5Ybv./5Q8iX3ixB7tMY3K1UO0Z81ISmwpxwO', NULL, NULL, '0111810493', '539 Okuneva Vista\nWest Nehaville, GA 34092-7958', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Muslim', NULL, '2006-08-18', NULL, 'Operator', NULL, 1, NULL, 1, 'oomxhXHeVv', NULL, NULL, '2023-02-03 15:49:28', '2023-02-03 16:50:35'),
(28, 'Admin', 'Kaden Zulauf', 'hillary.goodwin@example.net', '2023-02-03 15:49:28', '$2y$10$ZdUWRpGXPXjIOBktzoaSpu2uUsIoKBM6QClf49WeUEEe.x5WDHefe', NULL, NULL, '0108270845', '70106 April Landing\nNew Filomenaborough, UT 17872-0535', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Atheist', NULL, '2003-04-25', NULL, 'Operator', NULL, 6, NULL, 1, 'sTLQsORwe4', NULL, NULL, '2023-02-03 15:49:28', '2023-02-03 16:50:35'),
(29, 'Admin', 'Cordia Boyer', 'corene05@example.net', '2023-02-03 15:49:28', '$2y$10$Vjy.KO6sfOsKPF.w7VsKHuL5wiKxUTbS4JRAUZAgCJ9VrEzqSvp4i', NULL, NULL, '0109400999', '16135 Barton Island Apt. 870\nGislasonfort, WI 30087-5408', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Jewish', NULL, '1997-12-21', NULL, 'Operator', NULL, 6, NULL, 1, 'nsTvUl1Fro', NULL, NULL, '2023-02-03 15:49:28', '2023-02-03 16:50:35'),
(30, 'Admin', 'Prof. Nina McGlynn PhD', 'lura47@example.org', '2023-02-03 15:49:28', '$2y$10$OnjuF6hgEv782JRHpWubzuqACvdYLwRPs9AAnv7MBJXwEK.ai4Yba', NULL, NULL, '0104808428', '77778 Blanda Brooks Suite 385\nNew Hazel, HI 44059-1534', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Atheist', NULL, '1983-06-05', NULL, 'Operator', NULL, 2, NULL, 1, 'mdgIOoeXK9', NULL, NULL, '2023-02-03 15:49:29', '2023-02-03 16:50:35'),
(31, 'Admin', 'Diamond Carroll', 'lockman.ova@example.net', '2023-02-03 15:49:29', '$2y$10$y1G7JLkIZRfFy2RffKcRM.WbtWHLxzn/Dk.wTv3oVg0/BIYxU4ocO', NULL, NULL, '0116155942', '536 D\'Amore Station Apt. 473\nOberbrunnerchester, MI 11323-6273', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Jewish', NULL, '1974-07-04', NULL, 'Operator', NULL, 4, NULL, 1, 'DjVg0nWTry', NULL, NULL, '2023-02-03 15:49:29', '2023-02-03 16:50:35'),
(32, 'Admin', 'Grace Bernier', 'rachael58@example.com', '2023-02-03 15:49:29', '$2y$10$jwnWz7Yzny5RSfDjFR9Ge.5ZV2SaPDxAirLimNnG5YJ6T32NFy0JS', NULL, NULL, '0118946460', '604 Nichole Lake\nLake Dixieshire, UT 93402-8277', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Muslim', NULL, '1994-04-03', NULL, 'Operator', NULL, 1, NULL, 1, 'N0PHMfI5Lc', NULL, NULL, '2023-02-03 15:49:29', '2023-02-03 16:50:35'),
(33, 'Admin', 'Scarlett Hyatt', 'vernie.considine@example.com', '2023-02-03 15:49:29', '$2y$10$HZf1iPNiJ5PioYVIpgjnP.i32E7lbMSsvLwmfPDZXKP1R0DVJvhpq', NULL, NULL, '011798413', '4400 Dallas Rue\nLake Jaylin, AL 27364-3357', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Atheist', NULL, '1985-09-26', NULL, 'Operator', NULL, 3, NULL, 1, '0kbSppHsGH', NULL, NULL, '2023-02-03 15:49:29', '2023-02-03 16:50:35'),
(34, 'Admin', 'Mr. Muhammad Torp', 'bmclaughlin@example.org', '2023-02-03 15:49:29', '$2y$10$uUDoyCqOQ25sVpS/C4G55O4o8H3vQrz0E5xBe20NQZs0PvcbBH4o6', NULL, NULL, '0114691652', '2826 Oliver Bypass\nLake Gaetano, DE 40573', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Jewish', NULL, '2004-11-24', NULL, 'Operator', NULL, 2, NULL, 1, '9zoVL1PZyw', NULL, NULL, '2023-02-03 15:49:29', '2023-02-03 16:50:35'),
(35, 'Admin', 'Barrett Pouros', 'kuhlman.okey@example.com', '2023-02-03 15:49:29', '$2y$10$2Kjm5RaVl54px0hCDKqrVusaP.IBcJQCYrMVSTjsKGnc8ru.rapZe', NULL, NULL, '0125342301', '64056 Lesch Stravenue\nPort Magnusview, TN 51836', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Christian', NULL, '1982-04-22', NULL, 'Operator', NULL, 3, NULL, 1, 'VjG94BGnyu', NULL, NULL, '2023-02-03 15:49:29', '2023-02-03 16:50:35'),
(36, 'Admin', 'Nettie Cole', 'klocko.earnest@example.net', '2023-02-03 15:49:29', '$2y$10$9PJRXpnssrFHvDEskyFR6.jrG8bUXL4.IRWg8lKdT2ErtmSTN89ai', NULL, NULL, '0128207555', '360 Alexandra Highway Apt. 674\nMikaylamouth, IA 99105', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Muslim', NULL, '2012-12-24', NULL, 'Operator', NULL, 1, NULL, 1, 'VPTfTpv0dh', NULL, NULL, '2023-02-03 15:49:29', '2023-02-03 16:50:35'),
(37, 'Admin', 'Kirk Fisher', 'wallace09@example.net', '2023-02-03 15:49:29', '$2y$10$PG99HYtygRkPoIDR6GIKTOQO4lybhT7SPuoyxuPebbdbrY00StLvq', NULL, NULL, '0105097254', '749 Okey Summit Suite 364\nQuigleyfort, DE 44084', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Muslim', NULL, '1980-10-26', NULL, 'Operator', NULL, 6, NULL, 1, '1OESrZrGnr', NULL, NULL, '2023-02-03 15:49:29', '2023-02-03 16:50:35'),
(38, 'Admin', 'Madyson O\'Keefe', 'larkin.rickey@example.org', '2023-02-03 15:49:29', '$2y$10$NSk41871R5Ybc5X65KSVEePYRN9Gon5SlhPb3mL9BxNfHQa/JbQAO', NULL, NULL, '0121541400', '171 Hayden Neck Apt. 578\nPort Lydiaville, MA 62362-4784', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Jewish', NULL, '1988-05-07', NULL, 'Operator', NULL, 5, NULL, 1, 'zuFICNvA0s', NULL, NULL, '2023-02-03 15:49:29', '2023-02-03 16:50:35'),
(39, 'Admin', 'Prof. Leon Haag', 'jessika75@example.org', '2023-02-03 15:49:29', '$2y$10$seiA5CEXk1jbYXxxOG4fJemGp9Yu5E/3zeQ.vr.6LGesQSdUYROaG', NULL, NULL, '0117631316', '88321 Cesar Road\nMorarside, AR 66763', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Muslim', NULL, '2005-05-22', NULL, 'Operator', NULL, 3, NULL, 1, 'wh14vS4tlT', NULL, NULL, '2023-02-03 15:49:29', '2023-02-03 16:50:35'),
(40, 'Admin', 'Piper McClure', 'kevin94@example.org', '2023-02-03 15:49:29', '$2y$10$gDvo6p2wkyaplJeCXkhMhOL3blvfHXMQA0Gy7qcztYTeeKxU3WdMq', NULL, NULL, '01040956', '42707 McLaughlin Islands\nJoanymouth, NY 79639-9411', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Atheist', NULL, '2008-10-24', NULL, 'Operator', NULL, 2, NULL, 1, 'qL0U394ilj', NULL, NULL, '2023-02-03 15:49:29', '2023-02-03 16:50:35'),
(41, 'Admin', 'Dr. Leopoldo McGlynn', 'eugene.hoeger@example.net', '2023-02-03 15:49:29', '$2y$10$jCvseXBkQqVChZCK/WgiHu/aHpouenvIMaJMIEr6pGIK/BS.X0JCG', NULL, NULL, '0126827647', '10339 Randall Extensions Apt. 624\nSauerborough, NJ 30136-0226', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Muslim', NULL, '1998-08-03', NULL, 'Operator', NULL, 3, NULL, 1, 'NdEskC0oP5', NULL, NULL, '2023-02-03 15:49:29', '2023-02-03 16:50:35'),
(42, 'Admin', 'Chelsie Tillman', 'nspencer@example.com', '2023-02-03 15:49:29', '$2y$10$w6j.MCIpEqQHiyzpXatqSeeH9ayKvWlUHU2/mHP.vaQPLOFGEdY4y', NULL, NULL, '0105097064', '9372 Von Street\nNigelfurt, MO 65152-6362', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Jewish', NULL, '2009-05-30', NULL, 'Operator', NULL, 2, NULL, 1, 'OHNWuXcY29', NULL, NULL, '2023-02-03 15:49:29', '2023-02-03 16:50:35'),
(43, 'Admin', 'Cyrus Marvin', 'ohill@example.net', '2023-02-03 15:49:29', '$2y$10$qGG6wB9..bT0fiteqoyi0uFIZ4atgCaU2VuvJhe5cRz/d0YTbH0xS', NULL, NULL, '0105387909', '666 Daisha Village Suite 867\nLake Jeromestad, MT 76363-5745', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Jewish', NULL, '2002-12-23', NULL, 'Operator', NULL, 3, NULL, 1, 'HC6sHqZWHH', NULL, NULL, '2023-02-03 15:49:29', '2023-02-03 16:50:35'),
(44, 'Admin', 'Everett Williamson', 'kory.stiedemann@example.net', '2023-02-03 15:49:29', '$2y$10$/q0IoMMmrfuS.1bDikeYJu3Jcb.5nbSzas6fOY7dhQOXcHbI/HSQ6', NULL, NULL, '0121643471', '432 Cristal Inlet\nLake Francesshire, SC 95588', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Muslim', NULL, '2003-06-25', NULL, 'Operator', NULL, 3, NULL, 1, 'Kwux8RjOFm', NULL, NULL, '2023-02-03 15:49:29', '2023-02-03 16:50:35'),
(45, 'Admin', 'Darron Cronin', 'otis00@example.net', '2023-02-03 15:49:29', '$2y$10$WuUsg.HuUl7NgNKNGwhXOOaz63M3h69utXKFyi8B3JhZy2srZMe.G', NULL, NULL, '0127072334', '9783 Rogahn Ridges Suite 459\nLake Prestonmouth, NH 77107-0696', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Atheist', NULL, '1987-12-11', NULL, 'Operator', NULL, 6, NULL, 1, 'KaoANKGUo3', NULL, NULL, '2023-02-03 15:49:29', '2023-02-03 16:50:35'),
(46, 'Admin', 'Jamaal Wilderman', 'whitney82@example.net', '2023-02-03 15:49:29', '$2y$10$h1n1Rkq1UGn8O98RZHpy5OZYIWJ54U6THkawMaVUPMeazt3ORpGd.', NULL, NULL, '0111828343', '1618 Mueller Haven Suite 426\nWest Hester, MI 05693-5775', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Jewish', NULL, '2004-01-24', NULL, 'Operator', NULL, 2, NULL, 1, 'nqtTydhqn4', NULL, NULL, '2023-02-03 15:49:29', '2023-02-03 16:50:35'),
(47, 'Admin', 'Kira Mitchell', 'pierce29@example.net', '2023-02-03 15:49:29', '$2y$10$E4acpkCYoQUxUZAbMUhT7OGtb96VNtzxGaFRp4tXHATYHoGuZ463W', NULL, NULL, '0102433699', '11657 Geovanny Spur\nNew Ericka, OR 37397-0365', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Jewish', NULL, '1995-08-07', NULL, 'Operator', NULL, 6, NULL, 1, 'MMkKgPUk7L', NULL, NULL, '2023-02-03 15:49:30', '2023-02-03 16:50:35'),
(48, 'Admin', 'Katelyn Dickens', 'rkoelpin@example.net', '2023-02-03 15:49:30', '$2y$10$hQ/qmZmeb2FUNjJP5XKjUeu/MXqIVckkNjf1Cor3b7QAHBqaYB1PG', NULL, NULL, '0124017437', '158 Rosina Road Apt. 782\nMayerborough, CA 97627', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Atheist', NULL, '1982-01-23', NULL, 'Operator', NULL, 6, NULL, 1, '6GnfxfKNne', NULL, NULL, '2023-02-03 15:49:30', '2023-02-03 16:50:35'),
(49, 'Admin', 'Maude Dibbert', 'emmerich.drake@example.com', '2023-02-03 15:49:30', '$2y$10$z4GcKgzhmdDuLfY.1ZiCQOxABZAZX9zkpCjm4LkzavdVJVqv8qYBS', NULL, NULL, '0103292195', '97142 Baumbach Mount\nEast Karine, OR 87208', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Christian', NULL, '2011-09-30', NULL, 'Operator', NULL, 3, NULL, 1, 'F2tABOTZjZ', NULL, NULL, '2023-02-03 15:49:30', '2023-02-03 16:50:35'),
(50, 'Admin', 'Deon Hammes', 'florine.murphy@example.net', '2023-02-03 15:49:30', '$2y$10$cm3Y9G88V4Kzvjbkau0Opu1fPbYhLyRDJYU8BMTMu2ReXsPWXhFjC', NULL, NULL, '0124479029', '288 Gerald Stream Suite 631\nMarianostad, AR 38205', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Christian', NULL, '2007-05-18', NULL, 'Operator', NULL, 5, NULL, 1, 'ufbYwFzbuy', NULL, NULL, '2023-02-03 15:49:30', '2023-02-03 16:50:35'),
(51, 'Admin', 'Lolita Turner V', 'janelle.kerluke@example.com', '2023-02-03 15:49:30', '$2y$10$Y/IH.qqNqU0ada3hmelo2eKNFvs4urEoN4OlCtlGmgQQf9Y5.6lBm', NULL, NULL, '0117313778', '134 Kerluke Crossing\nHuelsmouth, MS 06325', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Muslim', NULL, '1983-02-16', NULL, 'Operator', NULL, 3, NULL, 1, 'WFUir1JhsZ', NULL, NULL, '2023-02-03 15:49:30', '2023-02-03 16:50:35'),
(52, 'Admin', 'Alva Luettgen', 'sister31@example.org', '2023-02-03 15:49:30', '$2y$10$ON4FoS/GsezxFLh3Y1t/9OZz/O50pBoqpO.3rjyFjB0ekVZc7LzOW', NULL, NULL, '0109513006', '430 Sadie Mountains\nCoybury, HI 44150-0060', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Christian', NULL, '1977-04-28', NULL, 'Operator', NULL, 5, NULL, 1, 'gfALcC5k6S', NULL, NULL, '2023-02-03 15:49:30', '2023-02-03 16:50:35'),
(53, 'Admin', 'Libby Davis Sr.', 'chad33@example.org', '2023-02-03 15:49:30', '$2y$10$iQBMmKwO08NzetKvbiS2v./7AKSD6YTNtG8hJzQybmIlEibSf/n1C', NULL, NULL, '0109287015', '47342 Cronin Harbor Apt. 346\nErnieland, OR 26415-2582', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Atheist', NULL, '1976-10-19', NULL, 'Operator', NULL, 5, NULL, 1, 'YfNSM2n0bF', NULL, NULL, '2023-02-03 15:49:30', '2023-02-03 16:50:35'),
(54, 'Admin', 'Ms. Magnolia Rowe', 'chaya.kulas@example.com', '2023-02-03 15:49:30', '$2y$10$yt39ZJQIGrukFY0kh6/gSeRCpHAVi72mbmxTVMfzjGG2wtrlV5MzW', NULL, NULL, '0117206331', '380 Reinhold Ports Apt. 749\nWest Kiara, IA 19630', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Muslim', NULL, '1986-01-02', NULL, 'Operator', NULL, 2, NULL, 1, '4u38NOy2Fo', NULL, NULL, '2023-02-03 15:49:30', '2023-02-03 16:50:35'),
(55, 'Admin', 'Merlin Murphy', 'rosella.corwin@example.com', '2023-02-03 15:49:30', '$2y$10$76VVkgmqTKm4v0Iwf.zMzuKALi0Uab.xkByGPiJfj2t.Lv7.9it7C', NULL, NULL, '0127175125', '80321 Sylvia Point Suite 066\nSouth Jamir, WI 07683-0833', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Christian', NULL, '2009-03-10', NULL, 'Operator', NULL, 4, NULL, 1, 'nCIobGxukw', NULL, NULL, '2023-02-03 15:49:30', '2023-02-03 16:50:35'),
(56, 'Admin', 'Dr. Christian Okuneva Jr.', 'ellen05@example.org', '2023-02-03 15:49:30', '$2y$10$JJmJ6gHOMHAaWb3W/w3oXeqbZ6fRqsx6hQRpxjoEwKQ4IxXwqKSli', NULL, NULL, '0126033779', '485 Lambert Grove Suite 211\nBeertown, ND 59017', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Christian', NULL, '1989-06-10', NULL, 'Operator', NULL, 7, NULL, 1, '03IPUG1Klj', NULL, NULL, '2023-02-03 15:49:30', '2023-02-03 16:50:35'),
(57, 'Admin', 'Susie Gaylord DDS', 'kertzmann.ebba@example.org', '2023-02-03 15:49:30', '$2y$10$ZccUq83iE65VkfvVlWKWZOZERaz4L6QC0f4GV.sYPgFtCxShvSUq6', NULL, NULL, '011960313', '88629 Wiza Grove Suite 645\nWest Minnieton, NC 73364-5630', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Christian', NULL, '1994-10-27', NULL, 'Operator', NULL, 3, NULL, 1, 'GxlKMMvplD', NULL, NULL, '2023-02-03 15:49:30', '2023-02-03 16:50:35'),
(58, 'Admin', 'Makayla Bergnaum PhD', 'abigale.goyette@example.com', '2023-02-03 15:49:30', '$2y$10$r3FAiAI2WipZqT0eIK5otughhCaEsSIxFop7bb493Pikt52TOMRx2', NULL, NULL, '0123413691', '97774 Reina Run Apt. 442\nJerodhaven, OH 91945-8195', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Jewish', NULL, '2009-05-13', NULL, 'Operator', NULL, 7, NULL, 1, 'gEeXzGkBLf', NULL, NULL, '2023-02-03 15:49:30', '2023-02-03 16:50:35'),
(59, 'Admin', 'Brice Willms', 'mmcdermott@example.org', '2023-02-03 15:49:30', '$2y$10$lSwdXYcfVTyBMwRy4YCEzesseUDJnmL9VrrE4VsgszzPmNREt5Bna', NULL, NULL, '0115074587', '78431 Buckridge Green\nNorth Emeryfurt, MA 60367-3368', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Muslim', NULL, '1990-03-04', NULL, 'Operator', NULL, 3, NULL, 1, 'aXAEsva6V1', NULL, NULL, '2023-02-03 15:49:30', '2023-02-03 16:50:35'),
(60, 'Admin', 'Constance Hickle', 'bgislason@example.net', '2023-02-03 15:49:30', '$2y$10$1ScGFcHjzdbeBr1q1UQMZ.UGezO1XAF30aT018BxXZYz8lbEfAnPq', NULL, NULL, '0115324504', '58701 Webster Ferry Suite 797\nHyatthaven, MA 55341', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Atheist', NULL, '1976-05-13', NULL, 'Operator', NULL, 1, NULL, 1, 'GM4FttZl6H', NULL, NULL, '2023-02-03 15:49:30', '2023-02-03 16:50:35'),
(61, 'Admin', 'Cary Miller', 'michaela.goldner@example.com', '2023-02-03 15:49:30', '$2y$10$5zLzYqjSv.6gbXalCJ31VecDYy879QFiXW44yWeRUCa.pp5Cjtw1i', NULL, NULL, '0123218587', '2734 Mitchell Estates\nWest Clementinaville, VA 58431-6251', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Jewish', NULL, '1981-08-28', NULL, 'Operator', NULL, 2, NULL, 1, 'XTWS7Vz9Mz', NULL, NULL, '2023-02-03 15:49:30', '2023-02-03 16:50:35'),
(62, 'Admin', 'Mckenzie Tromp PhD', 'otha.lind@example.com', '2023-02-03 15:49:30', '$2y$10$SGw018Z.rK38MA0ey1vYKOrYKI9jTuVpyksc7RN5ZAqyimW3FLKDG', NULL, NULL, '0115211858', '95108 Homenick Loaf\nWest Jeanchester, MS 57356-3346', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Jewish', NULL, '2011-09-11', NULL, 'Operator', NULL, 1, NULL, 1, 'ID89n5VJHn', NULL, NULL, '2023-02-03 15:49:30', '2023-02-03 16:50:35'),
(63, 'Admin', 'Gregg Bechtelar', 'fkuvalis@example.org', '2023-02-03 15:49:30', '$2y$10$flSa.pj2pcIU9jrQIBdaIOTTC2kgIqU8PwJ9zKcjP00sVVmwPzMlW', NULL, NULL, '0125404599', '370 Boyer Ranch Apt. 082\nNorth Eleazarshire, UT 94527', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Jewish', NULL, '2007-10-24', NULL, 'Operator', NULL, 7, NULL, 1, 'scWOpFPyiv', NULL, NULL, '2023-02-03 15:49:30', '2023-02-03 16:50:35'),
(64, 'Admin', 'Serenity Spencer', 'norwood24@example.net', '2023-02-03 15:49:30', '$2y$10$bSrNAAuzxnpQ.cLs21CkvesUfJmqwMTBl1Ojol9WCHUJvANDM..Nq', NULL, NULL, '0128427410', '5223 Luther Street Apt. 399\nSouth Constantin, ID 89891', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Jewish', NULL, '1972-08-26', NULL, 'Operator', NULL, 1, NULL, 1, '5YWICOQo4c', NULL, NULL, '2023-02-03 15:49:31', '2023-02-03 16:50:35'),
(65, 'Admin', 'Mittie Schuppe', 'arno04@example.org', '2023-02-03 15:49:31', '$2y$10$4/HGo5q/32bZzaaQZ2tJIuwqPFMGPFOqctnalgds4zvIdAUUDq1gC', NULL, NULL, '0121361362', '5303 Hilpert Ridges\nBahringerville, SC 06183', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Atheist', NULL, '1986-06-22', NULL, 'Operator', NULL, 6, NULL, 1, 'Gxqt4O4XGz', NULL, NULL, '2023-02-03 15:49:31', '2023-02-03 16:50:35'),
(66, 'Admin', 'Michael Barton V', 'ulises07@example.com', '2023-02-03 15:56:48', '$2y$10$trKOpfl6.cErEFG/ETQjXuYmHI4aJNjk6oYniDBpvfLN3zNAHMOoS', NULL, NULL, '0102931636', '405 Jaskolski Crossroad\nNew Cyrus, NM 85103-4361', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Christian', NULL, '2002-11-28', NULL, 'Operator', NULL, 4, NULL, 1, 'fXomdSJkfr', NULL, NULL, '2023-02-03 15:56:48', '2023-02-03 16:50:35'),
(67, 'Admin', 'Miss Colleen Hintz', 'jonathan19@example.com', '2023-02-03 15:56:48', '$2y$10$9ZDDwA5g3ta8TYrKfwpmluxa1jbfIWdr0HvwawgmULFNho5BhbM8m', NULL, NULL, '0113551621', '109 Lucius Corner Suite 690\nEichmannbury, PA 20875-5188', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Christian', NULL, '1998-09-17', NULL, 'Operator', NULL, 2, NULL, 1, 'lN4zY4yOHe', NULL, NULL, '2023-02-03 15:56:48', '2023-02-03 16:50:35'),
(68, 'Admin', 'Ashlynn Gutmann', 'yrutherford@example.com', '2023-02-03 15:56:48', '$2y$10$CWAarSeuXz2Ax0hTgXi4Jencb5x5tBHnLQb1hBEYQlHN8KsdhB1Oe', NULL, NULL, '0127230153', '189 Schuppe Drive\nSouth Jayceeville, MS 11940', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Jewish', NULL, '1980-01-08', NULL, 'Operator', NULL, 4, NULL, 1, 'ZCjDUQ21rJ', NULL, NULL, '2023-02-03 15:56:49', '2023-02-03 16:50:35'),
(69, 'Admin', 'Zachariah Robel', 'johanna.paucek@example.org', '2023-02-03 15:56:49', '$2y$10$rfyir7ZpuR.eUyzANqjJvu1j7Hh006ikT8cUhLC.jeXOFdW6EIc12', NULL, NULL, '0112132363', '640 Addie Forest\nGriffinstad, WI 68320', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Christian', NULL, '1995-08-13', NULL, 'Operator', NULL, 4, NULL, 1, '0mGry8Ye8k', NULL, NULL, '2023-02-03 15:56:49', '2023-02-03 16:50:35'),
(70, 'Admin', 'Marianne Jacobs', 'esmeralda.ondricka@example.net', '2023-02-03 15:56:49', '$2y$10$ww/brNuC5j6MfviXS/UkA.22VKaX5GfHsKDu58oZKViHz2EvGZx/i', NULL, NULL, '0109080151', '780 Jamison Via\nWest Misael, OH 11084', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Christian', NULL, '2004-06-01', NULL, 'Operator', NULL, 1, NULL, 1, 'cd4eY60zBb', NULL, NULL, '2023-02-03 15:56:49', '2023-02-03 16:50:35'),
(71, 'Admin', 'Ms. Cleta Spinka III', 'ana23@example.org', '2023-02-03 15:56:49', '$2y$10$UXHMLfF.L.MPT37BuY2mN.Hul5ps.WqnrFIiLxQur3Un8f5O2pUzm', NULL, NULL, '0123717580', '3829 Dane Trafficway\nMcGlynnhaven, MD 15200-9203', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Christian', NULL, '1977-09-26', NULL, 'Operator', NULL, 7, NULL, 1, 'UnJoWaSXTS', NULL, NULL, '2023-02-03 15:56:49', '2023-02-03 16:50:35'),
(72, 'Admin', 'Bridie Cremin', 'aimee.schumm@example.com', '2023-02-03 15:56:49', '$2y$10$YdH0IOFnv9WoNPMIk7lAzO2zsXYkjCFYkYlEYQ9iKzYim6l9NH1Ne', NULL, NULL, '0111346807', '52486 Hartmann Pines Suite 401\nPort Ruthview, MD 13521-5601', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Jewish', NULL, '1998-02-02', NULL, 'Operator', NULL, 4, NULL, 1, 'bUY6dOqz38', NULL, NULL, '2023-02-03 15:56:49', '2023-02-03 16:50:35'),
(73, 'Admin', 'Miss Maia Medhurst MD', 'vrosenbaum@example.org', '2023-02-03 15:56:49', '$2y$10$FObfZXGJRY1.5L07Su5G.ekzo8gzXtnTWXWaKHYIMi.zG1wwtt32S', NULL, NULL, '0109378055', '30188 Bashirian Tunnel Apt. 361\nNew Brookfurt, WY 42122-7361', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Christian', NULL, '1975-06-30', NULL, 'Operator', NULL, 4, NULL, 1, 'X06wCdxEfv', NULL, NULL, '2023-02-03 15:56:49', '2023-02-03 16:50:35'),
(74, 'Admin', 'Caesar Lind', 'derick.mcdermott@example.com', '2023-02-03 15:56:49', '$2y$10$L0vcBQA2iiA8uerle7j7H.joQHGqXwzJUG3HpQV6SHhUCIR7a26Q6', NULL, NULL, '012424533', '1537 Mckenna Roads Apt. 158\nWest Elisha, NH 29699-8539', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Jewish', NULL, '1981-08-30', NULL, 'Operator', NULL, 2, NULL, 1, 'wr3Ahvypdn', NULL, NULL, '2023-02-03 15:56:49', '2023-02-03 16:50:35'),
(75, 'Admin', 'Jessie Carroll', 'abner.herzog@example.com', '2023-02-03 15:56:49', '$2y$10$QhXG5iA0Nu8CPT./hUuO2ur3XYNd/CiYt.yQ7ibf54a7jAgWwCFCK', NULL, NULL, '0122436192', '2498 Darron Square\nMetztown, MN 96185', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Jewish', NULL, '2008-10-26', NULL, 'Operator', NULL, 4, NULL, 1, '0Lr2vB4D9b', NULL, NULL, '2023-02-03 15:56:49', '2023-02-03 16:50:35'),
(76, 'Admin', 'Rick Shields', 'mvandervort@example.com', '2023-02-03 15:57:10', '$2y$10$FS9tlp96wzw/LY4Tf2j/eeYVMJDeP8Oj6vjajjFJaUHaxYOFPq0Wu', NULL, NULL, '0109256293', '9210 Seth Corners Apt. 014\nLittelchester, GA 49710', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Christian', NULL, '1984-05-28', NULL, 'Operator', NULL, 6, NULL, 1, 'Kxo2tQsZ7R', NULL, NULL, '2023-02-03 15:57:10', '2023-02-03 16:50:35'),
(77, 'Admin', 'Thelma O\'Connell', 'brisa66@example.com', '2023-02-03 15:57:10', '$2y$10$N8/cRj4BvpOSY6ekwauyl.l.QG2A8rJclYAQswbWXtu.qFPz6LfQG', NULL, NULL, '0121270264', '53850 Renner Port Apt. 039\nSonnystad, WI 06829-7608', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Muslim', NULL, '1979-08-12', NULL, 'Operator', NULL, 5, NULL, 1, 'JOqtM9FDK4', NULL, NULL, '2023-02-03 15:57:10', '2023-02-03 16:50:35'),
(78, 'Admin', 'Marley Jerde', 'marcel.robel@example.net', '2023-02-03 15:57:10', '$2y$10$/.Vba8H0xS0SJxBPHLWPG.dkKhVbgQ9AGM930O68QQx/FeZmQLdP2', NULL, NULL, '0121430016', '2898 Keshaun View Apt. 477\nLake Miller, NH 76316-8418', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Atheist', NULL, '1979-06-11', NULL, 'Operator', NULL, 2, NULL, 1, '5fSn807hLg', NULL, NULL, '2023-02-03 15:57:10', '2023-02-03 16:50:35'),
(79, 'Admin', 'Natalie Botsford', 'goodwin.randi@example.net', '2023-02-03 15:57:10', '$2y$10$NLyX6HvCXl2CUcpVbvjPfuy5LrmOmcEucxgny3dgFMX39QVt.Dn7q', NULL, NULL, '011745774', '400 Jaylan Hollow Apt. 831\nNew Danetown, AZ 65758-1307', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Christian', NULL, '1988-06-04', NULL, 'Operator', NULL, 2, NULL, 1, 'GY5MFnH2Oo', NULL, NULL, '2023-02-03 15:57:10', '2023-02-03 16:50:35'),
(80, 'Admin', 'Eric Deckow', 'weimann.randy@example.org', '2023-02-03 15:57:10', '$2y$10$ht/Z1FmeXdfZY5RgY6Wiv.r/.fb6UjgemzHIx.zek35juQaIVRFM.', NULL, NULL, '0102687190', '302 Hammes Mountain Apt. 080\nSouth Israelberg, WY 13604', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Muslim', NULL, '1993-12-17', NULL, 'Operator', NULL, 4, NULL, 1, 'leQjSICx4J', NULL, NULL, '2023-02-03 15:57:10', '2023-02-03 16:50:35'),
(81, 'Admin', 'Dr. Juanita Abshire IV', 'rhea15@example.org', '2023-02-03 15:57:10', '$2y$10$igQJxktIrRRzASOcHYs1I.GLcpMXQnnAk41Y1IRkPYITR6s3lIsbi', NULL, NULL, '0101663788', '5976 Ledner Trail Suite 176\nKristinstad, WV 48037-5806', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Jewish', NULL, '1998-10-19', NULL, 'Operator', NULL, 6, NULL, 1, 'FQWtqoJOcY', NULL, NULL, '2023-02-03 15:57:10', '2023-02-03 16:50:35'),
(82, 'Admin', 'Tia Quigley', 'prodriguez@example.com', '2023-02-03 15:57:10', '$2y$10$ilevlVneQqM3I2m/1ldvXuGStX8Qb0EDNRTY2GLrTegU7.lBWQIau', NULL, NULL, '0104859641', '745 Brady Grove Suite 988\nElisabethview, TX 55821-2449', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Atheist', NULL, '2010-12-04', NULL, 'Operator', NULL, 1, NULL, 1, 'BPfrJQHcHF', NULL, NULL, '2023-02-03 15:57:11', '2023-02-03 16:50:35'),
(83, 'Admin', 'Jarret Borer', 'grace29@example.org', '2023-02-03 15:57:11', '$2y$10$a/VHAllo7d/ioVS7lykXheCJ/z/2Wxns.5q05Rbg6X9QDKl7mBt8m', NULL, NULL, '0119929079', '7707 Klocko Prairie\nWilliamsonburgh, MT 47095-8321', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Atheist', NULL, '2011-05-22', NULL, 'Operator', NULL, 4, NULL, 1, '6E2mom62gG', NULL, NULL, '2023-02-03 15:57:11', '2023-02-03 16:50:35'),
(84, 'Admin', 'Dr. Dante Beier DVM', 'caterina.parker@example.org', '2023-02-03 15:57:11', '$2y$10$3HUeuY6/OQdEuHin77E1QeArRP13lYLiRD/FheVfq.1Em9A0nz8k2', NULL, NULL, '0122881531', '115 Kelvin Vista\nLake Cade, CT 35050', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Muslim', NULL, '1972-07-20', NULL, 'Operator', NULL, 6, NULL, 1, '7xkR2p0Gyk', NULL, NULL, '2023-02-03 15:57:11', '2023-02-03 16:50:35'),
(85, 'Admin', 'Ardith West', 'flavie07@example.net', '2023-02-03 15:57:11', '$2y$10$91cRfDfjTJsfwppXPp84quT36wLuWpsQAS0R/OWgYza0kpNC6XOWq', NULL, NULL, '0103549998', '5642 Bruen Rest Suite 470\nHelenafurt, CT 68267', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Atheist', NULL, '1970-10-08', NULL, 'Operator', NULL, 4, NULL, 1, 'LkT461PKuM', NULL, NULL, '2023-02-03 15:57:11', '2023-02-03 16:50:35'),
(86, 'Admin', 'Veda Walter', 'ewilderman@example.net', '2023-02-03 15:57:11', '$2y$10$iTK/CL0V2a.nLtnixmWo1OkwL8RhNdOAJUf.1UsaQVZyqQW50rOo.', NULL, NULL, '0107089922', '76452 Montana Field Suite 211\nSimonisburgh, CA 46135-0249', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Christian', NULL, '1979-07-04', NULL, 'Operator', NULL, 1, NULL, 1, 'K0Wo24Lc50', NULL, NULL, '2023-02-03 15:57:11', '2023-02-03 16:50:35'),
(87, 'Admin', 'Ubaldo Pagac', 'erica81@example.com', '2023-02-03 15:57:11', '$2y$10$dbxbibDn/zyoZyIONpsgCu.kd/qJr.9z9ugFPr.1HXgIbOQq5o5su', NULL, NULL, '0116690363', '676 Rickey Spring Apt. 687\nNorth Dessie, MN 70974', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Muslim', NULL, '2010-10-26', NULL, 'Operator', NULL, 5, NULL, 1, 'qcNMSQtK7K', NULL, NULL, '2023-02-03 15:57:11', '2023-02-03 16:50:35'),
(88, 'Admin', 'Garret Lynch', 'cristopher61@example.org', '2023-02-03 15:57:11', '$2y$10$VGEUuKsJHacOnRGQE3XAPeNvx7EZJU/kpOi4m1kw5mpwLMHWdtphu', NULL, NULL, '0109914348', '753 Halvorson Lake Apt. 096\nNew Amaya, DE 48118', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Muslim', NULL, '1992-05-22', NULL, 'Operator', NULL, 7, NULL, 1, '1uAIWtGiJM', NULL, NULL, '2023-02-03 15:57:11', '2023-02-03 16:50:35'),
(89, 'Admin', 'Jaycee Altenwerth III', 'bertram60@example.org', '2023-02-03 15:57:11', '$2y$10$NMle6vBhSxDlJqZT9e1X1..DXZ4ToQal9fGOxcAH6LWlc7k.zl94C', NULL, NULL, '0112206002', '7137 Conroy Fall\nMelodyville, LA 78854-0380', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Atheist', NULL, '1994-02-03', NULL, 'Operator', NULL, 6, NULL, 1, 'wKBrilqSge', NULL, NULL, '2023-02-03 15:57:11', '2023-02-03 16:50:35'),
(90, 'Admin', 'Dr. Gaylord Hyatt', 'frederic67@example.org', '2023-02-03 15:57:11', '$2y$10$PiRaBtzSxM/hLGrzH4fWOOBoKt7F1hL5LJdxnlioX25w53pGR7LCG', NULL, NULL, '0112486152', '83175 Jeffery Shore\nLehnerville, WY 47923-7183', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Jewish', NULL, '2004-10-16', NULL, 'Operator', NULL, 2, NULL, 1, 'wi6oJJwDpF', NULL, NULL, '2023-02-03 15:57:11', '2023-02-03 16:50:35'),
(91, 'Admin', 'Bulah Bailey', 'gregg68@example.org', '2023-02-03 15:57:11', '$2y$10$tqtu2Ymlgj97w4cKkiRbNOkrloDdTakWaFh1qsnE3RKSCnluScGTe', NULL, NULL, '0118007755', '9813 Hegmann Ramp\nEast Liamfurt, AZ 72351', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Christian', NULL, '1995-02-23', NULL, 'Operator', NULL, 7, NULL, 1, 'wjK4uNSEKQ', NULL, NULL, '2023-02-03 15:57:11', '2023-02-03 16:50:35'),
(92, 'Admin', 'Karl Weber', 'wolff.orion@example.net', '2023-02-03 15:57:11', '$2y$10$S29qYmxi9LxJMLRXnr9WTOq/kuvIWT7xpSYOHFqWgA.sYFABhY/bO', NULL, NULL, '0115577666', '3569 Treutel Mountain\nHarmonchester, OK 34470-1198', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Christian', NULL, '1979-10-24', NULL, 'Operator', NULL, 6, NULL, 1, 'TadJz7aJ2F', NULL, NULL, '2023-02-03 15:57:11', '2023-02-03 16:50:35'),
(93, 'Admin', 'Ms. Elvie Watsica', 'rebeca53@example.org', '2023-02-03 15:57:11', '$2y$10$4WhGPJq8Zl.fOPwB6qeXge7QksYHrcRckdK8z/9Q77gyM0tNTYNfu', NULL, NULL, '0103198476', '477 Veronica Wall\nWest Keagan, AZ 66409-9518', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Muslim', NULL, '1996-04-10', NULL, 'Operator', NULL, 7, NULL, 1, 'mHeAVKTf81', NULL, NULL, '2023-02-03 15:57:11', '2023-02-03 16:50:35'),
(94, 'Admin', 'Maximilian Quitzon IV', 'dzemlak@example.net', '2023-02-03 15:57:11', '$2y$10$b2IOrTjmxK56LwIO92FwRODBWQLlYn7j.SwgEj7LMQd9dimK1GSTG', NULL, NULL, '0119372246', '9741 Homenick Field Apt. 812\nHillhaven, KS 63365', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Muslim', NULL, '1974-09-25', NULL, 'Operator', NULL, 6, NULL, 1, 'rMmKcJeUhM', NULL, NULL, '2023-02-03 15:57:11', '2023-02-03 16:50:35'),
(95, 'Admin', 'Mr. Gunner Grant', 'tstanton@example.net', '2023-02-03 15:57:11', '$2y$10$SKboQxPzd5RtnupP4dp.HOkTk7t5mxuEZP/hGJ6aqY1zKpZMnONpq', NULL, NULL, '0115443317', '92041 Thalia Mountain Apt. 289\nHagenesfurt, AL 24952', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Jewish', NULL, '1982-02-09', NULL, 'Operator', NULL, 3, NULL, 1, 'Y3qc4OVl9N', NULL, NULL, '2023-02-03 15:57:11', '2023-02-03 16:50:35'),
(96, 'Admin', 'Aubrey Schowalter', 'sgerhold@example.com', '2023-02-03 15:57:11', '$2y$10$tv45KUINJQ8dFYLWRvBZ6OfWOCDQptDWi40PNgZdZd50rDNhLKZLK', NULL, NULL, '0101489743', '110 Mueller Groves Suite 727\nEast Gracietown, OH 95410', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Jewish', NULL, '2011-05-20', NULL, 'Operator', NULL, 3, NULL, 1, 'AJ3POKMDoG', NULL, NULL, '2023-02-03 15:57:11', '2023-02-03 16:50:35'),
(97, 'Admin', 'Prof. Cristobal Lebsack', 'oceane.collier@example.org', '2023-02-03 15:57:11', '$2y$10$2Foywf8.0ctRr5K.SJwxuOHY519dHin2XNlglZ5VvwubAY3SPZDaK', NULL, NULL, '0101039676', '9427 Wilderman Rue\nSouth Modesta, MO 03559', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Christian', NULL, '1990-10-27', NULL, 'Operator', NULL, 7, NULL, 1, 'eluLs2QKKz', NULL, NULL, '2023-02-03 15:57:11', '2023-02-03 16:50:35'),
(98, 'Admin', 'Frank Watsica III', 'mose.ullrich@example.com', '2023-02-03 15:57:11', '$2y$10$3XYN/7Fa7tJh5pBlN0FsnujXFxOHshocX3SkuFJoJ1oBIW8TFaWs6', NULL, NULL, '0127803465', '57097 Adah Key Suite 653\nKarianefort, IN 42049', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Jewish', NULL, '1973-11-10', NULL, 'Operator', NULL, 1, NULL, 1, '9ZdTsxPQSq', NULL, NULL, '2023-02-03 15:57:11', '2023-02-03 16:50:35'),
(99, 'Admin', 'Eleanora Corwin', 'patricia06@example.com', '2023-02-03 15:57:11', '$2y$10$UoQcAN.4krLkm3V6X4qo8.3OUT1Aym0y3lo7VruSe3wQQeutFpcGa', NULL, NULL, '0114404697', '4020 Abbott Canyon\nSouth Gladysfort, OH 95923-0776', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Jewish', NULL, '2012-11-17', NULL, 'Operator', NULL, 1, NULL, 1, 'kD7IJKXcaV', NULL, NULL, '2023-02-03 15:57:11', '2023-02-03 16:50:35'),
(100, 'Admin', 'Madalyn Morissette', 'oran62@example.com', '2023-02-03 15:57:11', '$2y$10$sn9UGNm4ZDntQFtzqpVLIexogplJAds5VpOUP5B8M0qMgO9r/ExkO', NULL, NULL, '0108185033', '2503 Grady Crossing Apt. 422\nWest Muhammad, NH 21905', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Muslim', NULL, '2000-11-20', NULL, 'Operator', NULL, 1, NULL, 1, 'gqfhnF6bpj', NULL, NULL, '2023-02-03 15:57:12', '2023-02-03 16:50:35'),
(101, 'Admin', 'Kadin Hahn', 'rboyer@example.net', '2023-02-03 15:57:12', '$2y$10$XdyHtfTevHm0CvHgxdHHh.gMKGcgfJQtDAcHRAnfjqBeZnXCbbiHm', NULL, NULL, '0107469023', '20576 Ova Island Suite 762\nNorth Sam, WI 80102', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Christian', NULL, '1996-01-25', NULL, 'Operator', NULL, 5, NULL, 1, 'gCwo4byFQl', NULL, NULL, '2023-02-03 15:57:12', '2023-02-03 16:50:35'),
(102, 'Admin', 'Buford Toy', 'janderson@example.net', '2023-02-03 15:57:12', '$2y$10$c0.OyVgfOS8Y9zp3ehr9eO6ckC5ZHEGVixvyNC27/p.6fYs5hwGH.', NULL, NULL, '0101281068', '152 O\'Connell Loaf Apt. 443\nEast Jailynport, RI 29298-4330', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Christian', NULL, '1996-05-18', NULL, 'Operator', NULL, 5, NULL, 1, 'XPklASU00u', NULL, NULL, '2023-02-03 15:57:12', '2023-02-03 16:50:35'),
(103, 'Admin', 'Adelia Blick III', 'bettie26@example.net', '2023-02-03 15:57:12', '$2y$10$x7eCUUqwSVTWh7y5J7VpNOkctZD5e3Obc..PBZFZfrMSHit6CQC/K', NULL, NULL, '0127433060', '8097 Alf Land Apt. 414\nNorth Quinn, MT 00208-5096', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Christian', NULL, '1986-04-17', NULL, 'Operator', NULL, 7, NULL, 1, 'zXT960nbFU', NULL, NULL, '2023-02-03 15:57:12', '2023-02-03 16:50:35'),
(104, 'Admin', 'Genevieve Prosacco', 'rubye90@example.com', '2023-02-03 15:57:12', '$2y$10$/o.isp5nQaziv0cJq7FuwuH9Hq4etOW8Rhb5Fqlihommz0IcUNsOi', NULL, NULL, '0114947976', '24080 Barton Streets Apt. 680\nNew Santaborough, AZ 32167', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Atheist', NULL, '2004-04-07', NULL, 'Operator', NULL, 7, NULL, 1, 'XgKw2ZuqSF', NULL, NULL, '2023-02-03 15:57:12', '2023-02-03 16:50:35'),
(105, 'Admin', 'Jakob O\'Hara', 'padberg.jarrod@example.com', '2023-02-03 15:57:12', '$2y$10$1swNkwHwB8UkY3r2vXSO6uTbi8orIo5oTkOUvAuwCfgBmRLhJkzmK', NULL, NULL, '0112884650', '2310 Connelly Neck\nEast Aylin, ME 71102-2980', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Atheist', NULL, '2005-02-05', NULL, 'Operator', NULL, 4, NULL, 1, 'ooDLRlgLxv', NULL, NULL, '2023-02-03 15:57:12', '2023-02-03 16:50:35'),
(106, 'Admin', 'Prof. Jeramie Stamm', 'juana.weissnat@example.org', '2023-02-03 15:57:12', '$2y$10$gb3y9fp43AYSzJoHAhKVuujmNJj3RV1aVlZ786cs3cIETpAxFQCCi', NULL, NULL, '0118120533', '8405 Ricardo Stream\nDelfinaton, MN 09360-6364', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Christian', NULL, '1999-07-11', NULL, 'Operator', NULL, 2, NULL, 1, 'iqzM2H3vTA', NULL, NULL, '2023-02-03 15:57:12', '2023-02-03 16:50:35'),
(107, 'Admin', 'Miss Justine Herzog', 'vandervort.kylee@example.com', '2023-02-03 15:57:12', '$2y$10$94ZEodPTqr2UbC/WafiNteIkNsHIou1XwFtN08pWpVLusKeMFz2UW', NULL, NULL, '0105552972', '8667 Westley Isle\nVandervortton, DE 33238', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Atheist', NULL, '2012-06-02', NULL, 'Operator', NULL, 7, NULL, 1, 'WgdsfBNtcf', NULL, NULL, '2023-02-03 15:57:12', '2023-02-03 16:50:35'),
(108, 'Admin', 'Elna Leuschke III', 'jacobs.sadye@example.org', '2023-02-03 15:57:12', '$2y$10$ZlA7PwhUsRjo4s02bhQLMepVR/L5iIVF7USlfY.Y/HAbFOdmW0dny', NULL, NULL, '0106979008', '6119 DuBuque Viaduct Suite 659\nDarrinville, MA 40648', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Christian', NULL, '1980-08-26', NULL, 'Operator', NULL, 5, NULL, 1, 'MteKsGR2Qb', NULL, NULL, '2023-02-03 15:57:12', '2023-02-03 16:50:35'),
(109, 'Admin', 'Misty Trantow', 'johnson.lera@example.com', '2023-02-03 15:57:12', '$2y$10$RDLCy7b6x9LGnwQ1tajN.e7diwsvC2PbDcgz94QoZwaIgKqOVoDrW', NULL, NULL, '0105966065', '673 Mary Throughway Apt. 956\nDinoside, OH 10501-5961', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Atheist', NULL, '1978-08-13', NULL, 'Operator', NULL, 5, NULL, 1, 'fqYHLNlAki', NULL, NULL, '2023-02-03 15:57:12', '2023-02-03 16:50:35'),
(110, 'Admin', 'Mr. Toni Boyle', 'giovanny.treutel@example.net', '2023-02-03 15:57:12', '$2y$10$SMyg8a61FtF4J8U8YlMrMeMxB44NsmmEA/6LRt/HsIjBXM/KWDeMS', NULL, NULL, '0127418896', '4745 Ofelia Pass\nWest Alessia, CO 33679-0149', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Jewish', NULL, '1984-06-14', NULL, 'Operator', NULL, 2, NULL, 1, 'HqndUYsiaW', NULL, NULL, '2023-02-03 15:57:12', '2023-02-03 16:50:35'),
(111, 'Admin', 'Aric Mueller', 'bterry@example.com', '2023-02-03 15:57:12', '$2y$10$FCXi8cB3ZMr3zCRGuXYETuYkBZCZeEW7WuKqWxjMsBjnun719q5xu', NULL, NULL, '0106707130', '25562 Ernest Crossing Apt. 879\nNew Jaquanhaven, KY 11466-8664', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Muslim', NULL, '2002-09-19', NULL, 'Operator', NULL, 1, NULL, 1, 'FN3UMcAVf9', NULL, NULL, '2023-02-03 15:57:12', '2023-02-03 16:50:35'),
(112, 'Admin', 'Claudine Wehner', 'dubuque.aiden@example.com', '2023-02-03 15:57:12', '$2y$10$ZG.mtPBQiYYtaz5TOPmAkeHa/CLbnD5m.yNz8ivF.W0Az4HWwVNQ6', NULL, NULL, '0112749508', '594 Huel Mount Suite 257\nLake Audreanne, ID 12886-0592', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Christian', NULL, '2001-08-09', NULL, 'Operator', NULL, 4, NULL, 1, 't7Knx9ZPfe', NULL, NULL, '2023-02-03 15:57:12', '2023-02-03 16:50:35'),
(113, 'Admin', 'Woodrow Nitzsche', 'annie66@example.com', '2023-02-03 15:57:12', '$2y$10$m8iBj7dSaE5pa0qJA7Qfj.rvKdpHFutfd7Ps7xQuoZx6RZVrUfRIC', NULL, NULL, '0107102188', '39566 Felix Passage\nKatlynnmouth, LA 86414', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Jewish', NULL, '1991-06-04', NULL, 'Operator', NULL, 4, NULL, 1, 'GFLkeYl5rX', NULL, NULL, '2023-02-03 15:57:12', '2023-02-03 16:50:35'),
(114, 'Admin', 'Garth Nitzsche', 'inienow@example.com', '2023-02-03 15:57:12', '$2y$10$mVmqk16.gfwJyzg8T7kbTO2QNXtFY/6bsUfpEijTqrMwhh36ojQ9G', NULL, NULL, '0106682646', '640 Schmitt Squares\nNorth Kaela, DE 33690', 'Male', '202301291300myPic-1.jpg', NULL, NULL, 'Jewish', NULL, '1993-02-24', NULL, 'Operator', NULL, 1, NULL, 1, 'DSXOqSgOkv', NULL, NULL, '2023-02-03 15:57:12', '2023-02-03 16:50:35'),
(115, 'Admin', 'Gertrude Bernhard', 'caden15@example.net', '2023-02-03 15:57:12', '$2y$10$e3GWOZoRCOw4CIx4OSns9Omh0ulUwureORaIYLcrOAzOQtLGLD6Va', NULL, NULL, '0114973683', '7038 Dante Village\nDeckowmouth, DC 85809', 'Female', '202301291300myPic-1.jpg', NULL, NULL, 'Atheist', NULL, '1983-08-18', NULL, 'Operator', NULL, 1, NULL, 1, 'jlXSzuF1Uy', NULL, NULL, '2023-02-03 15:57:12', '2023-02-03 16:50:35');

-- --------------------------------------------------------

--
-- Table structure for table `verifications`
--

CREATE TABLE `verifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires_at` time NOT NULL,
  `is_valid` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `verifications`
--

INSERT INTO `verifications` (`id`, `user_id`, `code`, `expires_at`, `is_valid`, `created_at`, `updated_at`) VALUES
(22, 1, '4030', '20:02:02', 0, '2023-02-04 17:52:02', '2023-02-04 17:52:16'),
(23, 1, '8132', '20:03:10', 0, '2023-02-04 17:53:10', '2023-02-04 17:53:44'),
(24, 1, '2396', '20:10:47', 0, '2023-02-04 18:00:47', '2023-02-04 18:00:59');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_employee_salaries`
--
ALTER TABLE `account_employee_salaries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `account_other_costs`
--
ALTER TABLE `account_other_costs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `account_student_fees`
--
ALTER TABLE `account_student_fees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assign_students`
--
ALTER TABLE `assign_students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assign_subjects`
--
ALTER TABLE `assign_subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `designations`
--
ALTER TABLE `designations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `designations_name_unique` (`name`);

--
-- Indexes for table `discount_students`
--
ALTER TABLE `discount_students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_attendances`
--
ALTER TABLE `employee_attendances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_leaves`
--
ALTER TABLE `employee_leaves`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_sallary_logs`
--
ALTER TABLE `employee_sallary_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_types`
--
ALTER TABLE `exam_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `exam_types_name_unique` (`name`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `fee_categories`
--
ALTER TABLE `fee_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fee_categories_name_unique` (`name`);

--
-- Indexes for table `fee_category_amounts`
--
ALTER TABLE `fee_category_amounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leave_purposes`
--
ALTER TABLE `leave_purposes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `leave_purposes_name_unique` (`name`);

--
-- Indexes for table `marks_grades`
--
ALTER TABLE `marks_grades`
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
-- Indexes for table `school_subjects`
--
ALTER TABLE `school_subjects`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `school_subjects_name_unique` (`name`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `student_classes`
--
ALTER TABLE `student_classes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `student_classes_name_unique` (`name`);

--
-- Indexes for table `student_groups`
--
ALTER TABLE `student_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `student_groups_name_unique` (`name`);

--
-- Indexes for table `student_marks`
--
ALTER TABLE `student_marks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_shifts`
--
ALTER TABLE `student_shifts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `student_shifts_name_unique` (`name`);

--
-- Indexes for table `student_years`
--
ALTER TABLE `student_years`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `student_years_name_unique` (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `verifications`
--
ALTER TABLE `verifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `verifications_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_employee_salaries`
--
ALTER TABLE `account_employee_salaries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `account_other_costs`
--
ALTER TABLE `account_other_costs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `account_student_fees`
--
ALTER TABLE `account_student_fees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assign_students`
--
ALTER TABLE `assign_students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `assign_subjects`
--
ALTER TABLE `assign_subjects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `designations`
--
ALTER TABLE `designations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `discount_students`
--
ALTER TABLE `discount_students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_attendances`
--
ALTER TABLE `employee_attendances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_leaves`
--
ALTER TABLE `employee_leaves`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_sallary_logs`
--
ALTER TABLE `employee_sallary_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_types`
--
ALTER TABLE `exam_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fee_categories`
--
ALTER TABLE `fee_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fee_category_amounts`
--
ALTER TABLE `fee_category_amounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leave_purposes`
--
ALTER TABLE `leave_purposes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marks_grades`
--
ALTER TABLE `marks_grades`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `school_subjects`
--
ALTER TABLE `school_subjects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_classes`
--
ALTER TABLE `student_classes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `student_groups`
--
ALTER TABLE `student_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_marks`
--
ALTER TABLE `student_marks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_shifts`
--
ALTER TABLE `student_shifts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_years`
--
ALTER TABLE `student_years`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT for table `verifications`
--
ALTER TABLE `verifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `verifications`
--
ALTER TABLE `verifications`
  ADD CONSTRAINT `verifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
