/***************************************************/
/***********    DATA MART n°2 : VENTE   ************/
/***************************************************/


/***************************************************/
/********************** BASE ***********************/
/***************************************************/
/*
DROP DATABASE IF EXISTS NBA;
CREATE DATABASE NBA;
USE NBA;
*/


/***************************************************/
/********************* TABLES **********************/
/***************************************************/
DROP TABLE IF EXISTS VENTE; 
DROP TABLE IF EXISTS PRODUIT;
DROP TABLE IF EXISTS TYPE_PRODUIT;
DROP TABLE IF EXISTS LOCALISATION;
DROP TABLE IF EXISTS EQUIPE;
DROP TABLE IF EXISTS DATE;
DROP TABLE IF EXISTS HEURE;

CREATE TABLE VENTE(
  produit_id VARCHAR(20),
  type_produit_id VARCHAR(20),
  localisation_id VARCHAR(20),
  equipe_id VARCHAR(20),
  date_id VARCHAR(20),
  heure_id VARCHAR(20),
  prix INTEGER(10) NOT NULL,
  CONSTRAINT PK_VENTE PRIMARY KEY (produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id),
  CONSTRAINT FK_VENTE_PRODUIT FOREIGN KEY (produit_id) REFERENCES PRODUIT(produit_id),
  CONSTRAINT FK_VENTE_TYPE_PRODUIT FOREIGN KEY (type_produit_id) REFERENCES TYPE_PRODUIT(type_produit_id),
  CONSTRAINT FK_VENTE_LOCALISATION FOREIGN KEY (localisation_id) REFERENCES LOCALISATION(localisation_id),
  CONSTRAINT FK_VENTE_EQUIPE FOREIGN KEY (equipe_id) REFERENCES EQUIPE(equipe_id),
  CONSTRAINT FK_VENTE_DATE FOREIGN KEY (date_id) REFERENCES DATE(date_id),
  CONSTRAINT FK_VENTE_HEURE FOREIGN KEY (heure_id) REFERENCES HEURE(heure_id)
);

CREATE TABLE PRODUIT(
  produit_id VARCHAR(20),
  produit_nom VARCHAR(100) NOT NULL,
  CONSTRAINT PK_PRODUIT PRIMARY KEY (produit_id)
);

CREATE TABLE TYPE_PRODUIT(
  type_produit_id VARCHAR(20),
  type_produit_description VARCHAR(1000) NOT NULL,
  CONSTRAINT PK_TYPE_PRODUIT PRIMARY KEY (type_produit_id)
);

CREATE TABLE LOCALISATION(
  localisation_id VARCHAR(20),
  ville VARCHAR(1000) NOT NULL,
  pays VARCHAR(1000) NOT NULL,
  latitude VARCHAR(1000),
  longitude VARCHAR(1000),
  CONSTRAINT PK_LOCALISATION PRIMARY KEY (localisation_id)
);

CREATE TABLE EQUIPE(
  equipe_id VARCHAR(20),
  equipe_nom VARCHAR(25) NOT NULL,
  equipe_conference VARCHAR(20),
  equipe_division VARCHAR(20),
  nb_effectif INTEGER,
  CONSTRAINT PK_EQUIPE PRIMARY KEY (equipe_id)
);

CREATE TABLE DATE(
  date_id VARCHAR(20),
  jour INTEGER CHECK (jour BETWEEN 1 AND 31),
  mois INTEGER CHECK (mois BETWEEN 1 AND 12),
  annee INTEGER(4),
  CONSTRAINT PK_DATE PRIMARY KEY (date_id)
);

CREATE TABLE HEURE(
  heure_id VARCHAR(20),
  heure INTEGER CHECK (heure BETWEEN 0 AND 23),
  minute INTEGER CHECK (minute BETWEEN 0 AND 59),
  seconde INTEGER CHECK (heure BETWEEN 0 AND 59),
  CONSTRAINT PK_HEURE PRIMARY KEY (heure_id)
);


/***************************************************/
/**************** INSERTION TUPLES *****************/
/***************************************************/

/* INSERTION PRODUIT */
INSERT INTO PRODUIT(produit_id, produit_nom) VALUES (1, 'Nike');
INSERT INTO PRODUIT(produit_id, produit_nom) VALUES (2, 'Adidas');
INSERT INTO PRODUIT(produit_id, produit_nom) VALUES (3, 'Puma');
INSERT INTO PRODUIT(produit_id, produit_nom) VALUES (4, 'Asics');
INSERT INTO PRODUIT(produit_id, produit_nom) VALUES (5, 'The North Face');
INSERT INTO PRODUIT(produit_id, produit_nom) VALUES (6, 'New Balance');
INSERT INTO PRODUIT(produit_id, produit_nom) VALUES (7, 'DynaFit');
INSERT INTO PRODUIT(produit_id, produit_nom) VALUES (8, 'Under Armour');

/***************************************************/
/**************** INSERTION TYPE DE PRODUIT ********/
/***************************************************/
/* Maillots - Casquettes - Echarpes - Goodies - Posters - Billets - Equipements - Jeux */
INSERT INTO TYPE_PRODUIT(type_produit_id, type_produit_description) VALUES (1, 'Ticket');
INSERT INTO TYPE_PRODUIT(type_produit_id, type_produit_description) VALUES (2, 'Casquette');
INSERT INTO TYPE_PRODUIT(type_produit_id, type_produit_description) VALUES (3, 'Maillot');
INSERT INTO TYPE_PRODUIT(type_produit_id, type_produit_description) VALUES (4, 'Chaussure');
INSERT INTO TYPE_PRODUIT(type_produit_id, type_produit_description) VALUES (5, 'Goodie');
INSERT INTO TYPE_PRODUIT(type_produit_id, type_produit_description) VALUES (6, 'Posters');
INSERT INTO TYPE_PRODUIT(type_produit_id, type_produit_description) VALUES (7, 'Bandeau');
INSERT INTO TYPE_PRODUIT(type_produit_id, type_produit_description) VALUES (8, 'Ballon');
INSERT INTO TYPE_PRODUIT(type_produit_id, type_produit_description) VALUES (9, 'Manchette');
INSERT INTO TYPE_PRODUIT(type_produit_id, type_produit_description) VALUES (11, 'Chevillière');
INSERT INTO TYPE_PRODUIT(type_produit_id, type_produit_description) VALUES (12, 'Sac');
INSERT INTO TYPE_PRODUIT(type_produit_id, type_produit_description) VALUES (13, 'Chaussettes');
INSERT INTO TYPE_PRODUIT(type_produit_id, type_produit_description) VALUES (14, 'Jambière');
INSERT INTO TYPE_PRODUIT(type_produit_id, type_produit_description) VALUES (15, 'Bonnet');




/***************************************************/
/**************** INSERTION EQUIPE *****************/
/***************************************************/
INSERT INTO EQUIPE(equipe_id, equipe_nom, equipe_conference, equipe_division, nb_effectif) VALUES (1, 'Denver Nuggets', 'Ouest', 'Nord-Ouest', 17);
INSERT INTO EQUIPE(equipe_id, equipe_nom, equipe_conference, equipe_division, nb_effectif) VALUES (2, 'Minnesotta Timberwolves', 'Ouest', 'Nord-Ouest', 16);
INSERT INTO EQUIPE(equipe_id, equipe_nom, equipe_conference, equipe_division, nb_effectif) VALUES (3, 'Oklahoma City Thunder', 'Ouest', 'Nord-Ouest', 16);
INSERT INTO EQUIPE(equipe_id, equipe_nom, equipe_conference, equipe_division, nb_effectif) VALUES (4, 'Portland Trail Blazers', 'Ouest', 'Nord-Ouest', 17);
INSERT INTO EQUIPE(equipe_id, equipe_nom, equipe_conference, equipe_division, nb_effectif) VALUES (5, 'Utah Jazz', 'Ouest', 'Nord-Ouest', 16);
INSERT INTO EQUIPE(equipe_id, equipe_nom, equipe_conference, equipe_division, nb_effectif) VALUES (6, 'Golden State Warriors', 'Ouest', 'Pacifique', 17);
INSERT INTO EQUIPE(equipe_id, equipe_nom, equipe_conference, equipe_division, nb_effectif) VALUES (7, 'Los Angeles Clippers', 'Ouest', 'Pacifique', 17);
INSERT INTO EQUIPE(equipe_id, equipe_nom, equipe_conference, equipe_division, nb_effectif) VALUES (8, 'Los Angles Lakers', 'Ouest', 'Pacifique', 17);
INSERT INTO EQUIPE(equipe_id, equipe_nom, equipe_conference, equipe_division, nb_effectif) VALUES (9, 'Phoenix Suns', 'Ouest', 'Pacifique', 16);
INSERT INTO EQUIPE(equipe_id, equipe_nom, equipe_conference, equipe_division, nb_effectif) VALUES (10, 'Sacramento Kings', 'Ouest', 'Pacifique', 17);
INSERT INTO EQUIPE(equipe_id, equipe_nom, equipe_conference, equipe_division, nb_effectif) VALUES (11, 'Dallas Mavericks', 'Ouest', 'Sud-Ouest', 17);
INSERT INTO EQUIPE(equipe_id, equipe_nom, equipe_conference, equipe_division, nb_effectif) VALUES (12, 'Houston Rockets', 'Ouest', 'Sud-Ouest', 17);
INSERT INTO EQUIPE(equipe_id, equipe_nom, equipe_conference, equipe_division, nb_effectif) VALUES (13, 'Memphis Grizzlies', 'Ouest', 'Sud-Ouest', 17);
INSERT INTO EQUIPE(equipe_id, equipe_nom, equipe_conference, equipe_division, nb_effectif) VALUES (14, 'New Orleans Pelicans', 'Ouest', 'Sud-Ouest', 17);
INSERT INTO EQUIPE(equipe_id, equipe_nom, equipe_conference, equipe_division, nb_effectif) VALUES (15, 'San Antonio Spurs', 'Ouest', 'Sud-Ouest', 17);
INSERT INTO EQUIPE(equipe_id, equipe_nom, equipe_conference, equipe_division, nb_effectif) VALUES (16, 'Boston Celtics', 'Est', 'Atlantique', 17);
INSERT INTO EQUIPE(equipe_id, equipe_nom, equipe_conference, equipe_division, nb_effectif) VALUES (17, 'Brooklyn Nets', 'Est', 'Atlantique', 15);
INSERT INTO EQUIPE(equipe_id, equipe_nom, equipe_conference, equipe_division, nb_effectif) VALUES (18, 'New York Knicks', 'Est', 'Atlantique', 17);
INSERT INTO EQUIPE(equipe_id, equipe_nom, equipe_conference, equipe_division, nb_effectif) VALUES (19, 'Philadelphie 76ers', 'Est', 'Atlantique', 17);
INSERT INTO EQUIPE(equipe_id, equipe_nom, equipe_conference, equipe_division, nb_effectif) VALUES (20, 'Toronto Raptors', 'Est', 'Atlantique', 17);
INSERT INTO EQUIPE(equipe_id, equipe_nom, equipe_conference, equipe_division, nb_effectif) VALUES (21, 'Chicago Bulls', 'Est', 'Centrale', 16);
INSERT INTO EQUIPE(equipe_id, equipe_nom, equipe_conference, equipe_division, nb_effectif) VALUES (22, 'Cleveland Cavaliers', 'Est', 'Centrale', 16);
INSERT INTO EQUIPE(equipe_id, equipe_nom, equipe_conference, equipe_division, nb_effectif) VALUES (23, 'Detroit Pistons', 'Est', 'Centrale', 17);
INSERT INTO EQUIPE(equipe_id, equipe_nom, equipe_conference, equipe_division, nb_effectif) VALUES (24, 'Indiana Pacers', 'Est', 'Centrale', 16);
INSERT INTO EQUIPE(equipe_id, equipe_nom, equipe_conference, equipe_division, nb_effectif) VALUES (25, 'Milwaukee Bucks', 'Est', 'Centrale', 16);
INSERT INTO EQUIPE(equipe_id, equipe_nom, equipe_conference, equipe_division, nb_effectif) VALUES (26, 'Atlanta Hawks', 'Est', 'Sud-Est', 17);
INSERT INTO EQUIPE(equipe_id, equipe_nom, equipe_conference, equipe_division, nb_effectif) VALUES (27, 'Charlotte Hornets', 'Est', 'Sud-Est', 15);
INSERT INTO EQUIPE(equipe_id, equipe_nom, equipe_conference, equipe_division, nb_effectif) VALUES (28, 'Miami Heat', 'Est', 'Sud-Est', 17);
INSERT INTO EQUIPE(equipe_id, equipe_nom, equipe_conference, equipe_division, nb_effectif) VALUES (29, 'Orlando Magic', 'Est', 'Sud-Est', 16);
INSERT INTO EQUIPE(equipe_id, equipe_nom, equipe_conference, equipe_division, nb_effectif) VALUES (30, 'Washington Wizards', 'Est', 'Sud-Est', 17);

/***************************************************/
/**************** INSERTION LOCALISATION *****************/
/***************************************************/
INSERT INTO LOCALISATION(localisation_id, ville, pays, latitude, longitude) VALUES (1, 'Atlanta', 'USA', 1, 1);
INSERT INTO LOCALISATION(localisation_id, ville, pays, latitude, longitude) VALUES (2, 'Boston', 'USA', 1, 1);
INSERT INTO LOCALISATION(localisation_id, ville, pays, latitude, longitude) VALUES (3, 'New-York', 'USA', 1, 1);
INSERT INTO LOCALISATION(localisation_id, ville, pays, latitude, longitude) VALUES (4, 'Chicago', 'USA', 1, 1);
INSERT INTO LOCALISATION(localisation_id, ville, pays, latitude, longitude) VALUES (5, 'Washington DC', 'USA', 1, 1);
INSERT INTO LOCALISATION(localisation_id, ville, pays, latitude, longitude) VALUES (6, 'Miami', 'USA', 1, 1);
INSERT INTO LOCALISATION(localisation_id, ville, pays, latitude, longitude) VALUES (7, 'Oakland', 'USA', 1, 1);
INSERT INTO LOCALISATION(localisation_id, ville, pays, latitude, longitude) VALUES (8, 'Toronto', 'Canada', 1, 1);
INSERT INTO LOCALISATION(localisation_id, ville, pays, latitude, longitude) VALUES (9, 'Cleveland', 'USA', 1, 1);
INSERT INTO LOCALISATION(localisation_id, ville, pays, latitude, longitude) VALUES (10, 'Houston', 'USA', 1, 1);
INSERT INTO LOCALISATION(localisation_id, ville, pays, latitude, longitude) VALUES (11, 'Orlando', 'USA', 1, 1);
INSERT INTO LOCALISATION(localisation_id, ville, pays, latitude, longitude) VALUES (12, 'Detroit', 'USA', 1, 1);
INSERT INTO LOCALISATION(localisation_id, ville, pays, latitude, longitude) VALUES (13, 'Charlotte', 'USA', 1, 1);
INSERT INTO LOCALISATION(localisation_id, ville, pays, latitude, longitude) VALUES (14, 'Milwaukee', 'USA', 1, 1);
INSERT INTO LOCALISATION(localisation_id, ville, pays, latitude, longitude) VALUES (15, 'San Antonio', 'USA', 1, 1);
INSERT INTO LOCALISATION(localisation_id, ville, pays, latitude, longitude) VALUES (16, 'Seattle', 'USA', 1, 1);
INSERT INTO LOCALISATION(localisation_id, ville, pays, latitude, longitude) VALUES (17, 'Memphis', 'USA', 1, 1);
INSERT INTO LOCALISATION(localisation_id, ville, pays, latitude, longitude) VALUES (18, 'Oklahoma', 'USA', 1, 1);
INSERT INTO LOCALISATION(localisation_id, ville, pays, latitude, longitude) VALUES (19, 'Dallas', 'USA', 1, 1);
INSERT INTO LOCALISATION(localisation_id, ville, pays, latitude, longitude) VALUES (20, 'Los Angeles', 'USA', 1, 1);

/***************************************************/
/**************** INSERTION DATE *****************/
/***************************************************/

INSERT INTO DATE(date_id,jour,mois,annee) VALUES (1,1,8,2019);
INSERT INTO DATE(date_id,jour,mois,annee) VALUES (2,2,8,2019);
INSERT INTO DATE(date_id,jour,mois,annee) VALUES (3,3,8,2019);
INSERT INTO DATE(date_id,jour,mois,annee) VALUES (4,4,8,2019);
INSERT INTO DATE(date_id,jour,mois,annee) VALUES (5,5,8,2019);
INSERT INTO DATE(date_id,jour,mois,annee) VALUES (6,6,8,2019);
INSERT INTO DATE(date_id,jour,mois,annee) VALUES (7,7,8,2019);
INSERT INTO DATE(date_id,jour,mois,annee) VALUES (8,8,8,2019);
INSERT INTO DATE(date_id,jour,mois,annee) VALUES (9,9,8,2019);
INSERT INTO DATE(date_id,jour,mois,annee) VALUES (10,10,8,2019);
INSERT INTO DATE(date_id,jour,mois,annee) VALUES (11,11,8,2019);
INSERT INTO DATE(date_id,jour,mois,annee) VALUES (12,12,8,2019);
INSERT INTO DATE(date_id,jour,mois,annee) VALUES (13,13,8,2019);
INSERT INTO DATE(date_id,jour,mois,annee) VALUES (14,14,8,2019);
INSERT INTO DATE(date_id,jour,mois,annee) VALUES (15,15,8,2019);
INSERT INTO DATE(date_id,jour,mois,annee) VALUES (16,16,8,2019);
INSERT INTO DATE(date_id,jour,mois,annee) VALUES (17,17,8,2019);
INSERT INTO DATE(date_id,jour,mois,annee) VALUES (18,18,8,2019);
INSERT INTO DATE(date_id,jour,mois,annee) VALUES (19,19,8,2019);
INSERT INTO DATE(date_id,jour,mois,annee) VALUES (20,20,8,2019);
INSERT INTO DATE(date_id,jour,mois,annee) VALUES (21,21,8,2019);
INSERT INTO DATE(date_id,jour,mois,annee) VALUES (22,22,8,2019);
INSERT INTO DATE(date_id,jour,mois,annee) VALUES (23,23,8,2019);
INSERT INTO DATE(date_id,jour,mois,annee) VALUES (24,24,8,2019);
INSERT INTO DATE(date_id,jour,mois,annee) VALUES (25,25,8,2019);
INSERT INTO DATE(date_id,jour,mois,annee) VALUES (26,26,8,2019);
INSERT INTO DATE(date_id,jour,mois,annee) VALUES (27,27,8,2019);
INSERT INTO DATE(date_id,jour,mois,annee) VALUES (28,28,8,2019);
INSERT INTO DATE(date_id,jour,mois,annee) VALUES (29,29,8,2019);
INSERT INTO DATE(date_id,jour,mois,annee) VALUES (30,30,8,2019);

/***************************************************/
/**************** INSERTION HEURE *****************/
/***************************************************/
INSERT INTO HEURE(heure_id, heure, minute, seconde) VALUES (1, 12, 30, 59);
INSERT INTO HEURE(heure_id, heure, minute, seconde) VALUES (2, 01, 37, 59);
INSERT INTO HEURE(heure_id, heure, minute, seconde) VALUES (3, 21, 10, 59);
INSERT INTO HEURE(heure_id, heure, minute, seconde) VALUES (4, 14, 18, 03);
INSERT INTO HEURE(heure_id, heure, minute, seconde) VALUES (5, 17, 30, 59);
INSERT INTO HEURE(heure_id, heure, minute, seconde) VALUES (6, 20, 11, 11);
INSERT INTO HEURE(heure_id, heure, minute, seconde) VALUES (7, 02, 30, 23);
INSERT INTO HEURE(heure_id, heure, minute, seconde) VALUES (8, 09, 17, 39);
INSERT INTO HEURE(heure_id, heure, minute, seconde) VALUES (9, 18, 56, 44);
INSERT INTO HEURE(heure_id, heure, minute, seconde) VALUES (10, 17, 30, 29);


/*******************************************************/
/******************* INSERTION VENTE ******************/
/*******************************************************/
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,5,16,6,21,5,105);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,14,10,16,20,1,291);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,2,1,2,6,5,51);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,7,13,2,19,6,4);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,14,12,27,4,9,31);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,13,9,11,29,4,5);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,2,13,24,29,9,33);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,2,3,29,25,4,25);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,2,10,14,18,4,4);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,7,5,4,28,3,88);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,6,7,9,17,9,18);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,6,5,7,4,15);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,1,6,14,4,4,72);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,9,14,19,8,1,29);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,13,16,2,16,7,28);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,3,2,3,7,6,20);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,12,16,5,8,2,5);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,2,15,9,5,3,3);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,7,2,23,29,4,45);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,14,2,15,7,9,6);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,2,14,11,9,6,24);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,5,9,26,17,8,110);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,1,5,27,22,6,25);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,4,1,27,23,5,22);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,14,5,12,19,1,29);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,4,5,13,23,8,17);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,4,11,18,9,8,14);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,7,2,24,2,4,8);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,8,10,10,27,9,11);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,11,15,15,21,5,5);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,11,4,15,27,6,17);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,13,2,26,12,8,19);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,13,2,4,27,9,54);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,14,7,20,7,8,16);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,14,2,9,5,1,18);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,6,9,6,7,4,152);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,1,19,9,7,3,10);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,3,15,25,25,4,33);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,8,10,1,6,6,22);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,10,5,1,26,7,221);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,14,10,12,3,7,67);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,9,13,20,9,9,26);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,5,7,25,29,9,7);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,4,6,11,3,2,6);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,10,18,18,13,4,7);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,8,2,13,27,4,43);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,5,9,17,19,4,214);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,13,13,2,29,2,13);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,7,6,21,11,1,37);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,1,8,9,4,22);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,2,7,29,21,6,29);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,4,14,16,12,4,44);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,13,5,9,3,2,5);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,1,12,29,10,8,2);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,9,18,22,7,8,99);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,9,2,10,3,2,112);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,6,14,14,1,7,34);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,7,18,2,16,1,3);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,8,19,9,27,2,16);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,6,8,8,6,4,3);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,11,6,27,3,5,14);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,8,6,25,4,2,107);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,8,1,26,25,5,55);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,5,16,28,29,3,4);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,4,10,13,29,1,273);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,4,19,2,17,4,258);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,3,15,9,28,7,45);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,3,13,18,6,1,17);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,1,16,26,24,8,6);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,3,17,2,26,4,8);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,5,7,3,20,3,6);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,9,12,5,5,34);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,11,1,8,22,9,24);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,10,19,14,3,1,241);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,10,4,16,9,21);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,14,8,29,23,6,7);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,14,6,29,6,4,49);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,12,14,17,9,6,279);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,13,4,10,8,2,23);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,1,5,9,24,5,99);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,6,16,14,16,8,247);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,2,13,11,2,6,7);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,3,12,21,13,8,7);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,2,17,26,10,7,46);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,16,10,15,4,224);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,6,9,27,4,217);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,10,12,14,25,3,27);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,4,8,13,16,9,37);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,7,5,9,24,8,164);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,12,16,27,11,2,242);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,8,1,26,11,6,107);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,11,5,18,7,3,53);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,7,12,23,15,8,47);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,12,12,23,23,2,35);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,9,13,6,13,2,42);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,12,18,13,3,3,46);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,5,13,7,14,7,9);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,4,13,10,16,6,8);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,6,12,7,27,3,24);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,4,3,4,3,3,28);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,1,15,27,2,3,93);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,1,10,8,11,2,34);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,10,13,14,13,6,22);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,10,19,19,26,5,3);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,7,1,14,2,29);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,8,14,15,2,2);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,6,17,7,4,4,19);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,9,13,24,18,1,225);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,3,6,14,7,2,7);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,10,7,12,27,8,25);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,8,6,11,14,9,227);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,2,14,6,20,2,14);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,7,19,29,12,5,41);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,13,13,27,5,4,164);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,4,19,7,26,7,26);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,10,11,14,8,1,73);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,8,4,17,11,5,218);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,13,2,12,24,1,33);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,11,4,10,18,4,22);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,4,19,1,3,2,3);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,11,6,14,21,4,8);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,7,15,21,18,1,79);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,8,13,25,23,8,35);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,3,16,28,22,4,16);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,12,4,8,6,7,7);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,1,8,25,21,7,268);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,10,11,29,21,9,4);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,14,2,28,2,6,141);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,2,9,17,14,7,273);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,17,2,22,2,6);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,12,8,9,8,5);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,10,13,10,27,8,45);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,18,29,4,2,20);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,3,9,18,18,5,100);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,7,6,16,2,4,27);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,7,13,21,8,1,115);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,5,29,28,8,24);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,10,16,8,9,5,14);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,7,1,3,21,1,5);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,13,12,4,3,1,176);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,18,20,17,8,26);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,16,20,12,7,15);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,5,7,5,28,5,55);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,12,17,2,5,5,95);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,18,10,1,1,18);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,7,4,28,12,6,28);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,13,4,10,11,2,18);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,7,6,14,3,9,47);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,3,16,16,23,3,6);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,11,5,11,17,2,114);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,3,2,27,18,4,7);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,3,15,14,3,1,29);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,1,13,14,9,7,61);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,13,3,6,12,9,94);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,1,13,1,22,6,21);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,10,6,10,28,4,58);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,4,1,16,25,6,275);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,9,6,28,8,6,3);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,14,9,7,11,7,30);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,6,3,16,14,4,47);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,5,1,13,9,1,6);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,10,9,28,13,1,8);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,7,17,16,4,2,107);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,13,1,17,26,6,20);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,7,8,26,8,9,49);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,8,8,25,12,1,54);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,14,2,11,17,5,45);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,14,6,24,14,6,41);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,5,12,24,11,4,71);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,14,18,10,16,4,23);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,2,4,25,2,6,9);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,2,15,2,29,9,103);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,8,13,14,9,4,52);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,10,6,24,26,1,174);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,7,3,3,25,2,146);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,14,9,26,19,4,20);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,6,10,16,8,2,8);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,9,19,11,29,6,198);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,14,20,15,1,2);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,1,22,29,2,14);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,3,15,6,7,6,137);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,10,29,14,5,13);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,3,14,5,26,5,28);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,2,18,11,14,7,94);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,6,11,15,4,1,54);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,7,17,3,5,6,48);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,3,17,6,28,7,3);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,6,25,7,7,47);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,14,15,11,27,3,22);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,1,9,17,17,4,283);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,11,25,29,9,126);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,3,11,1,3,8,114);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,5,3,18,23,2,15);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,3,2,18,12,2,211);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,6,4,17,1,9,91);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,4,2,17,26,4,10);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,9,14,22,16,1,35);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,10,6,6,8,4,8);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,12,17,2,15,1,9);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,13,3,6,27,3,31);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,6,15,14,6,16);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,14,16,10,22,8,3);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,9,26,19,5,299);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,9,10,1,6,9,20);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,5,21,14,3,9);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,2,16,3,13,8,9);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,6,3,13,29,2,9);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,13,9,6,26,3,7);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,6,17,1,9,6,65);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,7,12,16,11,1,80);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,12,1,4,26,1,25);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,2,4,20,11,7,50);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,10,6,25,4,9,15);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,1,7,12,10,5,119);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,5,14,8,1,4,15);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,4,11,3,12,4,111);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,6,12,4,17,9,93);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,9,18,10,27,7,11);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,11,12,7,26,2,6);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,10,19,1,17,2,7);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,3,6,19,13,2,24);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,2,14,9,9,6,18);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,8,17,27,12,4,18);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,3,11,27,8,6);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,1,11,25,5,6,21);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,14,19,9,8,2,23);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,3,1,25,2,9,164);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,13,19,14,6,6,24);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,10,6,28,26,2,43);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,4,4,20,8,1,22);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,8,5,12,2,35);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,9,15,27,11,7,16);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,11,16,16,10,1,20);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,8,3,2,9,1,43);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,12,1,7,5,9,29);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,10,13,9,13,1,33);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,9,14,28,21,8,96);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,7,2,8,7,7,38);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,14,5,5,14,9,8);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,2,4,6,15,1,6);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,3,13,14,23,1,47);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,9,2,22,19,3,11);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,11,5,5,21,3,14);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,8,9,25,3,7,7);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,1,17,13,26,1,15);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,4,2,23,2,8,9);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,11,7,18,12,9,25);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,2,12,15,8,3,11);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,2,4,6,1,4,98);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,6,3,10,19,2,248);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,14,12,25,28,6,60);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,4,17,13,3,7,18);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,1,16,21,25,8,4);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,14,1,22,4,1,254);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,6,19,27,17,2,25);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,1,1,19,3,5,4);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,2,2,28,17,4,38);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,11,11,18,16,8,2);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,12,15,28,24,3,46);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,6,2,10,4,6,20);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,7,17,6,22,2,209);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,4,14,1,26,2,96);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,3,9,2,15,8,199);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,7,9,12,19,2,53);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,5,14,9,19,3,3);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,6,7,11,3,1,9);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,13,3,24,23,5,7);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,14,17,11,16,4,14);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,14,19,24,10,6,3);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,6,11,15,28,6,22);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,1,7,6,28,8,225);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,5,3,20,16,1,10);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,7,15,14,19,5,31);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,7,3,4,12,2,291);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,11,15,24,7,6,17);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,5,5,10,12,8,40);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,8,10,20,22,3,28);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,12,18,19,24,8,47);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,14,18,13,27,9,21);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,2,12,12,29,2,35);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,13,16,5,22,5,22);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,3,18,24,20,6,5);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,10,18,14,26,7,55);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,10,17,15,5,9,18);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,13,14,17,4,5,5);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,2,3,14,16,9,9);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,3,4,12,10,2,105);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,14,18,7,20,4,6);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,13,15,11,16,8,20);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,5,1,10,17,2,7);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,5,11,29,22,9,4);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,8,9,29,12,2,39);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,9,7,17,14,5,23);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,12,3,6,28,3,7);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,6,19,5,3,6,99);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,8,16,17,26,7,30);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,3,2,19,19,8,22);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,13,15,28,18,3,38);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,7,25,22,5,28);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,8,6,24,4,2,251);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,10,8,1,17,1,16);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,8,14,28,19,8,5);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,6,10,6,8,7,24);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,5,4,3,16,5,42);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,14,11,23,6,7,109);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,8,2,10,24,3,15);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,5,17,9,1,111);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,2,1,19,14,4,7);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,10,18,25,29,4,81);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,6,16,20,25,6,274);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,2,16,19,4,9,6);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,14,11,22,27,9,225);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,13,14,6,23,4,18);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,8,5,18,14,4,289);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,6,16,25,23,5,33);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,6,10,15,14,7,116);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,14,1,23,19,2,46);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,5,14,10,17,4,32);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,13,4,18,26,8,24);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,2,17,26,12,2,27);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,5,12,17,9,1,5);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,8,6,12,23,7,96);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,1,1,13,11,5,7);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,1,10,20,15,4,15);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,8,12,5,8,6,2);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,2,13,10,28,3,5);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,13,7,26,13,5,43);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,6,2,9,15,4,39);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,13,11,29,12,4,101);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,12,11,3,20,6,2);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,8,6,24,4,4,5);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,2,18,28,22,8,27);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,9,19,2,25,4,21);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,5,12,3,4,4,21);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,10,4,9,14,3,200);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,3,2,11,28,5,20);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,7,14,12,10,8,12);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,5,11,6,16,1,34);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,6,15,2,7,9,12);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,5,7,25,13,5,5);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,12,7,25,2,21);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,12,8,22,21,1,6);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,7,12,17,13,6,118);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,4,4,11,23,1,182);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,5,7,24,21,3,38);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,10,16,7,16,6,209);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,9,4,12,11,9,8);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,7,5,10,8,8);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,9,3,22,21,7,4);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,3,1,13,20,9,61);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,14,14,12,11,9,34);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,13,3,21,28,5,13);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,2,11,3,28,8,27);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,3,8,21,7,9,13);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,7,2,9,2,6,3);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,3,19,2,11,5,29);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,3,10,2,23,9,2);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,2,3,12,23,9,27);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,3,11,11,26,3,2);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,10,1,29,29,6,23);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,5,26,9,4,3);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,12,10,10,14,9,14);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,11,5,1,9,1,93);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,13,4,28,18,4,256);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,8,4,12,22,6,37);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,2,13,12,14,9,13);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,1,18,1,22,5,19);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,11,11,6,5,5,255);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,9,18,2,19,6,33);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,11,14,10,25,4,52);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,3,8,10,11,6,15);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,12,17,22,13,8,7);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,5,10,11,20,7,93);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,11,11,13,19,8,13);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,3,2,20,2,8,17);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,2,1,10,1,4,25);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,12,8,27,22,7,9);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,13,2,19,29,4,99);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,18,6,13,8,18);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,14,2,3,15,6,5);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,8,17,26,24,6,93);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,2,5,21,1,1,50);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,9,13,11,26,7,6);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,14,3,11,26,7,6);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,3,16,12,3,7,296);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,13,10,20,11,9,35);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,10,1,19,5,1,257);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,14,18,7,14,6,112);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,12,16,6,5,2,8);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,2,19,23,13,1,47);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,1,15,11,23,2,27);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,1,19,29,14,5,7);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,13,2,16,14,6,54);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,1,14,23,16,1,28);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,14,12,11,15,2,246);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,8,4,2,10,2,44);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,14,16,21,3,5,3);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,7,2,14,23,1,7);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,3,12,26,13,9,21);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,8,12,25,28,9,16);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,9,8,18,27,8,54);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,4,29,7,4,28);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,12,7,18,7,3,5);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,8,14,2,2,3,8);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,11,5,25,6,8,28);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,12,6,13,21,4,23);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,7,8,17,18,7,23);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,10,18,27,21,9,30);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,2,9,18,26,1,27);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,7,3,29,18,1,14);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,6,8,17,22,3,25);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,7,14,2,20,1,9);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,13,12,21,22,4,8);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,10,4,16,28,3,66);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,6,9,5,13,2,6);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,14,16,16,18,9,19);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,9,13,2,2,9,116);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,10,12,1,16,6,23);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,5,15,28,27,4,131);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,5,11,27,25,4,28);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,11,13,6,16,5,23);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,4,4,4,3,2,22);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,14,9,28,14,8,10);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,3,11,22,4,8,59);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,8,11,17,19,1,23);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,8,6,21,18,8,97);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,7,13,1,14,2,25);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,9,14,2,2,19);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,9,1,25,19,8,14);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,14,6,27,11,9,43);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,2,18,13,19,7,52);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,5,17,3,14,4,103);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,6,10,22,11,1,269);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,14,10,6,9,1,93);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,13,9,18,16,8,29);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,2,19,2,24,1,218);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,3,12,9,4,3,242);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,5,13,5,19,7,23);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,4,7,18,29,1,99);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,9,20,22,2,26);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,8,15,20,29,3,25);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,7,2,10,29,1,9);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,13,13,16,17,8,29);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,13,19,9,18,2,242);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,13,4,22,24,4,7);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,3,13,4,27,2,13);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,13,16,28,11,4,9);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,8,5,20,24,6,6);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,14,13,5,3,8,5);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,11,2,26,14,6,63);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,9,6,9,24,7,34);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,7,15,27,1,3,16);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,8,2,1,3,6,3);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,2,13,17,3,7,108);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,5,11,26,17,5,6);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,9,2,7,6,9,30);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,8,4,21,11,2,21);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,7,9,6,28,2,174);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,6,1,26,2,4,8);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,1,8,6,24,1,15);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,5,3,22,26,2,28);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,9,17,17,24,2,245);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,9,8,18,6,3,1);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,3,17,11,4,6,4);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,14,19,18,25,5,9);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,3,19,2,18,1,12);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,4,8,25,3,3);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,5,15,23,8,6,94);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,10,19,9,8,3,28);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,13,6,14,14,6,187);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,6,13,21,29,6,6);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,10,10,24,27,6,9);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,1,8,27,9,5,25);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,14,8,23,1,1,17);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,10,8,12,28,9,7);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,9,21,21,9,2);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,10,5,18,27,9,26);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,2,4,13,2,5,6);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,14,17,19,19,7,19);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,8,4,16,10,9,5);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,5,11,15,2,1,104);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,12,15,3,14,8,250);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,5,17,27,11,6,6);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,10,8,9,19,1,28);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,11,1,13,19,6,22);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,7,1,8,27,1,9);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,4,15,2,21,4,18);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,12,11,25,11,6,5);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,5,3,18,1,13);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,13,2,11,20,6,124);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,5,22,28,3,6);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,5,3,7,5,1,20);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,12,19,29,18,9,41);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,13,18,10,29,2,38);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,9,16,10,12,8,8);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,1,12,13,13,2,98);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,14,19,16,27,6,7);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,7,10,10,2,1,144);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,12,14,24,6,7,16);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,13,13,26,28,2,4);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,4,1,5,2,6,13);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,12,1,18,8,4,97);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,7,14,18,16,8,144);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,11,12,15,24,6,3);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,6,14,2,1,9,10);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,7,13,22,5,4,11);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,1,15,23,20,1,10);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,8,14,9,2,7,18);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,12,27,7,8,235);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,9,18,4,15,9,3);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,12,5,21,3,6,12);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,7,18,26,27,5,155);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,2,9,27,18,4,8);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,6,11,22,3,8,27);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,12,7,24,11,3,101);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,14,17,16,1,9,277);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,5,12,12,25,3,21);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,3,7,9,3,5,3);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,2,9,17,14,8,16);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,14,26,18,3,24);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,8,20,3,4,159);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,11,8,27,26,2,110);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,11,11,10,9,4,245);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,7,16,21,21,8,6);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,12,6,3,9,4,11);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,3,11,11,9,8);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,6,12,1,9,8,16);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,5,15,12,28,9,12);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,1,17,4,18,4,6);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,3,12,21,1,8,14);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,13,8,23,27,3,38);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,1,13,26,1,7,107);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,11,11,20,16,6,104);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,11,11,28,26,4,18);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,9,8,4,15,7,14);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,12,1,4,7,6);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,10,9,13,14,5,17);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,14,19,23,21,1,5);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,3,19,20,9,4,71);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,1,3,19,10,2,48);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,1,4,8,2,2,24);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,2,19,18,11,3,23);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,2,6,21,7,2,9);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,3,16,19,25,7,8);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,1,20,29,5,81);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,11,8,8,18,9,28);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,8,17,15,13,8,57);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,6,9,4,6,2,6);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,1,15,14,15,6,52);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,10,14,24,17,5,37);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,13,14,22,15,9,19);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,10,2,17,18,5,29);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,2,2,9,18,4,8);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,8,9,23,10,9,47);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,2,5,8,7,2,98);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,7,8,11,18,7,4);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,14,9,21,5,3,2);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,11,14,8,13,4,17);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,11,13,19,17,7,242);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,5,18,6,2,5,9);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,3,16,21,2,3,11);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,12,18,9,1,6,6);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,8,10,22,24,1,23);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,9,3,16,14,9,20);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,16,8,3,4,1);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,2,10,17,14,5,3);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,6,10,24,29,7,57);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,2,6,5,29,6,22);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,4,3,4,1,8,202);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,12,8,23,18,1,10);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,6,16,3,18,3,108);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,2,12,17,20,1,15);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,3,8,22,19,3,36);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,12,18,10,13,4,28);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,8,15,27,16,2,34);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,3,1,29,27,8,21);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,6,16,18,21,9,17);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,10,13,26,16,5,102);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,12,5,7,14,6,3);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,7,4,27,25,5,6);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,2,11,24,1,8,8);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,1,2,18,15,8,6);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,5,16,11,27,8,18);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,12,3,11,9,9,53);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,6,13,25,9,4,23);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,17,18,17,3,68);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,8,13,11,6,1,23);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,3,17,17,21,7,203);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,14,2,5,2,7,4);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,4,6,23,7,4,96);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,11,9,9,3,8,9);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,5,17,13,17,8,20);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,6,3,15,14,7,96);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,8,16,23,23,5,5);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,8,10,5,13,7,5);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,7,5,2,16,2,108);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,2,2,5,19,7,18);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,3,7,21,26,3,30);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,13,16,19,11,1,8);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,6,4,20,17,9,142);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,12,6,24,13,1,10);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,4,7,1,28,3,5);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,13,5,29,5,5,254);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,12,6,9,2,6,22);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,9,15,17,6,2,19);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,6,11,18,26,5,13);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,1,6,27,19,3,16);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,10,4,16,27,8,29);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,13,11,2,9,9,53);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,7,15,25,14,7,115);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,5,1,25,9,13);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,4,5,22,12,9,32);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,4,8,16,11,8,22);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,5,6,7,16,8,110);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,13,8,29,17,3,41);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,3,1,10,17,6,123);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,11,12,1,21,1,28);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,2,11,16,7,3,299);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,6,2,20,17,3,24);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,8,15,21,9,9,174);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,11,4,8,11,5,108);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,17,28,17,8,22);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,10,12,28,12,6,117);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,14,16,7,1,2,8);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,3,10,5,23,9,116);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,3,6,13,28,8,5);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,14,13,13,19,4,6);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,14,7,8,23,6,27);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,7,11,23,13,4,158);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,1,4,27,21,4,18);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,9,13,18,9,1,4);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,4,1,2,3,4,14);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,6,3,27,24,1,22);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,4,14,15,15,8,44);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,8,5,4,11,8,191);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,12,2,10,11,5,3);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,13,9,4,24,3,5);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,3,18,17,29,2,296);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,9,26,21,6,27);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,11,15,28,20,5,22);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,1,12,14,8,9,28);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,14,18,1,14,3,6);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,6,11,6,11,8,207);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,3,15,19,5,2,29);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,1,19,7,7,3,104);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,11,4,22,22,4,61);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,12,8,6,28,7,4);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,13,11,10,2,33);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,5,19,12,4,27);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,3,17,16,3,3,4);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,13,5,5,20,6,251);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,4,2,20,2,15);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,9,13,11,27,9,276);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,10,7,20,27,3,28);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,11,13,27,27,2,6);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,6,2,21,13,1,57);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,14,7,21,24,6,57);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,11,17,3,1,3,15);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,4,29,3,8,12);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,12,6,4,14,4,27);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,11,16,29,19,9,38);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,7,14,4,18,1,2);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,11,18,19,28,2,25);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,7,6,25,10,6,7);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,14,26,21,3,17);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,13,16,16,9,4,5);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,9,4,21,6,260);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,7,18,12,2,1,5);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,10,17,14,14,9,20);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,3,15,9,10,7,4);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,1,2,14,28,1,26);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,13,14,27,28,9,5);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,6,12,6,20,4,29);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,4,4,4,4,3,24);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,11,1,14,2,4,193);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,11,16,1,11,7,121);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,5,5,22,16,2,25);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,9,1,19,1,5,12);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,7,7,26,6,8,147);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,8,15,19,24,9,26);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,9,14,27,2,2,23);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,5,5,12,6,6,49);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,13,12,26,11,1,103);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,7,3,12,17,1,8);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,2,4,23,26,1,7);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,7,12,21,3,17);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,4,7,22,10,2,2);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,12,16,4,13,9,128);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,13,7,14,8,6);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,1,5,25,8,7,37);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,12,1,12,15,6,24);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,4,18,28,18,5,28);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,6,6,3,2,8,12);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,3,2,14,24,8,42);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,8,10,16,24,4,105);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,5,4,1,10,7,290);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,18,28,19,3,7);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,5,15,23,7,9,128);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,1,8,6,19,4,23);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,1,6,11,6,8,9);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,10,2,20,27,1,8);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,3,9,23,1,97);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,1,16,1,1,7,16);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,6,9,8,1,9,8);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,1,13,18,26,9,8);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,4,6,17,14,5,15);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,2,11,17,26,7,19);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,3,2,5,26,8,18);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,14,16,25,10,9,25);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,10,5,22,8,9,38);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,16,7,29,8,8);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,1,13,13,17,8,222);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,4,19,8,2,6,5);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,4,11,3,8,4,19);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,14,9,1,12,5,38);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,5,11,1,11,2,5);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,14,9,8,27,3,12);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,13,15,14,9,7,82);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,3,14,20,5,3,4);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,8,13,21,6,3,68);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,9,13,18,11,7,18);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,8,11,21,17,5,7);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,2,12,10,15,6,17);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,10,5,27,8,3,3);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,6,6,21,28,2,107);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,6,9,6,25,9,9);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,6,7,21,3,5,163);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,7,7,5,5,4,13);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,8,14,3,9,8,228);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,11,12,24,26,3,39);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,7,28,27,3,5);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,10,6,21,15,9,138);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,5,5,14,15,7,162);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,12,16,19,7,9,13);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,5,16,23,2,7,5);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,6,10,28,23,4,49);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,12,6,23,11,1,30);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,8,7,3,14,2,101);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,10,16,14,22,4,26);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,5,18,10,25,9,15);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,10,3,21,19,4,23);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,4,6,29,18,3,108);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,2,2,23,16,4,24);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,8,6,24,29,2,71);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,6,5,5,17,7,109);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,14,8,13,10,3,8);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,10,6,14,14,5,45);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,7,13,3,7,7,8);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,11,8,11,2,4,8);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,5,2,15,7,3,22);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,13,19,3,21,5,6);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,6,4,7,5,42);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,9,17,16,4,20);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,3,2,27,16,7,18);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,5,12,25,21,2,244);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,14,18,4,25,9,101);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,2,17,17,6,6,7);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,8,21,15,4,36);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,11,14,24,25,4,30);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,4,6,4,26,6,146);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,15,17,13,6,3);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,5,14,29,8,1,47);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,2,12,2,24,8,6);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,6,9,17,18,6,49);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,4,13,19,21,5,10);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,2,14,1,29,2,35);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,14,14,21,14,4,7);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,3,12,16,18,1,5);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,6,14,6,4,8,7);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,14,4,17,25,5,23);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,4,11,10,1,4,108);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,14,5,14,16,7,29);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,8,8,15,19,3,114);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,8,1,2,19,5,9);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,8,3,12,10,9,2);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,12,12,14,3,2,36);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,12,8,19,26,7,10);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,14,10,9,2,4,4);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,16,20,21,8,56);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,6,12,11,8,2,21);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,9,11,26,19,5,4);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,1,13,14,1,6,30);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,14,14,15,26,7,1);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,3,25,3,2,16);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,7,25,14,6,8);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,3,11,13,11,3,284);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,12,4,17,3,1,4);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,7,16,11,3,5,1);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,16,25,15,7,40);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,2,27,16,3,10);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,10,10,14,11,5,103);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,11,5,3,20,1,16);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,14,18,12,18,6,205);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,13,6,6,3,3,25);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,14,15,28,13,8,3);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,10,16,6,22,3,8);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,7,16,19,19,3,7);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,13,16,22,12,5,35);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,12,11,21,11,3,12);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,5,8,22,6,6,129);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,10,25,11,1,57);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,7,7,27,23,3,26);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,14,11,8,8,6);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,14,5,12,2,7,170);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,3,1,20,11,6,5);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,7,3,26,26,6,7);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,18,7,22,5,22);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,1,18,13,2,7,25);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,2,5,11,4,8,7);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,7,2,27,3,1,31);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,3,12,12,18,9,27);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,13,19,7,5,7,27);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,10,5,10,27,6,29);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,6,12,22,3,1,8);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,4,7,21,9,1,113);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,5,15,14,7,8,238);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,2,18,15,24,8,104);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,2,6,19,2,2,19);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,11,8,18,1,7,28);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,13,15,27,18,4,26);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,5,4,7,14,5,10);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,2,11,16,24,6,41);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,1,3,28,12,7,104);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,10,19,7,24,3,12);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,3,10,14,16,3,14);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,8,8,29,26,7,6);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,6,4,18,7,3,4);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,2,11,21,8,6,35);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,8,14,18,12,3,84);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,12,9,14,13,7,175);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,14,11,1,2,2,255);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,8,4,19,4,6,19);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,3,16,12,14,3,28);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,5,19,9,3,2,90);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,10,13,13,23,9,175);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,10,1,19,22,2,29);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,1,7,23,21,5,22);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,6,6,4,27,8,23);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,14,9,29,9,6,14);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,12,14,27,10,4,29);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,14,1,1,26,9,104);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,1,19,15,8,2,38);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,9,10,25,27,2,4);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,5,13,19,9,5);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,11,14,2,18,6,254);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,2,9,4,11,8,19);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,5,15,23,21,5,124);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,3,17,18,14,5,39);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,3,10,9,4,4,47);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,11,10,7,18,2,21);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,9,7,8,15,9,3);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,14,3,15,16,8,126);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,14,2,21,27,7,3);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,13,14,18,14,7,28);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,4,16,3,22,5,166);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,12,7,19,13,4,6);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,1,12,4,14,5,50);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,8,7,27,1,3,41);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,1,6,6,7,1,26);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,13,2,18,28,9,3);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,9,17,28,28,6,6);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,7,2,7,22,6,6);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,3,17,5,22,3,111);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,2,12,8,14,9,86);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,12,5,19,12,2,7);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,6,7,22,28,4,45);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,8,1,12,24,5,20);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,13,3,17,2,6,19);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,11,19,1,23,1,27);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,7,12,8,23,7,2);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,8,8,18,3,5,3);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,6,6,9,29,5,115);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,10,10,11,25,9,6);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,2,3,26,26,7,111);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,13,9,11,4,3,14);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,4,13,21,26,8,23);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,13,5,4,8,3,233);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,1,19,29,14,2,17);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,6,15,26,28,7,2);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,14,19,3,28,5,6);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,11,4,24,17,2,46);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,8,16,25,18,5,11);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,13,15,1,14,7,21);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,6,8,8,9,8,18);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,14,9,3,28,6,198);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,6,17,13,10,1,216);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,8,15,17,23,2,7);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,6,7,23,21,5,23);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,10,9,21,18,7,100);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,9,7,20,26,6,27);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,2,14,11,3,1,11);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,3,16,5,20,5,187);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,12,4,6,28,1,19);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,10,7,25,9,5,37);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,10,12,9,3,4,2);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,11,1,25,27,6,32);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,3,8,8,29,1,4);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,12,11,26,20,1,17);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,10,14,28,19,4,17);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,10,15,3,21,1,238);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,5,11,24,3,1,32);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,14,12,13,22,2,8);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,9,7,25,15,3,84);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,2,5,21,11,3,3);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,11,19,20,21,5,31);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,4,19,26,14,7,23);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,3,5,24,24,5,25);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,11,5,25,14,7,14);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,5,2,27,24,6,31);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,4,3,1,21,1,53);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,6,14,26,8,2,248);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,6,16,14,12,4,7);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,8,1,8,10,9,204);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,10,4,4,24,5,144);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,4,9,1,2,3,17);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,12,10,29,11,2,18);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,3,14,29,24,4,2);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,14,12,16,25,1,39);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,11,18,11,25,1,21);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,9,6,12,12,2,4);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,4,9,13,19,5,17);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,2,3,21,19,2,18);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,9,18,4,7,1,110);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,3,17,15,29,3,25);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,2,19,7,15,9,10);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,6,10,5,12,9,100);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,13,7,29,12,4,38);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,10,12,16,15,5,266);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,9,17,24,21,8,254);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,3,19,19,2,5);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,4,7,11,24,9,31);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,4,14,12,20,4,277);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,5,5,7,28,7,23);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,12,6,23,22,4,101);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,7,17,24,6,1,17);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,3,7,16,5,7,46);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,1,5,14,4,2,46);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,2,9,2,1,2,36);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,1,13,4,20,2,4);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,3,11,4,19,6,32);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,13,15,18,29,4,36);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,14,17,16,16,4,190);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,17,28,14,3,58);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,6,3,7,2,24);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,14,18,18,4,4,3);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,14,4,10,2,9,9);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,5,19,12,14,3,112);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,3,8,6,17,1,148);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,14,4,12,10,1,47);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,6,9,23,12,2,14);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,9,15,26,3,8,5);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,11,2,4,15,8,186);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,11,9,7,26,9,87);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,4,1,8,26,4,109);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,7,16,3,7,2,111);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,8,17,3,20,7,2);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,2,3,6,14,8,9);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,2,17,19,11,1,204);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,3,7,10,8,5,3);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,2,8,22,1,5,35);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,9,3,16,24,5,21);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,11,9,17,16,5,27);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,4,9,9,11,7,36);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,11,4,28,8,2,5);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,5,1,9,7,3,24);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,2,1,6,20,8,2);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,13,10,22,10,5,39);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,9,9,19,25,7,122);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,7,10,10,26,3,17);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,3,7,12,1,3,49);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,2,4,1,16,7,24);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,4,11,1,27,8,17);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,10,18,5,10,1,137);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,7,16,14,8,6,24);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,5,16,2,20,5,20);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,6,1,13,13,5,14);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,13,11,28,17,7,129);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,6,2,21,22,4,13);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,14,17,27,28,2,43);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,11,9,23,24,2,101);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,9,2,5,18,2,12);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,1,2,21,4,2,111);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,2,10,12,18,4,47);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,5,3,8,2,3,143);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,5,19,28,23,8,11);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,11,7,17,23,9,15);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,6,18,12,20,6,27);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,8,13,5,18,8,35);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,2,12,17,9,7,101);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,3,12,3,16,6,4);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,1,2,22,11,5,176);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,4,24,15,3,6);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,7,14,27,2,2,71);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,4,7,22,27,8,3);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,9,6,11,16,1,65);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,1,15,6,15,3,14);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,13,11,11,17,4,6);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,3,19,8,26,3,24);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,3,7,9,21,7,3);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,8,13,13,4,4,180);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,2,4,2,3,42);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,12,17,25,20,8,117);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,1,6,22,10,7,74);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,11,2,9,7,9,6);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,11,4,16,4,8,91);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,13,6,27,10,2,25);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,18,19,24,8,40);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,11,14,7,5,9,47);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,10,4,4,16,8,6);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,14,11,16,1,9,199);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,3,10,15,12,7,20);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,1,1,26,19,5,109);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,10,12,6,15,2,29);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,10,8,24,20,5,17);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,6,2,25,8,61);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,8,27,24,7,88);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,2,14,12,7,1,31);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,10,16,23,5,9,25);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,3,11,13,2,7,46);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,16,7,29,7,14);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,9,13,17,23,4,29);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,6,13,12,20,2,265);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,5,3,2,3,8,9);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,3,15,13,9,2,7);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,8,16,16,23,6,26);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,7,19,21,3,4,4);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,13,13,9,29,3,23);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,5,10,23,25,8,24);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,18,14,26,2,6);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,7,16,12,19,6,110);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,8,16,29,25,3,18);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,9,18,17,29,7,9);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,7,3,7,19,4,22);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,5,9,12,28,2,9);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,12,6,13,10,2,6);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,14,4,29,4,3,35);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,10,14,7,17,2,9);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,11,11,9,16,5,20);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,1,6,25,26,4,16);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,12,9,11,22,8,29);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,5,6,27,5,3,26);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,2,19,11,7,1,38);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,4,6,25,6,20);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,8,9,28,29,7,266);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,3,19,13,19,7,42);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,11,14,27,13,9,109);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,4,13,7,27,7,41);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,3,17,17,9,5,20);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,12,3,10,28,9,263);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,14,11,28,20,2,35);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,14,16,21,4,5,46);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,3,14,10,7,8,181);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,2,13,20,8,8,22);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,7,13,5,9,8,41);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,4,25,18,7,29);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,1,18,21,13,5,240);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,14,2,21,5,8,3);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,2,7,11,5,3,200);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,12,13,17,2,4,4);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,10,15,22,29,4,208);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,2,19,5,10,1,23);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,6,16,9,22,3,23);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,1,9,22,3,9,53);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,2,8,25,4,8,259);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,1,23,12,8,5);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,1,11,22,15,3,2);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,6,9,26,12,7,29);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,3,6,28,1,3,20);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,8,15,29,8,27);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,12,18,10,16,6,229);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,11,1,17,9,9,21);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,1,19,8,16,3,27);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,5,4,22,22,7,21);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,4,10,13,4,2,6);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,9,18,23,16,2,42);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,13,19,17,2,7,3);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,6,18,13,28,4,15);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,9,6,6,10,6,98);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,6,13,15,28,8,2);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,13,10,21,14,8,10);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,1,10,24,20,1,20);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,13,10,22,24,5,7);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,9,7,14,5,21);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,11,6,23,7,194);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,3,15,1,2,1,5);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,16,17,25,1,105);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,12,28,21,2,100);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,4,3,14,21,6,88);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,4,16,26,24,5,9);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,11,16,2,1,5,5);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,2,16,25,16,6,11);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,13,17,2,16,7,35);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,4,6,28,4,8,25);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,7,9,29,3,2,201);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,7,15,9,3,8,21);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,6,15,13,27,4,108);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,1,11,5,7,6,28);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,13,9,28,27,4,1);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,14,11,2,8,5,8);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,11,7,21,23,9,51);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,7,14,10,21,1,247);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,7,2,13,20,5,21);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,5,19,13,15,8,37);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,18,25,18,3,12);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,4,8,24,14,2,294);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,11,15,4,4,4,213);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,10,2,2,16,6,9);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,1,9,5,14,7,74);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,13,3,18,15,6,11);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,14,17,7,18,1,6);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,7,7,9,29,9,155);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,14,21,19,3,30);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,11,19,4,3,2,8);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,12,18,12,15,8,20);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,11,14,11,29,6,1);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,7,14,3,13,1,17);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,12,2,21,8,6,114);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,14,14,10,23,8,87);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,12,3,21,19,6,23);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,2,1,24,2,8,23);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,11,8,8,29,9,36);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,9,8,14,9,3,107);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,13,18,28,24,9,26);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,13,5,3,23,7,59);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,11,7,9,14,6,16);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,10,19,14,19,7,133);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,4,1,13,19,2,262);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,1,12,20,13,8,22);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,13,12,8,23,1,18);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,13,11,24,11,9,26);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,3,8,25,19,1,111);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,1,17,4,23,5,225);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,13,15,11,9,3,5);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,9,9,14,13,8,24);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,10,6,17,16,9,20);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,10,9,13,19,8,23);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,4,18,18,22,9,5);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,8,13,5,5,3,281);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,4,4,1,1,8,86);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,5,15,25,2,3,12);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,14,12,8,3,2,176);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,6,4,10,19,9,13);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,14,16,10,27,5,81);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,9,11,1,29,1,28);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,4,12,29,8,1,53);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,13,2,2,26,6,17);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,11,15,22,13,1,5);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,3,9,19,6,4,13);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,5,28,5,7,52);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,13,4,25,8,4,90);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,3,6,10,4,9,150);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,14,13,5,14,8,22);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,14,5,4,8,6,221);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,8,4,3,4,3,19);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,4,24,28,8,20);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,6,7,22,28,2,4);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,3,2,23,28,4,18);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,7,11,18,24,9,34);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,9,13,20,27,6,157);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,10,14,12,15,8,13);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,10,9,15,1,15);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,7,16,26,25,3,24);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,3,17,12,12,3,10);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,11,10,17,17,7,28);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,5,9,15,8,9,7);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,6,7,28,2,9,6);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,5,6,14,4,9);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,12,3,8,8,8,1);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,3,16,16,15,1,33);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,8,4,4,15,6,263);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,7,14,5,6,3,44);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,14,28,10,5,38);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,2,2,12,8,6,118);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,9,13,25,7,5,211);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,9,12,27,29,1,17);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,4,5,4,8,1,5);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (5,10,2,20,14,9,24);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,5,2,20,8,6,6);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,7,11,24,18,2,86);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,6,18,16,9,1,6);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,10,23,9,5,135);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (3,11,11,26,29,2,27);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,5,8,27,6,7,29);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,12,9,16,6,6,12);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,2,14,11,11,3,15);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (7,6,19,11,20,7,34);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,6,1,21,24,9,90);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,9,13,29,2,7,7);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,13,2,10,12,2,107);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,2,18,2,10,4,9);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,16,6,20,6,4);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (4,3,19,3,18,2,30);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,9,11,17,7,6,100);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,13,5,14,21,5,242);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (6,3,12,27,7,8,20);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (null,1,13,12,5,9,108);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,8,7,2,7,5,17);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (1,5,17,14,5,7,102);
INSERT INTO VENTE(produit_id, type_produit_id, localisation_id, equipe_id, date_id, heure_id, prix) VALUES (2,2,18,12,27,9,7);



/***************************************************/
/**************** REQUÊTES ANALYTIQUES *************/
/***************************************************/

/* Prix moyen des vente par produit (marques) */
.print 1) Prix moyen des vente par produit (marques) :
SELECT PRODUIT.produit_nom, AVG(prix) AS prix_moyen FROM VENTE, PRODUIT WHERE VENTE.produit_id = PRODUIT.produit_id GROUP BY VENTE.produit_id ORDER BY prix_moyen DESC;
.print

/* Prix moyen des ventes par type de produit */
.print 2) Prix moyen des ventes par type de produit :
SELECT VENTE.type_produit_id, TYPE_PRODUIT.type_produit_description, AVG(prix) AS prix_moyen FROM VENTE, TYPE_PRODUIT WHERE VENTE.type_produit_id = TYPE_PRODUIT.type_produit_id GROUP BY VENTE.type_produit_id ORDER BY prix_moyen DESC;
.print

/* Prix moyen des ventes par équipe */
.print 3) Prix moyen des ventes par equipe : 
SELECT EQUIPE.equipe_nom, AVG(prix) AS prix_moyen FROM VENTE, EQUIPE WHERE VENTE.equipe_id = EQUIPE.equipe_id GROUP BY VENTE.equipe_id ORDER BY prix_moyen DESC;
.print

/* Prix moyen des ventes de tickets par équipe */
.print 4) Prix moyen des ventes de tickets par équipe :
SELECT EQUIPE.equipe_nom, AVG(prix) AS prix_moyen FROM VENTE, EQUIPE, TYPE_PRODUIT WHERE VENTE.equipe_id = EQUIPE.equipe_id AND VENTE.type_produit_id = TYPE_PRODUIT.type_produit_id AND TYPE_PRODUIT.type_produit_id = 1 GROUP BY VENTE.equipe_id ORDER BY prix_moyen DESC;
.print

/* Montant total des ventes (produits+tickets) pour chaque équipes */
.print 5) Montant total des ventes (produits+tickets) pour chaque équipes :
SELECT equipe_nom, SUM(prix) AS vente_total FROM VENTE V, EQUIPE E WHERE V.equipe_id = E.equipe_id GROUP BY V.equipe_id ORDER BY vente_total DESC;
.print

/* Montant total des vente par jour durant le mois d'aout 2019 */
.print 6) Montant total des vente par jour durant le mois d aout 2019
SELECT D.jour, SUM(prix) FROM VENTE V, DATE D WHERE V.date_id = D.date_id AND D.mois = 8 AND D.annee = 2019 GROUP BY D.jour;
.print


/* Nombre total des vente de produits (tout confondus) par ville */
.print 7) Nombre total de vente de produits (tout confondus) par ville : 
SELECT LOCALISATION.ville, COUNT(*) FROM VENTE, LOCALISATION WHERE VENTE.localisation_id = LOCALISATION.localisation_id GROUP BY VENTE.localisation_id;
.print

/* Le produit ayant été acheté le plus de fois (hors tickets) */
.print 8) Le produit ayant été acheté le plus de fois (hors tickets) : 
SELECT TYPE_PRODUIT.type_produit_description, COUNT(*) AS nb_vente FROM VENTE, TYPE_PRODUIT WHERE VENTE.type_produit_id = TYPE_PRODUIT.type_produit_id AND TYPE_PRODUIT.type_produit_id <> 1 GROUP BY VENTE.type_produit_id ORDER BY nb_vente DESC;
.print

/* Nombre de ventes produits (hors tickets) par heure */
.print 9) Nombre de ventes produits (hors tickets) par heure
SELECT heure, COUNT(*) AS nb_vente FROM VENTE V, HEURE H WHERE V.heure_id = H.heure_id GROUP BY V.heure_id ORDER BY heure ASC; 
.print

/* Pourcentage de ventes par ville (par rapport aux ventes totales) */
.print 10) Pourcentage de vente par ville :
SELECT ville, (SELECT COUNT(*) FROM VENTE WHERE localisation_id = L.localisation_id)*1.0/(SELECT COUNT(*) FROM VENTE)*100 AS pourcentage_vente_ville FROM LOCALISATION L GROUP BY L.localisation_id ORDER BY pourcentage_vente_ville DESC;
.print

/***************************************************/
/**************** TAILLE ENTREPÔT *****************/
/***************************************************/

.print Taille de chaque table (en octets) :
SELECT name, SUM(pgsize) FROM dbstat GROUP BY name;
.print

.print Taille totale de la BDD (en octets) :
SELECT SUM(pgsize) FROM dbstat;
.print

/***************************************************/
/**************** SUPPRESSION BASE *****************/
/***************************************************/
/*
DROP DATABASE IF EXISTS NBA;
*/