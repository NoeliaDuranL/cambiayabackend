-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 24-11-2024 a las 23:55:47
-- Versión del servidor: 8.0.30
-- Versión de PHP: 8.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_cambiayaoficial`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensaje`
--

CREATE TABLE `mensaje` (
  `id_mensaje` int NOT NULL,
  `remitente` int NOT NULL,
  `destinatario` int NOT NULL,
  `mensaje` text COLLATE utf8mb4_general_ci NOT NULL,
  `leido` tinyint(1) DEFAULT '0',
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estado` smallint DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000001_create_cache_table', 1),
(2, '2024_11_05_172029_create_sessions_table', 1),
(3, '2024_11_05_173951_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificacion`
--

CREATE TABLE `notificacion` (
  `id_notificacion` int NOT NULL,
  `id_usuario` int NOT NULL,
  `id_remitente` int NOT NULL,
  `id_post` int NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `mensaje` text COLLATE utf8mb4_general_ci NOT NULL,
  `leido` tinyint(1) DEFAULT '0',
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estado` smallint DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `id_persona` int NOT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `apellido` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `estado` smallint DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id_persona`, `nombre`, `apellido`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'Carlos', 'Mendez', 1, '2024-11-07 06:23:53', '2024-11-07 06:23:53'),
(2, 'Ana', 'Gomez', 1, '2024-11-07 06:24:22', '2024-11-07 06:24:22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\Usuario', 3, 'MiAplicacion', '8b60261a3f4dd1002922ffa6810cae08f0e65a449d31181321db8b1f2b720b9c', '[\"*\"]', NULL, NULL, '2024-11-13 04:26:40', '2024-11-13 04:26:40'),
(2, 'App\\Models\\Usuario', 4, 'MiAplicacion', 'ed2143f54b4868a2767b1aac3c546196bb596b201a752701f88e9d0a8e25a6fc', '[\"*\"]', NULL, NULL, '2024-11-13 04:46:24', '2024-11-13 04:46:24'),
(3, 'App\\Models\\Usuario', 4, 'MiAplicacion', '9eae49cba0dc63ae74b36ea55ef36cda90645b3dfb749677c3406e30f4267729', '[\"*\"]', NULL, NULL, '2024-11-13 04:47:19', '2024-11-13 04:47:19'),
(4, 'App\\Models\\Usuario', 4, 'MiAplicacion', 'ca2442d34c7fc215c2f2ea4800664a7a61f68ba19b001051c3c3889f5d799c18', '[\"*\"]', NULL, NULL, '2024-11-13 04:56:27', '2024-11-13 04:56:27'),
(5, 'App\\Models\\Usuario', 5, 'MiAplicacion', '49d8de7c29db1ab460d8fea6fceead0ecde2b530bfc82f89d0e41015b9f3f29e', '[\"*\"]', NULL, NULL, '2024-11-13 05:06:38', '2024-11-13 05:06:38'),
(6, 'App\\Models\\Usuario', 5, 'MiAplicacion', '2610bd475662e7c0a0e6d25ce19dff2d2cfec8a2d7f851860dddff3808e2c952', '[\"*\"]', NULL, NULL, '2024-11-13 05:16:28', '2024-11-13 05:16:28'),
(7, 'App\\Models\\Usuario', 5, 'MiAplicacion', '0a767cf90ddc56d7fa8e3dca031a8e1a99954bf9eb9c580a3ed4adf8783affd3', '[\"*\"]', NULL, NULL, '2024-11-13 05:16:37', '2024-11-13 05:16:37'),
(8, 'App\\Models\\Usuario', 5, 'MiAplicacion', '733c3002f5d5c70f9bcf3c6aaabeaa8019d4a0e66e5fba3800d606fae3d3b930', '[\"*\"]', NULL, NULL, '2024-11-13 06:53:36', '2024-11-13 06:53:36'),
(9, 'App\\Models\\Usuario', 5, 'MiAplicacion', 'a2a9df9b6c4e7d93fd352faf450ff1750cc4f1357adf29c0c97ca6c4bb62c52c', '[\"*\"]', NULL, NULL, '2024-11-13 07:33:28', '2024-11-13 07:33:28'),
(10, 'App\\Models\\Usuario', 5, 'MiAplicacion', '1203a4866a8242c240f5b69d05af012e97173a227eb942cfe271accabe976fe9', '[\"*\"]', NULL, NULL, '2024-11-13 08:24:19', '2024-11-13 08:24:19'),
(11, 'App\\Models\\Usuario', 5, 'MiAplicacion', 'b11a579b7ddf2a37ab7fa4b09319331dd621ec11094a7e2257122953412de5ae', '[\"*\"]', NULL, NULL, '2024-11-13 08:24:52', '2024-11-13 08:24:52'),
(12, 'App\\Models\\Usuario', 5, 'MiAplicacion', 'f5c56117fc794774f9aa1d7aaaaabceea811d4e12879eeb51f4c84f384c8a342', '[\"*\"]', NULL, NULL, '2024-11-13 08:25:30', '2024-11-13 08:25:30'),
(13, 'App\\Models\\Usuario', 5, 'MiAplicacion', '7680fee7ff3d35718db47a7f5afcfe7258494b877b73197c39e4c06d1f3982b2', '[\"*\"]', NULL, NULL, '2024-11-13 08:25:53', '2024-11-13 08:25:53'),
(14, 'App\\Models\\Usuario', 6, 'MiAplicacion', 'fb2f90c6b5156e26aec6c051a8c6d32f091656f1ae5bb1ef2ec250e1cdfe4ab8', '[\"*\"]', NULL, NULL, '2024-11-13 08:26:18', '2024-11-13 08:26:18'),
(15, 'App\\Models\\Usuario', 5, 'MiAplicacion', '2f89db62945f92d115f2d58b78294effb0f884a9f6fe5b8139a757b917b63e3c', '[\"*\"]', NULL, NULL, '2024-11-13 08:28:17', '2024-11-13 08:28:17'),
(16, 'App\\Models\\Usuario', 5, 'MiAplicacion', 'b1dab8d6fc8c7e0edb3a48e92ce0fa20b74ff285d706be03e1bc5f4bbab292e8', '[\"*\"]', NULL, NULL, '2024-11-13 08:32:06', '2024-11-13 08:32:06'),
(17, 'App\\Models\\Usuario', 5, 'MiAplicacion', 'a3d7ba6f15d3a36c7c36e5745b9ab81534afddd57928a77aa686357707a2b3e1', '[\"*\"]', NULL, NULL, '2024-11-13 11:57:10', '2024-11-13 11:57:10'),
(18, 'App\\Models\\Usuario', 5, 'MiAplicacion', '45303a54d06af0fc6f2a6e134951c488172d8c97dae8adfc021d4f3b567eb4a5', '[\"*\"]', NULL, NULL, '2024-11-13 12:03:09', '2024-11-13 12:03:09'),
(19, 'App\\Models\\Usuario', 5, 'MiAplicacion', '7b9952867bc34236845f16be627bc969ad4463c39106b37b53682f0c9df5deae', '[\"*\"]', NULL, NULL, '2024-11-13 12:19:19', '2024-11-13 12:19:19'),
(20, 'App\\Models\\Usuario', 7, 'MiAplicacion', '9ca58c58ee40abc4a4f41432a8ac1a4aa3b711ac0c54848b5ec406ef8787a06c', '[\"*\"]', NULL, NULL, '2024-11-13 15:04:04', '2024-11-13 15:04:04'),
(21, 'App\\Models\\Usuario', 7, 'MiAplicacion', 'f2a21eb9551c49eab8d052a46aaa92bc327b053a82da79e83ee4d8883eac3dad', '[\"*\"]', NULL, NULL, '2024-11-13 15:04:14', '2024-11-13 15:04:14'),
(22, 'App\\Models\\Usuario', 8, 'MiAplicacion', '89ed281b342867cca847cdb7e2c3e97624bd27e96ee9e693eb475769c3308a08', '[\"*\"]', NULL, NULL, '2024-11-13 16:00:29', '2024-11-13 16:00:29'),
(23, 'App\\Models\\Usuario', 8, 'MiAplicacion', '39cd3dd37bf6d70f620ba1cd1c52a39149279f76708f0a1892291bac1ed81d01', '[\"*\"]', NULL, NULL, '2024-11-13 16:00:39', '2024-11-13 16:00:39'),
(24, 'App\\Models\\Usuario', 9, 'MiAplicacion', '27ff33c5347c861e0067cfdc63367419cc0a8dbd25ec0ddeba51a19dd0822c88', '[\"*\"]', NULL, NULL, '2024-11-13 16:22:37', '2024-11-13 16:22:37'),
(25, 'App\\Models\\Usuario', 9, 'MiAplicacion', 'fb9a546aa13ac3040ebbe6f049dc12d68285c642e6926d2abadaa3d606e5b1a4', '[\"*\"]', NULL, NULL, '2024-11-13 16:22:58', '2024-11-13 16:22:58'),
(26, 'App\\Models\\Usuario', 8, 'MiAplicacion', '0eb191a0e6f2494bbce30a23e534768932f37fc794b2677c768f4a0ff3f33fe5', '[\"*\"]', NULL, NULL, '2024-11-13 16:29:04', '2024-11-13 16:29:04'),
(27, 'App\\Models\\Usuario', 5, 'MiAplicacion', 'd7e787591793e3e4e2dcb4b799714444319590d3f4136e8ee2afab0fdba669bb', '[\"*\"]', NULL, NULL, '2024-11-14 05:16:50', '2024-11-14 05:16:50'),
(28, 'App\\Models\\Usuario', 10, 'MiAplicacion', '4b6fe1c1762bb18d9ab95c23daa03a55e708dfd49eb8a06ca355bd1d2f7ac45d', '[\"*\"]', NULL, NULL, '2024-11-20 00:44:51', '2024-11-20 00:44:51'),
(29, 'App\\Models\\Usuario', 10, 'MiAplicacion', '7e453ef3376cfda49e046e426a01e0cbe3c4647346cddce0aae6ae5db5ddb3a2', '[\"*\"]', NULL, NULL, '2024-11-20 00:47:15', '2024-11-20 00:47:15'),
(30, 'App\\Models\\Usuario', 10, 'MiAplicacion', 'e6aab32b5ac020b4b14e86d168494f0e95e1ce0af6a92392deef0ffdd386ce48', '[\"*\"]', NULL, NULL, '2024-11-20 00:52:53', '2024-11-20 00:52:53'),
(31, 'App\\Models\\Usuario', 10, 'MiAplicacion', '9ed262ca9190927488565b3922b8ef76cde106a7e4896093d166639a6b8dc6c0', '[\"*\"]', NULL, NULL, '2024-11-20 00:56:16', '2024-11-20 00:56:16'),
(32, 'App\\Models\\Usuario', 8, 'MiAplicacion', '444f4514e989162b892392c4ea8856b96dc22a35f8b6097b6bb54d315ac25e20', '[\"*\"]', NULL, NULL, '2024-11-20 00:57:54', '2024-11-20 00:57:54'),
(33, 'App\\Models\\Usuario', 10, 'MiAplicacion', 'd3612ead96dc9aad90ce819bfa36d945cad12e5f81799a5498d0888fc3a8c604', '[\"*\"]', NULL, NULL, '2024-11-20 00:58:29', '2024-11-20 00:58:29'),
(34, 'App\\Models\\Usuario', 10, 'MiAplicacion', 'e60bd883543e07e1312207acf26b70ae367db13e515cf92bbdd1e19e16448cad', '[\"*\"]', NULL, NULL, '2024-11-20 01:15:53', '2024-11-20 01:15:53'),
(35, 'App\\Models\\Usuario', 11, 'MiAplicacion', 'c884773e2100473813ebd96f11aacd4d7b3fcf3af53597c0ae06fb8b90baeb65', '[\"*\"]', NULL, NULL, '2024-11-20 04:56:41', '2024-11-20 04:56:41'),
(36, 'App\\Models\\Usuario', 11, 'MiAplicacion', 'b94caa922d5fa6b31268ec4f161290f92120cea065b5e474d74aafceb4992b24', '[\"*\"]', NULL, NULL, '2024-11-20 04:56:52', '2024-11-20 04:56:52'),
(37, 'App\\Models\\Usuario', 11, 'MiAplicacion', '1fd7b73a18fe60358e31ffc98825679a807b96fdddf658dd010105cadebdba6e', '[\"*\"]', NULL, NULL, '2024-11-20 04:59:17', '2024-11-20 04:59:17'),
(38, 'App\\Models\\Usuario', 10, 'MiAplicacion', 'a4698aea22ea59a4fd9f63fa697071633c25a57698121133f763082a15f30986', '[\"*\"]', NULL, NULL, '2024-11-20 05:22:14', '2024-11-20 05:22:14'),
(39, 'App\\Models\\Usuario', 10, 'MiAplicacion', '7befb9c17cd5413ccf83d97a0258579f771c28415b705c7d5317b1bccd82a1bf', '[\"*\"]', NULL, NULL, '2024-11-20 05:23:10', '2024-11-20 05:23:10'),
(40, 'App\\Models\\Usuario', 10, 'MiAplicacion', '50e4349f560776c578fff41322c6682a8ef6e7dd278b7fc042847eb4594a88e0', '[\"*\"]', NULL, NULL, '2024-11-20 05:29:16', '2024-11-20 05:29:16'),
(41, 'App\\Models\\Usuario', 10, 'MiAplicacion', '65a56425ed8cb2862bb5837caab7871c998ee5266abbc8f618f4177d6797f633', '[\"*\"]', NULL, NULL, '2024-11-20 05:34:54', '2024-11-20 05:34:54'),
(42, 'App\\Models\\Usuario', 10, 'MiAplicacion', 'c6911baad9cdd97db9556c0eb0e202008607c0f48ea97aef1f181a7f1fd9e4d8', '[\"*\"]', NULL, NULL, '2024-11-20 05:43:44', '2024-11-20 05:43:44'),
(43, 'App\\Models\\Usuario', 10, 'MiAplicacion', '1a18bd4cbb216464b135dde3a1a89dcadfd1695de6538a28f1e6632195581e18', '[\"*\"]', NULL, NULL, '2024-11-20 15:44:59', '2024-11-20 15:44:59'),
(44, 'App\\Models\\Usuario', 10, 'MiAplicacion', '8b9608e117ccbe095ce1a878cec07e95fdac35fa9a6358952925a4edf197a1fc', '[\"*\"]', NULL, NULL, '2024-11-20 15:46:12', '2024-11-20 15:46:12'),
(45, 'App\\Models\\Usuario', 10, 'MiAplicacion', '5cd46cdcfd4c2e14eb8e8a53b8db2b75008114f74aaee2a6fb62b271c8abc856', '[\"*\"]', NULL, NULL, '2024-11-20 15:50:59', '2024-11-20 15:50:59'),
(46, 'App\\Models\\Usuario', 10, 'MiAplicacion', '0d48c387cb24090be8400b0279f0254e350faaebef43fa5c4be2023375167fb4', '[\"*\"]', NULL, NULL, '2024-11-20 15:51:19', '2024-11-20 15:51:19'),
(47, 'App\\Models\\Usuario', 12, 'MiAplicacion', 'c05d7c68f39ca0dbfb6f25bc1a17d654bcc5890bac1fe03c513cab7567d53169', '[\"*\"]', NULL, NULL, '2024-11-20 15:54:59', '2024-11-20 15:54:59'),
(48, 'App\\Models\\Usuario', 12, 'MiAplicacion', '757e3ba369d36cfbb524dcd9267499a4fce673d03587105435d1619c400108df', '[\"*\"]', NULL, NULL, '2024-11-20 15:55:13', '2024-11-20 15:55:13'),
(49, 'App\\Models\\Usuario', 10, 'MiAplicacion', '578605ce70c65222114a31ae00ef70912ca1315b57bc2eb4ba49c37237932d0d', '[\"*\"]', NULL, NULL, '2024-11-20 16:02:29', '2024-11-20 16:02:29'),
(50, 'App\\Models\\Usuario', 10, 'MiAplicacion', 'ccf8aa3464001cbb5c67bd05279d330d6afbe0e03edca2c43eedebb246b98264', '[\"*\"]', NULL, NULL, '2024-11-20 16:09:37', '2024-11-20 16:09:37'),
(51, 'App\\Models\\Usuario', 10, 'MiAplicacion', 'df06faed1de3387233994077276f0e69a28f2b1d97b8d650248b25ea15f1fadb', '[\"*\"]', NULL, NULL, '2024-11-20 17:15:04', '2024-11-20 17:15:04'),
(52, 'App\\Models\\Usuario', 10, 'MiAplicacion', 'c141275060cd878b38f7a5c92df9902b509c0c8f0f34804dc75ec9dbbe11b920', '[\"*\"]', NULL, NULL, '2024-11-20 17:15:47', '2024-11-20 17:15:47'),
(53, 'App\\Models\\Usuario', 10, 'MiAplicacion', 'adf791a248f1cd42770781d4e26cd0974dd710db3f803a7b5118ce93e0728b21', '[\"*\"]', NULL, NULL, '2024-11-21 01:49:07', '2024-11-21 01:49:07'),
(54, 'App\\Models\\Usuario', 10, 'MiAplicacion', '02ec3e8c5fb673ab39d2f0b08c47cca11c38839ff3f8a31591b9199674fb4a17', '[\"*\"]', NULL, NULL, '2024-11-22 05:24:20', '2024-11-22 05:24:20'),
(55, 'App\\Models\\Usuario', 10, 'MiAplicacion', '571dbb9089d9337412303d177c5249ad982c06918e8e10fe1f84bf292ff7fba5', '[\"*\"]', NULL, NULL, '2024-11-22 05:24:39', '2024-11-22 05:24:39'),
(56, 'App\\Models\\Usuario', 10, 'MiAplicacion', 'ab34bbd044b472ea1fb6173583ea7fd32a7ca1a5e676c04f614b4c5eeb4f7644', '[\"*\"]', NULL, NULL, '2024-11-22 08:20:28', '2024-11-22 08:20:28'),
(57, 'App\\Models\\Usuario', 10, 'MiAplicacion', '0510f97b2f5b0beff4a9548d2335f4a502cc6b2d62b5d494fb51bf45da2f4cd1', '[\"*\"]', NULL, NULL, '2024-11-22 08:21:32', '2024-11-22 08:21:32'),
(58, 'App\\Models\\Usuario', 10, 'MiAplicacion', 'b4df92dd4622fc41fada3cc4facfa730e312446b1b2369aefbd4c5dd5095fbb6', '[\"*\"]', NULL, NULL, '2024-11-22 10:38:38', '2024-11-22 10:38:38'),
(59, 'App\\Models\\Usuario', 10, 'MiAplicacion', 'bb47de3722510a9552676cf864f755480ab66515298efd7cbf23e1f50e25c6cb', '[\"*\"]', NULL, NULL, '2024-11-23 20:17:03', '2024-11-23 20:17:03'),
(60, 'App\\Models\\Usuario', 10, 'MiAplicacion', '04e47bdc25b9f6d08837a06e5cc4aa0bd87a2b79b342337d7e16bc62291b8bb1', '[\"*\"]', NULL, NULL, '2024-11-23 21:10:29', '2024-11-23 21:10:29'),
(61, 'App\\Models\\Usuario', 10, 'MiAplicacion', 'ade746322a38259618d5f13f221750e40a09c903420d3585690999761badfde2', '[\"*\"]', NULL, NULL, '2024-11-23 23:44:43', '2024-11-23 23:44:43'),
(62, 'App\\Models\\Usuario', 13, 'MiAplicacion', '3ec30bb83f6e7e822ebc000f6da9c30adbc431390ba4191b0834637d8f479908', '[\"*\"]', NULL, NULL, '2024-11-24 00:02:54', '2024-11-24 00:02:54'),
(63, 'App\\Models\\Usuario', 14, 'MiAplicacion', 'fccd216f99bd1e658846c4f1ad0d397912eb1ea331730f3975717a48c0c574c3', '[\"*\"]', NULL, NULL, '2024-11-24 00:04:15', '2024-11-24 00:04:15'),
(64, 'App\\Models\\Usuario', 15, 'MiAplicacion', '5deb345e021ede3aa5886f331a837e83ac434546d667380e7f4b4d475f555c59', '[\"*\"]', NULL, NULL, '2024-11-24 00:08:12', '2024-11-24 00:08:12'),
(65, 'App\\Models\\Usuario', 15, 'MiAplicacion', '515e5796b6aba893fea652e30dc3caf9815b9ba490e2eada940424b57a3dbbac', '[\"*\"]', NULL, NULL, '2024-11-24 00:10:55', '2024-11-24 00:10:55'),
(66, 'App\\Models\\Usuario', 16, 'MiAplicacion', '44471b2fea5119c4e86dfcfa519cb386edb438afc1ee653667d634ea61aebca9', '[\"*\"]', NULL, NULL, '2024-11-24 00:34:07', '2024-11-24 00:34:07'),
(67, 'App\\Models\\Usuario', 16, 'MiAplicacion', '12e554309a16f9672e89396d188b20fdc1ad32f6beb7e825aa86974bc2d7c4b9', '[\"*\"]', NULL, NULL, '2024-11-24 00:34:25', '2024-11-24 00:34:25'),
(68, 'App\\Models\\Usuario', 10, 'MiAplicacion', '87943b77dea66b780c2befa77176101f6d85d0d1e4b9a2daf4d0245d5e68c65e', '[\"*\"]', NULL, NULL, '2024-11-24 00:35:36', '2024-11-24 00:35:36'),
(69, 'App\\Models\\Usuario', 17, 'MiAplicacion', 'e4c39b1bfc7a7f64ed20f4dc360ec3c6c5a63dc9f4ab6cccedaaad9ff684be6d', '[\"*\"]', NULL, NULL, '2024-11-24 01:05:28', '2024-11-24 01:05:28'),
(70, 'App\\Models\\Usuario', 17, 'MiAplicacion', 'f163da444728856f64ffb7b4be49403744f7575d4e8d5abd441271922188be55', '[\"*\"]', NULL, NULL, '2024-11-24 01:06:13', '2024-11-24 01:06:13'),
(71, 'App\\Models\\Usuario', 18, 'MiAplicacion', 'f657668a1d880fac0db87b73bf635554ad64920cb9e9801220ea9f5f6c9e521f', '[\"*\"]', NULL, NULL, '2024-11-24 01:09:06', '2024-11-24 01:09:06'),
(72, 'App\\Models\\Usuario', 10, 'MiAplicacion', '03b7f9fbb669f196f122f17f190f484e1879f1bb51f2a97f1ef9cd07ae14c4fb', '[\"*\"]', NULL, NULL, '2024-11-24 02:08:25', '2024-11-24 02:08:25'),
(73, 'App\\Models\\Usuario', 19, 'MiAplicacion', '56cb0e6d7433140a1ea32353309012f50d7e9065369a204b1c30966fc91aa20a', '[\"*\"]', NULL, NULL, '2024-11-24 02:43:46', '2024-11-24 02:43:46'),
(74, 'App\\Models\\Usuario', 20, 'MiAplicacion', '5ded425b4b32eb69c3d3fbe2accf9a3ee4336c059da2c4a936ac7ad303a7b7b2', '[\"*\"]', NULL, NULL, '2024-11-24 03:07:49', '2024-11-24 03:07:49'),
(75, 'App\\Models\\Usuario', 10, 'MiAplicacion', '6195be6f6cf41870035780a151519392989c1c65838c4e9b7b40e0e51df664a4', '[\"*\"]', NULL, NULL, '2024-11-24 03:17:41', '2024-11-24 03:17:41'),
(76, 'App\\Models\\Usuario', 21, 'MiAplicacion', 'c1d28100621b3b15b5fb55b82220f82e976187808c6429807ec3a38a12da8cd6', '[\"*\"]', NULL, NULL, '2024-11-24 03:35:47', '2024-11-24 03:35:47'),
(77, 'App\\Models\\Usuario', 22, 'MiAplicacion', 'fc4947e9d7a215b8f0784aae3f7b307256e1bd67db0f9a98044517d1b475861c', '[\"*\"]', NULL, NULL, '2024-11-24 03:42:15', '2024-11-24 03:42:15'),
(78, 'App\\Models\\Usuario', 23, 'MiAplicacion', 'c8144e4ecf91902c9aa1813d65c940349544650a27deef29f2fa72d7d3b6cef1', '[\"*\"]', NULL, NULL, '2024-11-24 03:44:08', '2024-11-24 03:44:08'),
(79, 'App\\Models\\Usuario', 24, 'MiAplicacion', 'bdbdd93cec0b791fd4574fb50f4dd56e19851ab1683a3b1e1834412ef61bf8f9', '[\"*\"]', NULL, NULL, '2024-11-24 04:00:26', '2024-11-24 04:00:26'),
(80, 'App\\Models\\Usuario', 10, 'MiAplicacion', '6f2a969529838bba8cc3d7162d676dde66cc9028e8fcb93dbb9e2030f33d0026', '[\"*\"]', NULL, NULL, '2024-11-24 04:02:48', '2024-11-24 04:02:48'),
(81, 'App\\Models\\Usuario', 25, 'MiAplicacion', 'a34ef4cb43751f4a36b6a6068d539768fbf8b1a0cf0512d4267794a7b9b660dd', '[\"*\"]', NULL, NULL, '2024-11-24 04:05:12', '2024-11-24 04:05:12'),
(82, 'App\\Models\\Usuario', 25, 'MiAplicacion', '75916338852aedef108d41b5ebf3c8fb566e9cb89beeba692885637e987a4491', '[\"*\"]', NULL, NULL, '2024-11-24 04:05:23', '2024-11-24 04:05:23'),
(83, 'App\\Models\\Usuario', 26, 'MiAplicacion', 'd6af78589fb88cc1664c1b3928d6f0eae7ceba3ae2aaddff51ce72e839850cb5', '[\"*\"]', NULL, NULL, '2024-11-24 04:06:14', '2024-11-24 04:06:14'),
(84, 'App\\Models\\Usuario', 26, 'MiAplicacion', '2fe8e579f745ec2bdfc5b2195918c63ee17c6e5c9cbb3a0ab3e2f7862ff2abc2', '[\"*\"]', NULL, NULL, '2024-11-24 04:06:23', '2024-11-24 04:06:23'),
(85, 'App\\Models\\Usuario', 27, 'MiAplicacion', '868cf8260c17a719fde152124465bc43aa84bb91cd6197485febf69064d003bb', '[\"*\"]', NULL, NULL, '2024-11-24 04:28:12', '2024-11-24 04:28:12'),
(86, 'App\\Models\\Usuario', 28, 'MiAplicacion', '32afb3f47ac795b16ebc8b9707f8ca1faf62acd18c87ee513ddedc52a37fa453', '[\"*\"]', NULL, NULL, '2024-11-24 04:31:30', '2024-11-24 04:31:30'),
(87, 'App\\Models\\Usuario', 29, 'MiAplicacion', '28d1b35ff9857bb9af6f0ff6571f369cb5fa832087b0415c1e49d1ff4b89f124', '[\"*\"]', NULL, NULL, '2024-11-24 04:38:17', '2024-11-24 04:38:17'),
(88, 'App\\Models\\Usuario', 10, 'MiAplicacion', '7b767e83588830d4c647c732d8ffc251c2207c94540ff5428560e0c18b12df00', '[\"*\"]', NULL, NULL, '2024-11-24 05:15:18', '2024-11-24 05:15:18'),
(89, 'App\\Models\\Usuario', 30, 'MiAplicacion', '8f928aff58d16ef5672d0003675a5a097aaa03da8dcbf700327b5618625ec160', '[\"*\"]', NULL, NULL, '2024-11-24 05:27:55', '2024-11-24 05:27:55'),
(90, 'App\\Models\\Usuario', 31, 'MiAplicacion', 'bfd97003f71aef378bcdee123330fa9e181640f67f2d2b6706e05422edd95430', '[\"*\"]', NULL, NULL, '2024-11-24 20:47:00', '2024-11-24 20:47:00'),
(91, 'App\\Models\\Usuario', 32, 'MiAplicacion', 'dd1fa886309d2eaea45c79fb16c54188a2f9ff641e8cee502ffbcea3eff9e7e2', '[\"*\"]', NULL, NULL, '2024-11-25 00:10:51', '2024-11-25 00:10:51'),
(92, 'App\\Models\\Usuario', 33, 'MiAplicacion', 'a0056f8f28a5dff6118512844198ffd6c0c0238b92637ca68422e6b67feb5409', '[\"*\"]', NULL, NULL, '2024-11-25 00:11:39', '2024-11-25 00:11:39'),
(93, 'App\\Models\\Usuario', 10, 'MiAplicacion', 'a5eabcec63b5fccbcd8ce32d86db14f2371be7c14df0670efb6a4ea0ccd61e3c', '[\"*\"]', NULL, NULL, '2024-11-25 03:44:08', '2024-11-25 03:44:08'),
(94, 'App\\Models\\Usuario', 34, 'MiAplicacion', 'b87bc1f6c2be6ba7e3cc1ea245f51209a33d9f535acfd454f6dda0753cc101e3', '[\"*\"]', NULL, NULL, '2024-11-25 03:55:13', '2024-11-25 03:55:13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `post`
--

CREATE TABLE `post` (
  `id_post` int NOT NULL,
  `id_producto` int NOT NULL,
  `id_usuario` int NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estado` smallint DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` int NOT NULL,
  `nombre` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_general_ci NOT NULL,
  `imagen` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `estado` smallint DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('0b2AWhMHIIwoKV7LuAVrP16tFu9iYDfDuyi8MZnN', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ1BHOW5uYWtSdVk0UlRlNGgwbnFiaURoYzhoVUYwaHBVZjF1Zk82TiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732409519),
('0JPCQ9DqSwfxibKzCqAFKvz1BRobbPGFerXI1svR', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibkt1YnNOQndmSXdQN09SRExvN2dKUzZ1ZXQ1T3hQVkY1d1NhdnlmZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732286552),
('0qVZtuhanBPTEF4zU7gTqUJ45FQ5aV8oKbpYVBNb', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid05LTnBTSzRkN1RtSmRrUXNCRXk5Nm9lUTd4dW5NZXphZFhjUkIySiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732377650),
('0uvaA4ZniewBpEfCW2QBJqLNfcXe5mUtDmnnKtnO', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY0JzN0ZHb0NWMHJ5WmdweDJNOUlvOTZmRDAzWXhtdGZVdEVjcXo0UCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732290026),
('0yuyB5VZFufb6waFUGSPXVkElb03EKz4Y5hT5fWu', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTm9JVldzQkQ5VVRjUk8wc3M3aTBrY0dHUTM1RnVBbEo1TXMzdnhscCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732288323),
('1jtl1CYIAvYnY6uDvZdkanusN3xGw0epqX8jC5Hn', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT3FLRWtMRGdYendtZ0J2T3VTQmNCZUM5SjdmWXMxTnJlUE1HNEZPVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732290281),
('25rZtcBz1vQPyPuBS6Hog9YTbBvXrXFLRyuEIEvT', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVUMwaVRpanljOUppYnNyNFRiYnlmTENZWlM2VzF1cmVVS21NMndONiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732288340),
('2hbDhcP67qdVALWnL6wDB8KOZoB6Ot0TZ9rbtq4f', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU0lpc2x3OGJKTE4xbGRmU1NCU3ZQaWV6Q2psRGFoODkzRk9QQkpzZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732470127),
('2kOzicQESQSk3Yz8Hj7hodpcGkvcgM4V2YtBolXq', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZnRwR0RuYmZpYU5RMTdTMERDbm02WEdsM3k2NXhVVXRWaUlIWkM4MyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732299757),
('2NDmQgO8lIsaez4vtBjqS99IRMkzOSC3pZA1YV3m', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR2pnaEp3MHk0UTdpVzlWNVpSSmlGNmN5Tk5SbnB1bFI0UWtYWWRUVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732289104),
('3HhpIa0BR8IyIcTlPN1QQ2cta3wRJ9CUlFOrWjTT', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieExUUmY5Z2p2TmJER0M5dVJFOFk2akszVHZ3aXFkaFZZNXoyQW90byI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732299751),
('4gRjmF4eRfnkUxEpovoEulvMAcu5SbqNHZjteZTq', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWUl6aXJxZUxzZmw4OFR6azhvSzJFOEExa3h2WGtpN3UxeFAwQldWcCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732402417),
('4XOQvRYtCqpN4tdcxrl9KgYtyhibyrb4rIAPFEbv', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMUZMcmdsQmc2TkxRWTFmWW5pTlN6YWZjYW5oZmlKTVBPTENoSGJWViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732290228),
('5gbGtqaPUVAJgzmCIymp9xTtRWNgUVO28nLlqDmI', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidzY4Z2ozRnlub3lRTWFNYmUyYm1GRDRDMXJTeUNjOURQdzZhRGs5eSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732290528),
('5p5N5olG81s1Zn0wczqGKPKRY4lJwZDSdOErywW7', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibzF4Sm9KSnpOTW5nWURBMkROZE5EbGROa0dlbnVrYkFDcXNLUXdTTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732289115),
('5RIVzdOYHMMtdpaNpDLeUx5DHLdb0HJbo1vE3D0S', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMHpNaEE3YzdFRldpcjd1NUsxRFRrVEpvdXNaSkRDUzlYandvWXJhUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732288327),
('5v6snggWepuwwFu5irdI06ckdqgDxojItINOWJkl', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQVBOZW01WFNZVnZ2bWJUQW40R2Q2d3E0Y1ludjdJSUR1bzAwQ2VlaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732299670),
('6VwvNWFgZoBu819OEznuPD6pIWSsCzTXgr9bVFYB', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic0cxMEswTXdYZWJLTDhwN0pkRTE4blhock43bXI5WWtZbzFPQXlHWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732290241),
('7aHVPB0ScnwnSCMhXhOTYHjNRtSrkrdHhSIQCVvB', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRWpPdVlDbEttMm9neUdmY2dubTR3aHkwY0xRZmVBVVhmcEoyWUdQMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732300515),
('7FakRcsGgc3r9MzQtfneYhH4FenvzOeELJvSAJeR', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaWwyYmhKV2hxVmNFb2tUM1ptRWtoNm1LUjBZeXlZbkpCSG9Jc3pkZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732288334),
('8drplZ6zdDO2XiKW4WqkNEozdmq6BTWiDeyDu3o9', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOERaVEVaWmZpR1FWcmFJNVZ4dHlweGI2YUhpMmVGeFM0V2dZVTNWUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732403169),
('96zrgwfqDDml7qqYF8xDQMgwpB8m4wKXhSqLDQWz', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUHR4TW96Tm4wNkVpeDRPUEpkQk8yaDdZWUFaYWR5OFhaYTN6OVZtdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732401239),
('9KDhq1qDQeo1oL4RZ742IWhLVFVnNgb1k83IvyM7', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYWJhaG9JZEJJbHRsZGhFcGV6MkREMW9Mb1hHQzNPVmpQeHNoQWN0VCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732291739),
('9UXiCUP7pBVLtvQiYDpx8dcy3J0HaVnkgfUmkb9t', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia1gxR2tJTHVIbmREcm5ScFBRMWZlVW56U1phRnhMc01iRlZTU0JxRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732290223),
('AEdhCAjLLXmygToES2zBomsYV8TdJ73XfIk6AF1q', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibXZRclVLSUJCQTdZNU5WWVhEazV5SDZTOVpwUUJtQnFyUWxiQjcwNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732403032),
('BEiL9k3QUGs8Pzjh4vGFSHNBRPYN5o3LH3I76vKg', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMlBnZ2FudjNzVVNBTHNtZUo5cWdWSklsUG12Q0x5VXVMSGFNWmJ2MCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732401331),
('BejfxnUDsVGpzzDngWDy9tP1yw3TN9n7pxVNd4m4', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNmQyd3BFc242d1dZbnZDMGRCNFRlQTNSVDUxR25oaVRCWGJRQjRGNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732290253),
('bGMPPJvf5DAqZmu1xNCadhJ3LdDFW5FWrkWA5j85', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQTBYWkduQlY0NXFKT3ZWeVZMcmk3dVFzeTJqNnhmalRSSWdiSG5rTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732289031),
('BOlHhHTnSnl92Lm00QbrN2i0u8uMliQJbByaEKQi', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTlhHZjFFbHFVYXhUSlMzVVFuZllxOGZJRzlQMW9NOVVIN1pxRzFkWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732290766),
('C25tlHGgMPKDl6LYDylfj9MNZsfW8iBp3llWRIiE', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNk5NR0JYS0ZtSmRNNDhMUEQ1bkdwM1dSVUFnY1hRN3M4eWs4RnpJMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732291535),
('CdqnM6Fh9WSenRQ39FTYPsWAn5Pim4ixY44OTm4h', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ2toV1pLYjdabXFkS0Z5OFZuN0FibFdXSUpUcDUzSlJuemo1V2hWRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732290846),
('cST9j0y4uVg7xAES2hhv0TXP6q55rIdmjRa4uxXJ', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia29UalZ0RHBXQWM2cEVRQWt4dTkxdXlWdmpiMHF2WXZBN09Sd2VYcCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732299728),
('D9l0QlMbEhsxbKhoKk7kcvMxMUMXe2Xn441Y9mwn', NULL, '127.0.0.1', 'PostmanRuntime/7.42.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQnB0cDloQ3dhalB3MmR0OGNFSDhHZm5uWEJ5RUJaS2hCUDF0OWsyeCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1732392012),
('DfIf8cgld874HawsyUTvj2BTNf9j5RBpueSyX9sl', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib0ExbmNGZEtMa21Obm9vTHlXbW5LMzE4VnM5VVF4WmNUT1dzeVVvdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732403340),
('DZkRhmHZezgnuwxtzVwig24DPGzfubdAn9v7oVmI', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWU1tTmRDTzAwVDNSRUZEVWxBdUdBakJQVU1QS1FNN1dHWFdPOGRCQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732291450),
('e4CfmWS2SsrScUuCvroyiSO2xb6I5Pe2dbhHqapL', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ3VHY09HMUxFNDBWY2pjZ2ZGQlJrbkhTNGt6TE5FdW93RzRwcnlTbiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732377513),
('e9ySn3PpAzmC3FSAsXcBXVnjhZGqleUET6dUVD5g', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQnYxQWw3QzZodGVjeTdhMGtWdWtrb1lHSzZHSzlNRDV4Y0QzcVowRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732479080),
('EaRM3LKH7B9IiBddiM6x5IuNN9EyHOBnWZqlgxGf', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOVA4bWJmTFdqeDlCVTZQZjZzb2V4S0E3Z21nc3JSRjVpc2pGMjlmWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732290101),
('eetjQ8MglHcJl1MVyrN61WoAgYa1DI1PScHDa0zi', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMUlpekZqMThUeGxvNmF0ekZDWE81N0g0QkVWYThRNVphUnB1SnlWaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732288205),
('EIUBznx7YOIeLf0xzilnzEn1zVf8cXnOcqAZQINu', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidWQ1UkFCSzYwdHY1ZWEybUZPYkJlT044Wkp2SEkzekFYN3RQdkZMdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732377464),
('enckGyzlUPQ15SpzJukt1zCold4hykvdmwaRraaG', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic2JKUWhmWG1zNXhhTXFwMEhjSENQUmpqZjM5VkdxN1FGc2RjQTg0OCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732288147),
('EwWdmF4TRj7gOUBRDGcJID6yknyAaCscuVvJtb8U', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiektoYnc5cVBYVThvWjdHc0VQOFpOVEpNbVVORDd5U2xRWUJ0NExCeSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732299752),
('ezKBgtNyYBwn8pUkrTeqrAziKkJcR08IfCtTyaQV', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiME1pTk0wRUV6V0Z1OFNJUVJIenpaU0N0bmhjaVBOcFdGb1VvcjE3ciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732299717),
('fFG17YbIVHhPZkMrZhsL3hLM4oahTfWi6tiUtOay', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSXB0U1BNVVhoN2xFVkJqV0d1ZTdZQTFJS015Y05TbnJlTmtsRm55SSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732299676),
('Fnjze50Zd1mmVOQP3PRnjInpM87dDWXZ0LIENsKt', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSENYUExVQlhwa1JpRGJRcGNwRW03QTJlZGp5eGhzbU1ReHM4M0FVRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732376593),
('FZNVswS15nZDnzsfXaPSSiziPZINSD6yMcMDfSRJ', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibEtxMUpKT2Frd0tJQ0l0TjM3WXV0a0tOVXlVSk5BUGx5MkZkNHhzRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732288347),
('Grds5DghgTFWZ3u1ujbuNaqhjSIGKJxfR5YiKnio', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVEhwM25MWnNOSlVabEplb1FSZG00bEpFVHZ4OVRGckoxdVdFdkFDRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732290245),
('GzhSOV5HKUcgUOrNgS9imxUCGV7XuHVFJjD9X2vc', NULL, '127.0.0.1', 'PostmanRuntime/7.42.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQnBaUlNTemhGZlRRVG4yak81M1ZLRjMxTXF5UUE2aDdhUnFlMXZHTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHA6Ly8wLjAuMC4wOjgwMDAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1732407728),
('hAr7o9s3BFlS9V0CDo4ZHzLJgS4rlld8Xq1ixbjt', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia3JrNXp2Z2R4NDExRm92blJmSFMzNzR2WDdHSHlrVGMxZ1pZRFJpdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732377022),
('HbkMUeQQGGh0GfKEOEOyySvDRqyZEfABr1ksy00U', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYWwyM0hmVkM5bWs4ZVNOTGMycGJ3eDJiVjFZaHJMcDBnMktoaVBBYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732300502),
('HgSePwwKeBtR5pfkamU9Mmr67SGdJFv5BfOfl93F', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMnFqc2t4STVXSFY2T1NLb2hzdVBtTDcycjdZekNsRm5naVBXd3N4aiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732299734),
('hMd63kjhiSZzaDyiFO8XjTv8ZnWdCGCZBygTMNXn', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUE1pT0l1NWRVMktFNkFOVzI5U3dkQUcxU3ViblJ3cnB6MDNnY2xQUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732290273),
('hs6XpocOXAri76XacCYRq0DxI5JBkbLUXN6FK7lQ', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU3FUWFdqWmo3dExaVUlsT3dkV2tHR2IzWnRRcHo5MzhsdWZVWGRmMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732299605),
('HTH6LuQqaE7h4UMuqbqno8vVmFUp4wzWtcCE933P', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidExTWm9Rb2tvZTgyN29PSHhZdXVhMDZyODlHMTBMVzhQdTBzR05FdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732290728),
('HZx73YXiwW2ueNTZZ0pCPZ7nVRNM4wrGuNPMPfm3', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMUZsT0Z3ZGxZU3pEUDVaOGpXNjhmN0t5UExwSFc1VTBiNGNUQkdtMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732288361),
('ibKkJbGqaDjfmngUEFDn2t29Husni5RtHpW11bZZ', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWEU1aHRVTG9relFSZ1FVYTJpb05OUjZOTGNlNDZzU3lQYUJUam9uaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732290198),
('Ise2WaTZJWpy6JEzFXFGAfaPvC2GwUFUVZiIiOsz', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieDlJa2VsVkVwZHZ3TnlvWEVBekVWeDNlSnNUTUZQZnpFclZkYURyciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732299645),
('IwYD3Mamca56Um2Re7YCfYpJoZNSCYszceTNx8l7', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiREZDVFFCaHpLV2NoclIweVdhY3F2RXk4dnVHNTMyUmF2emtQZVFibSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732291613),
('jmYdIKV2HuHFDj7DLA99JFXxbdwRJD3FPU4LLncK', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiemV6Z3dIb0ZSaTJaOGNoWWMxRTVLY3BNdzlKOGZNQlBLM0lHT3RwZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732299482),
('Kd9HrCGYH4lWyhtUmltwzYNWp2fhRcUcaJJUvcGt', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYXRhRHRmcGNoeG11MDhCQlJ3cGk4V0xBQmQwRTJiZ1gyWndTUm9lciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732300403),
('KFlWbbePIRkk9PQ5mv1Oeyei4RecCyXL95pv1JDr', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ2c5aEQyY3loYU5hWDIxazRlUUI4Z1hZazZ5OEJsckdmRGp0VzZYMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732290857),
('KKby6VRbrclhqtSHqe6QXsOSMYa5TwLzL6Jn0pGQ', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidVdBVGpFNHNwUnFDQU8wcTJTRWdvaFltZjVGTE84bzhBcGo5a25neiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732290712),
('ksNYI4VSArWcK73Ha7nkpYYF8BKN5aYsOP0fP10m', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicjlaaXZObThPYWJhelFzRkkwUDlzZE5xVHRTYkFEVmppeWhCMHY2TCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732288782),
('LiwVjEWtatFjq4j0FMlgmxh6w5tgaW0ZNHGmmQFh', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibDJpM1U0RHdpdGlHVVZjcEJNbVVEZWo2OXhNSTlBOVhSUDFUUmIwMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732299745),
('ljeGgZ41c9pCogwWnYqBeMRedhOYZM3sNXdv3HW7', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibzh3YjlEN1ZIazhzbmQyR1FqOWhhRUYwVVVpNlQya0ZnYUZuRGN0NSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732299511),
('LO2bj8844KJaGwYdwww2Q4IlddNoZJwS9aGgKP4x', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNlhQWXhiMGFTazhadHBsVFpCazc2dmNrMW9ENzdHWkU2czhPM1dYTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732288353),
('LtC4KUg9B5uBTaa6eXOWC9d9E5jSl7x1Sm2V9SKb', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRUxSVHA4YnFoZlZZSWl6dmxvOHJEU3lvTHdwZ3RtTThoRk5Xb2liZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732299723),
('mJWvuPGMHs4NktGasUip0RsFfdZpiAiUT3ejh1I4', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoialQyNHRBaHVWRDBNVmtyRUM4NFFBUmYyWlVkQldsOEJGTExxb3VhTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732290237),
('MoIIv1RXLh87CkURy1epgHOxpwY57CweaEVI9HhC', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTTU2MDZ3emZjaTZDNWI4NFdPU1g5eG4yTlFUeWZabzZiZHBPenRtaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732290849),
('NDcnPODZZKH9XXwts0LzFC9wOWRQOIgzFD1KwURX', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidnFnM1E0eFNJTXhKaEVWYXJ3d2hSeXBnVWpidmY3clRQNDNjaUdrTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732377521),
('NDlmuQtqmxeFRmd1kc1IitY3wGrI8VaJOpvJJ8KK', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSVlZWFI4RUN2dUM5RGlXMEJDbVpWV3hVVjdNNEN0aWxxZ2d0bXV5NiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732290172),
('NKJVSpLtYT7ctG4JSaJQi32T1IARCdqyTrMy8I0r', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWDZ1YURib1BGdEtNU1ZmQWQ4U0VZN2JRUzVTbzg1dUhCZTN3Q2pCbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732291429),
('NwolprlW3AZcu5MIJZEYgwBR11rQgzqmCRmFh97G', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMzhQUEN2UlF3S2RXTEg4NzVKR0pFZlNCYWJXbnp4MEpRVzNvU1RFYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732288368),
('OqYewlx44pvX3I4PrexstEMG9WdG76mu4z2DlSKS', NULL, '127.0.0.1', 'PostmanRuntime/7.42.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZGJ5QzFGODl2bVhIRlpUTTZBaDNiNzk4NEtTdFd2MXZiUHd1UGtLWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1732407839),
('OT3o3iW7sy1yiFUiqAV8tdKnFVMCvfgIyzRwWnYH', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNGltM0JneGtiaGJsRG51SzF4ZkJ5dkxPbDZuSVBMNzZPTWNDb3dHNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732299495),
('OTd9R7IHaELSjgLgZDOx7t9AqfYzg53Z9NuIHApH', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieng4SVFyMloxQU53VWJ5YWptOExMcUdMTFNlNVY3NDRzb3RMcTBjaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732290208),
('pPbDnj1A8iLCAOikePUW2HlFCgBkxDV24hervS8L', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZFBad0dBS3k0T2xGY0xjOE1ENUNFYUswMklLQkdjVUZKZnZsWmZhRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732288705),
('pYoMmysHhdR2KpYMAvjXrmlWznlqgRfvluUvvCMm', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiam0xSFhraEcxTERmblk2MTZ2Y2I2TUUyOHJqbkxqZjExZ0dQWTBncyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732288241),
('QAFypSj6Le8X0llGBSPrFd0GLPPzeHmYifdH90DY', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieWUwYzBESTY2NGdSRGc0eVZwS2J6WnNST2pkUVhKYlJ2aW9pUm5aTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732402087),
('qBFsfEsERx1aArfPc4uxqXxB4pzps35eH2scE67n', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQVVlc0wyRTJucmp3Y2V0QXVGRG5YaFdzWk5pOGRNcFNkUzNUWWhPUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732291755),
('QbMfQfAPJBHHNixHTS8a16ZSQ59neztho7odBOGm', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQWdvQmpNb0JpSkVXN3h0MDhYTjB2Q3ZKbFVHWXp3czV3MkxNS3k1biI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732288218),
('qcIqnRggxNbrd4fLqkvHvSH6Mf6SX506qeIpdjzu', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRngwVUs4M3VITHJHM25lS0UwSHFhTE85T2U5WkhDdTk4d2w2NXduZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732291339),
('QUBIqEDvfv33YldhsOEoXaZMJjAGorimK0ieiJpP', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNHoyOHpkdE96Sm13a21sY2x3ZG9samg0Q2ZadkdMWGwyd0JiTjBJbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732289999),
('Rczv6e8KSCu9jco2TWj4H7TGFoNvGiMusAuwcDPu', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOXlvQ3NLaFhvQ0JQU2pQYU0ya04xRU11aDhuREZ5dHNoSGsySHVVSSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732401396),
('RYsly8D5CCJ1wAn7Fykuvk930eeCKq6SicxLCgmN', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicUh2dHRLbGNBMGlzeEROeGFrUVQ4bDBRcDAyNjdLRW1pZjMyazNJNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732405026),
('sdmHPWaTcChhSHkdQ4BkJpzf7OWf9r3txeTmE9SS', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia1BiVUR5VWVRTlhtMmZnSHdLWURaOUhwaXMxWDczSGs3UW5zQm1tbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732406661),
('tlgiu28db0mPnWe6t9czXaGO6xSGwb7M0Lx6Op2n', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS1A2RXhPRWtOMnBqTEZFTmpJTFc2aDhrN21mOGhtSVh3WEd1SzdoRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732402096),
('TofwZTk3SZ7tQfSVGMGaNNoy6PMSkhP5dD1kIHoG', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNVIzQTE4TVJWSHRHVVpYdmVONGVBbWJiejU4b0k5aENkRm9NenZGbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732377693),
('TXdV9MaATX5Bf8RMEFyk8rNuzD2BqRnACCnUZ0m6', NULL, '127.0.0.1', 'PostmanRuntime/7.42.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVGpnbWE2TzNIeGh1ZUxhaTlLM0RqdVdVelBBckpNdHJ3VjhDZVVXQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1732406366),
('tXVajcFt2AZN03oOB5UpypON6bl3BvBlSSLjEQEo', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWVd4ZzFZQVQ0M2tnTFJpYldZY0pKQ09QZTZGVmlZWnlORXVJS0VEdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732290216),
('UgTdmKF8FynamI03YRIwayD20O5Fr8iwSy0B4Db5', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibXdFZXlZMHZTUk5FMTlRNmhqaGtDUFk3QTJ1ajJIUmN1SzlxVWdYSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732403002),
('v3VwHPTTSX9duXn4m60ziJ5kqpEqffZPbsmxGXZE', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZlE5bzlrTWp0bDNBcTZSdzFWUGVIY3BWdUtGU2wzU3lMdzVqSHBoZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732377637),
('WCfjSHBlCEZvDqj4jcJbsHdttgncsz4dCrCKKheL', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVGIxM2dIRkxiUmFmd2tPOWlxYk82aXJxTjczWm1XVW5rVnY5SE14TCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732299640),
('WGZmvH6lpURZLFuxz7VNfJGEWF3NjBbEiTM0edrv', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMHhaSHh4U2k1dWRKcWV1RlRXYU44MjRPeWhTMjQ4MXJBaEVIQTM2aSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732290853),
('WTRP6bWkVwyWfEn7wuO3u0yxRvY09jYmFr83QkCK', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia3AySTNwZWI0Zk1MNEp5VnhVcDU3b1d5THB3RmM3c2xLeGZmVXBHViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732290161),
('Xt0LO5Ws0mXOuGiUpIsViKwt5niBznNBOicDcjz4', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU0lxRVpxNG0yd2RiaEZYZWh4aTVYRTRzb1JOVFhwMm9OY29OVUo4NiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732290268),
('Y400cuEAJEAKogvQNU8I9qe2uekMO5usUdJcOQFh', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTjRHS2dYQjZhQXJrUkN3UWU5WDU1RlRQa1k3ZWFEY3ZXTnhtY0U5RiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732290263),
('YpVHKH1Gi3D1EFDilJEzqAuW6UsNs6Hg0thjOTow', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibEw1M0NxcUJGZnA1MVEybkxpNjRMbElGajByZ2ZXcG85YXhYU2NSRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732288308),
('yrjWMzPlIfpS0vVMqWuDCJy1l6k60jp8SFluM07p', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUjhYc3JTZ1hxV1REWUQyZURWTjZpbm43elF3RGFGdTdCYnNkdGlIdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732288314),
('yVXFIsR456EYtRF0bVbNAENdrhXkQItDdaW9oJCo', NULL, '192.168.43.1', 'okhttp/5.0.0-alpha.14', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTjRweWxHYnNqYllIbXZHQkNJbzJlOU9FSnVUVmV3Y2c4dnJJU21rUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjQzLjIzNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732290003);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL,
  `id_persona` int NOT NULL,
  `usuario` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `correo` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `numero_celular` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `token` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `contrasena` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `estado` smallint DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `id_persona`, `usuario`, `correo`, `numero_celular`, `token`, `contrasena`, `estado`, `created_at`, `updated_at`) VALUES
(34, 1, 'fernando arroyo', 'nomiku.pass@gmail.com', NULL, 'ftwfV9U9Qk6Vjr_wrJ-94o:APA91bHNFi78Jckvn4pZfQ10d6tdevsLmDuiIc5TgZSoO95ilSUPl3tv6vH_TKQB4VSnY4D5oFOMIXN8SmWNmEndz79GFGoA_Gtvm1qcGnlVQd1uUYCJ-4Y', '$2y$12$ofRDEruCBNdBlMKC0Max/OsucwWIXKSG6pSHMLhryiYkvXqvbsGxa', 1, '2024-11-25 03:55:13', '2024-11-25 03:55:13');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `mensaje`
--
ALTER TABLE `mensaje`
  ADD PRIMARY KEY (`id_mensaje`),
  ADD KEY `remitente` (`remitente`),
  ADD KEY `destinatario` (`destinatario`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `notificacion`
--
ALTER TABLE `notificacion`
  ADD PRIMARY KEY (`id_notificacion`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_post` (`id_post`),
  ADD KEY `id_post_2` (`id_post`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`id_persona`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id_post`),
  ADD KEY `id_producto` (`id_producto`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `idx_producto_estado` (`estado`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `usuario` (`usuario`),
  ADD UNIQUE KEY `correo` (`correo`),
  ADD KEY `id_persona` (`id_persona`),
  ADD KEY `idx_usuario_correo` (`correo`),
  ADD KEY `idx_usuario_estado` (`estado`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `mensaje`
--
ALTER TABLE `mensaje`
  MODIFY `id_mensaje` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `notificacion`
--
ALTER TABLE `notificacion`
  MODIFY `id_notificacion` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `id_persona` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT de la tabla `post`
--
ALTER TABLE `post`
  MODIFY `id_post` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `mensaje`
--
ALTER TABLE `mensaje`
  ADD CONSTRAINT `mensaje_ibfk_1` FOREIGN KEY (`remitente`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE,
  ADD CONSTRAINT `mensaje_ibfk_2` FOREIGN KEY (`destinatario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE;

--
-- Filtros para la tabla `notificacion`
--
ALTER TABLE `notificacion`
  ADD CONSTRAINT `notificacion_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE;

--
-- Filtros para la tabla `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `post_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`) ON DELETE CASCADE,
  ADD CONSTRAINT `post_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
