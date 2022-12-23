-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 21, 2022 at 03:03 AM
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `detail_invoice` (IN `id_order` INT(20))   BEGIN
SELECT 
    i.id, 
    i.created_at, 
    i.expired_at, 
    i.image,
    i.status,
    p.name as name_plan,
    p.price,
    m.name as name_payment,
    m.a_n,
    m.account_no
FROM invoices i 
JOIN plans p ON i.plan_id = p.id
JOIN method_payments m ON i.method_payment_id = m.id
WHERE i.id = id_order LIMIT 1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `verify_invoice` (IN `ord` INT(20), IN `adm` INT(20), IN `st` CHAR(1))   BEGIN
    DECLARE user INT; 
    DECLARE duration INT;
    DECLARE paket_id INT;
    SELECT i.user_id INTO user FROM invoices i WHERE i.id = ord;
    SELECT plans.duration_month INTO duration FROM invoices JOIN plans ON invoices.id = plans.id WHERE invoices.id = ord;
    SELECT invoices.plan_id INTO paket_id FROM invoices WHERE invoices.id = ord;
    START TRANSACTION;
	    UPDATE invoices SET status = st, verified_by = adm, verified_at = NOW() WHERE id = ord;
        INSERT INTO memberships (invoice_id, user_id, plan_id, start_at, expired_at, created_at, updated_at)
                     VALUES (ord,
                            user,
                            paket_id,
                            NOW(),
                            DATE_ADD(NOW(), INTERVAL duration MONTH), 
                            NOW(),
                            NOW());
    COMMIT;
END$$

--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `cek_status_aktif_member` (`exp_date` DATE) RETURNS TINYINT(1)  BEGIN
	DECLARE flag tinyint(1);
	DECLARE defisit int(10);
    
	SELECT TIMESTAMPDIFF(SECOND, NOW(), exp_date) INTO defisit;
	IF(defisit >= 0) 
		THEN SET flag = 1;
	ELSE
		SET flag = 0;
	END IF;
    
	RETURN flag;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `count_jlh_latihan` (`id_workout` INT(20)) RETURNS INT(10)  BEGIN
RETURN (SELECT COUNT('workout_exercises.exercise_id') FROM workouts w
JOIN workout_exercises we ON id_workout = we.workout_id
GROUP BY we.workout_id);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `detail_latihan`
-- (See below for the actual view)
--
CREATE TABLE `detail_latihan` (
`name` varchar(255)
,`image` varchar(255)
,`COUNT(we.exercise_id)` bigint(21)
,`SUM(we.sets)` decimal(32,0)
);

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
(1, 'In id ratione.', 'Velit veniam est natus sit. Voluptatum sint ratione eum enim iusto.', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(2, 'Tempora ea.', 'Ex tenetur possimus explicabo. Molestias mollitia id tempora molestias.', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(3, 'Ut dolores.', 'Alias ea qui dolorum occaecati minus quis. Qui autem ut aliquam neque incidunt.', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(4, 'Voluptatem tempora.', 'Libero molestias aut vel accusantium nihil tempora. Non tempore officiis a dolor.', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(5, 'Eveniet impedit ipsa.', 'Est facilis sed beatae sequi ut. Ex et est nulla minima enim. In voluptate quas aut est impedit.', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(6, 'Quod dolor.', 'Et repellat in vel ut in et et. Excepturi cum et numquam eveniet officiis. Et ea enim nobis.', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(7, 'Ut et exercitationem.', 'Voluptate dignissimos dolores omnis quidem. Soluta iste aut voluptas eos quia voluptates.', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(8, 'Et dignissimos qui.', 'Odit repellat quis sequi ut sit et. Explicabo enim ea a voluptatibus nulla atque qui.', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(9, 'Cumque fuga nesciunt.', 'Cupiditate est officiis vero in ut. Ipsam ab cumque rem amet et inventore doloribus.', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(10, 'Aut ipsum.', 'Minus qui ab necessitatibus ut aut. Aliquam et omnis praesentium dolores voluptate ea nihil.', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(11, 'Sit sapiente dicta.', 'Iure dolor porro eos nobis et. Reiciendis officiis velit omnis et.', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(12, 'Itaque velit.', 'Ea non et voluptatem sed quis. Reiciendis est iste ut consequatur sunt.', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(13, 'Occaecati quia et.', 'Et voluptatem ut veritatis tempore molestias. Facere fugiat sed ut labore sit ut.', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(14, 'Asperiores eos.', 'Nostrum autem esse dolores tenetur. Deserunt iure reiciendis quo quia.', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(15, 'Placeat sapiente aliquid.', 'Repudiandae ratione fugit sed necessitatibus quas dolores cumque non. Quod error fugiat aspernatur.', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(16, 'Omnis placeat.', 'Eaque non et aut velit consequatur maxime repellat. Dolore beatae et mollitia omnis ea est vel.', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(17, 'Voluptatem saepe sit.', 'Sunt nemo repellat atque veniam facilis. Qui quisquam autem ab possimus.', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(18, 'Rem veritatis.', 'Occaecati eos sint debitis. Sint nihil placeat et.', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(19, 'Voluptas sed.', 'Sit ratione dolor voluptas est mollitia veniam. Omnis deserunt non molestiae in ad.', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(20, 'Animi iste maxime.', 'Est eum non occaecati pariatur dolor. Commodi et voluptatum eum.', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(21, 'Possimus dolorem.', 'Esse voluptas accusantium sunt animi. Et aut asperiores ea praesentium.', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(22, 'Eligendi blanditiis.', 'Rerum ad dolores voluptatem quia. Praesentium nihil quisquam itaque numquam.', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(23, 'Eum est.', 'Dolorem beatae eos est dolorem. Quaerat sunt omnis sequi qui sit. Optio aut quae debitis quis quod.', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(24, 'Et doloribus qui.', 'Consequatur itaque iste recusandae aliquid ut. Eveniet qui quo perspiciatis aliquid dolor quos.', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(25, 'Qui temporibus assumenda.', 'Ex voluptas illo quibusdam sed non laudantium. Voluptas eaque aut quia voluptas et.', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(26, 'Expedita neque.', 'Et ut vitae quos odio id. Dolore consequuntur qui et totam rem molestiae.', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(27, 'Omnis reprehenderit molestiae.', 'Tempore et aperiam mollitia neque dignissimos. Nemo saepe voluptas minus dignissimos natus.', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(28, 'Occaecati aliquam.', 'Qui possimus deserunt sint alias odit qui quaerat. Numquam ipsa sit placeat distinctio.', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(29, 'Velit nulla beatae.', 'Aliquam hic omnis magni sed. Qui sit quae quo ab ut. Error a quia illo sit aut.', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(30, 'Et quia.', 'Provident qui possimus ea repellat error. Eius eveniet delectus animi autem voluptates.', '2022-12-20 14:38:39', '2022-12-20 14:38:39');

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
  `type` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exercises`
--

INSERT INTO `exercises` (`id`, `name`, `desc`, `type`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Nostrum quae maiores.', 'Dolores asperiores sed ea consectetur. Sed ad dignissimos quibusdam quia.', '2', 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(2, 'Voluptatum dignissimos odit.', 'Vel aliquam ab hic. Molestiae ab explicabo expedita non est sed voluptatem.', '2', 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(3, 'Ipsum cumque est.', 'Enim cum officia adipisci eos. Perferendis qui vel sunt consequuntur et sit.', '1', 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(4, 'Iure eos.', 'Vel quasi error rerum iste ad et et. Blanditiis quam laboriosam aut repellat tempora.', '2', 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(5, 'Et sapiente.', 'Quia tempore aliquam voluptatum quia ullam eveniet ab. Commodi adipisci aperiam non eos velit.', '2', 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(6, 'Incidunt nisi qui.', 'Saepe aut occaecati nobis. Voluptas est possimus eum qui ducimus est aut dolore.', '2', 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(7, 'Ut nihil magni.', 'Qui velit odit necessitatibus. Omnis esse sed omnis. Esse rerum dicta aut laborum.', '2', 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(8, 'Aut architecto.', 'Nesciunt quia asperiores magnam ut eum. Qui amet at et recusandae cum. Et ut quia reprehenderit.', '1', 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(9, 'Qui eum modi.', 'Fugit a ut minima ducimus. Eum nemo rerum quibusdam. Repudiandae et itaque voluptates et.', '1', 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(10, 'Sunt illum est.', 'Qui quis fugit fugit nihil cum. Aut aut nulla nihil dolorem. Non saepe omnis nobis aut qui vero.', '1', 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(11, 'Reprehenderit corporis.', 'Laborum sit excepturi qui quisquam tempore. Et quaerat animi velit.', '2', 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(12, 'Sunt voluptas.', 'Et est eum quibusdam et cumque quam. Et excepturi culpa voluptatibus harum sit.', '2', 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(13, 'Ab laborum earum.', 'Explicabo qui culpa officiis ex sit. Debitis voluptates veritatis maiores nisi.', '1', 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(14, 'Perferendis rerum sint.', 'Asperiores adipisci repellat aut eligendi et ut. Ab quidem suscipit laboriosam.', '2', 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(15, 'Minima deserunt.', 'Consequatur laudantium omnis qui. Quia quo minima nihil est aut. Quod voluptatum eius officiis.', '1', 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(16, 'Nihil aspernatur.', 'Laboriosam explicabo nobis omnis qui. Illo laudantium perspiciatis voluptatem et.', '2', 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(17, 'Aut molestias.', 'Laborum amet optio quia amet blanditiis. Labore eius praesentium eligendi iure vel qui delectus.', '1', 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(18, 'Et amet.', 'Possimus autem quaerat error. Et iure nobis doloribus reiciendis sed. Cum voluptas quia sunt.', '1', 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(19, 'Sit non voluptatem.', 'Reiciendis modi molestias distinctio qui et exercitationem. Commodi nobis vitae quia neque.', '1', 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(20, 'Fugiat non odit.', 'Incidunt aut rem dolore. Exercitationem quasi saepe accusantium. Sit odio et quae eos nihil odit.', '2', 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(21, 'Fuga ut.', 'Aut nulla soluta et quo libero. Dolor aut sit modi consequatur qui.', '1', 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(22, 'Corrupti maiores fugit.', 'Et et sunt consequuntur rerum. Sit ut eaque odit et odit. Aliquid eos qui consectetur quisquam.', '2', 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(23, 'Aut dolor.', 'Iste qui dolores et dolorem. Provident facilis nihil sunt minus. Ut maxime fugiat alias temporibus.', '1', 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(24, 'Nostrum eveniet.', 'Nam doloremque voluptates id repellendus. Omnis aut ipsum ut consequuntur sint laudantium.', '1', 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(25, 'Velit suscipit.', 'Ut harum pariatur natus quisquam sed eveniet sit. Enim voluptatem sapiente qui.', '1', 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(26, 'Beatae a.', 'Rem cupiditate cupiditate quam quia. Impedit quia repellendus vero et quisquam.', '1', 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(27, 'Nesciunt placeat rerum.', 'Minima provident temporibus minima saepe. Officiis sint tempora maxime est et.', '1', 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(28, 'Quibusdam qui.', 'Et dolore ut et rem minus autem. Officiis corrupti est ut at velit.', '1', 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(29, 'Aut qui.', 'Nihil ratione et soluta omnis. Possimus voluptas et mollitia velit laudantium esse.', '2', 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(30, 'Ut quia dolore.', 'Quia asperiores qui earum aut vel. Totam dolores sit molestiae repellendus.', '1', 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(31, 'Nulla deleniti corporis.', 'Consequuntur culpa doloribus dolorem et ut. Accusantium porro rerum dolorem non commodi expedita.', '1', 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(32, 'Consequuntur impedit.', 'Consequatur non eum est ipsa modi minus. Laudantium qui officiis alias totam ut voluptas omnis.', '2', 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(33, 'Est est inventore.', 'Autem impedit eum et aut ab ut magni. Recusandae veritatis voluptatem quia beatae nemo voluptate.', '1', 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(34, 'Eum voluptate.', 'Rerum et corrupti odit perspiciatis. Ut ut nobis dolor inventore. Atque voluptas et quam non.', '2', 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(35, 'Illo necessitatibus qui.', 'Animi odit aliquam non cupiditate error. Eos quae eaque repellendus.', '2', 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(36, 'Quisquam omnis delectus.', 'Laudantium et modi ducimus. Dicta et perspiciatis nulla nulla.', '1', 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(37, 'Eaque ipsam.', 'Similique consequatur distinctio nobis dolore. Sed qui dolorem debitis ipsam rem doloribus sequi.', '1', 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(38, 'Sit qui.', 'Illo quisquam iure veniam qui aut quasi. Nobis consequatur ut labore quo. Quaerat ab quae aut.', '2', 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(39, 'Quia nihil.', 'Incidunt at sed et voluptates aut veritatis cupiditate. Omnis nostrum incidunt voluptatem et nisi.', '2', 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(40, 'Id quia veniam.', 'Dolor velit dignissimos consectetur amet aut. Optio distinctio molestiae quisquam ab excepturi.', '1', 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39');

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

--
-- Dumping data for table `exercise_equipments`
--

INSERT INTO `exercise_equipments` (`exercise_id`, `equipment_id`, `created_at`, `updated_at`) VALUES
(13, 18, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(17, 17, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(1, 28, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(40, 10, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(28, 5, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(6, 14, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(15, 9, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(21, 3, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(15, 5, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(17, 17, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(27, 10, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(26, 10, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(31, 9, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(29, 22, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(36, 7, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(15, 26, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(14, 26, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(1, 21, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(25, 10, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(15, 29, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(16, 21, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(4, 23, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(20, 14, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(19, 8, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(17, 29, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(7, 14, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(7, 18, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(6, 19, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(10, 11, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(26, 20, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(5, 22, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(29, 25, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(12, 20, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(15, 28, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(27, 7, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(35, 12, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(20, 15, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(7, 11, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(18, 19, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(24, 9, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(20, 28, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(36, 29, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(2, 14, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(26, 16, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(6, 7, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(3, 24, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(5, 25, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(25, 13, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(36, 29, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(39, 26, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(15, 22, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(5, 8, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(7, 11, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(16, 5, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(10, 19, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(26, 16, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(31, 30, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(34, 2, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(36, 18, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(34, 4, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(39, 17, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(8, 3, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(24, 19, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(8, 19, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(25, 1, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(29, 10, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(28, 29, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(2, 4, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(34, 15, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(4, 23, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(40, 13, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(39, 11, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(4, 13, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(31, 17, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(40, 1, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(26, 21, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(33, 11, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(22, 20, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(36, 8, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(31, 27, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(37, 10, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(1, 26, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(19, 5, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(40, 15, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(27, 11, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(20, 27, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(1, 8, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(20, 18, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(4, 23, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(32, 1, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(24, 10, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(25, 17, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(2, 29, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(5, 23, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(24, 27, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(30, 20, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(19, 6, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(13, 3, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(1, 18, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(10, 7, '2022-12-20 14:38:39', '2022-12-20 14:38:39');

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

--
-- Dumping data for table `exercise_muscles`
--

INSERT INTO `exercise_muscles` (`exercise_id`, `muscle_id`, `created_at`, `updated_at`) VALUES
(12, 7, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(22, 14, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(8, 19, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(38, 5, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(19, 7, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(13, 13, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(25, 13, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(3, 7, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(30, 5, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(13, 17, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(20, 15, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(25, 7, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(30, 10, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(33, 6, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(5, 2, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(8, 15, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(37, 11, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(5, 13, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(30, 1, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(1, 1, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(22, 13, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(7, 4, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(10, 12, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(23, 17, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(3, 2, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(26, 12, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(3, 2, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(13, 18, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(2, 14, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(4, 12, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(35, 3, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(17, 19, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(28, 1, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(27, 7, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(18, 10, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(2, 19, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(35, 18, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(33, 18, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(3, 10, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(39, 17, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(10, 7, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(35, 19, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(25, 15, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(23, 17, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(38, 14, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(18, 4, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(5, 7, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(4, 15, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(10, 9, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(10, 4, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(20, 4, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(9, 16, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(11, 9, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(26, 17, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(24, 13, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(34, 12, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(38, 8, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(29, 18, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(17, 8, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(36, 1, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(14, 13, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(16, 16, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(40, 5, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(27, 14, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(5, 19, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(30, 4, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(38, 16, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(36, 12, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(38, 20, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(18, 8, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(10, 18, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(11, 4, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(32, 5, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(34, 12, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(10, 15, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(21, 20, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(36, 20, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(31, 8, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(9, 13, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(18, 20, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(7, 12, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(33, 17, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(6, 9, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(19, 6, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(1, 4, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(16, 5, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(7, 17, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(21, 3, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(25, 18, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(30, 5, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(21, 8, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(30, 16, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(6, 3, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(10, 13, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(8, 18, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(22, 11, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(7, 20, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(33, 8, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(10, 14, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(12, 7, '2022-12-20 14:38:39', '2022-12-20 14:38:39');

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `goals`
--

INSERT INTO `goals` (`id`, `name`, `desc`, `created_at`, `updated_at`) VALUES
(1, 'Aut sit rerum.', 'Deserunt quod deserunt fugiat quidem ullam neque. Unde sit ipsum molestiae aliquid.', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(2, 'Voluptatem amet eos.', 'Aperiam magni doloremque alias sit quasi. Debitis ut rerum non consequatur maiores.', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(3, 'Ut illo.', 'Est ducimus molestiae assumenda molestiae id nobis sit. Tempore soluta aut numquam qui.', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(4, 'Voluptas quo qui.', 'Iusto sit iusto consequatur dolorem ut. Aliquid a nemo nihil.', '2022-12-20 14:38:39', '2022-12-20 14:38:39');

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
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
-- Table structure for table `memberships`
--

CREATE TABLE `memberships` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `plan_id` bigint(20) UNSIGNED NOT NULL,
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
(1, 'Gopay', 'Ahmad Fadli Tambunan', '081316616546', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(2, 'BNI', 'Bang Tito', '1713561564', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(3, 'BRI', 'Bang Gihon', '844648464', '2022-12-20 14:38:39', '2022-12-20 14:38:39');

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
(8, '2022_12_08_140190_create_invoices_table', 1),
(9, '2022_12_08_140219_create_memberships_table', 1),
(10, '2022_12_15_211111_create_muscles_table', 1),
(11, '2022_12_15_212211_create_olympus_equipment_table', 1),
(12, '2022_12_15_212430_create_exercises_table', 1),
(13, '2022_12_15_212444_create_equipments_table', 1),
(14, '2022_12_15_212554_create_workouts_table', 1),
(15, '2022_12_15_212632_create_exercise_equipments_table', 1),
(16, '2022_12_15_212720_create_equipment_joins_table', 1),
(17, '2022_12_15_212733_create_exercise_muscles_table', 1),
(18, '2022_12_15_212812_create_workout_histories_table', 1),
(19, '2022_12_15_212832_create_workout_history_exercises_table', 1),
(20, '2022_12_15_215753_create_workout_exercises_table', 1),
(21, '2022_12_20_170316_create_payments_table', 1);

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
(1, 'Molestias ut inventore.', 'Delectus sequi totam fugiat minus. Dolorem sint voluptas id cumque reprehenderit.', 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(2, 'Voluptatem hic ut.', 'Delectus neque recusandae doloribus. Voluptate voluptatem eum quia corporis dicta veritatis.', 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(3, 'Id hic deleniti.', 'Ducimus non voluptas dolorem. Dolor quis illo esse omnis. Totam enim suscipit qui aut nihil ullam.', 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(4, 'Ipsum minus.', 'Dolorem voluptatum quaerat perferendis unde. Doloremque dolor vitae atque amet ad sed.', 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(5, 'Sequi neque.', 'Est beatae et deserunt voluptas suscipit. Qui sit ut itaque ex nobis minus.', 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(6, 'Accusamus sint.', 'Enim quia natus incidunt et quidem est. In unde quae facilis autem.', 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(7, 'Magnam accusantium iure.', 'Vero omnis odit temporibus. Est odit tempora excepturi est. Ea nesciunt et est libero dicta.', 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(8, 'Assumenda repellat nesciunt.', 'Dicta quo totam ipsa blanditiis sunt accusantium. Aut molestias at modi nam cum.', 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(9, 'Voluptatibus ut.', 'Vel et magni iusto repellendus. Id quae non vero sequi alias inventore. Sed dolorem cumque est.', 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(10, 'Ipsum et.', 'Suscipit ullam atque id eum. Eos nam beatae recusandae illum unde in vel qui.', 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(11, 'Voluptatibus ea sint.', 'Eum dignissimos at eos et. Eum non et cum.', 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(12, 'Praesentium accusantium magnam.', 'Quia voluptate harum et voluptas non. Tempore et corrupti recusandae perferendis consequatur.', 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(13, 'Ullam odio non.', 'Veniam vero occaecati corporis voluptatum. Nisi ut mollitia omnis.', 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(14, 'Pariatur tempore eum.', 'In tempore cumque ea voluptatem. Expedita hic aut consequuntur. Est omnis totam qui laudantium.', 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(15, 'In nesciunt.', 'Dolores suscipit perspiciatis earum aut dolores deleniti. Ratione laboriosam deleniti at.', 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(16, 'Quia ratione eos.', 'Quis fugiat quod asperiores voluptate. Architecto repudiandae cum sint. Et ut et est est officiis.', 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(17, 'Et illo.', 'Occaecati eum sit repellat est. Rem quos odio molestias eum dolores.', 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(18, 'Rerum hic sit.', 'Unde earum voluptatem debitis quibusdam repellat. Dolor quidem molestias debitis sed dolores ut.', 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(19, 'Dolore quis.', 'Tenetur ducimus culpa cumque qui. Aut atque reiciendis pariatur dolorem saepe quibusdam laborum.', 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(20, 'Inventore nobis.', 'Ducimus corrupti ipsum aut ut tenetur dolor aut. Non aut facere consequuntur et fugit error.', 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39');

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
(1, 'Aliquid dignissimos autem.', 'Repellendus.', 'Sint molestiae est et voluptatem molestiae ipsa voluptatem error. Tempore nihil in velit sed.', 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(2, 'Est non doloribus.', 'Modi.', 'Impedit omnis nemo esse atque nesciunt et. Quia nostrum repellat pariatur cupiditate.', 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(3, 'Doloremque nesciunt.', 'Numquam vero.', 'Unde sint amet magnam. Nam voluptatem placeat et nisi sed.', 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(4, 'Aperiam accusamus quo.', 'Qui ipsum.', 'Doloribus possimus rerum incidunt nihil inventore. Sit ut tenetur nulla eum doloribus et ut.', 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(5, 'Occaecati eum.', 'Voluptatem.', 'Unde vel tempora temporibus et est qui. Magni eos vero illo recusandae repellendus.', 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(6, 'In et.', 'Hic.', 'Dolor sunt eum corrupti perferendis. Enim reiciendis aut in magnam. Cum aut minima illo earum.', 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(7, 'Eos sequi.', 'Eos et.', 'Ut nihil ad eum tempora. Sit qui quia quo facere libero est a. Quis itaque corrupti ipsum.', 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(8, 'Sunt in.', 'Et.', 'Omnis minima sit sapiente quidem. Reiciendis harum et est.', 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(9, 'Possimus enim molestias.', 'Vel.', 'Voluptates quisquam amet eos ullam. Voluptatibus fugiat ratione impedit vel.', 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(10, 'Omnis voluptas unde.', 'Laudantium.', 'Et eum harum alias ullam temporibus iure sint ea. Magnam et excepturi libero.', 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(11, 'Molestias ab.', 'Molestiae accusantium.', 'Vero est molestiae consequatur fuga doloremque eos. Veniam quod aut sit.', 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(12, 'Dolore qui.', 'Neque.', 'Est eveniet eos id est. A molestias ut id rerum. Quo non natus magnam sunt sit fuga omnis.', 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(13, 'Dolorem iste.', 'Aut asperiores.', 'Amet sequi voluptatem odit facere magnam qui dolorem. Iure eligendi minima autem amet.', 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(14, 'Fuga corporis.', 'Hic officia.', 'Et pariatur quisquam asperiores. Accusantium quis magni mollitia sit. Sed et repellat neque.', 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(15, 'Nulla in.', 'Nemo.', 'Quis quae est adipisci autem quaerat. Blanditiis eos ut recusandae. Vitae pariatur voluptate fugit.', 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(16, 'Dicta nihil.', 'Ex.', 'Saepe aut magnam quod sit. Sapiente deserunt sint aut odio non maxime.', 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(17, 'Rerum illum et.', 'Dolorem.', 'Eos aut vitae quia et aut. Expedita quis ex quod. Nostrum animi dolor voluptas libero quis.', 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(18, 'Eaque incidunt.', 'Commodi rerum.', 'Beatae est non nihil. Totam perferendis voluptatem sit officia iste aliquam laboriosam.', 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(19, 'Consectetur et id.', 'Perspiciatis.', 'Ad ut officia sint id culpa velit. Deserunt ut qui incidunt ipsam quas.', 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(20, 'Exercitationem voluptate.', 'Et et.', 'Voluptatem sint aperiam deserunt natus sunt quas. Eum earum ut sunt inventore.', 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39');

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
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
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
(1, 'Itaque sed aut.', 'Repudiandae ut et voluptatum. Qui eius et hic et. Est ipsum quae reprehenderit adipisci facilis.', 709609, 11, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(2, 'Quod est ducimus.', 'Et sed ut non. Ad maxime vel in quia et. Et rerum vel atque odit praesentium.', 471996, 2, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(3, 'Et similique fugiat.', 'Et enim reprehenderit voluptatem est. Ut aut at rerum porro sequi iste.', 591774, 6, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(4, 'Qui quidem voluptatem.', 'Hic eius quisquam qui. Quas ducimus et vero. Vel non sit quia cupiditate hic exercitationem.', 649790, 12, '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(5, 'Enim repudiandae.', 'Harum nam est deleniti sed facere et veritatis. Omnis qui est voluptate eum est.', 172708, 12, '2022-12-20 14:38:39', '2022-12-20 14:38:39');

-- --------------------------------------------------------

--
-- Stand-in structure for view `unverified_order`
-- (See below for the actual view)
--
CREATE TABLE `unverified_order` (
`id` bigint(20) unsigned
,`buyer` varchar(255)
,`plan` varchar(255)
,`price` int(11)
,`methodPay` varchar(255)
,`image` varchar(255)
,`created_at` timestamp
);

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
(1, 3, 'Lgmt0ZZfnqMvLnsd9trX', 'Jamal Zemlak', 'johns.karson', 'stefanie66@example.net', '2022-12-20 14:38:39', '541-929-6191', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '1', NULL, '2', 'image.jpg', 'VCGuJMmFcd', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(2, 1, 'zW22edWLFQsTzhavwaeB', 'Sophia Corkery', 'margarette.runte', 'krice@example.org', '2022-12-20 14:38:39', '+1 (854) 982-9528', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2', NULL, '2', 'image.jpg', 'QXPB7i3N7LrwgW850Q6PuuSEZeRpqC2ejPaNzcWhJ7xNQ17Pmap9zigTQN5j', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(3, 4, 'G64S7RNvCXF0vMwsoYzF', 'Mortimer Runolfsson', 'uhermann', 'theresa.steuber@example.net', '2022-12-20 14:38:39', '+1 (870) 385-4349', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2', NULL, '1', 'image.jpg', 'AXSM2lU8cW', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(4, 2, 'NI4g4BbrqgIr8CtjFOAD', 'Dr. Margaret Gorczany IV', 'rosemary.jerde', 'jayden64@example.com', '2022-12-20 14:38:39', '463.966.8501', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2', NULL, '1', 'image.jpg', 'S6UyWaEi4y', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(5, 4, 'uHQxyPJA9v5yBqvxVgVY', 'Reece Predovic', 'wendy.ankunding', 'kirlin.giles@example.net', '2022-12-20 14:38:39', '303.846.7237', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2', NULL, '1', 'image.jpg', 'VGp6yKwJ6X', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(6, 2, '7MEylZlE2O7z0RAaiLo5', 'Morgan Terry MD', 'zframi', 'meaghan.douglas@example.net', '2022-12-20 14:38:39', '929-554-0027', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2', NULL, '2', 'image.jpg', 'yVkeQzuWpM', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(7, 3, 'xUttyhMux3PwEPMP8mnu', 'Kaia Pouros', 'arely31', 'hugh.hahn@example.com', '2022-12-20 14:38:39', '(712) 639-1900', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '1', NULL, '2', 'image.jpg', 'TZ69Bx6WY2', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(8, 4, 'bnTH2rTzyqDKebZBuFOJ', 'Mason King', 'mariah.yundt', 'ashlee93@example.com', '2022-12-20 14:38:39', '812-512-9094', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '1', NULL, '1', 'image.jpg', 'AJrO8N2Uyo', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(9, 2, 'tje0Vx9PHK8bnpaNkHUX', 'Jace Deckow', 'corwin.frankie', 'allison.kunze@example.org', '2022-12-20 14:38:39', '276-790-5888', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '1', NULL, '1', 'image.jpg', 'tnSdZGtB4J', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(10, 3, 'bqQvwi1Zvtzml006tPKS', 'Flavie Ullrich', 'richmond.zulauf', 'lesly73@example.org', '2022-12-20 14:38:39', '1-248-392-4592', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '1', NULL, '2', 'image.jpg', 'ElsERnoRBV', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(11, 1, 'UIwlJpsgkPaFCM88hll2', 'Rosalinda Beahan DDS', 'laverna.haley', 'hassan82@example.com', '2022-12-20 14:38:39', '+1.209.655.1058', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2', NULL, '2', 'image.jpg', '4BayQxWXrb', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(12, 2, 'gZeL3ilGF6PK1t3OtO4M', 'Bert Stanton', 'madeline75', 'oconnell.domenica@example.org', '2022-12-20 14:38:39', '+1-947-591-8958', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2', NULL, '1', 'image.jpg', 'y6yOoR8T6e', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(13, 3, 'zJCTHq4yPRyAFripKlre', 'Antonio Olson', 'ryan.anita', 'ajohnson@example.org', '2022-12-20 14:38:39', '405.633.1125', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2', NULL, '1', 'image.jpg', 'G7hKI3Akj5', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(14, 3, 'Rjx8BfJazvVgO1VyuyGG', 'Elmer Terry', 'owillms', 'johnson08@example.net', '2022-12-20 14:38:39', '386.319.1848', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '1', NULL, '1', 'image.jpg', 'Ayw66z7INH', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(15, 2, 'I0Fasys4hDkmmwjS4qoJ', 'Yadira Brekke MD', 'britney31', 'mariah45@example.org', '2022-12-20 14:38:39', '1-510-925-1765', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '1', NULL, '2', 'image.jpg', 'u6rSQVetdT', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(16, 3, 'y2UiXOHX03AY4wklPQWX', 'Bridget Collins', 'vicenta88', 'maiya.wuckert@example.com', '2022-12-20 14:38:39', '+1 (815) 594-2809', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '1', NULL, '2', 'image.jpg', 'eID2XCVcUA', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(17, 4, 'wwCllnYg3xEDf3eqABpG', 'Marcelina Boehm', 'hbeatty', 'emmy96@example.org', '2022-12-20 14:38:39', '(341) 839-1642', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '1', NULL, '2', 'image.jpg', '5u5WjyqGGy', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(18, 3, 'Wcb2dstdAaUDccEFgyoS', 'Santos Beahan', 'simonis.kaley', 'coconnell@example.net', '2022-12-20 14:38:39', '+1-279-550-7603', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '1', NULL, '1', 'image.jpg', '91uPmORhUb', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(19, 2, 'TkQvq6SdKclLVrD5sxuf', 'Chelsie Mante', 'willy39', 'mthompson@example.org', '2022-12-20 14:38:39', '+1-276-971-8844', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '1', NULL, '2', 'image.jpg', 'B7uZIG1mpt', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(20, 1, '1MgyqtiJdqf2cSrEBqFJ', 'Ms. Zoey Gibson', 'eloy.reilly', 'schmidt.shania@example.net', '2022-12-20 14:38:39', '1-458-561-9059', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '1', NULL, '2', 'image.jpg', 'AmVu0zbnm4', '2022-12-20 14:38:39', '2022-12-20 14:38:39');

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_member_aktif`
-- (See below for the actual view)
--
CREATE TABLE `view_member_aktif` (
`member_id` bigint(20) unsigned
,`member_name` varchar(255)
,`no_phone` varchar(255)
,`start_at` timestamp
,`expired_at` timestamp
,`status` tinyint(1)
,`member_plan` varchar(255)
);

-- --------------------------------------------------------

--
-- Table structure for table `workouts`
--

CREATE TABLE `workouts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `goal_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `workouts`
--

INSERT INTO `workouts` (`id`, `goal_id`, `name`, `created_by`, `image`, `created_at`, `updated_at`) VALUES
(1, 3, 'Et ut.', 2, 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(2, 1, 'Dolorum in.', 3, 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(3, 3, 'Hic quod.', 4, 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(4, 3, 'Odit dignissimos ullam.', 5, 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(5, 1, 'Hic odit quia.', 2, 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(6, 3, 'Atque omnis cupiditate.', 3, 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(7, 1, 'Officia dolor.', 4, 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(8, 3, 'Voluptatem vero.', 3, 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(9, 2, 'In labore itaque.', 5, 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(10, 1, 'Iusto modi.', 3, 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(11, 3, 'In est ullam.', 3, 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(12, 4, 'Consequatur voluptates aut.', 4, 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(13, 4, 'Est voluptates temporibus.', 3, 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(14, 1, 'Consequatur voluptas.', 3, 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(15, 1, 'Dolore voluptas.', 4, 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(16, 3, 'Officia aut ad.', 2, 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(17, 2, 'Quam qui.', 2, 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(18, 1, 'Sint ad asperiores.', 4, 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(19, 3, 'Qui libero.', 5, 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39'),
(20, 4, 'Omnis cum.', 5, 'images/about/img-1.jpg', '2022-12-20 14:38:39', '2022-12-20 14:38:39');

-- --------------------------------------------------------

--
-- Table structure for table `workout_exercises`
--

CREATE TABLE `workout_exercises` (
  `exercise_id` bigint(20) UNSIGNED NOT NULL,
  `workout_id` bigint(20) UNSIGNED NOT NULL,
  `sets` int(11) NOT NULL,
  `reps` int(11) DEFAULT NULL,
  `time_seconds` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `workout_exercises`
--

INSERT INTO `workout_exercises` (`exercise_id`, `workout_id`, `sets`, `reps`, `time_seconds`, `created_at`, `updated_at`) VALUES
(1, 1, 5, NULL, 6, '2022-12-20 14:46:11', '2022-12-20 14:46:11');

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

-- --------------------------------------------------------

--
-- Structure for view `detail_latihan`
--
DROP TABLE IF EXISTS `detail_latihan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `detail_latihan`  AS SELECT `w`.`name` AS `name`, `w`.`image` AS `image`, count(`we`.`exercise_id`) AS `COUNT(we.exercise_id)`, sum(`we`.`sets`) AS `SUM(we.sets)` FROM (`workouts` `w` join `workout_exercises` `we` on(`w`.`id` = `we`.`workout_id`)) GROUP BY `we`.`workout_id``workout_id`  ;

-- --------------------------------------------------------

--
-- Structure for view `unverified_order`
--
DROP TABLE IF EXISTS `unverified_order`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `unverified_order`  AS SELECT `i`.`id` AS `id`, `u`.`name` AS `buyer`, `p`.`name` AS `plan`, `p`.`price` AS `price`, `mp`.`name` AS `methodPay`, `i`.`image` AS `image`, `i`.`created_at` AS `created_at` FROM (((`invoices` `i` join `users` `u` on(`i`.`user_id` = `u`.`id`)) join `plans` `p` on(`i`.`plan_id` = `p`.`id`)) join `method_payments` `mp` on(`i`.`method_payment_id` = `mp`.`id`)) WHERE `i`.`status` is null AND `i`.`image` is not nullnot null  ;

-- --------------------------------------------------------

--
-- Structure for view `view_member_aktif`
--
DROP TABLE IF EXISTS `view_member_aktif`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_member_aktif`  AS SELECT `m`.`id` AS `member_id`, `u`.`name` AS `member_name`, `u`.`no_phone` AS `no_phone`, `m`.`start_at` AS `start_at`, `m`.`expired_at` AS `expired_at`, `cek_status_aktif_member`(`m`.`expired_at`) AS `status`, `p`.`name` AS `member_plan` FROM ((`memberships` `m` join `users` `u` on(`m`.`user_id` = `u`.`id`)) join `plans` `p` on(`m`.`plan_id` = `p`.`id`))  ;

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
  ADD KEY `invoices_user_id_foreign` (`user_id`),
  ADD KEY `invoices_plan_id_foreign` (`plan_id`),
  ADD KEY `invoices_method_payment_id_foreign` (`method_payment_id`);

--
-- Indexes for table `memberships`
--
ALTER TABLE `memberships`
  ADD PRIMARY KEY (`id`),
  ADD KEY `memberships_invoice_id_foreign` (`invoice_id`),
  ADD KEY `memberships_user_id_foreign` (`user_id`),
  ADD KEY `memberships_plan_id_foreign` (`plan_id`);

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
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

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
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
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
  ADD CONSTRAINT `invoices_method_payment_id_foreign` FOREIGN KEY (`method_payment_id`) REFERENCES `method_payments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `invoices_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`),
  ADD CONSTRAINT `invoices_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `memberships`
--
ALTER TABLE `memberships`
  ADD CONSTRAINT `memberships_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `memberships_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `memberships_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
