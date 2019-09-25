/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : letotrans

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2019-09-25 18:12:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tbl_album
-- ----------------------------
DROP TABLE IF EXISTS `tbl_album`;
CREATE TABLE `tbl_album` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT NULL,
  `code` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thumb` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `intro` text COLLATE utf8_unicode_ci NOT NULL,
  `cdate` datetime NOT NULL,
  `visited` int(11) DEFAULT '0',
  `order` tinyint(5) DEFAULT NULL,
  `isactive` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_album
-- ----------------------------
INSERT INTO `tbl_album` VALUES ('1', '0', 'thu-vien-anh', '', 'Thư viện ảnh', '', '2019-07-14 17:27:09', '5', null, '1');

-- ----------------------------
-- Table structure for tbl_boxes
-- ----------------------------
DROP TABLE IF EXISTS `tbl_boxes`;
CREATE TABLE `tbl_boxes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL DEFAULT '0',
  `type` int(11) DEFAULT NULL COMMENT 'inbox=1 | outbox=2 | draft=0 | trash=-1',
  `from` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `to` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bcc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci,
  `encoding` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `subject_encoding` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `size` double DEFAULT NULL COMMENT 'Dung lượng',
  `attachment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Đính kèm',
  `priority` int(11) DEFAULT NULL COMMENT 'Mức độ ưu tiên',
  `viewed` int(11) DEFAULT '0' COMMENT 'not view = 0 | viewed = 1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_boxes
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_categories
-- ----------------------------
DROP TABLE IF EXISTS `tbl_categories`;
CREATE TABLE `tbl_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `par_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thumb` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `intro` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `order` int(11) DEFAULT '0',
  `lag_id` int(11) DEFAULT '0',
  `isactive` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_categories
-- ----------------------------
INSERT INTO `tbl_categories` VALUES ('1', '0', 'Câu hỏi thường gặp', 'cau-hoi-thuong-gap', '', '', '0', '0', '1');
INSERT INTO `tbl_categories` VALUES ('2', '1', 'Câu hỏi tổng quan', 'cau-hoi-tong-quan', '', '', '0', '0', '1');
INSERT INTO `tbl_categories` VALUES ('3', '1', 'Câu hỏi về phiên dịch viên', 'cau-hoi-ve-phien-dich-vien', '', '', '0', '0', '1');
INSERT INTO `tbl_categories` VALUES ('4', '1', 'Câu hỏi về phí dịch vụ', 'cau-hoi-ve-phi-dich-vu', '', '', '0', '0', '1');

-- ----------------------------
-- Table structure for tbl_configsite
-- ----------------------------
DROP TABLE IF EXISTS `tbl_configsite`;
CREATE TABLE `tbl_configsite` (
  `config_id` int(11) NOT NULL AUTO_INCREMENT,
  `tem_id` int(11) DEFAULT NULL,
  `company_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `intro` longtext COLLATE utf8_unicode_ci,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tel` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `fax` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `banner` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo` text COLLATE utf8_unicode_ci,
  `work_time` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keyword` longtext COLLATE utf8_unicode_ci,
  `meta_descript` longtext COLLATE utf8_unicode_ci,
  `lang_id` int(11) NOT NULL DEFAULT '0',
  `contact` text COLLATE utf8_unicode_ci NOT NULL,
  `footer` text COLLATE utf8_unicode_ci NOT NULL,
  `nick_yahoo` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name_yahoo` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `skype1` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  `skype2` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  `twitter` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `gplus` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `facebook` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `youtube` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_configsite
-- ----------------------------
INSERT INTO `tbl_configsite` VALUES ('1', '0', 'Mua bán nhà đất 24h', 'Mua bán nhà đất 24h', '', 'Số 563 đường Phúc Diễn, Xuân Phương, Nam Từ Liêm, Hà Nội', '0968.87.87.68 - 0964.10.4444', '0968.87.87.68 - 0964.10.4444', '', 'thuynguyen2607@gmail.com', '', '', '', '8:00 - 17:30, Thứ Hai - Chủ Nhật <br>Nghỉ lễ theo lịch của nhà nước', 'nha, dat, mua, ban, thuê, nhà đất, 24h, mua bán, tin nhà đất, bat dong san, bất động sản, cho thuê, rao vặt', 'Mua bán nhà đất 24h. Thông tin mua bán nhà đất, cho thuê nhà đất, Thông tin dự án bất động sản tại Việt Nam, đăng tin quảng cáo nhà đất hiệu quả', '0', '', '', '', '', '', '', 'https://twitter.com/', 'https://plus.google.com/?hl=vi', 'https://www.facebook.com/', 'https://www.youtube.com/');

-- ----------------------------
-- Table structure for tbl_contact
-- ----------------------------
DROP TABLE IF EXISTS `tbl_contact`;
CREATE TABLE `tbl_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tittle` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contents` text COLLATE utf8_unicode_ci,
  `cdate` int(11) DEFAULT NULL,
  `isactive` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_contact
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_contents
-- ----------------------------
DROP TABLE IF EXISTS `tbl_contents`;
CREATE TABLE `tbl_contents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `thumb` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `images` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sapo` text COLLATE utf8_unicode_ci,
  `intro` text COLLATE utf8_unicode_ci,
  `fulltext` longtext COLLATE utf8_unicode_ci,
  `type_of_land_id` int(11) DEFAULT NULL,
  `area` float DEFAULT NULL,
  `price` float DEFAULT NULL,
  `list_conid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `list_tagid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `author` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cdate` int(11) DEFAULT NULL,
  `mdate` int(11) DEFAULT NULL,
  `visited` int(11) DEFAULT '0',
  `order` int(4) DEFAULT '0',
  `ispay` tinyint(4) DEFAULT '1',
  `ishot` tinyint(4) DEFAULT '0',
  `isactive` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_contents
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_document
-- ----------------------------
DROP TABLE IF EXISTS `tbl_document`;
CREATE TABLE `tbl_document` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `g_id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `intro` text COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `thumb` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fullurl` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `author` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `filetype` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `filesize` int(11) NOT NULL,
  `date_issued` datetime DEFAULT NULL,
  `cdate` datetime NOT NULL,
  `mdate` datetime DEFAULT NULL,
  `pages` int(11) NOT NULL,
  `views` int(11) NOT NULL DEFAULT '0',
  `downloads` int(11) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ishot` int(11) DEFAULT NULL,
  `isactive` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`,`views`),
  FULLTEXT KEY `idx` (`name`,`intro`,`content`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_document
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_document_group
-- ----------------------------
DROP TABLE IF EXISTS `tbl_document_group`;
CREATE TABLE `tbl_document_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `par_id` int(11) DEFAULT '0',
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `thumb` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `banner` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '0',
  `isactive` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_document_group
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_feedback
-- ----------------------------
DROP TABLE IF EXISTS `tbl_feedback`;
CREATE TABLE `tbl_feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `career` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `order` int(4) DEFAULT NULL,
  `isactive` tinyint(2) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_feedback
-- ----------------------------
INSERT INTO `tbl_feedback` VALUES ('1', 'Layla', 'http://localhost/letotrans/images/hinh-anh/avata-1.jpg', 'Tôi thật sự bị ấn tượng bởi sự nhiệt tình và chu đáo dành cho khách hàng ở đây. Không chỉ chuyên sửa Lexus uy tín, mà chất lượng phục vụ cũng rất tốt. Dịch vụ ở đây hoàn toàn thuyết phục', 'Doanh nhân', '1', '1');
INSERT INTO `tbl_feedback` VALUES ('2', 'DAVID MATIN', 'http://localhost/letotrans/images/hinh-anh/avata-1.jpg', 'Tôi hài lòng về dịch vụ bảo hành ở đây, các kỹ sư sau khi sửa ô tô Lexus còn gọi điện chăm sóc và hỏi thăm tình trạng ô tô sau khi sửa chữa. Dịch vụ ở đây hoàn toàn thuyết phục một khách hàng khó tính như tôi', 'Student', '0', '1');
INSERT INTO `tbl_feedback` VALUES ('3', 'Võ Văn Vẻ', 'http://localhost/mydinhTHC/images/hinh-anh/avata-1.jpg', 'Tôi hài lòng về dịch vụ bảo hành ở đây, các kỹ sư sau khi sửa ô tô Lexus còn gọi điện chăm sóc và hỏi thăm tình trạng ô tô sau khi sửa chữa. Dịch vụ ở đây hoàn toàn thuyết phục một khách hàng khó tính như tôi', 'Nhân viên văn phòng', null, '1');
INSERT INTO `tbl_feedback` VALUES ('4', 'Hoàng Rapper', 'http://localhost/mydinhTHC/images/hinh-anh/avata-1.jpg', 'Tôi hài lòng về dịch vụ bảo hành ở đây, các kỹ sư sau khi sửa ô tô Lexus còn gọi điện chăm sóc và hỏi thăm tình trạng ô tô sau khi sửa chữa. Dịch vụ ở đây hoàn toàn thuyết phục một khách hàng khó tính như tôi', 'Nhân viên văn phòng', null, '1');

-- ----------------------------
-- Table structure for tbl_gallery
-- ----------------------------
DROP TABLE IF EXISTS `tbl_gallery`;
CREATE TABLE `tbl_gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `album_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `isactive` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_gallery
-- ----------------------------
INSERT INTO `tbl_gallery` VALUES ('1', '8', 'hinh-anh-1', 'http://localhost/letotrans/images/gallery/bd5.jpg', '1');
INSERT INTO `tbl_gallery` VALUES ('2', '8', 'hinh-anh-2', 'http://localhost/letotrans/images/gallery/bd6.jpg', '1');
INSERT INTO `tbl_gallery` VALUES ('3', '8', 'hinh-anh-3', 'http://localhost/letotrans/images/gallery/bd7.jpg', '1');
INSERT INTO `tbl_gallery` VALUES ('4', '8', 'hinh-anh-4', 'http://localhost/letotrans/images/gallery/bd8.jpg', '1');
INSERT INTO `tbl_gallery` VALUES ('5', '8', 'hinh-anh-5', 'http://localhost/letotrans/images/gallery/bd1.jpg', '1');
INSERT INTO `tbl_gallery` VALUES ('6', '8', 'hinh-anh-6', 'http://localhost/letotrans/images/gallery/bd2.jpg', '1');
INSERT INTO `tbl_gallery` VALUES ('7', '8', 'hinh-anh-7', 'http://localhost/letotrans/images/gallery/bd4.jpg', '1');
INSERT INTO `tbl_gallery` VALUES ('8', '8', 'ha1', 'http://localhost/letotrans/images/gallery/block-4-img-5.jpg', '1');
INSERT INTO `tbl_gallery` VALUES ('9', '8', 'ha2', 'http://localhost/letotrans/images/gallery/block-4-img-6.jpg', '1');
INSERT INTO `tbl_gallery` VALUES ('10', '8', 'ha3', 'http://localhost/letotrans/images/gallery/block-4-img-7.jpg', '1');
INSERT INTO `tbl_gallery` VALUES ('11', '8', 'ha4', 'http://localhost/letotrans/images/gallery/block-4-img-8.jpg', '1');

-- ----------------------------
-- Table structure for tbl_mail_config
-- ----------------------------
DROP TABLE IF EXISTS `tbl_mail_config`;
CREATE TABLE `tbl_mail_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `hostname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pass` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `port` int(11) NOT NULL DEFAULT '110',
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_mail_config
-- ----------------------------
INSERT INTO `tbl_mail_config` VALUES ('1', 'admin', 'yourdomain.com', 'info@yourdomain.com', '123456', '465', 'YOURDOMAIN.COM');

-- ----------------------------
-- Table structure for tbl_menus
-- ----------------------------
DROP TABLE IF EXISTS `tbl_menus`;
CREATE TABLE `tbl_menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `desc` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `isactive` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_menus
-- ----------------------------
INSERT INTO `tbl_menus` VALUES ('1', 'Main menu', 'main-menu', '', '1');
INSERT INTO `tbl_menus` VALUES ('2', 'Menu Footer', 'Menu-footer', '', '1');
INSERT INTO `tbl_menus` VALUES ('3', 'Menu footer 2', 'menu-footer-2', '', '1');

-- ----------------------------
-- Table structure for tbl_mnuitems
-- ----------------------------
DROP TABLE IF EXISTS `tbl_mnuitems`;
CREATE TABLE `tbl_mnuitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `par_id` int(11) NOT NULL DEFAULT '0',
  `menu_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` text COLLATE utf8_unicode_ci,
  `viewtype` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `category_id` int(11) NOT NULL DEFAULT '0',
  `content_id` int(11) NOT NULL DEFAULT '0',
  `link` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `class` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '0',
  `isactive` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_mnuitems
-- ----------------------------
INSERT INTO `tbl_mnuitems` VALUES ('1', '0', '1', 'Trang chủ', 'trang-chu', '', 'link', '0', '0', 'http://localhost/letotrans/', 'fa fa-home', 'home', '0', '1');
INSERT INTO `tbl_mnuitems` VALUES ('2', '2', '1', 'Giới thiệu', 'gioi-thieu', '<img src=\"http://daihocdongdo.edu.vn/images/DD.jpg\" alt=\"\" align=\"\" border=\"0px\">', 'block', '44', '0', '', '', '', '0', '1');
INSERT INTO `tbl_mnuitems` VALUES ('3', '0', '1', 'TP Hòa Bình', 'tp-hoa-binh', '', 'block', '2', '0', '', '', '', '1', '1');
INSERT INTO `tbl_mnuitems` VALUES ('4', '0', '1', 'TP Hà Nội', 'tp-ha-noi', '', 'block', '60', '0', '', '', '', '2', '1');
INSERT INTO `tbl_mnuitems` VALUES ('5', '0', '1', 'Tin tức', 'tin-tuc', null, 'block', '2', '0', '', '', '', '0', '1');
INSERT INTO `tbl_mnuitems` VALUES ('7', '0', '1', 'FAQ', 'faq', '', 'block', '60', '0', '', '', '', '19', '1');
INSERT INTO `tbl_mnuitems` VALUES ('10', '0', '3', 'FAQs', 'faqs', null, 'link', '0', '0', '#', '', '', '0', '1');
INSERT INTO `tbl_mnuitems` VALUES ('11', '0', '3', 'Liên hệ', 'lien-he', null, 'link', '0', '0', '#', '', '', '0', '1');
INSERT INTO `tbl_mnuitems` VALUES ('15', '0', '2', 'Câu hỏi thường gặp', 'cau-hoi-thuong-gap', '', 'block', '1', '0', '', '', '', '0', '1');
INSERT INTO `tbl_mnuitems` VALUES ('16', '0', '2', 'Hướng dẫn đặt dịch vụ', 'huong-dan-dat-dich-vu', '', 'link', '0', '0', '#', '', '', '0', '1');
INSERT INTO `tbl_mnuitems` VALUES ('17', '0', '2', 'Chính sách giao hàng', 'chinh-sach-giao-hang', '', 'link', '0', '0', '#', '', '', '0', '1');
INSERT INTO `tbl_mnuitems` VALUES ('18', '0', '2', 'Chính sách bảo hành', 'chinh-sach-bao-hanh', '', 'link', '0', '0', '#', '', '', '0', '1');
INSERT INTO `tbl_mnuitems` VALUES ('19', '0', '2', 'Thông tin chuyển khoản', 'thong-tin-chuyen-khoan', '', 'link', '0', '0', '#', '', '', '0', '1');
INSERT INTO `tbl_mnuitems` VALUES ('20', '0', '2', 'Tư vấn khách hàng', 'tu-van-khach-hang', '', 'link', '0', '0', '#', '', '', '0', '1');

-- ----------------------------
-- Table structure for tbl_modtype
-- ----------------------------
DROP TABLE IF EXISTS `tbl_modtype`;
CREATE TABLE `tbl_modtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_modtype
-- ----------------------------
INSERT INTO `tbl_modtype` VALUES ('1', 'mainmenu', 'Main menu');
INSERT INTO `tbl_modtype` VALUES ('2', 'html', 'HTML');
INSERT INTO `tbl_modtype` VALUES ('3', 'news', 'Tin tức');
INSERT INTO `tbl_modtype` VALUES ('12', 'slide', 'Slideshow');
INSERT INTO `tbl_modtype` VALUES ('13', 'video', 'Tin Video');
INSERT INTO `tbl_modtype` VALUES ('14', 'gallery', 'Tin ảnh');
INSERT INTO `tbl_modtype` VALUES ('15', 'partner', 'Đối tác');
INSERT INTO `tbl_modtype` VALUES ('16', 'content', 'Bài viết');

-- ----------------------------
-- Table structure for tbl_modules
-- ----------------------------
DROP TABLE IF EXISTS `tbl_modules`;
CREATE TABLE `tbl_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `intro` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `viewtitle` int(11) NOT NULL DEFAULT '0',
  `menu_id` int(11) DEFAULT NULL,
  `menu_ids` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_id` int(50) DEFAULT NULL,
  `content_id` int(50) DEFAULT NULL,
  `theme` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `class` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '0',
  `isactive` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=78 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_modules
-- ----------------------------
INSERT INTO `tbl_modules` VALUES ('2', 'mainmenu', 'Main menu', '', '', '0', '1', '', '0', null, '', 'navitor', '', '0', '1');
INSERT INTO `tbl_modules` VALUES ('54', 'html', 'Sửa chữa thành công', '', '<div class=\"circle\"><div><img src=\"http://localhost/letotrans/images/icons/icon_car.png\" alt=\"\" align=\"\" border=\"0\"></div><div class=\"count\">850</div></div><div class=\"title\">Sửa chữa thành công</div>', '0', '0', null, '0', null, '', 'box4', '', '0', '1');
INSERT INTO `tbl_modules` VALUES ('55', 'news', 'Dịch vụ của chúng tôi', '', '', '1', '0', null, '59', null, 'branch', 'box5', '', '0', '1');
INSERT INTO `tbl_modules` VALUES ('15', 'html', 'Logo', '', '<img src=\"http://localhost/letotrans/images/logo/logo_mydinh_thc.png\" class=\"img-responsive\">', '0', '0', '', '0', null, '', 'user1', 'logo', '1', '1');
INSERT INTO `tbl_modules` VALUES ('51', 'html', 'Dịch vụ phương tiện', '', '<div class=\"circle\"><div><img src=\"http://localhost/letotrans/images/icons/icon_car.png\" alt=\"\" align=\"\" border=\"0\"></div><div class=\"count\">850</div></div><div class=\"title\">Dịch vụ phương tiện</div>', '0', '0', null, '0', null, '', 'box1', '', '0', '1');
INSERT INTO `tbl_modules` VALUES ('52', 'html', 'Chuyên gia của chúng tôi', '', '<div class=\"circle\"><div><img src=\"http://localhost/letotrans/images/icons/icon_user.png\" alt=\"\" align=\"\" border=\"0\"></div><div class=\"count\">250</div></div><div class=\"title\">Chuyên gia của chúng tôi</div>', '0', '0', null, '0', null, '', 'box2', '', '0', '1');
INSERT INTO `tbl_modules` VALUES ('53', 'html', 'Khách hàng hài lòng', '', '<div class=\"circle\"><div><img src=\"http://localhost/letotrans/images/icons/icon_customer.png\" alt=\"\" align=\"\" border=\"0\"></div><div class=\"count\">1500</div></div><div class=\"title\">Khách hàng hài lòng</div>', '0', '0', null, '0', null, '', 'box3', '', '0', '1');
INSERT INTO `tbl_modules` VALUES ('44', 'html', 'Logo trên di động', '', '<img src=\"http://daihocdongdo.edu.vn/images/logo-mobile.jpg\" class=\"img-responsive\">', '0', '0', null, '0', null, '', 'mobile1', '', '0', '1');
INSERT INTO `tbl_modules` VALUES ('50', 'html', 'Video giới thiệu', '', '<iframe width=\"560\" height=\"320\" src=\"https://www.youtube.com/embed/G3Qih-C6xEw\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen=\"\"></iframe>', '0', '0', null, '0', null, '', 'user6', 'video', '0', '1');
INSERT INTO `tbl_modules` VALUES ('21', 'html', 'Copyright', '', '<p>Bản quyền thuộc về Leto Trans</p>', '0', '0', null, '0', '0', '', 'bottom', '', '0', '1');
INSERT INTO `tbl_modules` VALUES ('47', 'html', 'Hotline (Đầu trang)', '', '096.410.4444<div>096.887.8768</div>', '0', '0', null, '0', null, '', 'user4', 'pull-right', '0', '1');
INSERT INTO `tbl_modules` VALUES ('48', 'slide', 'Banner slideshow', '', '', '0', '0', null, '0', null, '', 'banner', '', '0', '1');
INSERT INTO `tbl_modules` VALUES ('49', 'content', 'Mỹ Đình THC Kính chào Quý khách!', '', '', '0', '0', null, '0', '2', 'default', 'user5', '', '0', '1');
INSERT INTO `tbl_modules` VALUES ('46', 'html', 'Giờ làm việc (Đầu trang)', '', '<span style=\"font-weight: bold;\">Giờ làm việc</span><div>T2-T7: 8h00 - 17h00</div>', '0', '0', null, '0', null, '', 'user3', '', '0', '1');
INSERT INTO `tbl_modules` VALUES ('45', 'html', 'Địa chỉ (Đầu trang)', '', '<span style=\"font-weight: bold;\">430 &amp; 563 Đ.Phúc Diễn,</span><div>P.Xuân Phương, Q.Nam Từ Liêm, Hà Nội</div>', '0', '0', null, '0', null, '', 'user2', '', '2', '1');
INSERT INTO `tbl_modules` VALUES ('43', 'html', 'Thông tin liên hệ - Trang liên hệ', '', '<div><span style=\"font-size: 24px;\">THC AUTO SERVICE</span></div><div><br></div><div><div>XƯỞNG DỊCH VỤ 1:</div><div>430 đường Phúc Diễm, Xuân Phương, Nam Từ Liêm, HN</div><div><br></div><div>XƯỞNG DỊCH VỤ 2:</div><div>563 đường Phúc Diễm, Xuân Phương, Nam Từ Liêm, HN</div><div><br></div><div>HOTLINE:</div><div>0968.87.87.68 - 0964.10.4444 (Hỗ trợ 24/7)</div><div><br></div><div>EMAIL:</div><div>otomydinhthc@gmail.com</div></div>', '0', '0', null, '0', null, '', 'user9', '', '0', '1');
INSERT INTO `tbl_modules` VALUES ('56', 'gallery', 'Hình ảnh tại Mĩ Đình THC', '', '', '0', '0', null, '0', null, '', 'box6', '', '0', '1');
INSERT INTO `tbl_modules` VALUES ('58', 'news', 'Footer dịch vụ', '', '', '0', '0', null, '59', null, 'footer_dich_vu', 'box8', '', '0', '1');
INSERT INTO `tbl_modules` VALUES ('59', 'html', 'Footer liên hệ', '', '<div>&lt;div class=\"title\"&gt;Liên hệ&lt;/div&gt;</div><div><span style=\"white-space:pre\"></span>&lt;div class=\"dlab-separator-outer m-b10\"&gt;</div><div><span style=\"white-space:pre\"></span>&lt;div class=\"dlab-separator style-skew\"&gt;&lt;/div&gt;</div><div><span style=\"white-space:pre\"></span>&lt;/div&gt;</div><div><span style=\"white-space:pre\"></span>&lt;div class=\"sub_item\"&gt;</div><div><span style=\"white-space:pre\"></span>&lt;i class=\"fa fa-map-marker\" aria-hidden=\"true\"&gt;&lt;/i&gt;</div><div><span style=\"white-space:pre\"></span>&lt;div class=\"content\"&gt;</div><div><span style=\"white-space:pre\"></span>&lt;div class=\"name\"&gt;Xưởng dịch vụ 1:&lt;/div&gt;</div><div><span style=\"white-space:pre\"></span>&lt;p class=\"info\"&gt;430 đường Phúc Diễn, Xuân Phương, Nam Từ Liêm, HN&lt;/p&gt;</div><div><span style=\"white-space:pre\"></span>&lt;/div&gt;</div><div><span style=\"white-space:pre\"></span>&lt;/div&gt;</div><div><span style=\"white-space:pre\"></span>&lt;div class=\"sub_item\"&gt;</div><div><span style=\"white-space:pre\"></span>&lt;i class=\"fa fa-map-marker\" aria-hidden=\"true\"&gt;&lt;/i&gt;</div><div><span style=\"white-space:pre\"></span>&lt;div class=\"content\"&gt;</div><div><span style=\"white-space:pre\"></span>&lt;div class=\"name\"&gt;Xưởng dịch vụ 2:&lt;/div&gt;</div><div><span style=\"white-space:pre\"></span>&lt;p class=\"info\"&gt;563 đường Phúc Diễn, Xuân Phương, Nam Từ Liêm, HN&lt;/p&gt;</div><div><span style=\"white-space:pre\"></span>&lt;/div&gt;</div><div><span style=\"white-space:pre\"></span>&lt;/div&gt;</div><div><span style=\"white-space:pre\"></span>&lt;div class=\"sub_item\"&gt;</div><div><span style=\"white-space:pre\"></span>&lt;i class=\"fa fa-mobile\" aria-hidden=\"true\"&gt;&lt;/i&gt;</div><div><span style=\"white-space:pre\"></span>&lt;div class=\"content\"&gt;</div><div><span style=\"white-space:pre\"></span>&lt;div class=\"name phone\"&gt;HOTLINE:&lt;/div&gt;</div><div><span style=\"white-space:pre\"></span>&lt;p class=\"info\"&gt;0968.87.87.68 - 0964.10.4444 (Hỗ trợ 24/7)&lt;/p&gt;</div><div><span style=\"white-space:pre\"></span>&lt;/div&gt;</div><div><span style=\"white-space:pre\"></span>&lt;/div&gt;</div><div><span style=\"white-space:pre\"></span>&lt;div class=\"sub_item\"&gt;</div><div><span style=\"white-space:pre\"></span>&lt;i class=\"fa fa-mobile\" aria-hidden=\"true\"&gt;&lt;/i&gt;</div><div><span style=\"white-space:pre\"></span>&lt;div class=\"content\"&gt;</div><div><span style=\"white-space:pre\"></span>&lt;div class=\"name phone\"&gt;EMAIL:&lt;/div&gt;</div><div><span style=\"white-space:pre\"></span>&lt;p class=\"info\"&gt;otomydinhthc@gmail.com&lt;/p&gt;</div><div><span style=\"white-space:pre\"></span>&lt;/div&gt;</div><div><span style=\"white-space:pre\"></span>&lt;/div&gt;</div>', '0', '0', null, '0', null, '', 'box9', '', '0', '0');
INSERT INTO `tbl_modules` VALUES ('64', 'html', 'Footer: Xưởng dịch vụ 1', '', '<div class=\"name\">Xưởng dịch vụ 1:</div><p class=\"info\">430 đường Phúc Diễn, Xuân Phương, Nam Từ Liêm, HN</p>', '0', '0', null, '0', null, '', 'footer1', '', '0', '1');
INSERT INTO `tbl_modules` VALUES ('65', 'html', 'Footer: Xưởng dịch vụ 2', '', '<div class=\"name\">Xưởng dịch vụ 2:</div><p class=\"info\">563 đường Phúc Diễn, Xuân Phương, Nam Từ Liêm, HN</p>', '0', '0', null, '0', null, '', 'footer2', '', '0', '1');
INSERT INTO `tbl_modules` VALUES ('66', 'html', 'Footer: hotline', '', '<div class=\"name phone\">HOTLINE:</div><p class=\"info\">0968.87.87.68 - 0964.10.4444 (Hỗ trợ 24/7)</p>', '0', '0', null, '0', null, '', 'footer3', '', '0', '1');
INSERT INTO `tbl_modules` VALUES ('67', 'html', 'Footer: Email', '', '<div class=\"name phone\">EMAIL:</div><p class=\"info\"><a href=\"mailto:otomydinhthc@gmail.com\">otomydinhthc@gmail.com</a></p>', '0', '0', null, '0', null, '', 'footer4', '', '0', '1');
INSERT INTO `tbl_modules` VALUES ('68', 'html', 'Footer: THC AUTO SERVICE', '', '<div class=\"title_auto_service\">THC AUTO SERVICE</div><div class=\"intro\">Mang đến cho Khách hàng sự hài lòng về chất lượng dịch vụ HƠN CẢ MONG ĐỢI</div>', '0', '0', null, '0', null, '', 'footer5', '', '0', '1');
INSERT INTO `tbl_modules` VALUES ('61', 'partner', 'Slide đối tác', '', '', '0', '0', null, '0', null, '', 'user7', '', '0', '1');
INSERT INTO `tbl_modules` VALUES ('62', 'news', 'Tin tức tại THC', '', '', '0', '0', null, '2', null, 'news1', 'user8', '', '0', '1');
INSERT INTO `tbl_modules` VALUES ('63', 'news', 'Tư vấn / Đặt lịch', '', '', '0', '0', null, '2', '0', 'events', 'banner1', '', '0', '1');
INSERT INTO `tbl_modules` VALUES ('75', 'html', 'Google map', '', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3723.7415077264172!2d105.81414881533225!3d21.04302649266612!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135ab10301dd91f%3A0x7bf7f7b69c64e61f!2sHCMCC%20Tower!5e0!3m2!1svi!2s!4v1569397961209!5m2!1svi!2s\" width=\"100%\" frameborder=\"0\" style=\"border:0;\" allowfullscreen=\"\"></iframe>', '0', '0', null, '0', '0', '', 'box10', '', '0', '1');
INSERT INTO `tbl_modules` VALUES ('76', 'mainmenu', 'Menu footer', '', '', '0', '2', null, '0', '0', 'menu_footer', 'box11', '', '0', '1');
INSERT INTO `tbl_modules` VALUES ('77', 'mainmenu', 'Footer menu 2', '', '', '0', '3', null, '0', '0', 'menu_footer', 'box7', '', '0', '1');

-- ----------------------------
-- Table structure for tbl_package
-- ----------------------------
DROP TABLE IF EXISTS `tbl_package`;
CREATE TABLE `tbl_package` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `intro` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `order` int(11) DEFAULT '0',
  `isactive` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_package
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_partner
-- ----------------------------
DROP TABLE IF EXISTS `tbl_partner`;
CREATE TABLE `tbl_partner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `images` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `order` tinyint(4) DEFAULT NULL,
  `isactive` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_partner
-- ----------------------------
INSERT INTO `tbl_partner` VALUES ('1', 'Đối t&aacute;c 1', 'http://localhost/letotrans/images/hinh-anh/logo1.jpg', '', '1', '1');
INSERT INTO `tbl_partner` VALUES ('2', 'Đối t&aacute;c 2', 'http://localhost/letotrans/images/hinh-anh/logo2.jpg', '', '2', '1');
INSERT INTO `tbl_partner` VALUES ('3', 'Đối t&aacute;c 3', 'http://localhost/letotrans/images/hinh-anh/logo3.jpg', '', '3', '1');
INSERT INTO `tbl_partner` VALUES ('4', 'Đối t&aacute;c 4', 'http://localhost/letotrans/images/hinh-anh/logo4.jpg', '', '4', '1');
INSERT INTO `tbl_partner` VALUES ('5', 'Đối t&aacute;c 5', 'http://localhost/letotrans/images/hinh-anh/logo1.jpg', '', '5', '1');

-- ----------------------------
-- Table structure for tbl_personnel
-- ----------------------------
DROP TABLE IF EXISTS `tbl_personnel`;
CREATE TABLE `tbl_personnel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `order` tinyint(4) DEFAULT NULL,
  `isactive` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_personnel
-- ----------------------------
INSERT INTO `tbl_personnel` VALUES ('1', 'Benson Casero', 'http://localhost/letotrans/images/nhan-su/ns1.jpg', 'Tổng giám đốc', '1', '1');
INSERT INTO `tbl_personnel` VALUES ('2', 'Nguyễn Thanh Hải', 'http://localhost/letotrans/images/nhan-su/ns4.jpg', 'Trưởng phòng kinh doanh', '2', '1');
INSERT INTO `tbl_personnel` VALUES ('3', 'Trần Quốc Chí', 'http://localhost/letotrans/images/nhan-su/ns3.jpg', 'Phó tổng giám đốc', '3', '1');
INSERT INTO `tbl_personnel` VALUES ('4', 'Võ Chí Công', 'http://localhost/letotrans/images/nhan-su/ns4.jpg', 'Trưởng phòng kỹ thuật', '4', '1');
INSERT INTO `tbl_personnel` VALUES ('5', 'Nguyễn Thị Thủy', 'http://localhost/letotrans/images/nhan-su/ns5.jpg', 'Nhân viên kinh doanh', '5', '1');
INSERT INTO `tbl_personnel` VALUES ('6', 'Nguyễn Hồng', 'http://localhost/letotrans/images/nhan-su/ns6.jpg', 'Nhân viên kinh doanh', '6', '1');

-- ----------------------------
-- Table structure for tbl_schedule
-- ----------------------------
DROP TABLE IF EXISTS `tbl_schedule`;
CREATE TABLE `tbl_schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `isactive` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_schedule
-- ----------------------------
INSERT INTO `tbl_schedule` VALUES ('1', 'Nguyễn Văn Nam1', '59', 'abc@gmail.com1', '09695499991', '2019-08-24 00:00:00', 'hehehihi111', 'hihihehe111', '1');
INSERT INTO `tbl_schedule` VALUES ('2', 'DAVID MATIN', '7', 'abc@gmail.com1', '09695499991', '2019-08-03 00:00:00', 'hihihehe', 'hihihaha', '1');
INSERT INTO `tbl_schedule` VALUES ('3', 'DAVID MATIN', '7', 'abc@gmail.com1', '09695499991', '2019-08-03 00:00:00', 'hihihehe', 'hihihaha', '1');
INSERT INTO `tbl_schedule` VALUES ('4', 'Nguyễn Thị Ly', '6', 'abc@gmail.com', '0969548888', '2019-08-02 00:00:00', 'hihihehe', 'hihihaha', '1');
INSERT INTO `tbl_schedule` VALUES ('5', 'Nguyễn Thị Ly', '6', 'abc@gmail.com', '0969548888', '2019-08-02 00:00:00', 'hihihehe', 'hihihaha', '1');
INSERT INTO `tbl_schedule` VALUES ('6', 'Đối tác 1', '0', '', '', '0000-00-00 00:00:00', '', '', '1');
INSERT INTO `tbl_schedule` VALUES ('7', 'DAVID MATIN', '8', 'abc@gmail.com1', '09695499991', '2019-07-19 00:00:00', 'hihihehe', 'hihihaha', '1');
INSERT INTO `tbl_schedule` VALUES ('8', 'DAVID MATIN', '13', 'abc@gmail.com1', '09695499991', '2019-08-02 00:00:00', '', '', '1');

-- ----------------------------
-- Table structure for tbl_seo
-- ----------------------------
DROP TABLE IF EXISTS `tbl_seo`;
CREATE TABLE `tbl_seo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `ishot` tinyint(4) DEFAULT '0',
  `order` tinyint(4) DEFAULT '0',
  `isactive` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_seo
-- ----------------------------
INSERT INTO `tbl_seo` VALUES ('1', 'Câu hỏi thường gặp', 'http://localhost/letotrans/cau-hoi-thuong-gap', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('2', 'Câu hỏi tổng quan', 'http://localhost/letotrans/cau-hoi-tong-quan', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('3', 'Câu hỏi về phiên dịch viên', 'http://localhost/letotrans/cau-hoi-ve-phien-dich-vien', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('4', 'Câu hỏi về phí dịch vụ', 'http://localhost/letotrans/cau-hoi-ve-phi-dich-vu', '', '', '', '', '0', '0', '1');

-- ----------------------------
-- Table structure for tbl_service
-- ----------------------------
DROP TABLE IF EXISTS `tbl_service`;
CREATE TABLE `tbl_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `par_id` int(11) DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `sapo` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `intro` text,
  `price` float DEFAULT NULL,
  `order` tinyint(4) DEFAULT '0',
  `isactive` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_service
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_service_detail
-- ----------------------------
DROP TABLE IF EXISTS `tbl_service_detail`;
CREATE TABLE `tbl_service_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) DEFAULT '0',
  `package_id` int(11) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `sapo` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `intro` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `fulltext` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `cdate` int(11) DEFAULT NULL,
  `mdate` int(11) DEFAULT NULL,
  `visited` int(255) DEFAULT NULL,
  `order` tinyint(4) DEFAULT '0',
  `isactive` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_service_detail
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_slider
-- ----------------------------
DROP TABLE IF EXISTS `tbl_slider`;
CREATE TABLE `tbl_slider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slogan` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL,
  `intro` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT '0',
  `thumb` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `isactive` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_slider
-- ----------------------------
INSERT INTO `tbl_slider` VALUES ('18', 'SỬA CHỮA PHỤC HỒI XE Ô TÔ', 'Đặt lịch hẹn Hôm nay <span style=\"color: rgb(250, 121, 1); font-weight: bold;\">GIẢM NGAY 15%</span><div><br><div><button class=\"btn btn-view\">ĐẶT LỊCH SỬA CHỮA</button></div></div>', '0', 'http://localhost/letotrans/images/banner/slide9.jpg', '', null, '1');
INSERT INTO `tbl_slider` VALUES ('19', 'SỬA CHỮA PHỤC HỒI XE Ô TÔ', 'Đặt lịch hẹn Hôm nay <span style=\"color: rgb(250, 121, 1); font-weight: bold;\">GIẢM NGAY 15%</span><div><br><div><button class=\"btn btn-view\">ĐẶT LỊCH SỬA CHỮA</button></div></div>', '0', 'http://localhost/letotrans/images/banner/slide10.jpg', '', null, '1');
INSERT INTO `tbl_slider` VALUES ('20', 'SỬA CHỮA PHỤC HỒI XE Ô TÔ', 'Đặt lịch hẹn Hôm nay <span style=\"color: rgb(250, 121, 1); font-weight: bold;\">GIẢM NGAY 15%</span><div><br><div><button class=\"btn btn-view\">ĐẶT LỊCH SỬA CHỮA</button></div></div>', '0', 'http://localhost/letotrans/images/banner/slide1.jpg', '', null, '1');

-- ----------------------------
-- Table structure for tbl_tags
-- ----------------------------
DROP TABLE IF EXISTS `tbl_tags`;
CREATE TABLE `tbl_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_desc` text,
  `pids` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_tags
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_type_of_land
-- ----------------------------
DROP TABLE IF EXISTS `tbl_type_of_land`;
CREATE TABLE `tbl_type_of_land` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `intro` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `ishot` tinyint(4) DEFAULT NULL,
  `order` tinyint(4) DEFAULT NULL,
  `isactive` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_type_of_land
-- ----------------------------
INSERT INTO `tbl_type_of_land` VALUES ('1', 'Đất trồng cây lâu năm', 'dat-trong-cay-lau-nam', '', null, null, '1');
INSERT INTO `tbl_type_of_land` VALUES ('2', 'Đất rừng phòng hộ', 'dat-rung-phong-ho', '', null, null, '1');
INSERT INTO `tbl_type_of_land` VALUES ('3', 'Đất rừng sản xuất', 'dat-rung-san-xuat', '', null, null, '1');
INSERT INTO `tbl_type_of_land` VALUES ('4', 'Đất rừng đặc dụng', 'dat-rung-dac-dung', '', null, null, '1');
INSERT INTO `tbl_type_of_land` VALUES ('5', 'Đất nuôi trồng thuỷ sản', 'dat-nuoi-trong-thuy-san', '', null, null, '1');
INSERT INTO `tbl_type_of_land` VALUES ('6', 'Đất ở gồm đất ở tại nông thôn, đất ở tại đô thị', 'dat-o-gom-dat-o-tai-nong-thon-dat-o-tai-do-thi', '', null, null, '1');
INSERT INTO `tbl_type_of_land` VALUES ('7', 'Đất xây dựng trụ sở cơ quan, xây dựng công trình sự nghiệp', 'dat-xay-dung-tru-so-co-quan-xay-dung-cong-trinh-su-nghiep', '', null, null, '1');
INSERT INTO `tbl_type_of_land` VALUES ('8', 'Đất sử dụng vào mục đích quốc phòng, an ninh', 'dat-su-dung-vao-muc-dich-quoc-phong-an-ninh', '', null, null, '1');
INSERT INTO `tbl_type_of_land` VALUES ('9', 'Đất sản xuất, kinh doanh phi nông nghiệp', 'dat-san-xuat-kinh-doanh-phi-nong-nghiep', '', null, null, '1');

-- ----------------------------
-- Table structure for tbl_user
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE `tbl_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `firstname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `birthday` date NOT NULL,
  `gender` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `mobile` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `identify` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `organ` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `joindate` datetime NOT NULL,
  `lastlogin` datetime NOT NULL,
  `gid` int(11) NOT NULL,
  `isroot` tinyint(4) DEFAULT NULL,
  `isactive` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_user
-- ----------------------------
INSERT INTO `tbl_user` VALUES ('1', 'igf', 'd93a5def7511da3d0f2d171d9c344e91', 'IGF', 'JSC', '0000-00-00', '', '', '', '', '', null, null, null, '0000-00-00 00:00:00', '2019-09-03 01:15:04', '1', null, '1');
INSERT INTO `tbl_user` VALUES ('2', 'admin', 'd93a5def7511da3d0f2d171d9c344e91', 'THC', 'Admin', '0000-00-00', '0', '', '123456789', '', 'a@gmail.com', null, '1111111111', '', '2019-07-23 17:13:50', '2019-09-25 05:45:22', '1', null, '1');

-- ----------------------------
-- Table structure for tbl_user_group
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user_group`;
CREATE TABLE `tbl_user_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `par_id` int(11) DEFAULT '0',
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `intro` text COLLATE utf8_unicode_ci,
  `permission` int(11) NOT NULL DEFAULT '0',
  `isadmin` int(11) NOT NULL DEFAULT '0',
  `isroot` tinyint(4) DEFAULT NULL,
  `isboss` tinyint(4) DEFAULT '1',
  `isactive` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_user_group
-- ----------------------------
INSERT INTO `tbl_user_group` VALUES ('1', '0', 'Super Admin', '', '8388607', '1', null, '1', '1');
INSERT INTO `tbl_user_group` VALUES ('2', '1', 'Admin', '', '6291448', '0', null, '1', '1');
INSERT INTO `tbl_user_group` VALUES ('3', '2', 'Content', '', '992', '0', null, '1', '1');
INSERT INTO `tbl_user_group` VALUES ('4', '2', 'Dangky', '', '49152', '0', null, '1', '1');

-- ----------------------------
-- Table structure for tbl_video
-- ----------------------------
DROP TABLE IF EXISTS `tbl_video`;
CREATE TABLE `tbl_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `video_id` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `thumb` varchar(255) DEFAULT NULL,
  `intro` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `content` text CHARACTER SET utf8,
  `ishot` tinyint(4) DEFAULT '0',
  `order` int(11) DEFAULT '0',
  `cdate` datetime DEFAULT NULL,
  `mdate` datetime DEFAULT NULL,
  `visited` int(11) DEFAULT '0',
  `isactive` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_video
-- ----------------------------
INSERT INTO `tbl_video` VALUES ('1', 'Sinh vi&ecirc;n đại học Đ&ocirc;ng Đ&ocirc;', 'sinh-vien-dai-hoc-dong-do', 'rUXsxIRagMo', 'https://www.youtube.com/watch?v=rUXsxIRagMo', 'https://i.ytimg.com/vi/rUXsxIRagMo/hqdefault.jpg', 'Clip nhảy Flashmob sinh vi&ecirc;n đại học Đ&ocirc;ng Đ&ocirc;', '', '0', '0', '2018-09-13 10:00:00', '2018-09-14 14:56:41', '0', '1');
INSERT INTO `tbl_video` VALUES ('2', 'Flash mob mừng kỷ niệm 26 năm quan hệ ngoại giao Việt - H&agrave;n', 'flash-mob-mung-ky-niem-26-nam-quan-he-ngoai-giao-viet-han', 's3dDUNL1VNY', 'https://www.youtube.com/watch?v=s3dDUNL1VNY', 'https://i.ytimg.com/vi/s3dDUNL1VNY/hqdefault.jpg', '150 SV Đại học Đ&ocirc;ng Đ&ocirc; đồng diễn flash mob ch&agrave;o mừng kỷ niệm 26 năm quan hệ ngoại giao Việt Nam - H&agrave;n Quốc (1992 - 2018) tại SVĐ Mỹ Đ&igrave;nh ng&agrave;y 20/1 vừa qua.', '&lt;span style=&quot;color: rgb(51, 51, 51); font-family: &quot; helvetica=&quot;&quot; neue&quot;,=&quot;&quot; helvetica,=&quot;&quot; arial,=&quot;&quot; sans-serif;=&quot;&quot; font-size:=&quot;&quot; 14px;=&quot;&quot; background-color:=&quot;&quot; rgb(255,=&quot;&quot; 255,=&quot;&quot; 255);&quot;=&quot;&quot;&gt;150 SV Đại học Đ&ocirc;ng Đ&ocirc; đồng diễn flash mob ch&agrave;o mừng kỷ niệm 26 năm quan hệ ngoại giao Việt Nam - H&agrave;n Quốc (1992 - 2018) tại SVĐ Mỹ Đ&igrave;nh ng&agrave;y 20/1 vừa qua.&lt;/span&gt;', '0', '0', '2018-09-14 08:00:00', '2018-09-15 18:25:46', '0', '1');
INSERT INTO `tbl_video` VALUES ('3', 'Đại học Đ&ocirc;ng Đ&ocirc; tuyển sinh v&agrave; giảng dạy 2018', 'dai-hoc-dong-do-tuyen-sinh-va-giang-day-2018', 'fzcchFRp1qw', 'https://www.youtube.com/watch?v=fzcchFRp1qw', 'https://i.ytimg.com/vi/fzcchFRp1qw/hqdefault.jpg', 'Đại học Đ&ocirc;ng Đ&ocirc; tuyển sinh 20 ng&agrave;nh hệ Đại học v&agrave; 06 ng&agrave;nh hệ Thạc sĩ: Thạc sĩ Quản trị kinh doanh Thạc sĩ Quản l&yacute; c&ocirc;ng Thạc sĩ Quản l&yacute; kinh tế Thạc sĩ T&agrave;i ch&iacute;nh ng&acirc;n h&agrave;ng Thạ', '&lt;span style=&quot;color: rgb(51, 51, 51); font-family: &quot; helvetica=&quot;&quot; neue&quot;,=&quot;&quot; helvetica,=&quot;&quot; arial,=&quot;&quot; sans-serif;=&quot;&quot; font-size:=&quot;&quot; 14px;=&quot;&quot; background-color:=&quot;&quot; rgb(255,=&quot;&quot; 255,=&quot;&quot; 255);&quot;=&quot;&quot;&gt;Đại học Đ&ocirc;ng Đ&ocirc; tuyển sinh 20 ng&agrave;nh hệ Đại học v&agrave; 06 ng&agrave;nh hệ Thạc sĩ: Thạc sĩ Quản trị kinh doanh Thạc sĩ Quản l&yacute; c&ocirc;ng Thạc sĩ Quản l&yacute; kinh tế Thạc sĩ T&agrave;i ch&iacute;nh ng&acirc;n h&agrave;ng Thạc sĩ Quản l&yacute; x&acirc;y dựng Thạc sĩ Kiến tr&uacute;c&lt;/span&gt;', '0', '0', '2018-09-14 08:28:30', '2018-09-15 18:25:40', '0', '1');
INSERT INTO `tbl_video` VALUES ('4', 'Trường Đại học Đ&ocirc;ng Đ&ocirc; x&eacute;t tuyển Học bạ v&agrave;o đại học ch&iacute;nh quy 2018', 'truong-dai-hoc-dong-do-xet-tuyen-hoc-ba-vao-dai-hoc-chinh-quy-2018', 'q1XdK2O6hLU', 'https://www.youtube.com/watch?v=q1XdK2O6hLU', 'https://i.ytimg.com/vi/q1XdK2O6hLU/hqdefault.jpg', 'Trường Đại học Đ&ocirc;ng Đ&ocirc; tuyển sinh đại học ch&iacute;nh quy năm 2018. Phương thức x&eacute;t tuyển học bạ v&agrave; x&eacute;t tuyển kết quả thi PTTH Quốc gia', '&lt;span style=&quot;font-family: arial; font-size: 14.6667px; background-color: rgb(255, 255, 255);&quot;&gt;Trường Đại học Đ&ocirc;ng Đ&ocirc; tuyển sinh đại học ch&iacute;nh quy năm 2018. Phương thức x&eacute;t tuyển học bạ v&agrave; x&eacute;t tuyển kết quả thi PTTH Quốc gia&lt;/span&gt;', '0', '0', '2018-09-14 08:31:10', '2018-09-15 18:25:33', '0', '1');
