# ************************************************************
# Sequel Pro SQL dump
# Version 4499
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.10)
# Database: sys
# Generation Time: 2015-12-11 15:36:56 +0000
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
  `data_di_nascita` date DEFAULT NULL,
  `domicilio` varchar(40) DEFAULT NULL,
  `comune_di_residenza` varchar(40) DEFAULT NULL,
  `ruolo` varchar(15) NOT NULL DEFAULT 'utente',
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=hebrew;

LOCK TABLES `Account` WRITE;
/*!40000 ALTER TABLE `Account` DISABLE KEYS */;

INSERT INTO `Account` (`email`, `password`, `nome`, `cognome`, `data_di_nascita`, `domicilio`, `comune_di_residenza`, `ruolo`)
VALUES
	('a@gmail.com','baobao','miao','bao','1980-02-14','piazza garibaldi','salerno','venditore'),
	('gemma@hotmail.it','miaomiao','gemma','catolino','1991-01-31','via gaudo','baranello','utente'),
	('miao@gmail.com','baobao','miao','bao','1990-02-23','via ciao','campobasso','venditore'),
	('sisa@gmail.com','baobao','miao','bao','1970-02-23','via mario palermo','napoli','venditore'),
	('ven@gmail.com','baobao','miao','bao','1970-02-23','via mario palermo','napoli','venditore');

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
  `fk_idProdotto` int(15) NOT NULL,
  PRIMARY KEY (`fk_idCarrello`,`fk_idProdotto`),
  KEY `fk_idProdotto` (`fk_idProdotto`),
  CONSTRAINT `composizione_ibfk_1` FOREIGN KEY (`fk_idCarrello`) REFERENCES `Carrello` (`idCarrello`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `composizione_ifbk_2` FOREIGN KEY (`fk_idProdotto`) REFERENCES `Prodotto` (`idProdotto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=hebrew;

LOCK TABLES `Composizione` WRITE;
/*!40000 ALTER TABLE `Composizione` DISABLE KEYS */;

INSERT INTO `Composizione` (`fk_idCarrello`, `fk_idProdotto`)
VALUES
	('1',12);

/*!40000 ALTER TABLE `Composizione` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Prodotto
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Prodotto`;

CREATE TABLE `Prodotto` (
  `idProdotto` int(15) NOT NULL AUTO_INCREMENT,
  `marca` varchar(15) NOT NULL DEFAULT '',
  `nome` varchar(20) NOT NULL DEFAULT '',
  `taglia` varchar(10) NOT NULL DEFAULT '',
  `prezzo` varchar(7) NOT NULL DEFAULT '',
  `punto_vendita` varchar(20) NOT NULL DEFAULT '',
  `fk_email` varchar(25) NOT NULL,
  `data` date NOT NULL,
  `path_immagine` varchar(255) DEFAULT '',
  PRIMARY KEY (`idProdotto`),
  KEY `fk_email` (`fk_email`),
  CONSTRAINT `prodotto_ibfk_1` FOREIGN KEY (`fk_email`) REFERENCES `Account` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=hebrew;

LOCK TABLES `Prodotto` WRITE;
/*!40000 ALTER TABLE `Prodotto` DISABLE KEYS */;

INSERT INTO `Prodotto` (`idProdotto`, `marca`, `nome`, `taglia`, `prezzo`, `punto_vendita`, `fk_email`, `data`, `path_immagine`)
VALUES
	(1,'Heineken','Birra','330','1.2','Carrefour','miao@gmail.com','2012-02-01',NULL),
	(2,'San Carlo','Patatine','100','1','Carrefour','miao@gmail.com','2011-05-06',NULL),
	(3,'Mulino bianco','abbracci','500','2.75','Carrefour','miao@gmail.com','2012-12-02',NULL),
	(4,'Pavesi','pavesini','375','2.2','Deco','a@gmail.com','2011-02-01',NULL),
	(5,'San Carlo','Patatine','300','1.1','Deco','a@gmail.com','2011-02-01',NULL),
	(6,'Asiago','formaggio','1','14.9','Deco','a@gmail.com','2010-01-31',NULL),
	(7,'Nastro Azzurro','Birra','330','0.7','Conad','ven@gmail.com','2012-02-01',NULL),
	(8,'Lavazza','caffe','500','3.49','Conad','ven@gmail.com','2014-02-01',NULL),
	(9,'Parmalat','latte','1','0.69','Conad','ven@gmail.com','2015-02-01',NULL),
	(10,'Heineken','Birra','330','1.0','Sisa','sisa@gmail.com','2011-02-01',NULL),
	(11,'Carapelli','Olio di oliva','1','2.99','Sisa','sisa@gmail.com','2011-02-01',NULL),
	(12,'Ferrero','nutella','625','4.29','Sisa','sisa@gmail.com','2015-02-01',NULL),
	(13,'Granarolo','latte','1','1.99','Sisa','sisa@gmail.com','2011-02-01',NULL),
	(14,'Dash','detersivo liquido','50','6.89','Sisa','sisa@gmail.com','2013-02-01',NULL),
	(15,'Bauli','Pandoro','1','3.99','Sisa','sisa@gmail.com','2015-12-09',NULL);

/*!40000 ALTER TABLE `Prodotto` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
