-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 21, 2023 at 03:59 PM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mylibrary`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add book feedback', 7, 'add_bookfeedback'),
(26, 'Can change book feedback', 7, 'change_bookfeedback'),
(27, 'Can delete book feedback', 7, 'delete_bookfeedback'),
(28, 'Can view book feedback', 7, 'view_bookfeedback'),
(29, 'Can add books', 8, 'add_books'),
(30, 'Can change books', 8, 'change_books'),
(31, 'Can delete books', 8, 'delete_books'),
(32, 'Can view books', 8, 'view_books'),
(33, 'Can add book likes', 9, 'add_booklikes'),
(34, 'Can change book likes', 9, 'change_booklikes'),
(35, 'Can delete book likes', 9, 'delete_booklikes'),
(36, 'Can view book likes', 9, 'view_booklikes'),
(37, 'Can add user', 10, 'add_user'),
(38, 'Can change user', 10, 'change_user'),
(39, 'Can delete user', 10, 'delete_user'),
(40, 'Can view user', 10, 'view_user'),
(41, 'Can add user_ reviews', 11, 'add_user_reviews'),
(42, 'Can change user_ reviews', 11, 'change_user_reviews'),
(43, 'Can delete user_ reviews', 11, 'delete_user_reviews'),
(44, 'Can view user_ reviews', 11, 'view_user_reviews');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_email_1c89df09_uniq` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$390000$zDzSWZLDiZ7SMJhDdtnZRF$B8XcFb3spGNgMDyLAze2wy40OaLMaKAPlyClQ8Qr1mE=', '2023-04-21 11:58:36.689129', 1, 'admin', 'admin', 'admin', 'admin@gmail.com', 0, 1, '2023-04-12 11:39:54.285487'),
(2, 'pbkdf2_sha256$390000$3aL38KNTo8OhGUgTPbWnBV$tyM6D5PWVZCfU9ugdvCi3ezKdCg/pgS0llHRPKPq72I=', '2023-04-21 14:54:08.351435', 0, 'kabir', 'kabir', 'behal', 'kabir.behal7830@gmail.com', 0, 1, '2023-04-12 12:16:59.387672');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bookfeedback`
--

DROP TABLE IF EXISTS `bookfeedback`;
CREATE TABLE IF NOT EXISTS `bookfeedback` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `feedback` longtext NOT NULL,
  `feedback_date` date DEFAULT NULL,
  `is_opened` tinyint(1) NOT NULL,
  `book_id_id` bigint(20) NOT NULL,
  `user_id_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `BookFeedback_book_id_id_7e8b1d4f` (`book_id_id`),
  KEY `BookFeedback_user_id_id_77d7e37e` (`user_id_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bookfeedback`
--

INSERT INTO `bookfeedback` (`id`, `feedback`, `feedback_date`, `is_opened`, `book_id_id`, `user_id_id`) VALUES
(1, 'very nyc book', NULL, 1, 13, 2),
(2, 'amazing book', NULL, 1, 10, 2),
(3, 'very nyc book', NULL, 1, 8, 2),
(4, 'fsghfsgfa', NULL, 0, 8, 1),
(5, 'eggdfg', NULL, 1, 4, 1),
(6, 'Very Nice book', NULL, 0, 4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `bookpublisher_booklikes`
--

DROP TABLE IF EXISTS `bookpublisher_booklikes`;
CREATE TABLE IF NOT EXISTS `bookpublisher_booklikes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `book_id_id` bigint(20) NOT NULL,
  `user_id_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `BookPublisher_booklikes_book_id_id_778cd10e` (`book_id_id`),
  KEY `BookPublisher_booklikes_user_id_id_14bc4f45` (`user_id_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bookpublisher_booklikes`
--

INSERT INTO `bookpublisher_booklikes` (`id`, `book_id_id`, `user_id_id`) VALUES
(1, 10, 2),
(2, 13, 2),
(3, 12, 2),
(9, 3, 2),
(5, 8, 2),
(6, 15, 2),
(8, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `bookpublisher_books`
--

DROP TABLE IF EXISTS `bookpublisher_books`;
CREATE TABLE IF NOT EXISTS `bookpublisher_books` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(75) NOT NULL,
  `bookTitle` varchar(500) NOT NULL,
  `authorName` varchar(75) NOT NULL,
  `bookThumbnail` varchar(100) NOT NULL,
  `gener` varchar(30) NOT NULL,
  `description` longtext NOT NULL,
  `bookpdf` varchar(100) NOT NULL,
  `releaseDate` varchar(20) NOT NULL,
  `publisher_id_id` int(11) NOT NULL,
  `published` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `BookPublisher_books_publisher_id_id_fa8bd0e6` (`publisher_id_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bookpublisher_books`
--

INSERT INTO `bookpublisher_books` (`id`, `name`, `bookTitle`, `authorName`, `bookThumbnail`, `gener`, `description`, `bookpdf`, `releaseDate`, `publisher_id_id`, `published`) VALUES
(3, 'harry potter', 'sin eater', 'kabir', 'bookthumbnails/sin_eater.jpg', 'fiction', 'written by js', 'book-pdfs/62c60132c58ed-after-dark.pdf', '2023-04-06', 1, 1),
(4, 'tarun', 'Harper Lee', 'Lee', 'bookthumbnails/harper_lee.webp', 'fiction', 'description', 'book-pdfs/62c60132c58ed-after-dark_n3HGf6g.pdf', '2023-04-06', 1, 1),
(6, 'Amrit', 'Give and Take', 'Rajshri', 'bookthumbnails/give_and_take.jpg', 'Love', 'Look me in the eye! The ability to make high-level eye contact is a skill every man should work on, as it has been shown to create some incredible benefits for the gazer. Numerous studies have shown that people who make higher-levels of eye contact with others are perceived as being: More dominant and powerful. More warm and personable.', 'book-pdfs/Give_and_Take__WHY_HELPING_OTHERS_DRIVES_OUR_SUCCESS__PDFDrive_.pdf', '2023-04-09', 1, 1),
(7, 'admin', 'Advances In Quantitative Analysis Of Finance And Accounting', 'Chang-few-lee', 'bookthumbnails/finance_and_accounting_nAVApBF.jpg', 'Accounts', 'Introduction Emerging markets have been exposed to remarkable market risks and it is by now folk wisdom that, if given a choice, they should be endowed with instruments of hedging against downside risks (see Caballero, 2003; Caballero and Panageas, 2003; Shiller, 2003).\r\n\r\nFinding out which factors are the fundamental source of volatility for each country — for example, the prices of oil for Mexico, of coffee for Brazil, of semiconductors for Korea, of copper for Chile, and so on — is recognized as a crucial step in order to construct the appropriate hedging instruments, which will be contingent on observable variables (Caballero, 2003). Yet, it remains to be answered the question concerning the proper application of derivative securities that can be used to construct hedging strategies and the optimal hedging policy.\r\n\r\nThe purpose of this chapter is to examine the hedging decisions of an economy which is exposed to market risks and is subject to collateral constraints. The model considered here is a sovereign debt one, with default risk and endogenous collateral.', 'book-pdfs/6354720070e3c-advances-in-quantitative-analysis-of-finance-and-accounting-adva_p0tRYeL.pdf', '2023-04-12', 1, 1),
(8, 'admin', 'International Insurance', 'III', 'bookthumbnails/international_issurance.jpg', 'Insurance', 'World Overview WORLD LIFE AND NONLIFE INSURANCE IN 2013 Outside the United States, the insurance industry is divided into life and nonlife, or general insurance, rather than life/health and property/casualty. World insurance premiums rose 1.4 percent in 2013, adjusted for inflation, following a 2.5 percent inflation-adjusted increase in 2012, according to Swiss Re’s latest study of world insurance. Nonlife premiums rose 2.3 percent in 2013, adjusted for inflation, following 2.7 percent growth in 2012. Life insurance premiums grew by 0.7 percent after inflation in 2013, down from 2.3 percent inflation-adjusted growth in 2012.', 'book-pdfs/635c5a4ccfe9a-international-insurance.pdf', '2023-04-12', 1, 1),
(9, 'admin', 'The Spanish Love Deception', 'elena arams', 'bookthumbnails/love_descption.jpg', 'Adventure', '“The Spanish Love Deception” is a modern masterpiece, a powerful novel that can be read on its own. This novel is written by Elena Armas. She is a true storyteller, and The Spanish Love Deception is her best book. It’s an epic tale of family, secrets, loss, marriage, betrayal, friendships, laughter, and regrets. The Spanish Love Deception is a heartfelt novel written with compassion and hope, reconciling the past to pave a road to happiness and second chances. The characters in this novel bring life and heart to this story, each with a distinct voice and personality.', 'book-pdfs/62e235c8e53c4-the-spanish-love-deception.pdf', '2023-04-12', 1, 1),
(10, 'admin', 'New Moon', 'Stephenie Meyer', 'bookthumbnails/new_moon.jpg', 'Fiction and Literature', 'New Moon by Stephenie Meyer Pdf book free online. Edward Cullen is the one thing that Bella Swan values more than life itself. However, Bella had no idea how hazardous it would be to fall in love with a vampire. Although Edward has already saved Bella from the grasp of one evil vampire, they now understand that their problems might just be just beginning as their daring relationship threatens everything they hold dear.\r\n\r\nNumerous readers who were mesmerized by the New York Times best-selling novel Twilight are eager to learn more about Bella and Edward’s star-crossed romance. Stephenie Meyer offers readers another enthralling blend of romance and suspense with a supernatural twist in New Moon. This vampire love story is fervent, gripping, and full of unexpected turns that will propel it into literary posterity.', 'book-pdfs/63975905ae5d3-new-moon.pdf', '2023-04-12', 1, 1),
(11, 'admin', 'Man\'s Search For Meaning', 'Victor E frankl', 'bookthumbnails/mans_serach_for_3z3mSPF.jpg', 'Thriller', 'THIS BOOK HAS NOW LIVED TO SEE nearly one hundred printings in English—in addition to having been published in twenty-one other languages. And the English editions alone have sold more than three million copies.', 'book-pdfs/632ecf70b27a5-man-s-search-for-meaning_9Jzg1t8.pdf', '2023-04-12', 1, 1),
(12, 'admin', 'After Dark', 'Welkie Collins', 'bookthumbnails/after.jpg', 'Mystery', 'A series of tales supposed to be told to a portrait-painter by his sitters; the framework tells us how he came to think of publishing the stories thus collected; the introductions describe the circumstances under which the tales were told. These portions have a delicate every-day interest. The tales are stories of adventure, well varied, and often striking in the incidents, or with thrilling situations; and are as pleasant reading as a novel reader could desire.', 'book-pdfs/62c60132c58ed-after-dark_1.pdf', '2023-04-12', 1, 1),
(13, 'admin', 'Power Of Subconsious Mind', 'Joseph Murphy', 'bookthumbnails/power_of_mind.jpg', 'Thriller', 'Power of subconscious mind How This Book Can Work Miracles in Your Life I have seen miracles happen to men and women in all walks of life all over the world. Miracles will happen to you, too— when you begin using the magic power of your subconscious mind. This book is designed to teach you that your habitual thinking and imagery mold, fashion, and create your destiny; for as a man thinketh in his sub-conscious mind, so is he.', 'book-pdfs/636cacc271da1-power-of-subconsious-mind.pdf', '2023-04-12', 1, 1),
(14, 'admin', 'Twisted Lies', 'Ana Huang', 'bookthumbnails/lies.jpg', 'thriller', 'Stella!” My heart rate sped up. Nothing triggered my fight or flight like the sound of Meredith’s voice. “Yes?” I hid my trepidation behind a neutral expression. “I trust you can bring all the items back to the office yourself.” She slipped on her coat and tossed her handbag over her shoulder. “I have a dinner reservation I simply can’t miss.” “Of—\" She disappeared out the door. “Course I can,” I finished. The photographer shot me a sympathetic look, which I answered with a tired shrug.', 'book-pdfs/63b03a1ac20a2-twisted-lies.pdf', '2023-04-12', 1, 1),
(15, 'kabir behal', 'The Great Controversy', 'Ellen G. White', 'bookthumbnails/637a1eb663f918.17931472.jpg', 'Fiction', 'This book, reader, is not published to tell us that there is sin and woe and misery in this world. We know it all too well. This book is not published to tell us that there is an irreconcilable controversy between darkness and light, sin and righteousness, wrong and right, death and life. In our heart of hearts we know it, and know that we are participators, actors, in the conflict.', 'book-pdfs/637a1eb663f92-the-great-controversy.pdf', '2023-04-12', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'permission'),
(3, 'auth', 'group'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'BookPublisher', 'bookfeedback'),
(8, 'BookPublisher', 'books'),
(9, 'BookPublisher', 'booklikes'),
(10, 'user', 'user'),
(11, 'user', 'user_reviews');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-04-12 11:34:28.423736'),
(2, 'contenttypes', '0002_remove_content_type_name', '2023-04-12 11:34:28.439348'),
(3, 'auth', '0001_initial', '2023-04-12 11:34:28.548721'),
(4, 'auth', '0002_alter_permission_name_max_length', '2023-04-12 11:34:28.564409'),
(5, 'auth', '0003_alter_user_email_max_length', '2023-04-12 11:34:28.564409'),
(6, 'auth', '0004_alter_user_username_opts', '2023-04-12 11:34:28.564409'),
(7, 'auth', '0005_alter_user_last_login_null', '2023-04-12 11:34:28.580027'),
(8, 'auth', '0006_require_contenttypes_0002', '2023-04-12 11:34:28.580027'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2023-04-12 11:34:28.595581'),
(10, 'auth', '0008_alter_user_username_max_length', '2023-04-12 11:34:28.595581'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2023-04-12 11:34:28.611205'),
(12, 'auth', '0010_alter_group_name_max_length', '2023-04-12 11:34:28.611205'),
(13, 'auth', '0011_update_proxy_permissions', '2023-04-12 11:34:28.626903'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2023-04-12 11:34:28.626903'),
(15, 'auth', '0013_alter_user_email_alter_user_username', '2023-04-12 11:34:28.689393'),
(16, 'user', '0001_initial', '2023-04-12 11:34:28.720637'),
(17, 'BookPublisher', '0001_initial', '2023-04-12 11:34:28.736276'),
(18, 'BookPublisher', '0002_initial', '2023-04-12 11:34:28.783132'),
(19, 'admin', '0001_initial', '2023-04-12 11:34:28.829943'),
(20, 'admin', '0002_logentry_remove_auto_add', '2023-04-12 11:34:28.829943'),
(21, 'admin', '0003_logentry_add_action_flag_choices', '2023-04-12 11:34:28.829943'),
(22, 'sessions', '0001_initial', '2023-04-12 11:34:28.845632'),
(23, 'user', '0002_user_country_user_phone_number_user_profile', '2023-04-12 11:39:14.753235'),
(24, 'BookPublisher', '0003_alter_books_booktitle', '2023-04-12 11:45:00.661352'),
(25, 'BookPublisher', '0004_alter_books_publisher_id', '2023-04-12 11:53:09.835518');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('k9y1wdcnevbwtpiifwsem6rm2epth0z1', '.eJxVjEEOwiAQRe_C2pB2LGVw6b5nIDMwSNVAUtqV8e7apAvd_vfefylP25r91mTxc1QXBer0uzGFh5QdxDuVW9WhlnWZWe-KPmjTU43yvB7u30Gmlr-1HRgAerLOBDICA9rANlnglAhSLwIJDHfBjIwBkQXROXLd6OicLKr3B-qHOB8:1poJnk:9z7_FFKI8Rn3xXsJQ5ysY-HFokCAV_XteOYbdQS1v_8', '2023-05-01 08:01:28.674537'),
('9xdjvr7zra0hoh2rf92y2b17quyqt5dg', '.eJxVjEEOwiAQRe_C2hAKlDIu3XsGMsxMpWpoUtqV8e7apAvd_vfef6mE21rS1mRJE6uz6tTpd8tID6k74DvW26xprusyZb0r-qBNX2eW5-Vw_w4KtvKtM0aW0YccxYwR0RNl5wCCE2d6RzF7BxYNDxaJgkWAIXIXLAFgb4J6fwADOzgJ:1poPhQ:0ht2GoNHh7ei3RlRp8lqpvglQOQ7iLG9vmBhKQmVwgE', '2023-05-01 14:19:20.866732'),
('vleqa31fprh508zoerktt73i7csl9u6w', '.eJxVjEEOwiAQRe_C2pB2LGVw6b5nIDMwSNVAUtqV8e7apAvd_vfefylP25r91mTxc1QXBer0uzGFh5QdxDuVW9WhlnWZWe-KPmjTU43yvB7u30Gmlr-1HRgAerLOBDICA9rANlnglAhSLwIJDHfBjIwBkQXROXLd6OicLKr3B-qHOB8:1pofgM:u7M6u8HwkZF1MpOyH0xVezXCT0bESna4j8YXLOGmku4', '2023-05-02 07:23:18.984204'),
('y2e5yzu4sn8naa37b4ee3idf3ajvz2g6', '.eJxVjEEOwiAQRe_C2pB2LGVw6b5nIDMwSNVAUtqV8e7apAvd_vfefylP25r91mTxc1QXBer0uzGFh5QdxDuVW9WhlnWZWe-KPmjTU43yvB7u30Gmlr-1HRgAerLOBDICA9rANlnglAhSLwIJDHfBjIwBkQXROXLd6OicLKr3B-qHOB8:1ppQgN:qYNOiBF9yrIpgCB7I5ZVNwwM3CtKRghT3ECqZTwBvko', '2023-05-04 09:34:27.140798'),
('qq6pa3wl6abpwn1dhmde4i36zug6w7u6', '.eJxVjEEOwiAQRe_C2pB2LGVw6b5nIDMwSNVAUtqV8e7apAvd_vfefylP25r91mTxc1QXBer0uzGFh5QdxDuVW9WhlnWZWe-KPmjTU43yvB7u30Gmlr-1HRgAerLOBDICA9rANlnglAhSLwIJDHfBjIwBkQXROXLd6OicLKr3B-qHOB8:1pps9I:K3qKh9U8WrE_Z877ytTDXnU0RgzcHaD0decn5RzQivA', '2023-05-05 14:54:08.351435');

-- --------------------------------------------------------

--
-- Table structure for table `user_reviews`
--

DROP TABLE IF EXISTS `user_reviews`;
CREATE TABLE IF NOT EXISTS `user_reviews` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `review` longtext NOT NULL,
  `user_id_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `User_Reviews_user_id_id_014666ed` (`user_id_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_user`
--

DROP TABLE IF EXISTS `user_user`;
CREATE TABLE IF NOT EXISTS `user_user` (
  `user_ptr_id` int(11) NOT NULL,
  `security_question1` varchar(150) NOT NULL,
  `security_question1_value` varchar(50) NOT NULL,
  `security_question2` varchar(150) NOT NULL,
  `security_question2_value` varchar(50) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `country` varchar(100) DEFAULT NULL,
  `phone_number` varchar(12) DEFAULT NULL,
  `profile` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_ptr_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_user`
--

INSERT INTO `user_user` (`user_ptr_id`, `security_question1`, `security_question1_value`, `security_question2`, `security_question2_value`, `is_admin`, `country`, `phone_number`, `profile`) VALUES
(1, 'what is the name of your first pet', 'dingo', 'what is the name of your first school', 'kcips', 1, 'null', 'null', 'null'),
(2, 'what is the name of your first pet', 'dingo', 'what is the name of your first school', 'kcips', 0, 'India', '7355017830', 'null');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
