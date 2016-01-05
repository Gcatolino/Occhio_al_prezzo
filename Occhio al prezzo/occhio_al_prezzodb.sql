# ************************************************************
# Sequel Pro SQL dump
# Version 4499
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.10)
# Database: sys
# Generation Time: 2016-01-05 16:20:39 +0000
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
	('admin.oap@gmail.com','adm_oap99','Staff','Admin','1981-11-10','Via Silvio Baratta','Salerno','admin'),
	('alfredo.santoro@gmail.com','alfsan','Alfredo','Santoro','1994-07-08','Via Mauri Raffaele','Salerno','utente'),
	('andrea.pilato@gmail.com','password','Andrea','Pilato','1993-03-03','Via Medaglie d oro','Salerno','utente'),
	('anto.calabria@gmail.com','antcal','Antonio','Calabria','1994-04-19','Via Giovanni Falcone','Baronissi','utente'),
	('carr.cam.bas1@gmail.com','carr974','Campobasso','Carrefour','1990-02-23','Via Giambattista Vico','Campobasso','venditore'),
	('carr.sal1@gmail.com','carr714','Salerno','Carrefour','1980-02-14','piazza garibaldi','Salerno','venditore'),
	('conad.nap1@gmail.com','cona211','Napoli','Conad','1970-02-23','Via Mario Palermo','Napoli','venditore'),
	('mario.rossi@gmail.com','marros','Mario','Rossi','1974-03-14','Via del Carmine','Salerno','null'),
	('michele.galiano@gmail.com','password','Michele','Galiano','1993-10-12','Via Martiri Ungheresi','Salerno','utente'),
	('raff.donadio@hotmail.it','rafdon','Raffaele','Donadio','1993-07-26','Via Enrico de Nicola','Baronissi','utente'),
	('rossi@gmail.com','rossi','andre','rossi','1990-12-10','Via del Carmine','salerno','null'),
	('sisa.nap1@gmail.com','sisa325','Napoli','Sisa','1970-02-23','Via Mario Palermo','Napoli','venditore');

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
	('10','alfredo.santoro@gmail.com'),
	('11','alfredo.santoro@gmail.com'),
	('12','alfredo.santoro@gmail.com'),
	('13','alfredo.santoro@gmail.com'),
	('14','alfredo.santoro@gmail.com'),
	('15','alfredo.santoro@gmail.com'),
	('16','alfredo.santoro@gmail.com'),
	('17','alfredo.santoro@gmail.com'),
	('18','alfredo.santoro@gmail.com'),
	('19','alfredo.santoro@gmail.com'),
	('20','alfredo.santoro@gmail.com'),
	('21','alfredo.santoro@gmail.com'),
	('22','alfredo.santoro@gmail.com'),
	('23','alfredo.santoro@gmail.com'),
	('24','alfredo.santoro@gmail.com'),
	('25','alfredo.santoro@gmail.com'),
	('26','alfredo.santoro@gmail.com'),
	('5','alfredo.santoro@gmail.com'),
	('6','alfredo.santoro@gmail.com'),
	('7','alfredo.santoro@gmail.com'),
	('8','alfredo.santoro@gmail.com'),
	('9','alfredo.santoro@gmail.com'),
	('1','mario.rossi@gmail.com'),
	('2','rossi@gmail.com'),
	('3','rossi@gmail.com'),
	('4','rossi@gmail.com');

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
) ENGINE=InnoDB AUTO_INCREMENT=290 DEFAULT CHARSET=hebrew;

LOCK TABLES `Prodotto` WRITE;
/*!40000 ALTER TABLE `Prodotto` DISABLE KEYS */;

INSERT INTO `Prodotto` (`idProdotto`, `marca`, `nome`, `taglia`, `prezzo`, `punto_vendita`, `fk_email`, `data`, `path_immagine`)
VALUES
	(2,'San Carlo','Patatine','100','1','Carrefour','carr.cam.bas1@gmail.com','2011-05-06','http://www.sancarlo.it/common/imgpub/171_173_IT.jpg?0.005958420596761792'),
	(7,'Nastro Azzurro','Birra','330','0.7','Conad','conad.nap1@gmail.com','2012-02-01','http://www.mondobirra.org/fotonius/nastroazzurro.jpg'),
	(8,'Lavazza','caffe','500','3.49','Conad','conad.nap1@gmail.com','2014-02-01','http://i01.i.aliimg.com/photo/v6/108573365/Lavazza_Qualita_Rossa_1_kg_beans_coffee.jpg'),
	(9,'Parmalat','latte','1','0.69','Conad','conad.nap1@gmail.com','2015-02-01','http://www.parmalat.it/image/image_gallery?img_id=50498'),
	(10,'Peroni','Birra','330','1.0','Sisa','sisa.nap1@gmail.com','2011-02-01','http://www.meglioincasa.it/images/0018%20--%20Peroni_Bottiglia%2033%20cl%20(26).JPG'),
	(11,'Carapelli','Olio di oliva','1','2.99','Sisa','sisa.nap1@gmail.com','2011-02-01','http://italianelmondo.oneminutesite.it/files/2015/04/22/asp-0188857_1.jpg'),
	(12,'Ferrero','nutella','625','4.29','Sisa','sisa.nap1@gmail.com','2015-02-01','http://www.sweetsandsnackseurope.com/wp-content/uploads/nutella_destinations.jpg'),
	(13,'Granarolo','latte','1','1.99','Sisa','sisa.nap1@gmail.com','2011-02-01','http://www.gromas.it/wp-content/uploads/2012/01/2-A-Immagine_Granarolo.jpg'),
	(14,'Dash','detersivo liquido','50','6.89','Sisa','sisa.nap1@gmail.com','2013-02-01','http://ecx.images-amazon.com/images/I/81PaobspiZL._SY679_.jpg'),
	(15,'Bauli','Pandoro','1','3.99','Sisa','sisa.nap1@gmail.com','2015-12-09','http://shopitalyonline.com/images//holiday/Bauli/Bauli_Verona_750g.jpg'),
	(16,'Parmalat','latte','1','0.89','Carrefour','carr.cam.bas1@gmail.com','2015-02-01','http://www.parmalat.it/image/image_gallery?img_id=50498'),
	(17,'Parmalat','latte','1','0.99','Sisa','sisa.nap1@gmail.com','2015-02-01','http://www.parmalat.it/image/image_gallery?img_id=50498'),
	(18,'UHT','latte','1','1.19','Carrefour','carr.sal1@gmail.com','2015-06-06','http://www.centralelattediroma.it/media/UHT-PS-1LT-lt.png'),
	(19,'UHT','latte','1','1.09','Sisa','sisa.nap1@gmail.com','2015-06-06','http://www.centralelattediroma.it/media/UHT-PS-1LT-lt.png'),
	(20,'UHT','latte','1','1.49','Carrefour','carr.cam.bas1@gmail.com','2015-06-06','http://www.centralelattediroma.it/media/UHT-PS-1LT-lt.png'),
	(21,'Nastro Azzurro','Birra','330','0.79','Sisa','sisa.nap1@gmail.com','2012-02-01','http://www.mondobirra.org/fotonius/nastroazzurro.jpg'),
	(22,'Valsoia','latte','1','1.99','Conad','conad.nap1@gmail.com','2015-06-06','http://www.centralelattediroma.it/media/UHT-PS-1LT-lt.png'),
	(23,'Valsoia','latte','1','1.79','Carrefour','carr.sal1@gmail.com','2015-02-01','http://www.parmalat.it/image/image_gallery?img_id=50498'),
	(24,'Valsoia','latte','1','0.89','Sisa','sisa.nap1@gmail.com','2015-02-01','http://www.parmalat.it/image/image_gallery?img_id=50498'),
	(26,'Valsoia','latte','1','2.19','Carrefour','carr.cam.bas1@gmail.com','2015-02-01','http://www.parmalat.it/image/image_gallery?img_id=50498'),
	(27,'Granarolo','latte','1','1.98','Sisa','conad.nap1@gmail.com','2011-02-01','http://www.gromas.it/wp-content/uploads/2012/01/2-A-Immagine_Granarolo.jpg'),
	(28,'Granarolo','latte','0.5','0.89','Carrefour','carr.sal1@gmail.com','2015-02-01','http://www.parmalat.it/image/image_gallery?img_id=50498'),
	(29,'Granarolo','latte','1','1.29','Carrefour','carr.cam.bas1@gmail.com','2015-02-01','http://www.parmalat.it/image/image_gallery?img_id=50498'),
	(30,'Nastro Azzurro','Birra','330','0.7','Carrefour','carr.sal1@gmail.com','2012-02-01','http://www.mondobirra.org/fotonius/nastroazzurro.jpg'),
	(31,'Nastro Azzurro','Birra','330','0.99','Conad','carr.cam.bas1@gmail.com','2012-02-01','http://www.mondobirra.org/fotonius/nastroazzurro.jpg'),
	(32,'Peroni','Birra','330','1.10','Conad','conad.nap1@gmail.com','2011-02-01','http://www.meglioincasa.it/images/0018%20--%20Peroni_Bottiglia%2033%20cl%20(26).JPG'),
	(33,'Peroni','Birra','330','1.19','Carrefour','carr.sal1@gmail.com','2011-02-01','http://www.meglioincasa.it/images/0018%20--%20Peroni_Bottiglia%2033%20cl%20(26).JPG'),
	(34,'Peroni','Birra','330','1.09','Carrefour','carr.cam.bas1@gmail.com','2011-02-01','http://www.meglioincasa.it/images/0018%20--%20Peroni_Bottiglia%2033%20cl%20(26).JPG'),
	(35,'Nastro Azzurro','Birra','330','0.78','Conad','conad.nap1@gmail.com','2012-02-01','http://www.mondobirra.org/fotonius/nastroazzurro.jpg'),
	(36,'Heineken','Birra','0.33','1.19','Carrefour','carr.cam.bas1@gmail.com','0029-06-06','https://sakari15.files.wordpress.com/2013/10/ad-of-beer.jpg'),
	(37,'Heineken','Birra','0.33','1.19','Conad','conad.nap1@gmail.com','0029-06-06','https://sakari15.files.wordpress.com/2013/10/ad-of-beer.jpg'),
	(38,'Heineken','Birra','0.33','1.05','Sisa','sisa.nap1@gmail.com','0029-06-06','https://sakari15.files.wordpress.com/2013/10/ad-of-beer.jpg'),
	(39,'Peroni','Birra','660','1.89','Carrefour','carr.cam.bas1@gmail.com','2011-02-01','http://www.meglioincasa.it/images/0018%20--%20Peroni_Bottiglia%2033%20cl%20(26).JPG'),
	(40,'Heineken','Birra','0.66','1.99','Conad','conad.nap1@gmail.com','0029-06-06','https://sakari15.files.wordpress.com/2013/10/ad-of-beer.jpg'),
	(41,'Nastro Azzurro','Birra','660','1.40','Carrefour','carr.sal1@gmail.com','2012-02-01','http://www.mondobirra.org/fotonius/nastroazzurro.jpg'),
	(42,'Moretti','Birra','330','1.09','Carrefour','carr.sal1@gmail.com','2016-01-01','http://www.versiliatoday.it/wp-content/uploads/2013/06/MORETTI.jpg'),
	(43,'Moretti','Birra','330','1.09','Carrefour','carr.cam.bas1@gmail.com','2016-01-01','http://www.versiliatoday.it/wp-content/uploads/2013/06/MORETTI.jpg'),
	(44,'Moretti','Birra','330','1.19','Conad','conad.nap1@gmail.com','2016-01-01','http://www.versiliatoday.it/wp-content/uploads/2013/06/MORETTI.jpg'),
	(45,'Moretti','Birra','330','1.29','Sisa','sisa.nap1@gmail.com','2016-01-01','http://www.versiliatoday.it/wp-content/uploads/2013/06/MORETTI.jpg'),
	(267,'AIA','Albume','0.4l','1.19','Carrefour','carr.sal1@gmail.com','2015-12-22','http://www.baldoalberti.it/public//2010/02/albume-aia.jpeg'),
	(285,'Heineken','Birra','0.33','1.29','Carrefour','carr.sal1@gmail.com','0029-06-06','https://sakari15.files.wordpress.com/2013/10/ad-of-beer.jpg'),
	(286,'UHT','latte','1','1.15','Conad','conad.nap1@gmail.com','2015-06-06','http://www.centralelattediroma.it/media/UHT-PS-1LT-lt.png'),
	(287,'AIA','Albume','0.4l','0.99','Carrefour','carr.cam.bas1@gmail.com','2015-12-22','http://www.baldoalberti.it/public//2010/02/albume-aia.jpeg'),
	(288,'San Carlo','Patatine','100','1','Carrefour','carr.cam.bas1@gmail.com','2011-05-06','http://www.sancarlo.it/common/imgpub/171_173_IT.jpg?0.005958420596761792'),
	(289,'Granarolo','latte','0.5','0.89','Carrefour','carr.sal1@gmail.com','2015-02-01','http://www.parmalat.it/image/image_gallery?img_id=50498');

/*!40000 ALTER TABLE `Prodotto` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
