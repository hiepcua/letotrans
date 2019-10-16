/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : letotrans

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2019-10-16 09:04:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tbl_album
-- ----------------------------
DROP TABLE IF EXISTS `tbl_album`;
CREATE TABLE `tbl_album` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT NULL,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `intro` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `cdate` datetime NOT NULL,
  `visited` int(11) DEFAULT '0',
  `order` tinyint(5) DEFAULT NULL,
  `isactive` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tbl_album
-- ----------------------------
INSERT INTO `tbl_album` VALUES ('1', '0', 'thu-vien-anh', '', 'Thư viện ảnh', '', '2019-07-14 17:27:09', '5', null, '1');

-- ----------------------------
-- Table structure for tbl_categories
-- ----------------------------
DROP TABLE IF EXISTS `tbl_categories`;
CREATE TABLE `tbl_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `par_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `intro` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) DEFAULT '0',
  `lag_id` int(11) DEFAULT '0',
  `isactive` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tbl_categories
-- ----------------------------
INSERT INTO `tbl_categories` VALUES ('1', '0', 'Câu hỏi thường gặp', 'cau-hoi-thuong-gap', '', '', '0', '0', '1');
INSERT INTO `tbl_categories` VALUES ('2', '1', 'Câu hỏi tổng quan', 'cau-hoi-tong-quan', '', '', '0', '0', '0');
INSERT INTO `tbl_categories` VALUES ('3', '1', 'Câu hỏi về phiên dịch viên', 'cau-hoi-ve-phien-dich-vien', '', '', '0', '0', '1');
INSERT INTO `tbl_categories` VALUES ('4', '1', 'Câu hỏi về phí dịch vụ', 'cau-hoi-ve-phi-dich-vu', '', '', '0', '0', '1');
INSERT INTO `tbl_categories` VALUES ('5', '0', 'Blog', 'blog', '', '', '0', '0', '1');
INSERT INTO `tbl_categories` VALUES ('6', '0', 'Hợp tác', 'hop-tac', '', '', '0', '0', '1');

-- ----------------------------
-- Table structure for tbl_configsite
-- ----------------------------
DROP TABLE IF EXISTS `tbl_configsite`;
CREATE TABLE `tbl_configsite` (
  `config_id` int(11) NOT NULL AUTO_INCREMENT,
  `tem_id` int(11) DEFAULT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `intro` longtext COLLATE utf8mb4_unicode_ci,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tel` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fax` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` text COLLATE utf8mb4_unicode_ci,
  `work_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keyword` longtext COLLATE utf8mb4_unicode_ci,
  `meta_descript` longtext COLLATE utf8mb4_unicode_ci,
  `lang_id` int(11) NOT NULL DEFAULT '0',
  `contact` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `footer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `nick_yahoo` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_yahoo` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `skype1` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `skype2` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `twitter` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gplus` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `facebook` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `youtube` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `fullname` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tittle` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contents` text COLLATE utf8mb4_unicode_ci,
  `cdate` int(11) DEFAULT NULL,
  `isactive` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `images` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sapo` text COLLATE utf8mb4_unicode_ci,
  `intro` text COLLATE utf8mb4_unicode_ci,
  `fulltext` longtext COLLATE utf8mb4_unicode_ci,
  `type_of_land_id` int(11) DEFAULT NULL,
  `area` float DEFAULT NULL,
  `price` float DEFAULT NULL,
  `list_conid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `list_tagid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cdate` int(11) DEFAULT NULL,
  `mdate` int(11) DEFAULT NULL,
  `visited` int(11) DEFAULT '0',
  `order` int(4) DEFAULT '0',
  `ispay` tinyint(4) DEFAULT '1',
  `ishot` tinyint(4) DEFAULT '0',
  `isactive` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tbl_contents
-- ----------------------------
INSERT INTO `tbl_contents` VALUES ('1', '1', 'Online translation services - for those who need it fast!', 'online-translation-services-for-those-who-need-it-fast', 'http://localhost/letotrans/images/hinh-anh/post-01.jpg', '[]', '', '<p>Globalization. It’s upon us. From international e-commerce, which now accounts for 30% of all online sales, to highly technical and medical online publications and journals translations into several languages. That`s why the services allowing professional language translation are in high demand and a critical necessity.</p>', '<p>Globalization. It’s upon us. From international e-commerce, which now accounts for 30% of all online sales, to highly technical and medical online publications and journals translations into several languages. That`s why the services allowing professional language translation are in high demand and a critical necessity.</p>\r\n<p> </p>\r\n<p>Businesses, non-profit organizations, scientific communities all strive to find professional translation services online. Their options are to locate individual translators for each language, spend time screening, interviewing and checking backgrounds and experience, or to streamline the process by contracting these services out to professionals. What the vast majority of companies and organizations have discovered is that once a trustworthy online translation service is found, they can turn over all their projects in confidence that they will be expertly completed within the time frame.</p>\r\n<p> </p>\r\n<p>The Word Point – Excellence in Every Word</p>\r\n<p>We are just such an online translation company. We have built our reputation over time, gradually, as we accumulated staff that is second-to-none. We are now able to guess any localization requests a client has. Our translators and proofreaders are expert linguists in possession of specific expertise in the topic area or industry niche of the project. If you look for a high-quality translation - go on reading.</p>\r\n<p> </p>\r\n<p>Personalization</p>\r\n<p>All online translation services have clients with unique needs, and our business model is that of a partnership between us, our clients and the translator completing the task. When a client arrives with a project, we discuss it and then assign the most appropriate translator for the requested expertise. The additional effort includes a separate proofreader once the task is complete, so that even small errors can be caught and corrected. We deliver an impeccable text and it is right the first time.</p>\r\n<p> </p>\r\n<p>Our Translators</p>\r\n<p>The work we do depends entirely on the translators we employ for the task. We have a rigorous screening and employment process that includes the following:</p>\r\n<p> </p>\r\n<p>Verifiable previous projects that are first-rate</p>\r\n<p>Formal training in the profession</p>\r\n<p>Qualifications in their niches – medicine, law, e-commerce, arts, business/finance, academic, etc.</p>\r\n<p>Completion of a project of our choosing</p>\r\n<p>Certifications as required for highly specified niches, such as medicine and law</p>\r\n<p>Our translators only write in their native languages in which they have grown up and been educated. As a team, they represent more than 100 languages and over 70 business and professional sectors.</p>\r\n<p> </p>\r\n<p>Layers and Options</p>\r\n<p>We have several layers, levels, and options for professional and fast translation services and pricing is based upon the level of complexity and length of the project and the required expertise of the translator to be assigned.</p>\r\n<p> </p>\r\n<p>Another factor in the online translation services pricing, of course, is the time frame parameters. We can identify the most urgent projects and assign a team of experts to collaborate.</p>\r\n<p> </p>\r\n<p>Sectors</p>\r\n<p>Thanks to the numbers and diversity of professional translators, we are able to cover any industry sector and offer help with all online translation services.</p>\r\n<p> </p>\r\n<p>Tourism: Clients look for multilingual websites in order for their customers to plan their business and leisure time</p>\r\n<p> </p>\r\n<p>Software/Tech Products: Adaptation for localization</p>\r\n<p> </p>\r\n<p>Medical: Masterful translation and transcriptions by professionals</p>\r\n<p> </p>\r\n<p>Banking/Financial Industries: Accurate translation to avoid any misunderstandings of overly-sensitive and complex information</p>\r\n<p> </p>\r\n<p>Retail Markets and Business Translation: Localization, document translation services, and more</p>\r\n<p> </p>\r\n<p>Technical Manufacturing and Engineering: Translation is made by professionals with a background in specific industries</p>\r\n<p> </p>\r\n<p>Education: Accurate translation of educational materials and texts, as well as content for online educational institutions</p>\r\n<p> </p>\r\n<p>Law: Translators with backgrounds in the law in their home countries. Legal translations cannot be left to amateurs</p>\r\n<p> </p>\r\n<p>If you are looking for online translation services that have expertise, personalization, trustworthiness and commitment to client satisfaction, Our team will be your top choice. We are the best online translation service and we can prove it!</p>', '0', '0', '0', null, null, 'admin', '1569423295', '1569436320', '1', '0', '1', '0', '1');
INSERT INTO `tbl_contents` VALUES ('2', '6', '5 Simple Steps for a Successful Transcreation Project', '5-simple-steps-for-a-successful-transcreation-project', 'http://localhost/letotrans/images/hinh-anh/post-03.jpg', '[]', '', '<p>When you want to launch a brand or communicate a goal in another language you need to do more than simply translate your work. What you need is a transcreation specialist, so let&rsquo;s take a look at what they do, and how they can help.</p>', '<p>What is transcreation?</p>\r\n<p>Transcreation refers to the process of taking a message communicated in one language and expressing it with the exact same meaning and sentiment in a second language. It&rsquo;s subtly different from standard translation because of the attention paid to cultural differences and societal context.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>If you want to ensure that your brand communicates the same vision in a variety of different languages you need to think about transcreation. It&rsquo;s the process that will make sure everything you say is on-message and has the right voice &mdash; 2 things that can be easily missed if you perform a literal word-for-word translation. It will also focus on the imagery that relates to the text to ensure everything fits together as intended.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>What results from the process of translation?</p>\r\n<p>Translation focuses on the written content of your project. It&rsquo;s all about finding the right words to express the core ideas in the same manner, whilst maintaining readability at every turn. The end result will be a piece of engaging text in the native language of your target audience.</p>\r\n<p>&nbsp;</p>\r\n<p>Now that we&rsquo;ve introduced you to the basic principles, let&rsquo;s take a look at the 5 simple steps you need to follow.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>Manage your translation project</p>\r\n<p>Project management is such an important skill that it&rsquo;s no wonder there are people who spend an entire career doing it. You need to set deadlines, deliverables, and always make yourself easily contactable. It can be easy to think that your translator will be able to take care of everything purely because they speak the language, but that&rsquo;s rarely the case. They&rsquo;ll need input, guidance, and context from you if you&rsquo;re going to arrive at an end result you&rsquo;re happy with. The more information and assistance you give them, the faster the project will be signed off and completed.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>Align expectations from day one&nbsp;</p>\r\n<p>You need to layout the scope of the work from the moment you start. If you want someone to simply translate a piece of text, tell them. If on the other hand, you need full transcreation that covers everything from the wording and tag lines right the way through to imagery, say that&rsquo;s what you need. Everyone involved will appreciate the time you&rsquo;ve taken to bring them up to speed, and it&rsquo;s the best way to make sure there aren&rsquo;t any nasty surprises 2 weeks into the project.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>Communicate your vision clearly&nbsp;</p>\r\n<p>Giving everyone a clear vision of what you want the text to look and feel like is so important. So many people forget to do this and have a translated piece that might mean the same thing word-for-word, but doesn&rsquo;t position the business anywhere near as effectively as the original text.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>The onus is on you to communicate your vision and to make sure everyone understands what you&rsquo;re trying to say. You may feel like you&rsquo;re repeating yourself a little bit, to begin with, but it&rsquo;s the best way to get the perfect end product.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>Provide context every step of the way&nbsp;</p>\r\n<p>Context makes all the difference to transcreation because it tells the rest of the team who the target audience is. Be clear and explicit at every step of the creative process and you&rsquo;ll be able to create something you love.</p>\r\n<p>&nbsp;</p>\r\n<p>Provide critical input on draft translations&nbsp;</p>\r\n<p>One of the key steps of translation is critical feedback. Remember that you&rsquo;re not just looking for a technically correct piece of text, you want something that gives your brand the same voice it has in the original piece. It&rsquo;s bound to take a couple of attempts to get everything just right, and that&rsquo;s nothing to be worried by. Just make sure you read everything carefully, give clear feedback, and then do the same with the second draft. Before you know it you&rsquo;ll have honed the language so it does exactly what you need it to.</p>', '0', '0', '0', null, null, 'admin', '1569427492', '1570991087', '2', '0', '1', '0', '1');
INSERT INTO `tbl_contents` VALUES ('3', '5', '5 Simple Steps for a Successful Transcreation Project', '5-simple-steps-for-a-successful-transcreation-project', 'http://localhost/letotrans/images/hinh-anh/post-02.jpg', '[]', '', '<p>When you want to launch a brand or communicate a goal in another language you need to do more than simply translate your work. What you need is a transcreation specialist, so let&rsquo;s take a look at what they do, and how they can help.</p>', '<p>What is transcreation?</p>\r\n<p>Transcreation refers to the process of taking a message communicated in one language and expressing it with the exact same meaning and sentiment in a second language. It&rsquo;s subtly different from standard translation because of the attention paid to cultural differences and societal context.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>If you want to ensure that your brand communicates the same vision in a variety of different languages you need to think about transcreation. It&rsquo;s the process that will make sure everything you say is on-message and has the right voice &mdash; 2 things that can be easily missed if you perform a literal word-for-word translation. It will also focus on the imagery that relates to the text to ensure everything fits together as intended.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>What results from the process of translation?</p>\r\n<p>Translation focuses on the written content of your project. It&rsquo;s all about finding the right words to express the core ideas in the same manner, whilst maintaining readability at every turn. The end result will be a piece of engaging text in the native language of your target audience.</p>\r\n<p>&nbsp;</p>\r\n<p>Now that we&rsquo;ve introduced you to the basic principles, let&rsquo;s take a look at the 5 simple steps you need to follow.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>Manage your translation project</p>\r\n<p>Project management is such an important skill that it&rsquo;s no wonder there are people who spend an entire career doing it. You need to set deadlines, deliverables, and always make yourself easily contactable. It can be easy to think that your translator will be able to take care of everything purely because they speak the language, but that&rsquo;s rarely the case. They&rsquo;ll need input, guidance, and context from you if you&rsquo;re going to arrive at an end result you&rsquo;re happy with. The more information and assistance you give them, the faster the project will be signed off and completed.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>Align expectations from day one&nbsp;</p>\r\n<p>You need to layout the scope of the work from the moment you start. If you want someone to simply translate a piece of text, tell them. If on the other hand, you need full transcreation that covers everything from the wording and tag lines right the way through to imagery, say that&rsquo;s what you need. Everyone involved will appreciate the time you&rsquo;ve taken to bring them up to speed, and it&rsquo;s the best way to make sure there aren&rsquo;t any nasty surprises 2 weeks into the project.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>Communicate your vision clearly&nbsp;</p>\r\n<p>Giving everyone a clear vision of what you want the text to look and feel like is so important. So many people forget to do this and have a translated piece that might mean the same thing word-for-word, but doesn&rsquo;t position the business anywhere near as effectively as the original text.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>The onus is on you to communicate your vision and to make sure everyone understands what you&rsquo;re trying to say. You may feel like you&rsquo;re repeating yourself a little bit, to begin with, but it&rsquo;s the best way to get the perfect end product.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>Provide context every step of the way&nbsp;</p>\r\n<p>Context makes all the difference to transcreation because it tells the rest of the team who the target audience is. Be clear and explicit at every step of the creative process and you&rsquo;ll be able to create something you love.</p>\r\n<p>&nbsp;</p>\r\n<p>Provide critical input on draft translations&nbsp;</p>\r\n<p>One of the key steps of translation is critical feedback. Remember that you&rsquo;re not just looking for a technically correct piece of text, you want something that gives your brand the same voice it has in the original piece. It&rsquo;s bound to take a couple of attempts to get everything just right, and that&rsquo;s nothing to be worried by. Just make sure you read everything carefully, give clear feedback, and then do the same with the second draft. Before you know it you&rsquo;ll have honed the language so it does exactly what you need it to.</p>', '0', '0', '0', null, null, 'admin', '1569427928', '1569430435', '0', '0', '1', '0', '1');
INSERT INTO `tbl_contents` VALUES ('4', '5', 'Hiring an Interpreting Company: 7 Things to Consider', 'hiring-an-interpreting-company-7-things-to-consider', 'http://localhost/letotrans/images/hinh-anh/post-04.jpg', '[]', '', '<p>Searching for reliable, professional interpreting services can be stressful. To take the hard work out of the hiring process we&rsquo;ve created a simple checklist you can work through. It includes key questions you need to ask, plus a couple of considerations you&rsquo;ll need to make to ensure things run smoothly.</p>', '<p>Do they have fluent speakers in both languages?</p>\r\n<p>What are interpreting services? Simply put they&rsquo;re a chance to have a native speaker sit by your side, or remotely, and tell you what someone speaking a foreign language is saying. There are apps that will claim to be able to do it, but they&rsquo;re nothing but a pale imitation of the real thing.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>What you want to know is whether or not the company you approach has fluent speakers in your language, and the language of the person you&rsquo;re speaking to. You&rsquo;re looking for someone who speaks word-perfect English as their second language, and who has the knowledge of the other language that only a native speaker can acquire.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>Are you hiring an interpreter or a translator?</p>\r\n<p>If you want to settle the age-old interpreter vs translator debate you&rsquo;re going to need to know the difference between a translator and an interpreter.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>Translators will typically be used to turn written text from one language into another. They&rsquo;re certainly useful, but they&rsquo;re not what you&rsquo;re looking for here. An interpreter will be able to instantly convey nuance and meaning in the spoken word. It&rsquo;s a vital skill and one that&rsquo;s certainly distinct from translation.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>Which type of interpretation will you need?</p>\r\n<p>Ask the translation company whether they offer a choice between simultaneous and consecutive interpretation. The former allows you to hear what the foreign language speaker is saying in real-time, whilst the latter waits until they&rsquo;ve finished to bring you up to speed. The choice will largely be determined by the speed of the exchange and your personal preference. Give it some thought and you&rsquo;ll be well equipped when you&rsquo;re ready to do business.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>Are there any reviews or testimonials you can take a look at?</p>\r\n<p>Every qualified language interpreter will have a mountain of 5-star reviews you can take a look at with the click of a button. Better yet, why not ask for references and referrals from their previous clients? This is a great way to get a feel for how the two of you will work together if you decide to go ahead. It&rsquo;s also a great way to get a picture of how the process worked from someone who has already been there and done it.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>Is your interpreter familiar with your niche?</p>\r\n<p>If you&rsquo;re discussing a highly technical or complex matter it&rsquo;s essential you tell your interpreter in advance. Whilst they don&rsquo;t have to be an expert on the subject, any background information and context you can give them will definitely be greatly appreciated.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>Check their availability and pricing before making plans&nbsp;</p>\r\n<p>Interpreters are in high demand, so it&rsquo;s essential that you book your person of choice well in advance. You might find that a freelance interpreter gives better flexibility in terms of pricing and availability as they&rsquo;re less likely to be tied down to longterm commitments. Take your time to draw up a shortlist of options, and make sure you avoid the common mistake of always picking the person who will do it for the smallest fee.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>Create a clear contract so everyone knows where they stand</p>\r\n<p>When you want to hire an interpreter you need to have a contract, there&rsquo;s simply no getting away from that fact. Whilst the industry is well regulated and governed, you&rsquo;re going to need to explicitly outline the scope of the role. You want to get the best out of your new partnership, so take the time to think about how you can explain things as clearly as possible. Once you&rsquo;re both on the same page you&rsquo;ll find you get through your work effortlessly. Just what you need when you want to take the stress out of things.&nbsp;</p>', '0', '0', '0', null, null, 'admin', '1569431036', null, '0', '0', '1', '0', '1');
INSERT INTO `tbl_contents` VALUES ('5', '5', '10 Little Translation Mistakes That Caused Big Problems', '10-little-translation-mistakes-that-caused-big-problems', 'http://localhost/letotrans/images/hinh-anh/post-05.jpg', '[]', '', '<p>Speaking a foreign language can be learned, but it&rsquo;s also something that comes with many challenges. Despite being able to have a conversation in it, grammar rules can be forgotten sometimes, leading to translation errors.</p>', '<p>Mistakes are bound to happen, that&rsquo;s a fact. Even so, if you&rsquo;re working as a translator, the smallest problems can cause big issues, and there are many examples. That being said, here are 10 translation mistakes that have been the cause of big problems.</p>\r\n<p>&nbsp;</p>\r\n<p>Do Nothing</p>\r\n<p>The HSBC bank had a catchphrase going like &ldquo;Assume Nothing&rdquo;. However, some countries didn&rsquo;t really translate it properly. It was translated as &ldquo;Do Nothing&rdquo;, and the bank had to pay $10 million rebranding in order to fix the damage caused by it.</p>\r\n<p>&nbsp;</p>\r\n<p>We Will Bury You</p>\r\n<p>An interpreter made a mistake when translating a speech of the Soviet Prime Minister Nikita Khrushchev. The translation he used was &ldquo;we will bury you&rdquo;, which was taken as a threat and let&rsquo;s be honest, who wouldn&rsquo;t consider that a threat? People assumed it meant Russia was going to unleash a nuclear attack on the US.</p>\r\n<p>&nbsp;</p>\r\n<p>Intoxicated</p>\r\n<p>Sometimes, problems with translation can lead to tragedies, just like this case from 1980. A man was brought into an emergency room in Florida. The friends who brought him were Spanish and were not having amazing English language skills. As such, they used the word &ldquo;intoxicado&rdquo; to describe his state, which the staff translated as &ldquo;intoxicated&rdquo; instead of &ldquo;poisoned&rdquo;.</p>\r\n<p>&nbsp;</p>\r\n<p>Due to that, they treated him for a drug overdose, and because the proper treatment was delayed, the man ended up paralyzed. Consequently, 71 million dollars were required from the hospital in the lawsuit, while the man lost his mobility.</p>\r\n<p>&nbsp;</p>\r\n<p>Markets Tumble</p>\r\n<p>A poor translation of a Chinese article has resulted in a lot of panic for the foreign exchange market. While the original post was just casual and presented an overview of some financial reports, the English translation made it sound way too authoritative. As such, the US dollar&rsquo;s value dropped.</p>\r\n<p>&nbsp;</p>\r\n<p>Chocolates for Him</p>\r\n<p>Valentine&rsquo;s Day traditions are pretty much known nowadays &ndash; there are gift exchanges between couples, including chocolate. In Japan, though, there was a mistranslation from a company which said women had to offer men chocolate too, as a custom. Because of that, women of Japan give men chocolate on February 14th, while men do the same on March 14th.</p>\r\n<p>&nbsp;</p>\r\n<p>A Company Near Its Demise</p>\r\n<p>Back in 2012, the Sharp Corp. released its earnings report which was not looking really good. Like that wasn&rsquo;t enough, the translation in English said that the hardship was a &ldquo;material doubt&rdquo; and that the company will keep being a &ldquo;going concern&rdquo;. This unintentional mistake almost killed the company, which was shown by the annual decline of 75%.</p>\r\n<p>&nbsp;</p>\r\n<p>Sheng Long</p>\r\n<p>There is a known game named &ldquo;Street Fighter II&rdquo;, and one of the characters in the game had a reply including the words &ldquo;Rising Dragon&rdquo;. When translated from Japanese to English, the translation was presented as &ldquo;Sheng Long&rdquo;, as the translator thought a new character was added to the game. As a result, many people were trying to find this inexistent foe in the game in an attempt to defeat him, thus wasting a lot of time.</p>\r\n<p>&nbsp;</p>\r\n<p>Your Lusts for the Future</p>\r\n<p>President Carter&rsquo;s trip to Poland in 1977 ended in a series of funny translation errors. The Russian interpreter ended up translating &ldquo;your desires for the future&rdquo; as &ldquo;your lusts for the future&rdquo;, something that was laughed about for quite a while.</p>\r\n<p>&nbsp;</p>\r\n<p>Waitangi Trouble</p>\r\n<p>A deal between the Maori chiefs of New Zealand and the British government was being discussed to protect the Maori from sailors, marauding convicts and traders. Conversely, the British wanted to extend their colonial holdings. Although the treaty was signed, the documents were different, and it ended up in the Maori thinking they were allowed to rule themselves while getting a legal system. It was wrong, though, and even today the matter is still discussed.</p>\r\n<p>&nbsp;</p>\r\n<p>Moses&rsquo;s Horns</p>\r\n<p>St. Jerome wanted to translate the Old Testament into Latin from Hebrew, but he ended up making a mistake. Basically, Hebrew is written without the vowels, so the translator read &ldquo;karan&rdquo; as &ldquo;keren&rdquo; which means &ldquo;horned&rdquo;, while the meaning was actually &ldquo;radiance&rdquo;. Because of this, many paintings and sculptures featured Moises with horns on his head.</p>\r\n<p>&nbsp;</p>\r\n<p>As you&rsquo;ve seen from these &ldquo;lost in translation&rdquo; examples, it&rsquo;s not unusual to make mistakes. Although not all translation errors have big consequences, history shows that sometimes they can end up in tragedies or panic. This is why attention and a lot of knowledge are important for a translator.</p>', '0', '0', '0', null, null, 'admin', '1569431084', null, '0', '0', '1', '0', '1');
INSERT INTO `tbl_contents` VALUES ('6', '5', '5 Steps to a Successful International Digital Marketing Strategy', '5-steps-to-a-successful-international-digital-marketing-strategy', 'http://localhost/letotrans/images/hinh-anh/post-06.jpg', '[]', '', '<p>To build a successful international marketing plan, you have to be dedicated and hard-working. It&rsquo;s not something that will happen overnight, but only through many days and nights of thinking about it and working on it. That being said, you need to step back and think of strategies.</p>', '<p>Even so, it&rsquo;s not so easy, and things can quickly get too overwhelming. Guidance becomes a must, so we created this list of five helpful steps to encourage you to do your best. Take a look at this digital marketing guide and you should be able to make your business thrive.</p>\r\n<p>&nbsp;</p>\r\n<p>Think About a Goal</p>\r\n<p>When thinking of strategies for reaching global markets, the prime step is thinking about your goals. What are you trying to achieve and why are you taking this route? It&rsquo;s important to identify your goals because it will help you build your strategy and make a plan to reach your goals properly. If you don&rsquo;t, you might end up messing something up along the way.</p>\r\n<p>&nbsp;</p>\r\n<p>SEO</p>\r\n<p>SEO is something that search engines use to help websites be found much easier by people in need. Short for search engine optimization, this is definitely one of the most effective methods for a successful online marketing campaign.</p>\r\n<p>&nbsp;</p>\r\n<p>The most known fact about SEO is how it uses keywords to let internet users find certain sites when typing something in the search bar. Basically, content creators sprinkle high traffic keywords in their posts, which gives them a chance to place high on the result page. As obvious, the more visible, the better, and given people barely go to the second results page when looking for something, it&rsquo;s essential to be placed very high. This can also be done by paying a fee to the search engines.</p>\r\n<p>&nbsp;</p>\r\n<p>Even so, there&rsquo;s one more important aspect to consider regarding SEO &ndash; readying your website for mobile browsing. In an era where the smartphone can be used for so many things, it would be a shame if your website wasn&rsquo;t optimized for mobile use. It can easily put off a lot of visitors.</p>\r\n<p>&nbsp;</p>\r\n<p>Choose a Proper Channel</p>\r\n<p>There are plenty of channels to choose from nowadays, so the options are not limited. Each one of them can help you reach your objectives and drive traffic for your company&rsquo;s site the right way. Some of the digital marketing channels can work as:</p>\r\n<p>&nbsp;</p>\r\n<p>Organic traffic</p>\r\n<p>Display networks</p>\r\n<p>Social media</p>\r\n<p>Direct emails</p>\r\n<p>Blogs</p>\r\n<p>Choosing one depends on your goals, customers, and budget, as well as the skills of your team.</p>\r\n<p>&nbsp;</p>\r\n<p>Use Social Media</p>\r\n<p>As a company, you have a big advantage nowadays. Most people own a social media account nowadays, meaning it will be much easier to reach people and make your voice heard. Social media must be part of your digital marketing plan if you want to maintain a strong bond with customers and be considered a reliable business.</p>\r\n<p>&nbsp;</p>\r\n<p>One of the main advantages of this method is that you&rsquo;re not as intrusive as you&rsquo;d be through emails. In other words, you don&rsquo;t force your way to someone&rsquo;s inbox &ndash; customers are the one finding you and deciding if they want to associate with you.</p>\r\n<p>&nbsp;</p>\r\n<p>Besides, people spend a good majority of their time on these social apps, so it&rsquo;s more likely for them to see updates from you.</p>\r\n<p>&nbsp;</p>\r\n<p>Post Relevant Content</p>\r\n<p>One of the best international marketing strategies is creating relevant content, of course. Basically, what you need to do is address the audience&rsquo;s concerns during their buying, which is why you need to focus on a good advertising campaign for this one. Content means more than just posting on your blog or tweeting, so make sure you do whatever it takes to let the audience know how you can help them.</p>\r\n<p>&nbsp;</p>\r\n<p>Final Thoughts</p>\r\n<p>What is international marketing rather than just a way to help you reach more people all across the world and achieve success? It&rsquo;s definitely difficult starting out, but with the tips provided in this article, you should be able to create a powerful strategy over time, thus having a fulfilling business.</p>', '0', '0', '0', null, null, 'admin', '1569431138', null, '0', '0', '1', '0', '1');
INSERT INTO `tbl_contents` VALUES ('7', '5', 'How to Overcome Cross Cultural Barriers in Business Negotiations', 'how-to-overcome-cross-cultural-barriers-in-business-negotiations', 'http://localhost/letotrans/images/hinh-anh/post-07.jpg', '[]', '', '<p>Running a business and being successful at it often requires meeting people from all around the globe and doing business with them. Although you have the best possible intentions, it may happen that a business negotiation with someone from a different culture simply goes in the wrong direction and you fail to seal the deal. The reason behind it might be cultural differences.</p>', '<p>Cross-cultural barriers in international business negotiation are common and you need to find a way to overcome them. If you don&rsquo;t, you might be unable to move your business globally and continue running a successful company.</p>\r\n<p>&nbsp;</p>\r\n<p>Take a look at some useful tips on how to move past cross cultural barriers and differences in business negotiations.</p>\r\n<p>&nbsp;</p>\r\n<p>Do Your Homework</p>\r\n<p>It goes without saying that you need to find a way to pay respect to the other party&rsquo;s cultural habits and values. That means that you need to do your research and learn about their culture.</p>\r\n<p>&nbsp;</p>\r\n<p>That includes learning about:</p>\r\n<p>&nbsp;</p>\r\n<p>greetings</p>\r\n<p>cultural values</p>\r\n<p>rituals</p>\r\n<p>taboos</p>\r\n<p>expectations</p>\r\n<p>By learning about the above-mentioned, you&rsquo;ll know what to expect from the person you&rsquo;re talking to, how to react, and how to respond to certain actions.</p>\r\n<p>&nbsp;</p>\r\n<p>This will show the other person you&rsquo;re aware of their culture and they&rsquo;ll appreciate your effort. In addition, you&rsquo;ll prevent yourself from doing anything offensive or upsetting for the other party.</p>\r\n<p>&nbsp;</p>\r\n<p>Don&rsquo;t Overstep</p>\r\n<p>When you&rsquo;re getting prepared for negotiating across cultures, you&rsquo;ll try to gather as much information as possible about the culture of the person you&rsquo;re meeting.</p>\r\n<p>&nbsp;</p>\r\n<p>However, keep in mind you&rsquo;re not actually learning about the person. You&rsquo;re learning about the stereotype.</p>\r\n<p>&nbsp;</p>\r\n<p>This means that you need to be very careful about the source of information you&rsquo;re relying on.</p>\r\n<p>&nbsp;</p>\r\n<p>It&rsquo;s best that you:</p>\r\n<p>&nbsp;</p>\r\n<p>talk to a member of the same culture you&rsquo;re friends with</p>\r\n<p>talk to someone who&rsquo;s had experience with that specific culture</p>\r\n<p>The internet can be filled with stereotypical information such as &ldquo;all Russians drink vodka&rdquo;. However, if you prepare a bottle of vodka for a business meeting, the other person might get super-offended.</p>\r\n<p>&nbsp;</p>\r\n<p>Therefore, make sure you&rsquo;ve got all the right information, that actually make a difference in a conversation.</p>\r\n<p>&nbsp;</p>\r\n<p>Be Aware of Your Own Culture</p>\r\n<p>If the person you&rsquo;re negotiating with is equally as considerate as you, they&rsquo;ve probably done their own research about your culture.</p>\r\n<p>&nbsp;</p>\r\n<p>Try and understand what kind of an image they have about you as the member of a specific culture, and what is it that they expect from meeting you.</p>\r\n<p>&nbsp;</p>\r\n<p>Then, try and either rebut the bad stereotypes or empower the good ones, and make sure the other party feels comfortable talking to you from the beginning.</p>\r\n<p>&nbsp;</p>\r\n<p>Find Common Grounds</p>\r\n<p>Finally, to avoid cultural differences in negotiation, you can go ahead and try finding something you and the other person have in common.</p>\r\n<p>&nbsp;</p>\r\n<p>Finding common grounds is almost like speaking the same language. It will help both you and the other party in terms of:</p>\r\n<p>&nbsp;</p>\r\n<p>reducing stress</p>\r\n<p>If you manage to find something in common, you&rsquo;ll be able to feel less stressed out and more open towards the entire negotiation.</p>\r\n<p>&nbsp;</p>\r\n<p>breaking the ice</p>\r\n<p>Sharing ideas, customs, or elements of a culture will be a great ice-breaker for you and the other person. It&rsquo;ll help you kick start the negotiation and seal the deal in no time.</p>\r\n<p>&nbsp;</p>\r\n<p>feeling a connection</p>\r\n<p>It&rsquo;s important that you establish a connection with the other person. It may be hard when you don&rsquo;t speak the same language, but finding something in common will help you do it.</p>\r\n<p>&nbsp;</p>\r\n<p>Make sure you try out different thing until you hit the right note and engage in a meaningful conversation with the other party.</p>\r\n<p>&nbsp;</p>\r\n<p>Conclusion</p>\r\n<p>It&rsquo;s obvious that cultural differences can negatively affect international business negotiations. However, it doesn&rsquo;t have to be the case. You do have to walk the extra mile and prepare thoroughly to be able to build a bridge between the two cultures. But, once you do it, you&rsquo;ll have nothing to worry about. Make sure to use the advice we gave you and win all your international business negotiations.</p>', '0', '0', '0', null, null, 'admin', '1569431185', null, '0', '0', '1', '0', '1');
INSERT INTO `tbl_contents` VALUES ('8', '5', 'How to Create an Effective Multilingual Content Strategy', 'how-to-create-an-effective-multilingual-content-strategy', 'http://localhost/letotrans/images/hinh-anh/post-08.jpg', '[]', '', '<p>When it comes to digital marketing, your content marketing strategy is the basis. Everyone company, regardless of how big or small, needs to have a strategic plan on how to produce and publish content for marketing and digital presence.</p>', '<p>However, if you&rsquo;re trying to act globally, and launch your business higher, you need to create an effective multilingual content strategy. That means that you need to adapt your content to different markets you&rsquo;re targeting and have a strategy for each new territory that you choose. Simply translating your initial website from English to other languages won&rsquo;t do the trick.</p>\r\n<p>&nbsp;</p>\r\n<p>If you&rsquo;re curious to find out what are the steps in creating a multilingual content mattering strategy, just keep reading.</p>\r\n<p>&nbsp;</p>\r\n<p>Target the Local Market</p>\r\n<p>First things first, you need to identify the new local market and find out as much as you can about it.</p>\r\n<p>&nbsp;</p>\r\n<p>This means that you to learn about the new market, the people who belong to it, and their needs.</p>\r\n<p>&nbsp;</p>\r\n<p>That includes:</p>\r\n<p>&nbsp;</p>\r\n<p>the language they speak</p>\r\n<p>the culture they belong to</p>\r\n<p>their typical online behavior and habits</p>\r\n<p>their needs</p>\r\n<p>their values</p>\r\n<p>their expectations</p>\r\n<p>Learn as much as you can about your potential clients on the new market and ensure you know where you&rsquo;re going with your content development strategy.</p>\r\n<p>&nbsp;</p>\r\n<p>Create the Content They Need</p>\r\n<p>Once you finish step one, you&rsquo;ll realize just how different each new target audience is. Consequentially, you&rsquo;ll realize how important it is to create specific content aimed at specific audience groups, instead of simply translating your available content.</p>\r\n<p>&nbsp;</p>\r\n<p>In other words, content creation for your global content strategy needs to cover the following:</p>\r\n<p>&nbsp;</p>\r\n<p>relevant content</p>\r\n<p>Discover what are the trending topics in a given region and what type of content is the most engaging and converting.</p>\r\n<p>&nbsp;</p>\r\n<p>search engines</p>\r\n<p>Not every country uses Google as their main search engine. Discover what the main search engine of your target audience is, and write specifically for that search engine.</p>\r\n<p>&nbsp;</p>\r\n<p>In addition, you&rsquo;ll need to find specific keywords for the new market.</p>\r\n<p>&nbsp;</p>\r\n<p>social media</p>\r\n<p>Find out which social media platforms are the most popular ones in your target area and ensure you&rsquo;re present on them.</p>\r\n<p>&nbsp;</p>\r\n<p>Developing a content strategy which is to impact people on a global level requires you to curate specific content aimed at different groups of target audiences. It does take a lot of effort, but the results will be undeniable.</p>\r\n<p>&nbsp;</p>\r\n<p>Localization</p>\r\n<p>In case you already have content written in English and believe your new target market would enjoy that same content, you need to focus on localization.</p>\r\n<p>&nbsp;</p>\r\n<p>The basis of localization is definitely translation, but there&rsquo;s much more to it. Take a look at all the essential steps in the localization process:</p>\r\n<p>&nbsp;</p>\r\n<p>translation</p>\r\n<p>Translating the initial content you published in English requires that you hire a professional translator to translate your content to the target language.</p>\r\n<p>&nbsp;</p>\r\n<p>adaptation</p>\r\n<p>When translating, it&rsquo;s important that change the following:</p>\r\n<p>&nbsp;</p>\r\n<p>measurement units</p>\r\n<p>currencies</p>\r\n<p>date formatting</p>\r\n<p>sizes</p>\r\n<p>cultural awareness</p>\r\n<p>Learn about your new audience and make sure your content is suitable for them and their cultural beliefs. You&rsquo;ll need to change some colors, images, or your entire design so as to make it appropriate for the new audience.</p>\r\n<p>&nbsp;</p>\r\n<p>For example, a cow is a sacred animal in India so you wouldn&rsquo;t want to showcase it in a disrespectful manner in your design.</p>\r\n<p>&nbsp;</p>\r\n<p>Separate platforms</p>\r\n<p>Finally, there&rsquo;s the question of whether or not you should create separate websites and separate social media profiles for each new target audience and market.</p>\r\n<p>&nbsp;</p>\r\n<p>It might be a good strategy to separate your multilingual content because your audience will find it easier to get to the content curated for them and interact with you if they feel the need.</p>\r\n<p>&nbsp;</p>\r\n<p>Therefore, consider separate websites and social media accounts as the final step in your multilingual content strategy.</p>\r\n<p>&nbsp;</p>\r\n<p>Final Thoughts</p>\r\n<p>It takes a lot of strategic planning and smart decision to create a successful multilingual content strategy. Hopefully, the tips above gave you guidance and helped you learn about the whole process.</p>\r\n<p>&nbsp;</p>\r\n<p>Now, all you have to do is get started and use the advice we gave you.</p>', '0', '0', '0', null, null, 'admin', '1569431228', null, '1', '0', '1', '0', '1');
INSERT INTO `tbl_contents` VALUES ('9', '2', 'The Word Point is Recognized by Clutch for Outstanding Accuracy in Translation Services', 'the-word-point-is-recognized-by-clutch-for-outstanding-accuracy-in-translation-services', 'http://localhost/letotrans/images/hinh-anh/post-09.jpg', '[]', '', '<p>The Word Point specializes in innovation, and we&rsquo;d like to think that we&rsquo;ve revolutionized the translation industry as we know it</p>', '<p>Whatever, wherever our clients&rsquo; company, our team of experts and our arsenal of strategy, technology, and solutions are ready to help. We stand behind our customers and their success, a commitment that has made us a true force to be reckoned with in the industry.</p>\r\n<p>&nbsp;</p>\r\n<p>Clutch, the B2B research and reviews firm, recently released its ranking of translation services providers, and The Word Point earned the distinction of a position among the top 10 competitors in a field of more than 1000. We can&rsquo;t say enough about how proud we are of this accomplishment, but we&rsquo;d like to start by thanking Clutch for recognizing the quality of our market presence, industry experience and customer service.</p>\r\n<p>&nbsp;</p>\r\n<p>As one of our customers touted, &ldquo;The Word Point was praised for their ability to walk the line between efficiency and cost and their personal customer service &hellip; My client was happy with the translation quality, and I was pleased with their price-speed balance. They offer brilliant support and are caring and warm. They find custom solutions with a market-low price tag.&rdquo;</p>\r\n<p>&nbsp;</p>\r\n<p>Clutch&rsquo;s sister companies, The Manifest and Visual Objects, also heralded our team&rsquo;s expertise and hard work. In particular, business news website The Manifest named The Word Point one of the industry&rsquo;s best translation companies, while portfolio curator Visual Objects now showcases our experience in support of The Word Point&rsquo;s stand-out services and solutions.</p>\r\n<p>&nbsp;</p>\r\n<p>Knowing that what we do at The Word Point has validation from sources like Clutch, The Manifest, and Visual Objects, means a lot about to us, and we&rsquo;re very excited to see what new clients and challenges the future holds for us. If you&rsquo;d like to learn more about our approach or speak to a member of The Word Point, we welcome you to connect with us here. Let&rsquo;s see what we can do together!</p>', '0', '0', '0', null, null, 'admin', '1569431271', '1569601878', '2', '0', '1', '0', '1');
INSERT INTO `tbl_contents` VALUES ('10', '2', 'How to Protect Your Brand with Trademark Translation', 'how-to-protect-your-brand-with-trademark-translation', 'http://localhost/letotrans/images/hinh-anh/post-10.jpg', '[]', '', '<p>What is a trademark definition? Your trademark can be many things. A trademark translation can be a symbol, element of design, or other signature attributes which uniquely identifies your products and services as your own. and such, trademarks can be applied to signs, brand names, logos, designs, taglines, and other visual elements that are unique to your company.</p>', '<p>What is a trademark definition? Your trademark can be many things. A trademark translation can be a symbol, element of design, or other signature attributes which uniquely identifies your products and services as your own. and such, trademarks can be applied to signs, brand names, logos, designs, taglines, and other visual elements that are unique to your company. In spite of this, there can still be issues that crop up with trademarked elements. this becomes even more complex when you have to translate one or more of your trademark elements into a different language.</p>\r\n<p>&nbsp;</p>\r\n<p>Understanding The Importance of a Name Identity: Trademark Definitions</p>\r\n<p>To illustrate just how important trademarks are to a company&rsquo;s recognition and identity, here are some examples of trademarks. As you can see trademark definition is quite flexible:</p>\r\n<p>&nbsp;</p>\r\n<p>Fictional Characters: &lsquo;Jack&rsquo; From Jack in The Box or Tony the Tiger</p>\r\n<p>Business Names: UPS or IBM</p>\r\n<p>Words and Slogans in Specific Fonts: Pop Tarts or Little Debbie</p>\r\n<p>Colors: Barbie Pink or Tiffany Blue</p>\r\n<p>Slogans: &lsquo;Just Do It&rsquo; by Nike</p>\r\n<p>Sounds: &lsquo;Dun Dun&rsquo; Sound from The Law and Order TV Series</p>\r\n<p>Product Shapes: Toblerone Bar or Glass Coca Cola Bottle</p>\r\n<p>Establishing a Global Trademark</p>\r\n<p>As you might imagine, establishing a trademark in your company&rsquo;s country of origin doesn&rsquo;t necessarily mean that your trademark is valid in other countries. If you expand your business internationally, you must establish your trademarks in each country you enter, or use the Madrid System to establish a trademark in multiple countries using a single application process.</p>\r\n<p>&nbsp;</p>\r\n<p>Trademark Translation</p>\r\n<p>Of course, the importance of brand names and other trademarked items goes beyond establishing legal protections. You also have to present these elements to customers and potential customers in other countries, and it&rsquo;s important that they make sense. They should also retain the definition intended.</p>\r\n<p>&nbsp;</p>\r\n<p>Sometimes making that happen isn&rsquo;t very easy. This is where translation and localization experts can help. One area that requires special attention is transliteration. This is the translation of written words from one language to another when the languages are based on two different character sets. For example, English and Chinese. There are no Chinese symbols that mean &lsquo;coca or &lsquo;cola&rsquo;. For that matter, there are no Chinese symbols that translate to the 26 letter alphabet. Instead, each Chinese character has a sound and a meaning.</p>\r\n<p>&nbsp;</p>\r\n<p>When Coca Cola began selling their products in China the first attempts at transliteration were a failure. One version could be translated as &lsquo;bite the wax tadpole&rsquo;. The company eventually settled on &ldquo;ke kou ke le&rdquo; which is Mandarin for a permit for the mouth to rejoice.</p>\r\n<p>&nbsp;</p>\r\n<p>There are also instances where a phrase, character, even color simply won&rsquo;t have the same meaning no matter what you do. In these cases, you may need to create something new in order to succeed in a new market. By working with a translation professional, you can identify these potential problems, and get advice on how to proceed.</p>\r\n<p>&nbsp;</p>\r\n<p>In addition to this, when it is time to file for your trademarks, you can access translation professionals with experience in intellectual property law. They can assist you in translating any of the documentation required to protect your brand in other countries.</p>\r\n<p>&nbsp;</p>\r\n<p>Final Thoughts</p>\r\n<p>By trademarking your brand in other countries, you help your efforts to become recognized by your potential customers in those regions. You also help to ensure that your intellectual property is not taken by other companies for their own purposes. Just keep in mind that this can be a complicated undertaking. You will need to work with translation professionals with expertise in marketing, localization, intellectual property, and trademarks.</p>', '0', '0', '0', null, null, 'admin', '1569431343', '1569601874', '4', '0', '1', '0', '1');

-- ----------------------------
-- Table structure for tbl_co_operate
-- ----------------------------
DROP TABLE IF EXISTS `tbl_co_operate`;
CREATE TABLE `tbl_co_operate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `company` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `isactive` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tbl_co_operate
-- ----------------------------
INSERT INTO `tbl_co_operate` VALUES ('1', 'Trần Viết Hiệp', 'tranviethiepdz@gmail.com', null, null, '1');
INSERT INTO `tbl_co_operate` VALUES ('2', 'Trần Viết Hiệp', 'tranviethiepdz@gmail.com', '09695499991', 'Designbold', '1');
INSERT INTO `tbl_co_operate` VALUES ('3', 'DAVID MATIN', 'abc@gmail.com1', '09695499991', 'Designbold', '1');

-- ----------------------------
-- Table structure for tbl_feedback
-- ----------------------------
DROP TABLE IF EXISTS `tbl_feedback`;
CREATE TABLE `tbl_feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `career` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(4) DEFAULT NULL,
  `isactive` tinyint(2) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tbl_feedback
-- ----------------------------
INSERT INTO `tbl_feedback` VALUES ('1', 'Layla', 'http://localhost/letotrans/images/basic/feedback-01.jpg', 'Tôi thật sự bị ấn tượng bởi sự nhiệt tình và chu đáo dành cho khách hàng ở đây. Không chỉ chuyên sửa Lexus uy tín, mà chất lượng phục vụ cũng rất tốt. Dịch vụ ở đây hoàn toàn thuyết phục', 'Doanh nhân', '1', '1');
INSERT INTO `tbl_feedback` VALUES ('2', 'DAVID MATIN', 'http://localhost/letotrans/images/basic/feedback-02.jpg', 'Tôi hài lòng về dịch vụ bảo hành ở đây, các kỹ sư sau khi sửa ô tô Lexus còn gọi điện chăm sóc và hỏi thăm tình trạng ô tô sau khi sửa chữa. Dịch vụ ở đây hoàn toàn thuyết phục một khách hàng khó tính như tôi', 'Student', '0', '1');
INSERT INTO `tbl_feedback` VALUES ('3', 'Võ Văn Vẻ', 'http://localhost/letotrans/images/basic/feedback-03.jpg', 'Tôi hài lòng về dịch vụ bảo hành ở đây, các kỹ sư sau khi sửa ô tô Lexus còn gọi điện chăm sóc và hỏi thăm tình trạng ô tô sau khi sửa chữa. Dịch vụ ở đây hoàn toàn thuyết phục một khách hàng khó tính như tôi', 'Nhân viên văn phòng', null, '1');
INSERT INTO `tbl_feedback` VALUES ('4', 'Hoàng Rapper', 'http://localhost/letotrans/images/basic/feedback-04.jpg', 'Tôi hài lòng về dịch vụ bảo hành ở đây, các kỹ sư sau khi sửa ô tô Lexus còn gọi điện chăm sóc và hỏi thăm tình trạng ô tô sau khi sửa chữa. Dịch vụ ở đây hoàn toàn thuyết phục một khách hàng khó tính như tôi', 'Nhân viên văn phòng', null, '1');

-- ----------------------------
-- Table structure for tbl_gallery
-- ----------------------------
DROP TABLE IF EXISTS `tbl_gallery`;
CREATE TABLE `tbl_gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `album_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isactive` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for tbl_languages
-- ----------------------------
DROP TABLE IF EXISTS `tbl_languages`;
CREATE TABLE `tbl_languages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(49) CHARACTER SET utf8mb4 DEFAULT NULL,
  `iso` char(2) CHARACTER SET utf8mb4 DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint(4) DEFAULT NULL,
  `price_cc` float DEFAULT '0',
  `isactive` tinyint(2) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tbl_languages
-- ----------------------------
INSERT INTO `tbl_languages` VALUES ('1', 'English', 'en', 'http://localhost/letotrans/images/languages/england.png', '1', null, '1');
INSERT INTO `tbl_languages` VALUES ('2', 'Afar', 'aa', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('3', 'Abkhazian', 'ab', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('4', 'Afrikaans', 'af', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('5', 'Amharic', 'am', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('6', 'Arabic', 'ar', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('7', 'Assamese', 'as', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('8', 'Aymara', 'ay', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('9', 'Azerbaijani', 'az', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('10', 'Bashkir', 'ba', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('11', 'Belarusian', 'be', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('12', 'Bulgarian', 'bg', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('13', 'Bihari', 'bh', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('14', 'Bislama', 'bi', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('15', 'Bengali/Bangla', 'bn', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('16', 'Tibetan', 'bo', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('17', 'Breton', 'br', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('18', 'Catalan', 'ca', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('19', 'Corsican', 'co', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('20', 'Czech', 'cs', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('21', 'Welsh', 'cy', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('22', 'Danish', 'da', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('23', 'German', 'de', '', '5', null, '1');
INSERT INTO `tbl_languages` VALUES ('24', 'Bhutani', 'dz', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('25', 'Greek', 'el', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('26', 'Esperanto', 'eo', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('27', 'Spanish', 'es', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('28', 'Estonian', 'et', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('29', 'Basque', 'eu', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('30', 'Persian', 'fa', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('31', 'Finnish', 'fi', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('32', 'Fiji', 'fj', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('33', 'Faeroese', 'fo', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('34', 'French', 'fr', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('35', 'Frisian', 'fy', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('36', 'Irish', 'ga', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('37', 'Scots/Gaelic', 'gd', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('38', 'Galician', 'gl', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('39', 'Guarani', 'gn', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('40', 'Gujarati', 'gu', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('41', 'Hausa', 'ha', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('42', 'Hindi', 'hi', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('43', 'Croatian', 'hr', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('44', 'Hungarian', 'hu', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('45', 'Armenian', 'hy', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('46', 'Interlingua', 'ia', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('47', 'Interlingue', 'ie', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('48', 'Inupiak', 'ik', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('49', 'Indonesian', 'in', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('50', 'Icelandic', 'is', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('51', 'Italian', 'it', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('52', 'Hebrew', 'iw', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('53', 'Japanese', 'ja', 'http://localhost/letotrans/images/languages/japan.png', '3', null, '1');
INSERT INTO `tbl_languages` VALUES ('54', 'Yiddish', 'ji', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('55', 'Javanese', 'jw', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('56', 'Georgian', 'oa', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('57', 'Kazakh', 'kk', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('58', 'Greenlandic', 'kl', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('59', 'Cambodian', 'km', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('60', 'Kannada', 'kn', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('61', 'Korean', 'ko', 'http://localhost/letotrans/images/languages/south-korea.png', '4', null, '1');
INSERT INTO `tbl_languages` VALUES ('62', 'Kashmiri', 'ks', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('63', 'Kurdish', 'ku', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('64', 'Kirghiz', 'ky', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('65', 'Latin', 'la', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('66', 'Lingala', 'ln', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('67', 'Laothian', 'lo', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('68', 'Lithuanian', 'lt', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('69', 'Latvian/Lettish', 'lv', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('70', 'Malagasy', 'mg', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('71', 'Maori', 'mi', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('72', 'Macedonian', 'mk', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('73', 'Malayalam', 'ml', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('74', 'Mongolian', 'mn', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('75', 'Moldavian', 'mo', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('76', 'Marathi', 'mr', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('77', 'Malay', 'ms', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('78', 'Maltese', 'mt', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('79', 'Burmese', 'my', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('80', 'Nauru', 'na', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('81', 'Nepali', 'ne', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('82', 'Dutch', 'nl', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('83', 'Norwegian', 'no', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('84', 'Occitan', 'oc', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('85', '(Afan)/Oromoor/Oriya', 'om', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('86', 'Punjabi', 'pa', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('87', 'Polish', 'pl', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('88', 'Pashto/Pushto', 'ps', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('89', 'Portuguese', 'pt', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('90', 'Quechua', 'qu', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('91', 'Rhaeto-Romance', 'rm', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('92', 'Kirundi', 'rn', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('93', 'Romanian', 'ro', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('94', 'Russian', 'ru', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('95', 'Kinyarwanda', 'rw', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('96', 'Sanskrit', 'sa', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('97', 'Sindhi', 'sd', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('98', 'Sangro', 'sg', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('99', 'Serbo-Croatian', 'sh', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('100', 'Singhalese', 'si', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('101', 'Slovak', 'sk', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('102', 'Slovenian', 'sl', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('103', 'Samoan', 'sm', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('104', 'Shona', 'sn', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('105', 'Somali', 'so', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('106', 'Albanian', 'sq', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('107', 'Serbian', 'sr', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('108', 'Siswati', 'ss', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('109', 'Sesotho', 'st', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('110', 'Sundanese', 'su', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('111', 'Swedish', 'sv', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('112', 'Swahili', 'sw', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('113', 'Tamil', 'ta', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('114', 'Telugu', 'te', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('115', 'Tajik', 'tg', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('116', 'Thai', 'th', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('117', 'Tigrinya', 'ti', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('118', 'Turkmen', 'tk', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('119', 'Tagalog', 'tl', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('120', 'Setswana', 'tn', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('121', 'Tonga', 'to', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('122', 'Turkish', 'tr', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('123', 'Tsonga', 'ts', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('124', 'Tatar', 'tt', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('125', 'Twi', 'tw', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('126', 'Ukrainian', 'uk', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('127', 'Urdu', 'ur', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('128', 'Uzbek', 'uz', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('129', 'Vietnamese', 'vi', 'http://localhost/letotrans/images/languages/vietnam.png', '0', '50', '1');
INSERT INTO `tbl_languages` VALUES ('130', 'Volapuk', 'vo', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('131', 'Wolof', 'wo', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('132', 'Xhosa', 'xh', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('133', 'Yoruba', 'yo', '', '60', null, '0');
INSERT INTO `tbl_languages` VALUES ('134', 'Chinese', 'zh', 'http://localhost/letotrans/images/languages/china.png', '2', null, '1');
INSERT INTO `tbl_languages` VALUES ('135', 'Zulu', 'zu', '', '60', null, '0');

-- ----------------------------
-- Table structure for tbl_menus
-- ----------------------------
DROP TABLE IF EXISTS `tbl_menus`;
CREATE TABLE `tbl_menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isactive` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `intro` text COLLATE utf8mb4_unicode_ci,
  `viewtype` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `category_id` int(11) NOT NULL DEFAULT '0',
  `content_id` int(11) NOT NULL DEFAULT '0',
  `link` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `class` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '0',
  `isactive` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tbl_mnuitems
-- ----------------------------
INSERT INTO `tbl_mnuitems` VALUES ('1', '0', '1', 'Trang chủ', 'trang-chu', '', 'link', '0', '0', 'http://localhost/letotrans/', 'fa fa-home', 'home', '0', '1');
INSERT INTO `tbl_mnuitems` VALUES ('2', '2', '1', 'Giới thiệu', 'gioi-thieu', '<img src=\"http://daihocdongdo.edu.vn/images/DD.jpg\" alt=\"\" align=\"\" border=\"0px\">', 'block', '44', '0', '', '', '', '0', '1');
INSERT INTO `tbl_mnuitems` VALUES ('3', '0', '1', 'Blog', 'blog', '', 'block', '5', '0', '', '', '', '2', '1');
INSERT INTO `tbl_mnuitems` VALUES ('4', '5', '1', 'Ngôn ngữ', 'ngon-ngu', '', 'link', '0', '0', 'http://localhost/letotrans/ngon-ngu', '', '', '2', '1');
INSERT INTO `tbl_mnuitems` VALUES ('5', '0', '1', 'More', 'more', '', 'link', '0', '0', '#', '', '', '5', '1');
INSERT INTO `tbl_mnuitems` VALUES ('7', '5', '1', 'FAQ', 'faq', '', 'link', '0', '0', 'http://localhost/letotrans/lien-he', '', '', '6', '1');
INSERT INTO `tbl_mnuitems` VALUES ('10', '0', '3', 'FAQs', 'faqs', null, 'link', '0', '0', '#', '', '', '0', '1');
INSERT INTO `tbl_mnuitems` VALUES ('11', '0', '3', 'Liên hệ', 'lien-he', null, 'link', '0', '0', '#', '', '', '0', '1');
INSERT INTO `tbl_mnuitems` VALUES ('15', '0', '2', 'Câu hỏi thường gặp', 'cau-hoi-thuong-gap', '', 'block', '1', '0', '', '', '', '0', '1');
INSERT INTO `tbl_mnuitems` VALUES ('16', '0', '2', 'Hướng dẫn đặt dịch vụ', 'huong-dan-dat-dich-vu', '', 'link', '0', '0', '#', '', '', '0', '1');
INSERT INTO `tbl_mnuitems` VALUES ('17', '0', '2', 'Chính sách giao hàng', 'chinh-sach-giao-hang', '', 'link', '0', '0', '#', '', '', '0', '1');
INSERT INTO `tbl_mnuitems` VALUES ('18', '0', '2', 'Chính sách bảo hành', 'chinh-sach-bao-hanh', '', 'link', '0', '0', '#', '', '', '0', '1');
INSERT INTO `tbl_mnuitems` VALUES ('19', '0', '2', 'Thông tin chuyển khoản', 'thong-tin-chuyen-khoan', '', 'link', '0', '0', '#', '', '', '0', '1');
INSERT INTO `tbl_mnuitems` VALUES ('20', '0', '2', 'Tư vấn khách hàng', 'tu-van-khach-hang', '', 'link', '0', '0', '#', '', '', '0', '1');
INSERT INTO `tbl_mnuitems` VALUES ('21', '0', '1', 'Dịch vụ', 'dich-vu', '', 'link', '0', '0', 'http://localhost/letotrans/dich-vu', '', '', '1', '1');
INSERT INTO `tbl_mnuitems` VALUES ('22', '5', '1', 'Ý kiến khách hàng', 'y-kien-khach-hang', '', 'link', '0', '0', 'http://localhost/letotrans/y-kien-khach-hang', '', '', '4', '1');
INSERT INTO `tbl_mnuitems` VALUES ('23', '0', '1', 'Giới thiệu', 'gioi-thieu', '', 'link', '0', '0', 'http://localhost/letotrans/gioi-thieu', '', '', '4', '1');
INSERT INTO `tbl_mnuitems` VALUES ('24', '0', '1', 'Hợp tác', 'hop-tac', '', 'block', '6', '0', '', '', '', '3', '1');
INSERT INTO `tbl_mnuitems` VALUES ('25', '5', '1', 'Hình thức thanh toán', 'hinh-thuc-thanh-toan', '', 'link', '0', '0', '#', '', '', '3', '1');
INSERT INTO `tbl_mnuitems` VALUES ('26', '5', '1', 'Order', 'order', '', 'link', '0', '0', 'http://localhost/letotrans/order', '', '', '0', '1');

-- ----------------------------
-- Table structure for tbl_modtype
-- ----------------------------
DROP TABLE IF EXISTS `tbl_modtype`;
CREATE TABLE `tbl_modtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tbl_modtype
-- ----------------------------
INSERT INTO `tbl_modtype` VALUES ('1', 'mainmenu', 'Main menu');
INSERT INTO `tbl_modtype` VALUES ('2', 'html', 'HTML');
INSERT INTO `tbl_modtype` VALUES ('3', 'categories', 'Nhóm bài viết');
INSERT INTO `tbl_modtype` VALUES ('4', 'news', 'Bài viết');
INSERT INTO `tbl_modtype` VALUES ('5', 'slide', 'Slideshow');
INSERT INTO `tbl_modtype` VALUES ('6', 'video', 'Tin Video');
INSERT INTO `tbl_modtype` VALUES ('7', 'gallery', 'Tin ảnh');
INSERT INTO `tbl_modtype` VALUES ('8', 'partner', 'Đối tác');
INSERT INTO `tbl_modtype` VALUES ('9', 'more', 'Mở rộng');

-- ----------------------------
-- Table structure for tbl_modules
-- ----------------------------
DROP TABLE IF EXISTS `tbl_modules`;
CREATE TABLE `tbl_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `intro` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `viewtitle` int(11) NOT NULL DEFAULT '0',
  `menu_id` int(11) DEFAULT NULL,
  `menu_ids` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int(50) DEFAULT NULL,
  `content_id` int(50) DEFAULT NULL,
  `theme` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `class` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '0',
  `isactive` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tbl_modules
-- ----------------------------
INSERT INTO `tbl_modules` VALUES ('2', 'mainmenu', 'Main menu', '', '', '0', '1', '', '0', null, '', 'navitor', '', '0', '1');
INSERT INTO `tbl_modules` VALUES ('15', 'more', 'Các lĩnh vực ngành nghề chúng tôi có thể dịch', '', '', '0', '0', '', '0', '0', 'services', 'box2', '', '1', '1');
INSERT INTO `tbl_modules` VALUES ('21', 'html', 'Copyright', '', '<p>Bản quyền thuộc về Leto Trans</p>', '0', '0', null, '0', '0', '', 'bottom', '', '0', '1');
INSERT INTO `tbl_modules` VALUES ('43', 'html', 'Thông tin liên hệ - Trang liên hệ', '', '<div><span style=\"font-size: 24px;\">THC AUTO SERVICE</span></div><div><br></div><div><div>XƯỞNG DỊCH VỤ 1:</div><div>430 đường Phúc Diễm, Xuân Phương, Nam Từ Liêm, HN</div><div><br></div><div>XƯỞNG DỊCH VỤ 2:</div><div>563 đường Phúc Diễm, Xuân Phương, Nam Từ Liêm, HN</div><div><br></div><div>HOTLINE:</div><div>0968.87.87.68 - 0964.10.4444 (Hỗ trợ 24/7)</div><div><br></div><div>EMAIL:</div><div>otomydinhthc@gmail.com</div></div>', '0', '0', null, '0', null, '', 'user9', '', '0', '1');
INSERT INTO `tbl_modules` VALUES ('48', 'slide', 'Banner slideshow', '', '', '0', '0', null, '0', null, '', 'banner', '', '0', '1');
INSERT INTO `tbl_modules` VALUES ('51', 'more', 'Đăng ký nhận tin', '', '', '0', '0', null, '0', '0', 'register', 'ads2', '', '0', '1');
INSERT INTO `tbl_modules` VALUES ('52', 'html', 'Hình thức thanh toán', '', '<div class=\"item-header\"><span>HÌNH THỨC THANH TOÁN</span></div>\r\n						<ul>\r\n							<li><img src=\"http://letotrans.vn/images/icons/paypal.jpg\"></li>\r\n							<li><img src=\"http://letotrans.vn/images/icons/visa.jpg\"></li>\r\n							<li><img src=\"http://letotrans.vn/images/icons/mastercard.jpg\"></li>\r\n							<li><img src=\"http://letotrans.vn/images/icons/american-express.jpg\"></li>\r\n							<li><img src=\"http://letotrans.vn/images/icons/discover.jpg\"></li>\r\n							<li><img src=\"http://letotrans.vn/images/icons/wire-transfer.jpg\"></li>\r\n						</ul>', '0', '0', null, '0', '0', '', 'box4', '', '0', '1');
INSERT INTO `tbl_modules` VALUES ('53', 'partner', 'ĐỐI TÁC THƯỜNG XUYÊN CỦA LETOtrans', '', '', '1', '0', null, '0', '0', 'default', 'box3', '', '0', '1');
INSERT INTO `tbl_modules` VALUES ('54', 'more', 'Bạn đã sẵn sàng sử dụng dịch vụ chưa', '', '', '0', '0', null, '0', '0', 'shake-hand', 'box9', '', '0', '1');
INSERT INTO `tbl_modules` VALUES ('55', 'html', 'Các định dạng tài liệu sau khi dịch', '', '<ul>\r\n								<li><span>Các định dạng tài liệu sau khi dịch:</span></li>\r\n								<li class=\"format_item\"><img src=\"http://localhost/letotrans/images/icons/icon-doc.png\"></li>\r\n								<li class=\"format_item\"><img src=\"http://localhost/letotrans/images/icons/icon-xml.png\"></li>\r\n								<li class=\"format_item\"><img src=\"http://localhost/letotrans/images/icons/icon-xls.png\"></li>\r\n								<li class=\"format_item\"><img src=\"http://localhost/letotrans/images/icons/icon-pdf.png\"></li>\r\n								<li class=\"format_item\"><img src=\"http://localhost/letotrans/images/icons/icon-txt.png\"></li>\r\n								<li class=\"format_item\"><img src=\"http://localhost/letotrans/images/icons/icon-html.png\"></li>\r\n							</ul>', '0', '0', null, '0', '0', '', 'box5', '', '0', '1');
INSERT INTO `tbl_modules` VALUES ('56', 'more', 'Quy trình thực hiện', '', '', '0', '0', null, '0', '0', 'process', 'box6', '', '0', '1');
INSERT INTO `tbl_modules` VALUES ('58', 'more', 'Aside - Ý kiến khách hàng', '', '', '0', '0', null, '0', '0', 'feedback', 'box8', '', '0', '1');
INSERT INTO `tbl_modules` VALUES ('61', 'partner', 'Slide đối tác', '', '', '0', '0', null, '0', null, '', 'user7', '', '0', '1');
INSERT INTO `tbl_modules` VALUES ('62', 'html', 'Mô tả dưới banner slide', '', '<div class=\"box-bottom\">\r\n						<div class=\"container\">\r\n							<div class=\"item\">\r\n								<div class=\"wrap-thumb\"><img src=\"http://localhost/letotrans/images/icons/icon-slide-01.png\" class=\"thumb img-responsive\"></div>\r\n								<p>Chất lượng dịch vụ cực tốt</p>\r\n							</div>\r\n							<div class=\"item\">\r\n								<div class=\"wrap-thumb\"><img src=\"http://localhost/letotrans/images/icons/icon-slide-02.png\" class=\"thumb img-responsive\"></div>\r\n								<p>Đội ngũ nhân viên giàu kinh nghiệm</p>\r\n							</div>\r\n							<div class=\"item\">\r\n								<div class=\"wrap-thumb\"><img src=\"http://localhost/letotrans/images/icons/icon-slide-03.png\" class=\"thumb img-responsive\"></div>\r\n								<p>Thanh toán dễ dàng tiện lợi</p>\r\n							</div>\r\n							<div class=\"item\">\r\n								<div class=\"wrap-thumb\"><img src=\"http://localhost/letotrans/images/icons/icon-slide-04.png\" class=\"thumb img-responsive\"></div>\r\n								<p>Giá cả tốt nhất thị trường</p>\r\n							</div>\r\n							<div class=\"item\">\r\n								<div class=\"wrap-thumb\"><img src=\"http://localhost/letotrans/images/icons/icon-slide-05.png\" class=\"thumb img-responsive\"></div>\r\n								<p>Miễn phí giao nhận tài liệu</p>\r\n							</div>\r\n						</div>\r\n					</div>', '0', '0', null, '0', '0', '', 'box1', '', '0', '1');
INSERT INTO `tbl_modules` VALUES ('63', 'more', 'Module languages', '', '', '0', '0', null, '0', '0', 'languages', 'ads1', '', '0', '1');
INSERT INTO `tbl_modules` VALUES ('75', 'html', 'Google map', '', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3723.7415077264172!2d105.81414881533225!3d21.04302649266612!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135ab10301dd91f%3A0x7bf7f7b69c64e61f!2sHCMCC%20Tower!5e0!3m2!1svi!2s!4v1569397961209!5m2!1svi!2s\" width=\"100%\" frameborder=\"0\" style=\"border:0;\" allowfullscreen=\"\"></iframe>', '0', '0', null, '0', '0', '', 'box10', '', '0', '1');
INSERT INTO `tbl_modules` VALUES ('76', 'mainmenu', 'Menu footer', '', '', '0', '2', null, '0', '0', 'menu_footer', 'box11', '', '0', '1');
INSERT INTO `tbl_modules` VALUES ('77', 'mainmenu', 'Footer menu 2', '', '', '0', '3', null, '0', '0', 'menu_footer', 'box7', '', '0', '1');

-- ----------------------------
-- Table structure for tbl_package
-- ----------------------------
DROP TABLE IF EXISTS `tbl_package`;
CREATE TABLE `tbl_package` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) DEFAULT NULL,
  `service_type_id` int(11) DEFAULT NULL,
  `price_basic` float DEFAULT NULL,
  `price_pro` float DEFAULT NULL,
  `price_vip` float DEFAULT NULL,
  `intro_basic` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `intro_pro` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `intro_vip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) DEFAULT '0',
  `isactive` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tbl_package
-- ----------------------------
INSERT INTO `tbl_package` VALUES ('1', '1', '1', '5', '1000', '300', '<ul>\r\n<li>everyday content</li>\r\n<li>blog posts</li>\r\n<li>user reviews</li>\r\n</ul>', '<ul>\r\n<li>business communication</li>\r\n<li>app or web localization</li>\r\n<li>product descriptions</li>\r\n</ul>', '<ul>\r\n<li>medical reports</li>\r\n<li>international agreements</li>\r\n<li>patents, licences</li>\r\n</ul>', '0', '1');
INSERT INTO `tbl_package` VALUES ('2', '1', '2', '50', '1000', '500', '<ul>\r\n<li>everyday content</li>\r\n<li>blog posts</li>\r\n<li>user reviews</li>\r\n</ul>', '<ul>\r\n<li>business communication</li>\r\n<li>app or web localization</li>\r\n<li>product descriptions</li>\r\n</ul>', '<ul>\r\n<li>medical reports</li>\r\n<li>international agreements</li>\r\n<li>patents, licences</li>\r\n</ul>', '0', '1');
INSERT INTO `tbl_package` VALUES ('3', '1', '3', '50', '2000', '500', '<ul>\r\n<li>everyday content</li>\r\n<li>blog posts</li>\r\n<li>user reviews</li>\r\n</ul>', '<ul>\r\n<li>business communication</li>\r\n<li>app or web localization</li>\r\n<li>product descriptions</li>\r\n</ul>', '<ul>\r\n<li>medical reports</li>\r\n<li>international agreements</li>\r\n<li>patents, licences</li>\r\n</ul>', '0', '1');
INSERT INTO `tbl_package` VALUES ('4', '1', '4', '50', '100', '500', '<ul>\r\n<li>everyday content</li>\r\n<li>blog posts</li>\r\n<li>user reviews</li>\r\n</ul>', '<ul>\r\n<li>business communication</li>\r\n<li>app or web localization</li>\r\n<li>product descriptions</li>\r\n</ul>', '<ul>\r\n<li>medical reports</li>\r\n<li>international agreements</li>\r\n<li>patents, licences</li>\r\n</ul>', '0', '1');
INSERT INTO `tbl_package` VALUES ('5', '2', '1', '50', '100', '500', '<ul>\r\n<li>everyday content</li>\r\n<li>blog posts</li>\r\n<li>user reviews</li>\r\n</ul>', '<ul>\r\n<li>business communication</li>\r\n<li>app or web localization</li>\r\n<li>product descriptions</li>\r\n</ul>', '<ul>\r\n<li>medical reports</li>\r\n<li>international agreements</li>\r\n<li>patents, licences</li>\r\n</ul>', '0', '1');
INSERT INTO `tbl_package` VALUES ('6', '2', '2', '50', '100', '500', '<ul>\r\n<li>everyday content</li>\r\n<li>blog posts</li>\r\n<li>user reviews</li>\r\n</ul>', '<ul>\r\n<li>business communication</li>\r\n<li>app or web localization</li>\r\n<li>product descriptions</li>\r\n</ul>', '<ul>\r\n<li>medical reports</li>\r\n<li>international agreements</li>\r\n<li>patents, licences</li>\r\n</ul>', '0', '1');
INSERT INTO `tbl_package` VALUES ('7', '2', '3', '50', '100', '500', '<ul>\r\n<li>everyday content</li>\r\n<li>blog posts</li>\r\n<li>user reviews</li>\r\n</ul>', '<ul>\r\n<li>business communication</li>\r\n<li>app or web localization</li>\r\n<li>product descriptions</li>\r\n</ul>', '<ul>\r\n<li>medical reports</li>\r\n<li>international agreements</li>\r\n<li>patents, licences</li>\r\n</ul>', '0', '1');
INSERT INTO `tbl_package` VALUES ('8', '2', '4', '50', '100', '500', '<ul>\r\n<li>everyday content</li>\r\n<li>blog posts</li>\r\n<li>user reviews</li>\r\n</ul>', '<ul>\r\n<li>business communication</li>\r\n<li>app or web localization</li>\r\n<li>product descriptions</li>\r\n</ul>', '<ul>\r\n<li>medical reports</li>\r\n<li>international agreements</li>\r\n<li>patents, licences</li>\r\n</ul>', '0', '1');
INSERT INTO `tbl_package` VALUES ('9', '3', '1', '50', '100', '500', '<ul>\r\n<li>everyday content</li>\r\n<li>blog posts</li>\r\n<li>user reviews</li>\r\n</ul>', '<ul>\r\n<li>business communication</li>\r\n<li>app or web localization</li>\r\n<li>product descriptions</li>\r\n</ul>', '<ul>\r\n<li>medical reports</li>\r\n<li>international agreements</li>\r\n<li>patents, licences</li>\r\n</ul>', '0', '1');
INSERT INTO `tbl_package` VALUES ('10', '3', '2', '50', '100', '500', '<ul>\r\n<li>everyday content</li>\r\n<li>blog posts</li>\r\n<li>user reviews</li>\r\n</ul>', '<ul>\r\n<li>business communication</li>\r\n<li>app or web localization</li>\r\n<li>product descriptions</li>\r\n</ul>', '<ul>\r\n<li>medical reports</li>\r\n<li>international agreements</li>\r\n<li>patents, licences</li>\r\n</ul>', '0', '1');
INSERT INTO `tbl_package` VALUES ('11', '3', '3', '50', '100', '500', '<ul>\r\n<li>everyday content</li>\r\n<li>blog posts</li>\r\n<li>user reviews</li>\r\n</ul>', '<ul>\r\n<li>business communication</li>\r\n<li>app or web localization</li>\r\n<li>product descriptions</li>\r\n</ul>', '<ul>\r\n<li>medical reports</li>\r\n<li>international agreements</li>\r\n<li>patents, licences</li>\r\n</ul>', '0', '1');
INSERT INTO `tbl_package` VALUES ('12', '3', '4', '50', '100', '500', '<ul>\r\n<li>everyday content</li>\r\n<li>blog posts</li>\r\n<li>user reviews</li>\r\n</ul>', '<ul>\r\n<li>business communication</li>\r\n<li>app or web localization</li>\r\n<li>product descriptions</li>\r\n</ul>', '<ul>\r\n<li>medical reports</li>\r\n<li>international agreements</li>\r\n<li>patents, licences</li>\r\n</ul>', '0', '1');
INSERT INTO `tbl_package` VALUES ('13', '4', '5', '50', '100', '500', '<ul>\r\n<li>everyday content</li>\r\n<li>blog posts</li>\r\n<li>user reviews</li>\r\n</ul>', '<ul>\r\n<li>business communication</li>\r\n<li>app or web localization</li>\r\n<li>product descriptions</li>\r\n</ul>', '<ul>\r\n<li>medical reports</li>\r\n<li>international agreements</li>\r\n<li>patents, licences</li>\r\n</ul>', '0', '1');
INSERT INTO `tbl_package` VALUES ('14', '4', '6', '50', '100', '500', '<ul>\r\n<li>everyday content</li>\r\n<li>blog posts</li>\r\n<li>user reviews</li>\r\n</ul>', '<ul>\r\n<li>business communication</li>\r\n<li>app or web localization</li>\r\n<li>product descriptions</li>\r\n</ul>', '<ul>\r\n<li>medical reports</li>\r\n<li>international agreements</li>\r\n<li>patents, licences</li>\r\n</ul>', '0', '1');
INSERT INTO `tbl_package` VALUES ('15', '4', '7', '50', '100', '500', '<ul>\r\n<li>everyday content</li>\r\n<li>blog posts</li>\r\n<li>user reviews</li>\r\n</ul>', '<ul>\r\n<li>business communication</li>\r\n<li>app or web localization</li>\r\n<li>product descriptions</li>\r\n</ul>', '<ul>\r\n<li>medical reports</li>\r\n<li>international agreements</li>\r\n<li>patents, licences</li>\r\n</ul>', '0', '1');
INSERT INTO `tbl_package` VALUES ('16', '4', '8', '50', '100', '500', '<ul>\r\n<li>everyday content</li>\r\n<li>blog posts</li>\r\n<li>user reviews</li>\r\n</ul>', '<ul>\r\n<li>business communication</li>\r\n<li>app or web localization</li>\r\n<li>product descriptions</li>\r\n</ul>', '<ul>\r\n<li>medical reports</li>\r\n<li>international agreements</li>\r\n<li>patents, licences</li>\r\n</ul>', '0', '1');

-- ----------------------------
-- Table structure for tbl_partner
-- ----------------------------
DROP TABLE IF EXISTS `tbl_partner`;
CREATE TABLE `tbl_partner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `images` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `order` tinyint(4) DEFAULT NULL,
  `isactive` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_partner
-- ----------------------------
INSERT INTO `tbl_partner` VALUES ('1', 'Đối tác 1', 'http://localhost/letotrans/images/doi-tac/doitac1.jpg', '', '1', '1');
INSERT INTO `tbl_partner` VALUES ('2', 'Đối tác 2', 'http://localhost/letotrans/images/doi-tac/doitac1.jpg', '', '2', '1');
INSERT INTO `tbl_partner` VALUES ('3', 'Đối tác 3', 'http://localhost/letotrans/images/doi-tac/doitac1.jpg', '', '3', '1');
INSERT INTO `tbl_partner` VALUES ('4', 'Đối tác 4', 'http://localhost/letotrans/images/doi-tac/doitac1.jpg', '', '4', '1');
INSERT INTO `tbl_partner` VALUES ('5', 'Đối tác 5', 'http://localhost/letotrans/images/doi-tac/doitac1.jpg', '', '5', '1');

-- ----------------------------
-- Table structure for tbl_price
-- ----------------------------
DROP TABLE IF EXISTS `tbl_price`;
CREATE TABLE `tbl_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang1` int(11) DEFAULT NULL,
  `lang2` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_price
-- ----------------------------
INSERT INTO `tbl_price` VALUES ('5', '129', '1', '2000');
INSERT INTO `tbl_price` VALUES ('6', '129', '23', '50');
INSERT INTO `tbl_price` VALUES ('7', '129', '53', '50');
INSERT INTO `tbl_price` VALUES ('8', '129', '61', '50');
INSERT INTO `tbl_price` VALUES ('9', '129', '134', '50');

-- ----------------------------
-- Table structure for tbl_product_type
-- ----------------------------
DROP TABLE IF EXISTS `tbl_product_type`;
CREATE TABLE `tbl_product_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `intro` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) DEFAULT '0',
  `isactive` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tbl_product_type
-- ----------------------------
INSERT INTO `tbl_product_type` VALUES ('1', 'Website', 'website', '<ul>\r\n<li>everyday content</li>\r\n<li>blog posts</li>\r\n<li>user reviews</li>\r\n</ul>', '0', '1');
INSERT INTO `tbl_product_type` VALUES ('2', 'Hồ sơ', 'ho-so', '<ul>\r\n<li>everyday content</li>\r\n<li>blog posts</li>\r\n<li>user reviews</li>\r\n</ul>', '0', '1');
INSERT INTO `tbl_product_type` VALUES ('3', 'Phần mềm', 'phan-mem', '<ul>\r\n<li>everyday content</li>\r\n<li>blog posts</li>\r\n<li>user reviews</li>\r\n</ul>', '0', '1');
INSERT INTO `tbl_product_type` VALUES ('4', 'Game', 'game', '<ul>\r\n<li>everyday content</li>\r\n<li>blog posts</li>\r\n<li>user reviews</li>\r\n</ul>', '0', '1');

-- ----------------------------
-- Table structure for tbl_seo
-- ----------------------------
DROP TABLE IF EXISTS `tbl_seo`;
CREATE TABLE `tbl_seo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_desc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ishot` tinyint(4) DEFAULT '0',
  `order` tinyint(4) DEFAULT '0',
  `isactive` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tbl_seo
-- ----------------------------
INSERT INTO `tbl_seo` VALUES ('1', 'Câu hỏi thường gặp', 'http://localhost/letotrans/cau-hoi-thuong-gap', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('2', 'Câu hỏi tổng quan', 'http://localhost/letotrans/cau-hoi-tong-quan', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('3', 'Câu hỏi về phiên dịch viên', 'http://localhost/letotrans/cau-hoi-ve-phien-dich-vien', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('4', 'Câu hỏi về phí dịch vụ', 'http://localhost/letotrans/cau-hoi-ve-phi-dich-vu', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('5', 'Online translation services - for those who need it fast!', 'http://localhost/letotrans/cau-hoi-thuong-gap/online-translation-services-for-those-who-need-it-fast.html', 'http://localhost/letotrans/images/hinh-anh/post-01.jpg', 'Online translation services - for those who need it fast!', 'Online translation services - for those who need it fast!', 'Online translation services - for those who need it fast!', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('6', 'Blog', 'http://localhost/letotrans/blog', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('7', '5 Simple Steps for a Successful Transcreation Project', 'http://localhost/letotrans/hop-tac/5-simple-steps-for-a-successful-transcreation-project.html', 'http://localhost/letotrans/images/hinh-anh/post-03.jpg', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('8', '5 Simple Steps for a Successful Transcreation Project', 'http://localhost/letotrans/hop-tac/5-simple-steps-for-a-successful-transcreation-project.html', 'http://localhost/letotrans/images/hinh-anh/post-03.jpg', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('9', 'Hiring an Interpreting Company: 7 Things to Consider', 'http://localhost/letotrans/blog/hiring-an-interpreting-company-7-things-to-consider.html', 'http://localhost/letotrans/images/hinh-anh/post-04.jpg', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('10', '10 Little Translation Mistakes That Caused Big Problems', 'http://localhost/letotrans/blog/10-little-translation-mistakes-that-caused-big-problems.html', 'http://localhost/letotrans/images/hinh-anh/post-05.jpg', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('11', '5 Steps to a Successful International Digital Marketing Strategy', 'http://localhost/letotrans/blog/5-steps-to-a-successful-international-digital-marketing-strategy.html', 'http://localhost/letotrans/images/hinh-anh/post-06.jpg', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('12', 'How to Overcome Cross Cultural Barriers in Business Negotiations', 'http://localhost/letotrans/blog/how-to-overcome-cross-cultural-barriers-in-business-negotiations.html', 'http://localhost/letotrans/images/hinh-anh/post-07.jpg', 'How to Overcome Cross Cultural Barriers in Business Negotiations', 'How to Overcome Cross Cultural Barriers in Business Negotiations', 'How to Overcome Cross Cultural Barriers in Business Negotiations', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('13', 'How to Create an Effective Multilingual Content Strategy', 'http://localhost/letotrans/blog/how-to-create-an-effective-multilingual-content-strategy.html', 'http://localhost/letotrans/images/hinh-anh/post-08.jpg', 'How to Create an Effective Multilingual Content Strategy', 'How to Create an Effective Multilingual Content Strategy', 'How to Create an Effective Multilingual Content Strategy', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('14', 'The Word Point is Recognized by Clutch for Outstanding Accuracy in Translation Services', 'http://localhost/letotrans/cau-hoi-tong-quan/the-word-point-is-recognized-by-clutch-for-outstanding-accuracy-in-translation-services.html', 'http://localhost/letotrans/images/hinh-anh/post-09.jpg', 'The Word Point is Recognized by Clutch for Outstanding Accuracy in Translation Services', 'The Word Point is Recognized by Clutch for Outstanding Accuracy in Translation Services', 'The Word Point is Recognized by Clutch for Outstanding Accuracy in Translation Services', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('15', 'How to Protect Your Brand with Trademark Translation', 'http://localhost/letotrans/cau-hoi-tong-quan/how-to-protect-your-brand-with-trademark-translation.html', 'http://localhost/letotrans/images/hinh-anh/post-10.jpg', 'How to Protect Your Brand with Trademark Translation', 'How to Protect Your Brand with Trademark Translation', 'How to Protect Your Brand with Trademark Translation', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('20', 'Bản địa hóa nội dung', 'http://localhost/letotrans/dich-vu/ban-dia-hoa-noi-dung.html', 'http://localhost/letotrans/images/basic/politic_07.jpg', 'Dịch vụ dịch thuật', 'Dịch vụ dịch thuật', 'Dịch vụ dịch thuật', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('21', 'Hiệu đính bản dịch', 'http://localhost/letotrans/dich-vu/hieu-dinh-ban-dich.html', 'http://localhost/letotrans/images/basic/politic_07.jpg', 'Phi&ecirc;n dịch giấy tờ chứng nhận', 'Phi&ecirc;n dịch giấy tờ chứng nhận', 'Phi&ecirc;n dịch giấy tờ chứng nhận', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('22', 'Chứng nhận bản dịch', 'http://localhost/letotrans/dich-vu/chung-nhan-ban-dich.html', 'http://localhost/letotrans/images/basic/politic_07.jpg', 'Sửa bản in thử', 'Sửa bản in thử', 'Sửa bản in thử', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('23', 'Biên dịch', 'http://localhost/letotrans/dich-vu/bien-dich.html', 'http://localhost/letotrans/images/basic/politic_07.jpg', 'Dịch bản địa h&oacute;a', 'Dịch bản địa h&oacute;a', 'Dịch bản địa h&oacute;a', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('24', 'Thêm mới gói dịch vụ', 'http://localhost/letotrans/dich-vu/them-moi-goi-dich-vu.html', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('25', 'Dịch vụ dịch thuật 1', 'http://localhost/letotrans/dich-vu/dich-vu-dich-thuat-1.html', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('26', 'Dịch vụ dịch thuật 1', 'http://localhost/letotrans/dich-vu/dich-vu-dich-thuat-1.html', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('27', 'DAVID MATIN', 'http://localhost/letotrans/dich-vu/david-matin.html', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('28', 'DAVID MATIN', 'http://localhost/letotrans/dich-vu/david-matin.html', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('29', 'Dịch vụ dịch thuật 123', 'http://localhost/letotrans/dich-vu/dich-vu-dich-thuat-123.html', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('30', 'Biên dịch', 'http://localhost/letotrans/dich-vu/bien-dich.html', 'http://localhost/letotrans/images/basic/politic_07.jpg', 'Dịch bản địa h&oacute;a', 'Dịch bản địa h&oacute;a', 'Dịch bản địa h&oacute;a', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('34', 'Hợp tác', 'http://localhost/letotrans/hop-tac', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('58', 'Biên dịch 1', 'http://localhost/letotrans/dich-vu/bien-dich/chung-chung/', '', 'Bi&ecirc;n dịch 1', 'Bi&ecirc;n dịch 1', 'Bi&ecirc;n dịch 1', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('59', 'Biên dịch 2', 'http://localhost/letotrans/dich-vu/bien-dich/hop-phap/', '', 'Bi&ecirc;n dịch 2', 'Bi&ecirc;n dịch 2', 'Bi&ecirc;n dịch 2', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('60', 'Biên dịch 3', 'http://localhost/letotrans/dich-vu/bien-dich/duoc-pham/', '', 'Bi&ecirc;n dịch 3', 'Bi&ecirc;n dịch 3', 'Bi&ecirc;n dịch 3', '0', '0', '1');

-- ----------------------------
-- Table structure for tbl_service
-- ----------------------------
DROP TABLE IF EXISTS `tbl_service`;
CREATE TABLE `tbl_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_type_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `par_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sapo` text COLLATE utf8mb4_unicode_ci,
  `fulltext` text COLLATE utf8mb4_unicode_ci,
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` float DEFAULT NULL,
  `author` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cdate` int(11) DEFAULT NULL,
  `mdate` int(11) DEFAULT NULL,
  `visited` int(255) DEFAULT NULL,
  `order` tinyint(4) DEFAULT '0',
  `isactive` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tbl_service
-- ----------------------------
INSERT INTO `tbl_service` VALUES ('1', '[\"5\",\"6\",\"7\",\"8\"]', '0', 'Bản địa hóa nội dung', 'ban-dia-hoa-noi-dung', 'Businesses, non-profits, scientific communities, and more all feel the demand for translators. Their options are to try to locate individual translators for each language, spend time with screening and checking backgrounds and experience, or to streamline the process by contracting these services out to professional and reputable online translation services.', '<p>T&ocirc;i h&agrave;i l&ograve;ng về dịch vụ bảo h&agrave;nh ở đ&acirc;y, c&aacute;c kỹ sư sau khi sửa &ocirc; t&ocirc; Lexus c&ograve;n gọi điện chăm s&oacute;c v&agrave; hỏi thăm t&igrave;nh trạng &ocirc; t&ocirc; sau khi sửa chữa. Dịch vụ ở đ&acirc;y ho&agrave;n to&agrave;n thuyết phục một kh&aacute;ch h&agrave;ng kh&oacute; t&iacute;nh như t&ocirc;i</p>', 'http://localhost/letotrans/images/basic/linh-vuc-04.jpg', '2', 'admin', '1569774547', '1570994664', null, '3', '1');
INSERT INTO `tbl_service` VALUES ('2', '[\"1\",\"2\",\"3\",\"4\"]', '0', 'Hiệu đính bản dịch', 'hieu-dinh-ban-dich', 'Businesses, non-profits, scientific communities, and more all feel the demand for translators. Their options are to try to locate individual translators for each language, spend time with screening and checking backgrounds and experience, or to streamline the process by contracting these services out to professional and reputable online translation services.', '', 'http://localhost/letotrans/images/basic/linh-vuc-03.jpg', '1.4', 'admin', '1569774847', '1570994650', null, '2', '1');
INSERT INTO `tbl_service` VALUES ('3', '[\"1\",\"2\",\"3\",\"4\"]', '0', 'Chứng nhận bản dịch', 'chung-nhan-ban-dich', 'Businesses, non-profits, scientific communities, and more all feel the demand for translators. Their options are to try to locate individual translators for each language, spend time with screening and checking backgrounds and experience, or to streamline the process by contracting these services out to professional and reputable online translation services.', '', 'http://localhost/letotrans/images/basic/linh-vuc-02.jpg', '1', 'admin', '1569774861', '1570994633', null, '1', '1');
INSERT INTO `tbl_service` VALUES ('4', '[\"1\",\"2\",\"3\",\"4\"]', '0', 'Biên dịch', 'bien-dich', 'Businesses, non-profits, scientific communities, and more all feel the demand for translators. Their options are to try to locate individual translators for each language, spend time with screening and checking backgrounds and experience, or to streamline the process by contracting these services out to professional and reputable online translation services.', '', 'http://localhost/letotrans/images/basic/linh-vuc-01.jpg', '0.5', 'admin', '1569774901', '1570994639', null, '0', '1');

-- ----------------------------
-- Table structure for tbl_service_doc
-- ----------------------------
DROP TABLE IF EXISTS `tbl_service_doc`;
CREATE TABLE `tbl_service_doc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) DEFAULT NULL,
  `service_type_id` int(11) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `intro` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `sapo` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `fulltext` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `order` int(11) DEFAULT '0',
  `isactive` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tbl_service_doc
-- ----------------------------
INSERT INTO `tbl_service_doc` VALUES ('38', '4', '1', 'Biên dịch 1', 'Your company’s reach might be global, but if you want to reach customers all over the world, you have to approach them in a way that is familiar and appealing. This means localization. Translation services are a part of this process, but they are simply not enough. Culture and communication matter.', null, '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n<p>Your company&rsquo;s reach might be global, but if you want to reach customers all over the world, you have to approach them in a way that is familiar and appealing. This means localization. Translation services are a part of this process, but they are simply not enough. Culture and communication matter.</p>\r\n<p>Why Does Localization Matter?<br />Have you ever visited a website, then realized, after reading a few sentences that the person who wrote the content wasn&rsquo;t a native speaker of that language? The spelling and grammar might have been okay, even better than average. Still, you could tell something was off. The phrasing wasn\'t usual. Perhaps idioms were used in ways that weren&rsquo;t quite right.</p>\r\n<p>Order Website Localization Services</p>\r\n<p>If you found the experience discouraging, you aren&rsquo;t alone. If you clicked away, you aren&rsquo;t alone either. People, as a whole, want to do business with companies that show an understanding of their culture and local manner of communication. This is why localization is very important. It&rsquo;s why we go beyond providing simple translation services and offer website localization.</p>\r\n<p>We Start With Translation<br />Our certified translators will begin the localization process by translating your website content in to any language that you need. However, these aren&rsquo;t translators who simply have an academic mastery of a language, they also understand communities and cultures. This means that they focus, not simply on translating the language, but also in finding ways to interpret your content that is most appealing to your target audience. They&rsquo;ll also help you to avoid unintentionally offending your audience.</p>\r\n<p>Can Most of Your Target Audience Speak English? You May Still Need Localization Services<br />In order to provide the optimum service and to impress customers you may wish to localize, even if there is no language barrier. For one thing, people simply feel more comfortable conducting business in their native tongue. In addition to this, if you have taken the time and effort to localize your website in order to facilitate understanding, your target audience is going to be much more likely to believe you will provide excellent service in all areas.</p>\r\n<p>We&rsquo;ll Help You to Figure Out When And How Much<br />We will come up with a localization plan that matches your goals and objectives as they relate to growth and sales. In some cases, it may be right to jump in and reach out to as many markets as possible. In other cases, the determination might be made to hold back and only target one or two new markets. Our goal is to help create a localization roadmap that complements your business plan.</p>\r\n<p>Once we have that is cleared, we&rsquo;ll figure out how much localization is needed. We&rsquo;ll take the following into consideration:</p>\r\n<p>What needs to be done to translate your content in a way that is useful?<br />We&rsquo;ll take cultural matters into consideration<br />We&rsquo;ll ensure that translation isn&rsquo;t just accurate but also relatable<br />Is a full or partial translation effort needed<br />Sometimes using a mix of English and the target language works best<br />If your audience is generally familiar with the structure of English language websites, you can usually keep tabs and buttons and other elements in English while translating other content<br />Timely But Not Rushed<br />We understand the need to reach out to new markets quickly. If you&rsquo;re competitors are already there, we know that waiting can be tortuous. We also realize that there are tools and services available that promise auto translation. These will certainly be faster, but they won&rsquo;t be nearly as personalized. They also don&rsquo;t come with the cultural understanding that our professional translators have.</p>\r\n</body>\r\n</html>', '0', '1');
INSERT INTO `tbl_service_doc` VALUES ('39', '4', '2', 'Biên dịch 2', 'Your company’s reach might be global, but if you want to reach customers all over the world, you have to approach them in a way that is familiar and appealing. This means localization. Translation services are a part of this process, but they are simply not enough. Culture and communication matter.\r\n', null, '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n<p>Your company&rsquo;s reach might be global, but if you want to reach customers all over the world, you have to approach them in a way that is familiar and appealing. This means localization. Translation services are a part of this process, but they are simply not enough. Culture and communication matter.</p>\r\n<p>Why Does Localization Matter?<br />Have you ever visited a website, then realized, after reading a few sentences that the person who wrote the content wasn&rsquo;t a native speaker of that language? The spelling and grammar might have been okay, even better than average. Still, you could tell something was off. The phrasing wasn\'t usual. Perhaps idioms were used in ways that weren&rsquo;t quite right.</p>\r\n<p>Order Website Localization Services</p>\r\n<p>If you found the experience discouraging, you aren&rsquo;t alone. If you clicked away, you aren&rsquo;t alone either. People, as a whole, want to do business with companies that show an understanding of their culture and local manner of communication. This is why localization is very important. It&rsquo;s why we go beyond providing simple translation services and offer website localization.</p>\r\n<p>We Start With Translation<br />Our certified translators will begin the localization process by translating your website content in to any language that you need. However, these aren&rsquo;t translators who simply have an academic mastery of a language, they also understand communities and cultures. This means that they focus, not simply on translating the language, but also in finding ways to interpret your content that is most appealing to your target audience. They&rsquo;ll also help you to avoid unintentionally offending your audience.</p>\r\n<p>Can Most of Your Target Audience Speak English? You May Still Need Localization Services<br />In order to provide the optimum service and to impress customers you may wish to localize, even if there is no language barrier. For one thing, people simply feel more comfortable conducting business in their native tongue. In addition to this, if you have taken the time and effort to localize your website in order to facilitate understanding, your target audience is going to be much more likely to believe you will provide excellent service in all areas.</p>\r\n<p>We&rsquo;ll Help You to Figure Out When And How Much<br />We will come up with a localization plan that matches your goals and objectives as they relate to growth and sales. In some cases, it may be right to jump in and reach out to as many markets as possible. In other cases, the determination might be made to hold back and only target one or two new markets. Our goal is to help create a localization roadmap that complements your business plan.</p>\r\n<p>Once we have that is cleared, we&rsquo;ll figure out how much localization is needed. We&rsquo;ll take the following into consideration:</p>\r\n<p>What needs to be done to translate your content in a way that is useful?<br />We&rsquo;ll take cultural matters into consideration<br />We&rsquo;ll ensure that translation isn&rsquo;t just accurate but also relatable<br />Is a full or partial translation effort needed<br />Sometimes using a mix of English and the target language works best<br />If your audience is generally familiar with the structure of English language websites, you can usually keep tabs and buttons and other elements in English while translating other content<br />Timely But Not Rushed<br />We understand the need to reach out to new markets quickly. If you&rsquo;re competitors are already there, we know that waiting can be tortuous. We also realize that there are tools and services available that promise auto translation. These will certainly be faster, but they won&rsquo;t be nearly as personalized. They also don&rsquo;t come with the cultural understanding that our professional translators have.</p>\r\n</body>\r\n</html>', '0', '1');
INSERT INTO `tbl_service_doc` VALUES ('40', '4', '3', 'Biên dịch 3', 'Your company’s reach might be global, but if you want to reach customers all over the world, you have to approach them in a way that is familiar and appealing. This means localization. Translation services are a part of this process, but they are simply not enough. Culture and communication matter.\r\n', null, '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n<p>Your company&rsquo;s reach might be global, but if you want to reach customers all over the world, you have to approach them in a way that is familiar and appealing. This means localization. Translation services are a part of this process, but they are simply not enough. Culture and communication matter.</p>\r\n<p>Why Does Localization Matter?<br />Have you ever visited a website, then realized, after reading a few sentences that the person who wrote the content wasn&rsquo;t a native speaker of that language? The spelling and grammar might have been okay, even better than average. Still, you could tell something was off. The phrasing wasn\'t usual. Perhaps idioms were used in ways that weren&rsquo;t quite right.</p>\r\n<p>Order Website Localization Services</p>\r\n<p>If you found the experience discouraging, you aren&rsquo;t alone. If you clicked away, you aren&rsquo;t alone either. People, as a whole, want to do business with companies that show an understanding of their culture and local manner of communication. This is why localization is very important. It&rsquo;s why we go beyond providing simple translation services and offer website localization.</p>\r\n<p>We Start With Translation<br />Our certified translators will begin the localization process by translating your website content in to any language that you need. However, these aren&rsquo;t translators who simply have an academic mastery of a language, they also understand communities and cultures. This means that they focus, not simply on translating the language, but also in finding ways to interpret your content that is most appealing to your target audience. They&rsquo;ll also help you to avoid unintentionally offending your audience.</p>\r\n<p>Can Most of Your Target Audience Speak English? You May Still Need Localization Services<br />In order to provide the optimum service and to impress customers you may wish to localize, even if there is no language barrier. For one thing, people simply feel more comfortable conducting business in their native tongue. In addition to this, if you have taken the time and effort to localize your website in order to facilitate understanding, your target audience is going to be much more likely to believe you will provide excellent service in all areas.</p>\r\n<p>We&rsquo;ll Help You to Figure Out When And How Much<br />We will come up with a localization plan that matches your goals and objectives as they relate to growth and sales. In some cases, it may be right to jump in and reach out to as many markets as possible. In other cases, the determination might be made to hold back and only target one or two new markets. Our goal is to help create a localization roadmap that complements your business plan.</p>\r\n<p>Once we have that is cleared, we&rsquo;ll figure out how much localization is needed. We&rsquo;ll take the following into consideration:</p>\r\n<p>What needs to be done to translate your content in a way that is useful?<br />We&rsquo;ll take cultural matters into consideration<br />We&rsquo;ll ensure that translation isn&rsquo;t just accurate but also relatable<br />Is a full or partial translation effort needed<br />Sometimes using a mix of English and the target language works best<br />If your audience is generally familiar with the structure of English language websites, you can usually keep tabs and buttons and other elements in English while translating other content<br />Timely But Not Rushed<br />We understand the need to reach out to new markets quickly. If you&rsquo;re competitors are already there, we know that waiting can be tortuous. We also realize that there are tools and services available that promise auto translation. These will certainly be faster, but they won&rsquo;t be nearly as personalized. They also don&rsquo;t come with the cultural understanding that our professional translators have.</p>\r\n</body>\r\n</html>', '0', '1');

-- ----------------------------
-- Table structure for tbl_service_type
-- ----------------------------
DROP TABLE IF EXISTS `tbl_service_type`;
CREATE TABLE `tbl_service_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sapo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `intro` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `order` tinyint(4) DEFAULT '0',
  `isactive` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_service_type
-- ----------------------------
INSERT INTO `tbl_service_type` VALUES ('1', 'Chung chung', 'chung-chung', 'http://localhost/letotrans/images/icons/icon-service-type-01.png', null, null, '0', '1');
INSERT INTO `tbl_service_type` VALUES ('2', 'Hợp ph&aacute;p', 'hop-phap', 'http://localhost/letotrans/images/icons/icon-service-type-02.png', null, null, '0', '1');
INSERT INTO `tbl_service_type` VALUES ('3', 'Dược phẩm', 'duoc-pham', 'http://localhost/letotrans/images/icons/icon-service-type-03.png', null, null, '0', '1');
INSERT INTO `tbl_service_type` VALUES ('4', 'Kỹ thuật', 'ky-thuat', 'http://localhost/letotrans/images/icons/icon-service-type-04.png', null, null, '0', '1');
INSERT INTO `tbl_service_type` VALUES ('5', 'Website', 'website', 'http://localhost/letotrans/images/icons/icon-service-type-05.png', null, null, '0', '1');
INSERT INTO `tbl_service_type` VALUES ('6', 'Hồ sơ', 'ho-so', 'http://localhost/letotrans/images/icons/icon-service-type-06.png', null, null, '0', '1');
INSERT INTO `tbl_service_type` VALUES ('7', 'Phần mềm', 'phan-mem', 'http://localhost/letotrans/images/icons/icon-service-type-07.png', null, null, '0', '1');
INSERT INTO `tbl_service_type` VALUES ('8', 'Game', 'game', 'http://localhost/letotrans/images/icons/icon-service-type-08.png', null, null, '0', '1');

-- ----------------------------
-- Table structure for tbl_slider
-- ----------------------------
DROP TABLE IF EXISTS `tbl_slider`;
CREATE TABLE `tbl_slider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slogan` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `intro` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `isactive` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tbl_slider
-- ----------------------------
INSERT INTO `tbl_slider` VALUES ('18', 'DỊCH THUẬT LETO TRANS <br> PHỤC VỤ 24/24H SUỐT 365 NGÀY KỂ CẢ NGÀY NGHỈ LỄ.', 'Đặt lịch hẹn Hôm nay <span style=\"color: rgb(250, 121, 1); font-weight: bold;\">GIẢM NGAY 15%</span><div><br><div><button class=\"btn btn-view\">ĐẶT LỊCH SỬA CHỮA</button></div></div>', '0', 'http://localhost/letotrans/images/banner/banner-01.jpg', '', null, '1');
INSERT INTO `tbl_slider` VALUES ('19', 'DỊCH THUẬT LETO TRANS <br> PHỤC VỤ 24/24H SUỐT 365 NGÀY KỂ CẢ NGÀY NGHỈ LỄ.', 'Đặt lịch hẹn Hôm nay <span style=\"color: rgb(250, 121, 1); font-weight: bold;\">GIẢM NGAY 15%</span><div><br><div><button class=\"btn btn-view\">ĐẶT LỊCH SỬA CHỮA</button></div></div>', '0', 'http://localhost/letotrans/images/banner/banner-01.jpg', '', null, '1');
INSERT INTO `tbl_slider` VALUES ('20', 'DỊCH THUẬT LETO TRANS <br> PHỤC VỤ 24/24H SUỐT 365 NGÀY KỂ CẢ NGÀY NGHỈ LỄ.', 'Đặt lịch hẹn Hôm nay <span style=\"color: rgb(250, 121, 1); font-weight: bold;\">GIẢM NGAY 15%</span><div><br><div><button class=\"btn btn-view\">ĐẶT LỊCH SỬA CHỮA</button></div></div>', '0', 'http://localhost/letotrans/images/banner/banner-01.jpg', '', null, '1');

-- ----------------------------
-- Table structure for tbl_subscribe
-- ----------------------------
DROP TABLE IF EXISTS `tbl_subscribe`;
CREATE TABLE `tbl_subscribe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isactive` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tbl_subscribe
-- ----------------------------
INSERT INTO `tbl_subscribe` VALUES ('1', 'Trần Viết Hiệp', 'tranviethiepdz@gmail.com', '1');
INSERT INTO `tbl_subscribe` VALUES ('4', 'Trần Viết Hiệp', 'tranviethiepdz@gmail.com', '1');

-- ----------------------------
-- Table structure for tbl_user
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE `tbl_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthday` date NOT NULL,
  `gender` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identify` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `organ` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `joindate` datetime NOT NULL,
  `lastlogin` datetime NOT NULL,
  `gid` int(11) NOT NULL,
  `isroot` tinyint(4) DEFAULT NULL,
  `isactive` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tbl_user
-- ----------------------------
INSERT INTO `tbl_user` VALUES ('1', 'igf', 'd93a5def7511da3d0f2d171d9c344e91', 'IGF', 'JSC', '0000-00-00', '', '', '', '', '', null, null, null, '0000-00-00 00:00:00', '2019-09-03 01:15:04', '1', null, '1');
INSERT INTO `tbl_user` VALUES ('2', 'admin', 'd93a5def7511da3d0f2d171d9c344e91', 'THC', 'Admin', '0000-00-00', '0', '', '123456789', '', 'a@gmail.com', null, '1111111111', '', '2019-07-23 17:13:50', '2019-10-16 04:12:57', '1', null, '1');

-- ----------------------------
-- Table structure for tbl_user_group
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user_group`;
CREATE TABLE `tbl_user_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `par_id` int(11) DEFAULT '0',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `intro` text COLLATE utf8mb4_unicode_ci,
  `permission` int(11) NOT NULL DEFAULT '0',
  `isadmin` int(11) NOT NULL DEFAULT '0',
  `isroot` tinyint(4) DEFAULT NULL,
  `isboss` tinyint(4) DEFAULT '1',
  `isactive` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tbl_user_group
-- ----------------------------
INSERT INTO `tbl_user_group` VALUES ('1', '0', 'Super Admin', '', '8388607', '1', null, '1', '1');
INSERT INTO `tbl_user_group` VALUES ('2', '1', 'Admin', '', '6291448', '0', null, '1', '1');
INSERT INTO `tbl_user_group` VALUES ('3', '2', 'Content', '', '992', '0', null, '1', '1');
INSERT INTO `tbl_user_group` VALUES ('4', '2', 'Dangky', '', '49152', '0', null, '1', '1');
