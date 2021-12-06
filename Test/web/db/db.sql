-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.5.14


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema userdb
--

CREATE DATABASE IF NOT EXISTS userdb;
USE userdb;

--
-- Definition of table `tb_users`
--

DROP TABLE IF EXISTS `tb_users`;
CREATE TABLE `tb_users` (
  `fd_username` varchar(20) NOT NULL COMMENT '用户名',
  `fd_password` varchar(20) NOT NULL COMMENT '密码',
  `fd_usertype` varchar(20) NOT NULL COMMENT '用户类型',
  `fd_gender` varchar(20) DEFAULT NULL COMMENT '性别',
  `fd_hobby` varchar(100) DEFAULT NULL COMMENT '爱好',
  `fd_birthdate` varchar(20) DEFAULT NULL COMMENT '出生日期',
  `fd_email` varchar(100) DEFAULT NULL COMMENT '电子邮箱',
  `fd_introduction` varchar(150) DEFAULT NULL COMMENT '自我介绍',
  PRIMARY KEY (`fd_username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_users`
--

/*!40000 ALTER TABLE `tb_users` DISABLE KEYS */;
INSERT INTO `tb_users` (`fd_username`,`fd_password`,`fd_usertype`,`fd_gender`,`fd_hobby`,`fd_birthdate`,`fd_email`,`fd_introduction`) VALUES 
 ('Eric Liang','eric.liang','管理员','男',' 阅读 运动','2015-01-02','eric.liang@henu.edu.cn','Eric来自河南大学。'),
 ('Frank Liu','abc,123','普通用户','男',' 阅读 运动','2015-08-04','frank@sina.com.cn','frank是一名工程师。'),
 ('Jeff Li','abc,123','普通用户','男',' 阅读 音乐 运动','2015-08-06','jeff.li@henu.edu.cn','jeff是一名河南大学的学生。'),
 ('Jessie Wang','jessie.wang','普通用户','女',' 阅读 音乐','2015-08-03','jessie@henu.edu.cn','jessie学习软件工程专业。'),
 ('liang','password','1','男','hobby','birthdate','email','introduction'),
 ('username','password','1','男','hobby','birthdate','email','introduction');
/*!40000 ALTER TABLE `tb_users` ENABLE KEYS */;


--
-- Definition of procedure `sp_SearchUser`
--

DROP PROCEDURE IF EXISTS `sp_SearchUser`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_SearchUser`(IN SP_NAME VARCHAR(20))
BEGIN
 select * from tb_users where fd_username = SP_NAME;
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
