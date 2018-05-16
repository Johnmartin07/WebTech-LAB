CREATE DATABASE  IF NOT EXISTS `musify` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `musify`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: musify
-- ------------------------------------------------------
-- Server version	5.1.53-community-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `custid` int(11) NOT NULL,
  `lastname` varchar(10) NOT NULL,
  `firstname` varchar(10) NOT NULL,
  `middlleinitial` varchar(10) NOT NULL,
  `username` varchar(10) NOT NULL,
  `password` varchar(16) NOT NULL,
  `age` tinyint(100) NOT NULL DEFAULT '18',
  `email` varchar(20) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `cust_status` enum('active','deactivate','pending') NOT NULL,
  PRIMARY KEY (`custid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Dela Druz','Juan','S','ako','ako',19,'ako@mail.com','09187567955','active'),(2,'Cruz','Migs','T','ikaw','ikaw',20,'ikaw@mail.com','09876125621','pending');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package`
--

DROP TABLE IF EXISTS `package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `package` (
  `pack_id` int(11) NOT NULL,
  `pack_name` varchar(45) NOT NULL,
  `pack_desc` varchar(900) NOT NULL,
  `pack_item` text NOT NULL,
  `price` int(11) NOT NULL,
  `pack_status` enum('available','unavailable') NOT NULL,
  `comp_name` varchar(45) NOT NULL,
  PRIMARY KEY (`pack_id`),
  UNIQUE KEY `pack_id_UNIQUE` (`pack_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package`
--

LOCK TABLES `package` WRITE;
/*!40000 ALTER TABLE `package` DISABLE KEYS */;
INSERT INTO `package` VALUES (1,'Multi-participant Meeting Style Sound Package','A package service that has more participants that promote different things to work on.The package gives microphone and soft speakers that will allow the people within the committee to communicate well and do things right.','(10) delegate microphone consoles (additional microphones can be added as needed)\r\n(1) delegate microphone base unit\r\n(1) moderator microphone console\r\n(2) speakers incorporates mixer and graphic EQ accommodates up to 100 people\r\n`\r\nall required cabling and accessories onsite audio technician delivery, set-up & strike.',8000,'available','Songnify'),(2,'Open Event Space Sound Package','An extensive selection of package that has an high-end, custom-installation automobile audio systems that include electronics and loudspeakers.The package offers a choice of a multi-channel amplifier, all designed to provide extraordinary quality sound system.','(2-8) speakers on stands\r\n(2) wired or wireless microphones\r\ninterfaces to multiple audio sources (music, presentations, computer, live video)\r\nall required cabling & accessories\r\ndelivery,\r\nset-up & strike on-site technician support.\r\n',9500,'available','Meister'),(3,'Outdoor Sound Package','Outdoor Package a package that coughs noise every other minute. It leaves the guests wondering if you were forced to hold the event in the first place. One of those things to pay proper attention to in any event or occasion is your this package because it promotes how loud sound is being implied in a event.','(2) speakers on stands\r\n(1) wireless handheld or lapel microphone\r\nall required cabling\r\ndelivery, set-up & strike power source not included',5000,'available','Meister'),(4,'Panel Discussion Sound Package','Panel Discussion Package support produce effectively good sounds in the speakers from the participants, reproducing individual sounds not just around the listener, but inside the room, outside the room and overhead in any direction, placing acoustic objects accurately in three-dimensional space.','(2) speakers on stands\r\n(1) moderator microphone (wired or wireless handheld / lapel)\r\n(1) audience Q&A microphone\r\n(2-5) lapel or tabletop microphones for panel\r\nall required cabling\r\ndelivery, set-up & strike\r\non-site audio technician',6000,'available','Songnify'),(5,'Press Conferences Sound Package','Providing an equipment good for a press conference that gives good quality of sound with in a place or for announcement in a work and support many specifications in terms of its event.','Microphone (wireless lapel, handheld, or podium mounted)\r\nSound system for amplification to group of up to 250\r\nPress box / mult-box (enables direct audio patch by media into sound system)\r\nPodium\r\nAll required cabling\r\nOnsite technician support\r\nDelivery, setup and strike',7500,'unavailable','Songnify'),(6,'Private Dinning','A package with a descriptive special data without defining the balance into specific speakers. Source audio can use normal recording multitrack as well as surround microphones and most any recording equipment.','1 or 2) speakers on stands\r\n(1) wired or wireless microphone\r\nall required cabling\r\ninterface to computer or other outside audio source\r\ndelivery, set-up and meet & greet.\r\n',6500,'unavailable','Meister');
/*!40000 ALTER TABLE `package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment` (
  `pay_id` int(11) NOT NULL,
  `custlast_name` varchar(45) NOT NULL,
  `custfirst_name` varchar(45) NOT NULL,
  `pack_id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `comp_name` varchar(45) NOT NULL,
  `pay_status` enum('paid','unpaid') NOT NULL,
  PRIMARY KEY (`pay_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,'Dela Druz','Juan',1,'2018-03-01','Songnify','paid'),(2,'Dela Druz','Juan',1,'2018-05-01','Songnify','unpaid');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provider`
--

DROP TABLE IF EXISTS `provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provider` (
  `comp_name` varchar(40) NOT NULL,
  `comp_username` varchar(16) NOT NULL,
  `comp_pass` varchar(16) NOT NULL,
  `comp_cn` varchar(15) NOT NULL,
  `comp_ea` varchar(30) NOT NULL,
  `comp_addr` varchar(100) NOT NULL,
  `logo` blob NOT NULL,
  `comp_status` enum('active','deactivate','pending') NOT NULL,
  PRIMARY KEY (`comp_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provider`
--

LOCK TABLES `provider` WRITE;
/*!40000 ALTER TABLE `provider` DISABLE KEYS */;
INSERT INTO `provider` VALUES ('Songnify','songnify','songnify','09197656765','songnify@yahoo.com','Lower Session Road, Baguio City','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0b\0\0\0Ž\0\0\0<sò\0\0PLTEÿÿÿÝÝÝN]dÿ\0\0ëëë=OW;NVïðñIY`æèé@RYÌÏÑßßßãããÏÒÔÛååøøùx‚‡\0\0\0lw}Üââû77øOOSah_lr¥«®•™q|ž¥¨´¹»˜Ÿ£áÈÈƒŒª°³ÞØØî‰‰¿ÃÅöXXòåÚCXn0M`àÐÐè©©ý  ˆ\\ipõ``æ±±ú??ãÁÁì••ü++òrr.DMê  ç°°âÅÅþòvvôhhì™™øPPõ__ùEE4Ktuvc]^mÂÏÜŽ”\0\0%dO;\0&?\06ÝÏÂÿóìŽ€w-\0px„¥–‡Zo€>97teT\rž®½N4¼ÈÐ,BXÐ·5•\0\0\r;IDATxœíy¿›Æ†Ae		Ù’(’CÝºÖí8ÎžºiÓ¤µ»¤û÷ÿ&faV4B ¬{çýÃ?_–/gÎŒ$ÃÐÒÒÒÒÒj©hè¸×Š\"×²,Í¸º•†>•{¨ÈEtÇáXîVI70M3Ô6Ñ8º¦&ÜÛ\r1ÝR&|¹jºcš®&Ü\ZéBÂîÐ\'y³¢è\nàiÂíDÒ…®&|‰D)ƒ&Ü‘„	™&Ü‘ZÐ-¥;uJ’¦»špº€n©PnÒÉtW‰°îrˆÕ]MX*µÎ„&ÜNíR©ta‚TË„LVRt!aÝå ²NéVzð„/Lw5áFu”iÂB]…n©Ùmî0ÝÕ„9©×Î;Òƒ*Lô”iÂ¥úJw•ßû.ÇptáÞÓÝ“ºÏÝæ«%d’ð‡A¾—]÷ZéîiÝSÂFdYƒ†n­ûJØ0>Ä×&<öW…ük4²Æjf@KÙú\0nÐîŽ]=†ÇÎ¨s•£ª†ñÛÇ¥Þ~.a¼ülðòUÆ×/LŒíë!Vãåç¿\0z&F8{\rV2»	ÂmçY–çYþ¤øwZüù¤øCa/Å0ž}¾2œ}ï@Àƒ&Z\"^ü÷Ýâî?6þµø±øó§ÅŸUöRuã\'â§ÆËWpå©W7¾~—£â÷GãéâW†17¾ÿÃâãé¿VÚO1Œ›¬ÙÄ7-lb˜ÂDk/®Æ÷ï?±«†ñì—2«˜}ÝÞ&*ý\\Šø÷Æ_ÑßÞ+\"VN*dVq‰MU˜¸ñßÿøA±j/#¶ŠåóÖ61XéçrÄO¿3”+‡±Ø*M|u~F<\\é§5âw‹?ÿ¾/^vÿùwñ‡RFaœÑÅYÅ%61\\a¢-â0«Rá,Ï\\×°2µ¼¸”j‹¬ÙÄgçÛÄ€¥Ÿköî*E–eA4àæ­Û„,†Ü0ÛòÅµ«#6\\7Ì7É<Žãy²ÉŠó¬Uœ°‰‚®Y4|ÜÆñ¶l9 Z–v›£iq*ÅæÙ˜]3=€Áé+Š&›}Ã¶\'‡yZî½Oóðô¡Ôd&žï!ù£d*ƒÌZÅò+¹M<³dí×\rÇ8æ¨e’ðtµ.´¿·á.¾³žçh%¾V¬rþ\ZÈF¦sÖwFÁ7!í]îžvêã­ãHyö^f´UÌ>“ÛD¦#ZžOª!ª01µËË±ËÿîÈSñœ9Þ&¥ÎÑŽ¹do‚‰æÔ¶¾7a·m@ÆßI/&œ:,ˆââFÉ`iËðW<âÀ|Ã7[Ý¾4dK?S¿º–ÎÚg¶^”üŠËx‚\Zs7ÖÙ)#ÁðWÖ©¶øä«G·›‹“V4Ù„I·[Ÿ¹½™n3F|ç¡ð¾ëŠðŠ_q\'AlÙpÓÒoÐ!EÄ±†g+¸¿\\kØŽoæû$™¯PøIiZÅ£Y“M@ÄÅ…Ú«mÑnr,]^ðÁ¥;uñ¶Ü pÚù~~çÀ‹õ7è$_œk¼‚y~âQµ­=O‡~èmfc	bÃYwén¿Âû_Ç[>›À©Õ$AwÒ3ÆVñJn\0±gÇi^çlz`ì€~ÊâÑÆ/O$ƒÖp€w¤àPž‘?Ê\0(«WðˆG‰Wºzº;Ò™* ŽŒ­°à»Áµ&œ‚ór6eÿ²	\'à±ôæ\'¬v:¾v:Óí¦dþW$Èù´¼§Ï\".Ö‘¯>¥iÑe§.<?Úa\'¸ÿH,GÐc¨…ˆw•‚ŒÁÁ|ÖjT:õ-¶¬ÓžhçÍVq¢Ó±øo¡-3×6EÏC%c`s´Z+¨ŽªìÖ§\Z™ F˜èz_!^B&	žrË<à!ŠP—$@˜Ä\'²\n¹M”í@ÛÝP§1%}—PŠÞ7¬ïnªlêáGˆ¹÷`\0Ñ‘æ$B¼&`Šª†½#»\\I¦CžÆfx\0× yãa«Ú„TaEä	XÈ(ÖÌù¹Ž„\ZXAß„ØáÞþ;ð¨“Ï¿\0ñ”‚A*÷EÆ­¦£G>oD›á\n¸$ŒgŸ ÂÏÏ¬¯YcÁùBÄ6@0‰³¹¾Cõøysròb>Ú\"à+ä} ž{¼eCU0|Õ¢\Zuh&È0®î¼Ô)pŸCnÂVTÑñ)šñŠ;Ãt\nn°jˆØf­7ã51„!êmÕ3MßPE“ªLº1x8|IÞfbŸøò,Äea\"ñ¸\0ˆ=þÍÀ\n®s†ž]þj„ahÚlòˆa‹Âü7°É§ýÁ©I@,6ãÙ7ñëÓˆër¦å×´ñ8œðÈ—`w‚/ú€=¨7ØÖ&WÜ*qÂ?µl9þfU¯PÒ»ˆ0¡ÿˆ×6Qèãæ×]AwšÒ]Rj·KÓ´êìÐ$\00›+^\ZàFÛKnEÀ{©ôv¨ƒE˜1øN~ƒs¯ŠÓ÷–|-»î8\0\n×`¥0ŠÉœ­É*Êræ~å“õLØñ§_J‚˜2eÕšP†XdÅ8§¨ðˆ¡£¼ðî5\n¥DŒÈJ“0¥ l¢²\niæŽ/gÂ†©wŒb)b~…±øiÎØ{È!–Á ªA-R\npš!®+˜\'¬\"Ì=1_	bÁëä|Ä‚ûdàwYíDâà4q¶Ñ(³b“E„Vnp`”ÃX^¿ˆ…—\n×Õ}`1îÃ\0ˆ‘M<šeMál¾ »>îY>©4Ýó½†‹3+èDu¿ïºˆ}‡’m×ç;	‹ÛDºOäV N±Ÿ”åL×Å˜6 VŽb¥7QÓ‚	5“ŠD®Öâ\n’*®U|Äma%É,Û ÇóÓ^7y±ÝàÅ°w\"ÌGÚË]Fæ=IV*x¡âô©UÀ®‹·®n5cb×+bq±ætF´ÈË\Zª#\\·ÕµäŸÂ[~Á¼ád³5ƒÑ;¤ç¤ûâ–y1(Qxç{A³€YÆÌÒÆ0fÍW6±;Ü×e$fN\n¨áõæÅm{w\0ÆV‚ª­öžÐ½äaÌØDµHüTË·%Cäø½!n]£\0µLqÎ×^™ø¾KÃ˜³‰ÒÄVëÍ›û°xóô†XPøT«´e²RÔE‚Å:…<ŒE9šØ*â€û8RÜo×£u½¼ü;w\nrèŽ$Œ6Q-~¿%£Q“1;\r¤õ‡˜Ý.ÅWü£FÇiÛÄæŽ]IÆ\"›¨¬â\\þ-±zñ6b?h\0\'ƒôhW3NÝå Á’TŒ[k-xj\rÆÌÔAYWnù-o!|•2sRÐ¼>sƒ¬¡âô Ìz¹àcë³Œ‹0.z½9hö[iAbö¬z\\¯‚y1{¾ªõˆ˜UÁ¥Ôè”±	aì…¨&ÂSÁ¨òVŒ»ît·òí\Zñ²¡¬†­¢þ:š4H_X5û©ç×Ç@²ÐŒCjÿ¦Ù@ÞçÇîad;ìBUÍ‘ƒÅ9q!æfm{ôè¨¼âCXÅ¼=tŠ‘ãóÍWå±Výv Áœ6<Å;ÚÀ‰‰ç´Á	~#2q9U±}ÊŒ¦{–sÏ÷éf“&Ç•mƒbz¸Á&ÄVç¾zö(9dYºµAÀ<ô\\i33ýý¦8hŒ§q2ƒØ’™™Œ;\0c^Àð/í•ìë!0\'—˜	Œ7Ù„Ä*Ü¼®Èûxª¯“õ^Ì„3áˆƒ\nüU6¿¸Fk£0ÊlE2¾æ½Aˆ\nÃ0Œ?EVùpÎ\r‡yå´ÀÞëÅá%³ä¥0ü7-ÐbE;[ð¡{\"ÂÃp“—`“ïÀ&UaÂQC	ž½.SÖ´\Z¦;å\"A˜˜`…\01X!.É»ôÇ5|AihÌïa8NÜfºÕnV¸Š÷}ÇÛç¦‹òâå‹çJ½n\ZÏöºÚæùK³.ýd+üÉ¡â,Á\'‹KÑó(Öå\"6Ÿ-€<â1X!õ˜Äø¸¶°@iñû7ÂèäzÑ4Û·ñv¾ßeÓ²E¢‹·Tøn¥€ø‚&¢0fåÇù¶ÉfÒ÷Çé%7OË«I­:ÄŒžÔ8üÑ¤a¾c¢iìîCUÓðÇ‡Gø&·ã¡¾\"÷&·\nãÁ¾Åã&·	ãá¾\"÷6ŸÆ~Eîm\">?ŒüŽ‰Eìª~¥Íð„oñ™a<è—ß*â³ÂxØ_–¹UÄç|‡ôÀ¿Ýs³ˆÕÃxè_–¹YÄÊa<4acâT3¢‡=‰VRãáY&Ü\nu=µò*R\nãá	ß²T¾îñ¾þ²Ìµt:Œ5áu2Œïëo÷\\Q§ÂX¾X\'ÂXî@a¬	w¡¦0Ö„»‘<ŒÜ\n÷%ikÂIÆƒ&î‘Äa¬»Í]JÆšp§„±&Ü±¸0Ö…‰®Å†±&Ü½è0Ö¥ŸDlWîCdkÂ½ˆcM¸\'á0ÖÝæ¾„ÂXîO Œua¢GUa¬	÷ª\"Œu·¹_a¬	÷,M¸wqßõ£¥¥¥¥¥¥õ\0õåD„Ü¨€Í\0\0\0\0IEND®B`‚','active'),('Meister','meister','meister','09129878987','mester@yahoo.com','Upper Session Road, Baguio City','ÿØÿà\0JFIF\0,,\0\0ÿá.Exif\0\0MM\0*\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\0b\0\0\0\0\0\0\0j(\0\0\0\0\0\0\01\0\0\0\0\0\0\0r2\0\0\0\0\0\0\0†‡i\0\0\0\0\0\0\0œ\0\0\0È\0\0,\0\0\0\0\0,\0\0\0Adobe Photoshop 7.0\02003:10:30 11:23:15\0\0\0\0 \0\0\0\0ÿÿ\0\0 \0\0\0\0\0\0 \0\0\0\0\0\0˜\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\0\0\0\0\0\0(\0\0\0\0\0\0\0\0\0\0\0\0\0&\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0H\0\0\0\0\0\0H\0\0\0ÿí¶Photoshop 3.0\08BIMí\0\0\0\0\0,\0\0\0\0,\0\0\0\08BIM\r\0\0\0\0\0\0\0\0x8BIM\0\0\0\0\0\0\0\08BIMó\0\0\0\0\0	\0\0\0\0\0\0\0\0\08BIM\n\0\0\0\0\0\0\08BIM\'\0\0\0\0\0\n\0\0\0\0\0\0\0\08BIMõ\0\0\0\0\0H\0/ff\0\0lff\0\0\0\0\0\0\0/ff\0\0¡™š\0\0\0\0\0\0\02\0\0\0\0Z\0\0\0\0\0\0\0\0\05\0\0\0\0-\0\0\0\0\0\0\0\08BIMø\0\0\0\0\0p\0\0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿè\0\0\0\0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿè\0\0\0\0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿè\0\0\0\0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿè\0\08BIM\0\0\0\0\0\0\08BIM\0\0\0\0\0\0\0\0\0\0\0\0\08BIM\0\0\0\0\0\0\0\0\0\0@\0\0@\0\0\0\08BIM\0\0\0\0\0\0\0\0\08BIM\Z\0\0\0\0\0i\0\0\0\0\0\0\0\0\0\0\0\0\0:\0\0,\0\0\0\01\01\02\02\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0,\0\0:\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\08BIM\0\0\0\0\0\08BIM\0\0\0\0\0\0\0\0\n8BIM\0\0\0\0\rÓ\0\0\0\0\0\0k\0\0\0p\0\0D\0\0À\0\0\r·\0\0ÿØÿà\0JFIF\0\0H\0H\0\0ÿî\0Adobe\0d€\0\0\0ÿÛ\0„\0			\n\r\r\rÿÀ\0\0p\0k\"\0ÿÝ\0\0ÿÄ?\0\0\0\0\0\0\0\0\0\0	\n\0\0\0\0\0\0\0\0\0	\n\03\0!1AQa\"q2‘¡±B#$RÁb34r‚ÑC%’Sðáñcs5¢²ƒ&D“TdEÂ£t6ÒUâeò³„ÃÓuãóF\'”¤…´•ÄÔäô¥µÅÕåõVfv†–¦¶ÆÖæö7GWgw‡—§·Ç×ç÷\05\0!1AQaq\"2‘¡±B#ÁRÑð3$bár‚’CScs4ñ%¢²ƒ&5ÂÒD“T£dEU6teâò³„ÃÓuãóF”¤…´•ÄÔäô¥µÅÕåõVfv†–¦¶ÆÖæö\'7GWgw‡—§·ÇÿÚ\0\0\0?\0õ$’I%)$’IJCÈÉ£§]‘cj­¼¹Æ?ó§*G¬Q„á[NNkô¯½]®²ÿ\0ôlUñú=ùV·3­8]hÖ¬AüÍ_Ùÿ\0\nÿ\0õý\"5Ô¢úCë\rÞ½Y6cºž“k½&Þý\\ík¼Í£ýàÖâÎë™˜Ø¯0¶æ–²Ë£÷ÑúéÁªŸW²_TtüËžr½6½”<\0+`ÊAún¿Óý5¬Ð¯úD‹\"èÑ6î$’I«”’I$¥$’I)ÿÐõ$’I%,ç5­.q\rkD’t\0gSÌêv?Fhm½Aàíoï7¿Ÿgúÿ\0Â¡õö¶ã ÷‘aØö0í\r³ó~Ñ·ÜúŸÿ\0­Êë®¦\nëhc£ZÑ\0 Ø^ëw5µ5zwJÅéì>”Ùsõ·!úØòyÿ\0»ü”¯Ö©éÌôÛå¸K*ì?á-ýÖçÅ_¬ý`n&ìlB•ÃßËkøþý¿ðöâç°pïê9¢–¸—Øwßsµ!¿Ÿcœ?ó+N½J«H¶°Únuýk©mt`vž¥ßà©cuý\rn?çÿ\0RåŸö›þÑöŸSõ­þ®ñûÿ\0Kèþïò?Ñ­.½‘P²®™Š6ã`ˆ plú^›OýºûT¸}^aØØu¤m÷G¨èvïÞßú?ø¤áù­=»=7Jê,ê8¸Clo¶æÍxçû.úLWÒú‹úvX¼I¥ÐÛØ;·÷€ýúÿ\01vì{,clacÀs\\8 êÒ$(¯Œ¬.’I&®RI$’ŸÿÑõ$’I%\"ÉÆ§/ø×·uV®\ZÜúšþ“w ÜA¾Ìí\ZN/Ñ«Ós¾…Ïwèý_ðU×þŸô‹ T:Î³pm® =r°žûÛ}\"ïålDˆ#¨r©Çú¥”F-UŽÒ·ÍŒ$ÿ\0!÷{÷-ZuTý]éV9ŽeZv¶Â#}†}/g¿ÙK=ë• 8áäæžA´«9™ù9­ ^íßg¯`<—;óîòßµŠNø‡mZþò{¾ÇŸ‹œçú§¼®¤ô—þÎ=4êŒ`d\r»ýnÿ\0›ë,ß«lÈÎ}ö\0æâ´9­?¾ýÁþÃXõ´3Ïíã…èYü×óÑíÿ\0I»þ/üÿ\0ô¾Ä$u¡ÓTÄig®¯`´òÑÍ?Õ[¿Vz§¥`é×ÑØIÇqìî]OöþhY°›žÛëÌ°\\áü¶À³üýÌrÈ?wpG ŽèèB5‰}%›Ðú¯ím¶‘öª`Z8Ü?6æåÿ\0çÅ¤¢\"™A½T’I$§ÿÒõ$’I%)$’IO3õ›¥zo=F†û!£±íö¾¿çÿ\0¤XKÐžÆXÇ1à9®iÔt-+ˆê½5ý;,Ó©¥þê{·»òêRDÞŒsVßÕÎ£FU•ä82¼Ð,:\0ö—lk¿ã=EÖ®¦—¥‹¶$ÚÑ¨L?Úïä.›§u‡dæçRý»)µ­§oî“è;ô¬ßÿ\0\\Bc[L”ã}bê4æå²¼wÕŒßPj÷¿iüæ³bÉ$\'@®dÑ••Õ²i¦¿VïUãk\0h\rcïÌ­»GÓrèzWÕê0ˆ¿ ‹ò†­1ìaÿ\0ƒiúNÿ\0…þb!mÑú¿Ñó™Ìë±«lYû\Z5í?ÍÕýoÒQt©$£&Ù\0 ¤’I¿ÿÓõ$’I%)$’IJU:§O¯¨b:‡{^=Ô¿÷^>‹¿«ù¯VÒIOÒ©}}k››²Ê­>£ObÆ=éúÈ¾Ç¯¢-\'ÇÓ¶›ýýtù}2‹2h±¤åÕ[ÚÆ´€â×1›ÿ\0yÍÝ±ŠŸCú¾0Cr2¿\'fÍ>Æƒô›ÿ\0\nïë)8…1ð›µXôRëUmc®vû®wï8¢$’‘I$’JRI$’ŸÿÔõ%Ÿ™õƒ¢`ä}›/6šoÎ­Î˜Óþøþb¯wó·zu«ï/q`—€vƒÁ=—\rþ(ßeÝ\'ªdåëÔnê6·8ØNÊŸúVûvþ™÷ûãSÙ7¨ô÷á~ÐfU.Â\0»íBÆš¶´ís½}Þ–Ö¸~ò^èÝBßC2«®â è{™þš¶;k­£þ¿Ð®ëÖ..Õþ‚éú¼î£ks@!Ìkýmÿ\0e²ÖýGÕÎg¢ïô¤ý%Küj›êÇè¹Xz­]AÂ K¥ÍwèÛü›-eÙùé)ëmë]\ZœÁv~5y¥Í`Æ}¬m¥ÏM¥Îõ7Y¹»=ªYÝW¥ôíŸ´3(ÃõgÓûE¬«vØß³Õs7ìÞÝËÿ\0ý,õd¾¦—Óðv=¼9¦‹·]î‚ïænÖÿ\0¥Ø±úÆ}½z®õŽöý§©áÑ‡XÍ¶°ïÚ\ZÉÝëõR¿øŒ,t”ú>O[è¸ž˜ËÏÆÆ74>ŸZÖW½§‡×ê9»ÛýTL.©Ó3Íƒ.Œ³TE66ÂÂgo©é¹Û>ç.GühŠú	­»Þ:E­²`ío©Ù»÷–Fú·ÔkúÛÔ>´gšhve\rÆ«—:Øhm×¾¼ê¿A•~Óý\ZJz3pëÊ«ËëfUáÎ¦‡8&Ã]dï~Ïä¡çu^—Ó¶~ÐÌ£ÕŸOí²­Ûc~ÏUÍÝ·sWš}kÏËJŸ®XØÙGöf`®»¶†ã¿§ìÛ’×;srr¾ÒöYè~’ž¥þŽš—iõ¦®ŸÖ:6V†äàçåb€A#uv¹»l®Æ½¾Çû\\Ä”ëfun•€Êß›F+.“S®µ•‡ÄéºÇ7ÒüÕz÷C§\'ì—uZò¥£ìî¹‚Ùp`ô\\ïSÞ×7gµyö6_PèyXßR:ÕŽÈu9ø7tlÍ¾Û(nM.4»wº¯J¶Ù³ùÏOe˜¾§£öu¹þ2ú[ÇO§ë.›OSèv6Ö[\Zº­Ãu/ýö¶ÇoØÿ\0góõÿ\0‡IOUûK§}·öÚ©ûtOÙ}Fú±÷z3êmÙü•ec}Zc²±¿ç@Œ¾±]Wls›V>ÝøX•oæÙk­½û?K—~EŸÍúLfÊJÿÕõ%‘gÕNŠìÛ³©eØy.ÊvEØÂÒ7×³ÚX÷ûßúOç=ë]$”âebt»zsº%½Ûzk¤ÚZÆ\ná¿Eõ;ÖeŒýö[üê?OÀ§2¬çôþ¡—“ŒÜk2¬7úAÛwú\rÈÉ±Œ{¶7ôßÏÿ\0Â­¼ÚnºÚluOa.a\0ì\'mÜÿ\0À¹ÿ\0ÛUOTÉp.wé+}Ms[g¨öW?Ìþ«ú¿»ùË?íÄE#V‹ðº}Tõ‡ôÜ÷gzEæÇl5wÇû?ÚþÍöw;ôž¥éú¿¥þqWÉè}&œL{zFw¡ÓÚÆáÔË_[k,ŸNÖ6œÊÿ\0X÷Héÿ\0áÍTuæÒ÷¼šC`Ý3`õ=Gmÿ\0¶ýÿ\0OèÂ¦È¯¨úÙN§qcšÃO¾·núêníÝï÷=Œÿ\0®WüÉÑ\Zø¹}K¥ô¾ª1ÇPéBñˆèMÏn×3èÝú,ÆoÈÿ\0»ý7òÕ÷Þ,Ãû°º‡¥°3x~Ûa±ÿ\0j™’ÜîÛï·Õõ¬¯©;\"÷°–1ô¸S.×–³Óg§îý%vú¯}¿ð‰«¯¨‰\r-moy¹Ž³s‹çWKï«²—ú®ý\'Ó¯ü\"Zx+_1Ý3¦?¤ŽŒî›Ô]ÓÁA¹ÿ\0D7Óm¯Û=o³5¿ö›ÔôPÝÑ:;°ñðMê_fÃx³\Z±‘hôÞ6únc†vÿ\0Ðz«û¿AþnaWšÆÜ2]º\\}ºNÒ7kû»\\íŠ¶=U¢´9ÖÝ6í|{647ü#}­³é3uŸñih­Zù´`g¿ÌÎ“•u½:ÆÝ‰k¶ïcÙïU¹ÇîØÏV»?GwøUk7§a}`Â8ýKöcî!øî±ôïÓü\'Ù.o«WòlwÓQýPPðç9î9à5úúSî`vúÝÿ\0‚1‹QIÖéÝ;¦b3=¸õ­–Xûv´\r­­È}¶6¶4{+ÝìVRI¿ÿÙ\08BIM!\0\0\0\0\0}\0\0\0\0\0\0\0A\0d\0o\0b\0e\0 \0P\0h\0o\0t\0o\0s\0h\0o\0p\0 \0E\0l\0e\0m\0e\0n\0t\0s\0\0\0\0A\0d\0o\0b\0e\0 \0P\0h\0o\0t\0o\0s\0h\0o\0p\0 \0E\0l\0e\0m\0e\0n\0t\0s\0 \01\0.\00\0.\01\0\0\0\08BIM\0\0\0\0\0\0\0\0\0\0ÿî\0Adobe\0d\0\0\0\0ÿÛ\0„\0		\n\n\n\n\r\rÿÀ\0:,\0ÿÝ\0\0&ÿÄ¢\0\0\0\0\0\0\0\0\0\0\0\0	\n\0\0\0\0\0\0\0\0\0	\n\0s\0!1AQa\"q2‘¡±B#ÁRÑá3bð$r‚ñ%C4S’¢²csÂ5D\'“£³6TdtÃÒâ&ƒ	\n„”EF¤´VÓU(\ZòãóÄÔäôeu…•¥µÅÕåõfv†–¦¶ÆÖæö7GWgw‡—§·Ç×ç÷8HXhxˆ˜¨¸ÈØèø)9IYiy‰™©¹ÉÙéù*:JZjzŠšªºÊÚêú\0m\0!1AQa\"q‘2¡±ðÁÑá#BRbrñ3$4C‚’S%¢c²ÂsÒ5âDƒT“	\n&6E\Z\'dtU7ò£³Ã()Óãó„”¤´ÄÔäôeu…•¥µÅÕåõFVfv†–¦¶ÆÖæöGWgw‡—§·Ç×ç÷8HXhxˆ˜¨¸ÈØèø9IYiy‰™©¹ÉÙéù*:JZjzŠšªºÊÚêúÿÚ\0\0\0?\0õF*ìUØ«±Wb®Å]Š»v*ìUØ«±Wb®Å]Š»v*ìUFÛK‰fŠ	’I-ÈYÑH%	©†‘jØìUØ«±Wb®Å]Š»v*ìUØ«±Wb®Å]Š»v*ìUØ«ÿÐõF*ìUØ«±Wb®Å]Š»v*ìUØ«±Wb®Å]Š»Rº»¶´·{‹™#yÐˆ&žeæ¿Ì‹‹¾vz9h-ŽÍuÒGäÿ\0\"ÿ\0ÃeðÇÞÑ<·ÉycÌ7:¬—_Bô[¨¿õßö‡Ú\\œ£a„%EíÖ·V÷vÑÜÛ¸’	T<n:s‡(UÅ.Å]Š»v*ìUØ«±Wb®Å]Š»v*ìUØ«±Wb®Å_ÿÑõF*ìUØ«±Wb®Å]Š»v*ìUØ«±Wb®Å]Š¤žcón•¡EþÞ¥Ó\nÇj‡ã>çùWü£’Œ	a)€ò½_^×¼Ï~±Qœ3£ÙER£èîÊlÈqÌŒ‹5ò§åµ½§Í`,÷=R×¬hÊþsÿ\0þ¶U<Í°Å\\ÖþdùP\\[bÊ0\'itŠ>Üc£|Óþ!þ®8çÑrÃªWùmæ¿ªÎ4kÇ¥¼ÇýDŸ±òøŸúÙ,êÇú=C(rŠ»v*ìUØ«±Wb®Å]Š»v*ìUØ«±Wb®Å]Š¿ÿÒõF*ìUØ«±Wb®Å]Š»v*ìUØ«±Wb­3*©f ($ì\0«ó_æTP³ÑH–nyÕÇ€ý£þWÙË¡½¦y{˜†‰å­sÌ·m0-é±¬÷ÓTŠüÎîÞÃ,”„Z£\'«ùË\Z^‡oéÚÇÊv–åÀ27ÓÙÉ)äÆ\0&ùM Šƒ±x÷žü®Ú.¤.mW…Ër„¯û­ú”þ)þOú¹“ŽV\\¢˜è^|óUö£aa\nG7ÙŽPTÕÀûNíû?†FXÀÊ9	4õ¡Èv*ìUØ«±Wb®Å]Š»v*ìUØ«±Wb®Å]Š»ÿÓõF*ìUØ«±Wb®Å]Š»v*ìUØ«±T¯­iÚM©¹¾˜Fƒì¯Wsà«Üá%@<£ÌþxÔõ×6Ð†·±&‹l†¬ûíÌµþ¯ÙÌˆÀ\Zy	N<©ùk$ü/u b‹í%—Gaÿ\0Ùäý¯õr3ÉÜÊ»Þ“oo¼)¬PÆ8¤h( \02‡\"•1Wb©v»¯iú-“]^=;Eûr7ò¨ÉF$±”€xï˜üÏ¨ë×~¤ä¤\nÑíTÕR»²cüÙ‘€ãJd²‹$O$è	¨M\ZÉ­ê%Dp¿ìDf_Ÿkü¦_åÈQòl}Yþ“ªZêš|7ÖÍX¦ZÓº·í)÷S”‘MÀØF`K±Wb®Å]Š»v*ìUØ«±Wb®Å]Š»v*ìUÿÔõF*ìUØ«±Wb®Å]Š»v*ìUØ«óWæŸ¤ò¶³ãw¨t*\rcŒÿ\0–GòYdµÏ 9Š0ù«T\'ãº¸o·#mkïO….Ú!£y¦ù[ÈÚnˆ«<”¹Ô;ÎÃdö{­ö²‰L–øc“dŠ»HüÑæ»\r×”¤Kvã÷ÀüGü¦þT÷ÉF°œÀxî±­j\Z½ã]ÞÉÍÎÊ£eEþU†dˆ€ãJD²¿Ë¯+-Ì¿¦ïÔ;c[pÛuÜ¹ÿ\0&?ø—ú¹^ItlÅ¥!ó†¾ÚÖµ-Â±6±~îÕÈ¯û3ñdá\Z\'+)‡<ÕúPú­ËÓN»`$\'¤oÐ?Ë³ÿ\0Í¸2BÙc°‚¨Ü‡1œ—b®Å]Š»v*ìUØ«±Wb®Å]Š»v*ìUØ«ÿÕõF*ìUØ«±Wb®Å]Š»v*£wykgn÷R¬0F*ò9 h&žcæ¯Ì‹›ÞvzAk{B\n½ÁÚWÿ\0Wùþ/Ž:æÑ<·É	å_ j\Z¹K«ÎVºy5äE$oòÎd¤C/TÓ4«\r2Ñml¡Â½‡R|Xõc”n@\0\"ð%Ø«±V/ç;Úh‘›kzO©¸øcê±×öŸø.Y[\\òSÈ¯o®¯®¤º»Ë<¦®íþ}3 \nq‰´ËÊ¾\\Ÿ]ÕÝj¶ÑÑî¥²žü¦è¹Êƒ(FË;üÀÕàÑ´8t[\0\"{„ôø/ì@6?ðgþ*Æ,ÛvIP ò¼½Ævz§åÇšÍí¿è›Ç­Õºÿ\0£9;¼cöÖOøŽcä…näbìÎ2¦çb®Å]Š»v*ìUØ«±Wb®Å]Š»v*ìUÿÖõF*ìUØ«±Wb®Å]Š»HüÉæí/B‹÷íêÝ°¬V¨~#îÇöWß%ÂSåZ¦µ¯yžý\"nR³1ú½œCáZøøÙ³ DD8æFEœùSòâÚË…Þ®âìQ’ß¬Qüÿ\0¿ár©ä¾MÐÅ\\ÙÇA•6»v*ìUƒùÓó;z~”áï‡Ã5ÆÅbö^Ìÿ\0ñ¶ïrÓ<•°yl’I,$Œ^G%ØÔ’z’N^Ð¾ÒÖ{»˜­­Ð¼Ó0HÐw$ÓT{V…¤XùcA\"FPcC5íÇó0?@è¹#Ä\\¨ÄD<ƒ_Ö&Õõk‹ùvõ\Z‘§ò ÙWîÌˆŠ4¥fÒü“`Uk;»‹;¨®­ÜÇ<,7ˆÄ‹H4÷,ëöúÞ—Üt‚â/ä\rÇÈõ\\Å”h¹q•„Û\"ÉØ«±Wb®Å]Š»v*ìUØ«±Wb®Å]Š¿ÿ×õF*ìUØ«±Wb®ÅZfTRÌBªŠ³€¹Å^}æ¯Ì´žˆCÉº½éQÿ\0Çí¬rèãïiž^æ+ y_Yó%ÓOÈˆY«=ìµ žôîí–JB-Q“Õô-iz¿§gïVá÷w#ÄöäŒÇ”‰rc\\‹\'b®ÅZ$($š¹\'¥1WšùÓóÌ$Ó´g\"-Ö{ÁÕ»üŸòòøcêZ\'“ yö\\Ðì\nõOË*}JØj÷‰K»…ÿ\0GB7Ž3û_ë?üG(É+ÙÉÅ\nÝù¥æ‘Ç¢Û¿Å%$¼§òõDú~Ñÿ\0c‡z£,º<×/qÓÝË_èºŽ­$ž½’7¦ T¼€r§²€F@Ê3Œ,Zï3ùUôhl®RC-­ìa”‘FWâ	SOŸÃŒgk8RA“`žyCÌ²èZ¢ÌIk9h—QëÙ‡ùK×!8Øg	Q{l3E4I4L)28èU…AŠå¯Å]Š»v*ìUØ«±Wb®Å]Š»v*ìUÿÐõF*ìUØ«±Wb®Å^yù¨úäiIHÒ$øY£÷žÚ}œ»|Z2ßÁ!ò—tfúQ)-n¥˜ÛÔÉoå^àdòH†â7¯C0DÂ‹H(ˆ \0x˜ÎRüUØ«±U;››{hââEŠÇ\'‘\0—“ùËÏ·\Z±{+Ðé ÑG—ýoÿ\0\'þ2!Žœiä¾L?,jveß—þT:µ÷×nþµ`hzI Ü\'ú£«åY\'M¸áoRÕµ+}/Mžú}£qéÈôUë²€,¹Ðx>¡}q}=åÁ¬Ó¹w=·ì=‡LËœ2m…»ÊwwË>b³&¶ëoêàì8Ÿ¼ªcpÛ±oó\nþåßK±jxm\"–0;³­	?.8ã×!äÄ2Æ§b¯Cü´óW\ZãüI²v=SÓÕ2œ‘êßŠ}“”·»v*ìUØ«±Wb®Å]Š»v*ìUØ«ÿÑõF*ìUØ«±Wb®ÅPÚ–Ÿm¨ØÍer¼¡J°î<÷S¸Â\r ‹xµå¶§å_0€¦“Û?8d§Ã$g¡ÿ\0U‡ÂÙ’qH1/bÐµ«]cLŠúÜìâ’GÝ}¥?,Æ”h¹1•„Ã\'b¨=WV°Ò¬ÚîöQ+°îXöUÎ-€ñï5yÂÿ\0^Ÿ‰¬6(ulü3ÿ\03Äs&0§s% É°v*˜è:%Þ³©Gel7må“² ûLr2•Q—¸éšu®›c\r•ªp†â£¹=É÷\'s˜¤Û–<ãóCÌX¼Mû«RàŽò‘²ÿ\0°Sÿ\0Ùv(õhË.Œ.ivf>Q€)ù–r6hV0~JÄþ±•Ï˜m‡Ò[üÆ†‡Eš›=’%Ôßþ7ÇUËÑ†å­NÅ[Gd`èJ²U†ÄÐŒ\nöŸ%y¡5Í0z¤ûz-Êþ=›þ%˜Ó.°È²ÝŠ»v*ìUØ«±Wb®Å]Š»v*ÿ\0ÿÒõF*ìUØ«±Wb®Å]Š±Ï;ùa5½0˜—ý>Ø¶oæñŒÿ\0­Ûü¬œ%E†HXyß’¼Ë.ƒ«®j¶S·§v„\Z£\rƒÓÅOÚÿ\0\'.œl4BT^ÌŽ®¡Ô†V\0«\rÁ¡Ìg))ó™´í\nÓÕ¹nS8>…²ŸÈýKâÙ(Ä–2-½lóeÑ¼ÒÍøbTaAà¥¨¿<¼T\\sÅ%|æ¸—“iÒþAG?r’pñ„xrIf‚h$h¦¢‘vdpU‡Ì“£ä‘cK;¨£rI4\0b‡´ù/Ëèz`\0oî\0k§ëOÁâY9Yrá\nÏ3kqhº<÷¬Gªt?µ#}‘ÿ\0òpF6S)Px\\ÒÉ4¯,¬^I³¹êXš’s)ÄYŠŠ½7H°6Ÿ–Žßnê)g?#ð¯ü*Œ¤››Aß˜\ZyŸÊ\ZmâŠµ ‹‘ðI)ÿ\0†áŽ3ºäó,¹ÇvvL4jëFÔâ¾·Ü¡¤‘žŽ‡í)Á(ØeQ·¹éÚ…®¡e\rå«ó†eä§ÃÄpv9ŠE9`Ú\']Š»v*ìUØ«±Wb®Å]Š»ÿÓõF*ìUØ«±Wb®Å]Š»y§æ_•}\':ÝšR7 ^ ìÄÐIþË£•—ãŸFŒ°êï%yò+=.{-MëõHËÙ’wp?ÝU=ÿ\0“þmÆxìì¸òPÝå.Mæ¦ó¾‰+ihß`¨;T÷ZþÊþ×ÚÁ)VÁ0åŸ¢\"\"¢(TQEU\0À¥¹v*–ë>_ÒµˆWÐjQ&H¿ê·\\\"D1”AcÞVü½M#WšöæU¹X¶±Ûq^®Ãù‡ÙðYd²XatYžTÚòÌ_0þ“ÕÍ¤ÊÎÈ”Ztim¾²3#h8Ùee‰e­NÀ¨­+O—QÔm¬bûw*To@NíþÄo‰4—³yšÞ+o\'ß[Ä8Å\r©DQÙUh3\Z?S•!éV}:=KË+c&Ëqjˆƒp[ý‹o‚è¦¬SÃn ’Þy ”q–&(ëàÊhs)Ä*xPìUØ«1ü¼ó_èËßÑ÷oK¦øXôŽS°?ê·FÊ²B÷mÇ:ÙëyŽä»v*ìUØ«±Wb®Å]Š»v*ÿ\0ÿÔõF*ìUØ«±Wb®Å]Š»Y<ÏÁ2	\"‘JÈ¸*E8«Æµß(\\iÞcƒN6·²ªÚKâ®ÀÊJï™1‹qe\n4ôÏ0kúw–t¨þLEij¦…‚\0:öUNQ™ùHD<ÇQó÷™ï&gmmû1Að\0>hýùxÆAÈJ§üÓm uÔ$ºJDŠ}*á0Ð¼¥çûMaÖÎñE­ùû\0ÝÈÉ¯Fÿ\0\')ž:o†KeÙ[cóÇ˜BèÎÑ\Z^\\Ö+oHøŸý€ÿ\0†ã“„l°É*$“S×2œGb®Å^‘ùYåò«&µ:ýªÅi_Žãþ!ÿ\0”e—FüQêË<ßÿ\0(Æ§ÿ\00ïú²¸smŸ\"ŽÒÿ\0ã™gÿ\0#ÿ\0ˆšG\'›þhy{ê×©«À¿¹º<n(6Y@Øÿ\0³ñ»º4eV–´»vv*õ¯Ë¿5þ“³ývõ¿µ_…Y\"þ²ôlÆÉ\nÝÉÇ;Ù™em®Å]Š»v*ìUØ«±Wb®Å_ÿÕõF*ìUØ«±Wb®Å]Š»v*€Ö4¨µ#Ø‹i{YHû2FC¡©Å°ƒH·š~iM;ù†(Üvééß%ß¶_‹“—›\rË\Z…[Gd`èJºU†ÄÐƒ^Õä¿1gENÀ]Û~îë·APÿ\0ì‡üm˜Ó.°ó/:kçZÖåš6&ÒÝZŽÜGVÿ\0f~,¾ ãÎVR“b©—ôiµZª†²¸âƒvl4F6iîÖ–°Z[Emn!…BFƒ°ˆK–%žoÿ\0”cSÿ\0˜wýY(sDùv—ÿ\0Ë?øÁü@`<Ò95«i¶úž=ÀýÜêV½Ôöaî§|A¢¤Xx>¥§Üi×óÙ\\\nK”oNŒ=˜n3,pÈ¢†Â‡b®ÅQ\Z}ýÎŸ{\rå³”š§õƒìzZA§¹è\ZÝ®³¦E}Ü¶–:Ô£´§üþÎbJ4\\¸ÊÂc“±Wb®Å]Š»v*ìUØ«ÿÖõF*ìUØ«±Wb®Å]Š»v*ìU…~fyrKûÔíÁiì”‰P\n–ˆš’?Ôû_êòËqÊ¶jËòŒ½Æv*ì*ŽÓµ‹í>È­Ÿ‚ÞÅèËþ­kQïJ¯û,‰ÈJ8X»vzŸåfŒ-ôÉu9÷·mÂ\"GHã4Ûýgÿ\0ˆæ>S½98£µ³œ©µ‚~bù¹m#—D‚!$·RâV;\"¿@\0ýªe¸áÕ§$ëdw¼Ü5‹sc4B+«HÖœI*è(¼·èG|!L±Îöe¹[cÎ?5ôu×VhXú¦•B~æ\\»èÑš=^u—4;vvd>KóCèZ•d%¬n(·)áààx¯üG#8Øl„è½¥Ñƒ#\0U¨ îÌW)v*ìUØ«±Wb®Å]Š»ÿ×õF*ìUØ«±Wb®Å]Š»v*ìUÄ(wxïŸ|ªt}Cë6ÈG]c§Hß©OâŸóndã‡$(±\\±­Ø«±Wb®Å]Š½ÛÊq¼³¦(ÿ\0–xÛéaÈþ¼ÄŸ72‚m‘dÁ<óäKíVøjZiF™Ô$ð¹ãR¢”ºm¾[	ÖÅ§&;Ü\"¼‡äË­¦¼¾eúÔÉé¬Hj+SSÝ‰¦“´ã…3­µŽ~aD²yJú½SÓuù‰\'›ŸKÅ³)Äv*ìUØØUé–~jä£C¼‰A6R1ê:˜ÿ\0Še!Õ¿ú=)ov*ìUØ«±Wb®Å]Š¿ÿÐõF*ìUØ«±Wb®Å]Š»v*ìUØªWÒ­u]>k¥¬RŽ£ª°èÃÜ Ò°ðÍcI»Òµ	ln…%ˆìÃ£)èÃØŒÊÃ‰!E’bìUØ«±W`W·ù\"í.¼­§²š˜ãôœxÏ\Z»1f7rñ“Ü‹7b®Å]Š±_Ì«Ô·ò¼ÑGºt‰™ü,Æ7kÊvxîd8®Å]…]Š»_²C*K’6Ž:† àKÝ<³ª]jz-½ÝÔ-Ã\nH¬8†#njì·\\Å¢åÄØMr,Š»v*ìUØ«±WÿÑõF*ìUØ«±Wb®Å]Š»v*ìUØ«±V/çÏ*®³§}bÝ+¨ÚŠÅN®Z3ú×ü¯õ²ÈJ‹^HXxá¡s!Åkv*ì*ì\nÌÿ\0.<Ñ›xúuÛñ´»`cr~—¦þÏÐåy#{¶âlõœÇr]Š»iÝQK¹\nª*ÌM\0¹8«Æ¼ùædÖµ@–æ¶6•HOó±ûOôÓáÿ\0\'2qÆƒ‹’VXÎXÖì\nìUØU^ÊÊîöá-­\"i§}–48	¤oPò§åÍ¥‡½T-ÍèÝ!ëgþ7oø\\¢y/“‘UÍšåM®Å]Š»v*ìUØ«±WÿÒõF*ìUØ«±Wb®Å]Š»v*ìUØ«±Wb¯.üÊò¯Õ.±f”¶œÒéGìÊOÚ§ƒÿ\0Ä¿ÖËñË£–X&\\ÒìUØ«°*èã’Y8Ô¼ŽB¢É$ÐŠ½“ÈÖžg³±{]e@Š0¿T«\rê¤‚vqÌiy9XÁÙ6A±Ø«üÁ±óMõºÛé‰ËOZåQ€‘Ø²A¥TËö²ÌdmY<žI™.3±Wb®ÅSï-y?T×e\r\Zú6@ÒK§ÝBÚl„¦8À—­h^\\ÒôKoFÊ:;ÞÎÛÈçÜÿ\0Ç”‰rcL‹\'b®Å]Š»v*ìUØ«±WÿÓõF*ìUØ«±Wb®Å]Š»v*ìUØ«±WbªWV°][Imp‚HeR’!èAÄ!áþhòüúªöV…¾;iš2vÿ\0d:6eÆVIÆŠQ…ƒ±WaUk;©­.áº€ÒhdŒÇ%5H4öÿ\0*ë7\ZÎüð¬-#0\n„Bž5ßÜÅ˜£N\\%bÒkoÌfóYÒ=%ú™sW žFQ·Ë‹7Â2GÖÀdõS0ÊÛX÷|Á}¡éiuk\nJdH³“ðRU¨>×Lœ#e„åAâ¬Å˜³\Z±5\'ÜæKˆÖ\\ˆîêˆ¥TT’{\00+Ð¼«ùfÍÂï\\WfK w=ÿ\0xGOõS,½ÍðÅÞôX¢ŠÖ(‘c\0 {”·¯Å]Š»v*ìUØ«±Wb®Å]Š¿ÿÔõF*ìUØ«±Wb®Å]Š»v*ìUØ«±Wb®ÅRO6ùrwKh6[¨ªö²x=>Éÿ\0%º”%E„ãaâSÁ5¼ÏÈc–&)\"7PÀÐŒÊqTñC±WaW²é26•ùãáx¬Úeÿ\0YÁuü[1Nòr†ÑxôSÉé:1£VïÈ\Zƒ™.3Úïµ\"É ß¡ãÌñ«€v¥Ä.öesnQ<ŠóØOå;²zÂc•~aÀ?8ã;£ ô¼c2œTÇDÐ5=fçÐ±ˆµ?¼”ìˆ<Y¿‡ÚÈÊ@2ŒIzÏ–<•¥èh$ ¹¿§Årã§²ÙðÙ)’äÆ\02,ƒ7b®Å]Š»v*ìUØ«±Wb®Å]Š¿ÿÕõF*ìUØ«±Wb®Å]Š»v*ìUØ«±Wb®Å]Š¼ÿ\0ó/Ê¦d:ÝšVXÅ/Q{¨é\'ûþN]Š]\ZrÃ«Ìò÷ØØ«Ö|ç7Õ< ñ2Go4ˆû“(‡ÔäÏéy6d8ÏM[Þ–Öìe€Ÿùã8_Õ”W©È¿C&óz‰<­©Sqõvaô|_Ã+‡6Éò/<ò¯ååî©ÂëPåk`hTR’H:ü ý•ÿ\0(åÓÉ\\š!Žù½OOÓ¬´ûTµ³…a…:*Ž§Äžçß(&Ü€).Å]Š»v*ìUØ«±Wb®Å]Š»v*ÿ\0ÿÖõF*ìUØ«±Wb®Å]Š»v*ìUØ«±Wb®Å]Š´Ê¬¥X¤Pƒ¸ â¯óÇ•ÛDÔ¹À§ô}É-vSÞ2ÉýŸòs&°âä…7“km“ªø1W¦þk¸GÓà¤þ¢Sþ6Ê1sr3ryŽ^ã³ýÚçòÏW·¥M»¹!ÂOë•Kê\rÑúÐtÇK\"ÑÜY ˆ;ƒÉÊO6ñÉ.Å]Š»v*ìUØ«±Wb®Å]Š»v*ìUØ«ÿ×õF*ìUØ«±Wb®Å]Š»v*ìUØ«±Wb®Å]Š»KõÝ\Z×XÓe±¹8¬oÝ}–,14XÊ6©é×ZmôÖWKÆh[‹Äu=˜n3,q¢¥h+uñuˆÄ¨gÿ\0›³SL€vY\\ý%@ýYNìÝw—4=òðzÞY×íúÕßëÄÃøeY9†ü|‹0òLÆo*é®MH‹‡üþTù¶CNò,ÝŠ»v*ìUØ«±Wb®Å]Š»v*ìUØ«±WÿÐõF*ìUØ«±Wb®Å]Š»v*ìUØ«±Wb®Å]Š»v*Ä?0¼«úVÇëö©[ûU$€7’1¹_õ—ªå˜åMY!{¼¯MßQµERÌÒ \nOÚy8ã›0üÚzë6iü¶õûÝ¿¦U‹“nnl-iz/å,r”ÔÃFßW”F„$Ž@­~M”åoÃÕœhz<\ZF™Ÿ´‘Ã_ú’Ä±éîr©6ÝÐ¤~»v*ìUØ«±Wb®Å]Š»v*ìUØ«±Wb¯ÿÑõF*ìUØ«±Wb®Å]Š»v*ìUØ«±Wb®Å]Š»v*ìU+°òÖ‹a}=õµ²­ÔìY¤;ñåÔ\'òƒí’2%ˆˆ¼ãóEÚO3G\ZŠ”·@š–cürì\\š2óEùOòÚkŸN÷Y+sFKN’8ÿ\0/ùÛí«‚y;“]ïK¶¶·¶ ·b†1Å#A@Èe¹\0*â®Å]Š»v*ìUØ«±Wb®Å]Š»v*ìUØ«±WÿÒõF*ìUØ«±Wb®Å]Š»v*ìUØ«±Wb®Å]Š»v*ìUØª]úL:ÃjòEê^•UG}ÂøcþVKˆÕ1áiŽE“±Wb®Å]Š»v*ìUØ«±Wb®Å]Š»v*ìUØ«±WÿÓõF*ìUØ«±Wb®Å]Š»v*ìUØ«±Wb®Å]Š»v*ìUØ«±Wb®Å]Š»v*ìUØ«±Wb®Å]Š»v*ìUØ«±Wb®Å_ÿÔõF*ìUØ«±Wb®Å]Š»v*ìUØ«±Wb®Å]Š»v*ìUØ«±Wb®Å]Š»v*ìUØ«±Wb®Å]Š»v*ìUØ«±Wb®Å_ÿÕõF*ìUØ«Åÿ\08ÿ\0ç%ü½ä[©tM&¬ùŽ=§‡Ÿ{bEi+Š–“þ*Oön˜ª]å¥ÿ\0œ¦ó^•µ.³¥ùb¥[X=¢É!…U]fhùÍ\'?æ\\U\"ówç§çgåŒÏ§yÓEÓõCtú#Y¶/:÷p¿kAx¸Û¿ù_µŠ½¿òËÌ÷þiò‰æA\"ŠóR¶O–0Ä‘ð†.ÔÛ»b¨OÌßÍ_*þ]èë¨kr³ÜOÉltøhgÔoÄ•öäo…Öâ¸«È<›ùùýù¯suså8´ï,ù~Ùý3q¸<è¦¬áýY(jÜaD_ÚÅU¼íçOùÈßËxµnm3Í^_æêâ(-c@ÓùtI8Êœ¾×ìòUé”¿¾TüÈ³u±åe­[ {Ý&bªÖœãqA,uý¡ñ/í¢â¬ËÌ?âÐ·_áÓj5®ê__õ>­Ï¯«é~ó_g|Ëç?ùÈÏÏ\'ë÷\Zµ èé{oÖ	Š+™#xû¹\\oÇý_ÚÅYäGüä®½ç9·—<ÉkcjnmÞM:KE–2ÓEñ4mêI-yEÍ–ŸÉŠ¾ˆÅ_8þvÿ\0ÎJy¯Éžw¹Ð¼¹gaweaök¨ævK™•¤ôùG,kýß\r©üØªòÏóßóçóR¹±Ð4½š,—w7It‘F®HZñ™Ý‹qj\\Uô^¤<ÅúoÑ¦ÓüAõôsqê}Së<o‡ï}.^UóGæüäOç·µ¥Ò<Ã£h‘\\Éž	!K‰#’\"ÅC£Šý¥aF\nØ«!òæ—üä_ž¼»&½ iž[{Hæ{oJo¬Ç+I\Z«\Z1^Ž:¾*?üå¯Ÿ<³æ	ôO;ùVÙ.­$ôï\"µy!‘Þª§I*§’ü]k}äŸ:hsòí¶¿¡Ìf±¸ªÃŒ‘È»<r/ìºÍËðâ©î*òùÈÍÛßË¯,ÙI¤[]Ô®8[G:Cå3•zrúøªŸüã§ç¥ù‹åýDëBÖ´Ë€²­º”V‚U¬OÀ–§Ä²!ßöqW®b¬3ó2óóNËN‚çòþËNÔ.#õ\rõ¦ d:Ðz~‡‰9}¾~£ÿ\0/UóDÿ\0ó˜ßš–×2[Üé\ZLsBæ9¢h.U•Ñ”ƒq±S}Cùmù…¢y÷Ê¶Úþ”ÜCþîòÕÇÂÎ&ùVªß¶œ[cŸ›~`üèòúIªù/MÒõMÚÛÕ»†àL×ªéÈÈÊ«$HñðãENRý¯‡yïåæÿ\0üä\'æ2Ü\\hÚ^m§Z8Š{û´ºHýBzhgw~$Eâ¿´Ø«7üÛó?ç–VãWò¶—¤ê¾_¶…dš7[‡½ŠÖW(²D¯;O“ñûX«Âbÿ\0œÊüÏ’DŒiÚ*ó`¡š+¢¦•\'ëUõ7ßóK¥ó©ÒLòk!£zæ1Z·¨Ó“ÈÖœx|8«Îÿ\0<¿2?7/–MsO·Ðî|­$Ñ[ÚúâàÞ¬O¨¢H£jºÉÇÓýµŠ§ÿ\0“Þcüäó#Vó®—¦éZ-Í·©a\rºÌ—­#2”wG’UHŒ|þã/.*ôÌUØ«ÿÖõF*ìU†þpyÙü•ùw¬kðÓëD\"±T}bvÄHî››’¸«áßÊ-|×ù¯ Xj,Ó­åð¸½g<šA+‰9×ÔàC­Š¿E1Vù×ùž/u-!c¨Ä†ïI=ÅÔ*J\0âÐZÿ\01UoÉ­TÑ+ü»¥êÖíi¨ZZúw6òS’0v44$t8«áÿ\0Îo=Ýù×óUÕ¤•žÊ9ZÛLºGkŒÛŸ÷þ[â¯·ÿ\0%ü¹—¿+|·§D\0ceÌæ”¬×C×’¿ì¤ãŠ§þlÐíµï,jº5ÔbXoíf‘…E]SóV£/ùX«óŸÉžjÕ|Ÿæ½?_ÓÙ’ëN˜;F	Q\"I\"oòdNHØ«ô›N¾‚ÿ\0O¶¿·< »‰\'…¼RE§î8«Ã¿3t;=wþrËš5Øÿ\0FÔü¹¨ZNFä,±Ü­Gº×Å_*iWš¿å÷æ$\'KËº…\'ˆôc…dOõ]C/ú­Š¿Cn¼Ó£ÛùRO4™yiÙHL?j¬»&*øÏóI½—ò~×Îúª¬y×ÌRj2Ÿå¶XfX#²Š»/ù˜«8ÿ\0œ\"ÿ\0{<Ýÿ\0ìâSâ¯ªñWÇŸóš¿òh_öËÿ\0±‰1W¨Îä§¸ÿ\0¶­Çüš‡x¿üæšk~m*ÚnM¶[ú¿¹HV¾þ‹{üá­õ¿å•õÄêÉoyªK%§*Ñ•!Š6eöæŒ¿ë&*÷¬UòWæöƒ¨þjêžzó>žÌúg‘aOÒ‘7[‰`s-ù¥+TC!Z}¿Ýb¯>ÿ\0œjóÇøWóOOYåôôífºmåzVb=ö¤â?‹ùYñWÞØ«±WÅ¾rü£»ó—4î´$-«h7ðÜÁ`”¥ÄwV¸Uÿ\0‹jž¤Ïñ\'ÚeÅXOä·æÎ§ùqæ´»«Ë¢^‹Y°·;H€ÿ\0»¡¯$þoŠ?ÛÅ_|Øjzf·¢Ã¨ió¥Þ\0–	Õ^9cýF*ò?ùÄhV/Ê™\0ïª]ÖžÂ5þ«ÚˆEAØŒUðWüäWågøÏ5Œ%<½«ò¹Óì£W÷ÐøÄÇáÿ\0ŠÝ1WÐ¿óŠ¿™ÿ\0â&‡uÃë^_U‰}¹lhßízÜ·üóþ|UJâùÃù·é1õÿ\0/|‹-\\¯÷Wº°ýšÿ\0»#‹þŠÿ\0-Æ*÷lUØ«±Wÿ×õF*ìUãó–ðÍ\'äíËÇ^1_Z¼¿ê–+¿û&\\Uó?üãdñÃùÙå–s@Ò\\ ù½¬ª?Š¾ÿ\0Å]Š©Ü+½¼¨†ŽÈÁO#lUùys‘\\K ¬‘»+ƒÔ048«ô»Én’y;B‘\rQôëFSì`B1TáÙUK1¢¨$ŸaŠ¿/µ)R]FêX÷I&‘“äÌHÅ_¤_—–7AòÝÆ×º]œ3KtVxÅ^oæÏýj_$ÿ\0Ûóõ\\b¯ÿ\0œ¹ò_èOÌd× N6~b‡×cÛë0R9‡Ò¾“ÿ\0¬íŠ¦^^üÆ¿ógäÏ—¿+í\'#]ÔµXôYÈ?¼]1\nÌ% ý…R\"?ñ\\OŠ³_ùËý2ËJü±ò¾™cŠÎÆù-íâ8­dEpÅRoùÂ/÷³ÍßñŽÇþ%>*ú¯|yÿ\09«ÿ\0)Þ…ÿ\0l¿û“Gÿ\0Î<é—¿—s%k:N™¤›éÕäO%È›Ó“)ôäN<xq®*È4OùÄ	¯õ¹uŸ?y–MZââS5ÔVªÊÓ3nKÜIñuì±/ÃöYqWÑ:F“¦èúe¶—¦[¥¦Ÿg\ZÅmo¢¢( øŸÚÅX×æçG’ÿ\0/u}HpCéXƒMîf\"8¶=x³saü¨Ø«Ç?(?8)|ù{g¡ßÜÞK¨Ü¹Ö[êW$¹¹ÞPO‹ŠñŠ¿µÃ|»æx´»_3jC’C¥%Ì¦JêñIès&*‡£«*Ó~ƒþSùÎ/9~_hÚò¸k‰ Xï– •¹‡÷sáW^kþC.*Ë±WŠ~Mÿ\0äèüÚÿ\0˜Ë/Õ6*òÿ\0ùÊ_Èÿ\0Ñ7SyïË¶ôÓ.žºÝ¬ch&sþô(î©Xþóù%ÿ\0ŒŸ\n©oüãçoøjüy;_¸Tòö ìln¥4[K—ìXý˜&?köROö¤Å^Íÿ\08™ÿ\0’ªOûj^~´Å^ÏŠ°ÏËËO<þ__éÏD¿³V½Ó&?³q\nÿ\0“\"–¿Öåû8«àÿ\0\'y›Ì~]ÖÖóË×FÓQ¸ŽK%‘hj·+é‘¿Ì2ŸÙuWÅ_¡?—EÓ|å.Ø|BÝy]N~Ô×¼²Ÿõ›ìÿ\0*qLU“b®Å]Š¿ÿÐõF*ìU&ó—•´ÿ\05ù[SòõþÖº”\r8\0”cºHµý¨Ü+¯ú¸«óãPÒ|ÕùgçØþÝ­u}ê;˜	¨IDOÉ$Fý¸¥ã×ýŽ*ûÓÈ?™þOó¾o¨h÷ð™å@×\ZsÈ¢æý¤’:òøOíÓƒý¥ÅROÍ/Î¯-ù7L’ÞÊxõ_5\\CLÑ-XM3Nÿ\0\nQ*È¼~\'û	Š§¿•ö^q´òFšžq¼7¾a‘Zk×` ÆebëÀ\0&%!ù_äâ¯“¿ç&ÿ\0\'µ/,yªïÍ:u¹“ËZÄÆw’5øm®d5’9\0û+#üq7Ùø½?ÙÅ^ûÿ\08Ëù…§ùŸòßOÒÚå[[Ðbw–ÄSÑŒñ‚P:˜Ì\\—ó«b¬‡ó¯óKòOµ+Ë‰Ñu+¸$¶Ò­K$³È¼UëÆ.^¤ü¿ë.*ùòòRóß›ín\'·aå2T›Sºu>œœal¤ìÏ/G±Åü¼•}ò\0ƒ`:UóŸ?0<·eÿ\09QåYd½‹êšu“iú…Ç5ôážèN]«Åx™bõ+ö9b¬³þr—Êy—ò¦ãT·ã%Ö„Ë¨ÛJ¿(Á8~É½_ùåŠ¼“þpÓÉ^óF§æËˆ‰ƒI‹ê¶R³õ›€y‘îÔøÍŠ³ùÍkËQå\rÌÊ¿Z}A¦Xj9˜ÒVjuâÔb¬kþpšúÎ-_ÍrL‰uq\r£Á0ëKÌ¨?k5åŠ¾³Å_ÿ\0Îh][Kù£ÃªòÁ¦2)¡iä`²Jü[â¯Nÿ\0œ7¾³“òÊöÍ&F»ƒS™æ·=EI\"‹ƒëÅ¸·þKb¯zÅ]Š¾züÖó>…çOÎ&~^¥üé\Z}Ù¿Ö€uôÚêgŠÙ˜ž%è…?š~o}	Á?”}Ø«æùÍ\'Bm´O7AÁfŽ›v›dnRÂÀu<J­þºâ©Wüá×æ-µ…þ¥ä½Fá!Šý…æ”d` Ü\0#– IûR ‘â·Å_YK,PÄòÊëQ‚ÒHä*ªRI;\01WÎ‘>|òõßçwæ*}v%]rèI¥;¸p¶ÒÈŸ»$Ñ‹+«¢ØÅ_F^ÙÚ^ÚMgy\n\\Z\\£E<\0Èèã‹+Ô08«àŸÏ¯Éë¯Ë¿4ª£Ëå­D™4»¦ðÞ­líþüöž?‹ùñWÒóˆ_ù(WþÚ7_©1W¶b¨-râ}\Zþ{‰(\"·•ä‘ÈUUI$±Wæv‹,QkVÊÁbŽæ\'‘@¢@I?F*ý:·¸‚âžÞDš	@håƒ#)ÜaPAÅU1Wb®Å_ÿÑõF*ìUØ«óŸåÿ\0”<ç§‹2i‘_Ä•0ÈÕYb\'¼r¡Yý‹­Š¼º_ùÃ¿Ê‡˜ÉÆ­\0íw1qKÂÍÿ\0\rŠ³? þF~\\yäÞèÚy“R¥¡xæyÔ¼	c¯s\Z.*ÏñU»K[ËimnáK‹i”¤ÐJ¡ÑÔìU•ª8«Ê¯¿ç?,dÔÎ§¥~‘òýÙ<ƒé7mzðæ²pÿ\0U8®*¦?ç?..5¾Öîµ0N¤\ZêwÍ-@ìY\'§û,UêzN‘¥hú|:v•i…ºñ†ÚÆ£ÙV˜ªÌþ[ÒüË¡ÜèšªÈÖaDëŽQã*ãâQÐâ¯5?óŠ’äÔéWž¿é—ó^*Íü©ùoå/+yrëËšU«þ‡½i\ZæÖâY\'%ŒDëYŒ‹NáÅQÞVò–|©¥/ËÖéÖ\r#LÐÆXÖG\03rÌMG\\Uç÷ó‹ß”s´÷:}ÔÓ9«;ÞÜ±ß~¥Î*²?ùÅÉ¨¤Y\"ÓnRE5W[ÛAö!ñW¤_ysL½òìž^œJtÙ-…£•Ö_H(OïAõ9P}¾\\±W›Éÿ\08¯ù5#™$Ó.]ØÕ¯nI\'Ü—ÅQ:GüãOå6‘©[ê:}…Ìv²$ÐºÞ\\}¨Ø2Ôsø…GÙ8«ÔñT¯Ìþ[ÒüË¡Üèš¢ÈÖaDËŽQã*ãâQÐâ¯5ÿ\0¡Tü—­EÜW­~¹q_øž*ôO(ùGFòžŒš>Ž²­’;H«<²NÁŸ¯Ç!f§¶*Âõÿ\0ùÇÊÍVºÕu[+«‹ËÉdžf7—yÊÅ›Šó¢-OÙ_‡KÇüâŸä¸ .à¸\"òãþkÅY.½ù/äMw@Ò´J©tÝ;(…ÜêxÉJúŒ”¿dSÔåÇcCþqOò\\F—pÜyqÿ\05â¯QÑt‹-I´Ò¬C‹;(–ŽÒ8DÉf>íŠ |ãäß/yÇA›C×í¾µ§ÌUÊ‚QÕÐÕ]~%aâ?ÕÅT¼ä_/y\'Cý	 E$6WŸ„²4­ÎJrø›ÙÅY*Â¼óùAä<^Åyæ.\'–„‘\\Í|Þ8ÙPµXüTÅX·ý\n—ä·ýZ®?é2ãþkÅY¿*¼äFº>\\‚{qx¨³$·Ì´BHâ²3ûGìâ¬¿v*ìUÿÒõF*ìUØ«±WbªWrM¬ÒC­2#4QVœØB×ü£¶!Kÿ\0y÷þ¥óÿ\0\"¦þ¹o{ÚxåÜïñ‡Ÿê_?ò*oë‡‚=ëÇ.çŒ<ûÿ\0Rùÿ\0‘S\\x#Þ¼rîwøÃÏ¿õ/Ÿù7õÇ‚=ëÇ.çŒ<ûÿ\0Rùÿ\0‘S\\x#Þ¼rîwøÃÏ¿õ/Ÿù7õÇ‚=ëÇ.çŒ<ûÿ\0Rùÿ\0‘S\\x#Þ¼rîwøÃÏ¿õ/Ÿù7õÇ‚=ëÇ.çŒ<ûÿ\0Rùÿ\0‘S\\x#Þ¼rîwøÃÏ¿õ/Ÿù7õÇ‚=ëÇ.çŒ<ûÿ\0Rùÿ\0‘S\\x#Þ¼rîwøÃÏ¿õ/Ÿù7õÇ‚=ëÇ.çŒ<ûÿ\0Rùÿ\0‘S\\x#Þ¼rîwøÃÏ¿õ/Ÿù7õÇ‚=ëÇ.çŒ<ûÿ\0Rùÿ\0‘S\\x#Þ¼rîwøÃÏ¿õ/Ÿù7õÇ‚=ëÇ.çŒ<ûÿ\0Rùÿ\0‘S\\ï^9w;üaçßú—ÏüŠ›úãÁõã—s¿Æ}ÿ\0©|ÿ\0È©¿®<ï^9w;üaçßú—ÏüŠ›úáàzñË¹ßã>ÿ\0Ô¾äTß×÷¯»þ0óïýKçþEMýqàzñË¹ßã>ÿ\0Ô¾äTß×÷¯»þ0óïýKçþEMýqàzñË¹ßã>ÿ\0Ô¾äTß×÷¯»‘ZWš<éq¨ÛÁu¡˜m¤p³KÂUà¤îÕcM°Æ¹¤NWÉšeM®Å]Š»v*ìUÿÓõF*ìUØ«±Wb®Å]Š¡¿IX}xØzê/=C	Ù¸7Ë\r\"Ç\'Yê67¶ßZµ™e·UOÃðõÜøbE(6‡ÓüÃ¢j7[Ù^G<ÑnÈ¤ÖƒjŠý¡î¸˜ Q7:…•´ðA<Ë×LVÝ«°¥@ûñ$·\rí¬óOR‡–Ø…U,*ú1¥´×™´K¦´¹¾Š+„ <nhA\"¢¿AÂ\"Pd ÊÊH*wn9JwWvÖ–ïqs*Ãb¯#š\01Ò†™¬iš¤-5…ÂÜF§‹•¨ ûƒFH!Dä©£e5ÜÖqL¯snž!ö”0¨®4¶Ýíõ³ÜÝÊ°ÀŸjG4jM)éº®©ÛýbÂuž*ñ,µØøhGÓ‰( òRÕ5íK1‹û¤¤û\nÕ,}è š{â\"O$ÍÑMK‰\"pMA¡`d£§a%ô¶Îy\n‡–\0~%SMÏüÃH±É«ýSOÓÑöu$nÎhu¦ ¤€¾;ÛY.¦µI® \nfŒuPâ«_ž4¶¯)y×ôaoqpnãô-_Ò¸’¦ˆõ§ôáá,x‚&âúÒÞÐÞO*ÇjªÊ~È\rJÇ\ZI(]?Ì:&£9‚Êò9æ\n\\¢^\"€ŸÇ$\nÛ¯3h·Mis}W@xØÐ‚@\"¿AÂ\"TÈ#ä¸‚;v¸wS#I_‡€åQÚ™V€²ó6ƒ}r¶Ö—±Í;×ŒjMMOo’1!ˆ)žE“±Wb®Å]Š»v*ÿ\0ÿÔõF*ìUØ«±Wb®Å]Š°¯Ì[i 6:µ›úWÚÈ·ŠN¬7ÿ\0Wâÿ\0‚ËqžYTËY°M+È×VVÛ,¬œ†ÄÔ|mþÊ¬r Ü™HTXô0Amyä™-QRYb\"VP`È¥¹S¯Ú|Ÿ{_óSŸ6ÿ\0ÊEåŸù‰øÓ#Eœù„O—å!óüg‡þM`— ˜ó,;Ì·Á¬ùŸšÜÅ$pG,ÎGîyªª¸$î{e‘ä\Z¤w/FÑ-\ržejd˜aD2El¦FË|E»Îº[êzZÇ2C1‘\Z/T…WpvJŸæí’¢ÆbÂ_äëîz¥ýî›†³\Z#\\<;$ˆ( %GQö~Ö¼‘¿-×h?òù‡ýH?â}!cõ¼þÉ¡Ã&öòj‰Tô=¨~óŽ>«“£^_EƒÏ:ü(KN(¢Š¨=úÍŒ¾ˆýEsÅüã®¼Ö¤8–SJ²8N\\KVŸháHAúŠwä››9<µo%¬oª¤¯ê0\næµj/êÈÌnÎf kVgÍ6ZŠÌ\rÎ§=ÌW‘ïð+°ôûvd£µ5F[Û&üÀ±[ø´«&b¢âðGÈv-\0~ü†3VÙ]!<ƒ¨KªêsN¸X-a¸¯©dcôñÃPF3d³|©µã÷sj«¤ùŠ(mÑôç¾&âàµJ8€µÞ»f@«1º,ëÍ_ò‚\\Ì4_­2¨ýM³úWù:-@Z#ÞiöÖŠ!ˆ[Ïò)]ùÓä§Òal?Ì·Á¬ùŸšÜÅ$pG,ÎGîyª…p$î{e‘©Ë56¦ÓÉld˜´ö_Qw\rHŽãÛÃ+¿SmzR¯Ëèõ¨Ú<Ú}´vb0Þ­ÌÜ©ñwÜrÃ’˜ã¶g•¶»v*ìUØ«±Wb¯ÿÕõF*ìUØ«±Wb®Å]Š 5\ZÏV·Ž¢á\"•f^‰ä•¥v;o„\ZD£h¹àŠâ ™CÃ*”‘B¬(F¤ºO“4}2ñ.âi¥’+n³ÉÍb\r×ÓÉ™’À@^¹åû\rf(£º2#@þ¤3BÜØÐàŒ©2ˆ+ômËH‚H­‹»JæI¦•¹Èìv«6Ø­c\ZP›Êú\\Óê3IÌ¶¨‹Èä)EvØí‡ˆ¯\0L,,ã²³†Ò&fŽŒæ­Äl*vÀM¤\nPÖ4{^ÈÚ^)1ò¬‡‹+/FSãˆ4²¨h¾\\Óô‡šX\ZY®\'§«spþ¤„/AÊƒl2‘(Œ@B_ù\'J¼ÔfÔ\Zk˜®.8ú¾Œ¼âŽƒÛ™`	´ÇXÑlu{?ª]†(::.Ž½OŽD\Ze(Úž‰åë\rfú¹’Y®4÷·9Ž•j˜e+Db†±å-/T»r¼Ð\\pôžKy=2éü¯±¨ÄL„J\0¢m4=&M.Ø¼v²	Íñ¨–¤ñcóÛ+6‘\Z†›Ê:<¶v\\\Z4²tx%Bœ957ëG\0¤uþ—m}-¤“råg0ž&Ÿoí¾\0i‘§a¡XXßÞß[†Y¯Ø4àš­EMTSj–ß+\0Úa’FÞNÒ\rõ‘2ú:„Þ½ÇÄ+Ïo„ÓaQ“ã,8>ûIµ½ÒßL˜·Õ3ÄÑ¨´¦ôöÈƒFÙbz?•¬´«ZÞâêO€Æ#šRèÝƒÃ	•¢0¥Óy[Kš}Ji9–Õc¹…(¢€®Û±â+ÀQiVÑé¢¹;[M¿&5~xõ§a‚÷´ÖÔ—éOÓ´«˜ç¶¸º\" BC$¥££>Å\0ï’3%ˆ€	îA›±Wb®Å]Š»v*ÿ\0ÿÖõF*ìUØ«±Wb®Å]Š»v*ìUØ«±Wb®Å]Š»v*ìUØ«±Wb®Å]Š»v*ìUØ«±Wb®Å]Š»v*ìUØ«±Wb®Å_ÿÙ','active');
/*!40000 ALTER TABLE `provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rentals`
--

DROP TABLE IF EXISTS `rentals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rentals` (
  `lastname` varchar(45) NOT NULL,
  `firstname` varchar(45) NOT NULL,
  `location` varchar(45) NOT NULL,
  `rent_time` varchar(45) NOT NULL,
  `rent_date` date NOT NULL,
  `pack_id` int(11) NOT NULL,
  `comp_name` varchar(45) NOT NULL,
  `rent_status` enum('pending','accepted','declined','canceled','done') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rentals`
--

LOCK TABLES `rentals` WRITE;
/*!40000 ALTER TABLE `rentals` DISABLE KEYS */;
INSERT INTO `rentals` VALUES ('Dela Cruz','Juan','Lower Bonifacio Road Baguio City','4:00 PM','2018-05-01',1,'Songnify','accepted'),('Dela Cruz','Juan','Lower Bonifacio Road Baguio City','4:00 PM','2018-05-14',4,'Songnify','pending'),('Dela Cruz','Juan','Lower Bonifacio Road Baguio City','8:00 AM','2018-04-02',1,'Songnify','canceled'),('Dela Cruz','Juan','Lower Bonifacio Road Baguio City','9:00 AM','2018-03-01',1,'Songnify','done');
/*!40000 ALTER TABLE `rentals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'musify'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-16 18:59:45
