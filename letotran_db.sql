-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 30, 2019 at 02:34 PM
-- Server version: 5.7.28-log-cll-lve
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `letotran_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_album`
--

CREATE TABLE `tbl_album` (
  `id` int(11) NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `code` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thumb` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `intro` text COLLATE utf8_unicode_ci NOT NULL,
  `cdate` datetime NOT NULL,
  `visited` int(11) DEFAULT '0',
  `order` tinyint(5) DEFAULT NULL,
  `isactive` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_album`
--

INSERT INTO `tbl_album` (`id`, `group_id`, `code`, `thumb`, `name`, `intro`, `cdate`, `visited`, `order`, `isactive`) VALUES
(1, 0, 'thu-vien-anh', '', 'Thư viện ảnh', '', '2019-07-14 17:27:09', 5, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_categories`
--

CREATE TABLE `tbl_categories` (
  `id` int(11) NOT NULL,
  `par_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thumb` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `intro` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `order` int(11) DEFAULT '0',
  `lag_id` int(11) DEFAULT '0',
  `isactive` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_categories`
--

INSERT INTO `tbl_categories` (`id`, `par_id`, `name`, `code`, `thumb`, `intro`, `order`, `lag_id`, `isactive`) VALUES
(1, 0, 'Câu hỏi thường gặp', 'cau-hoi-thuong-gap', '', '', 0, 0, 1),
(2, 1, 'Câu hỏi tổng quan', 'cau-hoi-tong-quan', '', '', 0, 0, 0),
(3, 1, 'Câu hỏi về phiên dịch viên', 'cau-hoi-ve-phien-dich-vien', '', '', 0, 0, 1),
(4, 1, 'Câu hỏi về phí dịch vụ', 'cau-hoi-ve-phi-dich-vu', '', '', 0, 0, 1),
(5, 0, 'Blog', 'blog', '', '', 0, 0, 1),
(6, 0, 'Hợp tác', 'hop-tac', '', '', 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_configsite`
--

CREATE TABLE `tbl_configsite` (
  `config_id` int(11) NOT NULL,
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
  `youtube` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_configsite`
--

INSERT INTO `tbl_configsite` (`config_id`, `tem_id`, `company_name`, `title`, `intro`, `address`, `phone`, `tel`, `fax`, `email`, `website`, `banner`, `logo`, `work_time`, `meta_keyword`, `meta_descript`, `lang_id`, `contact`, `footer`, `nick_yahoo`, `name_yahoo`, `skype1`, `skype2`, `twitter`, `gplus`, `facebook`, `youtube`) VALUES
(1, 0, 'Dịch thuật LETOtrans', 'Dịch thuật LETOtrans', '', 'Tầng 4, Tòa Parkson, Số 1 Thái Hà, P. Trung Liệt, Q. Đống Đa, Hà Nội', '19006258', '0972768558 - 0988301609', '02435335122', 'info@letotrans.vn', '', '', '', 'Biên dịch 24/7', 'dich thuat, phien dich, dich cong chung, cong ty dich thuat, dich thuat tai ha noi', 'Hãng dịch thuật chuyên nghiệp, chuyên biên dịch, phiên dịch, hiệu đính và bản địa hóa nội dung', 0, '', '', '', '', '', '', '', '', 'https://www.facebook.com/congtyluatLETO/', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_contact`
--

CREATE TABLE `tbl_contact` (
  `id` int(11) NOT NULL,
  `fullname` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tittle` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contents` text COLLATE utf8_unicode_ci,
  `cdate` int(11) DEFAULT NULL,
  `isactive` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_contents`
--

CREATE TABLE `tbl_contents` (
  `id` int(11) NOT NULL,
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
  `isactive` tinyint(4) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_contents`
--

INSERT INTO `tbl_contents` (`id`, `category_id`, `title`, `code`, `thumb`, `images`, `sapo`, `intro`, `fulltext`, `type_of_land_id`, `area`, `price`, `list_conid`, `list_tagid`, `author`, `cdate`, `mdate`, `visited`, `order`, `ispay`, `ishot`, `isactive`) VALUES
(1, 1, 'Khách hàng cũ của chúng tôi là ai? - Who Represent Our Returning Customers?', 'khach-hang-cu-cua-chung-toi-la-ai-who-represent-our-returning-customers', '', '[]', '', '', '<p style=\"text-align: justify; \">Chúng tôi tự hào cung cấp dịch vụ dịch thuật của mình cho các doanh nghiệp thuộc mọi quy mô. Chúng tôi đã làm việc với các tập đoàn đa quốc gia, các doanh nghiệp nhỏ, các tổ chức chính phủ, nhóm khởi nghiệp và nhiều đối tượng khác. LETOtrans cũng làm việc với các cá nhân, bao gồm cả sinh viên, người nước ngoài. Có thể bạn chỉ đơn giản cần dịch Giấy khai sinh, hoặc dich dự án cá nhân của mình để cung cấp cho đối tác nước ngoài.</p><p style=\"text-align: justify; \"><i>We are proud to offer our translation services to businesses of all sizes. We have worked with multinational corporations, small businesses, government organizations, start-ups, and everything in between. TheWordPoint also works with individuals, including students, expats, and solopreneurs. Perhaps, you require official translations of your birth certificate or you simply want to make your personal projects available to people abroad.</i><br></p><p style=\"text-align: justify; \">Nếu bạn chưa bao giờ sử dụng dịch vụ dịch thuật trước đây, bạn có thể không chắc chắn về chất lượng dịch của các đơn vị dịch thuật. May mắn thay, đội ngũ kinh doanh thân thiện của chúng tôi sẽ luôn có mặt để hỗ trợ cho bạn. Từ khi bạn đặt hàng/gửi yêu cầu dịch, chúng tôi sẽ coi bạn là khách hàng quan trọng. Chúng tôi không chỉ dịch bằng người dịch, chúng tôi còn chăm sóc khách hàng bằng con người, không phải là các phần mềm.</p><p style=\"text-align: justify; \"><i>If you have never used a translation service before, you may be uncertain as to what you can expect. Fortunately, our friendly team will always be on hand. From the time you place your order, we will treat you as the valued customer you are. Not only do we use human translation, but we also use human customer service.</i><br></p><p style=\"text-align: justify; \">Chúng tôi rất vui mừng là nhiều khách hàng của chúng tôi quay lại với chúng tôi nhiều lần. Như lời chứng thực của họ cho việc bị ấn tượng bởi tính chuyên nghiệp nhất quán, đạo đức làm việc và cam kết giao kết quả dịch đúng hạn của chúng tôi. Chúng tôi đã liên tục xây dựng một thương hiệu xuất sắc như một công ty dịch thuật chuyên nghiệp trong những năm qua, và hiện là một thương hiệu dịch thuật được xếp hạng cao.</p><p style=\"text-align: justify; \"><i>We are delighted to report that many of our customers return to us time and time again. As their testimonials show, they are impressed by our consistent professionalism, work ethic, and commitment to delivering on time. We have steadily built an outstanding reputation as an online professional translation agency over the years, and are now ranked highly as a translation service company.</i><br></p><p style=\"text-align: justify; \">Dù quy mô dự án của bạn là gì, chúng tôi sẽ xem xét nhu cầu của bạn trên cơ sở độc lập và tạo ra kết quả dịch được hoàn thiện để đảm bảo thông điệp của bạn phù hợp hoàn toàn với đối tượng sẽ nhận bản dịch của bạn. Nếu bạn cần một công ty dịch vụ dịch thuật thực sự phục vụ mọi nhu cầu của mình, LETOtrans sẽ là lựa chọn đầu tiên của bạn.</p><p style=\"text-align: justify; \"><i>Whatever the size of your project, we will consider your needs on an individual basis and produce finely-honed text that will ensure your message fits perfectly with your target audience. If you need a translation service company that truly caters to everybody’s needs, LETOtrans should be your first choice.</i><br></p>', 0, 0, 0, NULL, NULL, 'admin', 1569423295, 1571942735, 1, 0, 1, 0, 1),
(2, 6, '5 Simple Steps for a Successful Transcreation Project', '5-simple-steps-for-a-successful-transcreation-project', 'http://letotrans.vn/images/hinh-anh/post-03.jpg', '[]', '', '<p>When you want to launch a brand or communicate a goal in another language you need to do more than simply translate your work. What you need is a transcreation specialist, so let&rsquo;s take a look at what they do, and how they can help.</p>', '<p>What is transcreation?</p>\r\n<p>Transcreation refers to the process of taking a message communicated in one language and expressing it with the exact same meaning and sentiment in a second language. It&rsquo;s subtly different from standard translation because of the attention paid to cultural differences and societal context.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>If you want to ensure that your brand communicates the same vision in a variety of different languages you need to think about transcreation. It&rsquo;s the process that will make sure everything you say is on-message and has the right voice &mdash; 2 things that can be easily missed if you perform a literal word-for-word translation. It will also focus on the imagery that relates to the text to ensure everything fits together as intended.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>What results from the process of translation?</p>\r\n<p>Translation focuses on the written content of your project. It&rsquo;s all about finding the right words to express the core ideas in the same manner, whilst maintaining readability at every turn. The end result will be a piece of engaging text in the native language of your target audience.</p>\r\n<p>&nbsp;</p>\r\n<p>Now that we&rsquo;ve introduced you to the basic principles, let&rsquo;s take a look at the 5 simple steps you need to follow.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>Manage your translation project</p>\r\n<p>Project management is such an important skill that it&rsquo;s no wonder there are people who spend an entire career doing it. You need to set deadlines, deliverables, and always make yourself easily contactable. It can be easy to think that your translator will be able to take care of everything purely because they speak the language, but that&rsquo;s rarely the case. They&rsquo;ll need input, guidance, and context from you if you&rsquo;re going to arrive at an end result you&rsquo;re happy with. The more information and assistance you give them, the faster the project will be signed off and completed.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>Align expectations from day one&nbsp;</p>\r\n<p>You need to layout the scope of the work from the moment you start. If you want someone to simply translate a piece of text, tell them. If on the other hand, you need full transcreation that covers everything from the wording and tag lines right the way through to imagery, say that&rsquo;s what you need. Everyone involved will appreciate the time you&rsquo;ve taken to bring them up to speed, and it&rsquo;s the best way to make sure there aren&rsquo;t any nasty surprises 2 weeks into the project.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>Communicate your vision clearly&nbsp;</p>\r\n<p>Giving everyone a clear vision of what you want the text to look and feel like is so important. So many people forget to do this and have a translated piece that might mean the same thing word-for-word, but doesn&rsquo;t position the business anywhere near as effectively as the original text.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>The onus is on you to communicate your vision and to make sure everyone understands what you&rsquo;re trying to say. You may feel like you&rsquo;re repeating yourself a little bit, to begin with, but it&rsquo;s the best way to get the perfect end product.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>Provide context every step of the way&nbsp;</p>\r\n<p>Context makes all the difference to transcreation because it tells the rest of the team who the target audience is. Be clear and explicit at every step of the creative process and you&rsquo;ll be able to create something you love.</p>\r\n<p>&nbsp;</p>\r\n<p>Provide critical input on draft translations&nbsp;</p>\r\n<p>One of the key steps of translation is critical feedback. Remember that you&rsquo;re not just looking for a technically correct piece of text, you want something that gives your brand the same voice it has in the original piece. It&rsquo;s bound to take a couple of attempts to get everything just right, and that&rsquo;s nothing to be worried by. Just make sure you read everything carefully, give clear feedback, and then do the same with the second draft. Before you know it you&rsquo;ll have honed the language so it does exactly what you need it to.</p>', 0, 0, 0, NULL, NULL, 'admin', 1569427492, 1570991087, 3, 0, 1, 0, 1),
(3, 5, '5 Simple Steps for a Successful Transcreation Project', '5-simple-steps-for-a-successful-transcreation-project', 'http://letotrans.vn/images/hinh-anh/post-02.jpg', '[]', '', '<p>When you want to launch a brand or communicate a goal in another language you need to do more than simply translate your work. What you need is a transcreation specialist, so let&rsquo;s take a look at what they do, and how they can help.</p>', '<p>What is transcreation?</p>\r\n<p>Transcreation refers to the process of taking a message communicated in one language and expressing it with the exact same meaning and sentiment in a second language. It&rsquo;s subtly different from standard translation because of the attention paid to cultural differences and societal context.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>If you want to ensure that your brand communicates the same vision in a variety of different languages you need to think about transcreation. It&rsquo;s the process that will make sure everything you say is on-message and has the right voice &mdash; 2 things that can be easily missed if you perform a literal word-for-word translation. It will also focus on the imagery that relates to the text to ensure everything fits together as intended.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>What results from the process of translation?</p>\r\n<p>Translation focuses on the written content of your project. It&rsquo;s all about finding the right words to express the core ideas in the same manner, whilst maintaining readability at every turn. The end result will be a piece of engaging text in the native language of your target audience.</p>\r\n<p>&nbsp;</p>\r\n<p>Now that we&rsquo;ve introduced you to the basic principles, let&rsquo;s take a look at the 5 simple steps you need to follow.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>Manage your translation project</p>\r\n<p>Project management is such an important skill that it&rsquo;s no wonder there are people who spend an entire career doing it. You need to set deadlines, deliverables, and always make yourself easily contactable. It can be easy to think that your translator will be able to take care of everything purely because they speak the language, but that&rsquo;s rarely the case. They&rsquo;ll need input, guidance, and context from you if you&rsquo;re going to arrive at an end result you&rsquo;re happy with. The more information and assistance you give them, the faster the project will be signed off and completed.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>Align expectations from day one&nbsp;</p>\r\n<p>You need to layout the scope of the work from the moment you start. If you want someone to simply translate a piece of text, tell them. If on the other hand, you need full transcreation that covers everything from the wording and tag lines right the way through to imagery, say that&rsquo;s what you need. Everyone involved will appreciate the time you&rsquo;ve taken to bring them up to speed, and it&rsquo;s the best way to make sure there aren&rsquo;t any nasty surprises 2 weeks into the project.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>Communicate your vision clearly&nbsp;</p>\r\n<p>Giving everyone a clear vision of what you want the text to look and feel like is so important. So many people forget to do this and have a translated piece that might mean the same thing word-for-word, but doesn&rsquo;t position the business anywhere near as effectively as the original text.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>The onus is on you to communicate your vision and to make sure everyone understands what you&rsquo;re trying to say. You may feel like you&rsquo;re repeating yourself a little bit, to begin with, but it&rsquo;s the best way to get the perfect end product.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>Provide context every step of the way&nbsp;</p>\r\n<p>Context makes all the difference to transcreation because it tells the rest of the team who the target audience is. Be clear and explicit at every step of the creative process and you&rsquo;ll be able to create something you love.</p>\r\n<p>&nbsp;</p>\r\n<p>Provide critical input on draft translations&nbsp;</p>\r\n<p>One of the key steps of translation is critical feedback. Remember that you&rsquo;re not just looking for a technically correct piece of text, you want something that gives your brand the same voice it has in the original piece. It&rsquo;s bound to take a couple of attempts to get everything just right, and that&rsquo;s nothing to be worried by. Just make sure you read everything carefully, give clear feedback, and then do the same with the second draft. Before you know it you&rsquo;ll have honed the language so it does exactly what you need it to.</p>', 0, 0, 0, NULL, NULL, 'admin', 1569427928, 1569430435, 0, 0, 1, 0, 1),
(4, 5, 'Hiring an Interpreting Company: 7 Things to Consider', 'hiring-an-interpreting-company-7-things-to-consider', 'http://letotrans.vn/images/hinh-anh/post-04.jpg', '[]', '', '<p>Searching for reliable, professional interpreting services can be stressful. To take the hard work out of the hiring process we&rsquo;ve created a simple checklist you can work through. It includes key questions you need to ask, plus a couple of considerations you&rsquo;ll need to make to ensure things run smoothly.</p>', '<p>Do they have fluent speakers in both languages?</p>\r\n<p>What are interpreting services? Simply put they&rsquo;re a chance to have a native speaker sit by your side, or remotely, and tell you what someone speaking a foreign language is saying. There are apps that will claim to be able to do it, but they&rsquo;re nothing but a pale imitation of the real thing.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>What you want to know is whether or not the company you approach has fluent speakers in your language, and the language of the person you&rsquo;re speaking to. You&rsquo;re looking for someone who speaks word-perfect English as their second language, and who has the knowledge of the other language that only a native speaker can acquire.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>Are you hiring an interpreter or a translator?</p>\r\n<p>If you want to settle the age-old interpreter vs translator debate you&rsquo;re going to need to know the difference between a translator and an interpreter.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>Translators will typically be used to turn written text from one language into another. They&rsquo;re certainly useful, but they&rsquo;re not what you&rsquo;re looking for here. An interpreter will be able to instantly convey nuance and meaning in the spoken word. It&rsquo;s a vital skill and one that&rsquo;s certainly distinct from translation.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>Which type of interpretation will you need?</p>\r\n<p>Ask the translation company whether they offer a choice between simultaneous and consecutive interpretation. The former allows you to hear what the foreign language speaker is saying in real-time, whilst the latter waits until they&rsquo;ve finished to bring you up to speed. The choice will largely be determined by the speed of the exchange and your personal preference. Give it some thought and you&rsquo;ll be well equipped when you&rsquo;re ready to do business.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>Are there any reviews or testimonials you can take a look at?</p>\r\n<p>Every qualified language interpreter will have a mountain of 5-star reviews you can take a look at with the click of a button. Better yet, why not ask for references and referrals from their previous clients? This is a great way to get a feel for how the two of you will work together if you decide to go ahead. It&rsquo;s also a great way to get a picture of how the process worked from someone who has already been there and done it.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>Is your interpreter familiar with your niche?</p>\r\n<p>If you&rsquo;re discussing a highly technical or complex matter it&rsquo;s essential you tell your interpreter in advance. Whilst they don&rsquo;t have to be an expert on the subject, any background information and context you can give them will definitely be greatly appreciated.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>Check their availability and pricing before making plans&nbsp;</p>\r\n<p>Interpreters are in high demand, so it&rsquo;s essential that you book your person of choice well in advance. You might find that a freelance interpreter gives better flexibility in terms of pricing and availability as they&rsquo;re less likely to be tied down to longterm commitments. Take your time to draw up a shortlist of options, and make sure you avoid the common mistake of always picking the person who will do it for the smallest fee.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>Create a clear contract so everyone knows where they stand</p>\r\n<p>When you want to hire an interpreter you need to have a contract, there&rsquo;s simply no getting away from that fact. Whilst the industry is well regulated and governed, you&rsquo;re going to need to explicitly outline the scope of the role. You want to get the best out of your new partnership, so take the time to think about how you can explain things as clearly as possible. Once you&rsquo;re both on the same page you&rsquo;ll find you get through your work effortlessly. Just what you need when you want to take the stress out of things.&nbsp;</p>', 0, 0, 0, NULL, NULL, 'admin', 1569431036, NULL, 0, 0, 1, 0, 1),
(5, 5, '10 Little Translation Mistakes That Caused Big Problems', '10-little-translation-mistakes-that-caused-big-problems', 'http://letotrans.vn/images/hinh-anh/post-05.jpg', '[]', '', '<p>Speaking a foreign language can be learned, but it&rsquo;s also something that comes with many challenges. Despite being able to have a conversation in it, grammar rules can be forgotten sometimes, leading to translation errors.</p>', '<p>Mistakes are bound to happen, that&rsquo;s a fact. Even so, if you&rsquo;re working as a translator, the smallest problems can cause big issues, and there are many examples. That being said, here are 10 translation mistakes that have been the cause of big problems.</p>\r\n<p>&nbsp;</p>\r\n<p>Do Nothing</p>\r\n<p>The HSBC bank had a catchphrase going like &ldquo;Assume Nothing&rdquo;. However, some countries didn&rsquo;t really translate it properly. It was translated as &ldquo;Do Nothing&rdquo;, and the bank had to pay $10 million rebranding in order to fix the damage caused by it.</p>\r\n<p>&nbsp;</p>\r\n<p>We Will Bury You</p>\r\n<p>An interpreter made a mistake when translating a speech of the Soviet Prime Minister Nikita Khrushchev. The translation he used was &ldquo;we will bury you&rdquo;, which was taken as a threat and let&rsquo;s be honest, who wouldn&rsquo;t consider that a threat? People assumed it meant Russia was going to unleash a nuclear attack on the US.</p>\r\n<p>&nbsp;</p>\r\n<p>Intoxicated</p>\r\n<p>Sometimes, problems with translation can lead to tragedies, just like this case from 1980. A man was brought into an emergency room in Florida. The friends who brought him were Spanish and were not having amazing English language skills. As such, they used the word &ldquo;intoxicado&rdquo; to describe his state, which the staff translated as &ldquo;intoxicated&rdquo; instead of &ldquo;poisoned&rdquo;.</p>\r\n<p>&nbsp;</p>\r\n<p>Due to that, they treated him for a drug overdose, and because the proper treatment was delayed, the man ended up paralyzed. Consequently, 71 million dollars were required from the hospital in the lawsuit, while the man lost his mobility.</p>\r\n<p>&nbsp;</p>\r\n<p>Markets Tumble</p>\r\n<p>A poor translation of a Chinese article has resulted in a lot of panic for the foreign exchange market. While the original post was just casual and presented an overview of some financial reports, the English translation made it sound way too authoritative. As such, the US dollar&rsquo;s value dropped.</p>\r\n<p>&nbsp;</p>\r\n<p>Chocolates for Him</p>\r\n<p>Valentine&rsquo;s Day traditions are pretty much known nowadays &ndash; there are gift exchanges between couples, including chocolate. In Japan, though, there was a mistranslation from a company which said women had to offer men chocolate too, as a custom. Because of that, women of Japan give men chocolate on February 14th, while men do the same on March 14th.</p>\r\n<p>&nbsp;</p>\r\n<p>A Company Near Its Demise</p>\r\n<p>Back in 2012, the Sharp Corp. released its earnings report which was not looking really good. Like that wasn&rsquo;t enough, the translation in English said that the hardship was a &ldquo;material doubt&rdquo; and that the company will keep being a &ldquo;going concern&rdquo;. This unintentional mistake almost killed the company, which was shown by the annual decline of 75%.</p>\r\n<p>&nbsp;</p>\r\n<p>Sheng Long</p>\r\n<p>There is a known game named &ldquo;Street Fighter II&rdquo;, and one of the characters in the game had a reply including the words &ldquo;Rising Dragon&rdquo;. When translated from Japanese to English, the translation was presented as &ldquo;Sheng Long&rdquo;, as the translator thought a new character was added to the game. As a result, many people were trying to find this inexistent foe in the game in an attempt to defeat him, thus wasting a lot of time.</p>\r\n<p>&nbsp;</p>\r\n<p>Your Lusts for the Future</p>\r\n<p>President Carter&rsquo;s trip to Poland in 1977 ended in a series of funny translation errors. The Russian interpreter ended up translating &ldquo;your desires for the future&rdquo; as &ldquo;your lusts for the future&rdquo;, something that was laughed about for quite a while.</p>\r\n<p>&nbsp;</p>\r\n<p>Waitangi Trouble</p>\r\n<p>A deal between the Maori chiefs of New Zealand and the British government was being discussed to protect the Maori from sailors, marauding convicts and traders. Conversely, the British wanted to extend their colonial holdings. Although the treaty was signed, the documents were different, and it ended up in the Maori thinking they were allowed to rule themselves while getting a legal system. It was wrong, though, and even today the matter is still discussed.</p>\r\n<p>&nbsp;</p>\r\n<p>Moses&rsquo;s Horns</p>\r\n<p>St. Jerome wanted to translate the Old Testament into Latin from Hebrew, but he ended up making a mistake. Basically, Hebrew is written without the vowels, so the translator read &ldquo;karan&rdquo; as &ldquo;keren&rdquo; which means &ldquo;horned&rdquo;, while the meaning was actually &ldquo;radiance&rdquo;. Because of this, many paintings and sculptures featured Moises with horns on his head.</p>\r\n<p>&nbsp;</p>\r\n<p>As you&rsquo;ve seen from these &ldquo;lost in translation&rdquo; examples, it&rsquo;s not unusual to make mistakes. Although not all translation errors have big consequences, history shows that sometimes they can end up in tragedies or panic. This is why attention and a lot of knowledge are important for a translator.</p>', 0, 0, 0, NULL, NULL, 'admin', 1569431084, NULL, 0, 0, 1, 0, 1),
(6, 5, '5 Steps to a Successful International Digital Marketing Strategy', '5-steps-to-a-successful-international-digital-marketing-strategy', 'http://letotrans.vn/images/hinh-anh/post-06.jpg', '[]', '', '<p>To build a successful international marketing plan, you have to be dedicated and hard-working. It&rsquo;s not something that will happen overnight, but only through many days and nights of thinking about it and working on it. That being said, you need to step back and think of strategies.</p>', '<p>Even so, it&rsquo;s not so easy, and things can quickly get too overwhelming. Guidance becomes a must, so we created this list of five helpful steps to encourage you to do your best. Take a look at this digital marketing guide and you should be able to make your business thrive.</p>\r\n<p>&nbsp;</p>\r\n<p>Think About a Goal</p>\r\n<p>When thinking of strategies for reaching global markets, the prime step is thinking about your goals. What are you trying to achieve and why are you taking this route? It&rsquo;s important to identify your goals because it will help you build your strategy and make a plan to reach your goals properly. If you don&rsquo;t, you might end up messing something up along the way.</p>\r\n<p>&nbsp;</p>\r\n<p>SEO</p>\r\n<p>SEO is something that search engines use to help websites be found much easier by people in need. Short for search engine optimization, this is definitely one of the most effective methods for a successful online marketing campaign.</p>\r\n<p>&nbsp;</p>\r\n<p>The most known fact about SEO is how it uses keywords to let internet users find certain sites when typing something in the search bar. Basically, content creators sprinkle high traffic keywords in their posts, which gives them a chance to place high on the result page. As obvious, the more visible, the better, and given people barely go to the second results page when looking for something, it&rsquo;s essential to be placed very high. This can also be done by paying a fee to the search engines.</p>\r\n<p>&nbsp;</p>\r\n<p>Even so, there&rsquo;s one more important aspect to consider regarding SEO &ndash; readying your website for mobile browsing. In an era where the smartphone can be used for so many things, it would be a shame if your website wasn&rsquo;t optimized for mobile use. It can easily put off a lot of visitors.</p>\r\n<p>&nbsp;</p>\r\n<p>Choose a Proper Channel</p>\r\n<p>There are plenty of channels to choose from nowadays, so the options are not limited. Each one of them can help you reach your objectives and drive traffic for your company&rsquo;s site the right way. Some of the digital marketing channels can work as:</p>\r\n<p>&nbsp;</p>\r\n<p>Organic traffic</p>\r\n<p>Display networks</p>\r\n<p>Social media</p>\r\n<p>Direct emails</p>\r\n<p>Blogs</p>\r\n<p>Choosing one depends on your goals, customers, and budget, as well as the skills of your team.</p>\r\n<p>&nbsp;</p>\r\n<p>Use Social Media</p>\r\n<p>As a company, you have a big advantage nowadays. Most people own a social media account nowadays, meaning it will be much easier to reach people and make your voice heard. Social media must be part of your digital marketing plan if you want to maintain a strong bond with customers and be considered a reliable business.</p>\r\n<p>&nbsp;</p>\r\n<p>One of the main advantages of this method is that you&rsquo;re not as intrusive as you&rsquo;d be through emails. In other words, you don&rsquo;t force your way to someone&rsquo;s inbox &ndash; customers are the one finding you and deciding if they want to associate with you.</p>\r\n<p>&nbsp;</p>\r\n<p>Besides, people spend a good majority of their time on these social apps, so it&rsquo;s more likely for them to see updates from you.</p>\r\n<p>&nbsp;</p>\r\n<p>Post Relevant Content</p>\r\n<p>One of the best international marketing strategies is creating relevant content, of course. Basically, what you need to do is address the audience&rsquo;s concerns during their buying, which is why you need to focus on a good advertising campaign for this one. Content means more than just posting on your blog or tweeting, so make sure you do whatever it takes to let the audience know how you can help them.</p>\r\n<p>&nbsp;</p>\r\n<p>Final Thoughts</p>\r\n<p>What is international marketing rather than just a way to help you reach more people all across the world and achieve success? It&rsquo;s definitely difficult starting out, but with the tips provided in this article, you should be able to create a powerful strategy over time, thus having a fulfilling business.</p>', 0, 0, 0, NULL, NULL, 'admin', 1569431138, NULL, 0, 0, 1, 0, 1),
(7, 5, 'How to Overcome Cross Cultural Barriers in Business Negotiations', 'how-to-overcome-cross-cultural-barriers-in-business-negotiations', 'http://letotrans.vn/images/hinh-anh/post-07.jpg', '[]', '', '<p>Running a business and being successful at it often requires meeting people from all around the globe and doing business with them. Although you have the best possible intentions, it may happen that a business negotiation with someone from a different culture simply goes in the wrong direction and you fail to seal the deal. The reason behind it might be cultural differences.</p>', '<p>Cross-cultural barriers in international business negotiation are common and you need to find a way to overcome them. If you don&rsquo;t, you might be unable to move your business globally and continue running a successful company.</p>\r\n<p>&nbsp;</p>\r\n<p>Take a look at some useful tips on how to move past cross cultural barriers and differences in business negotiations.</p>\r\n<p>&nbsp;</p>\r\n<p>Do Your Homework</p>\r\n<p>It goes without saying that you need to find a way to pay respect to the other party&rsquo;s cultural habits and values. That means that you need to do your research and learn about their culture.</p>\r\n<p>&nbsp;</p>\r\n<p>That includes learning about:</p>\r\n<p>&nbsp;</p>\r\n<p>greetings</p>\r\n<p>cultural values</p>\r\n<p>rituals</p>\r\n<p>taboos</p>\r\n<p>expectations</p>\r\n<p>By learning about the above-mentioned, you&rsquo;ll know what to expect from the person you&rsquo;re talking to, how to react, and how to respond to certain actions.</p>\r\n<p>&nbsp;</p>\r\n<p>This will show the other person you&rsquo;re aware of their culture and they&rsquo;ll appreciate your effort. In addition, you&rsquo;ll prevent yourself from doing anything offensive or upsetting for the other party.</p>\r\n<p>&nbsp;</p>\r\n<p>Don&rsquo;t Overstep</p>\r\n<p>When you&rsquo;re getting prepared for negotiating across cultures, you&rsquo;ll try to gather as much information as possible about the culture of the person you&rsquo;re meeting.</p>\r\n<p>&nbsp;</p>\r\n<p>However, keep in mind you&rsquo;re not actually learning about the person. You&rsquo;re learning about the stereotype.</p>\r\n<p>&nbsp;</p>\r\n<p>This means that you need to be very careful about the source of information you&rsquo;re relying on.</p>\r\n<p>&nbsp;</p>\r\n<p>It&rsquo;s best that you:</p>\r\n<p>&nbsp;</p>\r\n<p>talk to a member of the same culture you&rsquo;re friends with</p>\r\n<p>talk to someone who&rsquo;s had experience with that specific culture</p>\r\n<p>The internet can be filled with stereotypical information such as &ldquo;all Russians drink vodka&rdquo;. However, if you prepare a bottle of vodka for a business meeting, the other person might get super-offended.</p>\r\n<p>&nbsp;</p>\r\n<p>Therefore, make sure you&rsquo;ve got all the right information, that actually make a difference in a conversation.</p>\r\n<p>&nbsp;</p>\r\n<p>Be Aware of Your Own Culture</p>\r\n<p>If the person you&rsquo;re negotiating with is equally as considerate as you, they&rsquo;ve probably done their own research about your culture.</p>\r\n<p>&nbsp;</p>\r\n<p>Try and understand what kind of an image they have about you as the member of a specific culture, and what is it that they expect from meeting you.</p>\r\n<p>&nbsp;</p>\r\n<p>Then, try and either rebut the bad stereotypes or empower the good ones, and make sure the other party feels comfortable talking to you from the beginning.</p>\r\n<p>&nbsp;</p>\r\n<p>Find Common Grounds</p>\r\n<p>Finally, to avoid cultural differences in negotiation, you can go ahead and try finding something you and the other person have in common.</p>\r\n<p>&nbsp;</p>\r\n<p>Finding common grounds is almost like speaking the same language. It will help both you and the other party in terms of:</p>\r\n<p>&nbsp;</p>\r\n<p>reducing stress</p>\r\n<p>If you manage to find something in common, you&rsquo;ll be able to feel less stressed out and more open towards the entire negotiation.</p>\r\n<p>&nbsp;</p>\r\n<p>breaking the ice</p>\r\n<p>Sharing ideas, customs, or elements of a culture will be a great ice-breaker for you and the other person. It&rsquo;ll help you kick start the negotiation and seal the deal in no time.</p>\r\n<p>&nbsp;</p>\r\n<p>feeling a connection</p>\r\n<p>It&rsquo;s important that you establish a connection with the other person. It may be hard when you don&rsquo;t speak the same language, but finding something in common will help you do it.</p>\r\n<p>&nbsp;</p>\r\n<p>Make sure you try out different thing until you hit the right note and engage in a meaningful conversation with the other party.</p>\r\n<p>&nbsp;</p>\r\n<p>Conclusion</p>\r\n<p>It&rsquo;s obvious that cultural differences can negatively affect international business negotiations. However, it doesn&rsquo;t have to be the case. You do have to walk the extra mile and prepare thoroughly to be able to build a bridge between the two cultures. But, once you do it, you&rsquo;ll have nothing to worry about. Make sure to use the advice we gave you and win all your international business negotiations.</p>', 0, 0, 0, NULL, NULL, 'admin', 1569431185, NULL, 0, 0, 1, 0, 1),
(8, 5, 'How to Create an Effective Multilingual Content Strategy', 'how-to-create-an-effective-multilingual-content-strategy', 'http://letotrans.vn/images/hinh-anh/post-08.jpg', '[]', '', '<p>When it comes to digital marketing, your content marketing strategy is the basis. Everyone company, regardless of how big or small, needs to have a strategic plan on how to produce and publish content for marketing and digital presence.</p>', '<p>However, if you&rsquo;re trying to act globally, and launch your business higher, you need to create an effective multilingual content strategy. That means that you need to adapt your content to different markets you&rsquo;re targeting and have a strategy for each new territory that you choose. Simply translating your initial website from English to other languages won&rsquo;t do the trick.</p>\r\n<p>&nbsp;</p>\r\n<p>If you&rsquo;re curious to find out what are the steps in creating a multilingual content mattering strategy, just keep reading.</p>\r\n<p>&nbsp;</p>\r\n<p>Target the Local Market</p>\r\n<p>First things first, you need to identify the new local market and find out as much as you can about it.</p>\r\n<p>&nbsp;</p>\r\n<p>This means that you to learn about the new market, the people who belong to it, and their needs.</p>\r\n<p>&nbsp;</p>\r\n<p>That includes:</p>\r\n<p>&nbsp;</p>\r\n<p>the language they speak</p>\r\n<p>the culture they belong to</p>\r\n<p>their typical online behavior and habits</p>\r\n<p>their needs</p>\r\n<p>their values</p>\r\n<p>their expectations</p>\r\n<p>Learn as much as you can about your potential clients on the new market and ensure you know where you&rsquo;re going with your content development strategy.</p>\r\n<p>&nbsp;</p>\r\n<p>Create the Content They Need</p>\r\n<p>Once you finish step one, you&rsquo;ll realize just how different each new target audience is. Consequentially, you&rsquo;ll realize how important it is to create specific content aimed at specific audience groups, instead of simply translating your available content.</p>\r\n<p>&nbsp;</p>\r\n<p>In other words, content creation for your global content strategy needs to cover the following:</p>\r\n<p>&nbsp;</p>\r\n<p>relevant content</p>\r\n<p>Discover what are the trending topics in a given region and what type of content is the most engaging and converting.</p>\r\n<p>&nbsp;</p>\r\n<p>search engines</p>\r\n<p>Not every country uses Google as their main search engine. Discover what the main search engine of your target audience is, and write specifically for that search engine.</p>\r\n<p>&nbsp;</p>\r\n<p>In addition, you&rsquo;ll need to find specific keywords for the new market.</p>\r\n<p>&nbsp;</p>\r\n<p>social media</p>\r\n<p>Find out which social media platforms are the most popular ones in your target area and ensure you&rsquo;re present on them.</p>\r\n<p>&nbsp;</p>\r\n<p>Developing a content strategy which is to impact people on a global level requires you to curate specific content aimed at different groups of target audiences. It does take a lot of effort, but the results will be undeniable.</p>\r\n<p>&nbsp;</p>\r\n<p>Localization</p>\r\n<p>In case you already have content written in English and believe your new target market would enjoy that same content, you need to focus on localization.</p>\r\n<p>&nbsp;</p>\r\n<p>The basis of localization is definitely translation, but there&rsquo;s much more to it. Take a look at all the essential steps in the localization process:</p>\r\n<p>&nbsp;</p>\r\n<p>translation</p>\r\n<p>Translating the initial content you published in English requires that you hire a professional translator to translate your content to the target language.</p>\r\n<p>&nbsp;</p>\r\n<p>adaptation</p>\r\n<p>When translating, it&rsquo;s important that change the following:</p>\r\n<p>&nbsp;</p>\r\n<p>measurement units</p>\r\n<p>currencies</p>\r\n<p>date formatting</p>\r\n<p>sizes</p>\r\n<p>cultural awareness</p>\r\n<p>Learn about your new audience and make sure your content is suitable for them and their cultural beliefs. You&rsquo;ll need to change some colors, images, or your entire design so as to make it appropriate for the new audience.</p>\r\n<p>&nbsp;</p>\r\n<p>For example, a cow is a sacred animal in India so you wouldn&rsquo;t want to showcase it in a disrespectful manner in your design.</p>\r\n<p>&nbsp;</p>\r\n<p>Separate platforms</p>\r\n<p>Finally, there&rsquo;s the question of whether or not you should create separate websites and separate social media profiles for each new target audience and market.</p>\r\n<p>&nbsp;</p>\r\n<p>It might be a good strategy to separate your multilingual content because your audience will find it easier to get to the content curated for them and interact with you if they feel the need.</p>\r\n<p>&nbsp;</p>\r\n<p>Therefore, consider separate websites and social media accounts as the final step in your multilingual content strategy.</p>\r\n<p>&nbsp;</p>\r\n<p>Final Thoughts</p>\r\n<p>It takes a lot of strategic planning and smart decision to create a successful multilingual content strategy. Hopefully, the tips above gave you guidance and helped you learn about the whole process.</p>\r\n<p>&nbsp;</p>\r\n<p>Now, all you have to do is get started and use the advice we gave you.</p>', 0, 0, 0, NULL, NULL, 'admin', 1569431228, NULL, 1, 0, 1, 0, 1),
(9, 2, 'The Word Point is Recognized by Clutch for Outstanding Accuracy in Translation Services', 'the-word-point-is-recognized-by-clutch-for-outstanding-accuracy-in-translation-services', 'http://letotrans.vn/images/hinh-anh/post-09.jpg', '[]', '', '<p>The Word Point specializes in innovation, and we&rsquo;d like to think that we&rsquo;ve revolutionized the translation industry as we know it</p>', '<p>Whatever, wherever our clients&rsquo; company, our team of experts and our arsenal of strategy, technology, and solutions are ready to help. We stand behind our customers and their success, a commitment that has made us a true force to be reckoned with in the industry.</p>\r\n<p>&nbsp;</p>\r\n<p>Clutch, the B2B research and reviews firm, recently released its ranking of translation services providers, and The Word Point earned the distinction of a position among the top 10 competitors in a field of more than 1000. We can&rsquo;t say enough about how proud we are of this accomplishment, but we&rsquo;d like to start by thanking Clutch for recognizing the quality of our market presence, industry experience and customer service.</p>\r\n<p>&nbsp;</p>\r\n<p>As one of our customers touted, &ldquo;The Word Point was praised for their ability to walk the line between efficiency and cost and their personal customer service &hellip; My client was happy with the translation quality, and I was pleased with their price-speed balance. They offer brilliant support and are caring and warm. They find custom solutions with a market-low price tag.&rdquo;</p>\r\n<p>&nbsp;</p>\r\n<p>Clutch&rsquo;s sister companies, The Manifest and Visual Objects, also heralded our team&rsquo;s expertise and hard work. In particular, business news website The Manifest named The Word Point one of the industry&rsquo;s best translation companies, while portfolio curator Visual Objects now showcases our experience in support of The Word Point&rsquo;s stand-out services and solutions.</p>\r\n<p>&nbsp;</p>\r\n<p>Knowing that what we do at The Word Point has validation from sources like Clutch, The Manifest, and Visual Objects, means a lot about to us, and we&rsquo;re very excited to see what new clients and challenges the future holds for us. If you&rsquo;d like to learn more about our approach or speak to a member of The Word Point, we welcome you to connect with us here. Let&rsquo;s see what we can do together!</p>', 0, 0, 0, NULL, NULL, 'admin', 1569431271, 1569601878, 2, 0, 1, 0, 1),
(10, 2, 'How to Protect Your Brand with Trademark Translation', 'how-to-protect-your-brand-with-trademark-translation', 'http://letotrans.vn/images/hinh-anh/post-10.jpg', '[]', '', '<p>What is a trademark definition? Your trademark can be many things. A trademark translation can be a symbol, element of design, or other signature attributes which uniquely identifies your products and services as your own. and such, trademarks can be applied to signs, brand names, logos, designs, taglines, and other visual elements that are unique to your company.</p>', '<p>What is a trademark definition? Your trademark can be many things. A trademark translation can be a symbol, element of design, or other signature attributes which uniquely identifies your products and services as your own. and such, trademarks can be applied to signs, brand names, logos, designs, taglines, and other visual elements that are unique to your company. In spite of this, there can still be issues that crop up with trademarked elements. this becomes even more complex when you have to translate one or more of your trademark elements into a different language.</p>\r\n<p>&nbsp;</p>\r\n<p>Understanding The Importance of a Name Identity: Trademark Definitions</p>\r\n<p>To illustrate just how important trademarks are to a company&rsquo;s recognition and identity, here are some examples of trademarks. As you can see trademark definition is quite flexible:</p>\r\n<p>&nbsp;</p>\r\n<p>Fictional Characters: &lsquo;Jack&rsquo; From Jack in The Box or Tony the Tiger</p>\r\n<p>Business Names: UPS or IBM</p>\r\n<p>Words and Slogans in Specific Fonts: Pop Tarts or Little Debbie</p>\r\n<p>Colors: Barbie Pink or Tiffany Blue</p>\r\n<p>Slogans: &lsquo;Just Do It&rsquo; by Nike</p>\r\n<p>Sounds: &lsquo;Dun Dun&rsquo; Sound from The Law and Order TV Series</p>\r\n<p>Product Shapes: Toblerone Bar or Glass Coca Cola Bottle</p>\r\n<p>Establishing a Global Trademark</p>\r\n<p>As you might imagine, establishing a trademark in your company&rsquo;s country of origin doesn&rsquo;t necessarily mean that your trademark is valid in other countries. If you expand your business internationally, you must establish your trademarks in each country you enter, or use the Madrid System to establish a trademark in multiple countries using a single application process.</p>\r\n<p>&nbsp;</p>\r\n<p>Trademark Translation</p>\r\n<p>Of course, the importance of brand names and other trademarked items goes beyond establishing legal protections. You also have to present these elements to customers and potential customers in other countries, and it&rsquo;s important that they make sense. They should also retain the definition intended.</p>\r\n<p>&nbsp;</p>\r\n<p>Sometimes making that happen isn&rsquo;t very easy. This is where translation and localization experts can help. One area that requires special attention is transliteration. This is the translation of written words from one language to another when the languages are based on two different character sets. For example, English and Chinese. There are no Chinese symbols that mean &lsquo;coca or &lsquo;cola&rsquo;. For that matter, there are no Chinese symbols that translate to the 26 letter alphabet. Instead, each Chinese character has a sound and a meaning.</p>\r\n<p>&nbsp;</p>\r\n<p>When Coca Cola began selling their products in China the first attempts at transliteration were a failure. One version could be translated as &lsquo;bite the wax tadpole&rsquo;. The company eventually settled on &ldquo;ke kou ke le&rdquo; which is Mandarin for a permit for the mouth to rejoice.</p>\r\n<p>&nbsp;</p>\r\n<p>There are also instances where a phrase, character, even color simply won&rsquo;t have the same meaning no matter what you do. In these cases, you may need to create something new in order to succeed in a new market. By working with a translation professional, you can identify these potential problems, and get advice on how to proceed.</p>\r\n<p>&nbsp;</p>\r\n<p>In addition to this, when it is time to file for your trademarks, you can access translation professionals with experience in intellectual property law. They can assist you in translating any of the documentation required to protect your brand in other countries.</p>\r\n<p>&nbsp;</p>\r\n<p>Final Thoughts</p>\r\n<p>By trademarking your brand in other countries, you help your efforts to become recognized by your potential customers in those regions. You also help to ensure that your intellectual property is not taken by other companies for their own purposes. Just keep in mind that this can be a complicated undertaking. You will need to work with translation professionals with expertise in marketing, localization, intellectual property, and trademarks.</p>', 0, 0, 0, NULL, NULL, 'admin', 1569431343, 1569601874, 4, 0, 1, 0, 1),
(11, 4, 'Giá của chúng tôi có thể so với các đơn vị khác không? - Are Our Prices Comparable to Those of Other Services?', 'gia-cua-chung-toi-co-the-so-voi-cac-don-vi-khac-khong-are-our-prices-comparable-to-those-of-other-services', '', '[]', '', '', '<p style=\"text-align: justify; \">Nếu bạn đã nghiên cứu các dịch vụ dịch thuật ở các đơn vị khác, bạn có thể nhận thấy rằng chúng tôi không hẳn là công ty dịch thuật có mức phí rẻ nhất. Tuy nhiên, dịch vụ của chúng tôi đơn giản là tốt hơn hẳn so với những dịch vụ mà bạn sẽ tìm thấy ở nơi khác.</p><p style=\"text-align: justify; \"><i>If you have researched other translation services, you may have noticed that we are not the cheapest professional translation agency around. This is for a good reason – our services are simply better than those you’ll find elsewhere.</i><br></p><p style=\"text-align: justify; \">Chúng tôi chỉ sử dụng các biên dịch viên nói tiếng Anh chuyên nghiệp, điều đó có nghĩa là chúng tôi luôn cung cấp bản dịch xuất sắc. Còn gì nữa, bạn sẽ biết chính xác mình sẽ trả bao nhiêu tiền trước khi chúng tôi bắt đầu dự án. Truy cập trang chủ để thấy quy trình tính giá đơn giản, kiểm tra chi phí dịch dự án của bạn và đặt hàng. LETOtrans được củng cố bởi các giá trị trung thực và minh bạch.</p><p style=\"text-align: justify; \">We use only professional English-speaking translators and writers, which means we deliver top-notch translation every time. What’s more, you will know exactly how much you will pay before we start the project. Visit the homepage to find a simple calculator, check the cost of your project, and place your order. There are no hidden extras. LETOtrans is underpinned by values of honesty and transparency.<br></p><p style=\"text-align: justify; \">Cuối cùng, đối với những người cần bằng sáng chế, báo cáo chuyên ngành y tế hoặc bản dịch chuyên ngành tương tự khác, chúng tôi cung cấp dịch vụ dịch chuyên ngành với mức phí KHÔNG THỂ TÌM THẤY Ở NƠI NÀO. Dù ngân sách của bạn là bao nhiêu, bạn sẽ luôn nhận được bản dịch tốt nhất từ chúng tôi. Và lưu ý rằng: Chúng tôi chỉ dịch bằng người dịch. Chúng tôi không bao giờ sử dụng máy móc!</p><p style=\"text-align: justify; \"><i>Finally, for those who need a patent, medical report, or other similarly technical translation, we offer specialized translation services for a fee you CAN\'T FIND ANYWHERE. This pricing model lets you make an informed choice when budgeting for your project. Whatever your budget, you will always receive the best translation document by human translation; And notice that: we never use machines!</i></p><p style=\"text-align: justify; \">Nếu bạn cần một công ty dịch vụ dịch thuật làm việc với các khách hàng và chấp nhận ở nhiều mức ngân sách khác nhau, LETOtrans là lựa chọn hoàn hảo.</p><p style=\"text-align: justify; \"><i>If you need a translation service company that works with clients with a wide range of budgets, LETOtrans is the perfect choice.</i><br></p>', 0, 0, 0, NULL, NULL, 'admin', 1571943426, NULL, 0, 0, 1, 0, 1);
INSERT INTO `tbl_contents` (`id`, `category_id`, `title`, `code`, `thumb`, `images`, `sapo`, `intro`, `fulltext`, `type_of_land_id`, `area`, `price`, `list_conid`, `list_tagid`, `author`, `cdate`, `mdate`, `visited`, `order`, `ispay`, `ishot`, `isactive`) VALUES
(12, 4, 'Chúng tôi dịch loại tài liệu nào? - What Kind of Documents Do We Translate?', 'chung-toi-dich-loai-tai-lieu-nao-what-kind-of-documents-do-we-translate', '', '[]', '', '', '<p style=\"text-align: justify; \">LETOtrans là một đơn dịch thuật thực sự linh hoạt. Bất cứ loại tài liệu nào bạn cần dịch, chúng tôi đều có người dịch phù hợp. Nhân viên của chúng tôi có thể dịch các trang web, phần mềm, ứng dụng, bài viết, tài liệu kinh doanh, hướng dẫn kỹ thuật, tiểu luận và luận văn học thuật, bản thảo sách, sách trắng, kịch bản cho âm thanh và giọng nói, và thậm chí cả trò chơi hay video.</p><p style=\"text-align: justify; \"><i>LETOtrans is a truly versatile translation agency. Whatever kind of document you need translated, we have the right translator for the job. Our staff can translate webpages, software, apps, articles, business documents, technical manuals, academic essays and dissertations, book manuscripts, white papers, scripts for audio and voiceover, and even games or videos.</i></p><p style=\"text-align: justify; \">Chúng tôi là một công ty dịch thuật chuyên nghiệp, và do đó chúng tôi hiểu mức độ mà khách hàng kỳ vọng vào một đơn vị dịch thuật. Khi bạn nhận được bản dịch của một tài liệu chính thức, nó sẽ được kèm theo một bản tuyên bố. Bản tuyên bố này tuyên bố về tính chính xác của bản dịch.</p><p style=\"text-align: justify; \"><i>We are a professional translation agency, and therefore we understand the extent to which our clients rely on a translation agency. When you receive a translation of an official document, it will be accompanied by an affidavit. This affidavit outlines when the translation was undertaken, attests to its accuracy, and states for whom it was written.</i></p><p style=\"text-align: justify; \">Bất cứ loại dịch vụ dịch thuật nào bạn cần, bạn có thể dựa vào LETOtrans để tạo ra một bản dịch chính xác và kịp thời, thông qua con người dịch.</p><p style=\"text-align: justify; \"><i>Whatever kind of translation services you need, you can rely on LETOtrans to produce an accurate and timely human translation.</i><br></p>', 0, 0, 0, NULL, NULL, 'admin', 1571943825, NULL, 0, 0, 1, 0, 1),
(13, 3, 'Dịch giả của LETOtrans có kinh nghiệm như thế nào? - How Experienced Are LETOtrans\'s Translators?', 'dich-gia-cua-letotrans-co-kinh-nghiem-nhu-the-nao-how-experienced-are-letotranss-translators', '', '[]', '', '', '<p style=\"text-align: justify; \">Tại LETOtrans, chúng tôi chỉ sử dụng người dịch chứ không dùng máy hay phần mềm dịch như các đơn vị dịch thuật khác. Hiện tại, chúng tôi sử dụng hơn 30 nhân viên dịch thuật và hiệu đính, cùng với khoảng 200 dịch giả tự do được lựa chọn cẩn thận. Dịch giả của chúng tôi sống và hoạt động tại hơn 100 quốc gia. Nhiều người đã tích lũy một số năm trong ngành, cung cấp dịch vụ dịch thuật cho hàng trăm khách hàng. Tất cả các ứng viên cho LETOtrans được yêu cầu thực hiện một dự án dịch thử nghiệm và những nỗ lực của họ được chúng tôi xem xét kỹ lưỡng trước khi họ trở thành nhân sự và chính thức được dịch bất cứ dự án nào.</p><p style=\"text-align: justify; \"><i>At LETOtrans, we use only top-quality human translation. Currently, we employ over 30 permanent translation and editing staff, along with approximately 200 handpicked freelancers. Our translators live and operate in over 100 countries. They receive a competitive rate of pay in recognition of their dedication and expertise. Many have accumulated a number of years in the industry, offering translation services to hundreds of clients. All applicants to our translation service company are required to undertake a trial project, and their efforts are carefully scrutinized by our team before the translator is permitted to take on any project.</i><br></p><p style=\"text-align: justify; \">Dịch thuật không chỉ là vấn đề chuyển từ sang ngôn ngữ khác; trong nhiều trường hợp, một dịch giả sẽ cần sở hữu kiến ​​thức nền tảng chuyên môn để có thể hoàn thành dự án dịch đạt chuẩn. Đó là lý do tại sao LETOtrans áp dụng một quy trình tuyển chọn nghiêm ngặt.</p><p style=\"text-align: justify; \"><i>Translation isn’t just a matter of transposing words into another language; in many cases, a translator will need to possess specialist background knowledge if they are to complete the project to a suitable standard. That`s why our translation agency operates a stringent selection process.</i><br></p><p style=\"text-align: justify; \">Khi bạn giao phó dự án của bạn cho chúng tôi, bạn có thể yên tâm rằng bạn đang làm việc với một công ty dịch thuật thực sự chuyên nghiệp.</p><p style=\"text-align: justify; \"><i>When you entrust your project to us, you can rest assured that you are working with a truly professional translation agency.</i><br></p>', 0, 0, 0, NULL, NULL, 'admin', 1572237608, NULL, 1, 0, 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_co_operate`
--

CREATE TABLE `tbl_co_operate` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isactive` tinyint(4) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_co_operate`
--

INSERT INTO `tbl_co_operate` (`id`, `name`, `email`, `phone`, `company`, `isactive`) VALUES
(1, 'Trần Viết Hiệp', 'tranviethiepdz@gmail.com', NULL, NULL, 1),
(2, 'Trần Viết Hiệp', 'tranviethiepdz@gmail.com', '09695499991', 'Designbold', 1),
(3, 'DAVID MATIN', 'abc@gmail.com1', '09695499991', 'Designbold', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_feedback`
--

CREATE TABLE `tbl_feedback` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `career` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `order` int(4) DEFAULT NULL,
  `isactive` tinyint(2) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_feedback`
--

INSERT INTO `tbl_feedback` (`id`, `name`, `avatar`, `comment`, `career`, `order`, `isactive`) VALUES
(1, 'Anh Dũng', 'http://letotrans.vn/images/612d430348bdafe3f6ac.jpg', 'Quy trình làm việc nhanh chóng! Và điều quan trọng là bản dịch tôi không phải có ý kiến sửa ngay từ lần đầu gửi bản mềm!', 'Chairman of Dong Duong Travel', 1, 1),
(2, 'Chị Ngọc Mai', 'http://letotrans.vn/images/ngoc-mai.jpg', 'Việc tiếp nhận đơn dịch và quy trình dịch diễn ra khá tốt nên việc đặt đơn dịch tài liệu hay hình ảnh chứ nội dung từ Hãng luật LETO chuyển sang thấy đơn giản, thuận tiện. Chi phí cũng hợp lý hơn so với các đơn vị chúng tôi đã từng hợp tác!', 'CEO of LETOlaw', 0, 1),
(5, 'Sean Spoon', 'http://letotrans.vn/images/sean-spoon.jpg', 'It\'s very an useful service and a cool fee for me when i was traveling in Vietnam and writing about this country. ', 'A Traveler and Writer', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_gallery`
--

CREATE TABLE `tbl_gallery` (
  `id` int(11) NOT NULL,
  `album_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `isactive` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_gallery`
--

INSERT INTO `tbl_gallery` (`id`, `album_id`, `name`, `link`, `isactive`) VALUES
(1, '8', 'hinh-anh-1', 'http://letotrans.vn/images/gallery/bd5.jpg', 1),
(2, '8', 'hinh-anh-2', 'http://letotrans.vn/images/gallery/bd6.jpg', 1),
(3, '8', 'hinh-anh-3', 'http://letotrans.vn/images/gallery/bd7.jpg', 1),
(4, '8', 'hinh-anh-4', 'http://letotrans.vn/images/gallery/bd8.jpg', 1),
(5, '8', 'hinh-anh-5', 'http://letotrans.vn/images/gallery/bd1.jpg', 1),
(6, '8', 'hinh-anh-6', 'http://letotrans.vn/images/gallery/bd2.jpg', 1),
(7, '8', 'hinh-anh-7', 'http://letotrans.vn/images/gallery/bd4.jpg', 1),
(8, '8', 'ha1', 'http://letotrans.vn/images/gallery/block-4-img-5.jpg', 1),
(9, '8', 'ha2', 'http://letotrans.vn/images/gallery/block-4-img-6.jpg', 1),
(10, '8', 'ha3', 'http://letotrans.vn/images/gallery/block-4-img-7.jpg', 1),
(11, '8', 'ha4', 'http://letotrans.vn/images/gallery/block-4-img-8.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_languages`
--

CREATE TABLE `tbl_languages` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` char(49) CHARACTER SET utf8 DEFAULT NULL,
  `iso` char(2) CHARACTER SET utf8 DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `order` tinyint(4) DEFAULT NULL,
  `price_cc` float DEFAULT '0',
  `default` tinyint(1) DEFAULT '0',
  `isactive` tinyint(2) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_languages`
--

INSERT INTO `tbl_languages` (`id`, `name`, `iso`, `image`, `order`, `price_cc`, `default`, `isactive`) VALUES
(1, 'English', 'en', 'http://letotrans.vn/images/languages/england.png', 1, NULL, 0, 1),
(2, 'Afar', 'aa', '', 60, NULL, 0, 0),
(3, 'Abkhazian', 'ab', '', 60, NULL, 0, 0),
(4, 'Afrikaans', 'af', '', 60, NULL, 0, 0),
(5, 'Amharic', 'am', '', 60, NULL, 0, 0),
(6, 'Arabic', 'ar', '', 60, NULL, 0, 0),
(7, 'Assamese', 'as', '', 60, NULL, 0, 0),
(8, 'Aymara', 'ay', '', 60, NULL, 0, 0),
(9, 'Azerbaijani', 'az', '', 60, NULL, 0, 0),
(10, 'Bashkir', 'ba', '', 60, NULL, 0, 0),
(11, 'Belarusian', 'be', '', 60, NULL, 0, 0),
(12, 'Bulgarian', 'bg', '', 60, NULL, 0, 0),
(13, 'Bihari', 'bh', '', 60, NULL, 0, 0),
(14, 'Bislama', 'bi', '', 60, NULL, 0, 0),
(15, 'Bengali/Bangla', 'bn', '', 60, NULL, 0, 0),
(16, 'Tibetan', 'bo', '', 60, NULL, 0, 0),
(17, 'Breton', 'br', '', 60, NULL, 0, 0),
(18, 'Catalan', 'ca', '', 60, NULL, 0, 0),
(19, 'Corsican', 'co', '', 60, NULL, 0, 0),
(20, 'Czech', 'cs', '', 60, NULL, 0, 0),
(21, 'Welsh', 'cy', '', 60, NULL, 0, 0),
(22, 'Danish', 'da', '', 60, NULL, 0, 0),
(23, 'German', 'de', '', 5, NULL, 0, 1),
(24, 'Bhutani', 'dz', '', 60, NULL, 0, 0),
(25, 'Greek', 'el', '', 60, NULL, 0, 0),
(26, 'Esperanto', 'eo', '', 60, NULL, 0, 0),
(27, 'Spanish', 'es', '', 60, NULL, 0, 0),
(28, 'Estonian', 'et', '', 60, NULL, 0, 0),
(29, 'Basque', 'eu', '', 60, NULL, 0, 0),
(30, 'Persian', 'fa', '', 60, NULL, 0, 0),
(31, 'Finnish', 'fi', '', 60, NULL, 0, 0),
(32, 'Fiji', 'fj', '', 60, NULL, 0, 0),
(33, 'Faeroese', 'fo', '', 60, NULL, 0, 0),
(34, 'French', 'fr', '', 60, NULL, 0, 0),
(35, 'Frisian', 'fy', '', 60, NULL, 0, 0),
(36, 'Irish', 'ga', '', 60, NULL, 0, 0),
(37, 'Scots/Gaelic', 'gd', '', 60, NULL, 0, 0),
(38, 'Galician', 'gl', '', 60, NULL, 0, 0),
(39, 'Guarani', 'gn', '', 60, NULL, 0, 0),
(40, 'Gujarati', 'gu', '', 60, NULL, 0, 0),
(41, 'Hausa', 'ha', '', 60, NULL, 0, 0),
(42, 'Hindi', 'hi', '', 60, NULL, 0, 0),
(43, 'Croatian', 'hr', '', 60, NULL, 0, 0),
(44, 'Hungarian', 'hu', '', 60, NULL, 0, 0),
(45, 'Armenian', 'hy', '', 60, NULL, 0, 0),
(46, 'Interlingua', 'ia', '', 60, NULL, 0, 0),
(47, 'Interlingue', 'ie', '', 60, NULL, 0, 0),
(48, 'Inupiak', 'ik', '', 60, NULL, 0, 0),
(49, 'Indonesian', 'in', '', 60, NULL, 0, 0),
(50, 'Icelandic', 'is', '', 60, NULL, 0, 0),
(51, 'Italian', 'it', '', 60, NULL, 0, 0),
(52, 'Hebrew', 'iw', '', 60, NULL, 0, 0),
(53, 'Japanese', 'ja', 'http://letotrans.vn/images/languages/japan.png', 3, NULL, 0, 1),
(54, 'Yiddish', 'ji', '', 60, NULL, 0, 0),
(55, 'Javanese', 'jw', '', 60, NULL, 0, 0),
(56, 'Georgian', 'oa', '', 60, NULL, 0, 0),
(57, 'Kazakh', 'kk', '', 60, NULL, 0, 0),
(58, 'Greenlandic', 'kl', '', 60, NULL, 0, 0),
(59, 'Cambodian', 'km', '', 60, NULL, 0, 0),
(60, 'Kannada', 'kn', '', 60, NULL, 0, 0),
(61, 'Korean', 'ko', 'http://letotrans.vn/images/languages/south-korea.png', 4, NULL, 0, 1),
(62, 'Kashmiri', 'ks', '', 60, NULL, 0, 0),
(63, 'Kurdish', 'ku', '', 60, NULL, 0, 0),
(64, 'Kirghiz', 'ky', '', 60, NULL, 0, 0),
(65, 'Latin', 'la', '', 60, NULL, 0, 0),
(66, 'Lingala', 'ln', '', 60, NULL, 0, 0),
(67, 'Laothian', 'lo', '', 60, NULL, 0, 0),
(68, 'Lithuanian', 'lt', '', 60, NULL, 0, 0),
(69, 'Latvian/Lettish', 'lv', '', 60, NULL, 0, 0),
(70, 'Malagasy', 'mg', '', 60, NULL, 0, 0),
(71, 'Maori', 'mi', '', 60, NULL, 0, 0),
(72, 'Macedonian', 'mk', '', 60, NULL, 0, 0),
(73, 'Malayalam', 'ml', '', 60, NULL, 0, 0),
(74, 'Mongolian', 'mn', '', 60, NULL, 0, 0),
(75, 'Moldavian', 'mo', '', 60, NULL, 0, 0),
(76, 'Marathi', 'mr', '', 60, NULL, 0, 0),
(77, 'Malay', 'ms', '', 60, NULL, 0, 0),
(78, 'Maltese', 'mt', '', 60, NULL, 0, 0),
(79, 'Burmese', 'my', '', 60, NULL, 0, 0),
(80, 'Nauru', 'na', '', 60, NULL, 0, 0),
(81, 'Nepali', 'ne', '', 60, NULL, 0, 0),
(82, 'Dutch', 'nl', '', 60, NULL, 0, 0),
(83, 'Norwegian', 'no', '', 60, NULL, 0, 0),
(84, 'Occitan', 'oc', '', 60, NULL, 0, 0),
(85, '(Afan)/Oromoor/Oriya', 'om', '', 60, NULL, 0, 0),
(86, 'Punjabi', 'pa', '', 60, NULL, 0, 0),
(87, 'Polish', 'pl', '', 60, NULL, 0, 0),
(88, 'Pashto/Pushto', 'ps', '', 60, NULL, 0, 0),
(89, 'Portuguese', 'pt', '', 60, NULL, 0, 0),
(90, 'Quechua', 'qu', '', 60, NULL, 0, 0),
(91, 'Rhaeto-Romance', 'rm', '', 60, NULL, 0, 0),
(92, 'Kirundi', 'rn', '', 60, NULL, 0, 0),
(93, 'Romanian', 'ro', '', 60, NULL, 0, 0),
(94, 'Russian', 'ru', '', 60, NULL, 0, 0),
(95, 'Kinyarwanda', 'rw', '', 60, NULL, 0, 0),
(96, 'Sanskrit', 'sa', '', 60, NULL, 0, 0),
(97, 'Sindhi', 'sd', '', 60, NULL, 0, 0),
(98, 'Sangro', 'sg', '', 60, NULL, 0, 0),
(99, 'Serbo-Croatian', 'sh', '', 60, NULL, 0, 0),
(100, 'Singhalese', 'si', '', 60, NULL, 0, 0),
(101, 'Slovak', 'sk', '', 60, NULL, 0, 0),
(102, 'Slovenian', 'sl', '', 60, NULL, 0, 0),
(103, 'Samoan', 'sm', '', 60, NULL, 0, 0),
(104, 'Shona', 'sn', '', 60, NULL, 0, 0),
(105, 'Somali', 'so', '', 60, NULL, 0, 0),
(106, 'Albanian', 'sq', '', 60, NULL, 0, 0),
(107, 'Serbian', 'sr', '', 60, NULL, 0, 0),
(108, 'Siswati', 'ss', '', 60, NULL, 0, 0),
(109, 'Sesotho', 'st', '', 60, NULL, 0, 0),
(110, 'Sundanese', 'su', '', 60, NULL, 0, 0),
(111, 'Swedish', 'sv', '', 60, NULL, 0, 0),
(112, 'Swahili', 'sw', '', 60, NULL, 0, 0),
(113, 'Tamil', 'ta', '', 60, NULL, 0, 0),
(114, 'Telugu', 'te', '', 60, NULL, 0, 0),
(115, 'Tajik', 'tg', '', 60, NULL, 0, 0),
(116, 'Thai', 'th', '', 60, NULL, 0, 0),
(117, 'Tigrinya', 'ti', '', 60, NULL, 0, 0),
(118, 'Turkmen', 'tk', '', 60, NULL, 0, 0),
(119, 'Tagalog', 'tl', '', 60, NULL, 0, 0),
(120, 'Setswana', 'tn', '', 60, NULL, 0, 0),
(121, 'Tonga', 'to', '', 60, NULL, 0, 0),
(122, 'Turkish', 'tr', '', 60, NULL, 0, 0),
(123, 'Tsonga', 'ts', '', 60, NULL, 0, 0),
(124, 'Tatar', 'tt', '', 60, NULL, 0, 0),
(125, 'Twi', 'tw', '', 60, NULL, 0, 0),
(126, 'Ukrainian', 'uk', '', 60, NULL, 0, 0),
(127, 'Urdu', 'ur', '', 60, NULL, 0, 0),
(128, 'Uzbek', 'uz', '', 60, NULL, 0, 0),
(129, 'Vietnamese', 'vi', 'http://letotrans.vn/images/languages/vietnam.png', 0, 50, 1, 1),
(130, 'Volapuk', 'vo', '', 60, NULL, 0, 0),
(131, 'Wolof', 'wo', '', 60, NULL, 0, 0),
(132, 'Xhosa', 'xh', '', 60, NULL, 0, 0),
(133, 'Yoruba', 'yo', '', 60, NULL, 0, 0),
(134, 'Chinese', 'zh', 'http://letotrans.vn/images/languages/china.png', 2, NULL, 0, 1),
(135, 'Zulu', 'zu', '', 60, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_menus`
--

CREATE TABLE `tbl_menus` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `desc` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `isactive` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_menus`
--

INSERT INTO `tbl_menus` (`id`, `name`, `code`, `desc`, `isactive`) VALUES
(1, 'Main menu', 'main-menu', '', 1),
(2, 'Menu Footer', 'Menu-footer', '', 1),
(3, 'Menu footer 2', 'menu-footer-2', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_mnuitems`
--

CREATE TABLE `tbl_mnuitems` (
  `id` int(11) NOT NULL,
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
  `isactive` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_mnuitems`
--

INSERT INTO `tbl_mnuitems` (`id`, `par_id`, `menu_id`, `name`, `code`, `intro`, `viewtype`, `category_id`, `content_id`, `link`, `icon`, `class`, `order`, `isactive`) VALUES
(1, 0, 1, 'Trang chủ', 'trang-chu', '', 'link', 0, 0, 'http://letotrans.vn/', 'fa fa-home', 'home', 0, 1),
(2, 2, 1, 'Giới thiệu', 'gioi-thieu', '<img src=\"http://daihocdongdo.edu.vn/images/DD.jpg\" alt=\"\" align=\"\" border=\"0px\">', 'block', 44, 0, '', '', '', 0, 1),
(3, 0, 1, 'Blog', 'blog', '', 'block', 5, 0, '', '', '', 2, 1),
(4, 5, 1, 'Ngôn ngữ', 'ngon-ngu', '', 'link', 0, 0, 'http://letotrans.vn/ngon-ngu', '', '', 2, 1),
(5, 0, 1, 'More', 'more', '', 'link', 0, 0, '#', '', '', 5, 1),
(7, 5, 1, 'FAQ', 'faq', '', 'link', 0, 0, 'http://letotrans.vn/cau-hoi-thuong-gap', '', '', 6, 1),
(10, 0, 3, 'FAQs', 'faqs', NULL, 'link', 0, 0, '#', '', '', 0, 1),
(11, 0, 3, 'Liên hệ', 'lien-he', NULL, 'link', 0, 0, '#', '', '', 0, 1),
(15, 0, 2, 'Câu hỏi thường gặp', 'cau-hoi-thuong-gap', '', 'block', 1, 0, '', '', '', 0, 1),
(16, 0, 2, 'Hướng dẫn đặt dịch vụ', 'huong-dan-dat-dich-vu', '', 'link', 0, 0, '#', '', '', 0, 1),
(17, 0, 2, 'Chính sách giao hàng', 'chinh-sach-giao-hang', '', 'link', 0, 0, '#', '', '', 0, 1),
(18, 0, 2, 'Chính sách bảo hành', 'chinh-sach-bao-hanh', '', 'link', 0, 0, '#', '', '', 0, 1),
(19, 0, 2, 'Thông tin chuyển khoản', 'thong-tin-chuyen-khoan', '', 'link', 0, 0, '#', '', '', 0, 1),
(20, 0, 2, 'Tư vấn khách hàng', 'tu-van-khach-hang', '', 'link', 0, 0, '#', '', '', 0, 1),
(21, 0, 1, 'Dịch vụ', 'dich-vu', '', 'link', 0, 0, 'http://letotrans.vn/dich-vu', '', '', 1, 1),
(22, 5, 1, 'Ý kiến khách hàng', 'y-kien-khach-hang', '', 'link', 0, 0, 'http://letotrans.vn/y-kien-khach-hang', '', '', 4, 1),
(23, 0, 1, 'Giới thiệu', 'gioi-thieu', '', 'link', 0, 0, 'http://letotrans.vn/gioi-thieu', '', '', 4, 1),
(24, 0, 1, 'Hợp tác', 'hop-tac', '', 'block', 6, 0, '', '', '', 3, 1),
(25, 5, 1, 'Hình thức thanh toán', 'hinh-thuc-thanh-toan', '', 'link', 0, 0, '#', '', '', 3, 1),
(26, 5, 1, 'Order', 'order', '', 'link', 0, 0, 'http://letotrans.vn/order', '', '', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_modtype`
--

CREATE TABLE `tbl_modtype` (
  `id` int(11) NOT NULL,
  `code` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_modtype`
--

INSERT INTO `tbl_modtype` (`id`, `code`, `name`) VALUES
(1, 'mainmenu', 'Main menu'),
(2, 'html', 'HTML'),
(3, 'categories', 'Nhóm bài viết'),
(4, 'news', 'Bài viết'),
(5, 'slide', 'Slideshow'),
(6, 'video', 'Tin Video'),
(7, 'gallery', 'Tin ảnh'),
(8, 'partner', 'Đối tác'),
(9, 'more', 'Mở rộng');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_modules`
--

CREATE TABLE `tbl_modules` (
  `id` int(11) NOT NULL,
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
  `isactive` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_modules`
--

INSERT INTO `tbl_modules` (`id`, `type`, `title`, `intro`, `content`, `viewtitle`, `menu_id`, `menu_ids`, `category_id`, `content_id`, `theme`, `position`, `class`, `order`, `isactive`) VALUES
(2, 'mainmenu', 'Main menu', '', '', 0, 1, '', 0, NULL, '', 'navitor', '', 0, 1),
(15, 'more', 'Các lĩnh vực ngành nghề chúng tôi có thể dịch', '', '', 0, 0, '', 0, 0, 'services', 'box2', '', 1, 1),
(21, 'html', 'Copyright', '', '<p>Bản quyền thuộc về Leto Trans</p>', 0, 0, NULL, 0, 0, '', 'bottom', '', 0, 1),
(43, 'html', 'Thông tin liên hệ - Trang liên hệ', '', '<div><span style=\"font-size: 24px;\">THC AUTO SERVICE</span></div><div><br></div><div><div>XƯỞNG DỊCH VỤ 1:</div><div>430 đường Phúc Diễm, Xuân Phương, Nam Từ Liêm, HN</div><div><br></div><div>XƯỞNG DỊCH VỤ 2:</div><div>563 đường Phúc Diễm, Xuân Phương, Nam Từ Liêm, HN</div><div><br></div><div>HOTLINE:</div><div>0968.87.87.68 - 0964.10.4444 (Hỗ trợ 24/7)</div><div><br></div><div>EMAIL:</div><div>otomydinhthc@gmail.com</div></div>', 0, 0, NULL, 0, NULL, '', 'user9', '', 0, 1),
(48, 'slide', 'Banner slideshow', '', '', 0, 0, NULL, 0, NULL, '', 'banner', '', 0, 1),
(51, 'more', 'Đăng ký nhận tin', '', '', 0, 0, NULL, 0, 0, 'register', 'ads2', '', 0, 1),
(52, 'html', 'Hình thức thanh toán', '', '<div class=\"item-header\"><span>HÌNH THỨC THANH TOÁN</span></div>\r\n						<ul>\r\n							<li><img src=\"http://letotrans.vn/images/icons/paypal.jpg\"></li>\r\n							<li><img src=\"http://letotrans.vn/images/icons/visa.jpg\"></li>\r\n							<li><img src=\"http://letotrans.vn/images/icons/mastercard.jpg\"></li>\r\n							<li><img src=\"http://letotrans.vn/images/icons/american-express.jpg\"></li>\r\n							<li><img src=\"http://letotrans.vn/images/icons/discover.jpg\"></li>\r\n							<li><img src=\"http://letotrans.vn/images/icons/wire-transfer.jpg\"></li>\r\n						</ul>', 0, 0, NULL, 0, 0, '', 'box4', '', 0, 1),
(53, 'partner', 'ĐỐI TÁC THƯỜNG XUYÊN CỦA LETOtrans', '', '', 1, 0, NULL, 0, 0, 'default', 'box3', '', 0, 1),
(54, 'more', 'Bạn đã sẵn sàng sử dụng dịch vụ chưa', '', '', 0, 0, NULL, 0, 0, 'shake-hand', 'box9', '', 0, 1),
(55, 'html', 'Các định dạng tài liệu sau khi dịch', '', '<ul>\r\n								<li><span>Các định dạng tài liệu sau khi dịch:</span></li>\r\n								<li class=\"format_item\"><img src=\"http://letotrans.vn/images/icons/icon-doc.png\"></li>\r\n								<li class=\"format_item\"><img src=\"http://letotrans.vn/images/icons/icon-xml.png\"></li>\r\n								<li class=\"format_item\"><img src=\"http://letotrans.vn/images/icons/icon-xls.png\"></li>\r\n								<li class=\"format_item\"><img src=\"http://letotrans.vn/images/icons/icon-pdf.png\"></li>\r\n								<li class=\"format_item\"><img src=\"http://letotrans.vn/images/icons/icon-txt.png\"></li>\r\n								<li class=\"format_item\"><img src=\"http://letotrans.vn/images/icons/icon-html.png\"></li>\r\n							</ul>', 0, 0, NULL, 0, 0, '', 'box5', '', 0, 1),
(56, 'more', 'Quy trình thực hiện', '', '', 0, 0, NULL, 0, 0, 'process', 'box6', '', 0, 1),
(58, 'more', 'Aside - Ý kiến khách hàng', '', '', 0, 0, NULL, 0, 0, 'feedback', 'box8', '', 0, 1),
(61, 'partner', 'Slide đối tác', '', '', 0, 0, NULL, 0, NULL, '', 'user7', '', 0, 1),
(62, 'html', 'Banner slide - text 1', '', '<p>Quy trình chuẩn quốc tế (International certification standards)</p>', 0, 0, NULL, 0, 0, '', 'box1', '', 0, 1),
(63, 'more', 'Module languages', '', '', 0, 0, NULL, 0, 0, 'languages', 'ads1', '', 0, 1),
(75, 'html', 'Google map', '', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3723.7415077264172!2d105.81414881533225!3d21.04302649266612!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135ab10301dd91f%3A0x7bf7f7b69c64e61f!2sHCMCC%20Tower!5e0!3m2!1svi!2s!4v1569397961209!5m2!1svi!2s\" width=\"100%\" frameborder=\"0\" style=\"border:0;\" allowfullscreen=\"\"></iframe>', 0, 0, NULL, 0, 0, '', 'box10', '', 0, 1),
(76, 'mainmenu', 'Menu footer', '', '', 0, 2, NULL, 0, 0, 'menu_footer', 'box11', '', 0, 1),
(77, 'mainmenu', 'Footer menu 2', '', '', 0, 3, NULL, 0, 0, 'menu_footer', 'box7', '', 0, 1),
(78, 'html', 'Banner slide - text 2', '', '<p>Chất lượng dịch làm cốt lõi (Focus on quality for the best service)</p>', 0, 0, NULL, 0, 0, '', 'box12', '', 0, 1),
(79, 'html', 'Banner slide - text 3', '', '<p>Chỉ dịch bằng người dịch (Human translation only)</p>', 0, 0, NULL, 0, 0, '', 'box13', '', 0, 1),
(80, 'html', 'Banner slide - text 4', '', '<p>Dịch trên 50 ngôn ngữ (more than 50 languages)</p>', 0, 0, NULL, 0, 0, '', 'box14', '', 0, 1),
(81, 'html', 'Banner slide - text 5', '', '<p>Tính giá online thuận tiện (Price calculator), <a href=\"http://letotrans.vn/order\" target=\"_blank\">Tính giá&nbsp;(Get a price)</a></p>', 0, 0, NULL, 0, 0, '', 'box15', '', 0, 1),
(82, 'more', 'Mobile - Home slide service', '', '', 0, 0, NULL, 0, 0, 'mobile-services', 'box16', '', 0, 1),
(83, 'categories', 'Trang chủ - Câu hỏi thường gặp', '', '', 0, 0, NULL, 1, 0, 'faq', 'box17', '', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order`
--

CREATE TABLE `tbl_order` (
  `id` int(11) NOT NULL,
  `firstname` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `service` int(11) DEFAULT NULL,
  `service_type` int(11) DEFAULT NULL,
  `from` int(11) DEFAULT NULL,
  `to` int(11) DEFAULT NULL,
  `files` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `numpage` int(11) DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `pay_type` int(11) DEFAULT NULL,
  `lang_price` float NOT NULL,
  `note` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `time` tinyint(1) DEFAULT '0',
  `ccd` float DEFAULT NULL,
  `ccg` float DEFAULT NULL,
  `ship` tinyint(1) DEFAULT NULL,
  `total` float(255,0) DEFAULT NULL,
  `total2` float NOT NULL,
  `cdate` int(11) NOT NULL,
  `status` tinyint(2) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_package`
--

CREATE TABLE `tbl_package` (
  `id` int(11) NOT NULL,
  `service_id` int(11) DEFAULT NULL,
  `service_type_id` int(11) DEFAULT NULL,
  `price_basic` float DEFAULT NULL,
  `price_pro` float DEFAULT NULL,
  `price_vip` float DEFAULT NULL,
  `intro_basic` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `intro_pro` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `intro_vip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `order` int(11) DEFAULT '0',
  `isactive` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_package`
--

INSERT INTO `tbl_package` (`id`, `service_id`, `service_type_id`, `price_basic`, `price_pro`, `price_vip`, `intro_basic`, `intro_pro`, `intro_vip`, `order`, `isactive`) VALUES
(1, 1, 1, 5, 1000, 300, '<ul>\r\n<li>everyday content</li>\r\n<li>blog posts</li>\r\n<li>user reviews</li>\r\n</ul>', '<ul>\r\n<li>business communication</li>\r\n<li>app or web localization</li>\r\n<li>product descriptions</li>\r\n</ul>', '<ul>\r\n<li>medical reports</li>\r\n<li>international agreements</li>\r\n<li>patents, licences</li>\r\n</ul>', 0, 1),
(2, 1, 2, 50, 1000, 500, '<ul>\r\n<li>everyday content</li>\r\n<li>blog posts</li>\r\n<li>user reviews</li>\r\n</ul>', '<ul>\r\n<li>business communication</li>\r\n<li>app or web localization</li>\r\n<li>product descriptions</li>\r\n</ul>', '<ul>\r\n<li>medical reports</li>\r\n<li>international agreements</li>\r\n<li>patents, licences</li>\r\n</ul>', 0, 1),
(3, 1, 3, 50, 2000, 500, '<ul>\r\n<li>everyday content</li>\r\n<li>blog posts</li>\r\n<li>user reviews</li>\r\n</ul>', '<ul>\r\n<li>business communication</li>\r\n<li>app or web localization</li>\r\n<li>product descriptions</li>\r\n</ul>', '<ul>\r\n<li>medical reports</li>\r\n<li>international agreements</li>\r\n<li>patents, licences</li>\r\n</ul>', 0, 1),
(4, 1, 4, 50, 100, 500, '<ul>\r\n<li>everyday content</li>\r\n<li>blog posts</li>\r\n<li>user reviews</li>\r\n</ul>', '<ul>\r\n<li>business communication</li>\r\n<li>app or web localization</li>\r\n<li>product descriptions</li>\r\n</ul>', '<ul>\r\n<li>medical reports</li>\r\n<li>international agreements</li>\r\n<li>patents, licences</li>\r\n</ul>', 0, 1),
(5, 2, 1, 50, 100, 500, '<ul>\r\n<li>everyday content</li>\r\n<li>blog posts</li>\r\n<li>user reviews</li>\r\n</ul>', '<ul>\r\n<li>business communication</li>\r\n<li>app or web localization</li>\r\n<li>product descriptions</li>\r\n</ul>', '<ul>\r\n<li>medical reports</li>\r\n<li>international agreements</li>\r\n<li>patents, licences</li>\r\n</ul>', 0, 1),
(6, 2, 2, 50, 100, 500, '<ul>\r\n<li>everyday content</li>\r\n<li>blog posts</li>\r\n<li>user reviews</li>\r\n</ul>', '<ul>\r\n<li>business communication</li>\r\n<li>app or web localization</li>\r\n<li>product descriptions</li>\r\n</ul>', '<ul>\r\n<li>medical reports</li>\r\n<li>international agreements</li>\r\n<li>patents, licences</li>\r\n</ul>', 0, 1),
(7, 2, 3, 50, 100, 500, '<ul>\r\n<li>everyday content</li>\r\n<li>blog posts</li>\r\n<li>user reviews</li>\r\n</ul>', '<ul>\r\n<li>business communication</li>\r\n<li>app or web localization</li>\r\n<li>product descriptions</li>\r\n</ul>', '<ul>\r\n<li>medical reports</li>\r\n<li>international agreements</li>\r\n<li>patents, licences</li>\r\n</ul>', 0, 1),
(8, 2, 4, 50, 100, 500, '<ul>\r\n<li>everyday content</li>\r\n<li>blog posts</li>\r\n<li>user reviews</li>\r\n</ul>', '<ul>\r\n<li>business communication</li>\r\n<li>app or web localization</li>\r\n<li>product descriptions</li>\r\n</ul>', '<ul>\r\n<li>medical reports</li>\r\n<li>international agreements</li>\r\n<li>patents, licences</li>\r\n</ul>', 0, 1),
(9, 3, 1, 50, 100, 500, '<ul>\r\n<li>everyday content</li>\r\n<li>blog posts</li>\r\n<li>user reviews</li>\r\n</ul>', '<ul>\r\n<li>business communication</li>\r\n<li>app or web localization</li>\r\n<li>product descriptions</li>\r\n</ul>', '<ul>\r\n<li>medical reports</li>\r\n<li>international agreements</li>\r\n<li>patents, licences</li>\r\n</ul>', 0, 1),
(10, 3, 2, 50, 100, 500, '<ul>\r\n<li>everyday content</li>\r\n<li>blog posts</li>\r\n<li>user reviews</li>\r\n</ul>', '<ul>\r\n<li>business communication</li>\r\n<li>app or web localization</li>\r\n<li>product descriptions</li>\r\n</ul>', '<ul>\r\n<li>medical reports</li>\r\n<li>international agreements</li>\r\n<li>patents, licences</li>\r\n</ul>', 0, 1),
(11, 3, 3, 50, 100, 500, '<ul>\r\n<li>everyday content</li>\r\n<li>blog posts</li>\r\n<li>user reviews</li>\r\n</ul>', '<ul>\r\n<li>business communication</li>\r\n<li>app or web localization</li>\r\n<li>product descriptions</li>\r\n</ul>', '<ul>\r\n<li>medical reports</li>\r\n<li>international agreements</li>\r\n<li>patents, licences</li>\r\n</ul>', 0, 1),
(12, 3, 4, 50, 100, 500, '<ul>\r\n<li>everyday content</li>\r\n<li>blog posts</li>\r\n<li>user reviews</li>\r\n</ul>', '<ul>\r\n<li>business communication</li>\r\n<li>app or web localization</li>\r\n<li>product descriptions</li>\r\n</ul>', '<ul>\r\n<li>medical reports</li>\r\n<li>international agreements</li>\r\n<li>patents, licences</li>\r\n</ul>', 0, 1),
(13, 4, 5, 50, 100, 500, '<ul>\r\n<li>everyday content</li>\r\n<li>blog posts</li>\r\n<li>user reviews</li>\r\n</ul>', '<ul>\r\n<li>business communication</li>\r\n<li>app or web localization</li>\r\n<li>product descriptions</li>\r\n</ul>', '<ul>\r\n<li>medical reports</li>\r\n<li>international agreements</li>\r\n<li>patents, licences</li>\r\n</ul>', 0, 1),
(14, 4, 6, 50, 100, 500, '<ul>\r\n<li>everyday content</li>\r\n<li>blog posts</li>\r\n<li>user reviews</li>\r\n</ul>', '<ul>\r\n<li>business communication</li>\r\n<li>app or web localization</li>\r\n<li>product descriptions</li>\r\n</ul>', '<ul>\r\n<li>medical reports</li>\r\n<li>international agreements</li>\r\n<li>patents, licences</li>\r\n</ul>', 0, 1),
(15, 4, 7, 50, 100, 500, '<ul>\r\n<li>everyday content</li>\r\n<li>blog posts</li>\r\n<li>user reviews</li>\r\n</ul>', '<ul>\r\n<li>business communication</li>\r\n<li>app or web localization</li>\r\n<li>product descriptions</li>\r\n</ul>', '<ul>\r\n<li>medical reports</li>\r\n<li>international agreements</li>\r\n<li>patents, licences</li>\r\n</ul>', 0, 1),
(16, 4, 8, 50, 100, 500, '<ul>\r\n<li>everyday content</li>\r\n<li>blog posts</li>\r\n<li>user reviews</li>\r\n</ul>', '<ul>\r\n<li>business communication</li>\r\n<li>app or web localization</li>\r\n<li>product descriptions</li>\r\n</ul>', '<ul>\r\n<li>medical reports</li>\r\n<li>international agreements</li>\r\n<li>patents, licences</li>\r\n</ul>', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_partner`
--

CREATE TABLE `tbl_partner` (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `images` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `order` tinyint(4) DEFAULT NULL,
  `isactive` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_partner`
--

INSERT INTO `tbl_partner` (`id`, `name`, `images`, `link`, `order`, `isactive`) VALUES
(1, 'Hãng luật LETO', 'http://letotrans.vn/images/logo-leto.png', 'https://leto.vn/', 1, 1),
(2, 'Đông Dương Travel', 'http://letotrans.vn/images/138bc4acc1fb22a57bea.jpg', 'http://dongduongtravel.vn/', 2, 1),
(3, 'Luật Hà Trần', 'http://letotrans.vn/images/luat-ha-tran.png', 'http://luathatran.vn/', 3, 1),
(4, 'Sách chuyên khảo pháp lý và kinh doanh LETObooks', 'http://letotrans.vn/images/logo-letobooks.png', 'https://letobooks.vn/', 4, 1),
(5, ' CÔNG TY CỔ PHẦN DU HỌC VÀ ĐÀO TẠO QUỐC TẾ MEGASTUDY', 'http://letotrans.vn/images/megastudy.jpg', 'https://megastudy.edu.vn/', 5, 1),
(7, 'Công ty TNHH Du Lịch Và Sự Kiện Bầu Trời Hà Nội', 'http://letotrans.vn/images/hanoi-sky-team.jpg', 'https://hanoiskyteam.com/', 0, 1),
(8, 'Văn phòng Luật sư Phụng Việt', 'http://letotrans.vn/images/luat-phung-viet.png', 'http://luatsuphungviet.com/', 0, 1),
(9, 'TECHNO VIETNAM INDUSTRIAL CO., LTD', 'http://letotrans.vn/images/techlogo.png', 'http://technovietnam.com/', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_position`
--

CREATE TABLE `tbl_position` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_position`
--

INSERT INTO `tbl_position` (`id`, `name`) VALUES
(1, 'header'),
(2, 'navitor'),
(3, 'footer'),
(4, 'top'),
(5, 'bottom'),
(6, 'path'),
(7, 'left'),
(8, 'right'),
(9, 'box1'),
(10, 'box2'),
(11, 'box3'),
(12, 'box4'),
(13, 'box5'),
(14, 'box6'),
(15, 'box7'),
(16, 'box8'),
(17, 'box9'),
(18, 'box10'),
(19, 'box11'),
(20, 'box12'),
(21, 'box13'),
(22, 'box14'),
(23, 'box15'),
(24, 'box16'),
(25, 'box17'),
(26, 'box18'),
(27, 'box19'),
(28, 'box20'),
(29, 'user1'),
(30, 'user2'),
(31, 'user3'),
(32, 'user4'),
(33, 'user5'),
(34, 'user6'),
(35, 'user7'),
(36, 'user8'),
(37, 'user9'),
(38, 'user10'),
(39, 'banner1'),
(40, 'banner2'),
(41, 'banner3'),
(42, 'banner4'),
(43, 'banner5'),
(44, 'banner6'),
(45, 'banner7'),
(46, 'banner8'),
(47, 'banner9'),
(48, 'banner10'),
(49, 'ads1'),
(50, 'ads2'),
(51, 'ads3'),
(52, 'ads4'),
(53, 'ads5'),
(54, 'ads6'),
(55, 'ads7'),
(56, 'ads8'),
(57, 'ads9'),
(58, 'ads10'),
(59, 'ads11'),
(60, 'ads12'),
(61, 'ads13'),
(62, 'ads14'),
(63, 'ads15'),
(64, 'ads16'),
(65, 'ads17'),
(66, 'ads18'),
(67, 'ads19'),
(68, 'ads20');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_price`
--

CREATE TABLE `tbl_price` (
  `id` int(11) NOT NULL,
  `lang1` int(11) DEFAULT NULL,
  `lang2` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_price`
--

INSERT INTO `tbl_price` (`id`, `lang1`, `lang2`, `price`) VALUES
(5, 129, 1, 2000),
(6, 129, 23, 50),
(7, 129, 53, 50),
(8, 129, 61, 50),
(9, 129, 134, 50);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_type`
--

CREATE TABLE `tbl_product_type` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `intro` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `order` int(11) DEFAULT '0',
  `isactive` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_product_type`
--

INSERT INTO `tbl_product_type` (`id`, `name`, `code`, `intro`, `order`, `isactive`) VALUES
(1, 'Website', 'website', '<ul>\r\n<li>everyday content</li>\r\n<li>blog posts</li>\r\n<li>user reviews</li>\r\n</ul>', 0, 1),
(2, 'Hồ sơ', 'ho-so', '<ul>\r\n<li>everyday content</li>\r\n<li>blog posts</li>\r\n<li>user reviews</li>\r\n</ul>', 0, 1),
(3, 'Phần mềm', 'phan-mem', '<ul>\r\n<li>everyday content</li>\r\n<li>blog posts</li>\r\n<li>user reviews</li>\r\n</ul>', 0, 1),
(4, 'Game', 'game', '<ul>\r\n<li>everyday content</li>\r\n<li>blog posts</li>\r\n<li>user reviews</li>\r\n</ul>', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_seo`
--

CREATE TABLE `tbl_seo` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ishot` tinyint(4) DEFAULT '0',
  `order` tinyint(4) DEFAULT '0',
  `isactive` tinyint(4) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_seo`
--

INSERT INTO `tbl_seo` (`id`, `title`, `link`, `image`, `meta_title`, `meta_key`, `meta_desc`, `ishot`, `order`, `isactive`) VALUES
(1, 'Câu hỏi thường gặp', 'http://letotrans.vn/cau-hoi-thuong-gap', '', '', '', '', 0, 0, 1),
(2, 'Câu hỏi tổng quan', 'http://letotrans.vn/cau-hoi-tong-quan', '', '', '', '', 0, 0, 1),
(3, 'Câu hỏi về phiên dịch viên', 'http://letotrans.vn/cau-hoi-ve-phien-dich-vien', '', '', '', '', 0, 0, 1),
(4, 'Câu hỏi về phí dịch vụ', 'http://letotrans.vn/cau-hoi-ve-phi-dich-vu', '', '', '', '', 0, 0, 1),
(5, 'Online translation services - for those who need it fast!', 'http://letotrans.vn/cau-hoi-ve-phien-dich-vien/online-translation-services-for-those-who-need-it-fast.html', 'http://letotrans.vn/images/hinh-anh/post-01.jpg', 'Online translation services - for those who need it fast!', 'Online translation services - for those who need it fast!', 'Online translation services - for those who need it fast!', 0, 0, 1),
(6, 'Blog', 'http://letotrans.vn/blog', '', '', '', '', 0, 0, 1),
(7, '5 Simple Steps for a Successful Transcreation Project', 'http://letotrans.vn/hop-tac/5-simple-steps-for-a-successful-transcreation-project.html', 'http://letotrans.vn/images/hinh-anh/post-03.jpg', '', '', '', 0, 0, 1),
(8, '5 Simple Steps for a Successful Transcreation Project', 'http://letotrans.vn/hop-tac/5-simple-steps-for-a-successful-transcreation-project.html', 'http://letotrans.vn/images/hinh-anh/post-03.jpg', '', '', '', 0, 0, 1),
(9, 'Hiring an Interpreting Company: 7 Things to Consider', 'http://letotrans.vn/blog/hiring-an-interpreting-company-7-things-to-consider.html', 'http://letotrans.vn/images/hinh-anh/post-04.jpg', '', '', '', 0, 0, 1),
(10, '10 Little Translation Mistakes That Caused Big Problems', 'http://letotrans.vn/blog/10-little-translation-mistakes-that-caused-big-problems.html', 'http://letotrans.vn/images/hinh-anh/post-05.jpg', '', '', '', 0, 0, 1),
(11, '5 Steps to a Successful International Digital Marketing Strategy', 'http://letotrans.vn/blog/5-steps-to-a-successful-international-digital-marketing-strategy.html', 'http://letotrans.vn/images/hinh-anh/post-06.jpg', '', '', '', 0, 0, 1),
(12, 'How to Overcome Cross Cultural Barriers in Business Negotiations', 'http://letotrans.vn/blog/how-to-overcome-cross-cultural-barriers-in-business-negotiations.html', 'http://letotrans.vn/images/hinh-anh/post-07.jpg', 'How to Overcome Cross Cultural Barriers in Business Negotiations', 'How to Overcome Cross Cultural Barriers in Business Negotiations', 'How to Overcome Cross Cultural Barriers in Business Negotiations', 0, 0, 1),
(13, 'How to Create an Effective Multilingual Content Strategy', 'http://letotrans.vn/blog/how-to-create-an-effective-multilingual-content-strategy.html', 'http://letotrans.vn/images/hinh-anh/post-08.jpg', 'How to Create an Effective Multilingual Content Strategy', 'How to Create an Effective Multilingual Content Strategy', 'How to Create an Effective Multilingual Content Strategy', 0, 0, 1),
(14, 'The Word Point is Recognized by Clutch for Outstanding Accuracy in Translation Services', 'http://letotrans.vn/cau-hoi-tong-quan/the-word-point-is-recognized-by-clutch-for-outstanding-accuracy-in-translation-services.html', 'http://letotrans.vn/images/hinh-anh/post-09.jpg', 'The Word Point is Recognized by Clutch for Outstanding Accuracy in Translation Services', 'The Word Point is Recognized by Clutch for Outstanding Accuracy in Translation Services', 'The Word Point is Recognized by Clutch for Outstanding Accuracy in Translation Services', 0, 0, 1),
(15, 'How to Protect Your Brand with Trademark Translation', 'http://letotrans.vn/cau-hoi-tong-quan/how-to-protect-your-brand-with-trademark-translation.html', 'http://letotrans.vn/images/hinh-anh/post-10.jpg', 'How to Protect Your Brand with Trademark Translation', 'How to Protect Your Brand with Trademark Translation', 'How to Protect Your Brand with Trademark Translation', 0, 0, 1),
(20, 'Bản địa hóa nội dung (Localization)', 'http://letotrans.vn/dich-vu/ban-dia-hoa-noi-dung-localization.html', 'http://letotrans.vn/images/localization.jpg', 'Dịch vụ dịch thuật', 'Dịch vụ dịch thuật', 'Dịch vụ dịch thuật', 0, 0, 1),
(21, 'Hiệu đính bản dịch (Proofreading)', 'http://letotrans.vn/dich-vu/hieu-dinh-ban-dich-proofreading.html', 'http://letotrans.vn/images/proofreading.jpg', 'Phi&ecirc;n dịch giấy tờ chứng nhận', 'Phi&ecirc;n dịch giấy tờ chứng nhận', 'Phi&ecirc;n dịch giấy tờ chứng nhận', 0, 0, 1),
(22, 'Chứng nhận bản dịch (Certified Translator)', 'http://letotrans.vn/dich-vu/chung-nhan-ban-dich-certified-translator.html', 'http://letotrans.vn/images/certifiedtranslation.jpg', 'Chứng nhận bản dịch (Certified Translator)', 'Chứng nhận bản dịch (Certified Translator)', 'Chứng nhận bản dịch (Certified Translator)', 0, 0, 1),
(23, 'Biên dịch (Translation Services)', 'http://letotrans.vn/dich-vu/bien-dich-translation-services.html', 'http://letotrans.vn/images/translationservices.jpg', 'Dịch thuật', 'Dịch thuật', 'Dịch thuật', 0, 0, 1),
(24, 'Thêm mới gói dịch vụ', 'http://letotrans.vn/dich-vu/them-moi-goi-dich-vu.html', '', '', '', '', 0, 0, 1),
(25, 'Dịch vụ dịch thuật 1', 'http://letotrans.vn/dich-vu/dich-vu-dich-thuat-1.html', '', '', '', '', 0, 0, 1),
(26, 'Dịch vụ dịch thuật 1', 'http://letotrans.vn/dich-vu/dich-vu-dich-thuat-1.html', '', '', '', '', 0, 0, 1),
(27, 'DAVID MATIN', 'http://letotrans.vn/dich-vu/david-matin.html', '', '', '', '', 0, 0, 1),
(28, 'DAVID MATIN', 'http://letotrans.vn/dich-vu/david-matin.html', '', '', '', '', 0, 0, 1),
(29, 'Dịch vụ dịch thuật 123', 'http://letotrans.vn/dich-vu/dich-vu-dich-thuat-123.html', '', '', '', '', 0, 0, 1),
(30, 'Biên dịch (Translation Services)', 'http://letotrans.vn/dich-vu/bien-dich-translation-services.html', 'http://letotrans.vn/images/translationservices.jpg', 'Dịch thuật', 'Dịch thuật', 'Dịch thuật', 0, 0, 1),
(34, 'Hợp tác', 'http://letotrans.vn/hop-tac', '', '', '', '', 0, 0, 1),
(58, 'Chung chung', 'http://letotrans.vn/dich-vu/bien-dich/chung-chung/', '', 'Chung chung', 'Chung chung', 'Chung chung', 0, 0, 1),
(59, 'Hợp pháp', 'http://letotrans.vn/dich-vu/bien-dich/hop-phap/', '', 'Hợp ph&aacute;p', 'Hợp ph&aacute;p', 'Hợp ph&aacute;p', 0, 0, 1),
(60, 'Dược phẩm (Medicine)', 'http://letotrans.vn/dich-vu/bien-dich/duoc-pham/', '', 'Dược phẩm', 'Dược phẩm', 'Dược phẩm', 0, 0, 1),
(61, 'test', 'http://letotrans.vn/blog/test.html', '', '', '', '', 0, 0, 1),
(62, 'Kỹ thuật', 'http://letotrans.vn/dich-vu/bien-dich/ky-thuat/', '', '', '', '', 0, 0, 1),
(63, 'Kinh doanh/Tài chính (Business/Finance)', 'http://letotrans.vn/dich-vu/bien-dich/kinh-doanhtai-chinh/', '', '', '', '', 0, 0, 1),
(64, 'Văn học & Nghệ thuật (Art & Literature)', 'http://letotrans.vn/dich-vu/bien-dich/van-hoc-nghe-thuat/', '', '', '', '', 0, 0, 1),
(65, 'Học thuật (Academic)', 'http://letotrans.vn/dich-vu/bien-dich/hoc-thuat/', '', '', '', '', 0, 0, 1),
(66, 'Nội dung cá nhân (Personal Content)', 'http://letotrans.vn/dich-vu/bien-dich/noi-dung-ca-nhan/', '', '', '', '', 0, 0, 1),
(67, 'Hướng dẫn kỹ thuật (Technical Manual)', 'http://letotrans.vn/dich-vu/chung-nhan-ban-dich-certified-translator/huong-dan-ky-thuat-technical-manual/', '', '', '', '', 0, 0, 1),
(68, 'Hướng dẫn nhân viên (Employee Manual)', 'http://letotrans.vn/dich-vu/chung-nhan-ban-dich-certified-translator/huong-dan-nhan-vien-employee-manual/', '', '', '', '', 0, 0, 1),
(69, 'Giấy khai sinh (Birth Certificate)', 'http://letotrans.vn/dich-vu/chung-nhan-ban-dich-certified-translator/giay-khai-sinh-birth-certificate/', '', '', '', '', 0, 0, 1),
(70, 'Bằng lái xe (Driver License)', 'http://letotrans.vn/dich-vu/chung-nhan-ban-dich-certified-translator/bang-lai-xe-driver-license/', '', '', '', '', 0, 0, 1),
(71, 'Đăng ký kết hôn (Marriage Certificate)', 'http://letotrans.vn/dich-vu/chung-nhan-ban-dich-certified-translator/dang-ky-ket-hon-marriage-certificate/', '', '', '', '', 0, 0, 1),
(72, 'Xác nhận ly hôn (Marriage License)', 'http://letotrans.vn/dich-vu/chung-nhan-ban-dich-certified-translator/xac-nhan-ly-hon-marriage-license/', '', '', '', '', 0, 0, 1),
(73, 'Chứng nhận tiêm chủng (Immunization Card)', 'http://letotrans.vn/dich-vu/chung-nhan-ban-dich-certified-translator/chung-nhan-tiem-chung-immunization-card/', '', '', '', '', 0, 0, 1),
(74, 'Lý lịch tư pháp (Police Clearance)', 'http://letotrans.vn/dich-vu/chung-nhan-ban-dich-certified-translator/ly-lich-tu-phap-police-clearance/', '', '', '', '', 0, 0, 1),
(75, 'Giá của chúng tôi có thể so với các đơn vị khác không? - Are Our Prices Comparable to Those of Other Services?', 'http://letotrans.vn/cau-hoi-ve-phi-dich-vu/gia-cua-chung-toi-co-the-so-voi-cac-don-vi-khac-khong-are-our-prices-comparable-to-those-of-other-services.html', '', '', '', '', 0, 0, 1),
(76, 'Chúng tôi dịch loại tài liệu nào? - What Kind of Documents Do We Translate?', 'http://letotrans.vn/cau-hoi-ve-phi-dich-vu/chung-toi-dich-loai-tai-lieu-nao-what-kind-of-documents-do-we-translate.html', '', '', '', '', 0, 0, 1),
(77, 'Tổng hợp (Genaral)', 'http://letotrans.vn/dich-vu/hieu-dinh-ban-dich-proofreading/tong-hop-/', '', '', '', '', 0, 0, 1),
(78, 'Pháp lý (Legal)', 'http://letotrans.vn/dich-vu/hieu-dinh-ban-dich-proofreading/phap-ly/', '', '', '', '', 0, 0, 1),
(79, 'Dược phẩm (Medicine)', 'http://letotrans.vn/dich-vu/hieu-dinh-ban-dich-proofreading/duoc-pham/', '', '', '', '', 0, 0, 1),
(80, 'Kỹ thuật & Công nghệ (Technical)', 'http://letotrans.vn/dich-vu/hieu-dinh-ban-dich-proofreading/ky-thuat-cong-nghe/', '', '', '', '', 0, 0, 1),
(81, 'Kinh doanh/Tài chính (Business/Finance)', 'http://letotrans.vn/dich-vu/hieu-dinh-ban-dich-proofreading/kinh-doanhtai-chinh/', '', '', '', '', 0, 0, 1),
(82, 'Văn học & Nghệ thuật (Art & Literature)', 'http://letotrans.vn/dich-vu/hieu-dinh-ban-dich-proofreading/van-hoc-nghe-thuat/', '', '', '', '', 0, 0, 1),
(83, 'Học thuật (Academic)', 'http://letotrans.vn/dich-vu/hieu-dinh-ban-dich-proofreading/hoc-thuat/', '', '', '', '', 0, 0, 1),
(84, 'Nội dung cá nhân (Personal Content)', 'http://letotrans.vn/dich-vu/hieu-dinh-ban-dich-proofreading/noi-dung-ca-nhan/', '', '', '', '', 0, 0, 1),
(85, 'Website', 'http://letotrans.vn/dich-vu/ban-dia-hoa-noi-dung-localization/website/', '', '', '', '', 0, 0, 1),
(86, 'Ứng dụng (Application)', 'http://letotrans.vn/dich-vu/ban-dia-hoa-noi-dung-localization/ung-dung-application/', '', '', '', '', 0, 0, 1),
(87, 'Phần mềm (Software)', 'http://letotrans.vn/dich-vu/ban-dia-hoa-noi-dung-localization/phan-mem-software/', '', '', '', '', 0, 0, 1),
(88, 'Gaming', 'http://letotrans.vn/dich-vu/ban-dia-hoa-noi-dung-localization/game/', '', '', '', '', 0, 0, 1),
(89, 'Dịch giả của LETOtrans có kinh nghiệm như thế nào? - How Experienced Are LETOtrans\'s Translators?', 'http://letotrans.vn/cau-hoi-ve-phien-dich-vien/dich-gia-cua-letotrans-co-kinh-nghiem-nhu-the-nao-how-experienced-are-letotranss-translators.html', '', '', '', '', 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_service`
--

CREATE TABLE `tbl_service` (
  `id` int(11) NOT NULL,
  `service_type_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `par_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sapo` text COLLATE utf8_unicode_ci,
  `sapo_en` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `intro` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `fulltext` text COLLATE utf8_unicode_ci,
  `thumb` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` float DEFAULT NULL,
  `author` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cdate` int(11) DEFAULT NULL,
  `mdate` int(11) DEFAULT NULL,
  `visited` int(255) DEFAULT NULL,
  `order` tinyint(4) DEFAULT '0',
  `isactive` tinyint(4) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_service`
--

INSERT INTO `tbl_service` (`id`, `service_type_id`, `par_id`, `name`, `code`, `sapo`, `sapo_en`, `intro`, `fulltext`, `thumb`, `price`, `author`, `cdate`, `mdate`, `visited`, `order`, `isactive`) VALUES
(1, '[\"5\",\"6\",\"7\",\"8\"]', 0, 'Bản địa hóa nội dung (Localization)', 'ban-dia-hoa-noi-dung-localization', 'Nếu bạn c&oacute; ứng dụng/ website/ phần mềm/ hồ sơ giới thiệu dự &aacute;n/ ... d&agrave;nh cho thị trường nước ngo&agrave;i, th&igrave; bạn cần phải bản địa h&oacute;a nội dung để người ở v&ugrave;ng địa l&yacute; bạn hướng tới c&oacute; thể hiểu đ&uacute;ng nội dung của bạn! Ch&uacute;ng t&ocirc;i sẽ điều chỉnh nội dung của bạn cho ph&ugrave; hợp với người d&ugrave;ng v&agrave; kh&aacute;ch h&agrave;ng tr&ecirc;n to&agrave;n thế giới!', 'If you have the app or software intended also for foreign markets or the game that you\'d love to see spreading, or even a personal webpage that you want to make more popular abroad, then you require a professional localization of it! We will adapt the content in such a way to help you to succeed with users and customers world-wide!', 'Chọn loại nội dung m&agrave; bạn muốn dịch. C&aacute;c chuy&ecirc;n gia của ch&uacute;ng t&ocirc;i sẵn s&agrave;ng gi&uacute;p đỡ.\r\nChoose the type of content that you wish to show the world. Our experts are ready to help.', '<h2 style=\"text-align: justify; \">BẢN ĐỊA HÓA NỘI DUNG - BẠN CÓ THỂ LÀM ĐƯỢC NÓ THÔNG QUA LETOtrans </h2><p style=\"text-align: justify; \"><i>CONTENT LOCALIZATION – GETTING IT RIGHT THROUGH LETOtrans</i></p><p style=\"text-align: justify; \">Bạn có một trang web thương mại; bạn có một chương trình đào tạo trực tuyến; bạn có phần mềm hoặc ứng dụng mà bạn muốn bán ra nước ngoài; bạn có những trò chơi sẽ trở thành một hit lớn trong cộng đồng game nước ngoài. Có một vấn đề lớn ở đây là: tất cả nội dung số này chỉ đang được thể hiện bằng ngôn ngữ mẹ đẻ của bạn và bạn đang muốn đưa chúng ra thị trường nước ngoài. Rõ ràng, bạn sẽ cần được giúp đỡ - các chuyên gia không chỉ dịch nội dung của bạn mà còn nhận thức được tất cả các từ/cụm từ mang tính thành ngữ và sắc thái văn hóa của người dân địa phương. Và đặc biệt trong trường hợp bản địa hóa trang web - nội dung và hình ảnh, màu sắc và hình ảnh cũng phải phù hợp với dân số địa phương đó.</p><p style=\"text-align: justify; \"><i>You have an e-commerce webpage; you have an online college degree program; you have software or apps that you want to sell abroad; you have games that will be a major hit in foreign gaming communities. Just one problem. All of this digital content is only in your native language, and you are looking for overseas markets. Obviously, you want help – professionals who can not only translate your content but who are aware of all of the idiomatic words/phrases and cultural nuances of a local population. And particularly in the case of webpage localization - content and visuals, color and images must be appropriate for that local population too. </i></p><p style=\"text-align: justify; \">Khi bạn chọn LETOtrans làm nhà cung cấp dịch vụ bản địa hóa nội dung, bạn sẽ có các nhà ngôn ngữ học bản địa và có trình độ. Họ sẽ không chỉ dịch mà còn đóng vai trò tư vấn để đảm bảo rằng tất cả các từ ngữ, hình ảnh, màu sắc, v.v. sẽ không gây khó chịu, và trên thực tế, làm hài lòng đối tượng xem/đọc mà bạn hướng tới.</p><p style=\"text-align: justify; \"><i>When you choose LETOtrans as a localization service provider, you will have native-born and educated linguists who will not only translate but will act as consultants to ensure that all of the wording, the images, the colors, etc. will be non-offensive, and, in fact, pleasing to the receiving audience.</i></p><h3 style=\"text-align: justify; \">Những mảng dịch vụ bản địa hóa nội dung</h3><p style=\"text-align: justify; \">Chúng tôi có những chuyên gia dày dạn kinh nghiệm được giao cho các dự án dựa trên chuyên môn của họ. Dịch vụ của chúng tôi bao gồm tất cả những mảng sau đây:</p><p style=\"text-align: justify; \"><i>We have seasoned pros who are assigned to projects based on their expertise. Our services include all of the following:</i></p><p style=\"text-align: justify; \"><b>Tài liệu và hướng dẫn sản phẩm</b></p><p style=\"text-align: justify; \"><i>Product documentation and instructions – our clients can choose online, printed, or both</i></p><p style=\"text-align: justify; \"><b>Dịch vụ bản địa hóa trang web </b>- Nội dung trang web sẽ chính xác và phù hợp với văn hóa</p><p style=\"text-align: justify; \"><i>Website localization services – Accurate and culturally-appropriate text, changes in colors and visuals as required, and testing to ensure that each loads well</i></p><p style=\"text-align: justify; \"><b>Bản địa hóa phần mềm và ứng dụng</b> - Cả hai đều nên được bản địa hóa tốt nhất trong giai đoạn phát triển, nhưng điều này chắc chắn không phải lúc nào cũng được các nhà sáng lập để tâm hoặc có năng lực thực hiện. Chúng tôi có thể đảm nhận bản địa hóa phần mềm hoặc ứng dụng. Chúng tôi có các chuyên gia phần mềm có chuyên môn về ngôn ngữ bản địa sẵn sàng đồng hành và cung cấp dịch vụ bản địa hóa ứng dụng tốt nhất.</p><p style=\"text-align: justify; \"><i>Apps and software localization – Both of these are best localized during the development phase, but this is certainly not always done. Good-sized businesses with translators on staff can get it done. We can take on software or application localization - provided these are the products you have developed or that are in the development phase – we have software experts with native language expertise ready to accept the challenge for you and provide the best app localization services.</i></p><p style=\"text-align: justify; \"><b>Dịch vụ bản địa hóa trò chơi: </b>Nếu bạn có thể phát triển các trò chơi nổi bật, chúng tôi có chuyên môn để điều chỉnh các trò chơi đó thành 100 ngôn ngữ. Các chuyên gia dịch thuật trò chơi của chúng tôi có kinh nghiệm chơi game rộng rãi cũng như bí quyết kỹ thuật để đảm bảo rằng sẽ không có lỗi dịch. Khi các trò chơi được tối ưu hóa, chúng sẽ được kiểm tra và thử nghiệm lại ttrước khi được bàn giao cho bạn.</p><p style=\"text-align: justify; \"><i>Game localization services: If you can develop outstanding games, we have the expertise to adapt those games to 100 languages. Our gaming translation experts have extensive gaming experience themselves as well as technical know-how to make sure that there will be no bugs. Once games are optimized, they are tested and re-tested in-house before being delivered back to you.</i></p><p style=\"text-align: justify; \"><b>E-Learning:</b> Bạn sẽ có thể tiếp thị khóa học của bạn bất cứ nơi nào bạn muốn, nhờ việc các dịch giả của chúng tôi có thể xử lý việc dịch và bản địa hóa nội dung cho khóa học của bạn.</p><p style=\"text-align: justify; \"><i>E-Learning: It’s the rising method of education today. Institutions and individuals both will find that our translation of coursework is completed impeccably. You will be able to market your coursework anywhere you wish, knowing that our translators can handle that.</i></p><p style=\"text-align: justify; \"><b>Đóng gói:</b> Nhiều nhà sản xuất sản phẩm quên mất phần nội dung nên bổ sung này. Khi các gói hàng được giao và ngôn ngữ bản địa được sử dụng trên bao bì đó, rất nhiều sản phẩm tốt sẽ có xác suất được mua cao hơn.</p><p style=\"text-align: justify; \"><i>Packaging:<b> </b>Many product manufacturers forget about this extra “touch.” When packages are delivered and the native language is used on that packaging, a lot of “good will” is purchased for a tiny amount of investment.</i></p><p style=\"text-align: justify; \">Với nội dung phù hợp, bạn truyền tải thông điệp với khách hàng rằng bạn quan tâm đến văn hóa và ngôn ngữ của họ. Không có nhà cung cấp dịch vụ dịch thuật bản địa hóa nội dung tốt hơn chúng tôi tại Việt Nam!</p><p style=\"text-align: justify; \"><i>With the adapted content you tell customers that you care about their culture and their language. There are no localization service providers better than us.</i><br></p>', 'http://letotrans.vn/images/localization.jpg', 2, 'admin', 1569774547, 1572237151, NULL, 3, 1),
(2, '[\"1\",\"2\",\"3\",\"4\"]', 0, 'Hiệu đính bản dịch (Proofreading)', 'hieu-dinh-ban-dich-proofreading', 'Bi&ecirc;n dịch l&agrave; một nghệ thuật về chuyển đổi ng&ocirc;n ngữ, kh&ocirc;ng phải l&agrave; dịch word by word đơn thuần. Nếu bạn đ&atilde; tự dịch một t&agrave;i liệu (B&aacute;o c&aacute;o khoa học/s&aacute;ch/tạp ch&iacute;/đề t&agrave;i,...), nhưng bạn kh&ocirc;ng chắc chắn liệu n&oacute; c&oacute; đ&uacute;ng 100% hay kh&ocirc;ng, h&atilde;y nhờ trợ gi&uacute;p từ c&aacute;c bi&ecirc;n tập vi&ecirc;n v&agrave; dịch giả chuy&ecirc;n gia của ch&uacute;ng t&ocirc;i!', 'Since the professional translation requires perfect knowledge of the foreign language, most of the people seek help with proofreading. If you have already translated a paper by yourself, but aren&rsquo;t sure whether it&rsquo;s 100% correct, get help from our expert editors and translators. We guarantee you the best results at a reasonable price!', 'Hiệu đ&iacute;nh chuy&ecirc;n nghiệp c&aacute;c giấy tờ của bạn! Ch&uacute;ng t&ocirc;i chỉnh sửa tất cả c&aacute;c loại giấy tờ từ t&agrave;i liệu chung đến t&agrave;i liệu ph&aacute;p l&yacute; bằng ng&ocirc;n ngữ bạn y&ecirc;u cầu. C&aacute;c chuy&ecirc;n gia của ch&uacute;ng t&ocirc;i hiệu đ&iacute;nh bản dịch c&aacute;c giấy tờ nhanh như bạn mong đợi.\r\nProfessional proofreading of your papers - get help here! We edit all types of papers from general to legal in the language you require. Our experts correct the papers as quickly as you expect.', '<h2 style=\"text-align: justify; \">DỊCH VỤ HIỆU ĐÍNH BẢN DỊCH TOÀN DIỆN <i>-&nbsp;FULL-SCALE PROOFREADING SERVICES</i></h2><p style=\"text-align: justify; \">Trong ngành dịch vụ dịch thuật, hiệu đính là một điều cần thiết vì những lý do quan trọng:</p><p style=\"text-align: justify; \"><i>In the translation service industry, proofreading is a necessity for important reasons:</i></p><ul><li style=\"text-align: justify; \">Nếu có lỗi dịch thuật ở một từ hoặc dùng thuật ngữ không chính xác có thể gây khó chịu cho người xem văn bản;</li><li style=\"text-align: justify;\"><i>If there are translation mistakes, an incorrect word or term could be offensive</i><br></li><li style=\"text-align: justify;\">Những bản dịch sai cũng có thể cung cấp các hướng dẫn/nội dung không chính xác, và có thể có hậu quả nghiêm trọng;</li><li style=\"text-align: justify;\"><i>Mistakes might also provide incorrect instructions, and there could be serious consequences</i><br></li><li style=\"text-align: justify;\">Danh tiếng/Sự chuyên nghiệp của một cá nhân hoặc doanh nghiệp có thể bị ảnh hưởng nếu bản dịch sai từ ngữ hoặc ngữ pháp kém;</li><li style=\"text-align: justify;\"><i>An individual or business reputation can suffer if translations result in poor wording or grammar</i></li></ul><p style=\"text-align: justify;\">Đây là một ví dụ: Trong tiếng Anh, từ ngữ \"once\"&nbsp;rõ ràng có nghĩa là một lần. Trong tiếng Tây Ban Nha, từ \"once\" có nghĩa là 11. Vì vậy, nếu thuốc được sử dụng một lần một ngày bằng tiếng Anh và một lỗi được dịch bằng tiếng Tây Ban Nha có nghĩa là \"once veces\", nghĩa là 11 lần một ngày. Đây là một lỗi thực tế mà một trong những người kiểm tra chất lượng của chúng tôi đã phát hiện ra khi một công ty dược phẩm gửi cho chúng tôi một tài liệu đã được dịch.</p><p style=\"text-align: justify;\">Here is an example: In English, the word “once” obviously means one time. In Spanish, the word “once” means 11. So, if medication were to be administered once a day in English and an error is made in Spanish that states “once veces,” that would mean 11 times a day. This was an actual error that one of our proofreaders discovered when a pharmaceutical company sent us an already-translated document.</p><p style=\"text-align: justify;\"><br><br></p>', 'http://letotrans.vn/images/proofreading.jpg', 1.4, 'admin', 1569774847, 1572020388, NULL, 2, 1),
(3, '[\"1\",\"2\",\"3\",\"4\"]', 0, 'Chứng nhận bản dịch (Certified Translator)', 'chung-nhan-ban-dich-certified-translator', 'Nếu bạn đang c&oacute; kế hoạch chuyển đến một quốc gia để sống, học tập hoặc l&agrave;m việc, bạn sẽ cần bản dịch của c&aacute;c t&agrave;i liệu của m&igrave;nh như văn bằng, chứng chỉ, l&yacute; lịch tư ph&aacute;p, hợp đồng, .... Những t&agrave;i liệu n&agrave;y đ&ograve;i hỏi nhiều hơn một bản dịch. N&oacute; đ&ograve;i hỏi phải l&agrave; bản dịch chuẩn v&agrave; được chứng thực tại đơn vị dịch/ ph&ograve;ng tư ph&aacute;p. Tại LETOtrans, bạn sẽ c&oacute; c&aacute;c bản dịch của m&igrave;nh được chứng thực.', 'If you are planning to move to another country for a living or studying there, you will want your personal documents translation. Being highly important, it requires more than just a simple translation. At our website, you will get a certified translation of all your documents and be sure that they will be secured.', 'Bạn cần một bản dịch chứng thực bằng tốt nghiệp, chứng chỉ, giấy kh&aacute;m sức khỏe, hướng dẫn nh&acirc;n vi&ecirc;n hoặc giấy chứng nhận kết h&ocirc;n hoặc bất kỳ loại t&agrave;i liệu c&aacute; nh&acirc;n n&agrave;o - h&atilde;y đặt h&agrave;ng từ dịch vụ của ch&uacute;ng t&ocirc;i.\r\nSeek for a certified translation of diploma, high school certificate? Medical reports, employee manuals or marriage certificate, or any kind of personal documents - order it from our service.', '', 'http://letotrans.vn/images/certifiedtranslation.jpg', 1, 'admin', 1569774861, 1571940556, NULL, 1, 1),
(4, '[\"1\",\"2\",\"3\",\"4\"]', 0, 'Biên dịch (Translation Services)', 'bien-dich-translation-services', 'Sớm hay muộn, ai trong ch&uacute;ng ta cũng đến l&uacute;c cần c&oacute; t&agrave;i liệu/dữ liệu/th&ocirc;ng tin cần phải dịch thuật. Ch&uacute;ng ta sẽ kh&oacute; để c&oacute; thể tự tiến h&agrave;nh dịch được chuẩn, nhất l&agrave; trong trường hợp đ&ograve;i hỏi phải c&oacute; một bản dịch chuy&ecirc;n nghiệp. LETOtrans hiện diện để gi&uacute;p bạn l&agrave;m được việc n&agrave;y! Ch&uacute;ng t&ocirc;i thực hiện cho bạn một bản dịch nhanh ch&oacute;ng v&agrave; chất lượng của bất kỳ loại t&agrave;i liệu n&agrave;o, ở lĩnh vực n&agrave;o, v&agrave; sang ng&ocirc;n ngữ n&agrave;o!                                  \r\n', 'Sooner or later, anyone seeks to get something translated. Rarely we can do it, especially if the translation has to look professional. That&rsquo;s when we seek for the help of experts. Here we offer you a fast and quality translation of any kind of documents. We hire experts to provide the best online translation services to our customers.', 'Ch&uacute;ng t&ocirc;i cung cấp một loạt c&aacute;c dịch vụ dịch cho tất cả c&aacute;c nhu cầu của bạn. Cho d&ugrave; đ&oacute; l&agrave; nội dung c&aacute; nh&acirc;n, t&agrave;i liệu học thuật hay kinh doanh,... - bạn sẽ nhận được trợ gi&uacute;p từ chuy&ecirc;n gia dịch cho bất kỳ loại dịch thuật n&agrave;o! Chỉ cần chọn dịch vụ!\r\nWe offer a wide range of services for all your needs. Whether it\'s a personal content, academic or business papers &ndash; you will get an expert help for any kind of translation! Just pick the service!', '<h2 style=\"text-align: justify;\"><b>DỊCH VỤ DỊCH THUẬT - CHO NHỮNG AI CẦN NHANH CHÓNG!  </b></h2><h2 style=\"text-align: justify;\"><b><i>TRANSLATION SERVICES – FOR THOSE WHO NEED IT FAST!</i></b></h2><p style=\"text-align: justify; \">Toàn cầu hóa. Từ thương mại điện tử quốc tế, hiện chiếm 30% tổng doanh số bán hàng trực tuyến, đến các ấn phẩm y tế trực tuyến, kỹ thuật, công nghệ cao và các tạp chí đòi hỏi dịch sang nhiều ngôn ngữ. Đó là lý do tại sao các dịch vụ dịch ngôn ngữ chuyên nghiệp đang có được nhu cầu cao và thiết yếu.</p><p style=\"text-align: justify; \"><i>Globalization. It’s upon us. From international e-commerce, which now accounts for 30% of all online sales, to highly technical and medical online publications and journals translations into several languages. That`s why the services allowing professional language translation are in high demand and a critical necessity.</i></p><p style=\"text-align: justify; \">Các doanh nghiệp, tổ chức phi lợi nhuận, cộng đồng khoa học đều nỗ lực tìm kiếm các dịch vụ dịch thuật chuyên nghiệp. Các lựa chọn của họ là người phiên dịch riêng cho mỗi ngôn ngữ, xác định thời gian bỏ ra, phỏng vấn và kiểm tra thông tin và kinh nghiệm, hoặc sắp xếp quá trình bằng cách ký hợp đồng các dịch vụ dịch thuật cho các chuyên gia. Khi tìm ra một dịch vụ dịch thuật đáng tin cậy, họ có thể chuyển giao tất cả các dự án của họ với niềm tin rằng họ sẽ được hoàn thành bản dịch trong khoảng thời gian cần thiết.</p><p style=\"text-align: justify; \"><i>Businesses, non-profit organizations, scientific communities all strive to find professional translation services. Their options are to locate individual translators for each language, spend time screening, interviewing and checking backgrounds and experience, or to streamline the process by contracting these services out to professionals. What the vast majority of companies and organizations have discovered is that once a trustworthy translation service is found, they can turn over all their projects in confidence that they will be expertly completed within the time frame.</i><br></p><h3 style=\"text-align: justify; \"><b>LETOtrans - Xuất sắc trong từng từ - <i>Excellence in Every Word</i></b></h3><p style=\"text-align: justify; \">Chúng tôi chỉ là một công ty dịch thuật. Chúng tôi đã xây dựng danh tiếng của mình theo thời gian, dần dần, chúng tôi tích lũy được đội ngũ nhân viên và biên dịch viên hàng đầu. Bây giờ chúng tôi có thể dịch và bản địa hóa bất cứ yêu cầu nào từ khách hàng. Biên dịch viên và người kiểm tra chất lượng của chúng tôi là các nhà ngôn ngữ học, dịch giả, chuyên gia có chuyên môn cụ thể trong lĩnh vực của dự án. Nếu bạn tìm kiếm một bản dịch chất lượng cao - hãy tiếp tục đọc.</p><p style=\"text-align: justify; \"><i>We are just such a translation company. We have built our reputation over time, gradually, as we accumulated staff that is second-to-none. We are now able to guess any localization requests a client has. Our translators and proofreaders are expert linguists in possession of specific expertise in the topic area or industry niche of the project. If you look for a high-quality translation - go on reading.</i></p><h4 style=\"text-align: justify; \">Cá nhân hóa (<i>Personalization</i>)</h4><p style=\"text-align: justify; \">Tất cả các dịch vụ dịch thuật đều có khách hàng có nhu cầu đa dạng và mô hình kinh doanh của chúng tôi đáp ứng mọi nhu cầu. Khi một khách hàng đến với một dự án dịch, chúng tôi thảo luận về nó và sau đó chỉ định người dịch thích hợp nhất với chuyên môn được yêu cầu. Ngay cả những lỗi nhỏ cũng có thể bị bắt và sửa. Chúng tôi tạo ra một sản phẩm dịch hoàn hảo và ngay lần bàn giao đầu tiên.</p><p style=\"text-align: justify; \"><i>All translation services have clients with unique needs, and our business model is suitable for all needs. When a client arrives with a project, we discuss it and then assign the most appropriate translator for the requested expertise. So that even small errors can be caught and corrected. We deliver an impeccable text and it is right the first time.</i></p><h4 style=\"text-align: justify;\"><b>Biên dịch viên của chúng tôi (<i>Our Translators</i>)</b></h4><p style=\"text-align: justify; \">Công việc chúng tôi làm hoàn toàn phụ thuộc vào các biên dịch viên chúng tôi sử dụng cho nhiệm vụ dịch. Chúng tôi có một quy trình sàng lọc và tuyển dụng nghiêm ngặt bao gồm:</p><p style=\"text-align: justify; \"><i>The work we do depends entirely on the translators we employ for the task. We have a rigorous screening and employment process that includes the following:</i><br></p><ul><li style=\"text-align: justify;\">Kiểm chứng các dự án từng làm trước đó - <i>Verifiable previous projects that are first-rate</i><br></li><li style=\"text-align: justify;\">Đào tạo chính quy trong nghề - <i>Formal training in the profession</i></li><li style=\"text-align: justify;\">Bằng cấp trong các lĩnh vực: y học, luật pháp, thương mại điện tử, nghệ thuật, kinh doanh/tài chính, học thuật, vv - <i>Qualifications in their niches: medicine, law, e-commerce, arts, business/finance, academic, etc.</i></li><li style=\"text-align: justify;\">Kết quả hoàn thành một dự án dịch thử nghiệm của chúng tôi - <i>Completion of a project of our choosing</i></li><li style=\"text-align: justify;\">Chứng nhận/Chứng chỉ với những ngành đòi hỏi trình độ cao, chẳng hạn như y học và pháp luật - <i>Certifications as required for highly specified niches, such as medicine and law</i></li></ul><h4 style=\"text-align: justify; \"><b>Nhiều tùy chọn dịch vụ (Layers and Options)</b></h4><p style=\"text-align: justify; \"><span style=\"font-weight: normal;\">Chúng tôi phân loại chi tiết các yếu tố cấu thành dịch vụ dịch để khách hàng dễ dàng lựa chọn dịch vụ phù hợp với nhu cầu của mình. Đồng thời, chúng tôi cũng có khung thời gian thường và gấp để khách hàng lựa chọn tùy theo sự cần thiết.</span></p><p style=\"text-align: justify; \"><i>We categorize the components of the translation service in detail so that clients can easily choose the service that suits their needs. At the same time, we also have regular and urgent time frames for clients to choose based on their needs.</i></p><h4 style=\"text-align: justify; \">Lĩnh vực dịch (Sectors)</h4><p style=\"text-align: justify; \">Nhờ số lượng và sự đa dạng chuyên môn của các biên dịch viên chuyên nghiệp, chúng tôi có thể dịch ở bất kỳ lĩnh vực nào.</p><p style=\"text-align: justify; \"><i>Thanks to the numbers and diversity of professional translators, we are able to cover any industry sector.</i><br></p><p style=\"text-align: justify; \"><b>Du lịch:</b> Khách hàng tìm kiếm nhiều trang web (có thể là bằng nhiều ngôn ngữ) để lên kế hoạch thời gian du lịch giải trí và kinh doanh.</p><p style=\"text-align: justify; \"><i>Tourism: Clients look for multilingual websites in order for their customers to plan their business and leisure time</i></p><p style=\"text-align: justify; \"><b>Phần mềm/Sản phẩm công nghệ: </b>Thích ứng để bản địa hóa</p><p style=\"text-align: justify; \"><i>Software/Tech Products: Adaptation for localization</i><br></p><p style=\"text-align: justify; \"><b>Y khoa:</b> Dịch thuật thành thạo và chuyển đổi ngôn ngữ bởi các chuyên gia</p><p style=\"text-align: justify; \"><i>Medical: Masterful translation and transcriptions by professionals</i></p><p style=\"text-align: justify; \"><b>Ngân hàng/Tài chính: </b>Dịch chính xác để tránh mọi hiểu lầm về thông tin quá nhạy cảm và phức tạp về tài chính</p><p style=\"text-align: justify; \"><i>Banking/Financial Industries: Accurate translation to avoid any misunderstandings of overly-sensitive and complex information</i></p><p style=\"text-align: justify; \"><b>Dịch thuật kinh doanh và </b><b>Thị trường bán lẻ: </b>Bản địa hóa, dịch vụ dịch tài liệu, v.v.</p><p style=\"text-align: justify; \"><i>Retail Markets and Business Translation: Localization, document translation services, and more</i></p><p style=\"text-align: justify; \"><b>Kỹ thuật và công nghệ sản xuất: </b>Dịch thuật được thực hiện bởi các chuyên gia có nền tảng trong các ngành cụ thể</p><p style=\"text-align: justify; \"><i>Technical Manufacturing and Engineering: Translation is made by professionals with a background in specific industries</i></p><p style=\"text-align: justify; \"><b>Giáo dục:</b> Chúng tôi cung cấp bản dịch chính xác các tài liệu và văn bản giáo dục, cũng như nội dung cho các tổ chức kinh doanh đào tạo trực tuyến</p><p style=\"text-align: justify; \"><i>Education: Accurate translation of educational materials and texts, as well as content for online educational institutions</i></p><p style=\"text-align: justify; \"><b>Luật:</b> Biên dịch viên có kiến thức về luật pháp ở nước nơi ban hành văn bản. Bản dịch pháp lý không thể để nghiệp dư và thiếu chính xác</p><p style=\"text-align: justify; \"><i>Law: Translators with backgrounds in the law in their home countries. Legal translations cannot be left to amateurs</i><br><br>Nếu bạn đang tìm kiếm dịch vụ dịch thuật có chuyên môn, cá nhân hóa, đáng tin cậy và cam kết với sự hài lòng của khách hàng, LETOtrans sẽ là lựa chọn hàng đầu của bạn. Chúng tôi là dịch vụ dịch thuật tốt nhất và chúng tôi có thể chứng minh điều đó!</p><p style=\"text-align: justify; \">If you are looking for online translation services that have expertise, personalization, trustworthiness and commitment to client satisfaction, Our team will be your top choice. We are the best online translation service and we can prove it!<br><br></p><p style=\"text-align: justify; \"><span style=\"font-weight: normal;\"><br></span></p>', 'http://letotrans.vn/images/translationservices.jpg', 0.5, 'admin', 1569774901, 1571940628, NULL, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_service_doc`
--

CREATE TABLE `tbl_service_doc` (
  `id` int(11) NOT NULL,
  `service_id` int(11) DEFAULT NULL,
  `service_type_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `intro` text COLLATE utf8_unicode_ci,
  `sapo` text COLLATE utf8_unicode_ci,
  `fulltext` text COLLATE utf8_unicode_ci,
  `order` int(11) DEFAULT '0',
  `isactive` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_service_doc`
--

INSERT INTO `tbl_service_doc` (`id`, `service_id`, `service_type_id`, `name`, `code`, `intro`, `sapo`, `fulltext`, `order`, `isactive`) VALUES
(38, 4, 1, 'Tổng hợp (Genaral)', 'tong-hop-genaral', 'Tài liệu tổng hợp không hẳn là tài liệu chuyên ngành cụ thể. Nó có thể là một email gửi cho đối tác/ một tờ báo cáo công việc/ một thư ngỏ giới thiệu dịch vụ/ một profile hoặc ấn phẩm truyền thông, hoặc cũng có thể là nội dung của một website quảng bá của Doanh nghiệp,...', NULL, '<p style=\"text-align: justify; \">Các chính sách thực tiễn và&nbsp;quan trọng của chúng tôi đảm bảo rằng mọi khách hàng đều nhận được điều tốt nhất. Trong nhiều năm hoạt động trong lĩnh vực dịch thuật, chúng tôi đã biết cách cung cấp điều này cho mọi khách hàng và đây là những thực tiễn thực hiện nó.</p><p style=\"text-align: justify;\"><i>Our important policies and practices ensure that every client receives the best. Over our many years in the translation business, we have come to know how to give this to every client, and these are the practices which accomplish it.</i></p><ul><li style=\"text-align: justify;\"><b>Chúng tôi là toàn cầu (We are Global)</b></li></ul><p style=\"text-align: justify;\">Với các dịch giả chuyên nghiệp ở hơn 100 quốc gia, phạm vi tiếp cận của chúng tôi rất rộng và khách hàng của chúng tôi trải rộng trên toàn cầu. Chúng tôi liên tục bổ sung vào danh mục chuyên môn của mình, để đáp ứng bất kỳ nhu cầu nào của khách hàng.</p><p style=\"text-align: justify;\"><i>With professional translators in over 100 countries, our reach is wide, and our clients span the globe. We are continually adding to our repertoire of expertise, in order to meet any client need.</i></p><ul><li style=\"text-align: justify; \"><b>Chúng tôi là người, không phải máy hay phần mềm (We are Hu​man)</b></li></ul><p style=\"text-align: justify; \">Mặc dù nhiều dịch vụ dịch thuật chỉ dựa vào công nghệ phần mềm, chúng tôi chỉ định một/một số con người cho mọi dự án/ nhiệm vụ dịch. Điều này có nghĩa là, ngay cả khi một số công nghệ được sử dụng, một dịch giả cụ thể sẽ kiểm tra và đọc lại nó. Chỉ riêng phần mềm không thể thêm các sắc thái văn hóa và thành ngữ làm cho bản dịch trở nên hoàn hảo và có chất lượng hàng đầu. Bởi thế, mà với chúng tôi, dịch thuật không chỉ là dịch tiếng sang tiếng, mà còn là nghệ thuật về chuyển đổi ngôn ngữ.<br></p><p style=\"text-align: justify; \"><i>While many translation services rely solely on software technology, we assign a human to every project/task. This means that, even when some technology is used, a human is checking and proofreading it. Software alone cannot add the cultural nuances and idiomatic expressions that make a translation perfect and of top quality.&nbsp;Therefore, for us, translation is not only a translation into languages, but also an art of language conversion.</i></p><p style=\"text-align: justify; \">Biên dịch viên cũng phải có kinh nghiệm và nền tảng của ngành để họ đáp ứng nhu cầu của khách hàng. Do đó, một dịch giả một nền tảng kinh nghiệm và hiểu biết trong lĩnh vực đó. Chúng tôi đảm bảo rằng một dịch giả được chỉ định có nền tảng như vậy.</p><p style=\"text-align: justify; \"><i>Translators must also possess sector experience and background if they are to meet client needs. Thus, a translator for medical device protocols and instructions must have a background in that niche. We ensure that an assigned translator has such background.</i></p><ul><li style=\"text-align: justify;\"><b>Chất lượng và chất lượng (Quality and Quality)</b></li></ul><p style=\"text-align: justify; \">Kiểm soát một dịch vụ dịch thuật cũng như kiểm soát hoạt động các thành viên trong nhóm dich: dịch giả và quản trị viên. Là một công ty, chúng tôi tuân thủ tất cả các tiêu chuẩn chất lượng BS EN 15038 và ISO 9001-2015. BS EN 15038 là một tiêu chuẩn châu Âu về quy trình vận hành cho các công ty trong ngành cung cấp dịch vụ dịch tài liệu; ISO 9001 - 2015 đặt ra các tiêu chuẩn cho hệ thống quản lý đạt chất lượng. Đồng thời, các dịch giả của chúng tôi có bằng cấp và/hoặc các chứng chỉ/chứng nhận tại quốc gia bản địa của họ. Để đảm bảo hơn nữa rằng mọi phần dịch thuật hoặc bản địa hóa đều hoàn hảo, một người quản lý chất lượng sẽ xem xét lại bản dịch trước khi nó được gửi cho khách hàng.</p><p style=\"text-align: justify; \"><i>Control a translation service is only as good as team members – translators and administrators. As a company, we comply with all BS EN 15038 and ISO 9001 - 2015 quality standards. BS EN 15038 is the European standardizing body for translation services; ISO 9001 - 2015 sets the standards for business management practices. As well, our translators hold degrees and/or local, state, regional and/or national certifications in their native countries. In order to further ensure that every piece of translation or localization is impeccable, a separate proofreader reviews it before it is delivered to a client.</i></p><ul><li style=\"text-align: justify;\"><b>Cá nhân hóa và tùy chỉnh (Personalized and Customized)</b></li></ul><p style=\"text-align: justify; \">LETOtrans tin rằng sự hài lòng của khách hàng đạt được thông qua giao tiếp cá nhân - giữa khách hàng và người quản lý, khách hàng và dịch giả. Chúng tôi luôn coi khách hàng là khách hàng đầu tiên, để giao tiếp và phục vụ tốt nhất!</p><p style=\"text-align: justify; \"><i>LETOtrans believes that customer satisfaction is achieved through personal communication - between customers and managers, customers and translators. We always consider customers as the&nbsp;&nbsp;first&nbsp;customers, to give the best communication and serve!</i></p><ul><li style=\"text-align: justify;\"><b>Tốc độ xử lý nhanh (Fast Turnaround)</b></li></ul><p style=\"text-align: justify; \">Khách hàng có thể đặt thời hạn hoàn thành một bản dịch. Khi cần thời hạn khẩn cấp, chúng tôi thiết lập nhiều dịch giả vào nhiệm vụ, sau đó họ làm việc song song để đáp ứng mọi yêu cầu về thời hạn.</p><p style=\"text-align: justify; \"><i>Our clients set their deadlines and we meet them. When urgent deadlines are needed, we often put multiple translators on the task, who then work in tandem.</i></p><ul><li style=\"text-align: justify;\"><b>Quy trình của chúng tôi - Đơn giản và trực tiếp (Our Process – Simple and direct)</b></li></ul><p style=\"text-align: justify; \">Khách hàng đặt hàng trên trang web của chúng tôi, bằng cách chọn (các) ngôn ngữ mong muốn và tải lên các tệp của họ để được dịch. Tại thời điểm đó, chúng tôi cung cấp báo giá - giá này không thay đổi sau khi thanh toán đã được gửi, trừ khi khách hàng thêm vào đơn đặt hàng ban đầu của mình hoặc có nhầm lẫn trong đặt đơn hàng. Đối với các đơn đặt hàng phức tạp và dài, chúng tôi thiết lập một cuộc thảo luận giữa hai bên thông qua việc gọi điện thoại hoặc trò chuyện trực tiếp. Khách hàng nhận được xác minh đơn hàng qua email và sau đó chúng tôi chỉ định người dịch phù hợp nhất. Bản dịch hoàn thành được cung cấp cho khách hàng phê duyệt hoặc yêu cầu sửa đổi trước khi bàn giao.</p><p style=\"text-align: justify; \"><i>Clients place their orders on our website, by selecting the desired language(s) and uploading their files to be translated. At that point, we provide a pricing quote – this pricing does not change once payment has been submitted, unless the client adds to his/her initial order. For complex and lengthy orders, we prefer a person-to-person discussion, and ask that clients telephone or live chat with us. Clients receive an order verification via email, and we then assign the most suitable translators. Completed translations are delivered for client approval or revisions requests.</i><br></p><ul><li style=\"text-align: justify;\"><b>Tiêu chuẩn cao (High Standards)</b></li></ul><p style=\"text-align: justify; \">Sự tiếp tục toàn cầu hóa diễn ra trong hầu hết mọi lĩnh vực - kinh doanh, thương mại điện tử, giáo dục, luật, y học, nghệ thuật, khoa học, v.v nhiều năm gần đây. Chỉ bằng cách duy trì các tiêu chuẩn cao nhất, dịch vụ dịch thuật cuối cùng sẽ tồn tại. LETOtrans duy trì những tiêu chuẩn cao về chất lượng, đồng thời cung cấp giá cả hợp lý và dịch vụ khách hàng tốt nhất trong ngành.</p><p style=\"text-align: justify; \"><i>The continuing globalization march in virtually every sector – business, e-commerce, education, law, medicine, the arts, science, and more over recent years. Only by maintaining the highest of standards will translation services ultimately survive. LETOtrans maintains those high standards of quality, while providing reasonable pricing and the best customer service in the industry.</i><br></p><p style=\"text-align: justify; \"><br></p>\r\n\r\n', 0, 1),
(39, 4, 2, 'Pháp lý (Legal)', 'phap-ly-legal', 'Tài liệu pháp lý là tài liệu chuyên ngành thuộc lĩnh vực pháp lý như Văn bản luật, Hợp đồng, Tài liệu phân tích chuyên khảo, Sách luật, Luận án chuyên ngành luật,...\r\nLegal documents are specialized documents in the legal field such as legal documents, contracts, monographs, law books, law theses, ...', NULL, '<h3 style=\"text-align: justify; \">KHÔNG CÓ CHỖ CHO SAI LẦM TRONG DỊCH VỤ DỊCH THUẬT CHUYÊN NGÀNH PHÁP LÝ - <i>THERE\'S NO ROOM FOR MISTAKE WITH LEGAL TRANSLATIONS SERVICES</i></h3><p style=\"text-align: justify; \">Bất cứ ai nghiên cứu các tài liệu pháp lý bằng ngôn ngữ của họ đều biết rằng chúng phức tạp và có từ vựng riêng mà chỉ những người được đào tạo trong nghề mới có thể hiểu được.<br></p><p style=\"text-align: justify; \"><i>Anyone who dealt with legal documents in their own languages knows that they are complex and have a vocabulary all of their own that only those trained in the profession can comprehend.</i></p><p style=\"text-align: justify; \">Đối với dịch vụ dịch thuật, các tài liệu pháp lý đưa ra những thách thức lớn. Biên dịch viên không chỉ phải có chuyên môn đầy đủ về ngôn ngữ mẹ đẻ của họ, họ còn phải có nền tảng nghề nghiệp về luật, trong lĩnh vực nghề nghiệp hoặc trong nghiên cứu học thuật. Tìm kiếm các dịch giả này là khó khăn, mất thời gian và nghiên cứu, chưa kể các thủ tục sàng lọc và phỏng vấn.</p><p style=\"text-align: justify; \"><i>For translations services, then, legal documents present big challenges. Translators must not only have full expertise in their native languages, they must also have a career background in law, either in the career field itself or in the academic study. Finding these translators is difficult, takes time and research, not to mention screening and interview procedures.</i></p><p style=\"text-align: justify; \">Chúng tôi, với tư cách là nhà cung cấp dịch vụ, đã dành thời gian để thực hiện nghiên cứu, sàng lọc và thực hiện quy trình phỏng vấn nghiêm ngặt. Một phần của quy trình nộp đơn là nơi các ứng viên phải thể hiện kỹ năng của mình trong các bản dịch pháp lý. Khi chúng tôi thuê một biên dịch viên pháp lý, chúng tôi biết người đó có những kỹ năng đáp ứng các tiêu chuẩn cao về nghề luật và các cơ quan pháp lý tại địa phương của họ và ở nước xuất xứ tài liệu.<br></p><p style=\"text-align: justify; \"><i>We, as service providers, have taken the time to do the research, screening and to perform the rigorous process of interviewing. A part of the application process is where candidates have to demonstrate their skills in legal translations. When we hire a legal translator, we know he/she has those skills that meet the high standards of the legal profession and legal authorities in his/her native country and in the document originating country.</i></p><p style=\"text-align: justify; \">Khách hàng của chúng tôi là luật sư, doanh nghiệp, nhà sản xuất và các tổ chức cộng đồng khác cần tiếp cận toàn cầu. Biên dịch viên pháp lý của chúng tôi được phân công dựa trên các kỹ năng ngôn ngữ và pháp lý cụ thể của họ, cũng như nền tảng của họ trong các lĩnh vực cụ thể.<br></p><p style=\"text-align: justify; \"><i>Our clients are lawyers, businesses, e-commerce entrepreneurs, manufacturers, and other public/professional organizations that need to reach out globally. Our legal translators are assigned based upon their specific legal and linguistic skills, as well as their backgrounds in specific sectors.</i></p><h3 style=\"text-align: justify; \">Các loại dịch vụ dịch thuật pháp lý (Types of Legal Translation Services Delivered)</h3><p style=\"text-align: justify; \">Dưới đây là các lĩnh vực chính của ngành pháp lý nơi dịch vụ dịch thuật được cung cấp cho khách hàng của chúng tôi:</p><p style=\"text-align: justify; \"><i>Here are the main sectors of legal industry where translation services are offered to our clients:</i></p><ul><li style=\"text-align: justify;\"><b>Xuất nhập cảnh (Immigration)</b></li></ul><p style=\"text-align: justify; \">Những người nhập cư cần xin giấy phép làm việc, xác nhận tình trạng cư trú nước ngoài và cuối cùng là nhập quốc tịch ở một quốc gia sẽ phải chuẩn bị một số lượng lớn các tài liệu pháp lý bằng ngôn ngữ của quốc gia đó mà họ phải hiểu. Điều này thường khá khó khăn cho người nộp đơn. Có các chuyên gia có thể dịch các tài liệu này để hiểu đầy đủ về người nhập cư là rất có lợi. Trên thực tế, bất kỳ cơ quan xét duyệt nhập cảnh nào đều đang đòi hỏi người xuất nhập cảnh cung cấp các tài liệu pháp lý được dịch thuật và chứng thực</p><p style=\"text-align: justify; \"><i>Immigrants who seek work permits, foreign residency status and, ultimately citizenship in a country will be subject to a large number of legal documents in that country’s language that they must comprehend. This is often quite difficult for an applicant to present proof. Having experts who can translate these documents for full understanding on the part of immigrants is of great benefit. In fact, any public immigration agencies are now involved in providing certified translation services of legal documents.</i></p><ul><li style=\"text-align: justify;\"><b>Văn bản luật (Laws)</b></li></ul><p style=\"text-align: justify; \">Luật pháp ở bất kỳ quốc gia nào được viết và xuất bản bằng ngôn ngữ pháp lý. Do đó, không phải ai cũng có thể hiểu luật cho đến khi chúng được giải thích bằng ngôn ngữ đơn giản. Các doanh nghiệp và tổ chức yêu cầu dịch chính xác các luật ở nước ngoài mà họ dự định hiện diện để kinh doanh, cả trực tuyến hay offline.</p><p style=\"text-align: justify; \"><i>Laws in any country are written and published in legal language. Thus, not everybody can understand laws until they are explained in simple language. Businesses and organizations require accurate translations of laws in foreign countries in which they intend to establish a presence, both on- and offline.</i></p><ul><li style=\"text-align: justify;\"><b>Kiện tụng (Lawsuits)</b></li></ul><p style=\"text-align: justify; \">Có thể các cá nhân và công ty rơi vào tình huống liên quan đến một vụ kiện pháp lý ở một quốc gia khác hoặc có nhu cầu hiểu quyết định của tòa án về một vụ án. Trong những trường hợp này, các dịch giả pháp lý của chúng tôi sẽ có thể cung cấp các bản dịch chính xác và tóm tắt các quyết định của tòa án.</p><p style=\"text-align: justify; \"><i>It is possible that individuals and companies may find themselves involved in a legal proceeding in another country or have a need to understand a court decision on a case. In these instances, legal translators will be able to provide accurate translations and summaries of court decisions.</i></p><ul><li style=\"text-align: justify;\"><b>Quy định (Regulations)</b></li></ul><p style=\"text-align: justify; \">Các quy định rất giống như các văn bản luật, chúng thường được đưa ra như là kết quả của việc hành pháp hoặc lệnh điều hành được ban hành bởi các cơ quan thuộc chính phủ. Chúng cũng sẽ được dùng ngôn ngữ pháp lý và phải được dịch chính xác để tránh mọi hiểu lầm. Tổ chức thiết lập sự hiện diện ở cấp địa phương, khu vực hoặc quốc gia phải tuân theo mọi quy tắc, vì sự thiếu hiểu biết không được chấp nhận như một lý do cho sai phạm.</p><p style=\"text-align: justify; \"><i>Regulations are much like lawsuits, they usually come as a result of legislation or executive orders that are issued by government. They, too, will reflect legal language which must be accurately translated in order to avoid any misunderstandings. Organization establishing a presence on a local, regional or national level must follow every rule, as ignorance is not accepted as an excuse.</i></p><ul><li style=\"text-align: justify;\"><b>Bằng sáng chế (Patents)</b></li></ul><p style=\"text-align: justify; \">Luật về bản quyền sáng chế ở mỗi quốc gia khác nhau. Nếu một doanh nghiệp hoặc nhà sản xuất đang sử dụng các sản phẩm được cấp bằng sáng chế ở một quốc gia khác, thì điều quan trọng là sáng chế ở nước sở tại phải được hiểu đúng. Nếu không có sự hiểu biết đó, một tổ chức có thể sử dụng sai sản phẩm và vi phạm quyền sáng chế đang được bảo hộ. Bản dịch rõ ràng, dễ hiểu của các bằng sáng chế sẽ ngăn chặn tiền phạt và các vụ kiện.</p><p style=\"text-align: justify; \"><i>Patent laws in every country differ. If a business or a manufacturer is using products that are under patent in another country, it is important that patent law in the home country is understood. Without that understanding, an organization may misuse a product and violate a patent law. Clear, understandable translations of patents will prevent fines and lawsuits.</i></p><ul><li style=\"text-align: justify;\"><b>Luật Kinh doanh (Business Law)</b></li></ul><p style=\"text-align: justify; \">Bất cứ ai trong kinh doanh đều biết rằng các quốc gia đều có một hệ thống văn bản luật khổng lồ điều chỉnh các doanh nghiệp bản địa và các doanh nghiệp nước ngoài đến nước họ. Với các bản dịch chính xác và cẩn thận về luật kinh doanh cho các công ty muốn thâm nhập thị trường nước ngoài sẽ tránh được những cạm bẫy và hậu quả của vi phạm.</p><p style=\"text-align: justify; \"><i>Anyone in business in the U.S. knows that there is a huge body of law regarding business operations. Other countries have them too - laws regulating native businesses and foreign businesses coming into their countries. With accurate and careful translations of business law for companies who want to enter foreign markets will avoid pitfalls and consequences of violation.</i></p><ul><li style=\"text-align: justify;\"><b>Hợp đồng (Contracts)</b></li></ul><p style=\"text-align: justify; \">Hợp đồng là thỏa thuận pháp lý giữa các bên. Trong trường hợp các bên ở các quốc gia khác nhau, Hợp đồng nên được dịch và hiểu rõ trước khi chúng được ký kết.</p><p style=\"text-align: justify; \"><i>Contracts are legal agreements between parties of different countries. Contracts should be translated and well understood before they are signed.</i></p><ul><li style=\"text-align: justify;\"><b>Thỏa thuận tài chính</b></li></ul><p style=\"text-align: justify; \">Điều quan trọng là bất kỳ tài liệu tài chính nào với các ngân hàng, công ty đầu tư hoặc các tổ chức tư nhân khác đều được hai bên hiểu rõ. Sự kiện và số liệu phải được hiểu - một bản dịch chính xác đảm bảo điều này.</p><p style=\"text-align: justify; \"><i>It is critical that any financial documents with banks, investment firms, or other private entities are completely understood by both parties. Facts and figures must be understood - an accurate translation ensures this.</i><br></p><p style=\"text-align: justify; \">Có những cách sử dụng khác cho các dịch vụ dịch thuật pháp lý tùy thuộc vào loại hình tổ chức và doanh nghiệp tham gia vào hoạt động với các cá nhân và tổ chức ở các quốc gia khác.</p><p style=\"text-align: justify; \"><i>There are other uses for legal translation services depending on the types of organizations and businesses involved in operations with individuals and organizations in other countries.</i><br></p><p style=\"text-align: justify; \">Dù thế nào đi nữa, chúng tôi sẽ định vị người dịch pháp lý hoàn hảo cho nhiệm vụ - bạn có thể tin tưởng vào điều đó!</p><p style=\"text-align: justify; \"><i>Whatever the case, we will locate the perfect legal translator for the task – you can count on it.<br></i></p><p style=\"text-align: justify; \"><br></p>\r\n\r\n', 0, 1),
(40, 4, 3, 'Dược phẩm (Medicine)', 'duoc-pham-medicine', 'Vấn đề với các bản dịch y tế là thuật ngữ, từ vựng và các chi tiết ngôn ngữ khác. Thậm chí không một dịch giả với cấp độ trung bình nào có thể hiểu nó. LETOtrans có thể giúp bạn dịch thuật các tài liệu y tế một cách chính xác và phù hợp chuyên môn ngành y tế, thông qua đội ngũ dịch giả là các chuyên gia, giáo sư, bác sĩ hiện tại đang công tác tại các viện nghiên cứu, trường đại học y và các cơ sở khám chữa bệnh.\r\n\r\nThe problem with medical translations is the terminology, vocabulary, and other language specifics. Not even an average translator can understand it. LETOtrans can help you translate medical documents accurately and appropriately to the medical profession, through a team of translators who are experts, professors and doctors currently working in researching institutions, medical universities and medical examination and treatment facilities.', NULL, '<h2 style=\"text-align: center;\">DỊCH VỤ DỊCH THUẬT Y TẾ - CHÍNH XÁC VÀ CHUYÊN MÔN </h2><h2 style=\"text-align: center;\"><i>MEDICAL TRANSLATION SERVICES – ACCURACY AND EXPERTISE</i></h2><p style=\"text-align: justify; \">Tài liệu y tế, phương thức y học, hướng dẫn dược phẩm, nghiên cứu và các tài liệu liên quan khác là một phần khó nhất trong&nbsp;ngành dịch thuật. Sự hợp tác quốc tế giữa các bác sĩ và nhà nghiên cứu y tế là rất rộng. Các kết quả của một nghiên cứu về vỡ tim ở Ấn Độ, ví dụ, có thể có ý nghĩa lớn đối với các học viên ngành y trên toàn thế giới. Một thủ tục phẫu thuật thành công được phát triển bởi một bác sĩ phẫu thuật ở Anh nên được cập nhật cho các bác sĩ phẫu thuật trong chuyên khoa đó trên toàn thế giới. Điều tương tự cũng đúng khi nghiên cứu dược phẩm phát triển một loại thuốc mới - công thức và các thông tin của nó phải được dịch cho người dùng trên toàn cầu.</p><p style=\"text-align: justify; \"><i>Medical documents, protocols, pharmaceutical instructions, research studies, and other related materials are part of the most difficult sector of translation in the industry. International collaboration among medical practitioners and researchers is wide-ranging. The results of a research study on cardiac rupture in India, for example, may have major implications for practitioners all over the world. A successful surgical procedure that is developed by a surgeon in the UK should be reported to surgeons in that specialty all over the world. The same thing is true when pharmaceutical research develops a new drug – its protocol must be translated for users throughout the globe.</i><br></p><p style=\"text-align: justify; \">Vấn đề với các bản dịch y tế là thuật ngữ, từ vựng và các chi tiết ngôn ngữ khác. Thậm chí không một dịch giả với cấp độ trung bình nào có thể hiểu nó.</p><p style=\"text-align: justify; \"><i>The problem with medical translations is the terminology, vocabulary, and other language specifics. Not even an average translator can understand it.</i></p><h4 style=\"text-align: justify; \">Kiểm soát chất lượng và hiệu đính (Quality Control and Proofreading)</h4><p style=\"text-align: justify; \">Bởi vì các bản dịch y tế rất quan trọng, nên chúng tôi không dựa vào một bản dịch. Chúng tôi hỗ trợ từng dự án hoàn thành bằng việc kiểm tra chéo - một người đọc thử từ cùng một nhóm người sẽ xem xét, chỉnh sửa và xác minh tính chính xác. Do chuyên môn giáo dục và nghề nghiệp cần thiết cho các dịch giả chuyên gia và do việc đọc lại bắt buộc bởi một chuyên gia thứ hai, các bản dịch y tế đôi khi có thể tốn kém chi phí hơn so với các ngành khác. Tuy nhiên, độ chính xác là rất quan trọng và chúng tôi nghĩ bạn sẽ đồng ý.</p><p style=\"text-align: justify; \"><i>Because medical translations are so critical, we do not rely on a single translation as the final copy. We back each completed project up with another set of eyes – a proofreader from the same niche who will review, edit, and verify the accuracy. Because of the educational and career expertise required for expert translators, and because of the mandatory proofreading by a second expert, medical translations can sometimes be costlier than they are for other sectors. However, accuracy is critical, and we think you will agree.</i></p><h4 style=\"text-align: justify; \">Các tổ chức mà chúng tôi cung cấp dịch vụ dịch thuật y tế (Organizations for which We Provide Medical Translation)</h4><p style=\"text-align: justify; \">Chúng tôi có một số tổ chức y tế là khách hàng thường xuyên (<i>We have some medical organizations that are regular clients</i>)</p><ul><li style=\"text-align: justify;\">Công ty công nghệ sinh học: Dịch thông tin và hướng dẫn về sản phẩm (<i>Biotech Companies: Translating information and instructions on products</i>)</li><li style=\"text-align: justify;\">Ngành công nghiệp dược phẩm: Dịch các cơ chế tác dụng và tờ hướng dẫn sử dụng (<i>Pharmaceutical Industry: Translating protocols and informational pamphlets</i>)</li><li style=\"text-align: justify;\">Các nhà sản xuất thiết bị y tế: Dịch các cơ chế vận hành và chèn/cấy (<i>Medical Device Manufacturers: Translation of protocols and insertion/implantation</i>)</li><li style=\"text-align: justify;\">Nghiên cứu lâm sàng: Dịch các bài báo nghiên cứu và tạp chí y khoa được công bố (<i>Clinical Research: Translation of published research and medical journal articles</i>)</li><li style=\"text-align: justify;\">Cơ chế tác dụng chung cho các sản phẩm y học (<i>Procedural Protocols</i>)</li></ul><h4 style=\"text-align: justify;\">Ví dụ về các tài liệu y tế được dịch (Examples of Medical Documents Translated)</h4><ul><li style=\"text-align: justify;\">Kết quả được báo cáo của bệnh nhân: Khi bệnh nhân từ khắp nơi trên thế giới tham gia vào nghiên cứu, có những bảng câu hỏi và báo cáo mà họ được yêu cầu hoàn thành. Chúng phải được dịch chính xác để những nghiên cứu khảo sát đó có giá trị. (<i>Patient-reported Outcomes: When patients from around the world participate in research studies, there are questionnaires and reports that they are asked to complete. These must be translated correctly in order for those studies to be valid.</i>)</li><li style=\"text-align: justify;\">Phác đồ lâm sàng: Dành cho cả quy trình nghiên cứu và không nghiên cứu (<i>Clinical protocols: For both research and non-research medical procedures</i>)</li><li style=\"text-align: justify;\">Đóng gói và dán nhãn (<i>Packaging and labeling</i>)</li><li style=\"text-align: justify;\">Tài liệu đào tạo (Training materials)</li><li style=\"text-align: justify;\">Tạp chí y khoa/nghiên cứu (<i>Medical Journals/Research Studies</i>)</li><li style=\"text-align: justify;\">Quy định (<i>Regulations</i>)</li><li style=\"text-align: justify;\">Thủ tục SOP (<i>SOP Procedures</i>)</li><li style=\"text-align: justify;\">Bản ghi âm của chuyên gia (<i>Transcriptions</i>)</li><li style=\"text-align: justify;\">Trang web công ty (<i>Website</i>)</li></ul><h4 style=\"text-align: justify;\">Hiệu đính (Proofreading)</h4><p style=\"text-align: justify;\">Khi các tài liệu y tế và văn bản, phần mềm và trang web được dịch, sẽ có một bước hiệu đính khác. Tất cả các tài liệu dịch sau đó được chuyển cho những chuyên gia có nền tảng học thuật và kinh nghiệm làm việc trong lĩnh vực y tế. Họ xem xét từng từ và câu để đảm bảo rằng bản dịch là chính xác và được viết hoàn hảo.</p><p style=\"text-align: justify;\"><i>Once medical documents and text, software and websites are translated, there is another layer of production. All translated materials are then turned over to native proofreaders, also with medical backgrounds – academic and/or career. They review every word and sentence to ensure that the translation is accurate and perfectly written.<br></i></p><h4 style=\"text-align: justify;\">Hậu dịch vụ (After-Service)</h4><p style=\"text-align: justify;\">Khi chúng tôi cung cấp tài liệu dịch cho khách hàng của chúng tôi, chúng tôi đảm bảo rằng họ hoàn toàn hài lòng.&nbsp;</p><p style=\"text-align: justify;\"><i>Once we deliver translated documents to our clients, we ensure that they are fully satisfied.&nbsp;</i><br></p><p style=\"text-align: justify;\">Liên hệ với chúng tôi hôm nay về bản dịch lĩnh vực y tế của bạn và chúng tôi sẽ đảm bảo rằng bạn có được chính xác những gì bạn cần.</p><p style=\"text-align: justify;\"><i>Contact us today about your medical translation and we will make sure that you get exactly what you need.</i><br></p>\r\n\r\n', 0, 1),
(41, 4, 4, 'Kỹ thuật & Công nghệ (Technical)', 'ky-thuat-cong-nghe-technical', '', NULL, '', 0, 1),
(42, 4, 6, 'Kinh doanh/Tài chính (Business/Finance)', 'kinh-doanhtai-chinh-businessfinance', '', NULL, '', 0, 1),
(43, 4, 7, 'Văn học & Nghệ thuật (Art & Literature)', 'van-hoc-nghe-thuat-art-literature', '', NULL, '', 0, 1),
(44, 4, 9, 'Học thuật (Academic)', 'hoc-thuat-academic', '', NULL, '', 0, 1),
(45, 4, 10, 'Nội dung cá nhân (Personal Content)', 'noi-dung-ca-nhan-personal-content', '', NULL, '', 0, 1),
(46, 3, 11, 'Hướng dẫn kỹ thuật (Technical Manual)', 'huong-dan-ky-thuat-technical-manual', '', NULL, '', 0, 1),
(47, 3, 12, 'Hướng dẫn nhân viên (Employee Manual)', 'huong-dan-nhan-vien-employee-manual', '', NULL, '', 0, 1),
(48, 3, 13, 'Giấy khai sinh (Birth Certificate)', 'giay-khai-sinh-birth-certificate', '', NULL, '', 0, 1),
(49, 3, 14, 'Bằng lái xe (Driver License)', 'bang-lai-xe-driver-license', '', NULL, '', 0, 1),
(50, 3, 15, 'Đăng ký kết hôn (Marriage Certificate)', 'dang-ky-ket-hon-marriage-certificate', '', NULL, '', 0, 1),
(51, 3, 16, 'Xác nhận ly hôn (Marriage License)', 'xac-nhan-ly-hon-marriage-license', '', NULL, '', 0, 1),
(52, 3, 17, 'Chứng nhận tiêm chủng (Immunization Card)', 'chung-nhan-tiem-chung-immunization-card', '', NULL, '', 0, 1),
(53, 3, 18, 'Lý lịch tư pháp (Police Clearance)', 'ly-lich-tu-phap-police-clearance', '', NULL, '', 0, 1),
(54, 2, 1, 'Tổng hợp (Genaral)', 'tong-hop-genaral', '', NULL, '', 0, 1),
(55, 2, 2, 'Pháp lý (Legal)', 'phap-ly-legal', '', NULL, '', 0, 1),
(56, 2, 3, 'Dược phẩm (Medicine)', 'duoc-pham-medicine', '', NULL, '', 0, 1),
(57, 2, 4, 'Kỹ thuật & Công nghệ (Technical)', 'ky-thuat-cong-nghe-technical', '', NULL, '', 0, 1),
(58, 2, 6, 'Kinh doanh/Tài chính (Business/Finance)', 'kinh-doanhtai-chinh-businessfinance', '', NULL, '', 0, 1),
(59, 2, 7, 'Văn học & Nghệ thuật (Art & Literature)', 'van-hoc-nghe-thuat-art-literature', '', NULL, '', 0, 1),
(60, 2, 9, 'Học thuật (Academic)', 'hoc-thuat-academic', '', NULL, '', 0, 1),
(61, 2, 10, 'Nội dung cá nhân (Personal Content)', 'noi-dung-ca-nhan-personal-content', '', NULL, '', 0, 1),
(62, 1, 5, 'Website', 'website', '', NULL, '', 0, 1),
(63, 1, 19, 'Ứng dụng (Application)', 'ung-dung-application', '', NULL, '', 0, 1),
(64, 1, 20, 'Phần mềm (Software)', 'phan-mem-software', '', NULL, '', 0, 1),
(65, 1, 8, 'Gaming', 'gaming', '', NULL, '', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_service_type`
--

CREATE TABLE `tbl_service_type` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sapo` text COLLATE utf8_unicode_ci,
  `intro` text COLLATE utf8_unicode_ci,
  `order` tinyint(4) DEFAULT '0',
  `isactive` tinyint(4) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_service_type`
--

INSERT INTO `tbl_service_type` (`id`, `name`, `code`, `icon`, `sapo`, `intro`, `order`, `isactive`) VALUES
(1, 'Tổng hợp ', 'tong-hop-', 'http://letotrans.vn/images/icons/icon-service-type-01.png', NULL, NULL, 0, 1),
(2, 'Pháp lý', 'phap-ly', 'http://letotrans.vn/images/icons/icon-service-type-02.png', NULL, NULL, 0, 1),
(3, 'Dược phẩm', 'duoc-pham', 'http://letotrans.vn/images/icons/icon-service-type-03.png', NULL, NULL, 0, 1),
(4, 'Kỹ thuật & Công nghệ', 'ky-thuat-cong-nghe', 'http://letotrans.vn/images/icons/icon-service-type-04.png', NULL, NULL, 0, 1),
(5, 'Website', 'website', 'http://letotrans.vn/images/icons/icon-service-type-05.png', NULL, NULL, 0, 1),
(6, 'Kinh doanh/Tài chính', 'kinh-doanhtai-chinh', 'http://letotrans.vn/images/icons/icon-service-type-06.png', NULL, NULL, 0, 1),
(7, 'Văn học & Nghệ thuật', 'van-hoc-nghe-thuat', 'http://letotrans.vn/images/icons/icon-service-type-07.png', NULL, NULL, 0, 1),
(8, 'Game', 'game', 'http://letotrans.vn/images/icons/icon-service-type-08.png', NULL, NULL, 0, 1),
(9, 'Học thuật', 'hoc-thuat', NULL, NULL, NULL, 0, 1),
(10, 'Nội dung cá nhân', 'noi-dung-ca-nhan', NULL, NULL, NULL, 0, 1),
(11, 'Hướng dẫn kỹ thuật (Technical Manual)', 'huong-dan-ky-thuat-technical-manual', NULL, NULL, NULL, 0, 1),
(12, 'Hướng dẫn nhân viên (Employee Manual)', 'huong-dan-nhan-vien-employee-manual', NULL, NULL, NULL, 0, 1),
(13, 'Giấy khai sinh (Birth Certificate)', 'giay-khai-sinh-birth-certificate', NULL, NULL, NULL, 0, 1),
(14, 'Bằng lái xe (Driver License)', 'bang-lai-xe-driver-license', NULL, NULL, NULL, 0, 1),
(15, 'Đăng ký kết hôn (Marriage Certificate)', 'dang-ky-ket-hon-marriage-certificate', NULL, NULL, NULL, 0, 1),
(16, 'Xác nhận ly hôn (Marriage License)', 'xac-nhan-ly-hon-marriage-license', NULL, NULL, NULL, 0, 1),
(17, 'Chứng nhận tiêm chủng (Immunization Card)', 'chung-nhan-tiem-chung-immunization-card', NULL, NULL, NULL, 0, 1),
(18, 'Lý lịch tư pháp (Police Clearance)', 'ly-lich-tu-phap-police-clearance', NULL, NULL, NULL, 0, 1),
(19, 'Ứng dụng (Application)', 'ung-dung-application', NULL, NULL, NULL, 0, 1),
(20, 'Phần mềm (Software)', 'phan-mem-software', NULL, NULL, NULL, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_slider`
--

CREATE TABLE `tbl_slider` (
  `id` int(11) NOT NULL,
  `slogan` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL,
  `intro` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT '0',
  `thumb` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `isactive` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_slider`
--

INSERT INTO `tbl_slider` (`id`, `slogan`, `intro`, `type`, `thumb`, `link`, `order`, `isactive`) VALUES
(18, 'DỊCH THUẬT LETO TRANS <br> PHỤC VỤ 24/24H SUỐT 365 NGÀY KỂ CẢ NGÀY NGHỈ LỄ.', 'Đặt lịch hẹn Hôm nay <span style=\"color: rgb(250, 121, 1); font-weight: bold;\">GIẢM NGAY 15%</span><div><br><div><button class=\"btn btn-view\">ĐẶT LỊCH SỬA CHỮA</button></div></div>', '0', 'http://letotrans.vn/images/banner/banner-01.jpg', '', NULL, 1),
(19, 'DỊCH THUẬT LETO TRANS <br> PHỤC VỤ 24/24H SUỐT 365 NGÀY KỂ CẢ NGÀY NGHỈ LỄ.', 'Đặt lịch hẹn Hôm nay <span style=\"color: rgb(250, 121, 1); font-weight: bold;\">GIẢM NGAY 15%</span><div><br><div><button class=\"btn btn-view\">ĐẶT LỊCH SỬA CHỮA</button></div></div>', '0', 'http://letotrans.vn/images/banner/banner-01.jpg', '', NULL, 1),
(20, 'DỊCH THUẬT LETO TRANS <br> PHỤC VỤ 24/24H SUỐT 365 NGÀY KỂ CẢ NGÀY NGHỈ LỄ.', 'Đặt lịch hẹn Hôm nay <span style=\"color: rgb(250, 121, 1); font-weight: bold;\">GIẢM NGAY 15%</span><div><br><div><button class=\"btn btn-view\">ĐẶT LỊCH SỬA CHỮA</button></div></div>', '0', 'http://letotrans.vn/images/banner/banner-01.jpg', '', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_subscribe`
--

CREATE TABLE `tbl_subscribe` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isactive` tinyint(4) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_subscribe`
--

INSERT INTO `tbl_subscribe` (`id`, `name`, `email`, `isactive`) VALUES
(1, 'Trần Viết Hiệp', 'tranviethiepdz@gmail.com', 1),
(4, 'Trần Viết Hiệp', 'tranviethiepdz@gmail.com', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id` int(11) NOT NULL,
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
  `isactive` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`id`, `username`, `password`, `firstname`, `lastname`, `birthday`, `gender`, `address`, `phone`, `mobile`, `email`, `avatar`, `identify`, `organ`, `joindate`, `lastlogin`, `gid`, `isroot`, `isactive`) VALUES
(1, 'igf', 'd93a5def7511da3d0f2d171d9c344e91', 'IGF', 'JSC', '0000-00-00', '', '', '', '', '', NULL, NULL, NULL, '0000-00-00 00:00:00', '2019-09-03 01:15:04', 1, NULL, 1),
(2, 'admin', 'd93a5def7511da3d0f2d171d9c344e91', 'THC', 'Admin', '0000-00-00', '0', '', '123456789', '', 'a@gmail.com', NULL, '1111111111', '', '2019-07-23 17:13:50', '2019-10-30 11:31:17', 1, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_group`
--

CREATE TABLE `tbl_user_group` (
  `id` int(11) NOT NULL,
  `par_id` int(11) DEFAULT '0',
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `intro` text COLLATE utf8_unicode_ci,
  `permission` int(11) NOT NULL DEFAULT '0',
  `isadmin` int(11) NOT NULL DEFAULT '0',
  `isroot` tinyint(4) DEFAULT NULL,
  `isboss` tinyint(4) DEFAULT '1',
  `isactive` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_user_group`
--

INSERT INTO `tbl_user_group` (`id`, `par_id`, `name`, `intro`, `permission`, `isadmin`, `isroot`, `isboss`, `isactive`) VALUES
(1, 0, 'Super Admin', '', 8388607, 1, NULL, 1, 1),
(2, 1, 'Admin', '', 6291448, 0, NULL, 1, 1),
(3, 2, 'Content', '', 992, 0, NULL, 1, 1),
(4, 2, 'Dangky', '', 49152, 0, NULL, 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_album`
--
ALTER TABLE `tbl_album`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_categories`
--
ALTER TABLE `tbl_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `tbl_configsite`
--
ALTER TABLE `tbl_configsite`
  ADD PRIMARY KEY (`config_id`);

--
-- Indexes for table `tbl_contact`
--
ALTER TABLE `tbl_contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_contents`
--
ALTER TABLE `tbl_contents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_co_operate`
--
ALTER TABLE `tbl_co_operate`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_feedback`
--
ALTER TABLE `tbl_feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_gallery`
--
ALTER TABLE `tbl_gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_languages`
--
ALTER TABLE `tbl_languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_menus`
--
ALTER TABLE `tbl_menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_mnuitems`
--
ALTER TABLE `tbl_mnuitems`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_modtype`
--
ALTER TABLE `tbl_modtype`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_modules`
--
ALTER TABLE `tbl_modules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_package`
--
ALTER TABLE `tbl_package`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_partner`
--
ALTER TABLE `tbl_partner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_position`
--
ALTER TABLE `tbl_position`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_price`
--
ALTER TABLE `tbl_price`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_product_type`
--
ALTER TABLE `tbl_product_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_seo`
--
ALTER TABLE `tbl_seo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_service`
--
ALTER TABLE `tbl_service`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_service_doc`
--
ALTER TABLE `tbl_service_doc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_service_type`
--
ALTER TABLE `tbl_service_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_slider`
--
ALTER TABLE `tbl_slider`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_subscribe`
--
ALTER TABLE `tbl_subscribe`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`) USING BTREE;

--
-- Indexes for table `tbl_user_group`
--
ALTER TABLE `tbl_user_group`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_album`
--
ALTER TABLE `tbl_album`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_categories`
--
ALTER TABLE `tbl_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_configsite`
--
ALTER TABLE `tbl_configsite`
  MODIFY `config_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_contact`
--
ALTER TABLE `tbl_contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_contents`
--
ALTER TABLE `tbl_contents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tbl_co_operate`
--
ALTER TABLE `tbl_co_operate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_feedback`
--
ALTER TABLE `tbl_feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_gallery`
--
ALTER TABLE `tbl_gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tbl_languages`
--
ALTER TABLE `tbl_languages`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;

--
-- AUTO_INCREMENT for table `tbl_menus`
--
ALTER TABLE `tbl_menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_mnuitems`
--
ALTER TABLE `tbl_mnuitems`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `tbl_modtype`
--
ALTER TABLE `tbl_modtype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbl_modules`
--
ALTER TABLE `tbl_modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_package`
--
ALTER TABLE `tbl_package`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tbl_partner`
--
ALTER TABLE `tbl_partner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbl_position`
--
ALTER TABLE `tbl_position`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `tbl_price`
--
ALTER TABLE `tbl_price`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbl_product_type`
--
ALTER TABLE `tbl_product_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_seo`
--
ALTER TABLE `tbl_seo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `tbl_service`
--
ALTER TABLE `tbl_service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_service_doc`
--
ALTER TABLE `tbl_service_doc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `tbl_service_type`
--
ALTER TABLE `tbl_service_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tbl_slider`
--
ALTER TABLE `tbl_slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tbl_subscribe`
--
ALTER TABLE `tbl_subscribe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_user_group`
--
ALTER TABLE `tbl_user_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
