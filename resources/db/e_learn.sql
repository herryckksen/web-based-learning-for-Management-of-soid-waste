-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 09, 2021 at 11:23 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e_learn`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbladmin`
--

CREATE TABLE `tbladmin` (
  `AdminID` int(11) NOT NULL,
  `AdminEmail` varchar(200) NOT NULL,
  `AdminPassword` varchar(200) NOT NULL,
  `AdminName` varchar(200) NOT NULL,
  `AdminImage` varchar(200) NOT NULL,
  `AdminContactNo` varchar(20) NOT NULL,
  `AdminLevel` tinyint(4) NOT NULL DEFAULT 1,
  `AddedByAdminID` int(11) NOT NULL,
  `AdminStatus` tinyint(4) NOT NULL DEFAULT 0,
  `CreatedDateTime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbladmin`
--

INSERT INTO `tbladmin` (`AdminID`, `AdminEmail`, `AdminPassword`, `AdminName`, `AdminImage`, `AdminContactNo`, `AdminLevel`, `AddedByAdminID`, `AdminStatus`, `CreatedDateTime`) VALUES
(1, 'admin@gmail.com', '12345678', 'CSC Department', '', '0811234567', 1, 1, 0, '2018-01-27 09:38:33');

-- --------------------------------------------------------

--
-- Table structure for table `tbladminnotification`
--

CREATE TABLE `tbladminnotification` (
  `AdminNotificationID` int(11) NOT NULL,
  `AdminNotificationContent` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `AdminNotificationRedirect` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `SenderUserID` int(11) NOT NULL,
  `IsRead` tinyint(4) NOT NULL DEFAULT 0,
  `AdminNotificationStatus` tinyint(4) NOT NULL DEFAULT 0,
  `CreatedDateTime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbladminnotification`
--

INSERT INTO `tbladminnotification` (`AdminNotificationID`, `AdminNotificationContent`, `AdminNotificationRedirect`, `SenderUserID`, `IsRead`, `AdminNotificationStatus`, `CreatedDateTime`) VALUES
(1, 'trial', '/admin/article/11', 1, 1, 0, '2018-04-22 12:31:58'),
(2, 'trial2', '/admin/article/12', 2, 0, 0, '2018-04-22 12:48:51'),
(3, 'harsh123 Commented on Article', '/admin/Article/13', 1, 0, 0, '2021-09-04 18:35:41');

-- --------------------------------------------------------

--
-- Table structure for table `tblarticle`
--

CREATE TABLE `tblarticle` (
  `ArticleID` int(11) NOT NULL,
  `ArticleTitle` varchar(500) NOT NULL,
  `ArticleContent` varchar(30000) NOT NULL,
  `ArticleImage` varchar(200) NOT NULL DEFAULT 'default.jpg',
  `AddedByAdminID` int(11) NOT NULL,
  `ArticleStatus` tinyint(4) NOT NULL DEFAULT 0,
  `CreatedDateTime` datetime NOT NULL DEFAULT current_timestamp(),
  `UpdatedDateTime` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblarticlexcomment`
--

CREATE TABLE `tblarticlexcomment` (
  `ArticleXCommentID` int(11) NOT NULL,
  `ArticleID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `ArticleCommentContent` varchar(1000) NOT NULL,
  `CreatedDateTime` datetime NOT NULL DEFAULT current_timestamp(),
  `ArticleCommentStatus` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblarticlexlike`
--

CREATE TABLE `tblarticlexlike` (
  `ArticleXLikeID` int(11) NOT NULL,
  `ArticleID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `CreatedDateTime` datetime NOT NULL DEFAULT current_timestamp(),
  `ArticleLikeStatus` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblarticlextag`
--

CREATE TABLE `tblarticlextag` (
  `ArticleXTagID` int(11) NOT NULL,
  `ArticleID` int(11) NOT NULL,
  `TagID` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblcategory`
--

CREATE TABLE `tblcategory` (
  `CategoryID` int(11) NOT NULL,
  `CategoryName` varchar(100) NOT NULL,
  `ParentCategoryID` int(11) NOT NULL,
  `AddedByAdminID` int(11) NOT NULL,
  `CategoryStatus` tinyint(4) NOT NULL DEFAULT 0,
  `CreatedDateTime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblcategory`
--

INSERT INTO `tblcategory` (`CategoryID`, `CategoryName`, `ParentCategoryID`, `AddedByAdminID`, `CategoryStatus`, `CreatedDateTime`) VALUES
(1, 'Solid Waste Management', 0, 1, 0, '2018-03-05 10:27:06');

-- --------------------------------------------------------

--
-- Table structure for table `tblchallenge`
--

CREATE TABLE `tblchallenge` (
  `ChallengeID` int(11) NOT NULL,
  `SenderID` int(11) NOT NULL,
  `SenderXP` int(11) DEFAULT NULL,
  `ReceiverID` int(11) NOT NULL,
  `ReceiverXP` int(11) DEFAULT NULL,
  `CourseID` int(11) NOT NULL,
  `CreatedDateTime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblchapter`
--

CREATE TABLE `tblchapter` (
  `ChapterID` int(11) NOT NULL,
  `ChapterName` varchar(200) NOT NULL,
  `CourseID` int(11) NOT NULL,
  `AddedByAdminID` int(11) NOT NULL,
  `ChapterStatus` tinyint(4) NOT NULL DEFAULT 0,
  `CreatedDateTime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblchapter`
--

INSERT INTO `tblchapter` (`ChapterID`, `ChapterName`, `CourseID`, `AddedByAdminID`, `ChapterStatus`, `CreatedDateTime`) VALUES
(1, 'Introduction to Solid Waste Management', 1, 1, 0, '2018-02-28 08:39:04'),
(2, 'Solid-waste characteristics', 1, 1, 0, '2018-02-28 09:41:06'),
(3, 'Solid-waste collection', 1, 1, 0, '2018-03-04 02:16:16'),
(4, 'Solid-waste treatment and disposal', 1, 1, 0, '2018-03-04 02:16:48');

-- --------------------------------------------------------

--
-- Table structure for table `tblcourse`
--

CREATE TABLE `tblcourse` (
  `CourseID` int(11) NOT NULL,
  `CourseName` varchar(200) NOT NULL,
  `CourseImage` varchar(200) NOT NULL DEFAULT 'default.jpg',
  `CourseDescription` varchar(5000) NOT NULL,
  `CategoryID` int(11) NOT NULL,
  `AddedByAdminID` int(11) NOT NULL,
  `CourseStatus` tinyint(4) NOT NULL DEFAULT 0,
  `CreatedDateTime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblcourse`
--

INSERT INTO `tblcourse` (`CourseID`, `CourseName`, `CourseImage`, `CourseDescription`, `CategoryID`, `AddedByAdminID`, `CourseStatus`, `CreatedDateTime`) VALUES
(1, 'Solid Waste Management', 'waste.png', 'Providing helpful information about our rapidly depleting environment', 1, 1, 0, '2018-02-28 08:39:30');

-- --------------------------------------------------------

--
-- Table structure for table `tblfollow`
--

CREATE TABLE `tblfollow` (
  `FollowID` int(11) NOT NULL,
  `FollowerID` int(11) NOT NULL,
  `FollowingID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblforuma`
--

CREATE TABLE `tblforuma` (
  `ForumAID` int(11) NOT NULL,
  `ForumAContent` varchar(5000) NOT NULL,
  `ForumQID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `ForumAStatus` tinyint(4) NOT NULL DEFAULT 0,
  `CreatedDateTime` datetime NOT NULL DEFAULT current_timestamp(),
  `UpdatedDateTime` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblforuma`
--

INSERT INTO `tblforuma` (`ForumAID`, `ForumAContent`, `ForumQID`, `UserID`, `ForumAStatus`, `CreatedDateTime`, `UpdatedDateTime`) VALUES
(1, '<u>== should be used to check values</u><br><i>== should be used to check both value as well as datatype</i>', 1, 2, 0, '2018-03-04 18:36:38', '2018-04-13 15:25:16'),
(2, 'use what you want I dont care', 1, 3, 1, '2018-03-04 21:07:45', '2018-04-13 09:37:10'),
(3, 'abc', 1, 1, 1, '2018-03-05 17:09:28', '2018-04-13 09:37:15'),
(4, 'xyz', 2, 2, 0, '2018-03-05 17:09:57', '2018-03-29 16:10:56'),
(5, 'c Language', 1, 2, 1, '2018-03-26 00:16:48', '2018-04-30 09:58:20'),
(6, 'ASDADASD', 2, 1, 0, '2018-04-07 10:21:12', NULL),
(7, 'doesnt matter', 1, 1, 1, '2018-04-10 10:35:14', '2018-04-13 09:37:13'),
(8, 'hello', 1, 1, 1, '2018-04-10 10:36:14', '2018-04-13 09:37:36'),
(9, 'test2', 1, 1, 1, '2018-04-11 00:39:37', '2018-04-13 09:38:25'),
(10, 'helllllo55', 1, 1, 1, '2018-04-11 01:08:53', '2018-04-13 09:38:28'),
(11, 'hello5555', 1, 1, 1, '2018-04-11 01:10:20', '2018-04-13 09:38:31'),
(12, 'hello495', 1, 1, 1, '2018-04-11 12:38:59', '2018-04-13 09:37:59'),
(13, 'hello 1508', 1, 1, 1, '2018-04-11 15:08:14', '2018-04-13 09:37:55'),
(14, '143', 1, 2, 1, '2018-04-11 23:42:36', '2018-04-13 09:37:44'),
(15, 'trial22', 1, 1, 1, '2018-04-12 01:17:11', '2018-04-13 09:38:03'),
(16, 'trail3333', 1, 1, 1, '2018-04-12 01:17:23', '2018-04-13 09:38:06'),
(17, 'nice question', 1, 1, 1, '2018-04-12 11:48:51', '2018-04-13 09:38:11'),
(18, 'nice question', 1, 1, 1, '2018-04-12 11:51:14', '2018-04-13 09:38:18'),
(19, 'hey there', 1, 1, 1, '2018-04-12 11:51:36', '2018-04-13 09:38:15'),
(20, 'test222', 1, 1, 1, '2018-04-12 12:01:29', '2018-04-13 09:36:59'),
(21, '=== is strict while == is easy', 1, 1, 0, '2018-04-13 12:59:22', NULL),
(22, '=== is strict while == is easy', 1, 1, 1, '2018-04-13 13:00:31', '2018-04-13 13:01:55'),
(23, 'new', 1, 1, 1, '2018-04-13 13:01:21', '2018-04-13 13:01:58'),
(24, 'hello baby', 11, 2, 0, '2018-04-17 15:24:08', NULL),
(25, 'Hello <?php echo \"Bello\"; ?> Tello', 11, 2, 0, '2018-04-17 15:25:03', NULL),
(26, 'Hello &lt;?php echo &quot;Bello&quot;; ?&gt; Tello', 11, 2, 0, '2018-04-17 15:30:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblforumaxvote`
--

CREATE TABLE `tblforumaxvote` (
  `ForumAXVoteID` int(11) NOT NULL,
  `ForumAID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `VoteType` tinyint(4) NOT NULL,
  `CreatedDateTime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblforumaxvote`
--

INSERT INTO `tblforumaxvote` (`ForumAXVoteID`, `ForumAID`, `UserID`, `VoteType`, `CreatedDateTime`) VALUES
(1, 1, 1, 1, '2018-03-04 18:38:13'),
(3, 1, 3, 1, '2018-03-05 17:11:04'),
(4, 2, 4, -1, '2018-03-05 17:12:01'),
(5, 2, 5, 1, '2018-03-05 17:12:35'),
(6, 2, 6, -1, '2018-03-05 17:14:51'),
(19, 3, 2, -1, '2018-03-25 23:52:35'),
(23, 4, 2, 1, '2018-03-25 23:52:40'),
(59, 1, 2, -1, '2018-03-29 17:00:09'),
(65, 2, 2, 1, '2018-04-04 19:56:51'),
(92, 6, 1, 1, '2018-04-07 10:22:57'),
(94, 3, 1, -1, '2018-04-07 23:57:34');

-- --------------------------------------------------------

--
-- Table structure for table `tblforumq`
--

CREATE TABLE `tblforumq` (
  `ForumQID` int(11) NOT NULL,
  `ForumQTitle` varchar(500) NOT NULL,
  `ForumQContent` varchar(5000) NOT NULL,
  `UserID` int(11) NOT NULL,
  `AcceptedForumAID` int(11) DEFAULT NULL,
  `ForumQStatus` tinyint(4) NOT NULL DEFAULT 0,
  `CreatedDateTime` datetime NOT NULL DEFAULT current_timestamp(),
  `UpdatedDateTime` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblforumqxtag`
--

CREATE TABLE `tblforumqxtag` (
  `ForumQXTagID` int(11) NOT NULL,
  `ForumQID` int(11) NOT NULL,
  `TagID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblforumqxvote`
--

CREATE TABLE `tblforumqxvote` (
  `ForumQXVoteID` int(11) NOT NULL,
  `ForumQID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `VoteType` tinyint(4) NOT NULL,
  `CreatedDateTime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblpoll`
--

CREATE TABLE `tblpoll` (
  `PollID` int(11) NOT NULL,
  `PollTitle` varchar(500) NOT NULL,
  `PollContent` varchar(1500) NOT NULL,
  `PollStartDate` date NOT NULL,
  `PollEndDate` date NOT NULL,
  `AddedByAdminID` int(11) NOT NULL,
  `PollStatus` tinyint(4) NOT NULL DEFAULT 0,
  `CreatedDateTime` datetime DEFAULT current_timestamp(),
  `UpdatedDateTime` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblpoll`
--

INSERT INTO `tblpoll` (`PollID`, `PollTitle`, `PollContent`, `PollStartDate`, `PollEndDate`, `AddedByAdminID`, `PollStatus`, `CreatedDateTime`, `UpdatedDateTime`) VALUES
(1, 'best mobile of 2018', 'adsgdhfgj', '2018-08-15', '2018-09-17', 1, 1, '2018-03-08 11:44:13', '2018-04-23 11:37:49'),
(2, 'Which is best budget SmartTV as of 2018?', 'please help me select one from following list', '2018-03-02', '2018-03-15', 1, 1, '2018-03-09 18:55:37', '2018-04-19 12:42:06'),
(3, 'Web Service', 'Which is the best Browser to stream video?', '2018-03-24', '2018-04-24', 13, 0, '2018-03-13 09:38:33', '2018-03-26 17:17:50'),
(4, 'google', 'google user in India', '2017-12-12', '2018-12-25', 13, 0, '2018-03-29 20:56:33', '2018-03-29 20:59:14'),
(5, 'which is best editor', 'some content here', '2018-04-05', '0000-00-00', 3, 0, '2018-04-13 15:22:41', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblpollxanswer`
--

CREATE TABLE `tblpollxanswer` (
  `PollXAnswerID` int(11) NOT NULL,
  `PollID` int(11) NOT NULL,
  `PollXOptionID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `CreatedDateTime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblpollxanswer`
--

INSERT INTO `tblpollxanswer` (`PollXAnswerID`, `PollID`, `PollXOptionID`, `UserID`, `CreatedDateTime`) VALUES
(1, 1, 1, 1, '2018-03-08 11:51:27'),
(2, 2, 5, 1, '2018-03-12 09:40:49'),
(3, 2, 6, 2, '2018-03-12 09:40:49'),
(4, 2, 5, 3, '2018-03-12 09:41:22'),
(5, 3, 10, 1, '2018-03-13 10:08:02'),
(8, 3, 13, 4, '2018-03-13 10:13:27'),
(9, 3, 14, 5, '2018-03-13 10:13:27'),
(10, 3, 10, 6, '2018-03-13 10:13:27'),
(11, 3, 16, 7, '2018-03-13 10:13:27'),
(12, 3, 17, 8, '2018-03-13 10:13:27'),
(13, 3, 18, 9, '2018-03-13 10:13:27'),
(14, 3, 19, 10, '2018-03-13 10:13:27'),
(15, 3, 20, 11, '2018-03-13 10:13:27'),
(16, 3, 21, 12, '2018-03-13 10:13:27'),
(17, 3, 22, 13, '2018-03-13 10:13:27'),
(18, 3, 23, 14, '2018-03-13 10:13:27'),
(19, 3, 10, 15, '2018-03-13 10:34:03'),
(20, 3, 10, 16, '2018-03-13 10:36:19'),
(21, 3, 10, 17, '2018-03-13 10:36:19'),
(22, 3, 10, 18, '2018-03-13 10:36:19'),
(23, 3, 10, 19, '2018-03-13 10:36:19'),
(24, 3, 10, 20, '2018-03-13 10:36:19'),
(25, 3, 14, 21, '2018-03-13 10:36:19'),
(26, 3, 14, 22, '2018-03-13 10:36:19'),
(27, 3, 14, 23, '2018-03-13 10:36:19'),
(28, 3, 14, 24, '2018-03-13 10:36:19'),
(29, 3, 10, 22, '2018-03-13 10:42:07'),
(30, 3, 15, 23, '2018-03-13 10:42:07'),
(31, 3, 15, 24, '2018-03-13 10:42:07'),
(32, 3, 12, 25, '2018-03-13 10:42:07'),
(33, 3, 12, 26, '2018-03-13 10:42:07'),
(34, 3, 12, 27, '2018-03-13 10:42:07'),
(35, 3, 15, 28, '2018-03-13 10:42:07'),
(36, 3, 19, 29, '2018-03-13 10:42:07'),
(41, 3, 11, 2, '2018-03-29 20:22:56'),
(42, 4, 26, 3, '2018-04-11 15:58:34'),
(43, 3, 11, 3, '2018-04-13 15:32:18'),
(44, 4, 25, 2, '2018-04-17 12:15:11');

-- --------------------------------------------------------

--
-- Table structure for table `tblpollxoption`
--

CREATE TABLE `tblpollxoption` (
  `PollXOptionID` int(11) NOT NULL,
  `PollID` int(11) NOT NULL,
  `PollXOptionContent` varchar(500) NOT NULL,
  `PollOptionStatus` tinyint(4) NOT NULL DEFAULT 0,
  `CreatedDateTime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblpollxoption`
--

INSERT INTO `tblpollxoption` (`PollXOptionID`, `PollID`, `PollXOptionContent`, `PollOptionStatus`, `CreatedDateTime`) VALUES
(1, 1, 'Motorola', 0, '2018-03-08 11:44:36'),
(4, 1, 'Nokia', 0, '2018-03-08 11:45:03'),
(5, 2, 'Samsung', 0, '2018-03-09 18:55:37'),
(6, 2, 'SONY', 0, '2018-03-09 18:55:37'),
(9, 1, 'Huwaie', 0, '2018-03-12 12:59:45'),
(10, 3, 'Google Crome', 0, '2018-03-13 09:38:33'),
(11, 3, 'Internet Explorer', 0, '2018-03-13 09:38:33'),
(12, 3, 'Opera', 0, '2018-03-13 09:50:06'),
(13, 3, 'Dolphin', 0, '2018-03-13 09:50:07'),
(14, 3, 'Mozila Firefox', 0, '2018-03-13 09:50:07'),
(15, 3, 'Safari', 0, '2018-03-13 09:50:07'),
(16, 3, 'UC Browser', 0, '2018-03-13 09:53:45'),
(17, 3, 'Maxthon', 0, '2018-03-13 09:53:45'),
(18, 3, 'Microsoft Edge', 0, '2018-03-13 09:53:45'),
(19, 3, 'Cromium', 0, '2018-03-13 09:53:45'),
(20, 3, 'SeaMonkey', 0, '2018-03-13 09:53:45'),
(21, 3, 'AvantBrowser', 0, '2018-03-13 09:53:46'),
(22, 3, 'Torch', 0, '2018-03-13 09:53:46'),
(23, 3, 'Pale Moon', 0, '2018-03-13 09:53:46'),
(24, 1, 'sony', 0, '2018-03-13 12:05:14'),
(25, 4, 'Surat', 0, '2018-03-29 20:56:33'),
(26, 4, 'Gujrat', 0, '2018-03-29 20:56:33'),
(28, 1, 'trila', 0, '2018-04-13 15:21:33'),
(29, 5, 'abc', 0, '2018-04-13 15:22:41'),
(30, 5, 'xyz', 0, '2018-04-13 15:22:41'),
(31, 1, 'samsung', 0, '2018-04-23 11:37:10');

-- --------------------------------------------------------

--
-- Table structure for table `tblquestion`
--

CREATE TABLE `tblquestion` (
  `QuestionID` int(11) NOT NULL,
  `QuestionContent` varchar(500) NOT NULL,
  `QuestionPoint` tinyint(4) NOT NULL DEFAULT 4,
  `CourseID` int(11) NOT NULL,
  `ChapterID` int(11) NOT NULL,
  `QuestionStatus` tinyint(4) NOT NULL DEFAULT 0,
  `CreatedDateTime` datetime NOT NULL DEFAULT current_timestamp(),
  `AddedByAdminID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblquestionxanswer`
--

CREATE TABLE `tblquestionxanswer` (
  `QuestionXAnswerID` int(11) NOT NULL,
  `ChallengeID` int(11) NOT NULL,
  `CourseID` int(11) NOT NULL,
  `QuestionID` int(11) NOT NULL,
  `QuestionXOptionID` int(11) DEFAULT NULL,
  `QuestionXOptionPoint` int(11) DEFAULT NULL,
  `UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblquestionxoption`
--

CREATE TABLE `tblquestionxoption` (
  `QuestionXOptionID` int(11) NOT NULL,
  `QuestionID` int(11) NOT NULL,
  `QuestionXOptionContent` varchar(200) NOT NULL,
  `IsAnswer` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblsection`
--

CREATE TABLE `tblsection` (
  `SectionID` int(11) NOT NULL,
  `SectionName` varchar(200) NOT NULL,
  `SectionContent` mediumtext NOT NULL,
  `ChapterID` int(11) NOT NULL,
  `AddedByAdminID` int(11) NOT NULL,
  `SectionStatus` tinyint(4) NOT NULL DEFAULT 0,
  `CreatedDateTime` datetime NOT NULL DEFAULT current_timestamp(),
  `UpdatedDateTime` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblsection`
--

INSERT INTO `tblsection` (`SectionID`, `SectionName`, `SectionContent`, `ChapterID`, `AddedByAdminID`, `SectionStatus`, `CreatedDateTime`, `UpdatedDateTime`) VALUES
(1, 'INTRODUCTION', '<section id=\"ref1\" data-level=\"1\"><p class=\"topic-paragraph\"><strong><span id=\"ref1062517\"></span>Solid-waste management</strong> <br> it is the collecting, treating, and disposing of solid material that is discarded because it has served its purpose or is no longer useful. <br> Improper disposal of municipal <span id=\"ref593289\"></span>solid waste can create unsanitary conditions, and these conditions in turn can lead to <a href=\"https://www.britannica.com/\" class=\"md-crosslink\">pollution</a> of <br>the environment and to outbreaks of vector-borne disease—that is, diseases spread by <a href=\"https://www.britannica.com/\" class=\"md-crosslink\">rodents</a> and <a href=\"https://www.britannica.com/\" class=\"md-crosslink\">insects</a>. <br> The tasks of solid-waste management present complex technical challenges. <br> They also pose a wide variety of administrative, economic, and social problems that must be managed and solved.</p><!--[P1]--><span class=\"marker p1\"></span><!--[1STIMG]--><div class=\"assemblies\"><div class=\"w-100\"><figure class=\"md-assembly card print-true\" data-assembly-id=\"143926\"><div class=\"md-assembly-wrapper\" data-type=\"image\"><a style=\"--aspect-ratio: 16/9\" href=\"https://cdn.britannica.com/02/141102-050-82CB8A59/Bulldozers-landfill.jpg\" class=\"position-relative d-flex align-items-center justify-content-center media-overlay-link card-media\" data-href=\"*143926\"><img loading=\"lazy\" src=\"https://cdn.britannica.com/s:300x169,c:crop/02/141102-050-82CB8A59/Bulldozers-landfill.jpg\" alt=\"sanitary landfill\" data-width=\"1600\" data-height=\"1377\"><button class=\"btn btn-circle position-absolute shadow btn-white\" aria-label=\"Zoom in\"><em class=\"material-icons link-blue\" data-icon=\"zoom_in\"></em></button></img></a></div><figcaption class=\"card-body\"><a class=\"md-assembly-title font-weight-bold mb-5 d-inline-block font-16 font-sans-serif media-overlay-link\" href=\"https://cdn.britannica.com/02/141102-050-82CB8A59/Bulldozers-landfill.jpg\" data-href=\"*143926\">sanitary landfill</a><div class=\"md-assembly-caption text-muted font-14 font-serif\">Bulldozers working on a sanitary landfill.</div><cite class=\"credit d-block mt-5\">© SergeyZavalnyuk—iStock/Getty Images</cite></figcaption></figure></div></div><!--[/1STIMG]--><!--[AM1]--><span class=\"marker AM1 am-inline\"></span><!--[MOD1]--><span class=\"marker MOD1 mod-inline\"></span></section>', 1, 1, 0, '2018-02-28 10:02:47', '2021-09-04 14:37:31'),
(2, 'History of Solid Waste Management ', '<h2 >Historical background</h2> <br>\r\n<h3>Early waste disposal</h3> <br>\r\n <p>\r\nIn ancient cities, wastes were thrown onto unpaved streets and\r\nroadways, where they were left to accumulate. It was not until\r\n320 BCE in Athens that the first known law forbidding this\r\npractice was established. At that time a system for waste removal\r\nbegan to evolve in Greece and in the Greek-dominated cities of\r\nthe eastern Mediterranean. In ancient Rome, property owners\r\nwere responsible for cleaning the streets fronting their property.\r\nBut organized waste collection was associated only with state-sponsored events such as parades.\r\nDisposal methods were very crude, involving open pits located just outside the city walls. As\r\npopulations increased, efforts were made to transport waste farther out from the cities.\r\nAfter the fall of Rome, waste collection and municipal sanitation began a decline that lasted\r\nthroughout the Middle Ages. Near the end of the 14th century, scavengers were given the task of\r\ncarting waste to dumps outside city walls. But this was not the case in smaller towns, where most\r\npeople still threw waste into the streets. It was not until 1714 that every city in England was required\r\nto have an official scavenger. Toward the end of the 18th century in America, municipal collection of\r\ngarbage was begun in Boston, New York City, and Philadelphia. Waste disposal methods were still\r\nvery crude, however. Garbage collected in Philadelphia, for example, was simply dumped into the\r\nDelaware River downstream from the city.\r\n</p>', 1, 1, 0, '2018-02-28 10:16:57', '2021-09-06 15:14:32'),
(3, 'Developments in waste management', '<h2>Developments in waste management</h2> <p>A technological approach to solid-waste management began to develop in the latter part of the 19th\r\ncentury. Watertight garbage cans were first introduced in the United States, and sturdier vehicles were\r\nused to collect and transport wastes. A significant development in solid-waste treatment and disposal\r\npractices was marked by the construction of the first refuse incinerator in England in 1874. By the\r\nbeginning of the 20th century, 15 percent of major American cities were incinerating solid waste.\r\nEven then, however, most of the largest cities were still using primitive disposal methods such as open\r\ndumping on land or in water.\r\nTechnological advances continued during the first half of the 20th century, including the development\r\nof garbage grinders, compaction trucks, and pneumatic collection systems. By mid-century, however,\r\nit had become evident that open dumping and improper incineration of solid waste were causing\r\nproblems of pollution and jeopardizing public health. As a result, sanitary landfills were developed to\r\nreplace the practice of open dumping and to reduce the reliance on waste incineration. In many\r\ncountries waste was divided into two categories, hazardous and nonhazardous, and separate\r\nregulations were developed for their disposal. Landfills were designed and operated in a manner that\r\nminimized risks to public health and the environment. New refuse incinerators were designed to\r\nrecover heat energy from the waste and were provided with extensive air pollution control devices to\r\nsatisfy stringent standards of air quality. Modern solid-waste management plants in most developed\r\ncountries now emphasize the practice of recycling and waste reduction at the source rather than\r\nincineration and land disposal.</p>', 1, 1, 0, '2018-03-08 09:22:13', '2021-09-06 14:25:12'),
(26, 'Composition and properties', '<h2>Composition and properties</h2>\r\n<p>The sources of solid waste include residential, commercial, institutional, and industrial activities.\r\nCertain types of wastes that cause immediate danger to exposed individuals or environments are\r\nclassified as hazardous; these are discussed in the article hazardous-waste management. All\r\nnonhazardous solid waste from a community that requires collection and transport to a processing or\r\ndisposal site is called refuse or municipal solid waste (MSW). Refuse includes garbage and rubbish.\r\nGarbage is mostly decomposable food waste; rubbish is mostly dry material such as glass, paper,\r\ncloth, or wood. Garbage is highly putrescible or decomposable, whereas rubbish is not. Trash is\r\nrubbish that includes bulky items such as old refrigerators, couches, or large tree stumps. Trash\r\nrequires special collection and handling.\r\nConstruction and demolition (C&D) waste (or debris) is a significant component of total solid waste\r\nquantities (about 20 percent in the United States), although it is not considered to be part of the MSW stream. However, because C&D waste is inert and nonhazardous, it is usually disposed of in municipal\r\nsanitary landfills (see below).\r\nAnother type of solid waste, perhaps the fastest-growing component in many developed countries, is\r\nelectronic waste, or e-waste, which includes discarded computer equipment, televisions, telephones,\r\nand a variety of other electronic devices. Concern over this type of waste is escalating. Lead, mercury,\r\nand cadmium are among the materials of concern in electronic devices, and governmental policies\r\nmay be required to regulate their recycling and disposal.\r\n?\r\nSolid-waste characteristics vary considerably among\r\ncommunities and nations. American refuse is usually lighter, for\r\nexample, than European or Japanese refuse. In the United States\r\npaper and paperboard products make up close to 40 percent of\r\nthe total weight of MSW; food waste accounts for less than 10\r\npercent. The rest is a mixture of yard trimmings, wood, glass,\r\nelectronic waste\r\nElectronic waste in a garbage dump.\r\n© Clarence Alford/Fotolia\r\nmetal, plastic, leather, cloth, and other miscellaneous materials.\r\nIn a loose or uncompacted state, MSW of this type weighs\r\napproximately 120 kg per cubic metre (200 pounds per cubic yard). These figures vary with\r\ngeographic location, economic conditions, season of the year, and many other factors. Waste\r\ncharacteristics from each community must be studied carefully before any treatment or disposal\r\nfacility is designed and built.\r\n</p>', 2, 1, 0, '2018-03-31 14:04:53', '2021-09-06 14:43:25'),
(27, 'Generation and storage', '<h2>Generation and storage</h2>\r\n<p>\r\nRates of solid-waste generation vary widely. In the United States, for example, municipal refuse is\r\ngenerated at an average rate of approximately 2 kg (4.5 pounds) per person per day. Japan generates\r\nroughly half this amount, yet in Canada the rate is 2.7 kg (almost 6 pounds) per person per day. In\r\nsome developing countries the average rate can be lower than 0.5 kg (1 pound) per person per day.\r\nThese data include refuse from commercial, institutional, and industrial as well as residential sources.\r\nThe actual rates of refuse generation must be carefully determined when a community plans a solidwaste management\r\nproject.\r\nMost communities require household refuse to be stored in durable, easily cleaned containers with\r\ntight-fitting covers in order to minimize rodent or insect infestation and offensive odours. Galvanized\r\nmetal or plastic containers of about 115-litre (30-gallon) capacity are commonly used, although some\r\ncommunities employ larger containers that can be mechanically lifted and emptied into collection\r\ntrucks. Plastic bags are frequently used as liners or as disposable containers for curbside collection.\r\nWhere large quantities of refuse are generated—such as at shopping centres, hotels, or apartment buildings—dumpsters may be used for temporary storage until the waste is collected. Some office and\r\ncommercial buildings use on-site compactors to reduce the waste volume.\r\n</p>', 2, 1, 0, '2018-03-31 14:04:53', '2021-09-06 14:43:25'),
(28, 'Collecting and transporting', '<h2>Collecting and transporting</h2>\r\n<p>\r\nProper solid-waste collection is important for the protection of public health, safety, and\r\nenvironmental quality. It is a labour-intensive activity, accounting for approximately three-quarters of\r\nthe total cost of solid-waste management. Public employees are often assigned to the task, but\r\nsometimes it is more economical for private companies to do the work under contract to the\r\nmunicipality or for private collectors to be paid by individual home owners. A driver and one or two\r\nloaders serve each collection vehicle. These are typically trucks of the enclosed, compacting type,\r\nwith capacities up to 30 cubic metres (40 cubic yards). Loading can be done from the front, rear, or\r\nside. Compaction reduces the volume of refuse in the truck to less than half of its loose volume.\r\nThe task of selecting an optimal collection route is a complex problem, especially for large and\r\ndensely populated cities. An optimal route is one that results in the most efficient use of labour and\r\nequipment, and selecting such a route requires the application of computer analyses that account for\r\nall the many design variables in a large and complex network. Variables include frequency of\r\ncollection, haulage distance, type of service, and climate. Collection of refuse in rural areas can\r\npresent a special problem, since the population densities are low, leading to high unit costs.\r\nRefuse collection usually occurs at least once per week because of the rapid decomposition of food\r\nwaste. The amount of garbage in the refuse of an individual home can be reduced by garbage grinders,\r\nor garbage disposals. Ground garbage puts an extra load on sewerage systems, but this can usually be\r\naccommodated. Many communities now conduct source separation and recycling programs, in which\r\nhomeowners and businesses separate recyclable materials from garbage and place them in separate\r\ncontainers for collection. In addition, some communities have drop-off centres where residents can\r\nbring recyclables.\r\n</p>', 3, 1, 0, '2018-03-31 14:04:53', '2021-09-06 14:43:25'),
(29, 'Transfer stations', '<h2>Transfer stations</h2>\r\n<p>\r\nIf the final destination of the refuse is not near the community in which it is generated, one or more\r\ntransfer stations may be necessary. A transfer station is a central facility where refuse from many\r\ncollection vehicles is combined into a larger vehicle, such as a tractor-trailer unit. Open-top trailers are\r\ndesigned to carry about 76 cubic metres (100 cubic yards) of uncompacted waste to a regional\r\nprocessing or disposal location. Closed compactor-type trailers are also available, but they must be\r\nequipped with ejector mechanisms. In a direct discharge type of station, several collection trucks empty directly into the transport vehicle. In a storage discharge type of station, refuse is first emptied\r\ninto a storage pit or onto a platform, and then machinery is used to hoist or push the solid waste into\r\nthe transport vehicle. Large transfer stations can handle more than 500 tons of refuse per day.\r\n</p>', 3, 1, 0, '2018-03-31 14:04:53', '2021-09-06 14:44:11'),
(30, 'Incineration\r\n', '<h2>Furnace operation</h2>\r\n<p>\r\nBurning is a very effective method of reducing the volume and weight of solid waste, though it is a\r\nsource of greenhouse gas emissions. In modern incinerators the waste is burned inside a properly\r\ndesigned furnace under very carefully controlled conditions. The combustible portion of the waste\r\ncombines with oxygen, releasing mostly carbon dioxide, water vapour, and heat. Incineration can\r\nreduce the volume of uncompacted waste by more than 90 percent, leaving an inert residue of ash,\r\nglass, metal, and other solid materials called bottom ash. The gaseous by-products of incomplete\r\ncombustion, along with finely divided particulate material called fly ash, are carried along in the\r\nincinerator airstream. Fly ash includes cinders, dust, and soot. In order to remove fly ash and gaseous\r\nby-products before they are exhausted into the atmosphere, modern incinerators must be equipped\r\nwith extensive emission control devices. Such devices include fabric baghouse filters, acid gas\r\nscrubbers, and electrostatic precipitators. (See also air pollution control.) Bottom ash and fly ash are\r\nusually combined and disposed of in a landfill. If the ash is found to contain toxic metals, it must be\r\nmanaged as a hazardous waste.\r\nMunicipal solid-waste incinerators are designed to receive and burn a continuous supply of refuse. A\r\ndeep refuse storage pit, or tipping area, provides enough space for about one day of waste storage. The\r\nrefuse is lifted from the pit by a crane equipped with a bucket or grapple device. It is then deposited\r\ninto a hopper and chute above the furnace and released onto a charging grate or stoker. The grate\r\nshakes and moves waste through the furnace, allowing air to circulate around the burning material.\r\nModern incinerators are usually built with a rectangular furnace, although rotary kiln furnaces and\r\nvertical circular furnaces are available. Furnaces are constructed of refractory bricks that can withstand the high combustion temperatures.\r\nCombustion in a furnace occurs in two stages: primary and secondary. In primary combustion,\r\nmoisture is driven off, and the waste is ignited and volatilized. In secondary combustion, the remaining unburned gases and particulates are oxidized, eliminating odours and reducing the amount\r\nof fly ash in the exhaust. When the refuse is very moist, auxiliary gas or fuel oil is sometimes burned\r\nto start the primary combustion.\r\nIn order to provide enough oxygen for both primary and secondary combustion, air must be\r\nthoroughly mixed with the burning refuse. Air is supplied from openings beneath the grates or is\r\nadmitted to the area above. The relative amounts of this underfire air and overfire air must be\r\ndetermined by the plant operator to achieve good combustion efficiency. A continuous flow of air can\r\nbe maintained by a natural draft in a tall chimney or by mechanical forced-draft fans. </p>\r\n<br>\r\n<h2>Energy recovery</h2>\r\n<p>\r\nThe energy value of refuse can be as much as one-third that of coal, depending on the paper content,\r\nand the heat given off during incineration can be recovered by the use of a refractory-lined furnace\r\ncoupled to a boiler. Boilers convert the heat of combustion into steam or hot water, thus allowing the\r\nenergy content of the refuse to be recycled. Incinerators that recycle heat energy in this way are called\r\nwaste-to-energy plants. Instead of a separate furnace and boiler, a water-tube wall furnace may also be\r\nused for energy recovery. Such a furnace is lined with vertical steel tubes spaced closely enough to\r\nform continuous sections of wall. The walls are insulated on the outside in order to reduce heat loss.\r\nWater circulating through the tubes absorbs heat to produce steam, and it also helps to control\r\ncombustion temperatures without the need for excessive air, thus lowering air pollution control costs.\r\nWaste-to-energy plants operate as either mass burn or refuse-derived fuel systems. A mass burn\r\nsystem uses all the refuse, without prior treatment or preparation. A refuse-derived fuel system\r\nseparates combustible wastes from noncombustibles such as glass and metal before burning. If a\r\nturbine is installed at the plant, both steam and electricity can be produced in a process called\r\ncogeneration.\r\nWaste-to-energy systems are more expensive to build and operate than plain incinerators because of\r\nthe need for special equipment and controls, highly skilled technical personnel, and auxiliary fuel\r\nsystems. On the other hand, the sale of generated steam or electricity offsets much of the extra cost,\r\nand recovery of heat energy from refuse is a viable solid-waste management option from both an\r\nengineering and an economic point of view. About 80 percent of municipal refuse incinerators in the\r\nUnited States are waste-to-energy facilities.\r\n\r\n</p>', 4, 1, 0, '2018-03-31 14:04:53', '2021-09-06 15:08:25'),
(31, 'Composting', '<p>\r\nAnother method of treating municipal solid waste is composting, a biological process in which the\r\norganic portion of refuse is allowed to decompose under carefully controlled conditions. Microbes metabolize the organic waste material and reduce its volume by as much as 50 percent. The stabilized\r\nproduct is called compost or humus. It resembles potting soil in texture and odour and may be used as\r\na soil conditioner or mulch.\r\nComposting offers a method of processing and recycling both garbage and sewage sludge in one\r\noperation. As more stringent environmental rules and siting constraints limit the use of solid-waste\r\nincineration and landfill options, the application of composting is likely to increase. The steps\r\ninvolved in the process include sorting and separating, size reduction, and digestion of the refuse.\r\n</p>\r\n<h2>\r\nSorting and shredding\r\n</h2>\r\n<p>\r\nThe decomposable materials in refuse are isolated from glass, metal, and other inorganic items\r\nthrough sorting and separating operations. These are carried out mechanically, using differences in\r\nsuch physical characteristics of the refuse as size, density, and magnetic properties. Shredding or\r\npulverizing reduces the size of the waste articles, resulting in a uniform mass of material. It is\r\naccomplished with hammer mills and rotary shredders.\r\n</p>\r\n\r\n<h2>\r\nDigesting and processing\r\n</h2>\r\n<p>Pulverized waste is ready for composting either by the open windrow method or in an enclosed\r\nmechanical facility. Windrows are long, low mounds of refuse. They are turned or mixed every few\r\ndays to provide air for the microbes digesting the organics. Depending on moisture conditions, it may\r\ntake five to eight weeks for complete digestion of the waste. Because of the metabolic action of\r\naerobic bacteria, temperatures in an active compost pile reach about 65 °C (150 °F), killing pathogenic\r\norganisms that may be in the waste material.\r\nOpen windrow composting requires relatively large land areas. Enclosed mechanical composting\r\nfacilities can reduce land requirements by about 85 percent. Mechanical composting systems employ\r\none or more closed tanks or digesters equipped with rotating vanes that mix and aerate the shredded\r\nwaste. Complete digestion of the waste takes about one week.\r\nDigested compost must be processed before it can be used as a mulch or soil conditioner. Processing\r\nincludes drying, screening, and granulating or pelletizing. These steps improve the market value of the\r\ncompost, which is the most serious constraint to the success of composting as a waste management\r\noption. Agricultural demand for digested compost is usually low because of the high cost of\r\ntransporting it and because of competition with inorganic chemical fertilizers.</p>', 4, 1, 0, '2018-03-31 14:04:53', '2021-09-06 15:08:26'),
(32, 'Sanitary landfill', '<p>Land disposal is the most common management strategy for municipal solid waste. Refuse can be\r\nsafely deposited in a sanitary landfill, a disposal site that is carefully selected, designed, constructed,\r\nand operated to protect the environment and public health. One of the most important factors relating\r\nto landfilling is that the buried waste never comes in contact with surface water or groundwater.\r\nEngineering design requirements include a minimum distance between the bottom of the landfill and\r\nthe seasonally high groundwater table. Most new landfills are required to have an impermeable liner\r\nor barrier at the bottom, as well as a system of groundwater-monitoring wells. Completed landfill\r\nsections must be capped with an impermeable cover to keep precipitation or surface runoff away from\r\nthe buried waste. Bottom and cap liners may be made of flexible plastic membranes, layers of clay\r\nsoil, or a combination of both.</p> <br>\r\n\r\n<h2>Constructing the landfill</h2>\r\n<p>\r\nThe basic element of a sanitary landfill is the refuse cell. This is a confined portion of the site in which\r\nrefuse is spread and compacted in thin layers. Several layers may be compacted on top of one another\r\nto a maximum depth of about 3 metres (10 feet). The compacted refuse occupies about one-quarter of\r\nits original loose volume. At the end of each day’s operation, the refuse is covered with a layer of soil\r\nto eliminate windblown litter, odours, and insect or rodent problems. One refuse cell thus contains the\r\ndaily volume of compacted refuse and soil cover. Several adjacent refuse cells make up a lift, and\r\neventually a landfill may comprise two or more lifts stacked one on top of the other. The final cap for\r\na completed landfill may also be covered with a layer of topsoil that can support vegetative growth. Daily cover soil may be available on-site, or it may be hauled in\r\nand stockpiled from off-site sources. Various types of heavy\r\nmachinery, such as crawler tractors or rubber-tired dozers, are\r\nused to spread and compact the refuse and soil. Heavy steelwheeled compactors may also be employed to achieve\r\nhigh-\r\ndensity compaction of the refuse. The area and depth of a new landfill are carefully staked out, and the base is prepared for construction\r\nof any required liner and leachate-collection system. Where a plastic liner is used, at least 30 cm (12\r\ninches) of sand is carefully spread over it to provide protection from landfill vehicles. At sites where\r\nexcavations can be made below grade, the trench method of construction may be followed. Where this\r\nis not feasible because of topography or groundwater conditions, the area method may be practiced,\r\nresulting in a mound or hill rising above the original ground. Since no ground is excavated in the area\r\nmethod, soil usually must be hauled to the site from some other location. Variations of the area method\r\nmay be employed where a landfill site is located on sloping ground, in a valley, or in a ravine. The\r\ncompleted landfill eventually blends in with the landscape.\r\n</p>\r\n<h2>Controlling by-products</h2>\r\n<p>\r\nOrganic material buried in a landfill decomposes by anaerobic microbial action. Complete\r\ndecomposition usually takes more than 20 years. One of the by-products of this decomposition is\r\nmethane gas. Methane is poisonous and explosive when diluted in the air, and it is a potent greenhouse\r\ngas. It can also flow long distances through porous layers of soil, and, if it is allowed to collect in\r\nbasements or other confined areas, dangerous conditions may arise. In modern landfills, methane\r\nmovement is controlled by impermeable barriers and by gas-venting systems. In some landfills the\r\nmethane gas is collected and recovered for use as a fuel, either directly or as a component of biogas.\r\nA highly contaminated liquid called leachate is another by-product of decomposition in sanitary\r\nlandfills. Most leachate is the result of runoff that infiltrates the refuse cells and comes in contact with\r\ndecomposing garbage. If leachate reaches the groundwater or seeps out onto the ground surface,\r\nserious environmental pollution problems can occur, including the possible contamination of drinkingwater supplies. Methods of controlling leachate include the interception of surface water in order\r\nto\r\nprevent it from entering the landfill and the use of impermeable liners or barriers between the waste\r\nand the groundwater. New landfill sites should also be provided with groundwater-monitoring wells\r\nand leachate-collection and treatment systems.\r\n</p>\r\n<h2>\r\nImportance in waste management\r\n</h2>\r\n<p>\r\nIn communities where appropriate sites are available, sanitary landfills usually provide the most\r\neconomical option for disposal of nonrecyclable refuse. However, it is becoming increasingly difficult\r\nto find sites that offer adequate capacity, accessibility, and environmental conditions. Nevertheless,\r\nlandfills will always play a key role in solid-waste management. It is not possible to recycle all\r\ncomponents of solid waste, and there will always be residues from incineration and other treatment\r\nprocesses that will eventually require disposal underground. In addition, landfills can actually improve\r\npoor-quality land. In some communities properly completed landfills are converted into recreational\r\nparks, playgrounds, or golf courses.\r\n</p>', 4, 1, 0, '2018-03-31 14:04:53', '2021-09-06 15:08:26'),
(33, 'Recycling', '<p>Separating, recovering, and reusing components of solid waste that may still have economic value is\r\ncalled recycling. One type of recycling is the recovery and reuse of heat energy, a practice discussed\r\nseparately in incineration. Composting can also be considered a recycling process, since it reclaims the\r\norganic parts of solid waste for reuse as mulch or soil conditioner. Still other waste materials have\r\npotential for reuse. These include paper, metal, glass, plastic, and rubber, and their recovery is\r\ndiscussed here.</p>\r\n<h2>Separation</h2>\r\n<br>\r\n<p>\r\nBefore any material can be recycled, it must be separated from the raw waste and sorted. Separation\r\ncan be accomplished at the source of the waste or at a central processing facility. Source separation,\r\nalso called curbside separation, is done by individual citizens who collect newspapers, bottles, cans,\r\nand garbage separately and place them at the curb for collection. Many communities allow\r\n“commingling” of nonpaper recyclables (glass, metal, and plastic). In either case, municipal collection\r\nof source-separated refuse is more expensive than ordinary refuse collection.\r\nIn lieu of source separation, recyclable materials can be separated from garbage at centralized\r\nmechanical processing plants. Experience has shown that the quality of recyclables recovered from\r\nsuch facilities is lowered by contamination with moist garbage and broken glass. The best practice, as\r\nnow recognized, is to have citizens separate refuse into a limited number of categories, including\r\nnewspaper; magazines and other wastepaper; commingled metals, glass, and plastics; and garbage and\r\nother nonrecyclables. The newspaper, other paper wastes, and commingled recyclables are collected\r\nseparately from the other refuse and are processed at a centralized material recycling facility, or MRF\r\n(pronounced “murf” in waste-management jargon). A modern MRF can process about 300 tons of\r\nrecyclable wastes per day.\r\nAt a typical MRF, commingled recyclables are loaded onto a conveyor. Steel cans (“tin” cans are\r\nactually steel with only a thin coating of tin) are removed by an electromagnetic separator, and the\r\nremaining material passes over a vibrating screen in order to remove broken glass. Next, the conveyor\r\npasses through an air classifier, which separates aluminum and plastic containers from heavier glass\r\ncontainers. Glass is manually sorted by colour, and aluminum cans are separated from plastics by an\r\neddy-current separator, which repels the aluminum from the conveyor belt. </p><br>\r\n<h2>Reuse</h2>\r\n<p>\r\n\r\nRecovered broken glass can be crushed and used in asphalt pavement. Colour-sorted glass is crushed\r\nand sold to glass manufacturers as cullet, an essential ingredient in glassmaking. Steel cans are baled\r\nand shipped to steel mills as scrap, and aluminum is baled or compacted for reuse by smelters.\r\nAluminum is one of the smallest components of municipal solid waste, but it has the highest value as a\r\nrecyclable material. Recycling of plastic is a challenge, mostly because of the many different\r\npolymeric materials used in its production. Mixed thermoplastics can be used only to make lowerquality products, such as “plastic\r\nlumber.”\r\nIn the paper stream, old newspapers are sorted by hand on a conveyor belt in order to remove\r\ncorrugated materials and mixed papers. They are then baled or loose-loaded into trailers for shipment\r\nto paper mills, where they are reused in the making of more newspaper. Mixed paper is separated from\r\ncorrugated paper for sale to tissue mills. Although the processes of pulping, de-inking, and screening wastepaper are generally more expensive than making paper from virgin wood fibres, the market for\r\nrecycled paper has grown with the establishment of more processing plants.\r\nRubber is sometimes reclaimed from solid waste and shredded, reformed, and remolded in a process\r\ncalled revulcanization, but it is usually not as strong as the original material. Shredded rubber can be\r\nused as an additive in asphalt pavements and artificial turf and is also sold directly as an outdoor\r\nmulch. Discarded tires may be employed as swings and other recreational structures for use by\r\nchildren in “tire playgrounds.”\r\nIn general, the most difficult problem associated with the recycling of any solid-waste material is\r\nfinding applications and suitable markets. Recycling by itself will not solve the growing problem of\r\nsolid-waste management and disposal. There will always be some unusable and completely valueless\r\nsolid residue requiring final disposal.</p>\r\n\r\n\r\n<br>\r\n<small>Jerry A. Nathanson\r\nCitation Information\r\nArticle Title: Solid-waste management\r\nWebsite Name: Encyclopaedia Britannica\r\nPublisher: Encyclopaedia Britannica, Inc.\r\nDate Published: 10 November 2020\r\nURL: https://www.britannica.com/technology/solid-waste-management\r\nAccess Date: September 06, 2021</small>', 4, 1, 0, '2018-03-31 14:04:53', '2021-09-06 15:08:26');

-- --------------------------------------------------------

--
-- Table structure for table `tblsitereport`
--

CREATE TABLE `tblsitereport` (
  `SiteReportID` int(11) NOT NULL,
  `SiteReportSubject` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `SiteReportContent` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `UserID` int(11) NOT NULL,
  `IsResponded` tinyint(4) NOT NULL DEFAULT 0,
  `CreatedDateTime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tblsitereport`
--

INSERT INTO `tblsitereport` (`SiteReportID`, `SiteReportSubject`, `SiteReportContent`, `UserID`, `IsResponded`, `CreatedDateTime`) VALUES
(1, 'hello', 'test here', 1, 0, '2018-04-15 11:50:43'),
(2, 'test2', 'test22', 1, 0, '2018-04-15 12:01:45');

-- --------------------------------------------------------

--
-- Table structure for table `tbltag`
--

CREATE TABLE `tbltag` (
  `TagID` int(11) NOT NULL,
  `TagName` varchar(100) NOT NULL,
  `TagDescription` varchar(1000) NOT NULL,
  `AddedByAdminID` int(11) NOT NULL,
  `TagStatus` tinyint(4) NOT NULL DEFAULT 0,
  `CreatedDateTime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbltag`
--

INSERT INTO `tbltag` (`TagID`, `TagName`, `TagDescription`, `AddedByAdminID`, `TagStatus`, `CreatedDateTime`) VALUES
(1, 'PHP', 'Server side scripting Language', 1, 0, '2018-03-04 18:34:57'),
(2, 'javascript', 'frontend scripting language', 1, 0, '2018-04-23 01:56:38');

-- --------------------------------------------------------

--
-- Table structure for table `tbluser`
--

CREATE TABLE `tbluser` (
  `UserID` int(11) NOT NULL,
  `UserName` varchar(100) NOT NULL,
  `UserEmail` varchar(200) NOT NULL,
  `UserPassword` varchar(200) NOT NULL,
  `UserAvatar` varchar(200) NOT NULL DEFAULT 'default.jpg',
  `UserContactNo` varchar(20) NOT NULL,
  `IsEmailVerified` tinyint(4) NOT NULL DEFAULT 1,
  `UserStatus` tinyint(4) NOT NULL DEFAULT 1,
  `CreatedDateTime` datetime NOT NULL DEFAULT current_timestamp(),
  `UserLatitude` varchar(100) DEFAULT NULL,
  `UserLongitude` varchar(100) DEFAULT NULL,
  `UserAddress` varchar(200) DEFAULT NULL,
  `UserPostalCode` varchar(20) DEFAULT NULL,
  `UserCity` varchar(100) DEFAULT NULL,
  `UserState` varchar(100) DEFAULT NULL,
  `UserCountry` varchar(100) DEFAULT NULL,
  `UserXP` int(11) NOT NULL DEFAULT 0,
  `UserOTP` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbluser`
--

INSERT INTO `tbluser` (`UserID`, `UserName`, `UserEmail`, `UserPassword`, `UserAvatar`, `UserContactNo`, `IsEmailVerified`, `UserStatus`, `CreatedDateTime`, `UserLatitude`, `UserLongitude`, `UserAddress`, `UserPostalCode`, `UserCity`, `UserState`, `UserCountry`, `UserXP`, `UserOTP`) VALUES
(1, 'user', 'user@gmail.com', '12345678', '', '7567934300', 0, 0, '2018-03-04 18:44:40', '', '', 'P.M.B 001 AAUA, AKUNGBA AKOKO', '395007', 'AKUNGBA AKOKO', 'ONDO STATE', 'NIGERIA', 150, 'eAFkcu');

-- --------------------------------------------------------

--
-- Table structure for table `tblusernotification`
--

CREATE TABLE `tblusernotification` (
  `NotificationID` int(11) NOT NULL,
  `NotificationContent` varchar(500) NOT NULL,
  `NotificationSenderID` int(11) NOT NULL,
  `NotificationReceiverID` int(11) NOT NULL,
  `NotificationRedirect` varchar(200) NOT NULL,
  `IsRead` tinyint(4) NOT NULL DEFAULT 0,
  `NotificationStatus` tinyint(4) NOT NULL DEFAULT 0,
  `CreatedDateTime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblusernotification`
--

INSERT INTO `tblusernotification` (`NotificationID`, `NotificationContent`, `NotificationSenderID`, `NotificationReceiverID`, `NotificationRedirect`, `IsRead`, `NotificationStatus`, `CreatedDateTime`) VALUES
(1, 'You have been challenged by Jeni Biliyawala in HTML', 2, 1, '/challenge/play/1', 1, 0, '2018-04-10 10:26:35'),
(2, 'harsh.gundecha completed challenge in HTML', 1, 2, '/challenge/1', 1, 0, '2018-04-11 16:22:39'),
(3, 'You have been challenged by Tarun Kakadiya in HTML', 3, 2, '/challenge/play/3', 1, 0, '2018-04-11 23:08:28'),
(4, 'Jeni Biliyawala completed challenge in HTML', 2, 3, '/challenge/3', 1, 0, '2018-04-11 23:09:53'),
(5, 'harsh.gundecha answered your question \" == vs ===', 1, 2, '/ForumQuestion/1#answer-18', 1, 0, '2018-04-12 11:51:14'),
(6, 'harsh.gundecha answered your question \" == vs ===', 1, 2, '/ForumQuestion/1#answer-19', 1, 0, '2018-04-12 11:51:36'),
(7, 'harsh.gundecha answered your question \" == vs ===', 1, 2, '/ForumQuestion/1#answer-20', 1, 0, '2018-04-12 12:01:29'),
(8, 'You have been challenged by harsh.gundecha in HTML', 1, 2, '/challenge/play/4', 1, 0, '2018-04-13 11:56:14'),
(9, 'Jeni Biliyawala completed challenge in HTML', 2, 1, '/challenge/4', 1, 0, '2018-04-13 12:31:55'),
(10, 'harsh.gundecha answered your question \" == vs ===', 1, 2, '/ForumQuestion/1#answer-21', 1, 0, '2018-04-13 12:59:22'),
(11, 'harsh.gundecha answered your question \" == vs ===', 1, 2, '/ForumQuestion/1#answer-22', 1, 0, '2018-04-13 13:00:31'),
(12, 'harsh.gundecha answered your question \" == vs ===', 1, 2, '/ForumQuestion/1#answer-23', 1, 0, '2018-04-13 13:01:21'),
(13, 'You have been challenged by Tarun Kakadiya in HTML', 3, 1, '/challenge/play/5', 1, 0, '2018-04-13 15:34:10'),
(14, 'harsh.gundecha completed challenge in HTML', 1, 3, '/challenge/5', 0, 0, '2018-04-13 15:34:48'),
(15, 'Jeni Biliyawala answered your question \" Harsh', 2, 2, '/ForumQuestion/11#answer-24', 0, 0, '2018-04-17 15:24:08'),
(16, 'Jeni Biliyawala answered your question \" Harsh', 2, 2, '/ForumQuestion/11#answer-25', 0, 0, '2018-04-17 15:25:03'),
(17, 'Jeni Biliyawala answered your question \" Harsh', 2, 2, '/ForumQuestion/11#answer-26', 0, 0, '2018-04-17 15:30:38');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbladmin`
--
ALTER TABLE `tbladmin`
  ADD PRIMARY KEY (`AdminID`),
  ADD UNIQUE KEY `Email` (`AdminEmail`);

--
-- Indexes for table `tbladminnotification`
--
ALTER TABLE `tbladminnotification`
  ADD PRIMARY KEY (`AdminNotificationID`);

--
-- Indexes for table `tblarticle`
--
ALTER TABLE `tblarticle`
  ADD PRIMARY KEY (`ArticleID`);

--
-- Indexes for table `tblarticlexcomment`
--
ALTER TABLE `tblarticlexcomment`
  ADD PRIMARY KEY (`ArticleXCommentID`);

--
-- Indexes for table `tblarticlexlike`
--
ALTER TABLE `tblarticlexlike`
  ADD PRIMARY KEY (`ArticleXLikeID`);

--
-- Indexes for table `tblarticlextag`
--
ALTER TABLE `tblarticlextag`
  ADD PRIMARY KEY (`ArticleXTagID`);

--
-- Indexes for table `tblcategory`
--
ALTER TABLE `tblcategory`
  ADD PRIMARY KEY (`CategoryID`);

--
-- Indexes for table `tblchallenge`
--
ALTER TABLE `tblchallenge`
  ADD PRIMARY KEY (`ChallengeID`);

--
-- Indexes for table `tblchapter`
--
ALTER TABLE `tblchapter`
  ADD PRIMARY KEY (`ChapterID`);

--
-- Indexes for table `tblcourse`
--
ALTER TABLE `tblcourse`
  ADD PRIMARY KEY (`CourseID`);

--
-- Indexes for table `tblfollow`
--
ALTER TABLE `tblfollow`
  ADD PRIMARY KEY (`FollowID`);

--
-- Indexes for table `tblforuma`
--
ALTER TABLE `tblforuma`
  ADD PRIMARY KEY (`ForumAID`);

--
-- Indexes for table `tblforumaxvote`
--
ALTER TABLE `tblforumaxvote`
  ADD PRIMARY KEY (`ForumAXVoteID`);

--
-- Indexes for table `tblforumq`
--
ALTER TABLE `tblforumq`
  ADD PRIMARY KEY (`ForumQID`);

--
-- Indexes for table `tblforumqxtag`
--
ALTER TABLE `tblforumqxtag`
  ADD PRIMARY KEY (`ForumQXTagID`);

--
-- Indexes for table `tblforumqxvote`
--
ALTER TABLE `tblforumqxvote`
  ADD PRIMARY KEY (`ForumQXVoteID`);

--
-- Indexes for table `tblpoll`
--
ALTER TABLE `tblpoll`
  ADD PRIMARY KEY (`PollID`);

--
-- Indexes for table `tblpollxanswer`
--
ALTER TABLE `tblpollxanswer`
  ADD PRIMARY KEY (`PollXAnswerID`);

--
-- Indexes for table `tblpollxoption`
--
ALTER TABLE `tblpollxoption`
  ADD PRIMARY KEY (`PollXOptionID`);

--
-- Indexes for table `tblquestion`
--
ALTER TABLE `tblquestion`
  ADD PRIMARY KEY (`QuestionID`);

--
-- Indexes for table `tblquestionxanswer`
--
ALTER TABLE `tblquestionxanswer`
  ADD PRIMARY KEY (`QuestionXAnswerID`);

--
-- Indexes for table `tblquestionxoption`
--
ALTER TABLE `tblquestionxoption`
  ADD PRIMARY KEY (`QuestionXOptionID`);

--
-- Indexes for table `tblsection`
--
ALTER TABLE `tblsection`
  ADD PRIMARY KEY (`SectionID`);

--
-- Indexes for table `tblsitereport`
--
ALTER TABLE `tblsitereport`
  ADD PRIMARY KEY (`SiteReportID`);

--
-- Indexes for table `tbltag`
--
ALTER TABLE `tbltag`
  ADD PRIMARY KEY (`TagID`);

--
-- Indexes for table `tbluser`
--
ALTER TABLE `tbluser`
  ADD PRIMARY KEY (`UserID`);

--
-- Indexes for table `tblusernotification`
--
ALTER TABLE `tblusernotification`
  ADD PRIMARY KEY (`NotificationID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbladmin`
--
ALTER TABLE `tbladmin`
  MODIFY `AdminID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tbladminnotification`
--
ALTER TABLE `tbladminnotification`
  MODIFY `AdminNotificationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblarticle`
--
ALTER TABLE `tblarticle`
  MODIFY `ArticleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tblarticlexcomment`
--
ALTER TABLE `tblarticlexcomment`
  MODIFY `ArticleXCommentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tblarticlexlike`
--
ALTER TABLE `tblarticlexlike`
  MODIFY `ArticleXLikeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `tblarticlextag`
--
ALTER TABLE `tblarticlextag`
  MODIFY `ArticleXTagID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblcategory`
--
ALTER TABLE `tblcategory`
  MODIFY `CategoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblchallenge`
--
ALTER TABLE `tblchallenge`
  MODIFY `ChallengeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tblchapter`
--
ALTER TABLE `tblchapter`
  MODIFY `ChapterID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tblcourse`
--
ALTER TABLE `tblcourse`
  MODIFY `CourseID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tblfollow`
--
ALTER TABLE `tblfollow`
  MODIFY `FollowID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `tblforuma`
--
ALTER TABLE `tblforuma`
  MODIFY `ForumAID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `tblforumaxvote`
--
ALTER TABLE `tblforumaxvote`
  MODIFY `ForumAXVoteID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT for table `tblforumq`
--
ALTER TABLE `tblforumq`
  MODIFY `ForumQID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tblforumqxtag`
--
ALTER TABLE `tblforumqxtag`
  MODIFY `ForumQXTagID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblforumqxvote`
--
ALTER TABLE `tblforumqxvote`
  MODIFY `ForumQXVoteID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `tblpoll`
--
ALTER TABLE `tblpoll`
  MODIFY `PollID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tblpollxanswer`
--
ALTER TABLE `tblpollxanswer`
  MODIFY `PollXAnswerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `tblpollxoption`
--
ALTER TABLE `tblpollxoption`
  MODIFY `PollXOptionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `tblquestion`
--
ALTER TABLE `tblquestion`
  MODIFY `QuestionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tblquestionxanswer`
--
ALTER TABLE `tblquestionxanswer`
  MODIFY `QuestionXAnswerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `tblquestionxoption`
--
ALTER TABLE `tblquestionxoption`
  MODIFY `QuestionXOptionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `tblsection`
--
ALTER TABLE `tblsection`
  MODIFY `SectionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT for table `tblsitereport`
--
ALTER TABLE `tblsitereport`
  MODIFY `SiteReportID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbltag`
--
ALTER TABLE `tbltag`
  MODIFY `TagID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbluser`
--
ALTER TABLE `tbluser`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `tblusernotification`
--
ALTER TABLE `tblusernotification`
  MODIFY `NotificationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
