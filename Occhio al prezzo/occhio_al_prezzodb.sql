# ************************************************************
# Sequel Pro SQL dump
# Version 4499
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.10)
# Database: OcchioAlPrezzo
# Generation Time: 2015-12-08 13:49:53 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table Account
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Account`;

CREATE TABLE `Account` (
  `email` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `nome` varchar(25) DEFAULT NULL,
  `cognome` varchar(25) DEFAULT NULL,
  `data di nascita` date DEFAULT NULL,
  `domicilio` varchar(40) DEFAULT NULL,
  `comune di residenza` varchar(40) DEFAULT NULL,
  `ruolo` varchar(15) NOT NULL DEFAULT 'utente',
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=hebrew;

LOCK TABLES `Account` WRITE;
/*!40000 ALTER TABLE `Account` DISABLE KEYS */;

INSERT INTO `Account` (`email`, `password`, `nome`, `cognome`, `data di nascita`, `domicilio`, `comune di residenza`, `ruolo`)
VALUES
	('gemma@hotmail.it','miaomiao','gemma','catolino','1991-01-31','via gaudo','baranello','utente'),
	('miao@gmail.com','baobao','miao','bao','1990-02-23','via ciao','campobasso','venditore');

/*!40000 ALTER TABLE `Account` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Carrello
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Carrello`;

CREATE TABLE `Carrello` (
  `idCarrello` varchar(25) NOT NULL,
  `fk_email` varchar(25) NOT NULL,
  PRIMARY KEY (`idCarrello`),
  KEY `fk_email` (`fk_email`),
  CONSTRAINT `carrello_ibfk_1` FOREIGN KEY (`fk_email`) REFERENCES `account` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=hebrew;

LOCK TABLES `Carrello` WRITE;
/*!40000 ALTER TABLE `Carrello` DISABLE KEYS */;

INSERT INTO `Carrello` (`idCarrello`, `fk_email`)
VALUES
	('1','gemma@hotmail.it');

/*!40000 ALTER TABLE `Carrello` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Composizione
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Composizione`;

CREATE TABLE `Composizione` (
  `fk_idCarrello` varchar(25) NOT NULL,
  `fk_idProdotto` varchar(15) NOT NULL,
  PRIMARY KEY (`fk_idCarrello`,`fk_idProdotto`),
  KEY `fk_idProdotto` (`fk_idProdotto`),
  CONSTRAINT `composizione_ibfk_1` FOREIGN KEY (`fk_idCarrello`) REFERENCES `Carrello` (`idCarrello`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `composizione_ibfk_2` FOREIGN KEY (`fk_idProdotto`) REFERENCES `prodotto` (`idProdotto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=hebrew;

LOCK TABLES `Composizione` WRITE;
/*!40000 ALTER TABLE `Composizione` DISABLE KEYS */;

INSERT INTO `Composizione` (`fk_idCarrello`, `fk_idProdotto`)
VALUES
	('1','2');

/*!40000 ALTER TABLE `Composizione` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Prodotto
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Prodotto`;

CREATE TABLE `Prodotto` (
  `idProdotto` varchar(15) NOT NULL,
  `marca` varchar(15) NOT NULL DEFAULT '',
  `nome` varchar(20) NOT NULL DEFAULT '',
  `taglia` varchar(10) NOT NULL DEFAULT '',
  `prezzo` varchar(7) NOT NULL DEFAULT '',
  `punto_vendita` varchar(20) NOT NULL DEFAULT '',
  `fk_email` varchar(25) NOT NULL,
  `data` date NOT NULL,
  PRIMARY KEY (`idProdotto`),
  KEY `fk_email` (`fk_email`),
  CONSTRAINT `prodotto_ibfk_1` FOREIGN KEY (`fk_email`) REFERENCES `account` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=hebrew;

LOCK TABLES `Prodotto` WRITE;
/*!40000 ALTER TABLE `Prodotto` DISABLE KEYS */;

INSERT INTO `Prodotto` (`idProdotto`, `marca`, `nome`, `taglia`, `prezzo`, `punto vendita`, `fk_email`, `data`)
VALUES
	('2','forst','birra','300','2,50','conad','miao@gmail.com','2010-01-31');

/*!40000 ALTER TABLE `Prodotto` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
