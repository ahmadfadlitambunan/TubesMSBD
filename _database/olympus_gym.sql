-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 17, 2022 at 12:43 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `olympus_gym`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `verify_order` (IN `ord` INT(20), IN `adm` INT(20), IN `st` CHAR(1))   BEGIN
    DECLARE user INT; 
    DECLARE duration INT;
    DECLARE invoice_id INT;
    SELECT o.user_id INTO user FROM orders o WHERE o.id = ord;
    SELECT plans.duration_month INTO duration FROM orders JOIN plans ON orders.id = plans.id WHERE orders.id = ord;
    START TRANSACTION;
		UPDATE orders SET status = st, verified_by = adm, verified_at = NOW() WHERE id = ord;
        INSERT INTO invoices (order_id, created_at, updated_at) VALUES (ord, NOW(), NOW());
        SELECT LAST_INSERT_ID() INTO invoice_id;
        INSERT INTO memberships (invoice_id, user_id, start_at, expired_at, created_at, updated_at)
        			VALUES (invoice_id,
                            user,
                           	NOW(),
                            DATE_ADD(NOW(), INTERVAL duration MONTH), 
                            NOW(),
                            NOW());
        COMMIT;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `equipments`
--

CREATE TABLE `equipments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `equipments`
--

INSERT INTO `equipments` (`id`, `name`, `desc`, `created_at`, `updated_at`) VALUES
(1, 'Voluptatem itaque.', 'Sunt eveniet enim sed aut et ex. Similique consequuntur et deserunt eum esse.', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(2, 'Voluptatibus rerum natus.', 'Vel cum sit ab eius. Libero sint autem est voluptatem minima.', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(3, 'Ea quaerat consequatur.', 'Vero necessitatibus iusto quo. Et unde esse eum eveniet iusto harum. Maxime voluptatem et ea.', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(4, 'Cum recusandae.', 'Fugiat et enim enim non. Voluptatibus omnis autem rerum. Nobis voluptatum voluptas ab corrupti.', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(5, 'Qui et.', 'Commodi molestiae aut dolor non maiores excepturi. Cupiditate quis tempora et laborum.', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(6, 'Est ea recusandae.', 'Dolor illum nihil eum omnis. Fugit dolores quia aut odio. Impedit nemo quia ex et ut.', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(7, 'Consequatur facere.', 'Fugit praesentium quod sed sed. Iste ducimus et dolor. Id corrupti et et qui dolor modi inventore.', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(8, 'At molestiae.', 'Id aut quis eveniet est velit dolores deleniti dolorem. Explicabo officia amet magnam.', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(9, 'Non et.', 'Quia eum commodi aut laboriosam laborum nemo a velit. Quis molestiae quia velit officiis dolor.', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(10, 'Ad consequuntur.', 'Ea autem in ut voluptas reiciendis voluptas magnam. Ut similique iste expedita quia.', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(11, 'Libero tenetur labore.', 'Aut animi dolorem magni voluptates odio sunt et dolores. Quia ut ab similique eos quae cum.', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(12, 'Repellat qui laboriosam.', 'Error aut et et. Vel pariatur quas qui.', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(13, 'Deserunt error aut.', 'Rerum maiores et aut. Tempora iusto totam dolorem eius. Similique recusandae cum quos ut.', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(14, 'Quia qui.', 'Voluptate cum autem quae laboriosam natus ut. Nobis cupiditate voluptatum est.', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(15, 'Et aut explicabo.', 'Totam provident minus ut officia. Mollitia facere facere aut pariatur excepturi sunt.', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(16, 'Inventore eligendi.', 'Magni voluptate soluta minus enim. Repellendus adipisci ab unde.', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(17, 'Dignissimos id.', 'Ullam fugit vero assumenda. Facere odio nemo cumque.', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(18, 'Illum eaque et.', 'Hic molestiae officiis laudantium. Debitis quia ratione iure illum consequuntur.', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(19, 'Provident dicta.', 'Facere magnam impedit et. Non voluptatum esse itaque dignissimos fuga quo incidunt.', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(20, 'Velit quae nisi.', 'Veritatis vel delectus nisi non consectetur dolorum. Labore omnis optio aut voluptas.', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(21, 'Ipsum ullam.', 'Voluptas et et eum illum illum voluptatem. Eius quis labore dolor incidunt omnis non.', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(22, 'Dolorem ut.', 'Est quis soluta ullam qui. Aliquam molestiae saepe quibusdam sint labore voluptate beatae corrupti.', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(23, 'Vel dolorem.', 'Excepturi voluptates rerum corrupti id. Eaque molestiae sit odio.', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(24, 'Aperiam ut sit.', 'Quis dolorum sequi quod et sint ut. Sed qui at odio.', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(25, 'Qui odit.', 'Unde nostrum et enim est unde itaque. Voluptatibus ullam quo animi et totam hic dolorem.', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(26, 'Vel rerum vel.', 'Cupiditate sit voluptas mollitia. Fugiat in quasi ducimus fugiat minima ut ipsam.', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(27, 'Perferendis voluptates.', 'Facere fugiat officia ea sint alias non. Laboriosam et omnis molestiae ex ut quam similique.', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(28, 'Rerum maiores ea.', 'Dolore veritatis asperiores nulla ipsum. Architecto ullam aut id.', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(29, 'Similique et consequatur.', 'Voluptate quis ratione accusamus porro ab modi quia. Saepe qui ex molestiae fugit.', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(30, 'Qui non.', 'Quam modi occaecati totam corporis. Temporibus similique qui sunt ut optio tempora fugit rem.', '2022-12-16 19:33:41', '2022-12-16 19:33:41');

-- --------------------------------------------------------

--
-- Table structure for table `equipment_joins`
--

CREATE TABLE `equipment_joins` (
  `olympus_equipment_id` bigint(20) UNSIGNED NOT NULL,
  `equipment_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exercises`
--

CREATE TABLE `exercises` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exercise_equipments`
--

CREATE TABLE `exercise_equipments` (
  `exercise_id` bigint(20) UNSIGNED NOT NULL,
  `equipment_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exercise_muscles`
--

CREATE TABLE `exercise_muscles` (
  `exercise_id` bigint(20) UNSIGNED NOT NULL,
  `muscle_id` bigint(20) UNSIGNED NOT NULL,
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
-- Table structure for table `goals`
--

CREATE TABLE `goals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `goals`
--

INSERT INTO `goals` (`id`, `name`, `desc`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Eligendi aut possimus.', 'Neque deserunt dolorem voluptatem esse ea possimus accusantium. Est rerum molestiae dolore.', 'images/about/img-1.jpg', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(2, 'Sint facilis magni.', 'Iste cum et aut nisi. Quia hic nemo eos dolor.', 'images/about/img-1.jpg', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(3, 'Minima voluptas.', 'Et sed voluptatem laboriosam dolorum. Laboriosam ipsa aut hic. Et quia fuga labore.', 'images/about/img-1.jpg', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(4, 'Dolorem eum aut.', 'Ad atque delectus sit. Consequatur laudantium ut fuga illo tempora. Et non et doloremque dolorum.', 'images/about/img-1.jpg', '2022-12-16 19:33:41', '2022-12-16 19:33:41');

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `memberships`
--

CREATE TABLE `memberships` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `start_at` timestamp NULL DEFAULT NULL,
  `expired_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `method_payments`
--

CREATE TABLE `method_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `a_n` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `method_payments`
--

INSERT INTO `method_payments` (`id`, `name`, `a_n`, `account_no`, `created_at`, `updated_at`) VALUES
(1, 'Gopay', 'Ahmad Fadli Tambunan', '081316616546', '2022-12-16 19:33:42', '2022-12-16 19:33:42'),
(2, 'BNI', 'Bang Tito', '1713561564', '2022-12-16 19:33:42', '2022-12-16 19:33:42'),
(3, 'BRI', 'Bang Gihon', '844648464', '2022-12-16 19:33:42', '2022-12-16 19:33:42');

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
(1, '1_create_goals_table', 1),
(2, '2014_10_12_000000_create_users_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2022_12_08_140131_create_plans_table', 1),
(7, '2022_12_08_140153_create_method_payments_table', 1),
(8, '2022_12_08_140180_create_orders_table', 1),
(9, '2022_12_08_140190_create_invoices_table', 1),
(10, '2022_12_08_140219_create_memberships_table', 1),
(11, '2022_12_15_211111_create_muscles_table', 1),
(12, '2022_12_15_212211_create_olympus_equipment_table', 1),
(13, '2022_12_15_212430_create_exercises_table', 1),
(14, '2022_12_15_212444_create_equipments_table', 1),
(15, '2022_12_15_212554_create_workouts_table', 1),
(16, '2022_12_15_212632_create_exercise_equipments_table', 1),
(17, '2022_12_15_212720_create_equipment_joins_table', 1),
(18, '2022_12_15_212733_create_exercise_muscles_table', 1),
(19, '2022_12_15_212812_create_workout_histories_table', 1),
(20, '2022_12_15_212832_create_workout_history_exercises_table', 1),
(21, '2022_12_15_215753_create_workout_exercises_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `muscles`
--

CREATE TABLE `muscles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `muscles`
--

INSERT INTO `muscles` (`id`, `name`, `desc`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Quis numquam.', 'Aut explicabo ipsum neque dolores quia at. Saepe nisi aperiam quae officiis.', 'images/about/img-1.jpg', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(2, 'Ex dolor molestiae.', 'Omnis non possimus libero ut. Numquam maxime perspiciatis et soluta. Eum facilis et itaque vel id.', 'images/about/img-1.jpg', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(3, 'Modi eum voluptatum.', 'Facere quae iure dolores possimus minus tempora vero. Et iusto ea impedit fuga est enim.', 'images/about/img-1.jpg', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(4, 'Consequuntur eius.', 'Ea labore minima est laborum. Quam illo et nulla illo. Fugiat sed sint temporibus quibusdam fuga.', 'images/about/img-1.jpg', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(5, 'Debitis rerum.', 'Aut quos laboriosam numquam id perferendis tenetur. Pariatur iure officia quod eaque.', 'images/about/img-1.jpg', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(6, 'Est impedit.', 'Vero quae totam doloribus quia. Dolore quam dolorem omnis in. Minus cupiditate qui eos non.', 'images/about/img-1.jpg', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(7, 'A incidunt.', 'Occaecati ut distinctio dignissimos. Autem nihil aut ea minus. Et quae odio vel.', 'images/about/img-1.jpg', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(8, 'Aut natus.', 'Expedita libero ex voluptatem deleniti doloribus maxime. Id minus quia dolor quae et totam.', 'images/about/img-1.jpg', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(9, 'Odit harum explicabo.', 'Et culpa esse id quod beatae aut. Deleniti voluptate maiores eligendi nihil cum.', 'images/about/img-1.jpg', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(10, 'Eos qui quas.', 'Aliquam molestiae nihil non hic veritatis amet rerum. Quia accusantium ex molestiae quos est qui.', 'images/about/img-1.jpg', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(11, 'Iure illum.', 'Et ea harum sit. Perspiciatis quae pariatur nemo laborum. Consequatur quia sit dolor est non hic.', 'images/about/img-1.jpg', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(12, 'Qui qui et.', 'Quod soluta est reprehenderit nam. Voluptates facere dolores nulla ut omnis. Rerum eius est ullam.', 'images/about/img-1.jpg', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(13, 'Enim sequi sit.', 'Sit minus quaerat et ut rerum. Velit iusto non impedit et illo recusandae.', 'images/about/img-1.jpg', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(14, 'Nulla modi voluptatem.', 'Iusto facere optio porro aspernatur dolorem id. Et consequatur possimus sint ut nemo delectus ut.', 'images/about/img-1.jpg', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(15, 'Alias aspernatur quasi.', 'Corrupti sunt harum cumque sit. Quis voluptatem cum facilis deserunt.', 'images/about/img-1.jpg', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(16, 'Unde perferendis.', 'Adipisci et soluta natus optio ratione et aut. Voluptatem consequuntur assumenda sequi qui.', 'images/about/img-1.jpg', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(17, 'Est ut eos.', 'Itaque qui repudiandae sit rerum. Cupiditate eaque illum ad sequi molestiae.', 'images/about/img-1.jpg', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(18, 'Facere perferendis ipsam.', 'Ea nemo tempore occaecati ea. Optio voluptatem est ducimus natus ut est a.', 'images/about/img-1.jpg', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(19, 'Similique et.', 'Animi et quia maiores ut omnis. Possimus nihil quae ratione. Qui nulla amet est debitis est.', 'images/about/img-1.jpg', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(20, 'Accusantium porro.', 'Voluptatum dignissimos aut consequatur nam. Qui dolores adipisci deleniti cupiditate.', 'images/about/img-1.jpg', '2022-12-16 19:33:41', '2022-12-16 19:33:41');

-- --------------------------------------------------------

--
-- Table structure for table `olympus_equipments`
--

CREATE TABLE `olympus_equipments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `brand` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `olympus_equipments`
--

INSERT INTO `olympus_equipments` (`id`, `brand`, `type`, `desc`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Maiores maxime.', 'Optio sunt.', 'Sed aut aperiam ipsa ut voluptatem ex. Odit quasi sed hic eos quae.', 'images/about/img-1.jpg', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(2, 'Quaerat itaque.', 'Quia commodi.', 'Dolorum deleniti officiis blanditiis quis quo. Vel aperiam dolores ea iusto totam eveniet quia.', 'images/about/img-1.jpg', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(3, 'Reprehenderit id.', 'Aperiam veritatis.', 'Eos et est est est debitis. Et ab et est. Et voluptatem sunt modi consequatur quos rerum.', 'images/about/img-1.jpg', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(4, 'Veritatis est totam.', 'Tenetur.', 'Laborum repellendus omnis dolorem tempore quam. Enim rerum non iusto.', 'images/about/img-1.jpg', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(5, 'Quia numquam.', 'Voluptatibus quas.', 'Cum perferendis voluptatem aut facere. Animi ipsum enim magni fuga sunt.', 'images/about/img-1.jpg', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(6, 'Error commodi aut.', 'Ex dolorum.', 'Doloribus explicabo accusantium assumenda placeat. Aliquam nihil reiciendis architecto.', 'images/about/img-1.jpg', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(7, 'Aliquam ea impedit.', 'Vel.', 'Et ex in excepturi labore laboriosam. Aliquam alias facilis dolorum ut.', 'images/about/img-1.jpg', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(8, 'Corporis quia ipsum.', 'Voluptate.', 'Sed enim consequatur esse deserunt. Dolor quia ut repellendus perferendis.', 'images/about/img-1.jpg', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(9, 'Magnam quisquam.', 'Illum possimus.', 'Iure quod enim accusantium ipsa corporis. Quo provident sed consequatur laboriosam eum.', 'images/about/img-1.jpg', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(10, 'Voluptatibus voluptas.', 'Porro.', 'Sit qui ut id. Aut molestiae at molestiae. Molestiae neque maxime qui ipsa.', 'images/about/img-1.jpg', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(11, 'Quia praesentium vero.', 'Corporis eaque.', 'Sit laborum exercitationem unde aspernatur. Earum ut non non vel. Sequi dolorum velit impedit.', 'images/about/img-1.jpg', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(12, 'Necessitatibus officiis quia.', 'Facere.', 'Ducimus est atque hic inventore modi quis. Vitae asperiores aliquid aut.', 'images/about/img-1.jpg', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(13, 'Animi magni blanditiis.', 'Minus.', 'Blanditiis deleniti aut libero dicta exercitationem optio. Corrupti omnis soluta suscipit magnam.', 'images/about/img-1.jpg', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(14, 'Modi dolorem.', 'Sunt.', 'Eos a doloremque omnis iusto est eveniet. Sit qui sunt id consequatur asperiores veritatis debitis.', 'images/about/img-1.jpg', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(15, 'Sit ullam.', 'Alias.', 'Sit quas omnis corporis nostrum amet. Pariatur quae et nihil. Debitis ab maiores qui mollitia illo.', 'images/about/img-1.jpg', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(16, 'Et culpa et.', 'Corporis.', 'Rerum eius sapiente et tempore. Optio quos omnis quod quae eum.', 'images/about/img-1.jpg', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(17, 'Commodi temporibus qui.', 'Qui.', 'Nostrum ut assumenda quae saepe. Rem iste cum dolore ratione tempore a eos.', 'images/about/img-1.jpg', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(18, 'Excepturi et.', 'Asperiores.', 'Iure labore natus eos et sit. Ut non omnis dolorem voluptatem.', 'images/about/img-1.jpg', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(19, 'Vel numquam.', 'Architecto odit.', 'Sint quo culpa eos ab dicta nobis quis. Minima cupiditate repudiandae qui eius facilis.', 'images/about/img-1.jpg', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(20, 'Velit consequuntur.', 'Qui.', 'Et ducimus non asperiores dolorem porro. Et velit minus earum voluptas aut autem.', 'images/about/img-1.jpg', '2022-12-16 19:33:41', '2022-12-16 19:33:41');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `plan_id` bigint(20) UNSIGNED NOT NULL,
  `method_payment_id` bigint(20) UNSIGNED NOT NULL,
  `expired_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('0','1') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `verified_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plans`
--

CREATE TABLE `plans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `duration_month` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `plans`
--

INSERT INTO `plans` (`id`, `name`, `desc`, `price`, `duration_month`, `created_at`, `updated_at`) VALUES
(1, 'Eos ab voluptatem et.', 'Voluptas molestias aliquid voluptates et. Illo sunt ut rerum. Dolores quia maxime itaque ipsam.', 942812, 9, '2022-12-16 19:33:42', '2022-12-16 19:33:42'),
(2, 'Quia eveniet molestias.', 'Velit quam distinctio quae fugit quod. Sunt exercitationem enim eligendi.', 194336, 10, '2022-12-16 19:33:42', '2022-12-16 19:33:42'),
(3, 'Voluptatem a molestiae neque.', 'Minima suscipit id qui quia sunt dignissimos odio. Et odio quos facere sit ipsa doloribus.', 438043, 5, '2022-12-16 19:33:42', '2022-12-16 19:33:42'),
(4, 'Dolorum voluptatem odio in.', 'Et est id ut. Magni iusto facilis in amet amet voluptates. Voluptatem hic aut rerum sed.', 763297, 7, '2022-12-16 19:33:42', '2022-12-16 19:33:42'),
(5, 'Similique autem aspernatur.', 'Fuga perferendis voluptas sed tempora. Sed et eum ad est. Molestiae aut qui totam tempore.', 720847, 10, '2022-12-16 19:33:42', '2022-12-16 19:33:42');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `goal_id` bigint(20) UNSIGNED DEFAULT NULL,
  `qr_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `no_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `goal_id`, `qr_code`, `name`, `username`, `email`, `email_verified_at`, `no_phone`, `password`, `gender`, `address`, `level`, `image`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, NULL, 'IWDbpk1ITCMHXZ5cfV12', 'Octavia Collier', 'laura49', 'zbrakus@example.com', '2022-12-16 19:33:41', '(445) 673-6233', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2', NULL, '2', 'image.jpg', 'W1inE61kQN', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(2, NULL, 'H6Rr99n5BQBTNk39YFwb', 'Emmet Weber', 'katelyn.dibbert', 'dtillman@example.com', '2022-12-16 19:33:41', '+1.442.987.1058', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2', NULL, '1', 'image.jpg', '2ic54wew7o', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(3, NULL, '4f8E4oWzvYWGgGDWnNVC', 'Dr. Delmer Kreiger IV', 'euna15', 'emil72@example.org', '2022-12-16 19:33:41', '+14245988425', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2', NULL, '1', 'image.jpg', '4OfNzZsXI9', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(4, NULL, 'ZxY4pwFeDKEClDRXQIsU', 'Ms. Shanelle Robel III', 'lang.leopoldo', 'gdurgan@example.net', '2022-12-16 19:33:41', '1-847-887-0843', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2', NULL, '2', 'image.jpg', 'QyzAxim5dT', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(5, NULL, 'HaKjkMBNV9ppbbT6qRAJ', 'Shanna Hansen', 'cindy.renner', 'jarod.ryan@example.com', '2022-12-16 19:33:41', '1-847-247-3806', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '1', NULL, '2', 'image.jpg', 'X9D9YGl8bZ', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(6, NULL, 'NjxMtt1Lf7mfHtkWtk4d', 'Hilton Goodwin', 'vida59', 'mann.aileen@example.org', '2022-12-16 19:33:41', '480-243-9734', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '1', NULL, '2', 'image.jpg', 'sXtvjzdl84', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(7, NULL, 'zXMR8KMeohvmCT51kc9V', 'Travon Nicolas', 'alfonso91', 'monahan.raegan@example.net', '2022-12-16 19:33:41', '1-743-700-2799', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2', NULL, '2', 'image.jpg', 'y809MfKvCw', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(8, NULL, '6yY2WwXovq8Zw5yBNg1h', 'Ms. Darlene Dach Sr.', 'kulas.roselyn', 'abner98@example.net', '2022-12-16 19:33:41', '772-667-5884', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '1', NULL, '1', 'image.jpg', '313EtZJmTj', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(9, NULL, 'j2JvYvoy2bZY3mYNDYIg', 'Demetris Jones', 'hauck.kennedi', 'terence56@example.com', '2022-12-16 19:33:41', '1-360-293-2647', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '1', NULL, '2', 'image.jpg', 'OSvhautju4', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(10, NULL, 'oNZmpque8ajEOPL20Yux', 'Wilson Waelchi', 'jeremy.reinger', 'ddavis@example.com', '2022-12-16 19:33:41', '347-230-8413', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '1', NULL, '2', 'image.jpg', 'SzxeQzwosH', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(11, NULL, 'bybp5DwkdCZYQ04c2Jhx', 'Garnett Kling', 'jakob.waters', 'delpha.goodwin@example.net', '2022-12-16 19:33:41', '952-520-4124', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2', NULL, '1', 'image.jpg', 'KUYSyfNDuV', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(12, NULL, 'K8iS6azgG3FHlP28imvD', 'Mr. Jerel Ebert II', 'willms.nia', 'deckow.kaylah@example.com', '2022-12-16 19:33:41', '754-760-5277', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2', NULL, '2', 'image.jpg', 'Q0AEhD6cEl', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(13, NULL, 'jSVFp68gruQMGPoJ4zNP', 'Norberto Berge', 'tbailey', 'tlesch@example.com', '2022-12-16 19:33:41', '+1-743-658-1678', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2', NULL, '1', 'image.jpg', 'C3GsqGsKtp', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(14, NULL, '3cBJjfaThtLVKxIzqyli', 'Reyes Goldner', 'homenick.anthony', 'kzieme@example.net', '2022-12-16 19:33:41', '915.215.1053', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '1', NULL, '2', 'image.jpg', 'ypEQJcRCbh', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(15, NULL, 'MVekClgJTFVzigmLCedo', 'Selena Hirthe', 'dicki.jaden', 'bartoletti.xavier@example.com', '2022-12-16 19:33:41', '347-935-6786', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2', NULL, '2', 'image.jpg', 'ZAE6l7fOPu', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(16, NULL, 'MzfhjDoY4RngJ9iwf0Bu', 'Nova Bashirian', 'adaugherty', 'roy33@example.org', '2022-12-16 19:33:41', '737-592-8015', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '1', NULL, '1', 'image.jpg', 'J6033fgd3D', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(17, NULL, 'EHw9KMfVF0c2ErnISK9J', 'Stanley Kozey', 'tevin.rogahn', 'jason.rau@example.net', '2022-12-16 19:33:41', '1-657-228-7315', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2', NULL, '2', 'image.jpg', 'BZG7em2XET', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(18, NULL, 'lkjl8cpFsZmXTbTRUxJk', 'Prof. Alf McCullough III', 'juwan13', 'adolf.jenkins@example.org', '2022-12-16 19:33:41', '351-559-0293', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2', NULL, '2', 'image.jpg', '512BzDfP1p', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(19, NULL, '10BznyoU9NMmu1BD5yZZ', 'Mrs. Gretchen Oberbrunner III', 'ojerde', 'nader.johnny@example.org', '2022-12-16 19:33:41', '+1.740.347.6527', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2', NULL, '1', 'image.jpg', '81hyduAmcT', '2022-12-16 19:33:41', '2022-12-16 19:33:41'),
(20, NULL, 'ibuvnSwaQ6A4oE3LMnDW', 'Maurine Koepp', 'cory15', 'clair.kirlin@example.net', '2022-12-16 19:33:41', '(848) 721-4719', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2', NULL, '2', 'image.jpg', 'wQMq63OglP', '2022-12-16 19:33:41', '2022-12-16 19:33:41');

-- --------------------------------------------------------

--
-- Table structure for table `workouts`
--

CREATE TABLE `workouts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `goal_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `workouts`
--

INSERT INTO `workouts` (`id`, `goal_id`, `name`, `desc`, `created_by`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, 'Voluptatum ut.', 'Nobis rem itaque dolorem ullam. Fugit odio et tenetur ea.', 3, 'images/about/img-1.jpg', '2022-12-16 19:33:42', '2022-12-16 19:33:42'),
(2, 1, 'Architecto officiis.', 'Vitae qui ab quidem eos enim ipsum incidunt. Facilis pariatur nobis quis.', 1, 'images/about/img-1.jpg', '2022-12-16 19:33:42', '2022-12-16 19:33:42'),
(3, 2, 'Quasi facilis recusandae.', 'Qui explicabo ipsam vel voluptates minus. Debitis illum quisquam omnis odit sit qui unde.', 1, 'images/about/img-1.jpg', '2022-12-16 19:33:42', '2022-12-16 19:33:42'),
(4, 3, 'Voluptates doloribus eos.', 'Dolores natus quis dolor unde. Qui tenetur consequatur hic commodi. Sit culpa et repellat debitis.', 4, 'images/about/img-1.jpg', '2022-12-16 19:33:42', '2022-12-16 19:33:42'),
(5, 3, 'Aut in.', 'Facilis vel quae fuga optio omnis qui. Fugiat qui et doloremque. Voluptate quia sit consequatur.', 1, 'images/about/img-1.jpg', '2022-12-16 19:33:42', '2022-12-16 19:33:42'),
(6, 1, 'Veniam recusandae.', 'Distinctio fugit amet aliquid culpa repellat voluptate. Reiciendis architecto est voluptate.', 1, 'images/about/img-1.jpg', '2022-12-16 19:33:42', '2022-12-16 19:33:42'),
(7, 3, 'Nisi veritatis in.', 'Fugit quos non est facere. Pariatur eos aut sed quos cupiditate in.', 4, 'images/about/img-1.jpg', '2022-12-16 19:33:42', '2022-12-16 19:33:42'),
(8, 4, 'Est et eveniet.', 'Sit omnis voluptate ea quas ex. Officia quo in unde quia ipsa deserunt. In alias et accusamus illo.', 3, 'images/about/img-1.jpg', '2022-12-16 19:33:42', '2022-12-16 19:33:42'),
(9, 1, 'Voluptates pariatur.', 'Aut aut excepturi esse praesentium. Qui qui corrupti sit libero animi.', 3, 'images/about/img-1.jpg', '2022-12-16 19:33:42', '2022-12-16 19:33:42'),
(10, 4, 'Et repudiandae.', 'Qui accusamus quaerat nulla. Hic consequatur facilis accusantium ad sed quas.', 3, 'images/about/img-1.jpg', '2022-12-16 19:33:42', '2022-12-16 19:33:42'),
(11, 4, 'Et excepturi asperiores.', 'Neque a aut quod. Quos voluptas repudiandae doloremque ratione quibusdam non sit.', 1, 'images/about/img-1.jpg', '2022-12-16 19:33:42', '2022-12-16 19:33:42'),
(12, 1, 'Molestiae et.', 'Ad ad officia amet sed. Quo et non eos eum aperiam blanditiis.', 1, 'images/about/img-1.jpg', '2022-12-16 19:33:42', '2022-12-16 19:33:42'),
(13, 4, 'Ad quisquam aut.', 'Aut facilis quos aliquam culpa. Totam corrupti eaque est quisquam id quo. Est eum sit accusamus.', 1, 'images/about/img-1.jpg', '2022-12-16 19:33:42', '2022-12-16 19:33:42'),
(14, 1, 'Voluptatem voluptatem.', 'Sunt eius voluptatem rerum nemo aperiam reiciendis. Qui dolor qui ut. Minima in porro in ea vitae.', 5, 'images/about/img-1.jpg', '2022-12-16 19:33:42', '2022-12-16 19:33:42'),
(15, 3, 'Et vel qui.', 'Sint eveniet incidunt molestiae. Officiis architecto nihil aut. Ab sit neque quia et odit.', 5, 'images/about/img-1.jpg', '2022-12-16 19:33:42', '2022-12-16 19:33:42'),
(16, 3, 'Corporis aut qui.', 'Debitis architecto quia beatae. Expedita ipsam consequatur delectus cupiditate quo.', 2, 'images/about/img-1.jpg', '2022-12-16 19:33:42', '2022-12-16 19:33:42'),
(17, 1, 'Minus qui.', 'Nemo sed soluta sed maiores a. Suscipit voluptatum excepturi quos eos aspernatur.', 4, 'images/about/img-1.jpg', '2022-12-16 19:33:42', '2022-12-16 19:33:42'),
(18, 4, 'Dignissimos sit ducimus.', 'Porro dolores fugit consequatur ipsum deleniti. Aperiam dolore ipsa esse rerum quia recusandae.', 2, 'images/about/img-1.jpg', '2022-12-16 19:33:42', '2022-12-16 19:33:42'),
(19, 3, 'Dolor ut.', 'Quidem commodi nulla ad suscipit ex. Nihil molestiae dolore alias. Ratione libero porro ut dolor.', 1, 'images/about/img-1.jpg', '2022-12-16 19:33:42', '2022-12-16 19:33:42'),
(20, 4, 'Neque cum.', 'Ut et nam delectus in sequi sunt. Tempore sed ea et velit ea hic nemo. Iusto et aut soluta ipsum.', 3, 'images/about/img-1.jpg', '2022-12-16 19:33:42', '2022-12-16 19:33:42');

-- --------------------------------------------------------

--
-- Table structure for table `workout_exercises`
--

CREATE TABLE `workout_exercises` (
  `exercise_id` bigint(20) UNSIGNED NOT NULL,
  `workout_id` bigint(20) UNSIGNED NOT NULL,
  `reps` int(11) NOT NULL,
  `weights` int(11) DEFAULT NULL,
  `time_seconds` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `workout_histories`
--

CREATE TABLE `workout_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `workout_id` bigint(20) UNSIGNED NOT NULL,
  `start_at` timestamp NULL DEFAULT NULL,
  `end_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `workout_history_exercises`
--

CREATE TABLE `workout_history_exercises` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `workout_history_id` bigint(20) UNSIGNED NOT NULL,
  `exercise_id` bigint(20) UNSIGNED NOT NULL,
  `reps` int(11) NOT NULL,
  `weights` int(11) DEFAULT NULL,
  `time_seconds` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `equipments`
--
ALTER TABLE `equipments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `equipment_joins`
--
ALTER TABLE `equipment_joins`
  ADD KEY `equipment_joins_olympus_equipment_id_foreign` (`olympus_equipment_id`),
  ADD KEY `equipment_joins_equipment_id_foreign` (`equipment_id`);

--
-- Indexes for table `exercises`
--
ALTER TABLE `exercises`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exercise_equipments`
--
ALTER TABLE `exercise_equipments`
  ADD KEY `exercise_equipments_exercise_id_foreign` (`exercise_id`),
  ADD KEY `exercise_equipments_equipment_id_foreign` (`equipment_id`);

--
-- Indexes for table `exercise_muscles`
--
ALTER TABLE `exercise_muscles`
  ADD KEY `exercise_muscles_exercise_id_foreign` (`exercise_id`),
  ADD KEY `exercise_muscles_muscle_id_foreign` (`muscle_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `goals`
--
ALTER TABLE `goals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoices_order_id_foreign` (`order_id`);

--
-- Indexes for table `memberships`
--
ALTER TABLE `memberships`
  ADD PRIMARY KEY (`id`),
  ADD KEY `memberships_invoice_id_foreign` (`invoice_id`),
  ADD KEY `memberships_user_id_foreign` (`user_id`);

--
-- Indexes for table `method_payments`
--
ALTER TABLE `method_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `muscles`
--
ALTER TABLE `muscles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `olympus_equipments`
--
ALTER TABLE `olympus_equipments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_plan_id_foreign` (`plan_id`),
  ADD KEY `orders_method_payment_id_foreign` (`method_payment_id`);

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
-- Indexes for table `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_no_phone_unique` (`no_phone`),
  ADD KEY `users_goal_id_foreign` (`goal_id`);

--
-- Indexes for table `workouts`
--
ALTER TABLE `workouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `workouts_goal_id_foreign` (`goal_id`),
  ADD KEY `workouts_created_by_foreign` (`created_by`);

--
-- Indexes for table `workout_exercises`
--
ALTER TABLE `workout_exercises`
  ADD KEY `workout_exercises_exercise_id_foreign` (`exercise_id`),
  ADD KEY `workout_exercises_workout_id_foreign` (`workout_id`);

--
-- Indexes for table `workout_histories`
--
ALTER TABLE `workout_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `workout_histories_user_id_foreign` (`user_id`),
  ADD KEY `workout_histories_workout_id_foreign` (`workout_id`);

--
-- Indexes for table `workout_history_exercises`
--
ALTER TABLE `workout_history_exercises`
  ADD PRIMARY KEY (`id`),
  ADD KEY `workout_history_exercises_workout_history_id_foreign` (`workout_history_id`),
  ADD KEY `workout_history_exercises_exercise_id_foreign` (`exercise_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `equipments`
--
ALTER TABLE `equipments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `exercises`
--
ALTER TABLE `exercises`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `goals`
--
ALTER TABLE `goals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `memberships`
--
ALTER TABLE `memberships`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `method_payments`
--
ALTER TABLE `method_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `muscles`
--
ALTER TABLE `muscles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `olympus_equipments`
--
ALTER TABLE `olympus_equipments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plans`
--
ALTER TABLE `plans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `workouts`
--
ALTER TABLE `workouts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `workout_histories`
--
ALTER TABLE `workout_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `workout_history_exercises`
--
ALTER TABLE `workout_history_exercises`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `equipment_joins`
--
ALTER TABLE `equipment_joins`
  ADD CONSTRAINT `equipment_joins_equipment_id_foreign` FOREIGN KEY (`equipment_id`) REFERENCES `equipments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `equipment_joins_olympus_equipment_id_foreign` FOREIGN KEY (`olympus_equipment_id`) REFERENCES `olympus_equipments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `exercise_equipments`
--
ALTER TABLE `exercise_equipments`
  ADD CONSTRAINT `exercise_equipments_equipment_id_foreign` FOREIGN KEY (`equipment_id`) REFERENCES `equipments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `exercise_equipments_exercise_id_foreign` FOREIGN KEY (`exercise_id`) REFERENCES `exercises` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `exercise_muscles`
--
ALTER TABLE `exercise_muscles`
  ADD CONSTRAINT `exercise_muscles_exercise_id_foreign` FOREIGN KEY (`exercise_id`) REFERENCES `exercises` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `exercise_muscles_muscle_id_foreign` FOREIGN KEY (`muscle_id`) REFERENCES `muscles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `memberships`
--
ALTER TABLE `memberships`
  ADD CONSTRAINT `memberships_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `memberships_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_method_payment_id_foreign` FOREIGN KEY (`method_payment_id`) REFERENCES `method_payments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`),
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_goal_id_foreign` FOREIGN KEY (`goal_id`) REFERENCES `goals` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `workouts`
--
ALTER TABLE `workouts`
  ADD CONSTRAINT `workouts_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `workouts_goal_id_foreign` FOREIGN KEY (`goal_id`) REFERENCES `goals` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `workout_exercises`
--
ALTER TABLE `workout_exercises`
  ADD CONSTRAINT `workout_exercises_exercise_id_foreign` FOREIGN KEY (`exercise_id`) REFERENCES `exercises` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `workout_exercises_workout_id_foreign` FOREIGN KEY (`workout_id`) REFERENCES `workouts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `workout_histories`
--
ALTER TABLE `workout_histories`
  ADD CONSTRAINT `workout_histories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `workout_histories_workout_id_foreign` FOREIGN KEY (`workout_id`) REFERENCES `workouts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `workout_history_exercises`
--
ALTER TABLE `workout_history_exercises`
  ADD CONSTRAINT `workout_history_exercises_exercise_id_foreign` FOREIGN KEY (`exercise_id`) REFERENCES `exercises` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `workout_history_exercises_workout_history_id_foreign` FOREIGN KEY (`workout_history_id`) REFERENCES `workout_histories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
