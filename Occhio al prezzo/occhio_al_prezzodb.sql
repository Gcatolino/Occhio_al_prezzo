# ************************************************************
# Sequel Pro SQL dump
# Version 4499
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.10)
# Database: sys
# Generation Time: 2015-12-28 16:43:29 +0000
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
  `email` varchar(40) NOT NULL DEFAULT '',
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
	('andrea.pilato@gmail.com','password','Andrea','Pilato','1993-03-03','Via Medaglie d\'oro','Salerno','utente'),
	('anto.calabria@gmail.com','antcal','Antonio','Calabria','1994-04-19','Via Giovanni Falcone','Baronissi','utente'),
	('carr.cam.bas1@gmail.com','carr974','Campobasso','Carrefour','1990-02-23','Via Giambattista Vico','Campobasso','venditore'),
	('carr.sal1@gmail.com','carr714','Salerno','Carrefour','1980-02-14','piazza garibaldi','Salerno','venditore'),
	('conad.nap1@gmail.com','cona211','Napoli','Conad','1970-02-23','Via Mario Palermo','Napoli','venditore'),
	('mario.rossi@gmail.com','marros','Mario','Rossi','1974-03-15','Via del Carmine','Salerno','utente'),
	('michele.galiano@gmail.com','password','Michele','Galiano','1993-10-12','Via Martiri Ungheresi','Salerno','utente'),
	('raff.donadio@hotmail.it','rafdon','Raffaele','Donadio','1993-07-26','Via Enrico de Nicola','Baronissi','utente'),
	('sisa.nap1@gmail.com','sisa325','Napoli','Sisa','1970-02-23','Via Mario Palermo','Napoli','venditore');

/*!40000 ALTER TABLE `Account` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Carrello
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Carrello`;

CREATE TABLE `Carrello` (
  `idCarrello` int(25) NOT NULL AUTO_INCREMENT,
  `fk_email` varchar(25) NOT NULL,
  PRIMARY KEY (`idCarrello`),
  KEY `fk_email` (`fk_email`),
  CONSTRAINT `carrello_ibfk_1` FOREIGN KEY (`fk_email`) REFERENCES `Account` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=hebrew;



# Dump of table Composizione
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Composizione`;

CREATE TABLE `Composizione` (
  `fk_idCarrello` int(25) NOT NULL AUTO_INCREMENT,
  `fk_idProdotto` int(15) NOT NULL,
  PRIMARY KEY (`fk_idCarrello`,`fk_idProdotto`),
  KEY `fk_idProdotto` (`fk_idProdotto`),
  CONSTRAINT `composizione_ibfk_1` FOREIGN KEY (`fk_idCarrello`) REFERENCES `Carrello` (`idCarrello`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `composizione_ifbk_2` FOREIGN KEY (`fk_idProdotto`) REFERENCES `Prodotto` (`idProdotto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=hebrew;



# Dump of table host_summary
# ------------------------------------------------------------

DROP VIEW IF EXISTS `host_summary`;

CREATE TABLE `host_summary` (
   `host` VARCHAR(60) NULL DEFAULT NULL,
   `statements` DECIMAL(64) NULL DEFAULT NULL,
   `statement_latency` TEXT NULL DEFAULT NULL,
   `statement_avg_latency` TEXT NULL DEFAULT NULL,
   `table_scans` DECIMAL(65) NULL DEFAULT NULL,
   `file_ios` DECIMAL(64) NULL DEFAULT NULL,
   `file_io_latency` TEXT NULL DEFAULT NULL,
   `current_connections` DECIMAL(41) NULL DEFAULT NULL,
   `total_connections` DECIMAL(41) NULL DEFAULT NULL,
   `unique_users` BIGINT(21) NOT NULL DEFAULT '0',
   `current_memory` TEXT NULL DEFAULT NULL,
   `total_memory_allocated` TEXT NULL DEFAULT NULL
) ENGINE=MyISAM;



# Dump of table host_summary_by_file_io
# ------------------------------------------------------------

DROP VIEW IF EXISTS `host_summary_by_file_io`;

CREATE TABLE `host_summary_by_file_io` (
   `host` VARCHAR(60) NULL DEFAULT NULL,
   `ios` DECIMAL(42) NULL DEFAULT NULL,
   `io_latency` TEXT NULL DEFAULT NULL
) ENGINE=MyISAM;



# Dump of table host_summary_by_file_io_type
# ------------------------------------------------------------

DROP VIEW IF EXISTS `host_summary_by_file_io_type`;

CREATE TABLE `host_summary_by_file_io_type` (
   `host` VARCHAR(60) NULL DEFAULT NULL,
   `event_name` VARCHAR(128) NOT NULL,
   `total` BIGINT(20) UNSIGNED NOT NULL,
   `total_latency` TEXT NULL DEFAULT NULL,
   `max_latency` TEXT NULL DEFAULT NULL
) ENGINE=MyISAM;



# Dump of table host_summary_by_stages
# ------------------------------------------------------------

DROP VIEW IF EXISTS `host_summary_by_stages`;

CREATE TABLE `host_summary_by_stages` (
   `host` VARCHAR(60) NULL DEFAULT NULL,
   `event_name` VARCHAR(128) NOT NULL,
   `total` BIGINT(20) UNSIGNED NOT NULL,
   `total_latency` TEXT NULL DEFAULT NULL,
   `avg_latency` TEXT NULL DEFAULT NULL
) ENGINE=MyISAM;



# Dump of table host_summary_by_statement_latency
# ------------------------------------------------------------

DROP VIEW IF EXISTS `host_summary_by_statement_latency`;

CREATE TABLE `host_summary_by_statement_latency` (
   `host` VARCHAR(60) NULL DEFAULT NULL,
   `total` DECIMAL(42) NULL DEFAULT NULL,
   `total_latency` TEXT NULL DEFAULT NULL,
   `max_latency` TEXT NULL DEFAULT NULL,
   `lock_latency` TEXT NULL DEFAULT NULL,
   `rows_sent` DECIMAL(42) NULL DEFAULT NULL,
   `rows_examined` DECIMAL(42) NULL DEFAULT NULL,
   `rows_affected` DECIMAL(42) NULL DEFAULT NULL,
   `full_scans` DECIMAL(43) NULL DEFAULT NULL
) ENGINE=MyISAM;



# Dump of table host_summary_by_statement_type
# ------------------------------------------------------------

DROP VIEW IF EXISTS `host_summary_by_statement_type`;

CREATE TABLE `host_summary_by_statement_type` (
   `host` VARCHAR(60) NULL DEFAULT NULL,
   `statement` VARCHAR(128) NULL DEFAULT NULL,
   `total` BIGINT(20) UNSIGNED NOT NULL,
   `total_latency` TEXT NULL DEFAULT NULL,
   `max_latency` TEXT NULL DEFAULT NULL,
   `lock_latency` TEXT NULL DEFAULT NULL,
   `rows_sent` BIGINT(20) UNSIGNED NOT NULL,
   `rows_examined` BIGINT(20) UNSIGNED NOT NULL,
   `rows_affected` BIGINT(20) UNSIGNED NOT NULL,
   `full_scans` BIGINT(21) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM;



# Dump of table innodb_buffer_stats_by_schema
# ------------------------------------------------------------

DROP VIEW IF EXISTS `innodb_buffer_stats_by_schema`;

CREATE TABLE `innodb_buffer_stats_by_schema` (
   `object_schema` TEXT NULL DEFAULT NULL,
   `allocated` TEXT NULL DEFAULT NULL,
   `data` TEXT NULL DEFAULT NULL,
   `pages` BIGINT(21) NOT NULL DEFAULT '0',
   `pages_hashed` BIGINT(21) NOT NULL DEFAULT '0',
   `pages_old` BIGINT(21) NOT NULL DEFAULT '0',
   `rows_cached` DECIMAL(44) NULL DEFAULT NULL
) ENGINE=MyISAM;



# Dump of table innodb_buffer_stats_by_table
# ------------------------------------------------------------

DROP VIEW IF EXISTS `innodb_buffer_stats_by_table`;

CREATE TABLE `innodb_buffer_stats_by_table` (
   `object_schema` TEXT NULL DEFAULT NULL,
   `object_name` TEXT NULL DEFAULT NULL,
   `allocated` TEXT NULL DEFAULT NULL,
   `data` TEXT NULL DEFAULT NULL,
   `pages` BIGINT(21) NOT NULL DEFAULT '0',
   `pages_hashed` BIGINT(21) NOT NULL DEFAULT '0',
   `pages_old` BIGINT(21) NOT NULL DEFAULT '0',
   `rows_cached` DECIMAL(44) NULL DEFAULT NULL
) ENGINE=MyISAM;



# Dump of table innodb_lock_waits
# ------------------------------------------------------------

DROP VIEW IF EXISTS `innodb_lock_waits`;

CREATE TABLE `innodb_lock_waits` (
   `wait_started` DATETIME NULL DEFAULT NULL,
   `wait_age` TIME NULL DEFAULT NULL,
   `wait_age_secs` BIGINT(21) NULL DEFAULT NULL,
   `locked_table` VARCHAR(1024) NOT NULL DEFAULT '',
   `locked_index` VARCHAR(1024) NULL DEFAULT NULL,
   `locked_type` VARCHAR(32) NOT NULL DEFAULT '',
   `waiting_trx_id` VARCHAR(18) NOT NULL DEFAULT '',
   `waiting_trx_started` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
   `waiting_trx_age` TIME NULL DEFAULT NULL,
   `waiting_trx_rows_locked` BIGINT(21) UNSIGNED NOT NULL DEFAULT '0',
   `waiting_trx_rows_modified` BIGINT(21) UNSIGNED NOT NULL DEFAULT '0',
   `waiting_pid` BIGINT(21) UNSIGNED NOT NULL DEFAULT '0',
   `waiting_query` LONGTEXT NULL DEFAULT NULL,
   `waiting_lock_id` VARCHAR(81) NOT NULL DEFAULT '',
   `waiting_lock_mode` VARCHAR(32) NOT NULL DEFAULT '',
   `blocking_trx_id` VARCHAR(18) NOT NULL DEFAULT '',
   `blocking_pid` BIGINT(21) UNSIGNED NOT NULL DEFAULT '0',
   `blocking_query` LONGTEXT NULL DEFAULT NULL,
   `blocking_lock_id` VARCHAR(81) NOT NULL DEFAULT '',
   `blocking_lock_mode` VARCHAR(32) NOT NULL DEFAULT '',
   `blocking_trx_started` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
   `blocking_trx_age` TIME NULL DEFAULT NULL,
   `blocking_trx_rows_locked` BIGINT(21) UNSIGNED NOT NULL DEFAULT '0',
   `blocking_trx_rows_modified` BIGINT(21) UNSIGNED NOT NULL DEFAULT '0',
   `sql_kill_blocking_query` VARCHAR(32) NULL DEFAULT NULL,
   `sql_kill_blocking_connection` VARCHAR(26) NULL DEFAULT NULL
) ENGINE=MyISAM;



# Dump of table io_by_thread_by_latency
# ------------------------------------------------------------

DROP VIEW IF EXISTS `io_by_thread_by_latency`;

CREATE TABLE `io_by_thread_by_latency` (
   `user` VARCHAR(128) NULL DEFAULT NULL,
   `total` DECIMAL(42) NULL DEFAULT NULL,
   `total_latency` TEXT NULL DEFAULT NULL,
   `min_latency` TEXT NULL DEFAULT NULL,
   `avg_latency` TEXT NULL DEFAULT NULL,
   `max_latency` TEXT NULL DEFAULT NULL,
   `thread_id` BIGINT(20) UNSIGNED NOT NULL,
   `processlist_id` BIGINT(20) UNSIGNED NULL DEFAULT NULL
) ENGINE=MyISAM;



# Dump of table io_global_by_file_by_bytes
# ------------------------------------------------------------

DROP VIEW IF EXISTS `io_global_by_file_by_bytes`;

CREATE TABLE `io_global_by_file_by_bytes` (
   `file` VARCHAR(512) NULL DEFAULT NULL,
   `count_read` BIGINT(20) UNSIGNED NOT NULL,
   `total_read` TEXT NULL DEFAULT NULL,
   `avg_read` TEXT NULL DEFAULT NULL,
   `count_write` BIGINT(20) UNSIGNED NOT NULL,
   `total_written` TEXT NULL DEFAULT NULL,
   `avg_write` TEXT NULL DEFAULT NULL,
   `total` TEXT NULL DEFAULT NULL,
   `write_pct` DECIMAL(26) NOT NULL DEFAULT '0.00'
) ENGINE=MyISAM;



# Dump of table io_global_by_file_by_latency
# ------------------------------------------------------------

DROP VIEW IF EXISTS `io_global_by_file_by_latency`;

CREATE TABLE `io_global_by_file_by_latency` (
   `file` VARCHAR(512) NULL DEFAULT NULL,
   `total` BIGINT(20) UNSIGNED NOT NULL,
   `total_latency` TEXT NULL DEFAULT NULL,
   `count_read` BIGINT(20) UNSIGNED NOT NULL,
   `read_latency` TEXT NULL DEFAULT NULL,
   `count_write` BIGINT(20) UNSIGNED NOT NULL,
   `write_latency` TEXT NULL DEFAULT NULL,
   `count_misc` BIGINT(20) UNSIGNED NOT NULL,
   `misc_latency` TEXT NULL DEFAULT NULL
) ENGINE=MyISAM;



# Dump of table io_global_by_wait_by_bytes
# ------------------------------------------------------------

DROP VIEW IF EXISTS `io_global_by_wait_by_bytes`;

CREATE TABLE `io_global_by_wait_by_bytes` (
   `event_name` VARCHAR(128) NULL DEFAULT NULL,
   `total` BIGINT(20) UNSIGNED NOT NULL,
   `total_latency` TEXT NULL DEFAULT NULL,
   `min_latency` TEXT NULL DEFAULT NULL,
   `avg_latency` TEXT NULL DEFAULT NULL,
   `max_latency` TEXT NULL DEFAULT NULL,
   `count_read` BIGINT(20) UNSIGNED NOT NULL,
   `total_read` TEXT NULL DEFAULT NULL,
   `avg_read` TEXT NULL DEFAULT NULL,
   `count_write` BIGINT(20) UNSIGNED NOT NULL,
   `total_written` TEXT NULL DEFAULT NULL,
   `avg_written` TEXT NULL DEFAULT NULL,
   `total_requested` TEXT NULL DEFAULT NULL
) ENGINE=MyISAM;



# Dump of table io_global_by_wait_by_latency
# ------------------------------------------------------------

DROP VIEW IF EXISTS `io_global_by_wait_by_latency`;

CREATE TABLE `io_global_by_wait_by_latency` (
   `event_name` VARCHAR(128) NULL DEFAULT NULL,
   `total` BIGINT(20) UNSIGNED NOT NULL,
   `total_latency` TEXT NULL DEFAULT NULL,
   `avg_latency` TEXT NULL DEFAULT NULL,
   `max_latency` TEXT NULL DEFAULT NULL,
   `read_latency` TEXT NULL DEFAULT NULL,
   `write_latency` TEXT NULL DEFAULT NULL,
   `misc_latency` TEXT NULL DEFAULT NULL,
   `count_read` BIGINT(20) UNSIGNED NOT NULL,
   `total_read` TEXT NULL DEFAULT NULL,
   `avg_read` TEXT NULL DEFAULT NULL,
   `count_write` BIGINT(20) UNSIGNED NOT NULL,
   `total_written` TEXT NULL DEFAULT NULL,
   `avg_written` TEXT NULL DEFAULT NULL
) ENGINE=MyISAM;



# Dump of table latest_file_io
# ------------------------------------------------------------

DROP VIEW IF EXISTS `latest_file_io`;

CREATE TABLE `latest_file_io` (
   `thread` VARCHAR(149) NULL DEFAULT NULL,
   `file` VARCHAR(512) NULL DEFAULT NULL,
   `latency` TEXT NULL DEFAULT NULL,
   `operation` VARCHAR(32) NOT NULL,
   `requested` TEXT NULL DEFAULT NULL
) ENGINE=MyISAM;



# Dump of table memory_by_host_by_current_bytes
# ------------------------------------------------------------

DROP VIEW IF EXISTS `memory_by_host_by_current_bytes`;

CREATE TABLE `memory_by_host_by_current_bytes` (
   `host` VARCHAR(60) NULL DEFAULT NULL,
   `current_count_used` DECIMAL(41) NULL DEFAULT NULL,
   `current_allocated` TEXT NULL DEFAULT NULL,
   `current_avg_alloc` TEXT NULL DEFAULT NULL,
   `current_max_alloc` TEXT NULL DEFAULT NULL,
   `total_allocated` TEXT NULL DEFAULT NULL
) ENGINE=MyISAM;



# Dump of table memory_by_thread_by_current_bytes
# ------------------------------------------------------------

DROP VIEW IF EXISTS `memory_by_thread_by_current_bytes`;

CREATE TABLE `memory_by_thread_by_current_bytes` (
   `thread_id` BIGINT(20) UNSIGNED NOT NULL,
   `user` VARCHAR(128) NULL DEFAULT NULL,
   `current_count_used` DECIMAL(41) NULL DEFAULT NULL,
   `current_allocated` TEXT NULL DEFAULT NULL,
   `current_avg_alloc` TEXT NULL DEFAULT NULL,
   `current_max_alloc` TEXT NULL DEFAULT NULL,
   `total_allocated` TEXT NULL DEFAULT NULL
) ENGINE=MyISAM;



# Dump of table memory_by_user_by_current_bytes
# ------------------------------------------------------------

DROP VIEW IF EXISTS `memory_by_user_by_current_bytes`;

CREATE TABLE `memory_by_user_by_current_bytes` (
   `user` VARCHAR(32) NULL DEFAULT NULL,
   `current_count_used` DECIMAL(41) NULL DEFAULT NULL,
   `current_allocated` TEXT NULL DEFAULT NULL,
   `current_avg_alloc` TEXT NULL DEFAULT NULL,
   `current_max_alloc` TEXT NULL DEFAULT NULL,
   `total_allocated` TEXT NULL DEFAULT NULL
) ENGINE=MyISAM;



# Dump of table memory_global_by_current_bytes
# ------------------------------------------------------------

DROP VIEW IF EXISTS `memory_global_by_current_bytes`;

CREATE TABLE `memory_global_by_current_bytes` (
   `event_name` VARCHAR(128) NOT NULL,
   `current_count` BIGINT(20) NOT NULL,
   `current_alloc` TEXT NULL DEFAULT NULL,
   `current_avg_alloc` TEXT NULL DEFAULT NULL,
   `high_count` BIGINT(20) NOT NULL,
   `high_alloc` TEXT NULL DEFAULT NULL,
   `high_avg_alloc` TEXT NULL DEFAULT NULL
) ENGINE=MyISAM;



# Dump of table memory_global_total
# ------------------------------------------------------------

DROP VIEW IF EXISTS `memory_global_total`;

CREATE TABLE `memory_global_total` (
   `total_allocated` TEXT NULL DEFAULT NULL
) ENGINE=MyISAM;



# Dump of table metrics
# ------------------------------------------------------------

DROP VIEW IF EXISTS `metrics`;

CREATE TABLE `metrics` (
   `Variable_name` VARCHAR(193) NULL DEFAULT NULL,
   `Variable_value` TEXT NULL DEFAULT NULL,
   `Type` VARCHAR(210) NULL DEFAULT NULL,
   `Enabled` VARCHAR(7) NOT NULL DEFAULT ''
) ENGINE=MyISAM;



# Dump of table processlist
# ------------------------------------------------------------

DROP VIEW IF EXISTS `processlist`;

CREATE TABLE `processlist` (
   `thd_id` BIGINT(20) UNSIGNED NOT NULL,
   `conn_id` BIGINT(20) UNSIGNED NULL DEFAULT NULL,
   `user` VARCHAR(128) NULL DEFAULT NULL,
   `db` VARCHAR(64) NULL DEFAULT NULL,
   `command` VARCHAR(16) NULL DEFAULT NULL,
   `state` VARCHAR(64) NULL DEFAULT NULL,
   `time` BIGINT(20) NULL DEFAULT NULL,
   `current_statement` LONGTEXT NULL DEFAULT NULL,
   `statement_latency` TEXT NULL DEFAULT NULL,
   `progress` DECIMAL(26) NULL DEFAULT NULL,
   `lock_latency` TEXT NULL DEFAULT NULL,
   `rows_examined` BIGINT(20) UNSIGNED NULL DEFAULT NULL,
   `rows_sent` BIGINT(20) UNSIGNED NULL DEFAULT NULL,
   `rows_affected` BIGINT(20) UNSIGNED NULL DEFAULT NULL,
   `tmp_tables` BIGINT(20) UNSIGNED NULL DEFAULT NULL,
   `tmp_disk_tables` BIGINT(20) UNSIGNED NULL DEFAULT NULL,
   `full_scan` VARCHAR(3) NOT NULL DEFAULT '',
   `last_statement` LONGTEXT NULL DEFAULT NULL,
   `last_statement_latency` TEXT NULL DEFAULT NULL,
   `current_memory` TEXT NULL DEFAULT NULL,
   `last_wait` VARCHAR(128) NULL DEFAULT NULL,
   `last_wait_latency` TEXT NULL DEFAULT NULL,
   `source` VARCHAR(64) NULL DEFAULT NULL,
   `trx_latency` TEXT NULL DEFAULT NULL,
   `trx_state` ENUM('ACTIVE','COMMITTED','ROLLED BACK') NULL DEFAULT NULL,
   `trx_autocommit` ENUM('YES','NO') NULL DEFAULT NULL,
   `pid` VARCHAR(1024) NULL DEFAULT NULL,
   `program_name` VARCHAR(1024) NULL DEFAULT NULL
) ENGINE=MyISAM;



# Dump of table Prodotto
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Prodotto`;

CREATE TABLE `Prodotto` (
  `idProdotto` int(15) NOT NULL AUTO_INCREMENT,
  `marca` varchar(15) NOT NULL,
  `nome` varchar(20) NOT NULL,
  `taglia` varchar(10) NOT NULL,
  `prezzo` varchar(7) NOT NULL,
  `punto_vendita` varchar(20) NOT NULL,
  `fk_email` varchar(25) NOT NULL,
  `data` date NOT NULL,
  `path_immagine` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idProdotto`),
  KEY `fk_email` (`fk_email`),
  CONSTRAINT `prodotto_ibfk_1` FOREIGN KEY (`fk_email`) REFERENCES `Account` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=324 DEFAULT CHARSET=hebrew;

LOCK TABLES `Prodotto` WRITE;
/*!40000 ALTER TABLE `Prodotto` DISABLE KEYS */;

INSERT INTO `Prodotto` (`idProdotto`, `marca`, `nome`, `taglia`, `prezzo`, `punto_vendita`, `fk_email`, `data`, `path_immagine`)
VALUES
	(2,'San Carlo','Patatine','100','1','Carrefour','carr.cam.bas1@gmail.com','2011-05-06',NULL),
	(7,'Nastro Azzurro','Birra','330','0.7','Conad','conad.nap1@gmail.com','2012-02-01',NULL),
	(8,'Lavazza','caffe','500','3.49','Conad','conad.nap1@gmail.com','2014-02-01',NULL),
	(9,'Parmalat','latte','1','0.69','Conad','conad.nap1@gmail.com','2015-02-01',NULL),
	(10,'Heineken','Birra','330','1.0','Sisa','sisa.nap1@gmail.com','2011-02-01',NULL),
	(11,'Carapelli','Olio di oliva','1','2.99','Sisa','sisa.nap1@gmail.com','2011-02-01',NULL),
	(12,'Ferrero','nutella','625','4.29','Sisa','sisa.nap1@gmail.com','2015-02-01',NULL),
	(13,'Granarolo','latte','1','1.99','Sisa','sisa.nap1@gmail.com','2011-02-01',NULL),
	(14,'Dash','detersivo liquido','50','6.89','Sisa','sisa.nap1@gmail.com','2013-02-01',NULL),
	(15,'Bauli','Pandoro','1','3.99','Sisa','sisa.nap1@gmail.com','2015-12-09',NULL),
	(225,'Bax','BBx','1','1.79','carrefour','carr.sal1@gmail.com','2016-12-05','http://giotto.ibs.it/cop/cop.aspx?s=B&f=70&e=9788806191870'),
	(267,'AIA','Albume','0.4l','1.19','Carrefour','carr.sal1@gmail.com','2015-12-22',''),
	(275,'AA','aa','11','1.0','Carr','carr.sal1@gmail.com','1912-12-12',''),
	(276,'AA','bb','2','2.0','c','carr.sal1@gmail.com','1999-04-01',''),
	(277,'a','a','1','1.0','Carrefour','carr.sal1@gmail.com','2015-12-19',''),
	(278,'aa','aa','1','1.0','c','carr.sal1@gmail.com','1999-12-12',''),
	(279,'AA','AA','1','1.2','Carrefour','carr.sal1@gmail.com','1999-12-12',''),
	(280,'a','aa','1','1.2','Carrefour','carr.sal1@gmail.com','1992-12-12',''),
	(281,'AA','AA','1','1.2','C','carr.sal1@gmail.com','1998-12-12',''),
	(282,'Aa','aa','0.5','1.8','CARREFOUR','carr.sal1@gmail.com','1999-01-17',''),
	(283,'a','a','1','1.6','Carrefour','carr.sal1@gmail.com','2015-12-19',''),
	(284,'aa','aa','1','1.0','Carr','carr.sal1@gmail.com','2017-11-11',''),
	(285,'Heineken','birra','0.33','1.29','Carrefour','carr.sal1@gmail.com','0029-06-06','null'),
	(286,'Heineken','birra','0.33','1.29','Carrefour','carr.sal1@gmail.com','0029-06-06','null'),
	(287,'Heineken','birra','0.33','1.29','Carrefour','carr.sal1@gmail.com','0029-06-06','null'),
	(288,'Heineken','birra','0.33','1.29','Carrefour','carr.sal1@gmail.com','0029-06-06','null'),
	(289,'Heineken','birra','0.33','1.29','Carrefour','carr.sal1@gmail.com','0029-06-06','null'),
	(290,'Heineken','birra','0.33','1.29','Carrefour','carr.sal1@gmail.com','0029-06-06','null'),
	(291,'Heineken','birra','0.33','1.29','Carrefour','carr.sal1@gmail.com','0029-06-06','null'),
	(292,'Heineken','birra','0.33','1.29','Carrefour','carr.sal1@gmail.com','0029-06-06','null'),
	(293,'Heineken','birra','0.33','1.29','Carrefour','carr.sal1@gmail.com','0029-06-06','null'),
	(294,'Heineken','birra','0.33','1.29','Carrefour','carr.sal1@gmail.com','2015-12-12','null'),
	(295,'Heineken','birra','0.33','1.29','Carrefour','carr.sal1@gmail.com','2015-12-12','null'),
	(296,'Heineken','birra','0.33','1.29','Carrefour','carr.sal1@gmail.com','2015-12-12','null'),
	(297,'Heineken','birra','0.33','1.29','Carrefour','carr.sal1@gmail.com','2015-12-12','null'),
	(298,'Heineken','birra','0.33','1.29','Carrefour','carr.sal1@gmail.com','2015-12-12','null'),
	(299,'Heineken','birra','0.33','1.29','Carrefour','carr.sal1@gmail.com','2015-12-12','null'),
	(300,'Heineken','birra','0.33','1.29','Carrefour','carr.sal1@gmail.com','2015-12-12','null'),
	(301,'Heineken','birra','0.33','1.29','Carrefour','carr.sal1@gmail.com','2015-12-12','null'),
	(302,'Heineken','birra','0.33','1.29','Carrefour','carr.sal1@gmail.com','2015-12-12','null'),
	(303,'Heineken','birra','0.33','1.29','Carrefour','carr.sal1@gmail.com','2015-12-12','null'),
	(304,'Heineken','birra','0.33','1.29','Carrefour','carr.sal1@gmail.com','2015-12-12','null'),
	(305,'Heineken','birra','0.33','1.29','Carrefour','carr.sal1@gmail.com','2015-12-12','null'),
	(306,'Heineken','birra','0.33','1.29','Carrefour','carr.sal1@gmail.com','2015-12-12','null'),
	(307,'Heineken','birra','0.33','1.29','Carrefour','carr.sal1@gmail.com','2015-12-12','null'),
	(308,'Heineken','birra','0.33','1.29','Carrefour','carr.sal1@gmail.com','2015-12-12','null'),
	(309,'Heineken','birra','0.33','1.29','Carrefour','carr.sal1@gmail.com','2015-12-12','null'),
	(310,'Heineken','birra','0.33','1.29','Carrefour','carr.sal1@gmail.com','2015-12-12','null'),
	(311,'Heineken','birra','0.33','1.29','Carrefour','carr.sal1@gmail.com','2015-12-12','null'),
	(312,'Heineken','birra','0.33','1.29','Carrefour','carr.sal1@gmail.com','2015-12-12','null'),
	(313,'Heineken','birra','0.33','1.29','Carrefour','carr.sal1@gmail.com','2015-12-12','null'),
	(314,'Heineken','birra','0.33','1.29','Carrefour','carr.sal1@gmail.com','2015-12-12','null'),
	(315,'Heineken','birra','0.33','1.29','Carrefour','carr.sal1@gmail.com','2015-12-12','null'),
	(316,'Heineken','birra','0.33','1.29','Carrefour','carr.sal1@gmail.com','2015-12-12','null'),
	(317,'Heineken','birra','0.33','1.29','Carrefour','carr.sal1@gmail.com','2015-12-12','null'),
	(318,'Heineken','birra','0.33','1.29','Carrefour','carr.sal1@gmail.com','2015-12-12','null'),
	(319,'Heineken','birra','0.33','1.29','Carrefour','carr.sal1@gmail.com','2015-12-12','null'),
	(320,'Heineken','birra','0.33','1.29','Carrefour','carr.sal1@gmail.com','2015-12-12','null'),
	(321,'Heineken','birra','0.33','1.29','Carrefour','carr.sal1@gmail.com','2015-12-12','null'),
	(322,'Heineken','birra','0.33','1.29','Carrefour','carr.sal1@gmail.com','2015-12-12','null'),
	(323,'Heineken','birra','0.33','1.29','Carrefour','carr.sal1@gmail.com','2015-12-12','null');

/*!40000 ALTER TABLE `Prodotto` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ps_check_lost_instrumentation
# ------------------------------------------------------------

DROP VIEW IF EXISTS `ps_check_lost_instrumentation`;

CREATE TABLE `ps_check_lost_instrumentation` (
   `variable_name` VARCHAR(64) NOT NULL,
   `variable_value` VARCHAR(1024) NULL DEFAULT NULL
) ENGINE=MyISAM;



# Dump of table schema_auto_increment_columns
# ------------------------------------------------------------

DROP VIEW IF EXISTS `schema_auto_increment_columns`;

CREATE TABLE `schema_auto_increment_columns` (
   `table_schema` VARCHAR(64) NOT NULL DEFAULT '',
   `table_name` VARCHAR(64) NOT NULL DEFAULT '',
   `column_name` VARCHAR(64) NOT NULL DEFAULT '',
   `data_type` VARCHAR(64) NOT NULL DEFAULT '',
   `column_type` LONGTEXT NOT NULL,
   `is_signed` INT(1) NOT NULL DEFAULT '0',
   `is_unsigned` INT(1) NOT NULL DEFAULT '0',
   `max_value` BIGINT(21) UNSIGNED NULL DEFAULT NULL,
   `auto_increment` BIGINT(21) UNSIGNED NULL DEFAULT NULL,
   `auto_increment_ratio` DECIMAL(25) UNSIGNED NULL DEFAULT NULL
) ENGINE=MyISAM;



# Dump of table schema_index_statistics
# ------------------------------------------------------------

DROP VIEW IF EXISTS `schema_index_statistics`;

CREATE TABLE `schema_index_statistics` (
   `table_schema` VARCHAR(64) NULL DEFAULT NULL,
   `table_name` VARCHAR(64) NULL DEFAULT NULL,
   `index_name` VARCHAR(64) NULL DEFAULT NULL,
   `rows_selected` BIGINT(20) UNSIGNED NOT NULL,
   `select_latency` TEXT NULL DEFAULT NULL,
   `rows_inserted` BIGINT(20) UNSIGNED NOT NULL,
   `insert_latency` TEXT NULL DEFAULT NULL,
   `rows_updated` BIGINT(20) UNSIGNED NOT NULL,
   `update_latency` TEXT NULL DEFAULT NULL,
   `rows_deleted` BIGINT(20) UNSIGNED NOT NULL,
   `delete_latency` TEXT NULL DEFAULT NULL
) ENGINE=MyISAM;



# Dump of table schema_object_overview
# ------------------------------------------------------------

DROP VIEW IF EXISTS `schema_object_overview`;

CREATE TABLE `schema_object_overview` (
   `db` VARCHAR(64) NOT NULL DEFAULT '',
   `object_type` VARCHAR(64) NULL DEFAULT NULL,
   `count` BIGINT(21) NOT NULL DEFAULT '0'
) ENGINE=MyISAM;



# Dump of table schema_redundant_indexes
# ------------------------------------------------------------

DROP VIEW IF EXISTS `schema_redundant_indexes`;

CREATE TABLE `schema_redundant_indexes` (
   `table_schema` VARCHAR(64) NOT NULL DEFAULT '',
   `table_name` VARCHAR(64) NOT NULL DEFAULT '',
   `redundant_index_name` VARCHAR(64) NOT NULL DEFAULT '',
   `redundant_index_columns` TEXT NULL DEFAULT NULL,
   `redundant_index_non_unique` BIGINT(1) NULL DEFAULT NULL,
   `dominant_index_name` VARCHAR(64) NOT NULL DEFAULT '',
   `dominant_index_columns` TEXT NULL DEFAULT NULL,
   `dominant_index_non_unique` BIGINT(1) NULL DEFAULT NULL,
   `subpart_exists` INT(1) NOT NULL DEFAULT '0',
   `sql_drop_index` VARCHAR(223) NULL DEFAULT NULL
) ENGINE=MyISAM;



# Dump of table schema_table_lock_waits
# ------------------------------------------------------------

DROP VIEW IF EXISTS `schema_table_lock_waits`;

CREATE TABLE `schema_table_lock_waits` (
   `object_schema` VARCHAR(64) NULL DEFAULT NULL,
   `object_name` VARCHAR(64) NULL DEFAULT NULL,
   `waiting_thread_id` BIGINT(20) UNSIGNED NOT NULL,
   `waiting_pid` BIGINT(20) UNSIGNED NULL DEFAULT NULL,
   `waiting_account` TEXT NULL DEFAULT NULL,
   `waiting_lock_type` VARCHAR(32) NOT NULL,
   `waiting_lock_duration` VARCHAR(32) NOT NULL,
   `waiting_query` LONGTEXT NULL DEFAULT NULL,
   `waiting_query_secs` BIGINT(20) NULL DEFAULT NULL,
   `waiting_query_rows_affected` BIGINT(20) UNSIGNED NULL DEFAULT NULL,
   `waiting_query_rows_examined` BIGINT(20) UNSIGNED NULL DEFAULT NULL,
   `blocking_thread_id` BIGINT(20) UNSIGNED NOT NULL,
   `blocking_pid` BIGINT(20) UNSIGNED NULL DEFAULT NULL,
   `blocking_account` TEXT NULL DEFAULT NULL,
   `blocking_lock_type` VARCHAR(32) NOT NULL,
   `blocking_lock_duration` VARCHAR(32) NOT NULL,
   `sql_kill_blocking_query` VARCHAR(31) NULL DEFAULT NULL,
   `sql_kill_blocking_connection` VARCHAR(25) NULL DEFAULT NULL
) ENGINE=MyISAM;



# Dump of table schema_table_statistics
# ------------------------------------------------------------

DROP VIEW IF EXISTS `schema_table_statistics`;

CREATE TABLE `schema_table_statistics` (
   `table_schema` VARCHAR(64) NULL DEFAULT NULL,
   `table_name` VARCHAR(64) NULL DEFAULT NULL,
   `total_latency` TEXT NULL DEFAULT NULL,
   `rows_fetched` BIGINT(20) UNSIGNED NOT NULL,
   `fetch_latency` TEXT NULL DEFAULT NULL,
   `rows_inserted` BIGINT(20) UNSIGNED NOT NULL,
   `insert_latency` TEXT NULL DEFAULT NULL,
   `rows_updated` BIGINT(20) UNSIGNED NOT NULL,
   `update_latency` TEXT NULL DEFAULT NULL,
   `rows_deleted` BIGINT(20) UNSIGNED NOT NULL,
   `delete_latency` TEXT NULL DEFAULT NULL,
   `io_read_requests` DECIMAL(42) NULL DEFAULT NULL,
   `io_read` TEXT NULL DEFAULT NULL,
   `io_read_latency` TEXT NULL DEFAULT NULL,
   `io_write_requests` DECIMAL(42) NULL DEFAULT NULL,
   `io_write` TEXT NULL DEFAULT NULL,
   `io_write_latency` TEXT NULL DEFAULT NULL,
   `io_misc_requests` DECIMAL(42) NULL DEFAULT NULL,
   `io_misc_latency` TEXT NULL DEFAULT NULL
) ENGINE=MyISAM;



# Dump of table schema_table_statistics_with_buffer
# ------------------------------------------------------------

DROP VIEW IF EXISTS `schema_table_statistics_with_buffer`;

CREATE TABLE `schema_table_statistics_with_buffer` (
   `table_schema` VARCHAR(64) NULL DEFAULT NULL,
   `table_name` VARCHAR(64) NULL DEFAULT NULL,
   `rows_fetched` BIGINT(20) UNSIGNED NOT NULL,
   `fetch_latency` TEXT NULL DEFAULT NULL,
   `rows_inserted` BIGINT(20) UNSIGNED NOT NULL,
   `insert_latency` TEXT NULL DEFAULT NULL,
   `rows_updated` BIGINT(20) UNSIGNED NOT NULL,
   `update_latency` TEXT NULL DEFAULT NULL,
   `rows_deleted` BIGINT(20) UNSIGNED NOT NULL,
   `delete_latency` TEXT NULL DEFAULT NULL,
   `io_read_requests` DECIMAL(42) NULL DEFAULT NULL,
   `io_read` TEXT NULL DEFAULT NULL,
   `io_read_latency` TEXT NULL DEFAULT NULL,
   `io_write_requests` DECIMAL(42) NULL DEFAULT NULL,
   `io_write` TEXT NULL DEFAULT NULL,
   `io_write_latency` TEXT NULL DEFAULT NULL,
   `io_misc_requests` DECIMAL(42) NULL DEFAULT NULL,
   `io_misc_latency` TEXT NULL DEFAULT NULL,
   `innodb_buffer_allocated` TEXT NULL DEFAULT NULL,
   `innodb_buffer_data` TEXT NULL DEFAULT NULL,
   `innodb_buffer_free` TEXT NULL DEFAULT NULL,
   `innodb_buffer_pages` BIGINT(21) NULL DEFAULT '0',
   `innodb_buffer_pages_hashed` BIGINT(21) NULL DEFAULT '0',
   `innodb_buffer_pages_old` BIGINT(21) NULL DEFAULT '0',
   `innodb_buffer_rows_cached` DECIMAL(44) NULL DEFAULT '0'
) ENGINE=MyISAM;



# Dump of table schema_tables_with_full_table_scans
# ------------------------------------------------------------

DROP VIEW IF EXISTS `schema_tables_with_full_table_scans`;

CREATE TABLE `schema_tables_with_full_table_scans` (
   `object_schema` VARCHAR(64) NULL DEFAULT NULL,
   `object_name` VARCHAR(64) NULL DEFAULT NULL,
   `rows_full_scanned` BIGINT(20) UNSIGNED NOT NULL,
   `latency` TEXT NULL DEFAULT NULL
) ENGINE=MyISAM;



# Dump of table schema_unused_indexes
# ------------------------------------------------------------

DROP VIEW IF EXISTS `schema_unused_indexes`;

CREATE TABLE `schema_unused_indexes` (
   `object_schema` VARCHAR(64) NULL DEFAULT NULL,
   `object_name` VARCHAR(64) NULL DEFAULT NULL,
   `index_name` VARCHAR(64) NULL DEFAULT NULL
) ENGINE=MyISAM;



# Dump of table session
# ------------------------------------------------------------

DROP VIEW IF EXISTS `session`;

CREATE TABLE `session` (
   `thd_id` BIGINT(20) UNSIGNED NOT NULL,
   `conn_id` BIGINT(20) UNSIGNED NULL DEFAULT NULL,
   `user` VARCHAR(128) NULL DEFAULT NULL,
   `db` VARCHAR(64) NULL DEFAULT NULL,
   `command` VARCHAR(16) NULL DEFAULT NULL,
   `state` VARCHAR(64) NULL DEFAULT NULL,
   `time` BIGINT(20) NULL DEFAULT NULL,
   `current_statement` LONGTEXT NULL DEFAULT NULL,
   `statement_latency` TEXT NULL DEFAULT NULL,
   `progress` DECIMAL(26) NULL DEFAULT NULL,
   `lock_latency` TEXT NULL DEFAULT NULL,
   `rows_examined` BIGINT(20) UNSIGNED NULL DEFAULT NULL,
   `rows_sent` BIGINT(20) UNSIGNED NULL DEFAULT NULL,
   `rows_affected` BIGINT(20) UNSIGNED NULL DEFAULT NULL,
   `tmp_tables` BIGINT(20) UNSIGNED NULL DEFAULT NULL,
   `tmp_disk_tables` BIGINT(20) UNSIGNED NULL DEFAULT NULL,
   `full_scan` VARCHAR(3) NOT NULL DEFAULT '',
   `last_statement` LONGTEXT NULL DEFAULT NULL,
   `last_statement_latency` TEXT NULL DEFAULT NULL,
   `current_memory` TEXT NULL DEFAULT NULL,
   `last_wait` VARCHAR(128) NULL DEFAULT NULL,
   `last_wait_latency` TEXT NULL DEFAULT NULL,
   `source` VARCHAR(64) NULL DEFAULT NULL,
   `trx_latency` TEXT NULL DEFAULT NULL,
   `trx_state` ENUM('ACTIVE','COMMITTED','ROLLED BACK') NULL DEFAULT NULL,
   `trx_autocommit` ENUM('YES','NO') NULL DEFAULT NULL,
   `pid` VARCHAR(1024) NULL DEFAULT NULL,
   `program_name` VARCHAR(1024) NULL DEFAULT NULL
) ENGINE=MyISAM;



# Dump of table session_ssl_status
# ------------------------------------------------------------

DROP VIEW IF EXISTS `session_ssl_status`;

CREATE TABLE `session_ssl_status` (
   `thread_id` BIGINT(20) UNSIGNED NOT NULL,
   `ssl_version` VARCHAR(1024) NULL DEFAULT NULL,
   `ssl_cipher` VARCHAR(1024) NULL DEFAULT NULL,
   `ssl_sessions_reused` VARCHAR(1024) NULL DEFAULT NULL
) ENGINE=MyISAM;



# Dump of table statement_analysis
# ------------------------------------------------------------

DROP VIEW IF EXISTS `statement_analysis`;

CREATE TABLE `statement_analysis` (
   `query` LONGTEXT NULL DEFAULT NULL,
   `db` VARCHAR(64) NULL DEFAULT NULL,
   `full_scan` VARCHAR(1) NOT NULL DEFAULT '',
   `exec_count` BIGINT(20) UNSIGNED NOT NULL,
   `err_count` BIGINT(20) UNSIGNED NOT NULL,
   `warn_count` BIGINT(20) UNSIGNED NOT NULL,
   `total_latency` TEXT NULL DEFAULT NULL,
   `max_latency` TEXT NULL DEFAULT NULL,
   `avg_latency` TEXT NULL DEFAULT NULL,
   `lock_latency` TEXT NULL DEFAULT NULL,
   `rows_sent` BIGINT(20) UNSIGNED NOT NULL,
   `rows_sent_avg` DECIMAL(21) NOT NULL DEFAULT '0',
   `rows_examined` BIGINT(20) UNSIGNED NOT NULL,
   `rows_examined_avg` DECIMAL(21) NOT NULL DEFAULT '0',
   `rows_affected` BIGINT(20) UNSIGNED NOT NULL,
   `rows_affected_avg` DECIMAL(21) NOT NULL DEFAULT '0',
   `tmp_tables` BIGINT(20) UNSIGNED NOT NULL,
   `tmp_disk_tables` BIGINT(20) UNSIGNED NOT NULL,
   `rows_sorted` BIGINT(20) UNSIGNED NOT NULL,
   `sort_merge_passes` BIGINT(20) UNSIGNED NOT NULL,
   `digest` VARCHAR(32) NULL DEFAULT NULL,
   `first_seen` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
   `last_seen` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM;



# Dump of table statements_with_errors_or_warnings
# ------------------------------------------------------------

DROP VIEW IF EXISTS `statements_with_errors_or_warnings`;

CREATE TABLE `statements_with_errors_or_warnings` (
   `query` LONGTEXT NULL DEFAULT NULL,
   `db` VARCHAR(64) NULL DEFAULT NULL,
   `exec_count` BIGINT(20) UNSIGNED NOT NULL,
   `errors` BIGINT(20) UNSIGNED NOT NULL,
   `error_pct` DECIMAL(27) NOT NULL DEFAULT '0.0000',
   `warnings` BIGINT(20) UNSIGNED NOT NULL,
   `warning_pct` DECIMAL(27) NOT NULL DEFAULT '0.0000',
   `first_seen` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
   `last_seen` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
   `digest` VARCHAR(32) NULL DEFAULT NULL
) ENGINE=MyISAM;



# Dump of table statements_with_full_table_scans
# ------------------------------------------------------------

DROP VIEW IF EXISTS `statements_with_full_table_scans`;

CREATE TABLE `statements_with_full_table_scans` (
   `query` LONGTEXT NULL DEFAULT NULL,
   `db` VARCHAR(64) NULL DEFAULT NULL,
   `exec_count` BIGINT(20) UNSIGNED NOT NULL,
   `total_latency` TEXT NULL DEFAULT NULL,
   `no_index_used_count` BIGINT(20) UNSIGNED NOT NULL,
   `no_good_index_used_count` BIGINT(20) UNSIGNED NOT NULL,
   `no_index_used_pct` DECIMAL(24) NOT NULL DEFAULT '0',
   `rows_sent` BIGINT(20) UNSIGNED NOT NULL,
   `rows_examined` BIGINT(20) UNSIGNED NOT NULL,
   `rows_sent_avg` DECIMAL(21) UNSIGNED NULL DEFAULT NULL,
   `rows_examined_avg` DECIMAL(21) UNSIGNED NULL DEFAULT NULL,
   `first_seen` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
   `last_seen` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
   `digest` VARCHAR(32) NULL DEFAULT NULL
) ENGINE=MyISAM;



# Dump of table statements_with_runtimes_in_95th_percentile
# ------------------------------------------------------------

DROP VIEW IF EXISTS `statements_with_runtimes_in_95th_percentile`;

CREATE TABLE `statements_with_runtimes_in_95th_percentile` (
   `query` LONGTEXT NULL DEFAULT NULL,
   `db` VARCHAR(64) NULL DEFAULT NULL,
   `full_scan` VARCHAR(1) NOT NULL DEFAULT '',
   `exec_count` BIGINT(20) UNSIGNED NOT NULL,
   `err_count` BIGINT(20) UNSIGNED NOT NULL,
   `warn_count` BIGINT(20) UNSIGNED NOT NULL,
   `total_latency` TEXT NULL DEFAULT NULL,
   `max_latency` TEXT NULL DEFAULT NULL,
   `avg_latency` TEXT NULL DEFAULT NULL,
   `rows_sent` BIGINT(20) UNSIGNED NOT NULL,
   `rows_sent_avg` DECIMAL(21) NOT NULL DEFAULT '0',
   `rows_examined` BIGINT(20) UNSIGNED NOT NULL,
   `rows_examined_avg` DECIMAL(21) NOT NULL DEFAULT '0',
   `first_seen` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
   `last_seen` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
   `digest` VARCHAR(32) NULL DEFAULT NULL
) ENGINE=MyISAM;



# Dump of table statements_with_sorting
# ------------------------------------------------------------

DROP VIEW IF EXISTS `statements_with_sorting`;

CREATE TABLE `statements_with_sorting` (
   `query` LONGTEXT NULL DEFAULT NULL,
   `db` VARCHAR(64) NULL DEFAULT NULL,
   `exec_count` BIGINT(20) UNSIGNED NOT NULL,
   `total_latency` TEXT NULL DEFAULT NULL,
   `sort_merge_passes` BIGINT(20) UNSIGNED NOT NULL,
   `avg_sort_merges` DECIMAL(21) NOT NULL DEFAULT '0',
   `sorts_using_scans` BIGINT(20) UNSIGNED NOT NULL,
   `sort_using_range` BIGINT(20) UNSIGNED NOT NULL,
   `rows_sorted` BIGINT(20) UNSIGNED NOT NULL,
   `avg_rows_sorted` DECIMAL(21) NOT NULL DEFAULT '0',
   `first_seen` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
   `last_seen` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
   `digest` VARCHAR(32) NULL DEFAULT NULL
) ENGINE=MyISAM;



# Dump of table statements_with_temp_tables
# ------------------------------------------------------------

DROP VIEW IF EXISTS `statements_with_temp_tables`;

CREATE TABLE `statements_with_temp_tables` (
   `query` LONGTEXT NULL DEFAULT NULL,
   `db` VARCHAR(64) NULL DEFAULT NULL,
   `exec_count` BIGINT(20) UNSIGNED NOT NULL,
   `total_latency` TEXT NULL DEFAULT NULL,
   `memory_tmp_tables` BIGINT(20) UNSIGNED NOT NULL,
   `disk_tmp_tables` BIGINT(20) UNSIGNED NOT NULL,
   `avg_tmp_tables_per_query` DECIMAL(21) NOT NULL DEFAULT '0',
   `tmp_tables_to_disk_pct` DECIMAL(24) NOT NULL DEFAULT '0',
   `first_seen` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
   `last_seen` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
   `digest` VARCHAR(32) NULL DEFAULT NULL
) ENGINE=MyISAM;



# Dump of table sys_config
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_config`;

CREATE TABLE `sys_config` (
  `variable` varchar(128) NOT NULL,
  `value` varchar(128) DEFAULT NULL,
  `set_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `set_by` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`variable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;

INSERT INTO `sys_config` (`variable`, `value`, `set_time`, `set_by`)
VALUES
	('diagnostics.allow_i_s_tables','OFF','2015-12-08 20:38:52',NULL),
	('diagnostics.include_raw','OFF','2015-12-08 20:38:52',NULL),
	('ps_thread_trx_info.max_length','65535','2015-12-08 20:38:52',NULL),
	('statement_performance_analyzer.limit','100','2015-12-08 20:38:52',NULL),
	('statement_performance_analyzer.view',NULL,'2015-12-08 20:38:52',NULL),
	('statement_truncate_len','64','2015-12-08 20:38:52',NULL);

/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;

DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`mysql.sys`@`localhost` */ /*!50003 TRIGGER `sys_config_insert_set_user` BEFORE INSERT ON `sys_config` FOR EACH ROW BEGIN IF @sys.ignore_sys_config_triggers != true AND NEW.set_by IS NULL THEN SET NEW.set_by = USER(); END IF; END */;;
/*!50003 SET SESSION SQL_MODE="" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`mysql.sys`@`localhost` */ /*!50003 TRIGGER `sys_config_update_set_user` BEFORE UPDATE ON `sys_config` FOR EACH ROW BEGIN IF @sys.ignore_sys_config_triggers != true AND NEW.set_by IS NULL THEN SET NEW.set_by = USER(); END IF; END */;;
DELIMITER ;
/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;


# Dump of table user_summary
# ------------------------------------------------------------

DROP VIEW IF EXISTS `user_summary`;

CREATE TABLE `user_summary` (
   `user` VARCHAR(32) NULL DEFAULT NULL,
   `statements` DECIMAL(64) NULL DEFAULT NULL,
   `statement_latency` TEXT NULL DEFAULT NULL,
   `statement_avg_latency` TEXT NULL DEFAULT NULL,
   `table_scans` DECIMAL(65) NULL DEFAULT NULL,
   `file_ios` DECIMAL(64) NULL DEFAULT NULL,
   `file_io_latency` TEXT NULL DEFAULT NULL,
   `current_connections` DECIMAL(41) NULL DEFAULT NULL,
   `total_connections` DECIMAL(41) NULL DEFAULT NULL,
   `unique_hosts` BIGINT(21) NOT NULL DEFAULT '0',
   `current_memory` TEXT NULL DEFAULT NULL,
   `total_memory_allocated` TEXT NULL DEFAULT NULL
) ENGINE=MyISAM;



# Dump of table user_summary_by_file_io
# ------------------------------------------------------------

DROP VIEW IF EXISTS `user_summary_by_file_io`;

CREATE TABLE `user_summary_by_file_io` (
   `user` VARCHAR(32) NULL DEFAULT NULL,
   `ios` DECIMAL(42) NULL DEFAULT NULL,
   `io_latency` TEXT NULL DEFAULT NULL
) ENGINE=MyISAM;



# Dump of table user_summary_by_file_io_type
# ------------------------------------------------------------

DROP VIEW IF EXISTS `user_summary_by_file_io_type`;

CREATE TABLE `user_summary_by_file_io_type` (
   `user` VARCHAR(32) NULL DEFAULT NULL,
   `event_name` VARCHAR(128) NOT NULL,
   `total` BIGINT(20) UNSIGNED NOT NULL,
   `latency` TEXT NULL DEFAULT NULL,
   `max_latency` TEXT NULL DEFAULT NULL
) ENGINE=MyISAM;



# Dump of table user_summary_by_stages
# ------------------------------------------------------------

DROP VIEW IF EXISTS `user_summary_by_stages`;

CREATE TABLE `user_summary_by_stages` (
   `user` VARCHAR(32) NULL DEFAULT NULL,
   `event_name` VARCHAR(128) NOT NULL,
   `total` BIGINT(20) UNSIGNED NOT NULL,
   `total_latency` TEXT NULL DEFAULT NULL,
   `avg_latency` TEXT NULL DEFAULT NULL
) ENGINE=MyISAM;



# Dump of table user_summary_by_statement_latency
# ------------------------------------------------------------

DROP VIEW IF EXISTS `user_summary_by_statement_latency`;

CREATE TABLE `user_summary_by_statement_latency` (
   `user` VARCHAR(32) NULL DEFAULT NULL,
   `total` DECIMAL(42) NULL DEFAULT NULL,
   `total_latency` TEXT NULL DEFAULT NULL,
   `max_latency` TEXT NULL DEFAULT NULL,
   `lock_latency` TEXT NULL DEFAULT NULL,
   `rows_sent` DECIMAL(42) NULL DEFAULT NULL,
   `rows_examined` DECIMAL(42) NULL DEFAULT NULL,
   `rows_affected` DECIMAL(42) NULL DEFAULT NULL,
   `full_scans` DECIMAL(43) NULL DEFAULT NULL
) ENGINE=MyISAM;



# Dump of table user_summary_by_statement_type
# ------------------------------------------------------------

DROP VIEW IF EXISTS `user_summary_by_statement_type`;

CREATE TABLE `user_summary_by_statement_type` (
   `user` VARCHAR(32) NULL DEFAULT NULL,
   `statement` VARCHAR(128) NULL DEFAULT NULL,
   `total` BIGINT(20) UNSIGNED NOT NULL,
   `total_latency` TEXT NULL DEFAULT NULL,
   `max_latency` TEXT NULL DEFAULT NULL,
   `lock_latency` TEXT NULL DEFAULT NULL,
   `rows_sent` BIGINT(20) UNSIGNED NOT NULL,
   `rows_examined` BIGINT(20) UNSIGNED NOT NULL,
   `rows_affected` BIGINT(20) UNSIGNED NOT NULL,
   `full_scans` BIGINT(21) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM;



# Dump of table version
# ------------------------------------------------------------

DROP VIEW IF EXISTS `version`;

CREATE TABLE `version` (
   `sys_version` VARCHAR(5) NOT NULL DEFAULT '',
   `mysql_version` VARCHAR(6) NOT NULL DEFAULT ''
) ENGINE=MyISAM;



# Dump of table wait_classes_global_by_avg_latency
# ------------------------------------------------------------

DROP VIEW IF EXISTS `wait_classes_global_by_avg_latency`;

CREATE TABLE `wait_classes_global_by_avg_latency` (
   `event_class` VARCHAR(128) NULL DEFAULT NULL,
   `total` DECIMAL(42) NULL DEFAULT NULL,
   `total_latency` TEXT NULL DEFAULT NULL,
   `min_latency` TEXT NULL DEFAULT NULL,
   `avg_latency` TEXT NULL DEFAULT NULL,
   `max_latency` TEXT NULL DEFAULT NULL
) ENGINE=MyISAM;



# Dump of table wait_classes_global_by_latency
# ------------------------------------------------------------

DROP VIEW IF EXISTS `wait_classes_global_by_latency`;

CREATE TABLE `wait_classes_global_by_latency` (
   `event_class` VARCHAR(128) NULL DEFAULT NULL,
   `total` DECIMAL(42) NULL DEFAULT NULL,
   `total_latency` TEXT NULL DEFAULT NULL,
   `min_latency` TEXT NULL DEFAULT NULL,
   `avg_latency` TEXT NULL DEFAULT NULL,
   `max_latency` TEXT NULL DEFAULT NULL
) ENGINE=MyISAM;



# Dump of table waits_by_host_by_latency
# ------------------------------------------------------------

DROP VIEW IF EXISTS `waits_by_host_by_latency`;

CREATE TABLE `waits_by_host_by_latency` (
   `host` VARCHAR(60) NULL DEFAULT NULL,
   `event` VARCHAR(128) NOT NULL,
   `total` BIGINT(20) UNSIGNED NOT NULL,
   `total_latency` TEXT NULL DEFAULT NULL,
   `avg_latency` TEXT NULL DEFAULT NULL,
   `max_latency` TEXT NULL DEFAULT NULL
) ENGINE=MyISAM;



# Dump of table waits_by_user_by_latency
# ------------------------------------------------------------

DROP VIEW IF EXISTS `waits_by_user_by_latency`;

CREATE TABLE `waits_by_user_by_latency` (
   `user` VARCHAR(32) NULL DEFAULT NULL,
   `event` VARCHAR(128) NOT NULL,
   `total` BIGINT(20) UNSIGNED NOT NULL,
   `total_latency` TEXT NULL DEFAULT NULL,
   `avg_latency` TEXT NULL DEFAULT NULL,
   `max_latency` TEXT NULL DEFAULT NULL
) ENGINE=MyISAM;



# Dump of table waits_global_by_latency
# ------------------------------------------------------------

DROP VIEW IF EXISTS `waits_global_by_latency`;

CREATE TABLE `waits_global_by_latency` (
   `events` VARCHAR(128) NOT NULL,
   `total` BIGINT(20) UNSIGNED NOT NULL,
   `total_latency` TEXT NULL DEFAULT NULL,
   `avg_latency` TEXT NULL DEFAULT NULL,
   `max_latency` TEXT NULL DEFAULT NULL
) ENGINE=MyISAM;



# Dump of table x$host_summary
# ------------------------------------------------------------

DROP VIEW IF EXISTS `x$host_summary`;

CREATE TABLE `x$host_summary` (
   `host` VARCHAR(60) NULL DEFAULT NULL,
   `statements` DECIMAL(64) NULL DEFAULT NULL,
   `statement_latency` DECIMAL(64) NULL DEFAULT NULL,
   `statement_avg_latency` DECIMAL(65) NULL DEFAULT NULL,
   `table_scans` DECIMAL(65) NULL DEFAULT NULL,
   `file_ios` DECIMAL(64) NULL DEFAULT NULL,
   `file_io_latency` DECIMAL(64) NULL DEFAULT NULL,
   `current_connections` DECIMAL(41) NULL DEFAULT NULL,
   `total_connections` DECIMAL(41) NULL DEFAULT NULL,
   `unique_users` BIGINT(21) NOT NULL DEFAULT '0',
   `current_memory` DECIMAL(63) NULL DEFAULT NULL,
   `total_memory_allocated` DECIMAL(64) NULL DEFAULT NULL
) ENGINE=MyISAM;



# Dump of table x$host_summary_by_file_io
# ------------------------------------------------------------

DROP VIEW IF EXISTS `x$host_summary_by_file_io`;

CREATE TABLE `x$host_summary_by_file_io` (
   `host` VARCHAR(60) NULL DEFAULT NULL,
   `ios` DECIMAL(42) NULL DEFAULT NULL,
   `io_latency` DECIMAL(42) NULL DEFAULT NULL
) ENGINE=MyISAM;



# Dump of table x$host_summary_by_file_io_type
# ------------------------------------------------------------

DROP VIEW IF EXISTS `x$host_summary_by_file_io_type`;

CREATE TABLE `x$host_summary_by_file_io_type` (
   `host` VARCHAR(60) NULL DEFAULT NULL,
   `event_name` VARCHAR(128) NOT NULL,
   `total` BIGINT(20) UNSIGNED NOT NULL,
   `total_latency` BIGINT(20) UNSIGNED NOT NULL,
   `max_latency` BIGINT(20) UNSIGNED NOT NULL
) ENGINE=MyISAM;



# Dump of table x$host_summary_by_stages
# ------------------------------------------------------------

DROP VIEW IF EXISTS `x$host_summary_by_stages`;

CREATE TABLE `x$host_summary_by_stages` (
   `host` VARCHAR(60) NULL DEFAULT NULL,
   `event_name` VARCHAR(128) NOT NULL,
   `total` BIGINT(20) UNSIGNED NOT NULL,
   `total_latency` BIGINT(20) UNSIGNED NOT NULL,
   `avg_latency` BIGINT(20) UNSIGNED NOT NULL
) ENGINE=MyISAM;



# Dump of table x$host_summary_by_statement_latency
# ------------------------------------------------------------

DROP VIEW IF EXISTS `x$host_summary_by_statement_latency`;

CREATE TABLE `x$host_summary_by_statement_latency` (
   `host` VARCHAR(60) NULL DEFAULT NULL,
   `total` DECIMAL(42) NULL DEFAULT NULL,
   `total_latency` DECIMAL(42) NULL DEFAULT NULL,
   `max_latency` DECIMAL(42) NULL DEFAULT NULL,
   `lock_latency` DECIMAL(42) NULL DEFAULT NULL,
   `rows_sent` DECIMAL(42) NULL DEFAULT NULL,
   `rows_examined` DECIMAL(42) NULL DEFAULT NULL,
   `rows_affected` DECIMAL(42) NULL DEFAULT NULL,
   `full_scans` DECIMAL(43) NULL DEFAULT NULL
) ENGINE=MyISAM;



# Dump of table x$host_summary_by_statement_type
# ------------------------------------------------------------

DROP VIEW IF EXISTS `x$host_summary_by_statement_type`;

CREATE TABLE `x$host_summary_by_statement_type` (
   `host` VARCHAR(60) NULL DEFAULT NULL,
   `statement` VARCHAR(128) NULL DEFAULT NULL,
   `total` BIGINT(20) UNSIGNED NOT NULL,
   `total_latency` BIGINT(20) UNSIGNED NOT NULL,
   `max_latency` BIGINT(20) UNSIGNED NOT NULL,
   `lock_latency` BIGINT(20) UNSIGNED NOT NULL,
   `rows_sent` BIGINT(20) UNSIGNED NOT NULL,
   `rows_examined` BIGINT(20) UNSIGNED NOT NULL,
   `rows_affected` BIGINT(20) UNSIGNED NOT NULL,
   `full_scans` BIGINT(21) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM;



# Dump of table x$innodb_buffer_stats_by_schema
# ------------------------------------------------------------

DROP VIEW IF EXISTS `x$innodb_buffer_stats_by_schema`;

CREATE TABLE `x$innodb_buffer_stats_by_schema` (
   `object_schema` TEXT NULL DEFAULT NULL,
   `allocated` DECIMAL(43) NULL DEFAULT NULL,
   `data` DECIMAL(43) NULL DEFAULT NULL,
   `pages` BIGINT(21) NOT NULL DEFAULT '0',
   `pages_hashed` BIGINT(21) NOT NULL DEFAULT '0',
   `pages_old` BIGINT(21) NOT NULL DEFAULT '0',
   `rows_cached` DECIMAL(44) NOT NULL DEFAULT '0'
) ENGINE=MyISAM;



# Dump of table x$innodb_buffer_stats_by_table
# ------------------------------------------------------------

DROP VIEW IF EXISTS `x$innodb_buffer_stats_by_table`;

CREATE TABLE `x$innodb_buffer_stats_by_table` (
   `object_schema` TEXT NULL DEFAULT NULL,
   `object_name` TEXT NULL DEFAULT NULL,
   `allocated` DECIMAL(43) NULL DEFAULT NULL,
   `data` DECIMAL(43) NULL DEFAULT NULL,
   `pages` BIGINT(21) NOT NULL DEFAULT '0',
   `pages_hashed` BIGINT(21) NOT NULL DEFAULT '0',
   `pages_old` BIGINT(21) NOT NULL DEFAULT '0',
   `rows_cached` DECIMAL(44) NOT NULL DEFAULT '0'
) ENGINE=MyISAM;



# Dump of table x$innodb_lock_waits
# ------------------------------------------------------------

DROP VIEW IF EXISTS `x$innodb_lock_waits`;

CREATE TABLE `x$innodb_lock_waits` (
   `wait_started` DATETIME NULL DEFAULT NULL,
   `wait_age` TIME NULL DEFAULT NULL,
   `wait_age_secs` BIGINT(21) NULL DEFAULT NULL,
   `locked_table` VARCHAR(1024) NOT NULL DEFAULT '',
   `locked_index` VARCHAR(1024) NULL DEFAULT NULL,
   `locked_type` VARCHAR(32) NOT NULL DEFAULT '',
   `waiting_trx_id` VARCHAR(18) NOT NULL DEFAULT '',
   `waiting_trx_started` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
   `waiting_trx_age` TIME NULL DEFAULT NULL,
   `waiting_trx_rows_locked` BIGINT(21) UNSIGNED NOT NULL DEFAULT '0',
   `waiting_trx_rows_modified` BIGINT(21) UNSIGNED NOT NULL DEFAULT '0',
   `waiting_pid` BIGINT(21) UNSIGNED NOT NULL DEFAULT '0',
   `waiting_query` VARCHAR(1024) NULL DEFAULT NULL,
   `waiting_lock_id` VARCHAR(81) NOT NULL DEFAULT '',
   `waiting_lock_mode` VARCHAR(32) NOT NULL DEFAULT '',
   `blocking_trx_id` VARCHAR(18) NOT NULL DEFAULT '',
   `blocking_pid` BIGINT(21) UNSIGNED NOT NULL DEFAULT '0',
   `blocking_query` VARCHAR(1024) NULL DEFAULT NULL,
   `blocking_lock_id` VARCHAR(81) NOT NULL DEFAULT '',
   `blocking_lock_mode` VARCHAR(32) NOT NULL DEFAULT '',
   `blocking_trx_started` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
   `blocking_trx_age` TIME NULL DEFAULT NULL,
   `blocking_trx_rows_locked` BIGINT(21) UNSIGNED NOT NULL DEFAULT '0',
   `blocking_trx_rows_modified` BIGINT(21) UNSIGNED NOT NULL DEFAULT '0',
   `sql_kill_blocking_query` VARCHAR(32) NULL DEFAULT NULL,
   `sql_kill_blocking_connection` VARCHAR(26) NULL DEFAULT NULL
) ENGINE=MyISAM;



# Dump of table x$io_by_thread_by_latency
# ------------------------------------------------------------

DROP VIEW IF EXISTS `x$io_by_thread_by_latency`;

CREATE TABLE `x$io_by_thread_by_latency` (
   `user` VARCHAR(128) NULL DEFAULT NULL,
   `total` DECIMAL(42) NULL DEFAULT NULL,
   `total_latency` DECIMAL(42) NULL DEFAULT NULL,
   `min_latency` BIGINT(20) UNSIGNED NULL DEFAULT NULL,
   `avg_latency` DECIMAL(24) NULL DEFAULT NULL,
   `max_latency` BIGINT(20) UNSIGNED NULL DEFAULT NULL,
   `thread_id` BIGINT(20) UNSIGNED NOT NULL,
   `processlist_id` BIGINT(20) UNSIGNED NULL DEFAULT NULL
) ENGINE=MyISAM;



# Dump of table x$io_global_by_file_by_bytes
# ------------------------------------------------------------

DROP VIEW IF EXISTS `x$io_global_by_file_by_bytes`;

CREATE TABLE `x$io_global_by_file_by_bytes` (
   `file` VARCHAR(512) NOT NULL,
   `count_read` BIGINT(20) UNSIGNED NOT NULL,
   `total_read` BIGINT(20) NOT NULL,
   `avg_read` DECIMAL(23) NOT NULL DEFAULT '0.0000',
   `count_write` BIGINT(20) UNSIGNED NOT NULL,
   `total_written` BIGINT(20) NOT NULL,
   `avg_write` DECIMAL(23) NOT NULL DEFAULT '0.0000',
   `total` BIGINT(21) NOT NULL DEFAULT '0',
   `write_pct` DECIMAL(26) NOT NULL DEFAULT '0.00'
) ENGINE=MyISAM;



# Dump of table x$io_global_by_file_by_latency
# ------------------------------------------------------------

DROP VIEW IF EXISTS `x$io_global_by_file_by_latency`;

CREATE TABLE `x$io_global_by_file_by_latency` (
   `file` VARCHAR(512) NOT NULL,
   `total` BIGINT(20) UNSIGNED NOT NULL,
   `total_latency` BIGINT(20) UNSIGNED NOT NULL,
   `count_read` BIGINT(20) UNSIGNED NOT NULL,
   `read_latency` BIGINT(20) UNSIGNED NOT NULL,
   `count_write` BIGINT(20) UNSIGNED NOT NULL,
   `write_latency` BIGINT(20) UNSIGNED NOT NULL,
   `count_misc` BIGINT(20) UNSIGNED NOT NULL,
   `misc_latency` BIGINT(20) UNSIGNED NOT NULL
) ENGINE=MyISAM;



# Dump of table x$io_global_by_wait_by_bytes
# ------------------------------------------------------------

DROP VIEW IF EXISTS `x$io_global_by_wait_by_bytes`;

CREATE TABLE `x$io_global_by_wait_by_bytes` (
   `event_name` VARCHAR(128) NULL DEFAULT NULL,
   `total` BIGINT(20) UNSIGNED NOT NULL,
   `total_latency` BIGINT(20) UNSIGNED NOT NULL,
   `min_latency` BIGINT(20) UNSIGNED NOT NULL,
   `avg_latency` BIGINT(20) UNSIGNED NOT NULL,
   `max_latency` BIGINT(20) UNSIGNED NOT NULL,
   `count_read` BIGINT(20) UNSIGNED NOT NULL,
   `total_read` BIGINT(20) NOT NULL,
   `avg_read` DECIMAL(23) NOT NULL DEFAULT '0.0000',
   `count_write` BIGINT(20) UNSIGNED NOT NULL,
   `total_written` BIGINT(20) NOT NULL,
   `avg_written` DECIMAL(23) NOT NULL DEFAULT '0.0000',
   `total_requested` BIGINT(21) NOT NULL DEFAULT '0'
) ENGINE=MyISAM;



# Dump of table x$io_global_by_wait_by_latency
# ------------------------------------------------------------

DROP VIEW IF EXISTS `x$io_global_by_wait_by_latency`;

CREATE TABLE `x$io_global_by_wait_by_latency` (
   `event_name` VARCHAR(128) NULL DEFAULT NULL,
   `total` BIGINT(20) UNSIGNED NOT NULL,
   `total_latency` BIGINT(20) UNSIGNED NOT NULL,
   `avg_latency` BIGINT(20) UNSIGNED NOT NULL,
   `max_latency` BIGINT(20) UNSIGNED NOT NULL,
   `read_latency` BIGINT(20) UNSIGNED NOT NULL,
   `write_latency` BIGINT(20) UNSIGNED NOT NULL,
   `misc_latency` BIGINT(20) UNSIGNED NOT NULL,
   `count_read` BIGINT(20) UNSIGNED NOT NULL,
   `total_read` BIGINT(20) NOT NULL,
   `avg_read` DECIMAL(23) NOT NULL DEFAULT '0.0000',
   `count_write` BIGINT(20) UNSIGNED NOT NULL,
   `total_written` BIGINT(20) NOT NULL,
   `avg_written` DECIMAL(23) NOT NULL DEFAULT '0.0000'
) ENGINE=MyISAM;



# Dump of table x$latest_file_io
# ------------------------------------------------------------

DROP VIEW IF EXISTS `x$latest_file_io`;

CREATE TABLE `x$latest_file_io` (
   `thread` VARCHAR(149) NULL DEFAULT NULL,
   `file` VARCHAR(512) NULL DEFAULT NULL,
   `latency` BIGINT(20) UNSIGNED NULL DEFAULT NULL,
   `operation` VARCHAR(32) NOT NULL,
   `requested` BIGINT(20) NULL DEFAULT NULL
) ENGINE=MyISAM;



# Dump of table x$memory_by_host_by_current_bytes
# ------------------------------------------------------------

DROP VIEW IF EXISTS `x$memory_by_host_by_current_bytes`;

CREATE TABLE `x$memory_by_host_by_current_bytes` (
   `host` VARCHAR(60) NULL DEFAULT NULL,
   `current_count_used` DECIMAL(41) NULL DEFAULT NULL,
   `current_allocated` DECIMAL(41) NULL DEFAULT NULL,
   `current_avg_alloc` DECIMAL(45) NOT NULL DEFAULT '0.0000',
   `current_max_alloc` BIGINT(20) NULL DEFAULT NULL,
   `total_allocated` DECIMAL(42) NULL DEFAULT NULL
) ENGINE=MyISAM;



# Dump of table x$memory_by_thread_by_current_bytes
# ------------------------------------------------------------

DROP VIEW IF EXISTS `x$memory_by_thread_by_current_bytes`;

CREATE TABLE `x$memory_by_thread_by_current_bytes` (
   `thread_id` BIGINT(20) UNSIGNED NOT NULL,
   `user` VARCHAR(128) NULL DEFAULT NULL,
   `current_count_used` DECIMAL(41) NULL DEFAULT NULL,
   `current_allocated` DECIMAL(41) NULL DEFAULT NULL,
   `current_avg_alloc` DECIMAL(45) NOT NULL DEFAULT '0.0000',
   `current_max_alloc` BIGINT(20) NULL DEFAULT NULL,
   `total_allocated` DECIMAL(42) NULL DEFAULT NULL
) ENGINE=MyISAM;



# Dump of table x$memory_by_user_by_current_bytes
# ------------------------------------------------------------

DROP VIEW IF EXISTS `x$memory_by_user_by_current_bytes`;

CREATE TABLE `x$memory_by_user_by_current_bytes` (
   `user` VARCHAR(32) NULL DEFAULT NULL,
   `current_count_used` DECIMAL(41) NULL DEFAULT NULL,
   `current_allocated` DECIMAL(41) NULL DEFAULT NULL,
   `current_avg_alloc` DECIMAL(45) NOT NULL DEFAULT '0.0000',
   `current_max_alloc` BIGINT(20) NULL DEFAULT NULL,
   `total_allocated` DECIMAL(42) NULL DEFAULT NULL
) ENGINE=MyISAM;



# Dump of table x$memory_global_by_current_bytes
# ------------------------------------------------------------

DROP VIEW IF EXISTS `x$memory_global_by_current_bytes`;

CREATE TABLE `x$memory_global_by_current_bytes` (
   `event_name` VARCHAR(128) NOT NULL,
   `current_count` BIGINT(20) NOT NULL,
   `current_alloc` BIGINT(20) NOT NULL,
   `current_avg_alloc` DECIMAL(23) NOT NULL DEFAULT '0.0000',
   `high_count` BIGINT(20) NOT NULL,
   `high_alloc` BIGINT(20) NOT NULL,
   `high_avg_alloc` DECIMAL(23) NOT NULL DEFAULT '0.0000'
) ENGINE=MyISAM;



# Dump of table x$memory_global_total
# ------------------------------------------------------------

DROP VIEW IF EXISTS `x$memory_global_total`;

CREATE TABLE `x$memory_global_total` (
   `total_allocated` DECIMAL(41) NULL DEFAULT NULL
) ENGINE=MyISAM;



# Dump of table x$processlist
# ------------------------------------------------------------

DROP VIEW IF EXISTS `x$processlist`;

CREATE TABLE `x$processlist` (
   `thd_id` BIGINT(20) UNSIGNED NOT NULL,
   `conn_id` BIGINT(20) UNSIGNED NULL DEFAULT NULL,
   `user` VARCHAR(128) NULL DEFAULT NULL,
   `db` VARCHAR(64) NULL DEFAULT NULL,
   `command` VARCHAR(16) NULL DEFAULT NULL,
   `state` VARCHAR(64) NULL DEFAULT NULL,
   `time` BIGINT(20) NULL DEFAULT NULL,
   `current_statement` LONGTEXT NULL DEFAULT NULL,
   `statement_latency` BIGINT(20) UNSIGNED NULL DEFAULT NULL,
   `progress` DECIMAL(26) NULL DEFAULT NULL,
   `lock_latency` BIGINT(20) UNSIGNED NULL DEFAULT NULL,
   `rows_examined` BIGINT(20) UNSIGNED NULL DEFAULT NULL,
   `rows_sent` BIGINT(20) UNSIGNED NULL DEFAULT NULL,
   `rows_affected` BIGINT(20) UNSIGNED NULL DEFAULT NULL,
   `tmp_tables` BIGINT(20) UNSIGNED NULL DEFAULT NULL,
   `tmp_disk_tables` BIGINT(20) UNSIGNED NULL DEFAULT NULL,
   `full_scan` VARCHAR(3) NOT NULL DEFAULT '',
   `last_statement` LONGTEXT NULL DEFAULT NULL,
   `last_statement_latency` BIGINT(20) UNSIGNED NULL DEFAULT NULL,
   `current_memory` DECIMAL(41) NULL DEFAULT NULL,
   `last_wait` VARCHAR(128) NULL DEFAULT NULL,
   `last_wait_latency` VARCHAR(20) NULL DEFAULT NULL,
   `source` VARCHAR(64) NULL DEFAULT NULL,
   `trx_latency` BIGINT(20) UNSIGNED NULL DEFAULT NULL,
   `trx_state` ENUM('ACTIVE','COMMITTED','ROLLED BACK') NULL DEFAULT NULL,
   `trx_autocommit` ENUM('YES','NO') NULL DEFAULT NULL,
   `pid` VARCHAR(1024) NULL DEFAULT NULL,
   `program_name` VARCHAR(1024) NULL DEFAULT NULL
) ENGINE=MyISAM;



# Dump of table x$ps_digest_95th_percentile_by_avg_us
# ------------------------------------------------------------

DROP VIEW IF EXISTS `x$ps_digest_95th_percentile_by_avg_us`;

CREATE TABLE `x$ps_digest_95th_percentile_by_avg_us` (
   `avg_us` DECIMAL(21) NULL DEFAULT NULL,
   `percentile` DECIMAL(46) NOT NULL DEFAULT '0.0000'
) ENGINE=MyISAM;



# Dump of table x$ps_digest_avg_latency_distribution
# ------------------------------------------------------------

DROP VIEW IF EXISTS `x$ps_digest_avg_latency_distribution`;

CREATE TABLE `x$ps_digest_avg_latency_distribution` (
   `cnt` BIGINT(21) NOT NULL DEFAULT '0',
   `avg_us` DECIMAL(21) NULL DEFAULT NULL
) ENGINE=MyISAM;



# Dump of table x$ps_schema_table_statistics_io
# ------------------------------------------------------------

DROP VIEW IF EXISTS `x$ps_schema_table_statistics_io`;

CREATE TABLE `x$ps_schema_table_statistics_io` (
   `table_schema` VARCHAR(64) NULL DEFAULT NULL,
   `table_name` VARCHAR(64) NULL DEFAULT NULL,
   `count_read` DECIMAL(42) NULL DEFAULT NULL,
   `sum_number_of_bytes_read` DECIMAL(41) NULL DEFAULT NULL,
   `sum_timer_read` DECIMAL(42) NULL DEFAULT NULL,
   `count_write` DECIMAL(42) NULL DEFAULT NULL,
   `sum_number_of_bytes_write` DECIMAL(41) NULL DEFAULT NULL,
   `sum_timer_write` DECIMAL(42) NULL DEFAULT NULL,
   `count_misc` DECIMAL(42) NULL DEFAULT NULL,
   `sum_timer_misc` DECIMAL(42) NULL DEFAULT NULL
) ENGINE=MyISAM;



# Dump of table x$schema_flattened_keys
# ------------------------------------------------------------

DROP VIEW IF EXISTS `x$schema_flattened_keys`;

CREATE TABLE `x$schema_flattened_keys` (
   `table_schema` VARCHAR(64) NOT NULL DEFAULT '',
   `table_name` VARCHAR(64) NOT NULL DEFAULT '',
   `index_name` VARCHAR(64) NOT NULL DEFAULT '',
   `non_unique` BIGINT(1) NULL DEFAULT NULL,
   `subpart_exists` BIGINT(1) NULL DEFAULT NULL,
   `index_columns` TEXT NULL DEFAULT NULL
) ENGINE=MyISAM;



# Dump of table x$schema_index_statistics
# ------------------------------------------------------------

DROP VIEW IF EXISTS `x$schema_index_statistics`;

CREATE TABLE `x$schema_index_statistics` (
   `table_schema` VARCHAR(64) NULL DEFAULT NULL,
   `table_name` VARCHAR(64) NULL DEFAULT NULL,
   `index_name` VARCHAR(64) NULL DEFAULT NULL,
   `rows_selected` BIGINT(20) UNSIGNED NOT NULL,
   `select_latency` BIGINT(20) UNSIGNED NOT NULL,
   `rows_inserted` BIGINT(20) UNSIGNED NOT NULL,
   `insert_latency` BIGINT(20) UNSIGNED NOT NULL,
   `rows_updated` BIGINT(20) UNSIGNED NOT NULL,
   `update_latency` BIGINT(20) UNSIGNED NOT NULL,
   `rows_deleted` BIGINT(20) UNSIGNED NOT NULL,
   `delete_latency` BIGINT(20) UNSIGNED NOT NULL
) ENGINE=MyISAM;



# Dump of table x$schema_table_lock_waits
# ------------------------------------------------------------

DROP VIEW IF EXISTS `x$schema_table_lock_waits`;

CREATE TABLE `x$schema_table_lock_waits` (
   `object_schema` VARCHAR(64) NULL DEFAULT NULL,
   `object_name` VARCHAR(64) NULL DEFAULT NULL,
   `waiting_thread_id` BIGINT(20) UNSIGNED NOT NULL,
   `waiting_pid` BIGINT(20) UNSIGNED NULL DEFAULT NULL,
   `waiting_account` TEXT NULL DEFAULT NULL,
   `waiting_lock_type` VARCHAR(32) NOT NULL,
   `waiting_lock_duration` VARCHAR(32) NOT NULL,
   `waiting_query` LONGTEXT NULL DEFAULT NULL,
   `waiting_query_secs` BIGINT(20) NULL DEFAULT NULL,
   `waiting_query_rows_affected` BIGINT(20) UNSIGNED NULL DEFAULT NULL,
   `waiting_query_rows_examined` BIGINT(20) UNSIGNED NULL DEFAULT NULL,
   `blocking_thread_id` BIGINT(20) UNSIGNED NOT NULL,
   `blocking_pid` BIGINT(20) UNSIGNED NULL DEFAULT NULL,
   `blocking_account` TEXT NULL DEFAULT NULL,
   `blocking_lock_type` VARCHAR(32) NOT NULL,
   `blocking_lock_duration` VARCHAR(32) NOT NULL,
   `sql_kill_blocking_query` VARCHAR(31) NULL DEFAULT NULL,
   `sql_kill_blocking_connection` VARCHAR(25) NULL DEFAULT NULL
) ENGINE=MyISAM;



# Dump of table x$schema_table_statistics
# ------------------------------------------------------------

DROP VIEW IF EXISTS `x$schema_table_statistics`;

CREATE TABLE `x$schema_table_statistics` (
   `table_schema` VARCHAR(64) NULL DEFAULT NULL,
   `table_name` VARCHAR(64) NULL DEFAULT NULL,
   `total_latency` BIGINT(20) UNSIGNED NOT NULL,
   `rows_fetched` BIGINT(20) UNSIGNED NOT NULL,
   `fetch_latency` BIGINT(20) UNSIGNED NOT NULL,
   `rows_inserted` BIGINT(20) UNSIGNED NOT NULL,
   `insert_latency` BIGINT(20) UNSIGNED NOT NULL,
   `rows_updated` BIGINT(20) UNSIGNED NOT NULL,
   `update_latency` BIGINT(20) UNSIGNED NOT NULL,
   `rows_deleted` BIGINT(20) UNSIGNED NOT NULL,
   `delete_latency` BIGINT(20) UNSIGNED NOT NULL,
   `io_read_requests` DECIMAL(42) NULL DEFAULT NULL,
   `io_read` DECIMAL(41) NULL DEFAULT NULL,
   `io_read_latency` DECIMAL(42) NULL DEFAULT NULL,
   `io_write_requests` DECIMAL(42) NULL DEFAULT NULL,
   `io_write` DECIMAL(41) NULL DEFAULT NULL,
   `io_write_latency` DECIMAL(42) NULL DEFAULT NULL,
   `io_misc_requests` DECIMAL(42) NULL DEFAULT NULL,
   `io_misc_latency` DECIMAL(42) NULL DEFAULT NULL
) ENGINE=MyISAM;



# Dump of table x$schema_table_statistics_with_buffer
# ------------------------------------------------------------

DROP VIEW IF EXISTS `x$schema_table_statistics_with_buffer`;

CREATE TABLE `x$schema_table_statistics_with_buffer` (
   `table_schema` VARCHAR(64) NULL DEFAULT NULL,
   `table_name` VARCHAR(64) NULL DEFAULT NULL,
   `rows_fetched` BIGINT(20) UNSIGNED NOT NULL,
   `fetch_latency` BIGINT(20) UNSIGNED NOT NULL,
   `rows_inserted` BIGINT(20) UNSIGNED NOT NULL,
   `insert_latency` BIGINT(20) UNSIGNED NOT NULL,
   `rows_updated` BIGINT(20) UNSIGNED NOT NULL,
   `update_latency` BIGINT(20) UNSIGNED NOT NULL,
   `rows_deleted` BIGINT(20) UNSIGNED NOT NULL,
   `delete_latency` BIGINT(20) UNSIGNED NOT NULL,
   `io_read_requests` DECIMAL(42) NULL DEFAULT NULL,
   `io_read` DECIMAL(41) NULL DEFAULT NULL,
   `io_read_latency` DECIMAL(42) NULL DEFAULT NULL,
   `io_write_requests` DECIMAL(42) NULL DEFAULT NULL,
   `io_write` DECIMAL(41) NULL DEFAULT NULL,
   `io_write_latency` DECIMAL(42) NULL DEFAULT NULL,
   `io_misc_requests` DECIMAL(42) NULL DEFAULT NULL,
   `io_misc_latency` DECIMAL(42) NULL DEFAULT NULL,
   `innodb_buffer_allocated` DECIMAL(43) NULL DEFAULT NULL,
   `innodb_buffer_data` DECIMAL(43) NULL DEFAULT NULL,
   `innodb_buffer_free` DECIMAL(44) NULL DEFAULT NULL,
   `innodb_buffer_pages` BIGINT(21) NULL DEFAULT '0',
   `innodb_buffer_pages_hashed` BIGINT(21) NULL DEFAULT '0',
   `innodb_buffer_pages_old` BIGINT(21) NULL DEFAULT '0',
   `innodb_buffer_rows_cached` DECIMAL(44) NULL DEFAULT '0'
) ENGINE=MyISAM;



# Dump of table x$schema_tables_with_full_table_scans
# ------------------------------------------------------------

DROP VIEW IF EXISTS `x$schema_tables_with_full_table_scans`;

CREATE TABLE `x$schema_tables_with_full_table_scans` (
   `object_schema` VARCHAR(64) NULL DEFAULT NULL,
   `object_name` VARCHAR(64) NULL DEFAULT NULL,
   `rows_full_scanned` BIGINT(20) UNSIGNED NOT NULL,
   `latency` BIGINT(20) UNSIGNED NOT NULL
) ENGINE=MyISAM;



# Dump of table x$session
# ------------------------------------------------------------

DROP VIEW IF EXISTS `x$session`;

CREATE TABLE `x$session` (
   `thd_id` BIGINT(20) UNSIGNED NOT NULL,
   `conn_id` BIGINT(20) UNSIGNED NULL DEFAULT NULL,
   `user` VARCHAR(128) NULL DEFAULT NULL,
   `db` VARCHAR(64) NULL DEFAULT NULL,
   `command` VARCHAR(16) NULL DEFAULT NULL,
   `state` VARCHAR(64) NULL DEFAULT NULL,
   `time` BIGINT(20) NULL DEFAULT NULL,
   `current_statement` LONGTEXT NULL DEFAULT NULL,
   `statement_latency` BIGINT(20) UNSIGNED NULL DEFAULT NULL,
   `progress` DECIMAL(26) NULL DEFAULT NULL,
   `lock_latency` BIGINT(20) UNSIGNED NULL DEFAULT NULL,
   `rows_examined` BIGINT(20) UNSIGNED NULL DEFAULT NULL,
   `rows_sent` BIGINT(20) UNSIGNED NULL DEFAULT NULL,
   `rows_affected` BIGINT(20) UNSIGNED NULL DEFAULT NULL,
   `tmp_tables` BIGINT(20) UNSIGNED NULL DEFAULT NULL,
   `tmp_disk_tables` BIGINT(20) UNSIGNED NULL DEFAULT NULL,
   `full_scan` VARCHAR(3) NOT NULL DEFAULT '',
   `last_statement` LONGTEXT NULL DEFAULT NULL,
   `last_statement_latency` BIGINT(20) UNSIGNED NULL DEFAULT NULL,
   `current_memory` DECIMAL(41) NULL DEFAULT NULL,
   `last_wait` VARCHAR(128) NULL DEFAULT NULL,
   `last_wait_latency` VARCHAR(20) NULL DEFAULT NULL,
   `source` VARCHAR(64) NULL DEFAULT NULL,
   `trx_latency` BIGINT(20) UNSIGNED NULL DEFAULT NULL,
   `trx_state` ENUM('ACTIVE','COMMITTED','ROLLED BACK') NULL DEFAULT NULL,
   `trx_autocommit` ENUM('YES','NO') NULL DEFAULT NULL,
   `pid` VARCHAR(1024) NULL DEFAULT NULL,
   `program_name` VARCHAR(1024) NULL DEFAULT NULL
) ENGINE=MyISAM;



# Dump of table x$statement_analysis
# ------------------------------------------------------------

DROP VIEW IF EXISTS `x$statement_analysis`;

CREATE TABLE `x$statement_analysis` (
   `query` LONGTEXT NULL DEFAULT NULL,
   `db` VARCHAR(64) NULL DEFAULT NULL,
   `full_scan` VARCHAR(1) NOT NULL DEFAULT '',
   `exec_count` BIGINT(20) UNSIGNED NOT NULL,
   `err_count` BIGINT(20) UNSIGNED NOT NULL,
   `warn_count` BIGINT(20) UNSIGNED NOT NULL,
   `total_latency` BIGINT(20) UNSIGNED NOT NULL,
   `max_latency` BIGINT(20) UNSIGNED NOT NULL,
   `avg_latency` BIGINT(20) UNSIGNED NOT NULL,
   `lock_latency` BIGINT(20) UNSIGNED NOT NULL,
   `rows_sent` BIGINT(20) UNSIGNED NOT NULL,
   `rows_sent_avg` DECIMAL(21) NOT NULL DEFAULT '0',
   `rows_examined` BIGINT(20) UNSIGNED NOT NULL,
   `rows_examined_avg` DECIMAL(21) NOT NULL DEFAULT '0',
   `rows_affected` BIGINT(20) UNSIGNED NOT NULL,
   `rows_affected_avg` DECIMAL(21) NOT NULL DEFAULT '0',
   `tmp_tables` BIGINT(20) UNSIGNED NOT NULL,
   `tmp_disk_tables` BIGINT(20) UNSIGNED NOT NULL,
   `rows_sorted` BIGINT(20) UNSIGNED NOT NULL,
   `sort_merge_passes` BIGINT(20) UNSIGNED NOT NULL,
   `digest` VARCHAR(32) NULL DEFAULT NULL,
   `first_seen` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
   `last_seen` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM;



# Dump of table x$statements_with_errors_or_warnings
# ------------------------------------------------------------

DROP VIEW IF EXISTS `x$statements_with_errors_or_warnings`;

CREATE TABLE `x$statements_with_errors_or_warnings` (
   `query` LONGTEXT NULL DEFAULT NULL,
   `db` VARCHAR(64) NULL DEFAULT NULL,
   `exec_count` BIGINT(20) UNSIGNED NOT NULL,
   `errors` BIGINT(20) UNSIGNED NOT NULL,
   `error_pct` DECIMAL(27) NOT NULL DEFAULT '0.0000',
   `warnings` BIGINT(20) UNSIGNED NOT NULL,
   `warning_pct` DECIMAL(27) NOT NULL DEFAULT '0.0000',
   `first_seen` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
   `last_seen` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
   `digest` VARCHAR(32) NULL DEFAULT NULL
) ENGINE=MyISAM;



# Dump of table x$statements_with_full_table_scans
# ------------------------------------------------------------

DROP VIEW IF EXISTS `x$statements_with_full_table_scans`;

CREATE TABLE `x$statements_with_full_table_scans` (
   `query` LONGTEXT NULL DEFAULT NULL,
   `db` VARCHAR(64) NULL DEFAULT NULL,
   `exec_count` BIGINT(20) UNSIGNED NOT NULL,
   `total_latency` BIGINT(20) UNSIGNED NOT NULL,
   `no_index_used_count` BIGINT(20) UNSIGNED NOT NULL,
   `no_good_index_used_count` BIGINT(20) UNSIGNED NOT NULL,
   `no_index_used_pct` DECIMAL(24) NOT NULL DEFAULT '0',
   `rows_sent` BIGINT(20) UNSIGNED NOT NULL,
   `rows_examined` BIGINT(20) UNSIGNED NOT NULL,
   `rows_sent_avg` DECIMAL(21) UNSIGNED NULL DEFAULT NULL,
   `rows_examined_avg` DECIMAL(21) UNSIGNED NULL DEFAULT NULL,
   `first_seen` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
   `last_seen` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
   `digest` VARCHAR(32) NULL DEFAULT NULL
) ENGINE=MyISAM;



# Dump of table x$statements_with_runtimes_in_95th_percentile
# ------------------------------------------------------------

DROP VIEW IF EXISTS `x$statements_with_runtimes_in_95th_percentile`;

CREATE TABLE `x$statements_with_runtimes_in_95th_percentile` (
   `query` LONGTEXT NULL DEFAULT NULL,
   `db` VARCHAR(64) NULL DEFAULT NULL,
   `full_scan` VARCHAR(1) NOT NULL DEFAULT '',
   `exec_count` BIGINT(20) UNSIGNED NOT NULL,
   `err_count` BIGINT(20) UNSIGNED NOT NULL,
   `warn_count` BIGINT(20) UNSIGNED NOT NULL,
   `total_latency` BIGINT(20) UNSIGNED NOT NULL,
   `max_latency` BIGINT(20) UNSIGNED NOT NULL,
   `avg_latency` BIGINT(20) UNSIGNED NOT NULL,
   `rows_sent` BIGINT(20) UNSIGNED NOT NULL,
   `rows_sent_avg` DECIMAL(21) NOT NULL DEFAULT '0',
   `rows_examined` BIGINT(20) UNSIGNED NOT NULL,
   `rows_examined_avg` DECIMAL(21) NOT NULL DEFAULT '0',
   `first_seen` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
   `last_seen` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
   `digest` VARCHAR(32) NULL DEFAULT NULL
) ENGINE=MyISAM;



# Dump of table x$statements_with_sorting
# ------------------------------------------------------------

DROP VIEW IF EXISTS `x$statements_with_sorting`;

CREATE TABLE `x$statements_with_sorting` (
   `query` LONGTEXT NULL DEFAULT NULL,
   `db` VARCHAR(64) NULL DEFAULT NULL,
   `exec_count` BIGINT(20) UNSIGNED NOT NULL,
   `total_latency` BIGINT(20) UNSIGNED NOT NULL,
   `sort_merge_passes` BIGINT(20) UNSIGNED NOT NULL,
   `avg_sort_merges` DECIMAL(21) NOT NULL DEFAULT '0',
   `sorts_using_scans` BIGINT(20) UNSIGNED NOT NULL,
   `sort_using_range` BIGINT(20) UNSIGNED NOT NULL,
   `rows_sorted` BIGINT(20) UNSIGNED NOT NULL,
   `avg_rows_sorted` DECIMAL(21) NOT NULL DEFAULT '0',
   `first_seen` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
   `last_seen` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
   `digest` VARCHAR(32) NULL DEFAULT NULL
) ENGINE=MyISAM;



# Dump of table x$statements_with_temp_tables
# ------------------------------------------------------------

DROP VIEW IF EXISTS `x$statements_with_temp_tables`;

CREATE TABLE `x$statements_with_temp_tables` (
   `query` LONGTEXT NULL DEFAULT NULL,
   `db` VARCHAR(64) NULL DEFAULT NULL,
   `exec_count` BIGINT(20) UNSIGNED NOT NULL,
   `total_latency` BIGINT(20) UNSIGNED NOT NULL,
   `memory_tmp_tables` BIGINT(20) UNSIGNED NOT NULL,
   `disk_tmp_tables` BIGINT(20) UNSIGNED NOT NULL,
   `avg_tmp_tables_per_query` DECIMAL(21) NOT NULL DEFAULT '0',
   `tmp_tables_to_disk_pct` DECIMAL(24) NOT NULL DEFAULT '0',
   `first_seen` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
   `last_seen` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
   `digest` VARCHAR(32) NULL DEFAULT NULL
) ENGINE=MyISAM;



# Dump of table x$user_summary
# ------------------------------------------------------------

DROP VIEW IF EXISTS `x$user_summary`;

CREATE TABLE `x$user_summary` (
   `user` VARCHAR(32) NULL DEFAULT NULL,
   `statements` DECIMAL(64) NULL DEFAULT NULL,
   `statement_latency` DECIMAL(64) NULL DEFAULT NULL,
   `statement_avg_latency` DECIMAL(65) NOT NULL DEFAULT '0.0000',
   `table_scans` DECIMAL(65) NULL DEFAULT NULL,
   `file_ios` DECIMAL(64) NULL DEFAULT NULL,
   `file_io_latency` DECIMAL(64) NULL DEFAULT NULL,
   `current_connections` DECIMAL(41) NULL DEFAULT NULL,
   `total_connections` DECIMAL(41) NULL DEFAULT NULL,
   `unique_hosts` BIGINT(21) NOT NULL DEFAULT '0',
   `current_memory` DECIMAL(63) NULL DEFAULT NULL,
   `total_memory_allocated` DECIMAL(64) NULL DEFAULT NULL
) ENGINE=MyISAM;



# Dump of table x$user_summary_by_file_io
# ------------------------------------------------------------

DROP VIEW IF EXISTS `x$user_summary_by_file_io`;

CREATE TABLE `x$user_summary_by_file_io` (
   `user` VARCHAR(32) NULL DEFAULT NULL,
   `ios` DECIMAL(42) NULL DEFAULT NULL,
   `io_latency` DECIMAL(42) NULL DEFAULT NULL
) ENGINE=MyISAM;



# Dump of table x$user_summary_by_file_io_type
# ------------------------------------------------------------

DROP VIEW IF EXISTS `x$user_summary_by_file_io_type`;

CREATE TABLE `x$user_summary_by_file_io_type` (
   `user` VARCHAR(32) NULL DEFAULT NULL,
   `event_name` VARCHAR(128) NOT NULL,
   `total` BIGINT(20) UNSIGNED NOT NULL,
   `latency` BIGINT(20) UNSIGNED NOT NULL,
   `max_latency` BIGINT(20) UNSIGNED NOT NULL
) ENGINE=MyISAM;



# Dump of table x$user_summary_by_stages
# ------------------------------------------------------------

DROP VIEW IF EXISTS `x$user_summary_by_stages`;

CREATE TABLE `x$user_summary_by_stages` (
   `user` VARCHAR(32) NULL DEFAULT NULL,
   `event_name` VARCHAR(128) NOT NULL,
   `total` BIGINT(20) UNSIGNED NOT NULL,
   `total_latency` BIGINT(20) UNSIGNED NOT NULL,
   `avg_latency` BIGINT(20) UNSIGNED NOT NULL
) ENGINE=MyISAM;



# Dump of table x$user_summary_by_statement_latency
# ------------------------------------------------------------

DROP VIEW IF EXISTS `x$user_summary_by_statement_latency`;

CREATE TABLE `x$user_summary_by_statement_latency` (
   `user` VARCHAR(32) NULL DEFAULT NULL,
   `total` DECIMAL(42) NULL DEFAULT NULL,
   `total_latency` DECIMAL(42) NULL DEFAULT NULL,
   `max_latency` DECIMAL(42) NULL DEFAULT NULL,
   `lock_latency` DECIMAL(42) NULL DEFAULT NULL,
   `rows_sent` DECIMAL(42) NULL DEFAULT NULL,
   `rows_examined` DECIMAL(42) NULL DEFAULT NULL,
   `rows_affected` DECIMAL(42) NULL DEFAULT NULL,
   `full_scans` DECIMAL(43) NULL DEFAULT NULL
) ENGINE=MyISAM;



# Dump of table x$user_summary_by_statement_type
# ------------------------------------------------------------

DROP VIEW IF EXISTS `x$user_summary_by_statement_type`;

CREATE TABLE `x$user_summary_by_statement_type` (
   `user` VARCHAR(32) NULL DEFAULT NULL,
   `statement` VARCHAR(128) NULL DEFAULT NULL,
   `total` BIGINT(20) UNSIGNED NOT NULL,
   `total_latency` BIGINT(20) UNSIGNED NOT NULL,
   `max_latency` BIGINT(20) UNSIGNED NOT NULL,
   `lock_latency` BIGINT(20) UNSIGNED NOT NULL,
   `rows_sent` BIGINT(20) UNSIGNED NOT NULL,
   `rows_examined` BIGINT(20) UNSIGNED NOT NULL,
   `rows_affected` BIGINT(20) UNSIGNED NOT NULL,
   `full_scans` BIGINT(21) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM;



# Dump of table x$wait_classes_global_by_avg_latency
# ------------------------------------------------------------

DROP VIEW IF EXISTS `x$wait_classes_global_by_avg_latency`;

CREATE TABLE `x$wait_classes_global_by_avg_latency` (
   `event_class` VARCHAR(128) NULL DEFAULT NULL,
   `total` DECIMAL(42) NULL DEFAULT NULL,
   `total_latency` DECIMAL(42) NULL DEFAULT NULL,
   `min_latency` BIGINT(20) UNSIGNED NULL DEFAULT NULL,
   `avg_latency` DECIMAL(46) NOT NULL DEFAULT '0.0000',
   `max_latency` BIGINT(20) UNSIGNED NULL DEFAULT NULL
) ENGINE=MyISAM;



# Dump of table x$wait_classes_global_by_latency
# ------------------------------------------------------------

DROP VIEW IF EXISTS `x$wait_classes_global_by_latency`;

CREATE TABLE `x$wait_classes_global_by_latency` (
   `event_class` VARCHAR(128) NULL DEFAULT NULL,
   `total` DECIMAL(42) NULL DEFAULT NULL,
   `total_latency` DECIMAL(42) NULL DEFAULT NULL,
   `min_latency` BIGINT(20) UNSIGNED NULL DEFAULT NULL,
   `avg_latency` DECIMAL(46) NOT NULL DEFAULT '0.0000',
   `max_latency` BIGINT(20) UNSIGNED NULL DEFAULT NULL
) ENGINE=MyISAM;



# Dump of table x$waits_by_host_by_latency
# ------------------------------------------------------------

DROP VIEW IF EXISTS `x$waits_by_host_by_latency`;

CREATE TABLE `x$waits_by_host_by_latency` (
   `host` VARCHAR(60) NULL DEFAULT NULL,
   `event` VARCHAR(128) NOT NULL,
   `total` BIGINT(20) UNSIGNED NOT NULL,
   `total_latency` BIGINT(20) UNSIGNED NOT NULL,
   `avg_latency` BIGINT(20) UNSIGNED NOT NULL,
   `max_latency` BIGINT(20) UNSIGNED NOT NULL
) ENGINE=MyISAM;



# Dump of table x$waits_by_user_by_latency
# ------------------------------------------------------------

DROP VIEW IF EXISTS `x$waits_by_user_by_latency`;

CREATE TABLE `x$waits_by_user_by_latency` (
   `user` VARCHAR(32) NULL DEFAULT NULL,
   `event` VARCHAR(128) NOT NULL,
   `total` BIGINT(20) UNSIGNED NOT NULL,
   `total_latency` BIGINT(20) UNSIGNED NOT NULL,
   `avg_latency` BIGINT(20) UNSIGNED NOT NULL,
   `max_latency` BIGINT(20) UNSIGNED NOT NULL
) ENGINE=MyISAM;



# Dump of table x$waits_global_by_latency
# ------------------------------------------------------------

DROP VIEW IF EXISTS `x$waits_global_by_latency`;

CREATE TABLE `x$waits_global_by_latency` (
   `events` VARCHAR(128) NOT NULL,
   `total` BIGINT(20) UNSIGNED NOT NULL,
   `total_latency` BIGINT(20) UNSIGNED NOT NULL,
   `avg_latency` BIGINT(20) UNSIGNED NOT NULL,
   `max_latency` BIGINT(20) UNSIGNED NOT NULL
) ENGINE=MyISAM;





# Replace placeholder table for wait_classes_global_by_latency with correct view syntax
# ------------------------------------------------------------

DROP TABLE `wait_classes_global_by_latency`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `wait_classes_global_by_latency`
AS SELECT
   substring_index(`performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME`,'/',3) AS `event_class`,sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`COUNT_STAR`) AS `total`,
   `sys`.`format_time`(sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT`)) AS `total_latency`,
   `sys`.`format_time`(min(`performance_schema`.`events_waits_summary_global_by_event_name`.`MIN_TIMER_WAIT`)) AS `min_latency`,
   `sys`.`format_time`(ifnull((sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT`) / nullif(sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`COUNT_STAR`),0)),0)) AS `avg_latency`,
   `sys`.`format_time`(max(`performance_schema`.`events_waits_summary_global_by_event_name`.`MAX_TIMER_WAIT`)) AS `max_latency`
FROM `performance_schema`.`events_waits_summary_global_by_event_name` where ((`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT` > 0) and (`performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME` <> 'idle')) group by substring_index(`performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME`,'/',3) order by sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT`) desc;


# Replace placeholder table for x$io_global_by_file_by_bytes with correct view syntax
# ------------------------------------------------------------

DROP TABLE `x$io_global_by_file_by_bytes`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$io_global_by_file_by_bytes`
AS SELECT
   `performance_schema`.`file_summary_by_instance`.`FILE_NAME` AS `file`,
   `performance_schema`.`file_summary_by_instance`.`COUNT_READ` AS `count_read`,
   `performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_READ` AS `total_read`,ifnull((`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_READ` / nullif(`performance_schema`.`file_summary_by_instance`.`COUNT_READ`,0)),0) AS `avg_read`,
   `performance_schema`.`file_summary_by_instance`.`COUNT_WRITE` AS `count_write`,
   `performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_WRITE` AS `total_written`,ifnull((`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_WRITE` / nullif(`performance_schema`.`file_summary_by_instance`.`COUNT_WRITE`,0)),0.00) AS `avg_write`,(`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_READ` + `performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_WRITE`) AS `total`,ifnull(round((100 - ((`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_READ` / nullif((`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_READ` + `performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_WRITE`),0)) * 100)),2),0.00) AS `write_pct`
FROM `performance_schema`.`file_summary_by_instance` order by (`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_READ` + `performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_WRITE`) desc;


# Replace placeholder table for x$memory_global_by_current_bytes with correct view syntax
# ------------------------------------------------------------

DROP TABLE `x$memory_global_by_current_bytes`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$memory_global_by_current_bytes`
AS SELECT
   `performance_schema`.`memory_summary_global_by_event_name`.`EVENT_NAME` AS `event_name`,
   `performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_COUNT_USED` AS `current_count`,
   `performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED` AS `current_alloc`,ifnull((`performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED` / nullif(`performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_COUNT_USED`,0)),0) AS `current_avg_alloc`,
   `performance_schema`.`memory_summary_global_by_event_name`.`HIGH_COUNT_USED` AS `high_count`,
   `performance_schema`.`memory_summary_global_by_event_name`.`HIGH_NUMBER_OF_BYTES_USED` AS `high_alloc`,ifnull((`performance_schema`.`memory_summary_global_by_event_name`.`HIGH_NUMBER_OF_BYTES_USED` / nullif(`performance_schema`.`memory_summary_global_by_event_name`.`HIGH_COUNT_USED`,0)),0) AS `high_avg_alloc`
FROM `performance_schema`.`memory_summary_global_by_event_name` where (`performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED` > 0) order by `performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED` desc;


# Replace placeholder table for waits_global_by_latency with correct view syntax
# ------------------------------------------------------------

DROP TABLE `waits_global_by_latency`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `waits_global_by_latency`
AS SELECT
   `performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME` AS `events`,
   `performance_schema`.`events_waits_summary_global_by_event_name`.`COUNT_STAR` AS `total`,
   `sys`.`format_time`(`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,
   `sys`.`format_time`(`performance_schema`.`events_waits_summary_global_by_event_name`.`AVG_TIMER_WAIT`) AS `avg_latency`,
   `sys`.`format_time`(`performance_schema`.`events_waits_summary_global_by_event_name`.`MAX_TIMER_WAIT`) AS `max_latency`
FROM `performance_schema`.`events_waits_summary_global_by_event_name` where ((`performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME` <> 'idle') and (`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT` > 0)) order by `performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT` desc;


# Replace placeholder table for memory_by_host_by_current_bytes with correct view syntax
# ------------------------------------------------------------

DROP TABLE `memory_by_host_by_current_bytes`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `memory_by_host_by_current_bytes`
AS SELECT
   if(isnull(`performance_schema`.`memory_summary_by_host_by_event_name`.`HOST`),'background',`performance_schema`.`memory_summary_by_host_by_event_name`.`HOST`) AS `host`,sum(`performance_schema`.`memory_summary_by_host_by_event_name`.`CURRENT_COUNT_USED`) AS `current_count_used`,
   `sys`.`format_bytes`(sum(`performance_schema`.`memory_summary_by_host_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`)) AS `current_allocated`,
   `sys`.`format_bytes`(ifnull((sum(`performance_schema`.`memory_summary_by_host_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) / nullif(sum(`performance_schema`.`memory_summary_by_host_by_event_name`.`CURRENT_COUNT_USED`),0)),0)) AS `current_avg_alloc`,
   `sys`.`format_bytes`(max(`performance_schema`.`memory_summary_by_host_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`)) AS `current_max_alloc`,
   `sys`.`format_bytes`(sum(`performance_schema`.`memory_summary_by_host_by_event_name`.`SUM_NUMBER_OF_BYTES_ALLOC`)) AS `total_allocated`
FROM `performance_schema`.`memory_summary_by_host_by_event_name` group by if(isnull(`performance_schema`.`memory_summary_by_host_by_event_name`.`HOST`),'background',`performance_schema`.`memory_summary_by_host_by_event_name`.`HOST`) order by sum(`performance_schema`.`memory_summary_by_host_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) desc;


# Replace placeholder table for memory_global_total with correct view syntax
# ------------------------------------------------------------

DROP TABLE `memory_global_total`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `memory_global_total`
AS SELECT
   `sys`.`format_bytes`(sum(`performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`)) AS `total_allocated`
FROM `performance_schema`.`memory_summary_global_by_event_name`;


# Replace placeholder table for x$host_summary with correct view syntax
# ------------------------------------------------------------

DROP TABLE `x$host_summary`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$host_summary`
AS SELECT
   if(isnull(`performance_schema`.`accounts`.`HOST`),'background',`performance_schema`.`accounts`.`HOST`) AS `host`,sum(`stmt`.`total`) AS `statements`,sum(`stmt`.`total_latency`) AS `statement_latency`,(sum(`stmt`.`total_latency`) / sum(`stmt`.`total`)) AS `statement_avg_latency`,sum(`stmt`.`full_scans`) AS `table_scans`,sum(`io`.`ios`) AS `file_ios`,sum(`io`.`io_latency`) AS `file_io_latency`,sum(`performance_schema`.`accounts`.`CURRENT_CONNECTIONS`) AS `current_connections`,sum(`performance_schema`.`accounts`.`TOTAL_CONNECTIONS`) AS `total_connections`,count(distinct `performance_schema`.`accounts`.`USER`) AS `unique_users`,sum(`mem`.`current_allocated`) AS `current_memory`,sum(`mem`.`total_allocated`) AS `total_memory_allocated`
FROM (((`performance_schema`.`accounts` join `sys`.`x$host_summary_by_statement_latency` `stmt` on((`performance_schema`.`accounts`.`HOST` = `stmt`.`host`))) join `sys`.`x$host_summary_by_file_io` `io` on((`performance_schema`.`accounts`.`HOST` = `io`.`host`))) join `sys`.`x$memory_by_host_by_current_bytes` `mem` on((`performance_schema`.`accounts`.`HOST` = `mem`.`host`))) group by if(isnull(`performance_schema`.`accounts`.`HOST`),'background',`performance_schema`.`accounts`.`HOST`);


# Replace placeholder table for innodb_buffer_stats_by_table with correct view syntax
# ------------------------------------------------------------

DROP TABLE `innodb_buffer_stats_by_table`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `innodb_buffer_stats_by_table`
AS SELECT
   if((locate('.',`ibp`.`TABLE_NAME`) = 0),'InnoDB System',replace(substring_index(`ibp`.`TABLE_NAME`,'.',1),'`','')) AS `object_schema`,replace(substring_index(`ibp`.`TABLE_NAME`,'.',-(1)),'`','') AS `object_name`,
   `sys`.`format_bytes`(sum(if((`ibp`.`COMPRESSED_SIZE` = 0),16384,`ibp`.`COMPRESSED_SIZE`))) AS `allocated`,
   `sys`.`format_bytes`(sum(`ibp`.`DATA_SIZE`)) AS `data`,count(`ibp`.`PAGE_NUMBER`) AS `pages`,count(if((`ibp`.`IS_HASHED` = 'YES'),1,0)) AS `pages_hashed`,count(if((`ibp`.`IS_OLD` = 'YES'),1,0)) AS `pages_old`,round((sum(`ibp`.`NUMBER_RECORDS`) / count(distinct `ibp`.`INDEX_NAME`)),0) AS `rows_cached`
FROM `information_schema`.`innodb_buffer_page` `ibp` where (`ibp`.`TABLE_NAME` is not null) group by `object_schema`,`object_name` order by sum(if((`ibp`.`COMPRESSED_SIZE` = 0),16384,`ibp`.`COMPRESSED_SIZE`)) desc;


# Replace placeholder table for host_summary_by_statement_type with correct view syntax
# ------------------------------------------------------------

DROP TABLE `host_summary_by_statement_type`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `host_summary_by_statement_type`
AS SELECT
   if(isnull(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST`),'background',`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST`) AS `host`,substring_index(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`EVENT_NAME`,'/',-(1)) AS `statement`,
   `performance_schema`.`events_statements_summary_by_host_by_event_name`.`COUNT_STAR` AS `total`,
   `sys`.`format_time`(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,
   `sys`.`format_time`(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`MAX_TIMER_WAIT`) AS `max_latency`,
   `sys`.`format_time`(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_LOCK_TIME`) AS `lock_latency`,
   `performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_ROWS_SENT` AS `rows_sent`,
   `performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_ROWS_EXAMINED` AS `rows_examined`,
   `performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_ROWS_AFFECTED` AS `rows_affected`,(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_NO_INDEX_USED` + `performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_NO_GOOD_INDEX_USED`) AS `full_scans`
FROM `performance_schema`.`events_statements_summary_by_host_by_event_name` where (`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` <> 0) order by if(isnull(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST`),'background',`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST`),`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` desc;


# Replace placeholder table for x$innodb_lock_waits with correct view syntax
# ------------------------------------------------------------

DROP TABLE `x$innodb_lock_waits`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$innodb_lock_waits`
AS SELECT
   `r`.`trx_wait_started` AS `wait_started`,timediff(now(),`r`.`trx_wait_started`) AS `wait_age`,timestampdiff(SECOND,`r`.`trx_wait_started`,now()) AS `wait_age_secs`,
   `rl`.`lock_table` AS `locked_table`,
   `rl`.`lock_index` AS `locked_index`,
   `rl`.`lock_type` AS `locked_type`,
   `r`.`trx_id` AS `waiting_trx_id`,
   `r`.`trx_started` AS `waiting_trx_started`,timediff(now(),`r`.`trx_started`) AS `waiting_trx_age`,
   `r`.`trx_rows_locked` AS `waiting_trx_rows_locked`,
   `r`.`trx_rows_modified` AS `waiting_trx_rows_modified`,
   `r`.`trx_mysql_thread_id` AS `waiting_pid`,
   `r`.`trx_query` AS `waiting_query`,
   `rl`.`lock_id` AS `waiting_lock_id`,
   `rl`.`lock_mode` AS `waiting_lock_mode`,
   `b`.`trx_id` AS `blocking_trx_id`,
   `b`.`trx_mysql_thread_id` AS `blocking_pid`,
   `b`.`trx_query` AS `blocking_query`,
   `bl`.`lock_id` AS `blocking_lock_id`,
   `bl`.`lock_mode` AS `blocking_lock_mode`,
   `b`.`trx_started` AS `blocking_trx_started`,timediff(now(),`b`.`trx_started`) AS `blocking_trx_age`,
   `b`.`trx_rows_locked` AS `blocking_trx_rows_locked`,
   `b`.`trx_rows_modified` AS `blocking_trx_rows_modified`,concat('KILL QUERY ',`b`.`trx_mysql_thread_id`) AS `sql_kill_blocking_query`,concat('KILL ',`b`.`trx_mysql_thread_id`) AS `sql_kill_blocking_connection`
FROM ((((`information_schema`.`innodb_lock_waits` `w` join `information_schema`.`innodb_trx` `b` on((`b`.`trx_id` = `w`.`blocking_trx_id`))) join `information_schema`.`innodb_trx` `r` on((`r`.`trx_id` = `w`.`requesting_trx_id`))) join `information_schema`.`innodb_locks` `bl` on((`bl`.`lock_id` = `w`.`blocking_lock_id`))) join `information_schema`.`innodb_locks` `rl` on((`rl`.`lock_id` = `w`.`requested_lock_id`))) order by `r`.`trx_wait_started`;


# Replace placeholder table for x$host_summary_by_statement_type with correct view syntax
# ------------------------------------------------------------

DROP TABLE `x$host_summary_by_statement_type`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$host_summary_by_statement_type`
AS SELECT
   if(isnull(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST`),'background',`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST`) AS `host`,substring_index(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`EVENT_NAME`,'/',-(1)) AS `statement`,
   `performance_schema`.`events_statements_summary_by_host_by_event_name`.`COUNT_STAR` AS `total`,
   `performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` AS `total_latency`,
   `performance_schema`.`events_statements_summary_by_host_by_event_name`.`MAX_TIMER_WAIT` AS `max_latency`,
   `performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_LOCK_TIME` AS `lock_latency`,
   `performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_ROWS_SENT` AS `rows_sent`,
   `performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_ROWS_EXAMINED` AS `rows_examined`,
   `performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_ROWS_AFFECTED` AS `rows_affected`,(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_NO_INDEX_USED` + `performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_NO_GOOD_INDEX_USED`) AS `full_scans`
FROM `performance_schema`.`events_statements_summary_by_host_by_event_name` where (`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` <> 0) order by if(isnull(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST`),'background',`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST`),`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` desc;


# Replace placeholder table for x$user_summary_by_stages with correct view syntax
# ------------------------------------------------------------

DROP TABLE `x$user_summary_by_stages`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$user_summary_by_stages`
AS SELECT
   if(isnull(`performance_schema`.`events_stages_summary_by_user_by_event_name`.`USER`),'background',`performance_schema`.`events_stages_summary_by_user_by_event_name`.`USER`) AS `user`,
   `performance_schema`.`events_stages_summary_by_user_by_event_name`.`EVENT_NAME` AS `event_name`,
   `performance_schema`.`events_stages_summary_by_user_by_event_name`.`COUNT_STAR` AS `total`,
   `performance_schema`.`events_stages_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` AS `total_latency`,
   `performance_schema`.`events_stages_summary_by_user_by_event_name`.`AVG_TIMER_WAIT` AS `avg_latency`
FROM `performance_schema`.`events_stages_summary_by_user_by_event_name` where (`performance_schema`.`events_stages_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` <> 0) order by if(isnull(`performance_schema`.`events_stages_summary_by_user_by_event_name`.`USER`),'background',`performance_schema`.`events_stages_summary_by_user_by_event_name`.`USER`),`performance_schema`.`events_stages_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` desc;


# Replace placeholder table for host_summary_by_statement_latency with correct view syntax
# ------------------------------------------------------------

DROP TABLE `host_summary_by_statement_latency`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `host_summary_by_statement_latency`
AS SELECT
   if(isnull(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST`),'background',`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST`) AS `host`,sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`COUNT_STAR`) AS `total`,
   `sys`.`format_time`(sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_TIMER_WAIT`)) AS `total_latency`,
   `sys`.`format_time`(sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`MAX_TIMER_WAIT`)) AS `max_latency`,
   `sys`.`format_time`(sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_LOCK_TIME`)) AS `lock_latency`,sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_ROWS_SENT`) AS `rows_sent`,sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_ROWS_EXAMINED`) AS `rows_examined`,sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_ROWS_AFFECTED`) AS `rows_affected`,(sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_NO_INDEX_USED`) + sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_NO_GOOD_INDEX_USED`)) AS `full_scans`
FROM `performance_schema`.`events_statements_summary_by_host_by_event_name` group by if(isnull(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST`),'background',`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST`) order by sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_TIMER_WAIT`) desc;


# Replace placeholder table for memory_by_user_by_current_bytes with correct view syntax
# ------------------------------------------------------------

DROP TABLE `memory_by_user_by_current_bytes`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `memory_by_user_by_current_bytes`
AS SELECT
   if(isnull(`performance_schema`.`memory_summary_by_user_by_event_name`.`USER`),'background',`performance_schema`.`memory_summary_by_user_by_event_name`.`USER`) AS `user`,sum(`performance_schema`.`memory_summary_by_user_by_event_name`.`CURRENT_COUNT_USED`) AS `current_count_used`,
   `sys`.`format_bytes`(sum(`performance_schema`.`memory_summary_by_user_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`)) AS `current_allocated`,
   `sys`.`format_bytes`(ifnull((sum(`performance_schema`.`memory_summary_by_user_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) / nullif(sum(`performance_schema`.`memory_summary_by_user_by_event_name`.`CURRENT_COUNT_USED`),0)),0)) AS `current_avg_alloc`,
   `sys`.`format_bytes`(max(`performance_schema`.`memory_summary_by_user_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`)) AS `current_max_alloc`,
   `sys`.`format_bytes`(sum(`performance_schema`.`memory_summary_by_user_by_event_name`.`SUM_NUMBER_OF_BYTES_ALLOC`)) AS `total_allocated`
FROM `performance_schema`.`memory_summary_by_user_by_event_name` group by if(isnull(`performance_schema`.`memory_summary_by_user_by_event_name`.`USER`),'background',`performance_schema`.`memory_summary_by_user_by_event_name`.`USER`) order by sum(`performance_schema`.`memory_summary_by_user_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) desc;


# Replace placeholder table for x$user_summary_by_statement_latency with correct view syntax
# ------------------------------------------------------------

DROP TABLE `x$user_summary_by_statement_latency`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$user_summary_by_statement_latency`
AS SELECT
   if(isnull(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER`),'background',`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER`) AS `user`,sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`COUNT_STAR`) AS `total`,sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`MAX_TIMER_WAIT`) AS `max_latency`,sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_LOCK_TIME`) AS `lock_latency`,sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_ROWS_SENT`) AS `rows_sent`,sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_ROWS_EXAMINED`) AS `rows_examined`,sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_ROWS_AFFECTED`) AS `rows_affected`,(sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_NO_INDEX_USED`) + sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_NO_GOOD_INDEX_USED`)) AS `full_scans`
FROM `performance_schema`.`events_statements_summary_by_user_by_event_name` group by if(isnull(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER`),'background',`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER`) order by sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_TIMER_WAIT`) desc;


# Replace placeholder table for x$memory_by_host_by_current_bytes with correct view syntax
# ------------------------------------------------------------

DROP TABLE `x$memory_by_host_by_current_bytes`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$memory_by_host_by_current_bytes`
AS SELECT
   if(isnull(`performance_schema`.`memory_summary_by_host_by_event_name`.`HOST`),'background',`performance_schema`.`memory_summary_by_host_by_event_name`.`HOST`) AS `host`,sum(`performance_schema`.`memory_summary_by_host_by_event_name`.`CURRENT_COUNT_USED`) AS `current_count_used`,sum(`performance_schema`.`memory_summary_by_host_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) AS `current_allocated`,ifnull((sum(`performance_schema`.`memory_summary_by_host_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) / nullif(sum(`performance_schema`.`memory_summary_by_host_by_event_name`.`CURRENT_COUNT_USED`),0)),0) AS `current_avg_alloc`,max(`performance_schema`.`memory_summary_by_host_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) AS `current_max_alloc`,sum(`performance_schema`.`memory_summary_by_host_by_event_name`.`SUM_NUMBER_OF_BYTES_ALLOC`) AS `total_allocated`
FROM `performance_schema`.`memory_summary_by_host_by_event_name` group by if(isnull(`performance_schema`.`memory_summary_by_host_by_event_name`.`HOST`),'background',`performance_schema`.`memory_summary_by_host_by_event_name`.`HOST`) order by sum(`performance_schema`.`memory_summary_by_host_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) desc;


# Replace placeholder table for x$statements_with_temp_tables with correct view syntax
# ------------------------------------------------------------

DROP TABLE `x$statements_with_temp_tables`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$statements_with_temp_tables`
AS SELECT
   `performance_schema`.`events_statements_summary_by_digest`.`DIGEST_TEXT` AS `query`,
   `performance_schema`.`events_statements_summary_by_digest`.`SCHEMA_NAME` AS `db`,
   `performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR` AS `exec_count`,
   `performance_schema`.`events_statements_summary_by_digest`.`SUM_TIMER_WAIT` AS `total_latency`,
   `performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_TABLES` AS `memory_tmp_tables`,
   `performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_DISK_TABLES` AS `disk_tmp_tables`,round(ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_TABLES` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0),0) AS `avg_tmp_tables_per_query`,round((ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_DISK_TABLES` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_TABLES`,0)),0) * 100),0) AS `tmp_tables_to_disk_pct`,
   `performance_schema`.`events_statements_summary_by_digest`.`FIRST_SEEN` AS `first_seen`,
   `performance_schema`.`events_statements_summary_by_digest`.`LAST_SEEN` AS `last_seen`,
   `performance_schema`.`events_statements_summary_by_digest`.`DIGEST` AS `digest`
FROM `performance_schema`.`events_statements_summary_by_digest` where (`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_TABLES` > 0) order by `performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_DISK_TABLES` desc,`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_TABLES` desc;


# Replace placeholder table for x$io_global_by_wait_by_latency with correct view syntax
# ------------------------------------------------------------

DROP TABLE `x$io_global_by_wait_by_latency`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$io_global_by_wait_by_latency`
AS SELECT
   substring_index(`performance_schema`.`file_summary_by_event_name`.`EVENT_NAME`,'/',-(2)) AS `event_name`,
   `performance_schema`.`file_summary_by_event_name`.`COUNT_STAR` AS `total`,
   `performance_schema`.`file_summary_by_event_name`.`SUM_TIMER_WAIT` AS `total_latency`,
   `performance_schema`.`file_summary_by_event_name`.`AVG_TIMER_WAIT` AS `avg_latency`,
   `performance_schema`.`file_summary_by_event_name`.`MAX_TIMER_WAIT` AS `max_latency`,
   `performance_schema`.`file_summary_by_event_name`.`SUM_TIMER_READ` AS `read_latency`,
   `performance_schema`.`file_summary_by_event_name`.`SUM_TIMER_WRITE` AS `write_latency`,
   `performance_schema`.`file_summary_by_event_name`.`SUM_TIMER_MISC` AS `misc_latency`,
   `performance_schema`.`file_summary_by_event_name`.`COUNT_READ` AS `count_read`,
   `performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_READ` AS `total_read`,ifnull((`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_READ` / nullif(`performance_schema`.`file_summary_by_event_name`.`COUNT_READ`,0)),0) AS `avg_read`,
   `performance_schema`.`file_summary_by_event_name`.`COUNT_WRITE` AS `count_write`,
   `performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_WRITE` AS `total_written`,ifnull((`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_WRITE` / nullif(`performance_schema`.`file_summary_by_event_name`.`COUNT_WRITE`,0)),0) AS `avg_written`
FROM `performance_schema`.`file_summary_by_event_name` where ((`performance_schema`.`file_summary_by_event_name`.`EVENT_NAME` like 'wait/io/file/%') and (`performance_schema`.`file_summary_by_event_name`.`COUNT_STAR` > 0)) order by `performance_schema`.`file_summary_by_event_name`.`SUM_TIMER_WAIT` desc;


# Replace placeholder table for statements_with_runtimes_in_95th_percentile with correct view syntax
# ------------------------------------------------------------

DROP TABLE `statements_with_runtimes_in_95th_percentile`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `statements_with_runtimes_in_95th_percentile`
AS SELECT
   `sys`.`format_statement`(`stmts`.`DIGEST_TEXT`) AS `query`,
   `stmts`.`SCHEMA_NAME` AS `db`,if(((`stmts`.`SUM_NO_GOOD_INDEX_USED` > 0) or (`stmts`.`SUM_NO_INDEX_USED` > 0)),'*','') AS `full_scan`,
   `stmts`.`COUNT_STAR` AS `exec_count`,
   `stmts`.`SUM_ERRORS` AS `err_count`,
   `stmts`.`SUM_WARNINGS` AS `warn_count`,
   `sys`.`format_time`(`stmts`.`SUM_TIMER_WAIT`) AS `total_latency`,
   `sys`.`format_time`(`stmts`.`MAX_TIMER_WAIT`) AS `max_latency`,
   `sys`.`format_time`(`stmts`.`AVG_TIMER_WAIT`) AS `avg_latency`,
   `stmts`.`SUM_ROWS_SENT` AS `rows_sent`,round(ifnull((`stmts`.`SUM_ROWS_SENT` / nullif(`stmts`.`COUNT_STAR`,0)),0),0) AS `rows_sent_avg`,
   `stmts`.`SUM_ROWS_EXAMINED` AS `rows_examined`,round(ifnull((`stmts`.`SUM_ROWS_EXAMINED` / nullif(`stmts`.`COUNT_STAR`,0)),0),0) AS `rows_examined_avg`,
   `stmts`.`FIRST_SEEN` AS `first_seen`,
   `stmts`.`LAST_SEEN` AS `last_seen`,
   `stmts`.`DIGEST` AS `digest`
FROM (`performance_schema`.`events_statements_summary_by_digest` `stmts` join `sys`.`x$ps_digest_95th_percentile_by_avg_us` `top_percentile` on((round((`stmts`.`AVG_TIMER_WAIT` / 1000000),0) >= `top_percentile`.`avg_us`))) order by `stmts`.`AVG_TIMER_WAIT` desc;


# Replace placeholder table for x$user_summary_by_statement_type with correct view syntax
# ------------------------------------------------------------

DROP TABLE `x$user_summary_by_statement_type`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$user_summary_by_statement_type`
AS SELECT
   if(isnull(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER`),'background',`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER`) AS `user`,substring_index(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`EVENT_NAME`,'/',-(1)) AS `statement`,
   `performance_schema`.`events_statements_summary_by_user_by_event_name`.`COUNT_STAR` AS `total`,
   `performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` AS `total_latency`,
   `performance_schema`.`events_statements_summary_by_user_by_event_name`.`MAX_TIMER_WAIT` AS `max_latency`,
   `performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_LOCK_TIME` AS `lock_latency`,
   `performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_ROWS_SENT` AS `rows_sent`,
   `performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_ROWS_EXAMINED` AS `rows_examined`,
   `performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_ROWS_AFFECTED` AS `rows_affected`,(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_NO_INDEX_USED` + `performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_NO_GOOD_INDEX_USED`) AS `full_scans`
FROM `performance_schema`.`events_statements_summary_by_user_by_event_name` where (`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` <> 0) order by if(isnull(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER`),'background',`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER`),`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` desc;


# Replace placeholder table for schema_unused_indexes with correct view syntax
# ------------------------------------------------------------

DROP TABLE `schema_unused_indexes`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `schema_unused_indexes`
AS SELECT
   `performance_schema`.`table_io_waits_summary_by_index_usage`.`OBJECT_SCHEMA` AS `object_schema`,
   `performance_schema`.`table_io_waits_summary_by_index_usage`.`OBJECT_NAME` AS `object_name`,
   `performance_schema`.`table_io_waits_summary_by_index_usage`.`INDEX_NAME` AS `index_name`
FROM `performance_schema`.`table_io_waits_summary_by_index_usage` where ((`performance_schema`.`table_io_waits_summary_by_index_usage`.`INDEX_NAME` is not null) and (`performance_schema`.`table_io_waits_summary_by_index_usage`.`COUNT_STAR` = 0) and (`performance_schema`.`table_io_waits_summary_by_index_usage`.`OBJECT_SCHEMA` <> 'mysql') and (`performance_schema`.`table_io_waits_summary_by_index_usage`.`INDEX_NAME` <> 'PRIMARY')) order by `performance_schema`.`table_io_waits_summary_by_index_usage`.`OBJECT_SCHEMA`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`OBJECT_NAME`;


# Replace placeholder table for x$session with correct view syntax
# ------------------------------------------------------------

DROP TABLE `x$session`;

CREATE ALGORITHM=UNDEFINED DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$session`
AS SELECT
   `x$processlist`.`thd_id` AS `thd_id`,
   `x$processlist`.`conn_id` AS `conn_id`,
   `x$processlist`.`user` AS `user`,
   `x$processlist`.`db` AS `db`,
   `x$processlist`.`command` AS `command`,
   `x$processlist`.`state` AS `state`,
   `x$processlist`.`time` AS `time`,
   `x$processlist`.`current_statement` AS `current_statement`,
   `x$processlist`.`statement_latency` AS `statement_latency`,
   `x$processlist`.`progress` AS `progress`,
   `x$processlist`.`lock_latency` AS `lock_latency`,
   `x$processlist`.`rows_examined` AS `rows_examined`,
   `x$processlist`.`rows_sent` AS `rows_sent`,
   `x$processlist`.`rows_affected` AS `rows_affected`,
   `x$processlist`.`tmp_tables` AS `tmp_tables`,
   `x$processlist`.`tmp_disk_tables` AS `tmp_disk_tables`,
   `x$processlist`.`full_scan` AS `full_scan`,
   `x$processlist`.`last_statement` AS `last_statement`,
   `x$processlist`.`last_statement_latency` AS `last_statement_latency`,
   `x$processlist`.`current_memory` AS `current_memory`,
   `x$processlist`.`last_wait` AS `last_wait`,
   `x$processlist`.`last_wait_latency` AS `last_wait_latency`,
   `x$processlist`.`source` AS `source`,
   `x$processlist`.`trx_latency` AS `trx_latency`,
   `x$processlist`.`trx_state` AS `trx_state`,
   `x$processlist`.`trx_autocommit` AS `trx_autocommit`,
   `x$processlist`.`pid` AS `pid`,
   `x$processlist`.`program_name` AS `program_name`
FROM `sys`.`x$processlist` where ((`x$processlist`.`conn_id` is not null) and (`x$processlist`.`command` <> 'Daemon'));


# Replace placeholder table for user_summary_by_statement_latency with correct view syntax
# ------------------------------------------------------------

DROP TABLE `user_summary_by_statement_latency`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `user_summary_by_statement_latency`
AS SELECT
   if(isnull(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER`),'background',`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER`) AS `user`,sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`COUNT_STAR`) AS `total`,
   `sys`.`format_time`(sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_TIMER_WAIT`)) AS `total_latency`,
   `sys`.`format_time`(sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`MAX_TIMER_WAIT`)) AS `max_latency`,
   `sys`.`format_time`(sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_LOCK_TIME`)) AS `lock_latency`,sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_ROWS_SENT`) AS `rows_sent`,sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_ROWS_EXAMINED`) AS `rows_examined`,sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_ROWS_AFFECTED`) AS `rows_affected`,(sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_NO_INDEX_USED`) + sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_NO_GOOD_INDEX_USED`)) AS `full_scans`
FROM `performance_schema`.`events_statements_summary_by_user_by_event_name` group by if(isnull(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER`),'background',`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER`) order by sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_TIMER_WAIT`) desc;


# Replace placeholder table for x$ps_digest_95th_percentile_by_avg_us with correct view syntax
# ------------------------------------------------------------

DROP TABLE `x$ps_digest_95th_percentile_by_avg_us`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$ps_digest_95th_percentile_by_avg_us`
AS SELECT
   `s2`.`avg_us` AS `avg_us`,ifnull((sum(`s1`.`cnt`) / nullif((select count(0)
FROM `performance_schema`.`events_statements_summary_by_digest`),0)),0) AS `percentile` from (`sys`.`x$ps_digest_avg_latency_distribution` `s1` join `sys`.`x$ps_digest_avg_latency_distribution` `s2` on((`s1`.`avg_us` <= `s2`.`avg_us`))) group by `s2`.`avg_us` having (ifnull((sum(`s1`.`cnt`) / nullif((select count(0) from `performance_schema`.`events_statements_summary_by_digest`),0)),0) > 0.95) order by `percentile` limit 1;


# Replace placeholder table for schema_tables_with_full_table_scans with correct view syntax
# ------------------------------------------------------------

DROP TABLE `schema_tables_with_full_table_scans`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `schema_tables_with_full_table_scans`
AS SELECT
   `performance_schema`.`table_io_waits_summary_by_index_usage`.`OBJECT_SCHEMA` AS `object_schema`,
   `performance_schema`.`table_io_waits_summary_by_index_usage`.`OBJECT_NAME` AS `object_name`,
   `performance_schema`.`table_io_waits_summary_by_index_usage`.`COUNT_READ` AS `rows_full_scanned`,
   `sys`.`format_time`(`performance_schema`.`table_io_waits_summary_by_index_usage`.`SUM_TIMER_WAIT`) AS `latency`
FROM `performance_schema`.`table_io_waits_summary_by_index_usage` where (isnull(`performance_schema`.`table_io_waits_summary_by_index_usage`.`INDEX_NAME`) and (`performance_schema`.`table_io_waits_summary_by_index_usage`.`COUNT_READ` > 0)) order by `performance_schema`.`table_io_waits_summary_by_index_usage`.`COUNT_READ` desc;


# Replace placeholder table for host_summary_by_stages with correct view syntax
# ------------------------------------------------------------

DROP TABLE `host_summary_by_stages`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `host_summary_by_stages`
AS SELECT
   if(isnull(`performance_schema`.`events_stages_summary_by_host_by_event_name`.`HOST`),'background',`performance_schema`.`events_stages_summary_by_host_by_event_name`.`HOST`) AS `host`,
   `performance_schema`.`events_stages_summary_by_host_by_event_name`.`EVENT_NAME` AS `event_name`,
   `performance_schema`.`events_stages_summary_by_host_by_event_name`.`COUNT_STAR` AS `total`,
   `sys`.`format_time`(`performance_schema`.`events_stages_summary_by_host_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,
   `sys`.`format_time`(`performance_schema`.`events_stages_summary_by_host_by_event_name`.`AVG_TIMER_WAIT`) AS `avg_latency`
FROM `performance_schema`.`events_stages_summary_by_host_by_event_name` where (`performance_schema`.`events_stages_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` <> 0) order by if(isnull(`performance_schema`.`events_stages_summary_by_host_by_event_name`.`HOST`),'background',`performance_schema`.`events_stages_summary_by_host_by_event_name`.`HOST`),`performance_schema`.`events_stages_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` desc;


# Replace placeholder table for x$io_global_by_wait_by_bytes with correct view syntax
# ------------------------------------------------------------

DROP TABLE `x$io_global_by_wait_by_bytes`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$io_global_by_wait_by_bytes`
AS SELECT
   substring_index(`performance_schema`.`file_summary_by_event_name`.`EVENT_NAME`,'/',-(2)) AS `event_name`,
   `performance_schema`.`file_summary_by_event_name`.`COUNT_STAR` AS `total`,
   `performance_schema`.`file_summary_by_event_name`.`SUM_TIMER_WAIT` AS `total_latency`,
   `performance_schema`.`file_summary_by_event_name`.`MIN_TIMER_WAIT` AS `min_latency`,
   `performance_schema`.`file_summary_by_event_name`.`AVG_TIMER_WAIT` AS `avg_latency`,
   `performance_schema`.`file_summary_by_event_name`.`MAX_TIMER_WAIT` AS `max_latency`,
   `performance_schema`.`file_summary_by_event_name`.`COUNT_READ` AS `count_read`,
   `performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_READ` AS `total_read`,ifnull((`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_READ` / nullif(`performance_schema`.`file_summary_by_event_name`.`COUNT_READ`,0)),0) AS `avg_read`,
   `performance_schema`.`file_summary_by_event_name`.`COUNT_WRITE` AS `count_write`,
   `performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_WRITE` AS `total_written`,ifnull((`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_WRITE` / nullif(`performance_schema`.`file_summary_by_event_name`.`COUNT_WRITE`,0)),0) AS `avg_written`,(`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_WRITE` + `performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_READ`) AS `total_requested`
FROM `performance_schema`.`file_summary_by_event_name` where ((`performance_schema`.`file_summary_by_event_name`.`EVENT_NAME` like 'wait/io/file/%') and (`performance_schema`.`file_summary_by_event_name`.`COUNT_STAR` > 0)) order by (`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_WRITE` + `performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_READ`) desc;


# Replace placeholder table for metrics with correct view syntax
# ------------------------------------------------------------

DROP TABLE `metrics`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `metrics` AS (select lower(`performance_schema`.`global_status`.`VARIABLE_NAME`) AS `Variable_name`,`performance_schema`.`global_status`.`VARIABLE_VALUE` AS `Variable_value`,'Global Status' AS `Type`,'YES' AS `Enabled` from `performance_schema`.`global_status`) union all (select `information_schema`.`innodb_metrics`.`NAME` AS `Variable_name`,`information_schema`.`innodb_metrics`.`COUNT` AS `Variable_value`,concat('InnoDB Metrics - ',`information_schema`.`innodb_metrics`.`SUBSYSTEM`) AS `Type`,if((`information_schema`.`innodb_metrics`.`STATUS` = 'enabled'),'YES','NO') AS `Enabled` from `information_schema`.`innodb_metrics` where (`information_schema`.`innodb_metrics`.`NAME` not in ('lock_row_lock_time','lock_row_lock_time_avg','lock_row_lock_time_max','lock_row_lock_waits','buffer_pool_reads','buffer_pool_read_requests','buffer_pool_write_requests','buffer_pool_wait_free','buffer_pool_read_ahead','buffer_pool_read_ahead_evicted','buffer_pool_pages_total','buffer_pool_pages_misc','buffer_pool_pages_data','buffer_pool_bytes_data','buffer_pool_pages_dirty','buffer_pool_bytes_dirty','buffer_pool_pages_free','buffer_pages_created','buffer_pages_written','buffer_pages_read','buffer_data_reads','buffer_data_written','file_num_open_files','os_log_bytes_written','os_log_fsyncs','os_log_pending_fsyncs','os_log_pending_writes','log_waits','log_write_requests','log_writes','innodb_dblwr_writes','innodb_dblwr_pages_written','innodb_page_size'))) union all (select 'memory_current_allocated' AS `Variable_name`,sum(`performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) AS `Variable_value`,'Performance Schema' AS `Type`,if(((select count(0) from `performance_schema`.`setup_instruments` where ((`performance_schema`.`setup_instruments`.`NAME` like 'memory/%') and (`performance_schema`.`setup_instruments`.`ENABLED` = 'YES'))) = 0),'NO',if(((select count(0) from `performance_schema`.`setup_instruments` where ((`performance_schema`.`setup_instruments`.`NAME` like 'memory/%') and (`performance_schema`.`setup_instruments`.`ENABLED` = 'YES'))) = (select count(0) from `performance_schema`.`setup_instruments` where (`performance_schema`.`setup_instruments`.`NAME` like 'memory/%'))),'YES','PARTIAL')) AS `Enabled` from `performance_schema`.`memory_summary_global_by_event_name`) union all (select 'memory_total_allocated' AS `Variable_name`,sum(`performance_schema`.`memory_summary_global_by_event_name`.`SUM_NUMBER_OF_BYTES_ALLOC`) AS `Variable_value`,'Performance Schema' AS `Type`,if(((select count(0) from `performance_schema`.`setup_instruments` where ((`performance_schema`.`setup_instruments`.`NAME` like 'memory/%') and (`performance_schema`.`setup_instruments`.`ENABLED` = 'YES'))) = 0),'NO',if(((select count(0) from `performance_schema`.`setup_instruments` where ((`performance_schema`.`setup_instruments`.`NAME` like 'memory/%') and (`performance_schema`.`setup_instruments`.`ENABLED` = 'YES'))) = (select count(0) from `performance_schema`.`setup_instruments` where (`performance_schema`.`setup_instruments`.`NAME` like 'memory/%'))),'YES','PARTIAL')) AS `Enabled` from `performance_schema`.`memory_summary_global_by_event_name`) union all (select 'NOW()' AS `Variable_name`,now(3) AS `Variable_value`,'System Time' AS `Type`,'YES' AS `Enabled`) union all (select 'UNIX_TIMESTAMP()' AS `Variable_name`,round(unix_timestamp(now(3)),3) AS `Variable_value`,'System Time' AS `Type`,'YES' AS `Enabled`) order by `Type`,`Variable_name`;


# Replace placeholder table for x$processlist with correct view syntax
# ------------------------------------------------------------

DROP TABLE `x$processlist`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$processlist`
AS SELECT
   `pps`.`THREAD_ID` AS `thd_id`,
   `pps`.`PROCESSLIST_ID` AS `conn_id`,if((`pps`.`NAME` = 'thread/sql/one_connection'),concat(`pps`.`PROCESSLIST_USER`,'@',`pps`.`PROCESSLIST_HOST`),replace(`pps`.`NAME`,'thread/','')) AS `user`,
   `pps`.`PROCESSLIST_DB` AS `db`,
   `pps`.`PROCESSLIST_COMMAND` AS `command`,
   `pps`.`PROCESSLIST_STATE` AS `state`,
   `pps`.`PROCESSLIST_TIME` AS `time`,
   `pps`.`PROCESSLIST_INFO` AS `current_statement`,if(isnull(`esc`.`END_EVENT_ID`),`esc`.`TIMER_WAIT`,NULL) AS `statement_latency`,if(isnull(`esc`.`END_EVENT_ID`),round((100 * (`estc`.`WORK_COMPLETED` / `estc`.`WORK_ESTIMATED`)),2),NULL) AS `progress`,
   `esc`.`LOCK_TIME` AS `lock_latency`,
   `esc`.`ROWS_EXAMINED` AS `rows_examined`,
   `esc`.`ROWS_SENT` AS `rows_sent`,
   `esc`.`ROWS_AFFECTED` AS `rows_affected`,
   `esc`.`CREATED_TMP_TABLES` AS `tmp_tables`,
   `esc`.`CREATED_TMP_DISK_TABLES` AS `tmp_disk_tables`,if(((`esc`.`NO_GOOD_INDEX_USED` > 0) or (`esc`.`NO_INDEX_USED` > 0)),'YES','NO') AS `full_scan`,if((`esc`.`END_EVENT_ID` is not null),`esc`.`SQL_TEXT`,NULL) AS `last_statement`,if((`esc`.`END_EVENT_ID` is not null),`esc`.`TIMER_WAIT`,NULL) AS `last_statement_latency`,
   `mem`.`current_allocated` AS `current_memory`,
   `ewc`.`EVENT_NAME` AS `last_wait`,if((isnull(`ewc`.`END_EVENT_ID`) and (`ewc`.`EVENT_NAME` is not null)),'Still Waiting',`ewc`.`TIMER_WAIT`) AS `last_wait_latency`,
   `ewc`.`SOURCE` AS `source`,
   `etc`.`TIMER_WAIT` AS `trx_latency`,
   `etc`.`STATE` AS `trx_state`,
   `etc`.`AUTOCOMMIT` AS `trx_autocommit`,
   `conattr_pid`.`ATTR_VALUE` AS `pid`,
   `conattr_progname`.`ATTR_VALUE` AS `program_name`
FROM (((((((`performance_schema`.`threads` `pps` left join `performance_schema`.`events_waits_current` `ewc` on((`pps`.`THREAD_ID` = `ewc`.`THREAD_ID`))) left join `performance_schema`.`events_stages_current` `estc` on((`pps`.`THREAD_ID` = `estc`.`THREAD_ID`))) left join `performance_schema`.`events_statements_current` `esc` on((`pps`.`THREAD_ID` = `esc`.`THREAD_ID`))) left join `performance_schema`.`events_transactions_current` `etc` on((`pps`.`THREAD_ID` = `etc`.`THREAD_ID`))) left join `sys`.`x$memory_by_thread_by_current_bytes` `mem` on((`pps`.`THREAD_ID` = `mem`.`thread_id`))) left join `performance_schema`.`session_connect_attrs` `conattr_pid` on(((`conattr_pid`.`PROCESSLIST_ID` = `pps`.`PROCESSLIST_ID`) and (`conattr_pid`.`ATTR_NAME` = '_pid')))) left join `performance_schema`.`session_connect_attrs` `conattr_progname` on(((`conattr_progname`.`PROCESSLIST_ID` = `pps`.`PROCESSLIST_ID`) and (`conattr_progname`.`ATTR_NAME` = 'program_name')))) order by `pps`.`PROCESSLIST_TIME` desc,`last_wait_latency` desc;


# Replace placeholder table for version with correct view syntax
# ------------------------------------------------------------

DROP TABLE `version`;

CREATE ALGORITHM=UNDEFINED DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `version` AS select '1.5.0' AS `sys_version`,version() AS `mysql_version`;


# Replace placeholder table for host_summary_by_file_io_type with correct view syntax
# ------------------------------------------------------------

DROP TABLE `host_summary_by_file_io_type`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `host_summary_by_file_io_type`
AS SELECT
   if(isnull(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`),'background',`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`) AS `host`,
   `performance_schema`.`events_waits_summary_by_host_by_event_name`.`EVENT_NAME` AS `event_name`,
   `performance_schema`.`events_waits_summary_by_host_by_event_name`.`COUNT_STAR` AS `total`,
   `sys`.`format_time`(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,
   `sys`.`format_time`(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`MAX_TIMER_WAIT`) AS `max_latency`
FROM `performance_schema`.`events_waits_summary_by_host_by_event_name` where ((`performance_schema`.`events_waits_summary_by_host_by_event_name`.`EVENT_NAME` like 'wait/io/file%') and (`performance_schema`.`events_waits_summary_by_host_by_event_name`.`COUNT_STAR` > 0)) order by if(isnull(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`),'background',`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`),`performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` desc;


# Replace placeholder table for x$statement_analysis with correct view syntax
# ------------------------------------------------------------

DROP TABLE `x$statement_analysis`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$statement_analysis`
AS SELECT
   `performance_schema`.`events_statements_summary_by_digest`.`DIGEST_TEXT` AS `query`,
   `performance_schema`.`events_statements_summary_by_digest`.`SCHEMA_NAME` AS `db`,if(((`performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_GOOD_INDEX_USED` > 0) or (`performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_INDEX_USED` > 0)),'*','') AS `full_scan`,
   `performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR` AS `exec_count`,
   `performance_schema`.`events_statements_summary_by_digest`.`SUM_ERRORS` AS `err_count`,
   `performance_schema`.`events_statements_summary_by_digest`.`SUM_WARNINGS` AS `warn_count`,
   `performance_schema`.`events_statements_summary_by_digest`.`SUM_TIMER_WAIT` AS `total_latency`,
   `performance_schema`.`events_statements_summary_by_digest`.`MAX_TIMER_WAIT` AS `max_latency`,
   `performance_schema`.`events_statements_summary_by_digest`.`AVG_TIMER_WAIT` AS `avg_latency`,
   `performance_schema`.`events_statements_summary_by_digest`.`SUM_LOCK_TIME` AS `lock_latency`,
   `performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_SENT` AS `rows_sent`,round(ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_SENT` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0),0) AS `rows_sent_avg`,
   `performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_EXAMINED` AS `rows_examined`,round(ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_EXAMINED` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0),0) AS `rows_examined_avg`,
   `performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_AFFECTED` AS `rows_affected`,round(ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_AFFECTED` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0),0) AS `rows_affected_avg`,
   `performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_TABLES` AS `tmp_tables`,
   `performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_DISK_TABLES` AS `tmp_disk_tables`,
   `performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_ROWS` AS `rows_sorted`,
   `performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_MERGE_PASSES` AS `sort_merge_passes`,
   `performance_schema`.`events_statements_summary_by_digest`.`DIGEST` AS `digest`,
   `performance_schema`.`events_statements_summary_by_digest`.`FIRST_SEEN` AS `first_seen`,
   `performance_schema`.`events_statements_summary_by_digest`.`LAST_SEEN` AS `last_seen`
FROM `performance_schema`.`events_statements_summary_by_digest` order by `performance_schema`.`events_statements_summary_by_digest`.`SUM_TIMER_WAIT` desc;


# Replace placeholder table for schema_index_statistics with correct view syntax
# ------------------------------------------------------------

DROP TABLE `schema_index_statistics`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `schema_index_statistics`
AS SELECT
   `performance_schema`.`table_io_waits_summary_by_index_usage`.`OBJECT_SCHEMA` AS `table_schema`,
   `performance_schema`.`table_io_waits_summary_by_index_usage`.`OBJECT_NAME` AS `table_name`,
   `performance_schema`.`table_io_waits_summary_by_index_usage`.`INDEX_NAME` AS `index_name`,
   `performance_schema`.`table_io_waits_summary_by_index_usage`.`COUNT_FETCH` AS `rows_selected`,
   `sys`.`format_time`(`performance_schema`.`table_io_waits_summary_by_index_usage`.`SUM_TIMER_FETCH`) AS `select_latency`,
   `performance_schema`.`table_io_waits_summary_by_index_usage`.`COUNT_INSERT` AS `rows_inserted`,
   `sys`.`format_time`(`performance_schema`.`table_io_waits_summary_by_index_usage`.`SUM_TIMER_INSERT`) AS `insert_latency`,
   `performance_schema`.`table_io_waits_summary_by_index_usage`.`COUNT_UPDATE` AS `rows_updated`,
   `sys`.`format_time`(`performance_schema`.`table_io_waits_summary_by_index_usage`.`SUM_TIMER_UPDATE`) AS `update_latency`,
   `performance_schema`.`table_io_waits_summary_by_index_usage`.`COUNT_DELETE` AS `rows_deleted`,
   `sys`.`format_time`(`performance_schema`.`table_io_waits_summary_by_index_usage`.`SUM_TIMER_INSERT`) AS `delete_latency`
FROM `performance_schema`.`table_io_waits_summary_by_index_usage` where (`performance_schema`.`table_io_waits_summary_by_index_usage`.`INDEX_NAME` is not null) order by `performance_schema`.`table_io_waits_summary_by_index_usage`.`SUM_TIMER_WAIT` desc;


# Replace placeholder table for user_summary_by_file_io_type with correct view syntax
# ------------------------------------------------------------

DROP TABLE `user_summary_by_file_io_type`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `user_summary_by_file_io_type`
AS SELECT
   if(isnull(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`),'background',`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`) AS `user`,
   `performance_schema`.`events_waits_summary_by_user_by_event_name`.`EVENT_NAME` AS `event_name`,
   `performance_schema`.`events_waits_summary_by_user_by_event_name`.`COUNT_STAR` AS `total`,
   `sys`.`format_time`(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`SUM_TIMER_WAIT`) AS `latency`,
   `sys`.`format_time`(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`MAX_TIMER_WAIT`) AS `max_latency`
FROM `performance_schema`.`events_waits_summary_by_user_by_event_name` where ((`performance_schema`.`events_waits_summary_by_user_by_event_name`.`EVENT_NAME` like 'wait/io/file%') and (`performance_schema`.`events_waits_summary_by_user_by_event_name`.`COUNT_STAR` > 0)) order by if(isnull(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`),'background',`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`),`performance_schema`.`events_waits_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` desc;


# Replace placeholder table for wait_classes_global_by_avg_latency with correct view syntax
# ------------------------------------------------------------

DROP TABLE `wait_classes_global_by_avg_latency`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `wait_classes_global_by_avg_latency`
AS SELECT
   substring_index(`performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME`,'/',3) AS `event_class`,sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`COUNT_STAR`) AS `total`,
   `sys`.`format_time`(cast(sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT`) as unsigned)) AS `total_latency`,
   `sys`.`format_time`(min(`performance_schema`.`events_waits_summary_global_by_event_name`.`MIN_TIMER_WAIT`)) AS `min_latency`,
   `sys`.`format_time`(ifnull((sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT`) / nullif(sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`COUNT_STAR`),0)),0)) AS `avg_latency`,
   `sys`.`format_time`(cast(max(`performance_schema`.`events_waits_summary_global_by_event_name`.`MAX_TIMER_WAIT`) as unsigned)) AS `max_latency`
FROM `performance_schema`.`events_waits_summary_global_by_event_name` where ((`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT` > 0) and (`performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME` <> 'idle')) group by `event_class` order by ifnull((sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT`) / nullif(sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`COUNT_STAR`),0)),0) desc;


# Replace placeholder table for statement_analysis with correct view syntax
# ------------------------------------------------------------

DROP TABLE `statement_analysis`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `statement_analysis`
AS SELECT
   `sys`.`format_statement`(`performance_schema`.`events_statements_summary_by_digest`.`DIGEST_TEXT`) AS `query`,
   `performance_schema`.`events_statements_summary_by_digest`.`SCHEMA_NAME` AS `db`,if(((`performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_GOOD_INDEX_USED` > 0) or (`performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_INDEX_USED` > 0)),'*','') AS `full_scan`,
   `performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR` AS `exec_count`,
   `performance_schema`.`events_statements_summary_by_digest`.`SUM_ERRORS` AS `err_count`,
   `performance_schema`.`events_statements_summary_by_digest`.`SUM_WARNINGS` AS `warn_count`,
   `sys`.`format_time`(`performance_schema`.`events_statements_summary_by_digest`.`SUM_TIMER_WAIT`) AS `total_latency`,
   `sys`.`format_time`(`performance_schema`.`events_statements_summary_by_digest`.`MAX_TIMER_WAIT`) AS `max_latency`,
   `sys`.`format_time`(`performance_schema`.`events_statements_summary_by_digest`.`AVG_TIMER_WAIT`) AS `avg_latency`,
   `sys`.`format_time`(`performance_schema`.`events_statements_summary_by_digest`.`SUM_LOCK_TIME`) AS `lock_latency`,
   `performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_SENT` AS `rows_sent`,round(ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_SENT` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0),0) AS `rows_sent_avg`,
   `performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_EXAMINED` AS `rows_examined`,round(ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_EXAMINED` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0),0) AS `rows_examined_avg`,
   `performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_AFFECTED` AS `rows_affected`,round(ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_AFFECTED` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0),0) AS `rows_affected_avg`,
   `performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_TABLES` AS `tmp_tables`,
   `performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_DISK_TABLES` AS `tmp_disk_tables`,
   `performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_ROWS` AS `rows_sorted`,
   `performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_MERGE_PASSES` AS `sort_merge_passes`,
   `performance_schema`.`events_statements_summary_by_digest`.`DIGEST` AS `digest`,
   `performance_schema`.`events_statements_summary_by_digest`.`FIRST_SEEN` AS `first_seen`,
   `performance_schema`.`events_statements_summary_by_digest`.`LAST_SEEN` AS `last_seen`
FROM `performance_schema`.`events_statements_summary_by_digest` order by `performance_schema`.`events_statements_summary_by_digest`.`SUM_TIMER_WAIT` desc;


# Replace placeholder table for x$latest_file_io with correct view syntax
# ------------------------------------------------------------

DROP TABLE `x$latest_file_io`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$latest_file_io`
AS SELECT
   if(isnull(`information_schema`.`processlist`.`ID`),concat(substring_index(`performance_schema`.`threads`.`NAME`,'/',-(1)),':',`performance_schema`.`events_waits_history_long`.`THREAD_ID`),concat(`information_schema`.`processlist`.`USER`,'@',`information_schema`.`processlist`.`HOST`,':',`information_schema`.`processlist`.`ID`)) AS `thread`,
   `performance_schema`.`events_waits_history_long`.`OBJECT_NAME` AS `file`,
   `performance_schema`.`events_waits_history_long`.`TIMER_WAIT` AS `latency`,
   `performance_schema`.`events_waits_history_long`.`OPERATION` AS `operation`,
   `performance_schema`.`events_waits_history_long`.`NUMBER_OF_BYTES` AS `requested`
FROM ((`performance_schema`.`events_waits_history_long` join `performance_schema`.`threads` on((`performance_schema`.`events_waits_history_long`.`THREAD_ID` = `performance_schema`.`threads`.`THREAD_ID`))) left join `information_schema`.`processlist` on((`performance_schema`.`threads`.`PROCESSLIST_ID` = `information_schema`.`processlist`.`ID`))) where ((`performance_schema`.`events_waits_history_long`.`OBJECT_NAME` is not null) and (`performance_schema`.`events_waits_history_long`.`EVENT_NAME` like 'wait/io/file/%')) order by `performance_schema`.`events_waits_history_long`.`TIMER_START`;


# Replace placeholder table for statements_with_errors_or_warnings with correct view syntax
# ------------------------------------------------------------

DROP TABLE `statements_with_errors_or_warnings`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `statements_with_errors_or_warnings`
AS SELECT
   `sys`.`format_statement`(`performance_schema`.`events_statements_summary_by_digest`.`DIGEST_TEXT`) AS `query`,
   `performance_schema`.`events_statements_summary_by_digest`.`SCHEMA_NAME` AS `db`,
   `performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR` AS `exec_count`,
   `performance_schema`.`events_statements_summary_by_digest`.`SUM_ERRORS` AS `errors`,(ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_ERRORS` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0) * 100) AS `error_pct`,
   `performance_schema`.`events_statements_summary_by_digest`.`SUM_WARNINGS` AS `warnings`,(ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_WARNINGS` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0) * 100) AS `warning_pct`,
   `performance_schema`.`events_statements_summary_by_digest`.`FIRST_SEEN` AS `first_seen`,
   `performance_schema`.`events_statements_summary_by_digest`.`LAST_SEEN` AS `last_seen`,
   `performance_schema`.`events_statements_summary_by_digest`.`DIGEST` AS `digest`
FROM `performance_schema`.`events_statements_summary_by_digest` where ((`performance_schema`.`events_statements_summary_by_digest`.`SUM_ERRORS` > 0) or (`performance_schema`.`events_statements_summary_by_digest`.`SUM_WARNINGS` > 0)) order by `performance_schema`.`events_statements_summary_by_digest`.`SUM_ERRORS` desc,`performance_schema`.`events_statements_summary_by_digest`.`SUM_WARNINGS` desc;


# Replace placeholder table for x$statements_with_full_table_scans with correct view syntax
# ------------------------------------------------------------

DROP TABLE `x$statements_with_full_table_scans`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$statements_with_full_table_scans`
AS SELECT
   `performance_schema`.`events_statements_summary_by_digest`.`DIGEST_TEXT` AS `query`,
   `performance_schema`.`events_statements_summary_by_digest`.`SCHEMA_NAME` AS `db`,
   `performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR` AS `exec_count`,
   `performance_schema`.`events_statements_summary_by_digest`.`SUM_TIMER_WAIT` AS `total_latency`,
   `performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_INDEX_USED` AS `no_index_used_count`,
   `performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_GOOD_INDEX_USED` AS `no_good_index_used_count`,round((ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_INDEX_USED` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0) * 100),0) AS `no_index_used_pct`,
   `performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_SENT` AS `rows_sent`,
   `performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_EXAMINED` AS `rows_examined`,round((`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_SENT` / `performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`),0) AS `rows_sent_avg`,round((`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_EXAMINED` / `performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`),0) AS `rows_examined_avg`,
   `performance_schema`.`events_statements_summary_by_digest`.`FIRST_SEEN` AS `first_seen`,
   `performance_schema`.`events_statements_summary_by_digest`.`LAST_SEEN` AS `last_seen`,
   `performance_schema`.`events_statements_summary_by_digest`.`DIGEST` AS `digest`
FROM `performance_schema`.`events_statements_summary_by_digest` where (((`performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_INDEX_USED` > 0) or (`performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_GOOD_INDEX_USED` > 0)) and (not((`performance_schema`.`events_statements_summary_by_digest`.`DIGEST_TEXT` like 'SHOW%')))) order by round((ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_INDEX_USED` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0) * 100),0) desc,`performance_schema`.`events_statements_summary_by_digest`.`SUM_TIMER_WAIT` desc;


# Replace placeholder table for x$user_summary with correct view syntax
# ------------------------------------------------------------

DROP TABLE `x$user_summary`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$user_summary`
AS SELECT
   if(isnull(`performance_schema`.`accounts`.`USER`),'background',`performance_schema`.`accounts`.`USER`) AS `user`,sum(`stmt`.`total`) AS `statements`,sum(`stmt`.`total_latency`) AS `statement_latency`,ifnull((sum(`stmt`.`total_latency`) / nullif(sum(`stmt`.`total`),0)),0) AS `statement_avg_latency`,sum(`stmt`.`full_scans`) AS `table_scans`,sum(`io`.`ios`) AS `file_ios`,sum(`io`.`io_latency`) AS `file_io_latency`,sum(`performance_schema`.`accounts`.`CURRENT_CONNECTIONS`) AS `current_connections`,sum(`performance_schema`.`accounts`.`TOTAL_CONNECTIONS`) AS `total_connections`,count(distinct `performance_schema`.`accounts`.`HOST`) AS `unique_hosts`,sum(`mem`.`current_allocated`) AS `current_memory`,sum(`mem`.`total_allocated`) AS `total_memory_allocated`
FROM (((`performance_schema`.`accounts` left join `sys`.`x$user_summary_by_statement_latency` `stmt` on((if(isnull(`performance_schema`.`accounts`.`USER`),'background',`performance_schema`.`accounts`.`USER`) = `stmt`.`user`))) left join `sys`.`x$user_summary_by_file_io` `io` on((if(isnull(`performance_schema`.`accounts`.`USER`),'background',`performance_schema`.`accounts`.`USER`) = `io`.`user`))) left join `sys`.`x$memory_by_user_by_current_bytes` `mem` on((if(isnull(`performance_schema`.`accounts`.`USER`),'background',`performance_schema`.`accounts`.`USER`) = `mem`.`user`))) group by if(isnull(`performance_schema`.`accounts`.`USER`),'background',`performance_schema`.`accounts`.`USER`) order by sum(`stmt`.`total_latency`) desc;


# Replace placeholder table for x$waits_global_by_latency with correct view syntax
# ------------------------------------------------------------

DROP TABLE `x$waits_global_by_latency`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$waits_global_by_latency`
AS SELECT
   `performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME` AS `events`,
   `performance_schema`.`events_waits_summary_global_by_event_name`.`COUNT_STAR` AS `total`,
   `performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT` AS `total_latency`,
   `performance_schema`.`events_waits_summary_global_by_event_name`.`AVG_TIMER_WAIT` AS `avg_latency`,
   `performance_schema`.`events_waits_summary_global_by_event_name`.`MAX_TIMER_WAIT` AS `max_latency`
FROM `performance_schema`.`events_waits_summary_global_by_event_name` where ((`performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME` <> 'idle') and (`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT` > 0)) order by `performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT` desc;


# Replace placeholder table for ps_check_lost_instrumentation with correct view syntax
# ------------------------------------------------------------

DROP TABLE `ps_check_lost_instrumentation`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `ps_check_lost_instrumentation`
AS SELECT
   `performance_schema`.`global_status`.`VARIABLE_NAME` AS `variable_name`,
   `performance_schema`.`global_status`.`VARIABLE_VALUE` AS `variable_value`
FROM `performance_schema`.`global_status` where ((`performance_schema`.`global_status`.`VARIABLE_NAME` like 'perf%lost') and (`performance_schema`.`global_status`.`VARIABLE_VALUE` > 0));


# Replace placeholder table for user_summary_by_file_io with correct view syntax
# ------------------------------------------------------------

DROP TABLE `user_summary_by_file_io`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `user_summary_by_file_io`
AS SELECT
   if(isnull(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`),'background',`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`) AS `user`,sum(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`COUNT_STAR`) AS `ios`,
   `sys`.`format_time`(sum(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`SUM_TIMER_WAIT`)) AS `io_latency`
FROM `performance_schema`.`events_waits_summary_by_user_by_event_name` where (`performance_schema`.`events_waits_summary_by_user_by_event_name`.`EVENT_NAME` like 'wait/io/file/%') group by if(isnull(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`),'background',`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`) order by sum(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`SUM_TIMER_WAIT`) desc;


# Replace placeholder table for x$waits_by_host_by_latency with correct view syntax
# ------------------------------------------------------------

DROP TABLE `x$waits_by_host_by_latency`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$waits_by_host_by_latency`
AS SELECT
   if(isnull(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`),'background',`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`) AS `host`,
   `performance_schema`.`events_waits_summary_by_host_by_event_name`.`EVENT_NAME` AS `event`,
   `performance_schema`.`events_waits_summary_by_host_by_event_name`.`COUNT_STAR` AS `total`,
   `performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` AS `total_latency`,
   `performance_schema`.`events_waits_summary_by_host_by_event_name`.`AVG_TIMER_WAIT` AS `avg_latency`,
   `performance_schema`.`events_waits_summary_by_host_by_event_name`.`MAX_TIMER_WAIT` AS `max_latency`
FROM `performance_schema`.`events_waits_summary_by_host_by_event_name` where ((`performance_schema`.`events_waits_summary_by_host_by_event_name`.`EVENT_NAME` <> 'idle') and (`performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` > 0)) order by if(isnull(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`),'background',`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`),`performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` desc;


# Replace placeholder table for x$io_global_by_file_by_latency with correct view syntax
# ------------------------------------------------------------

DROP TABLE `x$io_global_by_file_by_latency`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$io_global_by_file_by_latency`
AS SELECT
   `performance_schema`.`file_summary_by_instance`.`FILE_NAME` AS `file`,
   `performance_schema`.`file_summary_by_instance`.`COUNT_STAR` AS `total`,
   `performance_schema`.`file_summary_by_instance`.`SUM_TIMER_WAIT` AS `total_latency`,
   `performance_schema`.`file_summary_by_instance`.`COUNT_READ` AS `count_read`,
   `performance_schema`.`file_summary_by_instance`.`SUM_TIMER_READ` AS `read_latency`,
   `performance_schema`.`file_summary_by_instance`.`COUNT_WRITE` AS `count_write`,
   `performance_schema`.`file_summary_by_instance`.`SUM_TIMER_WRITE` AS `write_latency`,
   `performance_schema`.`file_summary_by_instance`.`COUNT_MISC` AS `count_misc`,
   `performance_schema`.`file_summary_by_instance`.`SUM_TIMER_MISC` AS `misc_latency`
FROM `performance_schema`.`file_summary_by_instance` order by `performance_schema`.`file_summary_by_instance`.`SUM_TIMER_WAIT` desc;


# Replace placeholder table for statements_with_full_table_scans with correct view syntax
# ------------------------------------------------------------

DROP TABLE `statements_with_full_table_scans`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `statements_with_full_table_scans`
AS SELECT
   `sys`.`format_statement`(`performance_schema`.`events_statements_summary_by_digest`.`DIGEST_TEXT`) AS `query`,
   `performance_schema`.`events_statements_summary_by_digest`.`SCHEMA_NAME` AS `db`,
   `performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR` AS `exec_count`,
   `sys`.`format_time`(`performance_schema`.`events_statements_summary_by_digest`.`SUM_TIMER_WAIT`) AS `total_latency`,
   `performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_INDEX_USED` AS `no_index_used_count`,
   `performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_GOOD_INDEX_USED` AS `no_good_index_used_count`,round((ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_INDEX_USED` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0) * 100),0) AS `no_index_used_pct`,
   `performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_SENT` AS `rows_sent`,
   `performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_EXAMINED` AS `rows_examined`,round((`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_SENT` / `performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`),0) AS `rows_sent_avg`,round((`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_EXAMINED` / `performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`),0) AS `rows_examined_avg`,
   `performance_schema`.`events_statements_summary_by_digest`.`FIRST_SEEN` AS `first_seen`,
   `performance_schema`.`events_statements_summary_by_digest`.`LAST_SEEN` AS `last_seen`,
   `performance_schema`.`events_statements_summary_by_digest`.`DIGEST` AS `digest`
FROM `performance_schema`.`events_statements_summary_by_digest` where (((`performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_INDEX_USED` > 0) or (`performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_GOOD_INDEX_USED` > 0)) and (not((`performance_schema`.`events_statements_summary_by_digest`.`DIGEST_TEXT` like 'SHOW%')))) order by round((ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_INDEX_USED` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0) * 100),0) desc,`sys`.`format_time`(`performance_schema`.`events_statements_summary_by_digest`.`SUM_TIMER_WAIT`) desc;


# Replace placeholder table for x$schema_table_statistics_with_buffer with correct view syntax
# ------------------------------------------------------------

DROP TABLE `x$schema_table_statistics_with_buffer`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$schema_table_statistics_with_buffer`
AS SELECT
   `pst`.`OBJECT_SCHEMA` AS `table_schema`,
   `pst`.`OBJECT_NAME` AS `table_name`,
   `pst`.`COUNT_FETCH` AS `rows_fetched`,
   `pst`.`SUM_TIMER_FETCH` AS `fetch_latency`,
   `pst`.`COUNT_INSERT` AS `rows_inserted`,
   `pst`.`SUM_TIMER_INSERT` AS `insert_latency`,
   `pst`.`COUNT_UPDATE` AS `rows_updated`,
   `pst`.`SUM_TIMER_UPDATE` AS `update_latency`,
   `pst`.`COUNT_DELETE` AS `rows_deleted`,
   `pst`.`SUM_TIMER_DELETE` AS `delete_latency`,
   `fsbi`.`count_read` AS `io_read_requests`,
   `fsbi`.`sum_number_of_bytes_read` AS `io_read`,
   `fsbi`.`sum_timer_read` AS `io_read_latency`,
   `fsbi`.`count_write` AS `io_write_requests`,
   `fsbi`.`sum_number_of_bytes_write` AS `io_write`,
   `fsbi`.`sum_timer_write` AS `io_write_latency`,
   `fsbi`.`count_misc` AS `io_misc_requests`,
   `fsbi`.`sum_timer_misc` AS `io_misc_latency`,
   `ibp`.`allocated` AS `innodb_buffer_allocated`,
   `ibp`.`data` AS `innodb_buffer_data`,(`ibp`.`allocated` - `ibp`.`data`) AS `innodb_buffer_free`,
   `ibp`.`pages` AS `innodb_buffer_pages`,
   `ibp`.`pages_hashed` AS `innodb_buffer_pages_hashed`,
   `ibp`.`pages_old` AS `innodb_buffer_pages_old`,
   `ibp`.`rows_cached` AS `innodb_buffer_rows_cached`
FROM ((`performance_schema`.`table_io_waits_summary_by_table` `pst` left join `sys`.`x$ps_schema_table_statistics_io` `fsbi` on(((`pst`.`OBJECT_SCHEMA` = `fsbi`.`table_schema`) and (`pst`.`OBJECT_NAME` = `fsbi`.`table_name`)))) left join `sys`.`x$innodb_buffer_stats_by_table` `ibp` on(((`pst`.`OBJECT_SCHEMA` = `ibp`.`object_schema`) and (`pst`.`OBJECT_NAME` = `ibp`.`object_name`)))) order by `pst`.`SUM_TIMER_WAIT` desc;


# Replace placeholder table for x$memory_by_user_by_current_bytes with correct view syntax
# ------------------------------------------------------------

DROP TABLE `x$memory_by_user_by_current_bytes`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$memory_by_user_by_current_bytes`
AS SELECT
   if(isnull(`performance_schema`.`memory_summary_by_user_by_event_name`.`USER`),'background',`performance_schema`.`memory_summary_by_user_by_event_name`.`USER`) AS `user`,sum(`performance_schema`.`memory_summary_by_user_by_event_name`.`CURRENT_COUNT_USED`) AS `current_count_used`,sum(`performance_schema`.`memory_summary_by_user_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) AS `current_allocated`,ifnull((sum(`performance_schema`.`memory_summary_by_user_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) / nullif(sum(`performance_schema`.`memory_summary_by_user_by_event_name`.`CURRENT_COUNT_USED`),0)),0) AS `current_avg_alloc`,max(`performance_schema`.`memory_summary_by_user_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) AS `current_max_alloc`,sum(`performance_schema`.`memory_summary_by_user_by_event_name`.`SUM_NUMBER_OF_BYTES_ALLOC`) AS `total_allocated`
FROM `performance_schema`.`memory_summary_by_user_by_event_name` group by if(isnull(`performance_schema`.`memory_summary_by_user_by_event_name`.`USER`),'background',`performance_schema`.`memory_summary_by_user_by_event_name`.`USER`) order by sum(`performance_schema`.`memory_summary_by_user_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) desc;


# Replace placeholder table for io_global_by_file_by_latency with correct view syntax
# ------------------------------------------------------------

DROP TABLE `io_global_by_file_by_latency`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `io_global_by_file_by_latency`
AS SELECT
   `sys`.`format_path`(`performance_schema`.`file_summary_by_instance`.`FILE_NAME`) AS `file`,
   `performance_schema`.`file_summary_by_instance`.`COUNT_STAR` AS `total`,
   `sys`.`format_time`(`performance_schema`.`file_summary_by_instance`.`SUM_TIMER_WAIT`) AS `total_latency`,
   `performance_schema`.`file_summary_by_instance`.`COUNT_READ` AS `count_read`,
   `sys`.`format_time`(`performance_schema`.`file_summary_by_instance`.`SUM_TIMER_READ`) AS `read_latency`,
   `performance_schema`.`file_summary_by_instance`.`COUNT_WRITE` AS `count_write`,
   `sys`.`format_time`(`performance_schema`.`file_summary_by_instance`.`SUM_TIMER_WRITE`) AS `write_latency`,
   `performance_schema`.`file_summary_by_instance`.`COUNT_MISC` AS `count_misc`,
   `sys`.`format_time`(`performance_schema`.`file_summary_by_instance`.`SUM_TIMER_MISC`) AS `misc_latency`
FROM `performance_schema`.`file_summary_by_instance` order by `performance_schema`.`file_summary_by_instance`.`SUM_TIMER_WAIT` desc;


# Replace placeholder table for user_summary with correct view syntax
# ------------------------------------------------------------

DROP TABLE `user_summary`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `user_summary`
AS SELECT
   if(isnull(`performance_schema`.`accounts`.`USER`),'background',`performance_schema`.`accounts`.`USER`) AS `user`,sum(`stmt`.`total`) AS `statements`,
   `sys`.`format_time`(sum(`stmt`.`total_latency`)) AS `statement_latency`,
   `sys`.`format_time`(ifnull((sum(`stmt`.`total_latency`) / nullif(sum(`stmt`.`total`),0)),0)) AS `statement_avg_latency`,sum(`stmt`.`full_scans`) AS `table_scans`,sum(`io`.`ios`) AS `file_ios`,
   `sys`.`format_time`(sum(`io`.`io_latency`)) AS `file_io_latency`,sum(`performance_schema`.`accounts`.`CURRENT_CONNECTIONS`) AS `current_connections`,sum(`performance_schema`.`accounts`.`TOTAL_CONNECTIONS`) AS `total_connections`,count(distinct `performance_schema`.`accounts`.`HOST`) AS `unique_hosts`,
   `sys`.`format_bytes`(sum(`mem`.`current_allocated`)) AS `current_memory`,
   `sys`.`format_bytes`(sum(`mem`.`total_allocated`)) AS `total_memory_allocated`
FROM (((`performance_schema`.`accounts` left join `sys`.`x$user_summary_by_statement_latency` `stmt` on((if(isnull(`performance_schema`.`accounts`.`USER`),'background',`performance_schema`.`accounts`.`USER`) = `stmt`.`user`))) left join `sys`.`x$user_summary_by_file_io` `io` on((if(isnull(`performance_schema`.`accounts`.`USER`),'background',`performance_schema`.`accounts`.`USER`) = `io`.`user`))) left join `sys`.`x$memory_by_user_by_current_bytes` `mem` on((if(isnull(`performance_schema`.`accounts`.`USER`),'background',`performance_schema`.`accounts`.`USER`) = `mem`.`user`))) group by if(isnull(`performance_schema`.`accounts`.`USER`),'background',`performance_schema`.`accounts`.`USER`) order by sum(`stmt`.`total_latency`) desc;


# Replace placeholder table for x$innodb_buffer_stats_by_schema with correct view syntax
# ------------------------------------------------------------

DROP TABLE `x$innodb_buffer_stats_by_schema`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$innodb_buffer_stats_by_schema`
AS SELECT
   if((locate('.',`ibp`.`TABLE_NAME`) = 0),'InnoDB System',replace(substring_index(`ibp`.`TABLE_NAME`,'.',1),'`','')) AS `object_schema`,sum(if((`ibp`.`COMPRESSED_SIZE` = 0),16384,`ibp`.`COMPRESSED_SIZE`)) AS `allocated`,sum(`ibp`.`DATA_SIZE`) AS `data`,count(`ibp`.`PAGE_NUMBER`) AS `pages`,count(if((`ibp`.`IS_HASHED` = 'YES'),1,0)) AS `pages_hashed`,count(if((`ibp`.`IS_OLD` = 'YES'),1,0)) AS `pages_old`,round(ifnull((sum(`ibp`.`NUMBER_RECORDS`) / nullif(count(distinct `ibp`.`INDEX_NAME`),0)),0),0) AS `rows_cached`
FROM `information_schema`.`innodb_buffer_page` `ibp` where (`ibp`.`TABLE_NAME` is not null) group by `object_schema` order by sum(if((`ibp`.`COMPRESSED_SIZE` = 0),16384,`ibp`.`COMPRESSED_SIZE`)) desc;


# Replace placeholder table for x$ps_digest_avg_latency_distribution with correct view syntax
# ------------------------------------------------------------

DROP TABLE `x$ps_digest_avg_latency_distribution`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$ps_digest_avg_latency_distribution`
AS SELECT
   count(0) AS `cnt`,round((`performance_schema`.`events_statements_summary_by_digest`.`AVG_TIMER_WAIT` / 1000000),0) AS `avg_us`
FROM `performance_schema`.`events_statements_summary_by_digest` group by `avg_us`;


# Replace placeholder table for x$user_summary_by_file_io with correct view syntax
# ------------------------------------------------------------

DROP TABLE `x$user_summary_by_file_io`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$user_summary_by_file_io`
AS SELECT
   if(isnull(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`),'background',`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`) AS `user`,sum(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`COUNT_STAR`) AS `ios`,sum(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`SUM_TIMER_WAIT`) AS `io_latency`
FROM `performance_schema`.`events_waits_summary_by_user_by_event_name` where (`performance_schema`.`events_waits_summary_by_user_by_event_name`.`EVENT_NAME` like 'wait/io/file/%') group by if(isnull(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`),'background',`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`) order by sum(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`SUM_TIMER_WAIT`) desc;


# Replace placeholder table for x$memory_global_total with correct view syntax
# ------------------------------------------------------------

DROP TABLE `x$memory_global_total`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$memory_global_total`
AS SELECT
   sum(`performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) AS `total_allocated`
FROM `performance_schema`.`memory_summary_global_by_event_name`;


# Replace placeholder table for x$wait_classes_global_by_avg_latency with correct view syntax
# ------------------------------------------------------------

DROP TABLE `x$wait_classes_global_by_avg_latency`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$wait_classes_global_by_avg_latency`
AS SELECT
   substring_index(`performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME`,'/',3) AS `event_class`,sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`COUNT_STAR`) AS `total`,sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,min(`performance_schema`.`events_waits_summary_global_by_event_name`.`MIN_TIMER_WAIT`) AS `min_latency`,ifnull((sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT`) / nullif(sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`COUNT_STAR`),0)),0) AS `avg_latency`,max(`performance_schema`.`events_waits_summary_global_by_event_name`.`MAX_TIMER_WAIT`) AS `max_latency`
FROM `performance_schema`.`events_waits_summary_global_by_event_name` where ((`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT` > 0) and (`performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME` <> 'idle')) group by `event_class` order by ifnull((sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT`) / nullif(sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`COUNT_STAR`),0)),0) desc;


# Replace placeholder table for x$wait_classes_global_by_latency with correct view syntax
# ------------------------------------------------------------

DROP TABLE `x$wait_classes_global_by_latency`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$wait_classes_global_by_latency`
AS SELECT
   substring_index(`performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME`,'/',3) AS `event_class`,sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`COUNT_STAR`) AS `total`,sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,min(`performance_schema`.`events_waits_summary_global_by_event_name`.`MIN_TIMER_WAIT`) AS `min_latency`,ifnull((sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT`) / nullif(sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`COUNT_STAR`),0)),0) AS `avg_latency`,max(`performance_schema`.`events_waits_summary_global_by_event_name`.`MAX_TIMER_WAIT`) AS `max_latency`
FROM `performance_schema`.`events_waits_summary_global_by_event_name` where ((`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT` > 0) and (`performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME` <> 'idle')) group by substring_index(`performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME`,'/',3) order by sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT`) desc;


# Replace placeholder table for x$user_summary_by_file_io_type with correct view syntax
# ------------------------------------------------------------

DROP TABLE `x$user_summary_by_file_io_type`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$user_summary_by_file_io_type`
AS SELECT
   if(isnull(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`),'background',`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`) AS `user`,
   `performance_schema`.`events_waits_summary_by_user_by_event_name`.`EVENT_NAME` AS `event_name`,
   `performance_schema`.`events_waits_summary_by_user_by_event_name`.`COUNT_STAR` AS `total`,
   `performance_schema`.`events_waits_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` AS `latency`,
   `performance_schema`.`events_waits_summary_by_user_by_event_name`.`MAX_TIMER_WAIT` AS `max_latency`
FROM `performance_schema`.`events_waits_summary_by_user_by_event_name` where ((`performance_schema`.`events_waits_summary_by_user_by_event_name`.`EVENT_NAME` like 'wait/io/file%') and (`performance_schema`.`events_waits_summary_by_user_by_event_name`.`COUNT_STAR` > 0)) order by if(isnull(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`),'background',`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`),`performance_schema`.`events_waits_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` desc;


# Replace placeholder table for x$host_summary_by_statement_latency with correct view syntax
# ------------------------------------------------------------

DROP TABLE `x$host_summary_by_statement_latency`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$host_summary_by_statement_latency`
AS SELECT
   if(isnull(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST`),'background',`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST`) AS `host`,sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`COUNT_STAR`) AS `total`,sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`MAX_TIMER_WAIT`) AS `max_latency`,sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_LOCK_TIME`) AS `lock_latency`,sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_ROWS_SENT`) AS `rows_sent`,sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_ROWS_EXAMINED`) AS `rows_examined`,sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_ROWS_AFFECTED`) AS `rows_affected`,(sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_NO_INDEX_USED`) + sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_NO_GOOD_INDEX_USED`)) AS `full_scans`
FROM `performance_schema`.`events_statements_summary_by_host_by_event_name` group by if(isnull(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST`),'background',`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST`) order by sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_TIMER_WAIT`) desc;


# Replace placeholder table for schema_table_statistics_with_buffer with correct view syntax
# ------------------------------------------------------------

DROP TABLE `schema_table_statistics_with_buffer`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `schema_table_statistics_with_buffer`
AS SELECT
   `pst`.`OBJECT_SCHEMA` AS `table_schema`,
   `pst`.`OBJECT_NAME` AS `table_name`,
   `pst`.`COUNT_FETCH` AS `rows_fetched`,
   `sys`.`format_time`(`pst`.`SUM_TIMER_FETCH`) AS `fetch_latency`,
   `pst`.`COUNT_INSERT` AS `rows_inserted`,
   `sys`.`format_time`(`pst`.`SUM_TIMER_INSERT`) AS `insert_latency`,
   `pst`.`COUNT_UPDATE` AS `rows_updated`,
   `sys`.`format_time`(`pst`.`SUM_TIMER_UPDATE`) AS `update_latency`,
   `pst`.`COUNT_DELETE` AS `rows_deleted`,
   `sys`.`format_time`(`pst`.`SUM_TIMER_DELETE`) AS `delete_latency`,
   `fsbi`.`count_read` AS `io_read_requests`,
   `sys`.`format_bytes`(`fsbi`.`sum_number_of_bytes_read`) AS `io_read`,
   `sys`.`format_time`(`fsbi`.`sum_timer_read`) AS `io_read_latency`,
   `fsbi`.`count_write` AS `io_write_requests`,
   `sys`.`format_bytes`(`fsbi`.`sum_number_of_bytes_write`) AS `io_write`,
   `sys`.`format_time`(`fsbi`.`sum_timer_write`) AS `io_write_latency`,
   `fsbi`.`count_misc` AS `io_misc_requests`,
   `sys`.`format_time`(`fsbi`.`sum_timer_misc`) AS `io_misc_latency`,
   `sys`.`format_bytes`(`ibp`.`allocated`) AS `innodb_buffer_allocated`,
   `sys`.`format_bytes`(`ibp`.`data`) AS `innodb_buffer_data`,
   `sys`.`format_bytes`((`ibp`.`allocated` - `ibp`.`data`)) AS `innodb_buffer_free`,
   `ibp`.`pages` AS `innodb_buffer_pages`,
   `ibp`.`pages_hashed` AS `innodb_buffer_pages_hashed`,
   `ibp`.`pages_old` AS `innodb_buffer_pages_old`,
   `ibp`.`rows_cached` AS `innodb_buffer_rows_cached`
FROM ((`performance_schema`.`table_io_waits_summary_by_table` `pst` left join `sys`.`x$ps_schema_table_statistics_io` `fsbi` on(((`pst`.`OBJECT_SCHEMA` = `fsbi`.`table_schema`) and (`pst`.`OBJECT_NAME` = `fsbi`.`table_name`)))) left join `sys`.`x$innodb_buffer_stats_by_table` `ibp` on(((`pst`.`OBJECT_SCHEMA` = `ibp`.`object_schema`) and (`pst`.`OBJECT_NAME` = `ibp`.`object_name`)))) order by `pst`.`SUM_TIMER_WAIT` desc;


# Replace placeholder table for io_global_by_wait_by_latency with correct view syntax
# ------------------------------------------------------------

DROP TABLE `io_global_by_wait_by_latency`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `io_global_by_wait_by_latency`
AS SELECT
   substring_index(`performance_schema`.`file_summary_by_event_name`.`EVENT_NAME`,'/',-(2)) AS `event_name`,
   `performance_schema`.`file_summary_by_event_name`.`COUNT_STAR` AS `total`,
   `sys`.`format_time`(`performance_schema`.`file_summary_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,
   `sys`.`format_time`(`performance_schema`.`file_summary_by_event_name`.`AVG_TIMER_WAIT`) AS `avg_latency`,
   `sys`.`format_time`(`performance_schema`.`file_summary_by_event_name`.`MAX_TIMER_WAIT`) AS `max_latency`,
   `sys`.`format_time`(`performance_schema`.`file_summary_by_event_name`.`SUM_TIMER_READ`) AS `read_latency`,
   `sys`.`format_time`(`performance_schema`.`file_summary_by_event_name`.`SUM_TIMER_WRITE`) AS `write_latency`,
   `sys`.`format_time`(`performance_schema`.`file_summary_by_event_name`.`SUM_TIMER_MISC`) AS `misc_latency`,
   `performance_schema`.`file_summary_by_event_name`.`COUNT_READ` AS `count_read`,
   `sys`.`format_bytes`(`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_READ`) AS `total_read`,
   `sys`.`format_bytes`(ifnull((`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_READ` / nullif(`performance_schema`.`file_summary_by_event_name`.`COUNT_READ`,0)),0)) AS `avg_read`,
   `performance_schema`.`file_summary_by_event_name`.`COUNT_WRITE` AS `count_write`,
   `sys`.`format_bytes`(`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_WRITE`) AS `total_written`,
   `sys`.`format_bytes`(ifnull((`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_WRITE` / nullif(`performance_schema`.`file_summary_by_event_name`.`COUNT_WRITE`,0)),0)) AS `avg_written`
FROM `performance_schema`.`file_summary_by_event_name` where ((`performance_schema`.`file_summary_by_event_name`.`EVENT_NAME` like 'wait/io/file/%') and (`performance_schema`.`file_summary_by_event_name`.`COUNT_STAR` > 0)) order by `performance_schema`.`file_summary_by_event_name`.`SUM_TIMER_WAIT` desc;


# Replace placeholder table for x$schema_table_lock_waits with correct view syntax
# ------------------------------------------------------------

DROP TABLE `x$schema_table_lock_waits`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$schema_table_lock_waits`
AS SELECT
   `g`.`OBJECT_SCHEMA` AS `object_schema`,
   `g`.`OBJECT_NAME` AS `object_name`,
   `pt`.`THREAD_ID` AS `waiting_thread_id`,
   `pt`.`PROCESSLIST_ID` AS `waiting_pid`,
   `sys`.`ps_thread_account`(`p`.`OWNER_THREAD_ID`) AS `waiting_account`,
   `p`.`LOCK_TYPE` AS `waiting_lock_type`,
   `p`.`LOCK_DURATION` AS `waiting_lock_duration`,
   `pt`.`PROCESSLIST_INFO` AS `waiting_query`,
   `pt`.`PROCESSLIST_TIME` AS `waiting_query_secs`,
   `ps`.`ROWS_AFFECTED` AS `waiting_query_rows_affected`,
   `ps`.`ROWS_EXAMINED` AS `waiting_query_rows_examined`,
   `gt`.`THREAD_ID` AS `blocking_thread_id`,
   `gt`.`PROCESSLIST_ID` AS `blocking_pid`,
   `sys`.`ps_thread_account`(`g`.`OWNER_THREAD_ID`) AS `blocking_account`,
   `g`.`LOCK_TYPE` AS `blocking_lock_type`,
   `g`.`LOCK_DURATION` AS `blocking_lock_duration`,concat('KILL QUERY ',`gt`.`PROCESSLIST_ID`) AS `sql_kill_blocking_query`,concat('KILL ',`gt`.`PROCESSLIST_ID`) AS `sql_kill_blocking_connection`
FROM (((((`performance_schema`.`metadata_locks` `g` join `performance_schema`.`metadata_locks` `p` on(((`g`.`OBJECT_TYPE` = `p`.`OBJECT_TYPE`) and (`g`.`OBJECT_SCHEMA` = `p`.`OBJECT_SCHEMA`) and (`g`.`OBJECT_NAME` = `p`.`OBJECT_NAME`) and (`g`.`LOCK_STATUS` = 'GRANTED') and (`p`.`LOCK_STATUS` = 'PENDING')))) join `performance_schema`.`threads` `gt` on((`g`.`OWNER_THREAD_ID` = `gt`.`THREAD_ID`))) join `performance_schema`.`threads` `pt` on((`p`.`OWNER_THREAD_ID` = `pt`.`THREAD_ID`))) left join `performance_schema`.`events_statements_current` `gs` on((`g`.`OWNER_THREAD_ID` = `gs`.`THREAD_ID`))) left join `performance_schema`.`events_statements_current` `ps` on((`p`.`OWNER_THREAD_ID` = `ps`.`THREAD_ID`))) where (`g`.`OBJECT_TYPE` = 'TABLE');


# Replace placeholder table for user_summary_by_statement_type with correct view syntax
# ------------------------------------------------------------

DROP TABLE `user_summary_by_statement_type`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `user_summary_by_statement_type`
AS SELECT
   if(isnull(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER`),'background',`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER`) AS `user`,substring_index(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`EVENT_NAME`,'/',-(1)) AS `statement`,
   `performance_schema`.`events_statements_summary_by_user_by_event_name`.`COUNT_STAR` AS `total`,
   `sys`.`format_time`(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,
   `sys`.`format_time`(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`MAX_TIMER_WAIT`) AS `max_latency`,
   `sys`.`format_time`(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_LOCK_TIME`) AS `lock_latency`,
   `performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_ROWS_SENT` AS `rows_sent`,
   `performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_ROWS_EXAMINED` AS `rows_examined`,
   `performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_ROWS_AFFECTED` AS `rows_affected`,(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_NO_INDEX_USED` + `performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_NO_GOOD_INDEX_USED`) AS `full_scans`
FROM `performance_schema`.`events_statements_summary_by_user_by_event_name` where (`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` <> 0) order by if(isnull(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER`),'background',`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER`),`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` desc;


# Replace placeholder table for processlist with correct view syntax
# ------------------------------------------------------------

DROP TABLE `processlist`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `processlist`
AS SELECT
   `pps`.`THREAD_ID` AS `thd_id`,
   `pps`.`PROCESSLIST_ID` AS `conn_id`,if((`pps`.`NAME` = 'thread/sql/one_connection'),concat(`pps`.`PROCESSLIST_USER`,'@',`pps`.`PROCESSLIST_HOST`),replace(`pps`.`NAME`,'thread/','')) AS `user`,
   `pps`.`PROCESSLIST_DB` AS `db`,
   `pps`.`PROCESSLIST_COMMAND` AS `command`,
   `pps`.`PROCESSLIST_STATE` AS `state`,
   `pps`.`PROCESSLIST_TIME` AS `time`,
   `sys`.`format_statement`(`pps`.`PROCESSLIST_INFO`) AS `current_statement`,if(isnull(`esc`.`END_EVENT_ID`),`sys`.`format_time`(`esc`.`TIMER_WAIT`),NULL) AS `statement_latency`,if(isnull(`esc`.`END_EVENT_ID`),round((100 * (`estc`.`WORK_COMPLETED` / `estc`.`WORK_ESTIMATED`)),2),NULL) AS `progress`,
   `sys`.`format_time`(`esc`.`LOCK_TIME`) AS `lock_latency`,
   `esc`.`ROWS_EXAMINED` AS `rows_examined`,
   `esc`.`ROWS_SENT` AS `rows_sent`,
   `esc`.`ROWS_AFFECTED` AS `rows_affected`,
   `esc`.`CREATED_TMP_TABLES` AS `tmp_tables`,
   `esc`.`CREATED_TMP_DISK_TABLES` AS `tmp_disk_tables`,if(((`esc`.`NO_GOOD_INDEX_USED` > 0) or (`esc`.`NO_INDEX_USED` > 0)),'YES','NO') AS `full_scan`,if((`esc`.`END_EVENT_ID` is not null),`sys`.`format_statement`(`esc`.`SQL_TEXT`),NULL) AS `last_statement`,if((`esc`.`END_EVENT_ID` is not null),`sys`.`format_time`(`esc`.`TIMER_WAIT`),NULL) AS `last_statement_latency`,
   `sys`.`format_bytes`(`mem`.`current_allocated`) AS `current_memory`,
   `ewc`.`EVENT_NAME` AS `last_wait`,if((isnull(`ewc`.`END_EVENT_ID`) and (`ewc`.`EVENT_NAME` is not null)),'Still Waiting',`sys`.`format_time`(`ewc`.`TIMER_WAIT`)) AS `last_wait_latency`,
   `ewc`.`SOURCE` AS `source`,
   `sys`.`format_time`(`etc`.`TIMER_WAIT`) AS `trx_latency`,
   `etc`.`STATE` AS `trx_state`,
   `etc`.`AUTOCOMMIT` AS `trx_autocommit`,
   `conattr_pid`.`ATTR_VALUE` AS `pid`,
   `conattr_progname`.`ATTR_VALUE` AS `program_name`
FROM (((((((`performance_schema`.`threads` `pps` left join `performance_schema`.`events_waits_current` `ewc` on((`pps`.`THREAD_ID` = `ewc`.`THREAD_ID`))) left join `performance_schema`.`events_stages_current` `estc` on((`pps`.`THREAD_ID` = `estc`.`THREAD_ID`))) left join `performance_schema`.`events_statements_current` `esc` on((`pps`.`THREAD_ID` = `esc`.`THREAD_ID`))) left join `performance_schema`.`events_transactions_current` `etc` on((`pps`.`THREAD_ID` = `etc`.`THREAD_ID`))) left join `sys`.`x$memory_by_thread_by_current_bytes` `mem` on((`pps`.`THREAD_ID` = `mem`.`thread_id`))) left join `performance_schema`.`session_connect_attrs` `conattr_pid` on(((`conattr_pid`.`PROCESSLIST_ID` = `pps`.`PROCESSLIST_ID`) and (`conattr_pid`.`ATTR_NAME` = '_pid')))) left join `performance_schema`.`session_connect_attrs` `conattr_progname` on(((`conattr_progname`.`PROCESSLIST_ID` = `pps`.`PROCESSLIST_ID`) and (`conattr_progname`.`ATTR_NAME` = 'program_name')))) order by `pps`.`PROCESSLIST_TIME` desc,`last_wait_latency` desc;


# Replace placeholder table for host_summary_by_file_io with correct view syntax
# ------------------------------------------------------------

DROP TABLE `host_summary_by_file_io`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `host_summary_by_file_io`
AS SELECT
   if(isnull(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`),'background',`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`) AS `host`,sum(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`COUNT_STAR`) AS `ios`,
   `sys`.`format_time`(sum(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT`)) AS `io_latency`
FROM `performance_schema`.`events_waits_summary_by_host_by_event_name` where (`performance_schema`.`events_waits_summary_by_host_by_event_name`.`EVENT_NAME` like 'wait/io/file/%') group by if(isnull(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`),'background',`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`) order by sum(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT`) desc;


# Replace placeholder table for host_summary with correct view syntax
# ------------------------------------------------------------

DROP TABLE `host_summary`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `host_summary`
AS SELECT
   if(isnull(`performance_schema`.`accounts`.`HOST`),'background',`performance_schema`.`accounts`.`HOST`) AS `host`,sum(`stmt`.`total`) AS `statements`,
   `sys`.`format_time`(sum(`stmt`.`total_latency`)) AS `statement_latency`,
   `sys`.`format_time`((sum(`stmt`.`total_latency`) / sum(`stmt`.`total`))) AS `statement_avg_latency`,sum(`stmt`.`full_scans`) AS `table_scans`,sum(`io`.`ios`) AS `file_ios`,
   `sys`.`format_time`(sum(`io`.`io_latency`)) AS `file_io_latency`,sum(`performance_schema`.`accounts`.`CURRENT_CONNECTIONS`) AS `current_connections`,sum(`performance_schema`.`accounts`.`TOTAL_CONNECTIONS`) AS `total_connections`,count(distinct `performance_schema`.`accounts`.`USER`) AS `unique_users`,
   `sys`.`format_bytes`(sum(`mem`.`current_allocated`)) AS `current_memory`,
   `sys`.`format_bytes`(sum(`mem`.`total_allocated`)) AS `total_memory_allocated`
FROM (((`performance_schema`.`accounts` join `sys`.`x$host_summary_by_statement_latency` `stmt` on((`performance_schema`.`accounts`.`HOST` = `stmt`.`host`))) join `sys`.`x$host_summary_by_file_io` `io` on((`performance_schema`.`accounts`.`HOST` = `io`.`host`))) join `sys`.`x$memory_by_host_by_current_bytes` `mem` on((`performance_schema`.`accounts`.`HOST` = `mem`.`host`))) group by if(isnull(`performance_schema`.`accounts`.`HOST`),'background',`performance_schema`.`accounts`.`HOST`);


# Replace placeholder table for schema_object_overview with correct view syntax
# ------------------------------------------------------------

DROP TABLE `schema_object_overview`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `schema_object_overview`
AS SELECT
   `information_schema`.`routines`.`ROUTINE_SCHEMA` AS `db`,
   `information_schema`.`routines`.`ROUTINE_TYPE` AS `object_type`,count(0) AS `count`
FROM `information_schema`.`routines` group by `information_schema`.`routines`.`ROUTINE_SCHEMA`,`information_schema`.`routines`.`ROUTINE_TYPE` union select `information_schema`.`tables`.`TABLE_SCHEMA` AS `TABLE_SCHEMA`,`information_schema`.`tables`.`TABLE_TYPE` AS `TABLE_TYPE`,count(0) AS `COUNT(*)` from `information_schema`.`tables` group by `information_schema`.`tables`.`TABLE_SCHEMA`,`information_schema`.`tables`.`TABLE_TYPE` union select `information_schema`.`statistics`.`TABLE_SCHEMA` AS `TABLE_SCHEMA`,concat('INDEX (',`information_schema`.`statistics`.`INDEX_TYPE`,')') AS `CONCAT('INDEX (', INDEX_TYPE, ')')`,count(0) AS `COUNT(*)` from `information_schema`.`statistics` group by `information_schema`.`statistics`.`TABLE_SCHEMA`,`information_schema`.`statistics`.`INDEX_TYPE` union select `information_schema`.`triggers`.`TRIGGER_SCHEMA` AS `TRIGGER_SCHEMA`,'TRIGGER' AS `TRIGGER`,count(0) AS `COUNT(*)` from `information_schema`.`triggers` group by `information_schema`.`triggers`.`TRIGGER_SCHEMA` union select `information_schema`.`events`.`EVENT_SCHEMA` AS `EVENT_SCHEMA`,'EVENT' AS `EVENT`,count(0) AS `COUNT(*)` from `information_schema`.`events` group by `information_schema`.`events`.`EVENT_SCHEMA` order by `db`,`object_type`;


# Replace placeholder table for statements_with_temp_tables with correct view syntax
# ------------------------------------------------------------

DROP TABLE `statements_with_temp_tables`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `statements_with_temp_tables`
AS SELECT
   `sys`.`format_statement`(`performance_schema`.`events_statements_summary_by_digest`.`DIGEST_TEXT`) AS `query`,
   `performance_schema`.`events_statements_summary_by_digest`.`SCHEMA_NAME` AS `db`,
   `performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR` AS `exec_count`,
   `sys`.`format_time`(`performance_schema`.`events_statements_summary_by_digest`.`SUM_TIMER_WAIT`) AS `total_latency`,
   `performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_TABLES` AS `memory_tmp_tables`,
   `performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_DISK_TABLES` AS `disk_tmp_tables`,round(ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_TABLES` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0),0) AS `avg_tmp_tables_per_query`,round((ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_DISK_TABLES` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_TABLES`,0)),0) * 100),0) AS `tmp_tables_to_disk_pct`,
   `performance_schema`.`events_statements_summary_by_digest`.`FIRST_SEEN` AS `first_seen`,
   `performance_schema`.`events_statements_summary_by_digest`.`LAST_SEEN` AS `last_seen`,
   `performance_schema`.`events_statements_summary_by_digest`.`DIGEST` AS `digest`
FROM `performance_schema`.`events_statements_summary_by_digest` where (`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_TABLES` > 0) order by `performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_DISK_TABLES` desc,`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_TABLES` desc;


# Replace placeholder table for latest_file_io with correct view syntax
# ------------------------------------------------------------

DROP TABLE `latest_file_io`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `latest_file_io`
AS SELECT
   if(isnull(`information_schema`.`processlist`.`ID`),concat(substring_index(`performance_schema`.`threads`.`NAME`,'/',-(1)),':',`performance_schema`.`events_waits_history_long`.`THREAD_ID`),concat(`information_schema`.`processlist`.`USER`,'@',`information_schema`.`processlist`.`HOST`,':',`information_schema`.`processlist`.`ID`)) AS `thread`,
   `sys`.`format_path`(`performance_schema`.`events_waits_history_long`.`OBJECT_NAME`) AS `file`,
   `sys`.`format_time`(`performance_schema`.`events_waits_history_long`.`TIMER_WAIT`) AS `latency`,
   `performance_schema`.`events_waits_history_long`.`OPERATION` AS `operation`,
   `sys`.`format_bytes`(`performance_schema`.`events_waits_history_long`.`NUMBER_OF_BYTES`) AS `requested`
FROM ((`performance_schema`.`events_waits_history_long` join `performance_schema`.`threads` on((`performance_schema`.`events_waits_history_long`.`THREAD_ID` = `performance_schema`.`threads`.`THREAD_ID`))) left join `information_schema`.`processlist` on((`performance_schema`.`threads`.`PROCESSLIST_ID` = `information_schema`.`processlist`.`ID`))) where ((`performance_schema`.`events_waits_history_long`.`OBJECT_NAME` is not null) and (`performance_schema`.`events_waits_history_long`.`EVENT_NAME` like 'wait/io/file/%')) order by `performance_schema`.`events_waits_history_long`.`TIMER_START`;


# Replace placeholder table for x$waits_by_user_by_latency with correct view syntax
# ------------------------------------------------------------

DROP TABLE `x$waits_by_user_by_latency`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$waits_by_user_by_latency`
AS SELECT
   if(isnull(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`),'background',`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`) AS `user`,
   `performance_schema`.`events_waits_summary_by_user_by_event_name`.`EVENT_NAME` AS `event`,
   `performance_schema`.`events_waits_summary_by_user_by_event_name`.`COUNT_STAR` AS `total`,
   `performance_schema`.`events_waits_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` AS `total_latency`,
   `performance_schema`.`events_waits_summary_by_user_by_event_name`.`AVG_TIMER_WAIT` AS `avg_latency`,
   `performance_schema`.`events_waits_summary_by_user_by_event_name`.`MAX_TIMER_WAIT` AS `max_latency`
FROM `performance_schema`.`events_waits_summary_by_user_by_event_name` where ((`performance_schema`.`events_waits_summary_by_user_by_event_name`.`EVENT_NAME` <> 'idle') and (`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER` is not null) and (`performance_schema`.`events_waits_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` > 0)) order by if(isnull(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`),'background',`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`),`performance_schema`.`events_waits_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` desc;


# Replace placeholder table for user_summary_by_stages with correct view syntax
# ------------------------------------------------------------

DROP TABLE `user_summary_by_stages`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `user_summary_by_stages`
AS SELECT
   if(isnull(`performance_schema`.`events_stages_summary_by_user_by_event_name`.`USER`),'background',`performance_schema`.`events_stages_summary_by_user_by_event_name`.`USER`) AS `user`,
   `performance_schema`.`events_stages_summary_by_user_by_event_name`.`EVENT_NAME` AS `event_name`,
   `performance_schema`.`events_stages_summary_by_user_by_event_name`.`COUNT_STAR` AS `total`,
   `sys`.`format_time`(`performance_schema`.`events_stages_summary_by_user_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,
   `sys`.`format_time`(`performance_schema`.`events_stages_summary_by_user_by_event_name`.`AVG_TIMER_WAIT`) AS `avg_latency`
FROM `performance_schema`.`events_stages_summary_by_user_by_event_name` where (`performance_schema`.`events_stages_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` <> 0) order by if(isnull(`performance_schema`.`events_stages_summary_by_user_by_event_name`.`USER`),'background',`performance_schema`.`events_stages_summary_by_user_by_event_name`.`USER`),`performance_schema`.`events_stages_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` desc;


# Replace placeholder table for io_global_by_wait_by_bytes with correct view syntax
# ------------------------------------------------------------

DROP TABLE `io_global_by_wait_by_bytes`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `io_global_by_wait_by_bytes`
AS SELECT
   substring_index(`performance_schema`.`file_summary_by_event_name`.`EVENT_NAME`,'/',-(2)) AS `event_name`,
   `performance_schema`.`file_summary_by_event_name`.`COUNT_STAR` AS `total`,
   `sys`.`format_time`(`performance_schema`.`file_summary_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,
   `sys`.`format_time`(`performance_schema`.`file_summary_by_event_name`.`MIN_TIMER_WAIT`) AS `min_latency`,
   `sys`.`format_time`(`performance_schema`.`file_summary_by_event_name`.`AVG_TIMER_WAIT`) AS `avg_latency`,
   `sys`.`format_time`(`performance_schema`.`file_summary_by_event_name`.`MAX_TIMER_WAIT`) AS `max_latency`,
   `performance_schema`.`file_summary_by_event_name`.`COUNT_READ` AS `count_read`,
   `sys`.`format_bytes`(`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_READ`) AS `total_read`,
   `sys`.`format_bytes`(ifnull((`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_READ` / nullif(`performance_schema`.`file_summary_by_event_name`.`COUNT_READ`,0)),0)) AS `avg_read`,
   `performance_schema`.`file_summary_by_event_name`.`COUNT_WRITE` AS `count_write`,
   `sys`.`format_bytes`(`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_WRITE`) AS `total_written`,
   `sys`.`format_bytes`(ifnull((`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_WRITE` / nullif(`performance_schema`.`file_summary_by_event_name`.`COUNT_WRITE`,0)),0)) AS `avg_written`,
   `sys`.`format_bytes`((`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_WRITE` + `performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_READ`)) AS `total_requested`
FROM `performance_schema`.`file_summary_by_event_name` where ((`performance_schema`.`file_summary_by_event_name`.`EVENT_NAME` like 'wait/io/file/%') and (`performance_schema`.`file_summary_by_event_name`.`COUNT_STAR` > 0)) order by (`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_WRITE` + `performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_READ`) desc;


# Replace placeholder table for x$statements_with_runtimes_in_95th_percentile with correct view syntax
# ------------------------------------------------------------

DROP TABLE `x$statements_with_runtimes_in_95th_percentile`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$statements_with_runtimes_in_95th_percentile`
AS SELECT
   `stmts`.`DIGEST_TEXT` AS `query`,
   `stmts`.`SCHEMA_NAME` AS `db`,if(((`stmts`.`SUM_NO_GOOD_INDEX_USED` > 0) or (`stmts`.`SUM_NO_INDEX_USED` > 0)),'*','') AS `full_scan`,
   `stmts`.`COUNT_STAR` AS `exec_count`,
   `stmts`.`SUM_ERRORS` AS `err_count`,
   `stmts`.`SUM_WARNINGS` AS `warn_count`,
   `stmts`.`SUM_TIMER_WAIT` AS `total_latency`,
   `stmts`.`MAX_TIMER_WAIT` AS `max_latency`,
   `stmts`.`AVG_TIMER_WAIT` AS `avg_latency`,
   `stmts`.`SUM_ROWS_SENT` AS `rows_sent`,round(ifnull((`stmts`.`SUM_ROWS_SENT` / nullif(`stmts`.`COUNT_STAR`,0)),0),0) AS `rows_sent_avg`,
   `stmts`.`SUM_ROWS_EXAMINED` AS `rows_examined`,round(ifnull((`stmts`.`SUM_ROWS_EXAMINED` / nullif(`stmts`.`COUNT_STAR`,0)),0),0) AS `rows_examined_avg`,
   `stmts`.`FIRST_SEEN` AS `first_seen`,
   `stmts`.`LAST_SEEN` AS `last_seen`,
   `stmts`.`DIGEST` AS `digest`
FROM (`performance_schema`.`events_statements_summary_by_digest` `stmts` join `sys`.`x$ps_digest_95th_percentile_by_avg_us` `top_percentile` on((round((`stmts`.`AVG_TIMER_WAIT` / 1000000),0) >= `top_percentile`.`avg_us`))) order by `stmts`.`AVG_TIMER_WAIT` desc;


# Replace placeholder table for schema_auto_increment_columns with correct view syntax
# ------------------------------------------------------------

DROP TABLE `schema_auto_increment_columns`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `schema_auto_increment_columns`
AS SELECT
   `information_schema`.`columns`.`TABLE_SCHEMA` AS `table_schema`,
   `information_schema`.`columns`.`TABLE_NAME` AS `table_name`,
   `information_schema`.`columns`.`COLUMN_NAME` AS `column_name`,
   `information_schema`.`columns`.`DATA_TYPE` AS `data_type`,
   `information_schema`.`columns`.`COLUMN_TYPE` AS `column_type`,(locate('unsigned',`information_schema`.`columns`.`COLUMN_TYPE`) = 0) AS `is_signed`,(locate('unsigned',`information_schema`.`columns`.`COLUMN_TYPE`) > 0) AS `is_unsigned`,((case `information_schema`.`columns`.`DATA_TYPE` when 'tinyint' then 255 when 'smallint' then 65535 when 'mediumint' then 16777215 when 'int' then 4294967295 when 'bigint' then 18446744073709551615 end) >> if((locate('unsigned',`information_schema`.`columns`.`COLUMN_TYPE`) > 0),0,1)) AS `max_value`,
   `information_schema`.`tables`.`AUTO_INCREMENT` AS `auto_increment`,(`information_schema`.`tables`.`AUTO_INCREMENT` / ((case `information_schema`.`columns`.`DATA_TYPE` when 'tinyint' then 255 when 'smallint' then 65535 when 'mediumint' then 16777215 when 'int' then 4294967295 when 'bigint' then 18446744073709551615 end) >> if((locate('unsigned',`information_schema`.`columns`.`COLUMN_TYPE`) > 0),0,1))) AS `auto_increment_ratio`
FROM (`information_schema`.`columns` join `information_schema`.`tables` on(((`information_schema`.`columns`.`TABLE_SCHEMA` = `information_schema`.`tables`.`TABLE_SCHEMA`) and (`information_schema`.`columns`.`TABLE_NAME` = `information_schema`.`tables`.`TABLE_NAME`)))) where ((`information_schema`.`columns`.`TABLE_SCHEMA` not in ('mysql','sys','INFORMATION_SCHEMA','performance_schema')) and (`information_schema`.`tables`.`TABLE_TYPE` = 'BASE TABLE') and (`information_schema`.`columns`.`EXTRA` = 'auto_increment')) order by (`information_schema`.`tables`.`AUTO_INCREMENT` / ((case `information_schema`.`columns`.`DATA_TYPE` when 'tinyint' then 255 when 'smallint' then 65535 when 'mediumint' then 16777215 when 'int' then 4294967295 when 'bigint' then 18446744073709551615 end) >> if((locate('unsigned',`information_schema`.`columns`.`COLUMN_TYPE`) > 0),0,1))) desc,((case `information_schema`.`columns`.`DATA_TYPE` when 'tinyint' then 255 when 'smallint' then 65535 when 'mediumint' then 16777215 when 'int' then 4294967295 when 'bigint' then 18446744073709551615 end) >> if((locate('unsigned',`information_schema`.`columns`.`COLUMN_TYPE`) > 0),0,1));


# Replace placeholder table for io_by_thread_by_latency with correct view syntax
# ------------------------------------------------------------

DROP TABLE `io_by_thread_by_latency`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `io_by_thread_by_latency`
AS SELECT
   if(isnull(`performance_schema`.`threads`.`PROCESSLIST_ID`),substring_index(`performance_schema`.`threads`.`NAME`,'/',-(1)),concat(`performance_schema`.`threads`.`PROCESSLIST_USER`,'@',`performance_schema`.`threads`.`PROCESSLIST_HOST`)) AS `user`,sum(`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`COUNT_STAR`) AS `total`,
   `sys`.`format_time`(sum(`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`SUM_TIMER_WAIT`)) AS `total_latency`,
   `sys`.`format_time`(min(`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`MIN_TIMER_WAIT`)) AS `min_latency`,
   `sys`.`format_time`(avg(`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`AVG_TIMER_WAIT`)) AS `avg_latency`,
   `sys`.`format_time`(max(`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`MAX_TIMER_WAIT`)) AS `max_latency`,
   `performance_schema`.`events_waits_summary_by_thread_by_event_name`.`THREAD_ID` AS `thread_id`,
   `performance_schema`.`threads`.`PROCESSLIST_ID` AS `processlist_id`
FROM (`performance_schema`.`events_waits_summary_by_thread_by_event_name` left join `performance_schema`.`threads` on((`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`THREAD_ID` = `performance_schema`.`threads`.`THREAD_ID`))) where ((`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`EVENT_NAME` like 'wait/io/file/%') and (`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`SUM_TIMER_WAIT` > 0)) group by `performance_schema`.`events_waits_summary_by_thread_by_event_name`.`THREAD_ID`,`performance_schema`.`threads`.`PROCESSLIST_ID`,`user` order by sum(`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`SUM_TIMER_WAIT`) desc;


# Replace placeholder table for io_global_by_file_by_bytes with correct view syntax
# ------------------------------------------------------------

DROP TABLE `io_global_by_file_by_bytes`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `io_global_by_file_by_bytes`
AS SELECT
   `sys`.`format_path`(`performance_schema`.`file_summary_by_instance`.`FILE_NAME`) AS `file`,
   `performance_schema`.`file_summary_by_instance`.`COUNT_READ` AS `count_read`,
   `sys`.`format_bytes`(`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_READ`) AS `total_read`,
   `sys`.`format_bytes`(ifnull((`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_READ` / nullif(`performance_schema`.`file_summary_by_instance`.`COUNT_READ`,0)),0)) AS `avg_read`,
   `performance_schema`.`file_summary_by_instance`.`COUNT_WRITE` AS `count_write`,
   `sys`.`format_bytes`(`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_WRITE`) AS `total_written`,
   `sys`.`format_bytes`(ifnull((`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_WRITE` / nullif(`performance_schema`.`file_summary_by_instance`.`COUNT_WRITE`,0)),0.00)) AS `avg_write`,
   `sys`.`format_bytes`((`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_READ` + `performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_WRITE`)) AS `total`,ifnull(round((100 - ((`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_READ` / nullif((`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_READ` + `performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_WRITE`),0)) * 100)),2),0.00) AS `write_pct`
FROM `performance_schema`.`file_summary_by_instance` order by (`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_READ` + `performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_WRITE`) desc;


# Replace placeholder table for waits_by_user_by_latency with correct view syntax
# ------------------------------------------------------------

DROP TABLE `waits_by_user_by_latency`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `waits_by_user_by_latency`
AS SELECT
   if(isnull(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`),'background',`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`) AS `user`,
   `performance_schema`.`events_waits_summary_by_user_by_event_name`.`EVENT_NAME` AS `event`,
   `performance_schema`.`events_waits_summary_by_user_by_event_name`.`COUNT_STAR` AS `total`,
   `sys`.`format_time`(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,
   `sys`.`format_time`(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`AVG_TIMER_WAIT`) AS `avg_latency`,
   `sys`.`format_time`(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`MAX_TIMER_WAIT`) AS `max_latency`
FROM `performance_schema`.`events_waits_summary_by_user_by_event_name` where ((`performance_schema`.`events_waits_summary_by_user_by_event_name`.`EVENT_NAME` <> 'idle') and (`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER` is not null) and (`performance_schema`.`events_waits_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` > 0)) order by if(isnull(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`),'background',`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`),`performance_schema`.`events_waits_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` desc;


# Replace placeholder table for x$statements_with_errors_or_warnings with correct view syntax
# ------------------------------------------------------------

DROP TABLE `x$statements_with_errors_or_warnings`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$statements_with_errors_or_warnings`
AS SELECT
   `performance_schema`.`events_statements_summary_by_digest`.`DIGEST_TEXT` AS `query`,
   `performance_schema`.`events_statements_summary_by_digest`.`SCHEMA_NAME` AS `db`,
   `performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR` AS `exec_count`,
   `performance_schema`.`events_statements_summary_by_digest`.`SUM_ERRORS` AS `errors`,(ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_ERRORS` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0) * 100) AS `error_pct`,
   `performance_schema`.`events_statements_summary_by_digest`.`SUM_WARNINGS` AS `warnings`,(ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_WARNINGS` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0) * 100) AS `warning_pct`,
   `performance_schema`.`events_statements_summary_by_digest`.`FIRST_SEEN` AS `first_seen`,
   `performance_schema`.`events_statements_summary_by_digest`.`LAST_SEEN` AS `last_seen`,
   `performance_schema`.`events_statements_summary_by_digest`.`DIGEST` AS `digest`
FROM `performance_schema`.`events_statements_summary_by_digest` where ((`performance_schema`.`events_statements_summary_by_digest`.`SUM_ERRORS` > 0) or (`performance_schema`.`events_statements_summary_by_digest`.`SUM_WARNINGS` > 0)) order by `performance_schema`.`events_statements_summary_by_digest`.`SUM_ERRORS` desc,`performance_schema`.`events_statements_summary_by_digest`.`SUM_WARNINGS` desc;


# Replace placeholder table for x$memory_by_thread_by_current_bytes with correct view syntax
# ------------------------------------------------------------

DROP TABLE `x$memory_by_thread_by_current_bytes`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$memory_by_thread_by_current_bytes`
AS SELECT
   `t`.`THREAD_ID` AS `thread_id`,if((`t`.`NAME` = 'thread/sql/one_connection'),concat(`t`.`PROCESSLIST_USER`,'@',`t`.`PROCESSLIST_HOST`),replace(`t`.`NAME`,'thread/','')) AS `user`,sum(`mt`.`CURRENT_COUNT_USED`) AS `current_count_used`,sum(`mt`.`CURRENT_NUMBER_OF_BYTES_USED`) AS `current_allocated`,ifnull((sum(`mt`.`CURRENT_NUMBER_OF_BYTES_USED`) / nullif(sum(`mt`.`CURRENT_COUNT_USED`),0)),0) AS `current_avg_alloc`,max(`mt`.`CURRENT_NUMBER_OF_BYTES_USED`) AS `current_max_alloc`,sum(`mt`.`SUM_NUMBER_OF_BYTES_ALLOC`) AS `total_allocated`
FROM (`performance_schema`.`memory_summary_by_thread_by_event_name` `mt` join `performance_schema`.`threads` `t` on((`mt`.`THREAD_ID` = `t`.`THREAD_ID`))) group by `t`.`THREAD_ID`,if((`t`.`NAME` = 'thread/sql/one_connection'),concat(`t`.`PROCESSLIST_USER`,'@',`t`.`PROCESSLIST_HOST`),replace(`t`.`NAME`,'thread/','')) order by sum(`mt`.`CURRENT_NUMBER_OF_BYTES_USED`) desc;


# Replace placeholder table for x$host_summary_by_stages with correct view syntax
# ------------------------------------------------------------

DROP TABLE `x$host_summary_by_stages`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$host_summary_by_stages`
AS SELECT
   if(isnull(`performance_schema`.`events_stages_summary_by_host_by_event_name`.`HOST`),'background',`performance_schema`.`events_stages_summary_by_host_by_event_name`.`HOST`) AS `host`,
   `performance_schema`.`events_stages_summary_by_host_by_event_name`.`EVENT_NAME` AS `event_name`,
   `performance_schema`.`events_stages_summary_by_host_by_event_name`.`COUNT_STAR` AS `total`,
   `performance_schema`.`events_stages_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` AS `total_latency`,
   `performance_schema`.`events_stages_summary_by_host_by_event_name`.`AVG_TIMER_WAIT` AS `avg_latency`
FROM `performance_schema`.`events_stages_summary_by_host_by_event_name` where (`performance_schema`.`events_stages_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` <> 0) order by if(isnull(`performance_schema`.`events_stages_summary_by_host_by_event_name`.`HOST`),'background',`performance_schema`.`events_stages_summary_by_host_by_event_name`.`HOST`),`performance_schema`.`events_stages_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` desc;


# Replace placeholder table for x$ps_schema_table_statistics_io with correct view syntax
# ------------------------------------------------------------

DROP TABLE `x$ps_schema_table_statistics_io`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$ps_schema_table_statistics_io`
AS SELECT
   `extract_schema_from_file_name`(`performance_schema`.`file_summary_by_instance`.`FILE_NAME`) AS `table_schema`,
   `extract_table_from_file_name`(`performance_schema`.`file_summary_by_instance`.`FILE_NAME`) AS `table_name`,sum(`performance_schema`.`file_summary_by_instance`.`COUNT_READ`) AS `count_read`,sum(`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_READ`) AS `sum_number_of_bytes_read`,sum(`performance_schema`.`file_summary_by_instance`.`SUM_TIMER_READ`) AS `sum_timer_read`,sum(`performance_schema`.`file_summary_by_instance`.`COUNT_WRITE`) AS `count_write`,sum(`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_WRITE`) AS `sum_number_of_bytes_write`,sum(`performance_schema`.`file_summary_by_instance`.`SUM_TIMER_WRITE`) AS `sum_timer_write`,sum(`performance_schema`.`file_summary_by_instance`.`COUNT_MISC`) AS `count_misc`,sum(`performance_schema`.`file_summary_by_instance`.`SUM_TIMER_MISC`) AS `sum_timer_misc`
FROM `performance_schema`.`file_summary_by_instance` group by `table_schema`,`table_name`;


# Replace placeholder table for session with correct view syntax
# ------------------------------------------------------------

DROP TABLE `session`;

CREATE ALGORITHM=UNDEFINED DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `session`
AS SELECT
   `processlist`.`thd_id` AS `thd_id`,
   `processlist`.`conn_id` AS `conn_id`,
   `processlist`.`user` AS `user`,
   `processlist`.`db` AS `db`,
   `processlist`.`command` AS `command`,
   `processlist`.`state` AS `state`,
   `processlist`.`time` AS `time`,
   `processlist`.`current_statement` AS `current_statement`,
   `processlist`.`statement_latency` AS `statement_latency`,
   `processlist`.`progress` AS `progress`,
   `processlist`.`lock_latency` AS `lock_latency`,
   `processlist`.`rows_examined` AS `rows_examined`,
   `processlist`.`rows_sent` AS `rows_sent`,
   `processlist`.`rows_affected` AS `rows_affected`,
   `processlist`.`tmp_tables` AS `tmp_tables`,
   `processlist`.`tmp_disk_tables` AS `tmp_disk_tables`,
   `processlist`.`full_scan` AS `full_scan`,
   `processlist`.`last_statement` AS `last_statement`,
   `processlist`.`last_statement_latency` AS `last_statement_latency`,
   `processlist`.`current_memory` AS `current_memory`,
   `processlist`.`last_wait` AS `last_wait`,
   `processlist`.`last_wait_latency` AS `last_wait_latency`,
   `processlist`.`source` AS `source`,
   `processlist`.`trx_latency` AS `trx_latency`,
   `processlist`.`trx_state` AS `trx_state`,
   `processlist`.`trx_autocommit` AS `trx_autocommit`,
   `processlist`.`pid` AS `pid`,
   `processlist`.`program_name` AS `program_name`
FROM `sys`.`processlist` where ((`processlist`.`conn_id` is not null) and (`processlist`.`command` <> 'Daemon'));


# Replace placeholder table for x$schema_table_statistics with correct view syntax
# ------------------------------------------------------------

DROP TABLE `x$schema_table_statistics`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$schema_table_statistics`
AS SELECT
   `pst`.`OBJECT_SCHEMA` AS `table_schema`,
   `pst`.`OBJECT_NAME` AS `table_name`,
   `pst`.`SUM_TIMER_WAIT` AS `total_latency`,
   `pst`.`COUNT_FETCH` AS `rows_fetched`,
   `pst`.`SUM_TIMER_FETCH` AS `fetch_latency`,
   `pst`.`COUNT_INSERT` AS `rows_inserted`,
   `pst`.`SUM_TIMER_INSERT` AS `insert_latency`,
   `pst`.`COUNT_UPDATE` AS `rows_updated`,
   `pst`.`SUM_TIMER_UPDATE` AS `update_latency`,
   `pst`.`COUNT_DELETE` AS `rows_deleted`,
   `pst`.`SUM_TIMER_DELETE` AS `delete_latency`,
   `fsbi`.`count_read` AS `io_read_requests`,
   `fsbi`.`sum_number_of_bytes_read` AS `io_read`,
   `fsbi`.`sum_timer_read` AS `io_read_latency`,
   `fsbi`.`count_write` AS `io_write_requests`,
   `fsbi`.`sum_number_of_bytes_write` AS `io_write`,
   `fsbi`.`sum_timer_write` AS `io_write_latency`,
   `fsbi`.`count_misc` AS `io_misc_requests`,
   `fsbi`.`sum_timer_misc` AS `io_misc_latency`
FROM (`performance_schema`.`table_io_waits_summary_by_table` `pst` left join `sys`.`x$ps_schema_table_statistics_io` `fsbi` on(((`pst`.`OBJECT_SCHEMA` = `fsbi`.`table_schema`) and (`pst`.`OBJECT_NAME` = `fsbi`.`table_name`)))) order by `pst`.`SUM_TIMER_WAIT` desc;


# Replace placeholder table for x$schema_tables_with_full_table_scans with correct view syntax
# ------------------------------------------------------------

DROP TABLE `x$schema_tables_with_full_table_scans`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$schema_tables_with_full_table_scans`
AS SELECT
   `performance_schema`.`table_io_waits_summary_by_index_usage`.`OBJECT_SCHEMA` AS `object_schema`,
   `performance_schema`.`table_io_waits_summary_by_index_usage`.`OBJECT_NAME` AS `object_name`,
   `performance_schema`.`table_io_waits_summary_by_index_usage`.`COUNT_READ` AS `rows_full_scanned`,
   `performance_schema`.`table_io_waits_summary_by_index_usage`.`SUM_TIMER_WAIT` AS `latency`
FROM `performance_schema`.`table_io_waits_summary_by_index_usage` where (isnull(`performance_schema`.`table_io_waits_summary_by_index_usage`.`INDEX_NAME`) and (`performance_schema`.`table_io_waits_summary_by_index_usage`.`COUNT_READ` > 0)) order by `performance_schema`.`table_io_waits_summary_by_index_usage`.`COUNT_READ` desc;


# Replace placeholder table for memory_global_by_current_bytes with correct view syntax
# ------------------------------------------------------------

DROP TABLE `memory_global_by_current_bytes`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `memory_global_by_current_bytes`
AS SELECT
   `performance_schema`.`memory_summary_global_by_event_name`.`EVENT_NAME` AS `event_name`,
   `performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_COUNT_USED` AS `current_count`,
   `sys`.`format_bytes`(`performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) AS `current_alloc`,
   `sys`.`format_bytes`(ifnull((`performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED` / nullif(`performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_COUNT_USED`,0)),0)) AS `current_avg_alloc`,
   `performance_schema`.`memory_summary_global_by_event_name`.`HIGH_COUNT_USED` AS `high_count`,
   `sys`.`format_bytes`(`performance_schema`.`memory_summary_global_by_event_name`.`HIGH_NUMBER_OF_BYTES_USED`) AS `high_alloc`,
   `sys`.`format_bytes`(ifnull((`performance_schema`.`memory_summary_global_by_event_name`.`HIGH_NUMBER_OF_BYTES_USED` / nullif(`performance_schema`.`memory_summary_global_by_event_name`.`HIGH_COUNT_USED`,0)),0)) AS `high_avg_alloc`
FROM `performance_schema`.`memory_summary_global_by_event_name` where (`performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED` > 0) order by `performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED` desc;


# Replace placeholder table for memory_by_thread_by_current_bytes with correct view syntax
# ------------------------------------------------------------

DROP TABLE `memory_by_thread_by_current_bytes`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `memory_by_thread_by_current_bytes`
AS SELECT
   `mt`.`THREAD_ID` AS `thread_id`,if((`t`.`NAME` = 'thread/sql/one_connection'),concat(`t`.`PROCESSLIST_USER`,'@',`t`.`PROCESSLIST_HOST`),replace(`t`.`NAME`,'thread/','')) AS `user`,sum(`mt`.`CURRENT_COUNT_USED`) AS `current_count_used`,
   `sys`.`format_bytes`(sum(`mt`.`CURRENT_NUMBER_OF_BYTES_USED`)) AS `current_allocated`,
   `sys`.`format_bytes`(ifnull((sum(`mt`.`CURRENT_NUMBER_OF_BYTES_USED`) / nullif(sum(`mt`.`CURRENT_COUNT_USED`),0)),0)) AS `current_avg_alloc`,
   `sys`.`format_bytes`(max(`mt`.`CURRENT_NUMBER_OF_BYTES_USED`)) AS `current_max_alloc`,
   `sys`.`format_bytes`(sum(`mt`.`SUM_NUMBER_OF_BYTES_ALLOC`)) AS `total_allocated`
FROM (`performance_schema`.`memory_summary_by_thread_by_event_name` `mt` join `performance_schema`.`threads` `t` on((`mt`.`THREAD_ID` = `t`.`THREAD_ID`))) group by `mt`.`THREAD_ID`,if((`t`.`NAME` = 'thread/sql/one_connection'),concat(`t`.`PROCESSLIST_USER`,'@',`t`.`PROCESSLIST_HOST`),replace(`t`.`NAME`,'thread/','')) order by sum(`mt`.`CURRENT_NUMBER_OF_BYTES_USED`) desc;


# Replace placeholder table for schema_table_statistics with correct view syntax
# ------------------------------------------------------------

DROP TABLE `schema_table_statistics`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `schema_table_statistics`
AS SELECT
   `pst`.`OBJECT_SCHEMA` AS `table_schema`,
   `pst`.`OBJECT_NAME` AS `table_name`,
   `sys`.`format_time`(`pst`.`SUM_TIMER_WAIT`) AS `total_latency`,
   `pst`.`COUNT_FETCH` AS `rows_fetched`,
   `sys`.`format_time`(`pst`.`SUM_TIMER_FETCH`) AS `fetch_latency`,
   `pst`.`COUNT_INSERT` AS `rows_inserted`,
   `sys`.`format_time`(`pst`.`SUM_TIMER_INSERT`) AS `insert_latency`,
   `pst`.`COUNT_UPDATE` AS `rows_updated`,
   `sys`.`format_time`(`pst`.`SUM_TIMER_UPDATE`) AS `update_latency`,
   `pst`.`COUNT_DELETE` AS `rows_deleted`,
   `sys`.`format_time`(`pst`.`SUM_TIMER_DELETE`) AS `delete_latency`,
   `fsbi`.`count_read` AS `io_read_requests`,
   `sys`.`format_bytes`(`fsbi`.`sum_number_of_bytes_read`) AS `io_read`,
   `sys`.`format_time`(`fsbi`.`sum_timer_read`) AS `io_read_latency`,
   `fsbi`.`count_write` AS `io_write_requests`,
   `sys`.`format_bytes`(`fsbi`.`sum_number_of_bytes_write`) AS `io_write`,
   `sys`.`format_time`(`fsbi`.`sum_timer_write`) AS `io_write_latency`,
   `fsbi`.`count_misc` AS `io_misc_requests`,
   `sys`.`format_time`(`fsbi`.`sum_timer_misc`) AS `io_misc_latency`
FROM (`performance_schema`.`table_io_waits_summary_by_table` `pst` left join `sys`.`x$ps_schema_table_statistics_io` `fsbi` on(((`pst`.`OBJECT_SCHEMA` = `fsbi`.`table_schema`) and (`pst`.`OBJECT_NAME` = `fsbi`.`table_name`)))) order by `pst`.`SUM_TIMER_WAIT` desc;


# Replace placeholder table for x$host_summary_by_file_io_type with correct view syntax
# ------------------------------------------------------------

DROP TABLE `x$host_summary_by_file_io_type`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$host_summary_by_file_io_type`
AS SELECT
   if(isnull(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`),'background',`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`) AS `host`,
   `performance_schema`.`events_waits_summary_by_host_by_event_name`.`EVENT_NAME` AS `event_name`,
   `performance_schema`.`events_waits_summary_by_host_by_event_name`.`COUNT_STAR` AS `total`,
   `performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` AS `total_latency`,
   `performance_schema`.`events_waits_summary_by_host_by_event_name`.`MAX_TIMER_WAIT` AS `max_latency`
FROM `performance_schema`.`events_waits_summary_by_host_by_event_name` where ((`performance_schema`.`events_waits_summary_by_host_by_event_name`.`EVENT_NAME` like 'wait/io/file%') and (`performance_schema`.`events_waits_summary_by_host_by_event_name`.`COUNT_STAR` > 0)) order by if(isnull(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`),'background',`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`),`performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` desc;


# Replace placeholder table for innodb_lock_waits with correct view syntax
# ------------------------------------------------------------

DROP TABLE `innodb_lock_waits`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `innodb_lock_waits`
AS SELECT
   `r`.`trx_wait_started` AS `wait_started`,timediff(now(),`r`.`trx_wait_started`) AS `wait_age`,timestampdiff(SECOND,`r`.`trx_wait_started`,now()) AS `wait_age_secs`,
   `rl`.`lock_table` AS `locked_table`,
   `rl`.`lock_index` AS `locked_index`,
   `rl`.`lock_type` AS `locked_type`,
   `r`.`trx_id` AS `waiting_trx_id`,
   `r`.`trx_started` AS `waiting_trx_started`,timediff(now(),`r`.`trx_started`) AS `waiting_trx_age`,
   `r`.`trx_rows_locked` AS `waiting_trx_rows_locked`,
   `r`.`trx_rows_modified` AS `waiting_trx_rows_modified`,
   `r`.`trx_mysql_thread_id` AS `waiting_pid`,
   `sys`.`format_statement`(`r`.`trx_query`) AS `waiting_query`,
   `rl`.`lock_id` AS `waiting_lock_id`,
   `rl`.`lock_mode` AS `waiting_lock_mode`,
   `b`.`trx_id` AS `blocking_trx_id`,
   `b`.`trx_mysql_thread_id` AS `blocking_pid`,
   `sys`.`format_statement`(`b`.`trx_query`) AS `blocking_query`,
   `bl`.`lock_id` AS `blocking_lock_id`,
   `bl`.`lock_mode` AS `blocking_lock_mode`,
   `b`.`trx_started` AS `blocking_trx_started`,timediff(now(),`b`.`trx_started`) AS `blocking_trx_age`,
   `b`.`trx_rows_locked` AS `blocking_trx_rows_locked`,
   `b`.`trx_rows_modified` AS `blocking_trx_rows_modified`,concat('KILL QUERY ',`b`.`trx_mysql_thread_id`) AS `sql_kill_blocking_query`,concat('KILL ',`b`.`trx_mysql_thread_id`) AS `sql_kill_blocking_connection`
FROM ((((`information_schema`.`innodb_lock_waits` `w` join `information_schema`.`innodb_trx` `b` on((`b`.`trx_id` = `w`.`blocking_trx_id`))) join `information_schema`.`innodb_trx` `r` on((`r`.`trx_id` = `w`.`requesting_trx_id`))) join `information_schema`.`innodb_locks` `bl` on((`bl`.`lock_id` = `w`.`blocking_lock_id`))) join `information_schema`.`innodb_locks` `rl` on((`rl`.`lock_id` = `w`.`requested_lock_id`))) order by `r`.`trx_wait_started`;


# Replace placeholder table for schema_table_lock_waits with correct view syntax
# ------------------------------------------------------------

DROP TABLE `schema_table_lock_waits`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `schema_table_lock_waits`
AS SELECT
   `g`.`OBJECT_SCHEMA` AS `object_schema`,
   `g`.`OBJECT_NAME` AS `object_name`,
   `pt`.`THREAD_ID` AS `waiting_thread_id`,
   `pt`.`PROCESSLIST_ID` AS `waiting_pid`,
   `sys`.`ps_thread_account`(`p`.`OWNER_THREAD_ID`) AS `waiting_account`,
   `p`.`LOCK_TYPE` AS `waiting_lock_type`,
   `p`.`LOCK_DURATION` AS `waiting_lock_duration`,
   `sys`.`format_statement`(`pt`.`PROCESSLIST_INFO`) AS `waiting_query`,
   `pt`.`PROCESSLIST_TIME` AS `waiting_query_secs`,
   `ps`.`ROWS_AFFECTED` AS `waiting_query_rows_affected`,
   `ps`.`ROWS_EXAMINED` AS `waiting_query_rows_examined`,
   `gt`.`THREAD_ID` AS `blocking_thread_id`,
   `gt`.`PROCESSLIST_ID` AS `blocking_pid`,
   `sys`.`ps_thread_account`(`g`.`OWNER_THREAD_ID`) AS `blocking_account`,
   `g`.`LOCK_TYPE` AS `blocking_lock_type`,
   `g`.`LOCK_DURATION` AS `blocking_lock_duration`,concat('KILL QUERY ',`gt`.`PROCESSLIST_ID`) AS `sql_kill_blocking_query`,concat('KILL ',`gt`.`PROCESSLIST_ID`) AS `sql_kill_blocking_connection`
FROM (((((`performance_schema`.`metadata_locks` `g` join `performance_schema`.`metadata_locks` `p` on(((`g`.`OBJECT_TYPE` = `p`.`OBJECT_TYPE`) and (`g`.`OBJECT_SCHEMA` = `p`.`OBJECT_SCHEMA`) and (`g`.`OBJECT_NAME` = `p`.`OBJECT_NAME`) and (`g`.`LOCK_STATUS` = 'GRANTED') and (`p`.`LOCK_STATUS` = 'PENDING')))) join `performance_schema`.`threads` `gt` on((`g`.`OWNER_THREAD_ID` = `gt`.`THREAD_ID`))) join `performance_schema`.`threads` `pt` on((`p`.`OWNER_THREAD_ID` = `pt`.`THREAD_ID`))) left join `performance_schema`.`events_statements_current` `gs` on((`g`.`OWNER_THREAD_ID` = `gs`.`THREAD_ID`))) left join `performance_schema`.`events_statements_current` `ps` on((`p`.`OWNER_THREAD_ID` = `ps`.`THREAD_ID`))) where (`g`.`OBJECT_TYPE` = 'TABLE');


# Replace placeholder table for x$innodb_buffer_stats_by_table with correct view syntax
# ------------------------------------------------------------

DROP TABLE `x$innodb_buffer_stats_by_table`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$innodb_buffer_stats_by_table`
AS SELECT
   if((locate('.',`ibp`.`TABLE_NAME`) = 0),'InnoDB System',replace(substring_index(`ibp`.`TABLE_NAME`,'.',1),'`','')) AS `object_schema`,replace(substring_index(`ibp`.`TABLE_NAME`,'.',-(1)),'`','') AS `object_name`,sum(if((`ibp`.`COMPRESSED_SIZE` = 0),16384,`ibp`.`COMPRESSED_SIZE`)) AS `allocated`,sum(`ibp`.`DATA_SIZE`) AS `data`,count(`ibp`.`PAGE_NUMBER`) AS `pages`,count(if((`ibp`.`IS_HASHED` = 'YES'),1,0)) AS `pages_hashed`,count(if((`ibp`.`IS_OLD` = 'YES'),1,0)) AS `pages_old`,round(ifnull((sum(`ibp`.`NUMBER_RECORDS`) / nullif(count(distinct `ibp`.`INDEX_NAME`),0)),0),0) AS `rows_cached`
FROM `information_schema`.`innodb_buffer_page` `ibp` where (`ibp`.`TABLE_NAME` is not null) group by `object_schema`,`object_name` order by sum(if((`ibp`.`COMPRESSED_SIZE` = 0),16384,`ibp`.`COMPRESSED_SIZE`)) desc;


# Replace placeholder table for innodb_buffer_stats_by_schema with correct view syntax
# ------------------------------------------------------------

DROP TABLE `innodb_buffer_stats_by_schema`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `innodb_buffer_stats_by_schema`
AS SELECT
   if((locate('.',`ibp`.`TABLE_NAME`) = 0),'InnoDB System',replace(substring_index(`ibp`.`TABLE_NAME`,'.',1),'`','')) AS `object_schema`,
   `sys`.`format_bytes`(sum(if((`ibp`.`COMPRESSED_SIZE` = 0),16384,`ibp`.`COMPRESSED_SIZE`))) AS `allocated`,
   `sys`.`format_bytes`(sum(`ibp`.`DATA_SIZE`)) AS `data`,count(`ibp`.`PAGE_NUMBER`) AS `pages`,count(if((`ibp`.`IS_HASHED` = 'YES'),1,0)) AS `pages_hashed`,count(if((`ibp`.`IS_OLD` = 'YES'),1,0)) AS `pages_old`,round((sum(`ibp`.`NUMBER_RECORDS`) / count(distinct `ibp`.`INDEX_NAME`)),0) AS `rows_cached`
FROM `information_schema`.`innodb_buffer_page` `ibp` where (`ibp`.`TABLE_NAME` is not null) group by `object_schema` order by sum(if((`ibp`.`COMPRESSED_SIZE` = 0),16384,`ibp`.`COMPRESSED_SIZE`)) desc;


# Replace placeholder table for x$statements_with_sorting with correct view syntax
# ------------------------------------------------------------

DROP TABLE `x$statements_with_sorting`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$statements_with_sorting`
AS SELECT
   `performance_schema`.`events_statements_summary_by_digest`.`DIGEST_TEXT` AS `query`,
   `performance_schema`.`events_statements_summary_by_digest`.`SCHEMA_NAME` AS `db`,
   `performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR` AS `exec_count`,
   `performance_schema`.`events_statements_summary_by_digest`.`SUM_TIMER_WAIT` AS `total_latency`,
   `performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_MERGE_PASSES` AS `sort_merge_passes`,round(ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_MERGE_PASSES` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0),0) AS `avg_sort_merges`,
   `performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_SCAN` AS `sorts_using_scans`,
   `performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_RANGE` AS `sort_using_range`,
   `performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_ROWS` AS `rows_sorted`,round(ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_ROWS` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0),0) AS `avg_rows_sorted`,
   `performance_schema`.`events_statements_summary_by_digest`.`FIRST_SEEN` AS `first_seen`,
   `performance_schema`.`events_statements_summary_by_digest`.`LAST_SEEN` AS `last_seen`,
   `performance_schema`.`events_statements_summary_by_digest`.`DIGEST` AS `digest`
FROM `performance_schema`.`events_statements_summary_by_digest` where (`performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_ROWS` > 0) order by `performance_schema`.`events_statements_summary_by_digest`.`SUM_TIMER_WAIT` desc;


# Replace placeholder table for x$io_by_thread_by_latency with correct view syntax
# ------------------------------------------------------------

DROP TABLE `x$io_by_thread_by_latency`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$io_by_thread_by_latency`
AS SELECT
   if(isnull(`performance_schema`.`threads`.`PROCESSLIST_ID`),substring_index(`performance_schema`.`threads`.`NAME`,'/',-(1)),concat(`performance_schema`.`threads`.`PROCESSLIST_USER`,'@',`performance_schema`.`threads`.`PROCESSLIST_HOST`)) AS `user`,sum(`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`COUNT_STAR`) AS `total`,sum(`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,min(`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`MIN_TIMER_WAIT`) AS `min_latency`,avg(`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`AVG_TIMER_WAIT`) AS `avg_latency`,max(`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`MAX_TIMER_WAIT`) AS `max_latency`,
   `performance_schema`.`events_waits_summary_by_thread_by_event_name`.`THREAD_ID` AS `thread_id`,
   `performance_schema`.`threads`.`PROCESSLIST_ID` AS `processlist_id`
FROM (`performance_schema`.`events_waits_summary_by_thread_by_event_name` left join `performance_schema`.`threads` on((`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`THREAD_ID` = `performance_schema`.`threads`.`THREAD_ID`))) where ((`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`EVENT_NAME` like 'wait/io/file/%') and (`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`SUM_TIMER_WAIT` > 0)) group by `performance_schema`.`events_waits_summary_by_thread_by_event_name`.`THREAD_ID`,`performance_schema`.`threads`.`PROCESSLIST_ID`,`user` order by sum(`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`SUM_TIMER_WAIT`) desc;


# Replace placeholder table for schema_redundant_indexes with correct view syntax
# ------------------------------------------------------------

DROP TABLE `schema_redundant_indexes`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `schema_redundant_indexes`
AS SELECT
   `redundant_keys`.`table_schema` AS `table_schema`,
   `redundant_keys`.`table_name` AS `table_name`,
   `redundant_keys`.`index_name` AS `redundant_index_name`,
   `redundant_keys`.`index_columns` AS `redundant_index_columns`,
   `redundant_keys`.`non_unique` AS `redundant_index_non_unique`,
   `dominant_keys`.`index_name` AS `dominant_index_name`,
   `dominant_keys`.`index_columns` AS `dominant_index_columns`,
   `dominant_keys`.`non_unique` AS `dominant_index_non_unique`,if((`redundant_keys`.`subpart_exists` or `dominant_keys`.`subpart_exists`),1,0) AS `subpart_exists`,concat('ALTER TABLE `',`redundant_keys`.`table_schema`,'`.`',`redundant_keys`.`table_name`,'` DROP INDEX `',`redundant_keys`.`index_name`,'`') AS `sql_drop_index`
FROM (`sys`.`x$schema_flattened_keys` `redundant_keys` join `sys`.`x$schema_flattened_keys` `dominant_keys` on(((`redundant_keys`.`table_schema` = `dominant_keys`.`table_schema`) and (`redundant_keys`.`table_name` = `dominant_keys`.`table_name`)))) where ((`redundant_keys`.`index_name` <> `dominant_keys`.`index_name`) and (((`redundant_keys`.`index_columns` = `dominant_keys`.`index_columns`) and ((`redundant_keys`.`non_unique` > `dominant_keys`.`non_unique`) or ((`redundant_keys`.`non_unique` = `dominant_keys`.`non_unique`) and (if((`redundant_keys`.`index_name` = 'PRIMARY'),'',`redundant_keys`.`index_name`) > if((`dominant_keys`.`index_name` = 'PRIMARY'),'',`dominant_keys`.`index_name`))))) or ((locate(concat(`redundant_keys`.`index_columns`,','),`dominant_keys`.`index_columns`) = 1) and (`redundant_keys`.`non_unique` = 1)) or ((locate(concat(`dominant_keys`.`index_columns`,','),`redundant_keys`.`index_columns`) = 1) and (`dominant_keys`.`non_unique` = 0))));


# Replace placeholder table for session_ssl_status with correct view syntax
# ------------------------------------------------------------

DROP TABLE `session_ssl_status`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `session_ssl_status`
AS SELECT
   `sslver`.`THREAD_ID` AS `thread_id`,
   `sslver`.`VARIABLE_VALUE` AS `ssl_version`,
   `sslcip`.`VARIABLE_VALUE` AS `ssl_cipher`,
   `sslreuse`.`VARIABLE_VALUE` AS `ssl_sessions_reused`
FROM ((`performance_schema`.`status_by_thread` `sslver` left join `performance_schema`.`status_by_thread` `sslcip` on(((`sslcip`.`THREAD_ID` = `sslver`.`THREAD_ID`) and (`sslcip`.`VARIABLE_NAME` = 'Ssl_cipher')))) left join `performance_schema`.`status_by_thread` `sslreuse` on(((`sslreuse`.`THREAD_ID` = `sslver`.`THREAD_ID`) and (`sslreuse`.`VARIABLE_NAME` = 'Ssl_sessions_reused')))) where (`sslver`.`VARIABLE_NAME` = 'Ssl_version');


# Replace placeholder table for x$schema_index_statistics with correct view syntax
# ------------------------------------------------------------

DROP TABLE `x$schema_index_statistics`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$schema_index_statistics`
AS SELECT
   `performance_schema`.`table_io_waits_summary_by_index_usage`.`OBJECT_SCHEMA` AS `table_schema`,
   `performance_schema`.`table_io_waits_summary_by_index_usage`.`OBJECT_NAME` AS `table_name`,
   `performance_schema`.`table_io_waits_summary_by_index_usage`.`INDEX_NAME` AS `index_name`,
   `performance_schema`.`table_io_waits_summary_by_index_usage`.`COUNT_FETCH` AS `rows_selected`,
   `performance_schema`.`table_io_waits_summary_by_index_usage`.`SUM_TIMER_FETCH` AS `select_latency`,
   `performance_schema`.`table_io_waits_summary_by_index_usage`.`COUNT_INSERT` AS `rows_inserted`,
   `performance_schema`.`table_io_waits_summary_by_index_usage`.`SUM_TIMER_INSERT` AS `insert_latency`,
   `performance_schema`.`table_io_waits_summary_by_index_usage`.`COUNT_UPDATE` AS `rows_updated`,
   `performance_schema`.`table_io_waits_summary_by_index_usage`.`SUM_TIMER_UPDATE` AS `update_latency`,
   `performance_schema`.`table_io_waits_summary_by_index_usage`.`COUNT_DELETE` AS `rows_deleted`,
   `performance_schema`.`table_io_waits_summary_by_index_usage`.`SUM_TIMER_INSERT` AS `delete_latency`
FROM `performance_schema`.`table_io_waits_summary_by_index_usage` where (`performance_schema`.`table_io_waits_summary_by_index_usage`.`INDEX_NAME` is not null) order by `performance_schema`.`table_io_waits_summary_by_index_usage`.`SUM_TIMER_WAIT` desc;


# Replace placeholder table for waits_by_host_by_latency with correct view syntax
# ------------------------------------------------------------

DROP TABLE `waits_by_host_by_latency`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `waits_by_host_by_latency`
AS SELECT
   if(isnull(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`),'background',`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`) AS `host`,
   `performance_schema`.`events_waits_summary_by_host_by_event_name`.`EVENT_NAME` AS `event`,
   `performance_schema`.`events_waits_summary_by_host_by_event_name`.`COUNT_STAR` AS `total`,
   `sys`.`format_time`(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,
   `sys`.`format_time`(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`AVG_TIMER_WAIT`) AS `avg_latency`,
   `sys`.`format_time`(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`MAX_TIMER_WAIT`) AS `max_latency`
FROM `performance_schema`.`events_waits_summary_by_host_by_event_name` where ((`performance_schema`.`events_waits_summary_by_host_by_event_name`.`EVENT_NAME` <> 'idle') and (`performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` > 0)) order by if(isnull(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`),'background',`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`),`performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` desc;


# Replace placeholder table for x$schema_flattened_keys with correct view syntax
# ------------------------------------------------------------

DROP TABLE `x$schema_flattened_keys`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$schema_flattened_keys`
AS SELECT
   `information_schema`.`statistics`.`TABLE_SCHEMA` AS `table_schema`,
   `information_schema`.`statistics`.`TABLE_NAME` AS `table_name`,
   `information_schema`.`statistics`.`INDEX_NAME` AS `index_name`,max(`information_schema`.`statistics`.`NON_UNIQUE`) AS `non_unique`,max(if(isnull(`information_schema`.`statistics`.`SUB_PART`),0,1)) AS `subpart_exists`,group_concat(`information_schema`.`statistics`.`COLUMN_NAME` order by `information_schema`.`statistics`.`SEQ_IN_INDEX` ASC separator ',') AS `index_columns`
FROM `information_schema`.`statistics` where ((`information_schema`.`statistics`.`INDEX_TYPE` = 'BTREE') and (`information_schema`.`statistics`.`TABLE_SCHEMA` not in ('mysql','sys','INFORMATION_SCHEMA','PERFORMANCE_SCHEMA'))) group by `information_schema`.`statistics`.`TABLE_SCHEMA`,`information_schema`.`statistics`.`TABLE_NAME`,`information_schema`.`statistics`.`INDEX_NAME`;


# Replace placeholder table for statements_with_sorting with correct view syntax
# ------------------------------------------------------------

DROP TABLE `statements_with_sorting`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `statements_with_sorting`
AS SELECT
   `sys`.`format_statement`(`performance_schema`.`events_statements_summary_by_digest`.`DIGEST_TEXT`) AS `query`,
   `performance_schema`.`events_statements_summary_by_digest`.`SCHEMA_NAME` AS `db`,
   `performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR` AS `exec_count`,
   `sys`.`format_time`(`performance_schema`.`events_statements_summary_by_digest`.`SUM_TIMER_WAIT`) AS `total_latency`,
   `performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_MERGE_PASSES` AS `sort_merge_passes`,round(ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_MERGE_PASSES` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0),0) AS `avg_sort_merges`,
   `performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_SCAN` AS `sorts_using_scans`,
   `performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_RANGE` AS `sort_using_range`,
   `performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_ROWS` AS `rows_sorted`,round(ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_ROWS` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0),0) AS `avg_rows_sorted`,
   `performance_schema`.`events_statements_summary_by_digest`.`FIRST_SEEN` AS `first_seen`,
   `performance_schema`.`events_statements_summary_by_digest`.`LAST_SEEN` AS `last_seen`,
   `performance_schema`.`events_statements_summary_by_digest`.`DIGEST` AS `digest`
FROM `performance_schema`.`events_statements_summary_by_digest` where (`performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_ROWS` > 0) order by `performance_schema`.`events_statements_summary_by_digest`.`SUM_TIMER_WAIT` desc;


# Replace placeholder table for x$host_summary_by_file_io with correct view syntax
# ------------------------------------------------------------

DROP TABLE `x$host_summary_by_file_io`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$host_summary_by_file_io`
AS SELECT
   if(isnull(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`),'background',`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`) AS `host`,sum(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`COUNT_STAR`) AS `ios`,sum(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT`) AS `io_latency`
FROM `performance_schema`.`events_waits_summary_by_host_by_event_name` where (`performance_schema`.`events_waits_summary_by_host_by_event_name`.`EVENT_NAME` like 'wait/io/file/%') group by if(isnull(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`),'background',`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`) order by sum(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT`) desc;

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
