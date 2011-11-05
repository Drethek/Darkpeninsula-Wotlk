CREATE TABLE `Rewards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `entry` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `comment` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;