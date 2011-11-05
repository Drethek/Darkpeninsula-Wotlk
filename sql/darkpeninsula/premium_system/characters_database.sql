--
-- Premium System
--

--
-- Characters Table
--

DROP TABLE IF EXISTS `premium_codes`;
CREATE TABLE `premium_codes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon` varchar(255) NOT NULL,
  `type` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `rewarded` tinyint(1) NOT NULL,
  `buyer` int(11) NOT NULL,
  `account` int(11) NOT NULL,
  `character` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11671 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `premium_porting`;
CREATE TABLE `premium_porting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `account` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT 'Char_Ported',
  `level` int(11) NOT NULL DEFAULT '1',
  `exp` int(11) NOT NULL,
  `race` int(11) NOT NULL,
  `class` int(11) NOT NULL,
  `gender` int(11) NOT NULL,
  `money` int(11) NOT NULL DEFAULT '0',
  `honor` int(11) NOT NULL DEFAULT '0',
  `arena` int(11) NOT NULL DEFAULT '0',
  `item_1` int(11) NOT NULL DEFAULT '0',
  `item_2` int(11) NOT NULL DEFAULT '0',
  `item_3` int(11) NOT NULL DEFAULT '0',
  `item_4` int(11) NOT NULL DEFAULT '0',
  `item_5` int(11) NOT NULL DEFAULT '0',
  `item_6` int(11) NOT NULL DEFAULT '0',
  `item_7` int(11) NOT NULL DEFAULT '0',
  `item_8` int(11) NOT NULL DEFAULT '0',
  `item_9` int(11) NOT NULL DEFAULT '0',
  `item_10` int(11) NOT NULL DEFAULT '0',
  `item_11` int(11) NOT NULL DEFAULT '0',
  `item_12` int(11) NOT NULL DEFAULT '0',
  `item_13` int(11) NOT NULL DEFAULT '0',
  `item_14` int(11) NOT NULL DEFAULT '0',
  `item_15` int(11) NOT NULL DEFAULT '0',
  `item_16` int(11) NOT NULL DEFAULT '0',
  `item_17` int(11) NOT NULL DEFAULT '0',
  `item_18` int(11) NOT NULL DEFAULT '0',
  `item_19` int(11) NOT NULL DEFAULT '0',
  `skin` int(11) NOT NULL,
  `face` int(11) NOT NULL,
  `hairstyle` int(11) NOT NULL,
  `haircolor` int(11) NOT NULL,
  `facialhair` int(11) NOT NULL,
  `outfitId` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;