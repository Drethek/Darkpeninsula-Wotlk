--
-- LOGS DATABASE
--

--
-- Struttura della tabella `Players_Items`
--

CREATE TABLE IF NOT EXISTS `Players_Items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `received` tinyint(1) NOT NULL,
  `created` tinyint(1) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=0;

--
-- Struttura della tabella `Players_Kills`
--

CREATE TABLE IF NOT EXISTS `Players_Kills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entry` int(11) NOT NULL,
  `killer` int(11) NOT NULL,
  `raid` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=0;

--
-- Struttura della tabella `Players_Groups`
--

CREATE TABLE IF NOT EXISTS `Players_Groups` (
  `raid` int(11) NOT NULL,
  `player` int(11) NOT NULL,
  UNIQUE KEY `raid` (`raid`,`player`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
