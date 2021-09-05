/***************************************************/
/**********   DATA MART n°1 : VISIONNAGE  **********/
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
DROP TABLE IF EXISTS VISIONNAGE; 
DROP TABLE IF EXISTS PLATEFORME; 
DROP TABLE IF EXISTS DATE;
DROP TABLE IF EXISTS PROFIL_UTILISATEUR;
DROP TABLE IF EXISTS NATIONALITE;
DROP TABLE IF EXISTS UTILISATEUR;

CREATE TABLE VISIONNAGE(
  utilisateur_id INTEGER,
  plateforme_id INTEGER,
  type_plateforme_id INTEGER,
  date_id INTEGER,
  nationalite_utilisateur_id INTEGER,
  nationalite_plateforme_id INTEGER,
  temps_visionnage INTEGER,
  profil_temps_id INTEGER,
  profil_utilisateur_id INTEGER,
  CONSTRAINT PK_VISIONNAGE PRIMARY KEY (utilisateur_id, plateforme_id, type_plateforme_id, date_id, nationalite_utilisateur_id, nationalite_plateforme_id,profil_temps_id,profil_utilisateur_id),
  CONSTRAINT FK_VISIONNAGE_PLATEFORME FOREIGN KEY (plateforme_id) REFERENCES PLATEFORME(plateforme_id),
  CONSTRAINT FK_TYPE_PLATEFORME FOREIGN KEY (type_plateforme_id) REFERENCES TYPE_PLATEFORME (type_plateforme_id),
  CONSTRAINT FK_VISIONNAGE_DATE FOREIGN KEY (date_id) REFERENCES DATE(date_id),
  CONSTRAINT FK_VISIONNAGE_NATIONALITE FOREIGN KEY (nationalite_utilisateur_id) REFERENCES NATIONALITE(nationalite_id),
  CONSTRAINT FK_PLATEFORME_NATIONALITE FOREIGN KEY (nationalite_plateforme_id) REFERENCES NATIONALITE(nationalite_id),
  CONSTRAINT FK_VISIONNAGE_UTILISATEUR FOREIGN KEY (utilisateur_id) REFERENCES UTILISATEUR(utilisateur_id),
  CONSTRAINT FK_VISIONNAGE_PROFIL_UTILISATEUR FOREIGN KEY (profil_utilisateur_id) REFERENCES PROFIL_UTILISATEUR(profil_utilisateur_id),
  CONSTRAINT FK_VISIONNAGE_PROFIL_TEMPS FOREIGN KEY (profil_temps_id) REFERENCES PROFIL_TEMPS(profil_temps_id)
);

CREATE TABLE PLATEFORME(
  plateforme_id INTEGER,
  plateforme_nom VARCHAR(100) NOT NULL,
  CONSTRAINT PK_PLATEFORME PRIMARY KEY (plateforme_id)
);

CREATE TABLE TYPE_PLATEFORME(
  type_plateforme_id INTEGER,
  type_plateforme_desc VARCHAR(100),
  CONSTRAINT PK_TYPE_PLATEFORME PRIMARY KEY (type_plateforme_id)
);

CREATE TABLE DATE(
  date_id INTEGER,
  jour INTEGER,
  mois INTEGER,
  annee INTEGER,
  CONSTRAINT PK_DATE PRIMARY KEY (date_id)
);

CREATE TABLE PROFIL_UTILISATEUR(
  profil_utilisateur_id INTEGER,
  profil_utilisateur_desc VARCHAR(1000),
  CONSTRAINT PK_PROFIL_UTILISATEUR PRIMARY KEY (profil_utilisateur_id)
);

CREATE TABLE PROFIL_TEMPS(
  profil_temps_id INTEGER,
  profil_temps_desc VARCHAR(1000),
  CONSTRAINT PK_PROFIL_TEMPS PRIMARY KEY (profil_temps_id)
);

CREATE TABLE NATIONALITE(
  nationalite_id VARCHAR(20),
  nationalite_pays VARCHAR(50),
  CONSTRAINT PK_NATIONALITE PRIMARY KEY (nationalite_id)
);

CREATE TABLE UTILISATEUR(
  utilisateur_id VARCHAR(20),
  utilisateur_nom VARCHAR(100) NOT NULL,
  utilisateur_prenom VARCHAR(100) NOT NULL,
  utilisateur_age INTEGER(5) CHECK (utilisateur_age > 0 AND utilisateur_age <= 122),
  utilisateur_genre CHAR(5),
  CONSTRAINT PK_UTILISATEUR PRIMARY KEY (utilisateur_id),
  CONSTRAINT CK_UTILISATEUR_GENRE CHECK (utilisateur_genre IN('Homme', 'Femme'))
);

/***************************************************/
/********************** VUE ************************/
/***************************************************/
CREATE VIEW PROFIL_UTILISATEUR_18_25(utilisateur_id) 
AS SELECT VISIONNAGE.utilisateur_id FROM VISIONNAGE,UTILISATEUR
WHERE VISIONNAGE.utilisateur_id=UTILISATEUR.utilisateur_id AND utilisateur_age BETWEEN 18 and 25;

CREATE VIEW PROFIL_UTILISATEUR_26_35(utilisateur_id) 
AS SELECT VISIONNAGE.utilisateur_id FROM VISIONNAGE,UTILISATEUR
WHERE VISIONNAGE.utilisateur_id=UTILISATEUR.utilisateur_id AND utilisateur_age BETWEEN 26 and 35;

CREATE VIEW PROFIL_UTILISATEUR_36_50(utilisateur_id) 
AS SELECT VISIONNAGE.utilisateur_id FROM VISIONNAGE,UTILISATEUR
WHERE VISIONNAGE.utilisateur_id=UTILISATEUR.utilisateur_id AND utilisateur_age BETWEEN 36 and 50;

CREATE VIEW PROFIL_UTILISATEUR_50_plus(utilisateur_id) 
AS SELECT VISIONNAGE.utilisateur_id FROM VISIONNAGE,UTILISATEUR
WHERE VISIONNAGE.utilisateur_id=UTILISATEUR.utilisateur_id AND utilisateur_age > 50;

CREATE VIEW PROFIL_UTILISATEUR_HOMME(utilisateur_id) 
AS SELECT VISIONNAGE.utilisateur_id FROM VISIONNAGE,UTILISATEUR
WHERE VISIONNAGE.utilisateur_id=UTILISATEUR.utilisateur_id AND utilisateur_genre = 'Homme';

CREATE VIEW PROFIL_UTILISATEUR_FEMME(utilisateur_id) 
AS SELECT VISIONNAGE.utilisateur_id FROM VISIONNAGE,UTILISATEUR
WHERE VISIONNAGE.utilisateur_id=UTILISATEUR.utilisateur_id AND utilisateur_genre = 'Femme';

CREATE VIEW PROFIL_TEMPS_0_30(utilisateur_id,plateforme_id,date_id,profil_temps_id,profil_utilisateur_id,nationalite_utilisateur_id,nationalite_plateforme_id)
AS SELECT utilisateur_id,plateforme_id,date_id,profil_temps_id,profil_utilisateur_id,nationalite_utilisateur_id,nationalite_plateforme_id FROM VISIONNAGE WHERE temps_visionnage between 0 and 30;

CREATE VIEW PROFIL_TEMPS_31_60(utilisateur_id,plateforme_id,date_id,profil_temps_id,profil_utilisateur_id,nationalite_utilisateur_id,nationalite_plateforme_id)
AS SELECT utilisateur_id,plateforme_id,date_id,profil_temps_id,profil_utilisateur_id,nationalite_utilisateur_id,nationalite_plateforme_id FROM VISIONNAGE WHERE temps_visionnage between 31 and 60;

CREATE VIEW PROFIL_TEMPS_61_90(utilisateur_id,plateforme_id,date_id,profil_temps_id,profil_utilisateur_id,nationalite_utilisateur_id,nationalite_plateforme_id)
AS SELECT utilisateur_id,plateforme_id,date_id,profil_temps_id,profil_utilisateur_id,nationalite_utilisateur_id,nationalite_plateforme_id FROM VISIONNAGE
 WHERE temps_visionnage between 61 and 90;

CREATE VIEW PROFIL_TEMPS_90_plus(utilisateur_id,plateforme_id,date_id,profil_temps_id,profil_utilisateur_id,nationalite_utilisateur_id,nationalite_plateforme_id)
AS SELECT utilisateur_id,plateforme_id,date_id,profil_temps_id,profil_utilisateur_id,nationalite_utilisateur_id,nationalite_plateforme_id FROM VISIONNAGE WHERE temps_visionnage > 90;

/***************************************************/
/******************* TRIGGER ***********************/
/***************************************************/

/***************************************************/
/**************** INSERTION TUPLES *****************/
/***************************************************/

/* INSERTION PLATEFORME */
INSERT INTO PLATEFORME(plateforme_id, plateforme_nom) VALUES (1,'ABC');
INSERT INTO PLATEFORME(plateforme_id, plateforme_nom) VALUES (2,'CNN México');
INSERT INTO PLATEFORME(plateforme_id, plateforme_nom) VALUES (3,'BeinSport Fr');
INSERT INTO PLATEFORME(plateforme_id, plateforme_nom) VALUES (4,'Sportsnet One');
INSERT INTO PLATEFORME(plateforme_id, plateforme_nom) VALUES (5,'CCTV-5');
INSERT INTO PLATEFORME(plateforme_id, plateforme_nom) VALUES (6,'Fox Sports');
INSERT INTO PLATEFORME(plateforme_id, plateforme_nom) VALUES (7,'SporTV');
INSERT INTO PLATEFORME(plateforme_id, plateforme_nom) VALUES (8,'NBA League Pass');
INSERT INTO PLATEFORME(plateforme_id, plateforme_nom) VALUES (9,'RMC - Basket Time');
INSERT INTO PLATEFORME(plateforme_id, plateforme_nom) VALUES (10,'ESPN Radio Live');
INSERT INTO PLATEFORME(plateforme_id, plateforme_nom) VALUES (11,'WatchESPN');
INSERT INTO PLATEFORME(plateforme_id, plateforme_nom) VALUES (12,'ChinaNBAStream');
INSERT INTO PLATEFORME(plateforme_id, plateforme_nom) VALUES (13,'Stream2Watch');
INSERT INTO PLATEFORME(plateforme_id, plateforme_nom) VALUES (14,'NBALiveStream');

/* INSERTION TYPE PLATEFORME */
INSERT INTO TYPE_PLATEFORME(type_plateforme_id, type_plateforme_desc) VALUES (1, 'Télévision');
INSERT INTO TYPE_PLATEFORME(type_plateforme_id, type_plateforme_desc) VALUES (2, 'Streaming');
INSERT INTO TYPE_PLATEFORME(type_plateforme_id, type_plateforme_desc) VALUES (3, 'Radio');



/* INSERTION NATIONALITE */
INSERT INTO NATIONALITE(nationalite_id, nationalite_pays) VALUES (1,'ETATS-UNIS');
INSERT INTO NATIONALITE(nationalite_id, nationalite_pays) VALUES (2,'MEXIQUE');
INSERT INTO NATIONALITE(nationalite_id, nationalite_pays) VALUES (3,'FRANCE');
INSERT INTO NATIONALITE(nationalite_id, nationalite_pays) VALUES (4,'AUSTRALIE');
INSERT INTO NATIONALITE(nationalite_id, nationalite_pays) VALUES (5,'CHINE');
INSERT INTO NATIONALITE(nationalite_id, nationalite_pays) VALUES (6,'CANADA');
INSERT INTO NATIONALITE(nationalite_id, nationalite_pays) VALUES (7,'BRESIL');

/* INSERTION PROFIL UTILISATEUR */
INSERT INTO PROFIL_UTILISATEUR(profil_utilisateur_id,profil_utilisateur_desc) VALUES (1,'HOMME 18-25');
INSERT INTO PROFIL_UTILISATEUR(profil_utilisateur_id,profil_utilisateur_desc) VALUES (2,'HOMME 26-35');
INSERT INTO PROFIL_UTILISATEUR(profil_utilisateur_id,profil_utilisateur_desc) VALUES (3,'HOMME 36-50');
INSERT INTO PROFIL_UTILISATEUR(profil_utilisateur_id,profil_utilisateur_desc) VALUES (4,'HOMME 50+');
INSERT INTO PROFIL_UTILISATEUR(profil_utilisateur_id,profil_utilisateur_desc) VALUES (5,'FEMME 18-25');
INSERT INTO PROFIL_UTILISATEUR(profil_utilisateur_id,profil_utilisateur_desc) VALUES (6,'FEMME 26-35');
INSERT INTO PROFIL_UTILISATEUR(profil_utilisateur_id,profil_utilisateur_desc) VALUES (7,'FEMME 36-50');
INSERT INTO PROFIL_UTILISATEUR(profil_utilisateur_id,profil_utilisateur_desc) VALUES (8,'FEMME 50+');

/*INSERTION PROFIL TEMPS */
INSERT INTO PROFIL_TEMPS(profil_temps_id,profil_temps_desc) VALUES (1,'0-30min');
INSERT INTO PROFIL_TEMPS(profil_temps_id,profil_temps_desc) VALUES (2,'31-60min');
INSERT INTO PROFIL_TEMPS(profil_temps_id,profil_temps_desc) VALUES (3,'61-90min');
INSERT INTO PROFIL_TEMPS(profil_temps_id,profil_temps_desc) VALUES (4,'90+min');

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

INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (1,'Durant','Jean-Eudes',18,'Femme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (2,'Lillard','Joe',22,'Femme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (3,'Jenner','David',36,'Homme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (4,'Lillard','Daniel',43,'Femme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (5,'Jordan','Kevin',23,'Homme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (6,'Hunter','Catherine',81,'Homme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (7,'Morris','Gabriel',43,'Homme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (8,'Irving','Lucien',33,'Femme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (9,'Jenner','Antoine',24,'Femme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (10,'Jenner','Lucien',19,'Femme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (11,'Irving','Solal',20,'Homme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (12,'Lillard','Jack',26,'Femme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (13,'Lebron','Mathieu',18,'Homme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (14,'Trump','Gabriel',24,'Homme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (15,'Obama','Kevin',28,'Homme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (16,'Morris','Tiavi',20,'Homme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (17,'Hunter','Léa',18,'Femme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (18,'Lillard','Mathieu',24,'Femme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (19,'Obama','Lucien',20,'Homme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (20,'Trump','Gabriel',30,'Femme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (21,'Obama','Solal',101,'Femme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (22,'Lebron','Jack',20,'Homme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (23,'Obama','Lucien',38,'Femme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (24,'Hunter','Jack',19,'Homme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (25,'West','Jack',66,'Homme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (26,'Irving','John',33,'Femme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (27,'Jenner','Tiavi',19,'Femme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (28,'Obama','Tiavi',33,'Homme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (29,'Obama','Catherine',19,'Homme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (30,'West','Léa',43,'Homme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (31,'Westbrook','Mathieu',61,'Homme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (32,'Morris','Tiavi',41,'Femme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (33,'West','Jacques',71,'Femme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (34,'Durant','Catherine',42,'Femme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (35,'Lebron','Manon',44,'Femme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (36,'Trump','Manon',21,'Femme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (37,'Irving','Manon',30,'Homme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (38,'Lebron','Mathieu',40,'Homme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (39,'Irving','Bernard',20,'Femme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (40,'Jordan','Tiavi',27,'Homme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (41,'West','John',30,'Homme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (42,'Lillard','Jack',74,'Homme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (43,'Jenner','Manon',30,'Femme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (44,'Biden','Solal',32,'Femme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (45,'Jenner','Jason',33,'Homme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (46,'Irving','Donald',31,'Femme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (47,'Lillard','Tiavi',22,'Homme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (48,'Lillard','Manon',21,'Femme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (49,'Lebron','Michel',21,'Homme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (50,'Obama','Antoine',30,'Femme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (51,'Bryant','Jason',30,'Homme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (52,'Biden','Manon',32,'Femme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (53,'Lillard','Jason',42,'Homme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (54,'Biden','Manon',42,'Homme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (55,'Trump','Lucien',26,'Femme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (56,'Jenner','Jason',44,'Femme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (57,'Bryant','Solal',34,'Homme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (58,'Irving','Léa',23,'Homme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (59,'Obama','Jack',31,'Femme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (60,'Morris','Jacques',20,'Femme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (61,'Jordan','Donald',18,'Femme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (62,'West','Antoine',30,'Homme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (63,'Hunter','David',30,'Femme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (64,'Bryant','Solal',113,'Femme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (65,'Trump','Léa',32,'Femme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (66,'Jordan','Bernard',41,'Femme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (67,'Biden','Michel',44,'Femme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (68,'Irving','Mathieu',40,'Femme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (69,'Hunter','Michel',27,'Femme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (70,'Jordan','Kevin',20,'Femme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (71,'Lillard','Tiavi',43,'Femme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (72,'Trump','Jason',31,'Homme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (73,'Hunter','Solal',20,'Femme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (74,'Jenner','John',28,'Femme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (75,'Morris','Daniel',26,'Homme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (76,'Biden','Jacques',44,'Femme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (77,'Irving','Jack',34,'Femme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (78,'Biden','Jacques',33,'Femme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (79,'West','Michel',19,'Femme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (80,'West','Solal',91,'Homme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (81,'Durant','Donald',74,'Homme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (82,'Jenner','Donald',22,'Femme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (83,'Westbrook','Jack',20,'Homme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (84,'Biden','Joe',34,'Homme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (85,'Durant','Solal',22,'Homme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (86,'Lillard','Gabriel',32,'Femme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (87,'Jordan','John',22,'Homme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (88,'Lillard','Solal',19,'Homme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (89,'Lebron','Jean-Eudes',20,'Homme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (90,'Irving','Michel',28,'Homme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (91,'Jenner','Tiavi',28,'Femme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (92,'Irving','Antoine',37,'Femme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (93,'Trump','Jean-Eudes',118,'Homme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (94,'Biden','Jason',41,'Homme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (95,'Morris','Joe',28,'Homme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (96,'Hunter','Michel',27,'Homme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (97,'Bryant','Bernard',32,'Femme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (98,'Trump','Jason',28,'Homme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (99,'Irving','Bernard',18,'Homme');
INSERT INTO UTILISATEUR(utilisateur_id,utilisateur_nom,utilisateur_prenom,utilisateur_age,utilisateur_genre) VALUES (100,'Trump','Daniel',31,'Homme');
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (1,12,2,1,6,1,27);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (1,12,2,3,6,1,111);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (1,12,2,4,6,1,89);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (1,12,2,6,6,1,40);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (1,12,2,7,6,1,107);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (1,12,2,8,6,1,65);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (1,12,2,10,6,1,118);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (1,12,2,11,6,1,23);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (1,12,2,12,6,1,103);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (1,12,2,13,6,1,28);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (1,12,2,14,6,1,43);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (1,12,2,16,6,1,107);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (1,12,2,17,6,1,28);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (1,12,2,19,6,1,32);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (1,12,2,24,6,1,57);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (1,12,2,25,6,1,55);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (1,12,2,29,6,1,82);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (2,9,1,2,6,10,13);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (2,9,1,3,6,10,47);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (2,9,1,4,6,10,112);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (2,9,1,5,6,10,65);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (2,9,1,6,6,10,106);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (2,9,1,8,6,10,52);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (2,9,1,9,6,10,54);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (2,9,1,11,6,10,78);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (2,9,1,13,6,10,43);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (2,9,1,15,6,10,0);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (2,9,1,16,6,10,12);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (2,9,1,18,6,10,34);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (2,9,1,20,6,10,47);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (2,9,1,21,6,10,96);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (2,9,1,24,6,10,50);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (2,9,1,28,6,10,41);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (3,11,2,1,2,5,57);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (3,11,2,3,2,5,73);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (3,11,2,4,2,5,113);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (3,11,2,7,2,5,80);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (3,11,2,9,2,5,26);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (3,11,2,11,2,5,99);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (3,11,2,13,2,5,117);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (3,11,2,15,2,5,19);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (3,11,2,17,2,5,38);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (3,11,2,18,2,5,107);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (3,11,2,20,2,5,65);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (3,11,2,22,2,5,43);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (3,11,2,23,2,5,38);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (3,11,2,24,2,5,65);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (3,11,2,25,2,5,91);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (3,11,2,27,2,5,44);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (3,11,2,30,2,5,96);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (4,8,2,1,4,5,3);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (4,8,2,3,4,5,59);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (4,8,2,4,4,5,45);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (4,8,2,13,4,5,71);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (4,8,2,14,4,5,95);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (4,8,2,17,4,5,70);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (4,8,2,19,4,5,107);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (4,8,2,21,4,5,46);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (4,8,2,25,4,5,31);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (4,8,2,26,4,5,1);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (4,8,2,29,4,5,41);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (5,8,2,1,4,11,31);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (5,8,2,2,4,11,18);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (5,8,2,3,4,11,104);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (5,8,2,4,4,11,84);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (5,8,2,10,4,11,117);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (5,8,2,16,4,11,72);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (5,8,2,21,4,11,75);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (5,8,2,22,4,11,71);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (5,8,2,23,4,11,19);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (5,8,2,25,4,11,14);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (5,8,2,27,4,11,89);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (5,8,2,29,4,11,103);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (6,6,2,1,4,9,96);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (6,6,2,4,4,9,5);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (6,6,2,5,4,9,89);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (6,6,2,8,4,9,56);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (6,6,2,10,4,9,1);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (6,6,2,11,4,9,93);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (6,6,2,12,4,9,59);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (6,6,2,13,4,9,14);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (6,6,2,14,4,9,58);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (6,6,2,16,4,9,115);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (6,6,2,17,4,9,90);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (6,6,2,19,4,9,18);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (6,6,2,22,4,9,74);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (6,6,2,24,4,9,64);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (6,6,2,25,4,9,62);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (6,6,2,28,4,9,112);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (7,12,2,4,3,1,65);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (7,12,2,7,3,1,55);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (7,12,2,14,3,1,64);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (7,12,2,17,3,1,91);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (7,12,2,20,3,1,96);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (7,12,2,24,3,1,115);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (7,12,2,29,3,1,38);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (7,12,2,30,3,1,19);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (8,3,1,1,2,10,8);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (8,3,1,5,2,10,3);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (8,3,1,6,2,10,68);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (8,3,1,7,2,10,10);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (8,3,1,10,2,10,31);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (8,3,1,12,2,10,82);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (8,3,1,13,2,10,20);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (8,3,1,14,2,10,89);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (8,3,1,16,2,10,27);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (8,3,1,17,2,10,95);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (8,3,1,19,2,10,102);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (8,3,1,20,2,10,41);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (8,3,1,22,2,10,40);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (8,3,1,24,2,10,93);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (8,3,1,26,2,10,10);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (9,12,1,5,3,5,107);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (9,12,1,8,3,5,23);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (9,12,1,10,3,5,66);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (9,12,1,12,3,5,27);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (9,12,1,13,3,5,117);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (9,12,1,14,3,5,52);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (9,12,1,15,3,5,80);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (9,12,1,17,3,5,118);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (9,12,1,18,3,5,59);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (9,12,1,20,3,5,19);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (9,12,1,22,3,5,29);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (9,12,1,23,3,5,36);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (9,12,1,24,3,5,117);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (9,12,1,25,3,5,21);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (9,12,1,26,3,5,102);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (9,12,1,27,3,5,107);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (9,12,1,28,3,5,97);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (10,12,2,4,1,13,59);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (10,12,2,5,1,13,36);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (10,12,2,7,1,13,59);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (10,12,2,8,1,13,76);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (10,12,2,11,1,13,77);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (10,12,2,12,1,13,16);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (10,12,2,15,1,13,101);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (10,12,2,19,1,13,111);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (10,12,2,20,1,13,117);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (10,12,2,21,1,13,110);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (10,12,2,22,1,13,57);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (10,12,2,23,1,13,65);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (10,12,2,28,1,13,4);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (10,12,2,30,1,13,109);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (11,13,2,1,1,1,60);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (11,13,2,3,1,1,52);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (11,13,2,4,1,1,7);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (11,13,2,9,1,1,29);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (11,13,2,10,1,1,113);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (11,13,2,11,1,1,15);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (11,13,2,13,1,1,118);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (11,13,2,15,1,1,100);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (11,13,2,18,1,1,109);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (11,13,2,19,1,1,36);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (11,13,2,20,1,1,102);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (11,13,2,24,1,1,118);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (11,13,2,25,1,1,35);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (11,13,2,26,1,1,70);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (11,13,2,27,1,1,92);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (11,13,2,28,1,1,51);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (11,13,2,29,1,1,58);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (11,13,2,30,1,1,65);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (12,6,2,1,2,12,14);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (12,6,2,3,2,12,59);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (12,6,2,4,2,12,58);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (12,6,2,5,2,12,104);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (12,6,2,6,2,12,53);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (12,6,2,13,2,12,46);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (12,6,2,16,2,12,36);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (12,6,2,17,2,12,30);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (12,6,2,20,2,12,6);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (12,6,2,23,2,12,27);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (12,6,2,25,2,12,105);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (12,6,2,26,2,12,78);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (12,6,2,29,2,12,95);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (12,6,2,30,2,12,99);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (13,2,3,3,3,9,77);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (13,2,3,4,3,9,111);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (13,2,3,8,3,9,19);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (13,2,3,9,3,9,38);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (13,2,3,11,3,9,84);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (13,2,3,14,3,9,27);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (13,2,3,20,3,9,60);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (13,2,3,23,3,9,96);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (13,2,3,26,3,9,107);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (13,2,3,27,3,9,86);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (13,2,3,29,3,9,31);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (13,2,3,30,3,9,66);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (14,13,1,9,5,7,68);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (14,13,1,10,5,7,3);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (14,13,1,12,5,7,60);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (14,13,1,13,5,7,96);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (14,13,1,14,5,7,3);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (14,13,1,15,5,7,11);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (14,13,1,18,5,7,115);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (14,13,1,19,5,7,104);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (14,13,1,20,5,7,80);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (14,13,1,21,5,7,46);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (14,13,1,23,5,7,39);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (14,13,1,24,5,7,21);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (14,13,1,26,5,7,20);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (14,13,1,28,5,7,33);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (14,13,1,30,5,7,78);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (15,1,1,3,5,8,41);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (15,1,1,11,5,8,61);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (15,1,1,12,5,8,26);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (15,1,1,14,5,8,78);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (15,1,1,17,5,8,43);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (15,1,1,20,5,8,101);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (15,1,1,22,5,8,21);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (15,1,1,24,5,8,94);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (15,1,1,26,5,8,95);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (15,1,1,27,5,8,13);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (15,1,1,28,5,8,90);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (15,1,1,29,5,8,79);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (15,1,1,30,5,8,71);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (16,1,2,2,3,12,1);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (16,1,2,3,3,12,111);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (16,1,2,4,3,12,2);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (16,1,2,5,3,12,92);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (16,1,2,10,3,12,100);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (16,1,2,11,3,12,5);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (16,1,2,12,3,12,109);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (16,1,2,14,3,12,59);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (16,1,2,17,3,12,18);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (16,1,2,19,3,12,38);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (16,1,2,21,3,12,15);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (16,1,2,22,3,12,35);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (16,1,2,23,3,12,101);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (16,1,2,24,3,12,27);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (16,1,2,26,3,12,93);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (16,1,2,27,3,12,66);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (16,1,2,28,3,12,101);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (16,1,2,29,3,12,39);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (16,1,2,30,3,12,13);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (17,11,1,1,5,3,5);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (17,11,1,2,5,3,89);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (17,11,1,6,5,3,56);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (17,11,1,8,5,3,114);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (17,11,1,9,5,3,69);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (17,11,1,13,5,3,82);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (17,11,1,14,5,3,52);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (17,11,1,16,5,3,85);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (17,11,1,17,5,3,28);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (17,11,1,20,5,3,37);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (17,11,1,25,5,3,38);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (17,11,1,26,5,3,57);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (17,11,1,27,5,3,5);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (17,11,1,28,5,3,85);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (17,11,1,29,5,3,66);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (18,2,2,1,6,3,3);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (18,2,2,3,6,3,14);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (18,2,2,11,6,3,78);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (18,2,2,15,6,3,64);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (18,2,2,16,6,3,86);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (18,2,2,17,6,3,12);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (18,2,2,20,6,3,47);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (18,2,2,21,6,3,89);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (18,2,2,22,6,3,23);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (18,2,2,25,6,3,51);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (18,2,2,28,6,3,42);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (19,5,1,1,6,9,35);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (19,5,1,3,6,9,42);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (19,5,1,4,6,9,77);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (19,5,1,5,6,9,53);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (19,5,1,6,6,9,38);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (19,5,1,7,6,9,44);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (19,5,1,8,6,9,108);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (19,5,1,11,6,9,113);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (19,5,1,14,6,9,52);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (19,5,1,16,6,9,53);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (19,5,1,18,6,9,100);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (19,5,1,19,6,9,41);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (19,5,1,21,6,9,56);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (19,5,1,22,6,9,64);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (19,5,1,23,6,9,32);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (19,5,1,24,6,9,89);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (19,5,1,27,6,9,83);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (19,5,1,28,6,9,36);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (19,5,1,30,6,9,35);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (20,5,1,1,2,2,78);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (20,5,1,3,2,2,45);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (20,5,1,7,2,2,26);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (20,5,1,9,2,2,67);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (20,5,1,10,2,2,68);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (20,5,1,11,2,2,84);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (20,5,1,12,2,2,95);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (20,5,1,16,2,2,40);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (20,5,1,17,2,2,8);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (20,5,1,19,2,2,48);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (20,5,1,21,2,2,3);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (20,5,1,23,2,2,91);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (20,5,1,25,2,2,83);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (21,1,1,1,6,9,53);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (21,1,1,3,6,9,77);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (21,1,1,4,6,9,87);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (21,1,1,5,6,9,67);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (21,1,1,6,6,9,102);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (21,1,1,7,6,9,110);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (21,1,1,9,6,9,117);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (21,1,1,16,6,9,98);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (21,1,1,17,6,9,30);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (21,1,1,18,6,9,36);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (21,1,1,19,6,9,102);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (21,1,1,21,6,9,58);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (21,1,1,22,6,9,93);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (21,1,1,23,6,9,110);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (21,1,1,25,6,9,97);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (21,1,1,26,6,9,76);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (21,1,1,28,6,9,1);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (21,1,1,29,6,9,106);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (21,1,1,30,6,9,90);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (22,1,1,1,6,9,8);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (22,1,1,3,6,9,78);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (22,1,1,7,6,9,113);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (22,1,1,8,6,9,79);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (22,1,1,9,6,9,88);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (22,1,1,10,6,9,22);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (22,1,1,12,6,9,91);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (22,1,1,14,6,9,115);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (22,1,1,16,6,9,58);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (22,1,1,17,6,9,39);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (22,1,1,18,6,9,25);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (22,1,1,20,6,9,25);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (22,1,1,21,6,9,75);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (22,1,1,24,6,9,51);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (22,1,1,25,6,9,96);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (22,1,1,27,6,9,17);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (22,1,1,30,6,9,26);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (23,4,3,2,6,5,33);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (23,4,3,5,6,5,8);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (23,4,3,8,6,5,110);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (23,4,3,9,6,5,13);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (23,4,3,10,6,5,48);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (23,4,3,13,6,5,98);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (23,4,3,15,6,5,27);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (23,4,3,17,6,5,83);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (23,4,3,18,6,5,69);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (23,4,3,20,6,5,57);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (23,4,3,21,6,5,9);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (23,4,3,23,6,5,35);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (23,4,3,24,6,5,17);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (23,4,3,25,6,5,11);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (23,4,3,26,6,5,90);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (24,3,2,2,3,5,68);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (24,3,2,5,3,5,113);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (24,3,2,6,3,5,22);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (24,3,2,13,3,5,79);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (24,3,2,14,3,5,38);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (24,3,2,15,3,5,28);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (24,3,2,17,3,5,86);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (24,3,2,19,3,5,74);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (24,3,2,22,3,5,23);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (24,3,2,24,3,5,25);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (24,3,2,26,3,5,97);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (24,3,2,28,3,5,76);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (24,3,2,30,3,5,94);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (25,13,3,1,5,9,8);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (25,13,3,2,5,9,99);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (25,13,3,3,5,9,69);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (25,13,3,6,5,9,33);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (25,13,3,8,5,9,30);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (25,13,3,11,5,9,66);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (25,13,3,12,5,9,76);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (25,13,3,15,5,9,111);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (25,13,3,16,5,9,102);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (25,13,3,19,5,9,68);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (25,13,3,21,5,9,110);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (25,13,3,23,5,9,71);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (25,13,3,24,5,9,104);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (25,13,3,26,5,9,32);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (25,13,3,28,5,9,51);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (26,8,3,2,5,5,36);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (26,8,3,4,5,5,75);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (26,8,3,5,5,5,33);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (26,8,3,8,5,5,47);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (26,8,3,9,5,5,21);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (26,8,3,12,5,5,113);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (26,8,3,13,5,5,2);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (26,8,3,14,5,5,84);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (26,8,3,17,5,5,31);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (26,8,3,18,5,5,56);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (26,8,3,19,5,5,30);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (26,8,3,23,5,5,40);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (26,8,3,25,5,5,101);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (26,8,3,28,5,5,62);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (26,8,3,29,5,5,4);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (27,3,1,1,4,4,100);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (27,3,1,2,4,4,113);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (27,3,1,4,4,4,59);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (27,3,1,5,4,4,8);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (27,3,1,6,4,4,14);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (27,3,1,8,4,4,53);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (27,3,1,10,4,4,7);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (27,3,1,11,4,4,90);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (27,3,1,15,4,4,73);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (27,3,1,17,4,4,87);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (27,3,1,18,4,4,108);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (27,3,1,22,4,4,69);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (27,3,1,24,4,4,52);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (27,3,1,27,4,4,99);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (27,3,1,29,4,4,0);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (27,3,1,30,4,4,41);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (28,8,1,2,1,11,62);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (28,8,1,3,1,11,75);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (28,8,1,5,1,11,2);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (28,8,1,6,1,11,58);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (28,8,1,11,1,11,15);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (28,8,1,22,1,11,7);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (28,8,1,24,1,11,96);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (28,8,1,25,1,11,30);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (28,8,1,29,1,11,75);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (29,9,2,2,2,3,21);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (29,9,2,4,2,3,5);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (29,9,2,6,2,3,65);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (29,9,2,8,2,3,100);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (29,9,2,9,2,3,80);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (29,9,2,10,2,3,29);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (29,9,2,12,2,3,9);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (29,9,2,13,2,3,85);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (29,9,2,14,2,3,62);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (29,9,2,16,2,3,91);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (29,9,2,17,2,3,107);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (29,9,2,18,2,3,13);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (29,9,2,19,2,3,62);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (29,9,2,20,2,3,52);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (29,9,2,21,2,3,111);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (29,9,2,22,2,3,95);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (29,9,2,23,2,3,79);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (29,9,2,30,2,3,29);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (30,2,3,1,5,13,26);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (30,2,3,3,5,13,115);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (30,2,3,5,5,13,70);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (30,2,3,6,5,13,79);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (30,2,3,7,5,13,100);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (30,2,3,9,5,13,69);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (30,2,3,14,5,13,84);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (30,2,3,15,5,13,39);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (30,2,3,17,5,13,63);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (30,2,3,21,5,13,43);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (30,2,3,22,5,13,61);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (30,2,3,24,5,13,52);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (30,2,3,26,5,13,101);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (30,2,3,28,5,13,4);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (30,2,3,29,5,13,9);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (30,2,3,30,5,13,93);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (31,12,1,5,5,5,65);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (31,12,1,9,5,5,24);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (31,12,1,16,5,5,56);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (31,12,1,19,5,5,43);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (31,12,1,24,5,5,12);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (31,12,1,26,5,5,115);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (31,12,1,27,5,5,2);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (31,12,1,28,5,5,44);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (32,7,2,1,3,5,25);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (32,7,2,3,3,5,36);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (32,7,2,6,3,5,83);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (32,7,2,8,3,5,61);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (32,7,2,10,3,5,48);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (32,7,2,12,3,5,16);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (32,7,2,14,3,5,37);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (32,7,2,15,3,5,47);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (32,7,2,16,3,5,80);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (32,7,2,17,3,5,39);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (32,7,2,20,3,5,63);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (32,7,2,21,3,5,21);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (32,7,2,24,3,5,106);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (32,7,2,25,3,5,43);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (32,7,2,27,3,5,87);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (33,2,1,2,4,5,116);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (33,2,1,4,4,5,16);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (33,2,1,7,4,5,53);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (33,2,1,8,4,5,93);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (33,2,1,9,4,5,81);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (33,2,1,11,4,5,106);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (33,2,1,12,4,5,113);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (33,2,1,13,4,5,86);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (33,2,1,16,4,5,93);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (33,2,1,17,4,5,58);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (33,2,1,18,4,5,104);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (33,2,1,19,4,5,77);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (33,2,1,21,4,5,20);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (33,2,1,25,4,5,18);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (33,2,1,26,4,5,40);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (33,2,1,29,4,5,40);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (33,2,1,30,4,5,73);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (34,3,2,4,3,2,23);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (34,3,2,6,3,2,90);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (34,3,2,12,3,2,82);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (34,3,2,14,3,2,91);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (34,3,2,16,3,2,107);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (34,3,2,18,3,2,43);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (34,3,2,19,3,2,98);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (34,3,2,20,3,2,2);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (34,3,2,22,3,2,98);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (34,3,2,23,3,2,116);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (34,3,2,24,3,2,98);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (34,3,2,25,3,2,58);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (34,3,2,26,3,2,54);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (34,3,2,28,3,2,105);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (34,3,2,30,3,2,83);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (35,4,1,3,3,2,87);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (35,4,1,5,3,2,52);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (35,4,1,7,3,2,112);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (35,4,1,8,3,2,104);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (35,4,1,10,3,2,46);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (35,4,1,13,3,2,80);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (35,4,1,16,3,2,6);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (35,4,1,17,3,2,87);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (35,4,1,18,3,2,76);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (35,4,1,20,3,2,18);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (35,4,1,22,3,2,21);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (35,4,1,24,3,2,1);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (35,4,1,27,3,2,22);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (35,4,1,28,3,2,29);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (36,12,2,2,4,1,114);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (36,12,2,3,4,1,60);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (36,12,2,4,4,1,30);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (36,12,2,7,4,1,110);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (36,12,2,8,4,1,26);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (36,12,2,10,4,1,57);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (36,12,2,13,4,1,108);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (36,12,2,14,4,1,57);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (36,12,2,15,4,1,70);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (36,12,2,16,4,1,38);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (36,12,2,17,4,1,35);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (36,12,2,18,4,1,37);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (36,12,2,19,4,1,21);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (36,12,2,21,4,1,1);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (36,12,2,23,4,1,29);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (36,12,2,25,4,1,81);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (36,12,2,27,4,1,34);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (36,12,2,29,4,1,10);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (36,12,2,30,4,1,100);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (37,7,1,1,4,1,25);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (37,7,1,3,4,1,99);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (37,7,1,6,4,1,107);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (37,7,1,7,4,1,11);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (37,7,1,8,4,1,109);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (37,7,1,10,4,1,51);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (37,7,1,12,4,1,60);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (37,7,1,13,4,1,79);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (37,7,1,17,4,1,37);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (37,7,1,18,4,1,104);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (37,7,1,20,4,1,56);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (37,7,1,22,4,1,61);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (37,7,1,23,4,1,107);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (37,7,1,24,4,1,119);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (37,7,1,28,4,1,0);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (37,7,1,29,4,1,21);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (37,7,1,30,4,1,100);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (38,5,1,2,5,8,31);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (38,5,1,4,5,8,49);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (38,5,1,6,5,8,88);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (38,5,1,7,5,8,59);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (38,5,1,8,5,8,101);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (38,5,1,10,5,8,109);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (38,5,1,11,5,8,16);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (38,5,1,14,5,8,35);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (38,5,1,15,5,8,73);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (38,5,1,16,5,8,118);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (38,5,1,19,5,8,66);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (38,5,1,20,5,8,81);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (38,5,1,23,5,8,69);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (38,5,1,27,5,8,68);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (39,5,2,1,5,12,110);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (39,5,2,2,5,12,77);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (39,5,2,3,5,12,99);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (39,5,2,4,5,12,77);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (39,5,2,10,5,12,86);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (39,5,2,11,5,12,93);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (39,5,2,12,5,12,71);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (39,5,2,14,5,12,11);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (39,5,2,15,5,12,73);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (39,5,2,16,5,12,3);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (39,5,2,18,5,12,56);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (39,5,2,20,5,12,7);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (39,5,2,21,5,12,85);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (39,5,2,22,5,12,40);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (39,5,2,23,5,12,116);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (39,5,2,24,5,12,91);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (39,5,2,25,5,12,107);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (39,5,2,27,5,12,102);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (39,5,2,29,5,12,33);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (39,5,2,30,5,12,44);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (40,1,1,1,3,6,47);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (40,1,1,3,3,6,56);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (40,1,1,4,3,6,116);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (40,1,1,5,3,6,103);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (40,1,1,6,3,6,33);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (40,1,1,7,3,6,44);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (40,1,1,8,3,6,7);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (40,1,1,9,3,6,1);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (40,1,1,10,3,6,38);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (40,1,1,11,3,6,119);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (40,1,1,12,3,6,63);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (40,1,1,13,3,6,108);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (40,1,1,14,3,6,27);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (40,1,1,17,3,6,115);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (40,1,1,18,3,6,93);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (40,1,1,19,3,6,43);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (40,1,1,20,3,6,66);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (40,1,1,21,3,6,118);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (40,1,1,23,3,6,95);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (40,1,1,25,3,6,58);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (40,1,1,27,3,6,110);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (40,1,1,30,3,6,50);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (41,12,1,1,6,6,100);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (41,12,1,3,6,6,65);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (41,12,1,5,6,6,89);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (41,12,1,6,6,6,115);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (41,12,1,8,6,6,60);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (41,12,1,9,6,6,37);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (41,12,1,10,6,6,22);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (41,12,1,14,6,6,116);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (41,12,1,15,6,6,36);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (41,12,1,17,6,6,47);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (41,12,1,18,6,6,27);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (41,12,1,20,6,6,62);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (41,12,1,21,6,6,3);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (41,12,1,28,6,6,66);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (41,12,1,30,6,6,58);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (42,11,2,3,2,4,29);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (42,11,2,9,2,4,78);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (42,11,2,10,2,4,54);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (42,11,2,11,2,4,81);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (42,11,2,12,2,4,14);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (42,11,2,14,2,4,10);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (42,11,2,15,2,4,112);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (42,11,2,17,2,4,112);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (42,11,2,18,2,4,104);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (42,11,2,22,2,4,93);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (42,11,2,25,2,4,8);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (42,11,2,27,2,4,98);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (42,11,2,28,2,4,98);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (42,11,2,29,2,4,105);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (42,11,2,30,2,4,21);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (43,11,1,1,6,7,6);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (43,11,1,4,6,7,45);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (43,11,1,10,6,7,66);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (43,11,1,11,6,7,96);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (43,11,1,12,6,7,108);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (43,11,1,17,6,7,21);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (43,11,1,19,6,7,53);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (43,11,1,20,6,7,48);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (43,11,1,22,6,7,49);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (43,11,1,24,6,7,89);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (43,11,1,25,6,7,20);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (43,11,1,28,6,7,54);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (43,11,1,29,6,7,49);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (44,12,2,1,2,11,38);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (44,12,2,2,2,11,4);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (44,12,2,3,2,11,78);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (44,12,2,4,2,11,26);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (44,12,2,6,2,11,55);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (44,12,2,8,2,11,28);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (44,12,2,18,2,11,1);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (44,12,2,19,2,11,100);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (44,12,2,20,2,11,29);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (44,12,2,22,2,11,107);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (44,12,2,23,2,11,44);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (44,12,2,24,2,11,116);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (44,12,2,26,2,11,97);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (44,12,2,27,2,11,49);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (44,12,2,28,2,11,16);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (44,12,2,29,2,11,113);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (44,12,2,30,2,11,95);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (45,7,2,4,3,6,45);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (45,7,2,7,3,6,5);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (45,7,2,8,3,6,107);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (45,7,2,9,3,6,59);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (45,7,2,14,3,6,112);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (45,7,2,15,3,6,6);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (45,7,2,17,3,6,107);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (45,7,2,18,3,6,70);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (45,7,2,19,3,6,4);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (45,7,2,21,3,6,101);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (45,7,2,24,3,6,1);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (45,7,2,26,3,6,15);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (45,7,2,28,3,6,52);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (45,7,2,30,3,6,27);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (46,6,2,4,3,4,5);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (46,6,2,5,3,4,55);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (46,6,2,7,3,4,111);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (46,6,2,9,3,4,116);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (46,6,2,10,3,4,55);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (46,6,2,13,3,4,71);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (46,6,2,14,3,4,100);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (46,6,2,15,3,4,39);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (46,6,2,16,3,4,11);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (46,6,2,18,3,4,59);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (46,6,2,19,3,4,110);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (46,6,2,20,3,4,56);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (46,6,2,21,3,4,80);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (46,6,2,22,3,4,70);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (46,6,2,24,3,4,33);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (46,6,2,25,3,4,105);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (46,6,2,27,3,4,112);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (47,10,3,1,3,1,39);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (47,10,3,3,3,1,101);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (47,10,3,4,3,1,61);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (47,10,3,13,3,1,117);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (47,10,3,16,3,1,68);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (47,10,3,19,3,1,91);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (47,10,3,20,3,1,105);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (47,10,3,22,3,1,103);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (47,10,3,27,3,1,27);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (47,10,3,28,3,1,30);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (48,5,2,1,1,7,100);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (48,5,2,7,1,7,3);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (48,5,2,9,1,7,62);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (48,5,2,11,1,7,45);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (48,5,2,15,1,7,5);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (48,5,2,16,1,7,7);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (48,5,2,19,1,7,107);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (48,5,2,22,1,7,27);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (48,5,2,24,1,7,28);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (48,5,2,25,1,7,104);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (48,5,2,27,1,7,102);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (48,5,2,29,1,7,38);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (49,10,1,1,6,2,29);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (49,10,1,2,6,2,99);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (49,10,1,4,6,2,63);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (49,10,1,10,6,2,112);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (49,10,1,14,6,2,37);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (49,10,1,16,6,2,117);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (49,10,1,18,6,2,115);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (49,10,1,22,6,2,17);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (49,10,1,23,6,2,106);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (49,10,1,24,6,2,78);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (49,10,1,27,6,2,36);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (49,10,1,28,6,2,70);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (49,10,1,29,6,2,35);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (49,10,1,30,6,2,63);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (50,1,1,1,1,6,63);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (50,1,1,2,1,6,80);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (50,1,1,3,1,6,55);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (50,1,1,5,1,6,70);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (50,1,1,6,1,6,40);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (50,1,1,9,1,6,88);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (50,1,1,11,1,6,6);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (50,1,1,13,1,6,67);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (50,1,1,14,1,6,97);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (50,1,1,16,1,6,65);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (50,1,1,17,1,6,90);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (50,1,1,19,1,6,50);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (50,1,1,20,1,6,90);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (50,1,1,21,1,6,2);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (50,1,1,24,1,6,31);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (50,1,1,29,1,6,45);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (51,1,2,1,6,2,34);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (51,1,2,2,6,2,81);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (51,1,2,3,6,2,50);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (51,1,2,4,6,2,54);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (51,1,2,5,6,2,3);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (51,1,2,8,6,2,104);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (51,1,2,9,6,2,98);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (51,1,2,11,6,2,102);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (51,1,2,17,6,2,105);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (51,1,2,22,6,2,1);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (51,1,2,24,6,2,62);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (51,1,2,28,6,2,5);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (51,1,2,30,6,2,20);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (52,8,2,2,4,11,40);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (52,8,2,5,4,11,37);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (52,8,2,6,4,11,39);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (52,8,2,9,4,11,71);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (52,8,2,10,4,11,85);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (52,8,2,11,4,11,87);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (52,8,2,13,4,11,16);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (52,8,2,21,4,11,68);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (52,8,2,24,4,11,111);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (52,8,2,26,4,11,111);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (52,8,2,27,4,11,73);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (52,8,2,29,4,11,41);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (52,8,2,30,4,11,27);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (53,5,2,1,5,2,58);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (53,5,2,4,5,2,97);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (53,5,2,7,5,2,102);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (53,5,2,8,5,2,42);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (53,5,2,11,5,2,117);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (53,5,2,13,5,2,110);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (53,5,2,14,5,2,1);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (53,5,2,17,5,2,118);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (53,5,2,18,5,2,24);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (53,5,2,19,5,2,80);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (53,5,2,20,5,2,92);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (53,5,2,23,5,2,94);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (53,5,2,25,5,2,99);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (53,5,2,26,5,2,63);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (53,5,2,28,5,2,119);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (53,5,2,29,5,2,10);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (53,5,2,30,5,2,92);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (54,11,1,3,2,2,27);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (54,11,1,4,2,2,88);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (54,11,1,6,2,2,100);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (54,11,1,8,2,2,71);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (54,11,1,12,2,2,38);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (54,11,1,13,2,2,83);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (54,11,1,16,2,2,61);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (54,11,1,17,2,2,65);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (54,11,1,18,2,2,111);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (54,11,1,21,2,2,97);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (54,11,1,22,2,2,95);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (54,11,1,25,2,2,112);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (54,11,1,28,2,2,31);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (54,11,1,29,2,2,14);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (54,11,1,30,2,2,4);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (55,10,1,1,2,2,107);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (55,10,1,6,2,2,24);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (55,10,1,9,2,2,43);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (55,10,1,11,2,2,8);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (55,10,1,12,2,2,53);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (55,10,1,15,2,2,34);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (55,10,1,17,2,2,91);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (55,10,1,20,2,2,28);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (55,10,1,21,2,2,39);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (56,1,1,1,6,4,34);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (56,1,1,2,6,4,58);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (56,1,1,4,6,4,60);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (56,1,1,6,6,4,56);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (56,1,1,7,6,4,110);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (56,1,1,9,6,4,117);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (56,1,1,10,6,4,27);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (56,1,1,11,6,4,56);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (56,1,1,12,6,4,91);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (56,1,1,16,6,4,119);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (56,1,1,18,6,4,111);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (56,1,1,22,6,4,109);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (56,1,1,24,6,4,5);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (56,1,1,28,6,4,98);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (56,1,1,29,6,4,11);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (56,1,1,30,6,4,4);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (57,6,2,1,3,3,73);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (57,6,2,4,3,3,26);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (57,6,2,6,3,3,105);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (57,6,2,7,3,3,52);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (57,6,2,8,3,3,12);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (57,6,2,11,3,3,32);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (57,6,2,12,3,3,24);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (57,6,2,14,3,3,45);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (57,6,2,15,3,3,91);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (57,6,2,16,3,3,35);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (57,6,2,19,3,3,21);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (57,6,2,21,3,3,13);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (57,6,2,25,3,3,21);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (57,6,2,29,3,3,22);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (58,2,2,2,2,13,63);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (58,2,2,7,2,13,89);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (58,2,2,11,2,13,38);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (58,2,2,13,2,13,53);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (58,2,2,15,2,13,116);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (58,2,2,16,2,13,42);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (58,2,2,18,2,13,107);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (58,2,2,19,2,13,92);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (58,2,2,20,2,13,56);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (58,2,2,26,2,13,100);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (58,2,2,28,2,13,30);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (59,12,1,3,5,3,103);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (59,12,1,4,5,3,60);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (59,12,1,6,5,3,116);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (59,12,1,8,5,3,80);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (59,12,1,9,5,3,30);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (59,12,1,10,5,3,90);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (59,12,1,11,5,3,94);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (59,12,1,13,5,3,97);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (59,12,1,16,5,3,90);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (59,12,1,18,5,3,105);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (59,12,1,21,5,3,79);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (59,12,1,29,5,3,33);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (60,3,2,1,6,10,106);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (60,3,2,2,6,10,57);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (60,3,2,3,6,10,23);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (60,3,2,4,6,10,57);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (60,3,2,6,6,10,37);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (60,3,2,7,6,10,113);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (60,3,2,8,6,10,18);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (60,3,2,9,6,10,21);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (60,3,2,12,6,10,74);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (60,3,2,13,6,10,52);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (60,3,2,14,6,10,30);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (60,3,2,15,6,10,111);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (60,3,2,16,6,10,67);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (60,3,2,17,6,10,49);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (60,3,2,18,6,10,119);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (60,3,2,22,6,10,54);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (60,3,2,23,6,10,94);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (60,3,2,27,6,10,20);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (60,3,2,28,6,10,107);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (60,3,2,29,6,10,64);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (61,12,2,1,6,10,107);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (61,12,2,3,6,10,49);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (61,12,2,5,6,10,119);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (61,12,2,6,6,10,1);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (61,12,2,7,6,10,53);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (61,12,2,8,6,10,67);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (61,12,2,10,6,10,97);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (61,12,2,15,6,10,53);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (61,12,2,18,6,10,45);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (61,12,2,25,6,10,104);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (61,12,2,26,6,10,114);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (61,12,2,27,6,10,97);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (61,12,2,28,6,10,65);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (62,6,1,1,1,3,55);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (62,6,1,3,1,3,1);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (62,6,1,5,1,3,28);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (62,6,1,7,1,3,10);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (62,6,1,8,1,3,7);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (62,6,1,9,1,3,92);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (62,6,1,10,1,3,99);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (62,6,1,11,1,3,44);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (62,6,1,12,1,3,42);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (62,6,1,13,1,3,65);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (62,6,1,15,1,3,68);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (62,6,1,16,1,3,94);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (62,6,1,19,1,3,51);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (62,6,1,20,1,3,116);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (62,6,1,21,1,3,64);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (62,6,1,22,1,3,16);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (62,6,1,24,1,3,26);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (62,6,1,25,1,3,25);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (62,6,1,28,1,3,95);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (62,6,1,30,1,3,97);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (63,12,2,5,4,2,76);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (63,12,2,6,4,2,60);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (63,12,2,9,4,2,76);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (63,12,2,12,4,2,23);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (63,12,2,13,4,2,96);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (63,12,2,16,4,2,16);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (63,12,2,17,4,2,72);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (63,12,2,18,4,2,38);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (63,12,2,20,4,2,25);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (63,12,2,23,4,2,78);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (63,12,2,24,4,2,35);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (63,12,2,25,4,2,62);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (63,12,2,27,4,2,90);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (63,12,2,29,4,2,87);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (64,7,1,2,1,11,47);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (64,7,1,5,1,11,56);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (64,7,1,6,1,11,65);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (64,7,1,8,1,11,21);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (64,7,1,13,1,11,53);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (64,7,1,14,1,11,76);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (64,7,1,15,1,11,50);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (64,7,1,17,1,11,40);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (64,7,1,20,1,11,82);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (64,7,1,21,1,11,3);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (64,7,1,22,1,11,109);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (64,7,1,23,1,11,29);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (64,7,1,24,1,11,12);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (64,7,1,25,1,11,53);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (64,7,1,27,1,11,7);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (64,7,1,28,1,11,100);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (64,7,1,30,1,11,49);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (65,6,3,6,5,7,34);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (65,6,3,8,5,7,89);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (65,6,3,10,5,7,41);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (65,6,3,12,5,7,110);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (65,6,3,16,5,7,20);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (65,6,3,17,5,7,16);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (65,6,3,18,5,7,17);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (65,6,3,19,5,7,26);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (65,6,3,20,5,7,43);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (65,6,3,22,5,7,33);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (65,6,3,26,5,7,17);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (65,6,3,27,5,7,93);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (66,5,1,2,2,9,18);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (66,5,1,4,2,9,12);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (66,5,1,5,2,9,106);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (66,5,1,6,2,9,48);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (66,5,1,8,2,9,90);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (66,5,1,9,2,9,7);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (66,5,1,11,2,9,17);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (66,5,1,12,2,9,76);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (66,5,1,13,2,9,10);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (66,5,1,16,2,9,27);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (66,5,1,21,2,9,21);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (66,5,1,23,2,9,41);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (66,5,1,28,2,9,21);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (66,5,1,29,2,9,105);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (66,5,1,30,2,9,92);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (67,2,2,4,1,13,36);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (67,2,2,5,1,13,14);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (67,2,2,6,1,13,98);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (67,2,2,7,1,13,61);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (67,2,2,8,1,13,36);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (67,2,2,9,1,13,61);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (67,2,2,10,1,13,90);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (67,2,2,11,1,13,38);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (67,2,2,13,1,13,95);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (67,2,2,15,1,13,62);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (67,2,2,19,1,13,5);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (67,2,2,22,1,13,112);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (67,2,2,24,1,13,49);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (67,2,2,25,1,13,75);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (67,2,2,27,1,13,74);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (67,2,2,29,1,13,46);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (67,2,2,30,1,13,58);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (68,1,2,1,6,5,94);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (68,1,2,2,6,5,32);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (68,1,2,3,6,5,79);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (68,1,2,4,6,5,67);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (68,1,2,10,6,5,48);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (68,1,2,14,6,5,17);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (68,1,2,16,6,5,118);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (68,1,2,17,6,5,69);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (68,1,2,20,6,5,34);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (68,1,2,23,6,5,24);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (68,1,2,25,6,5,48);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (68,1,2,26,6,5,62);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (68,1,2,28,6,5,115);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (68,1,2,29,6,5,74);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (69,10,1,4,3,4,22);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (69,10,1,5,3,4,5);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (69,10,1,6,3,4,34);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (69,10,1,10,3,4,72);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (69,10,1,12,3,4,18);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (69,10,1,13,3,4,99);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (69,10,1,16,3,4,87);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (69,10,1,24,3,4,6);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (69,10,1,26,3,4,105);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (69,10,1,27,3,4,77);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (69,10,1,28,3,4,108);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (69,10,1,29,3,4,55);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (70,13,1,1,3,8,111);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (70,13,1,4,3,8,25);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (70,13,1,6,3,8,32);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (70,13,1,12,3,8,51);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (70,13,1,14,3,8,6);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (70,13,1,15,3,8,50);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (70,13,1,20,3,8,118);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (70,13,1,25,3,8,106);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (70,13,1,26,3,8,45);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (70,13,1,27,3,8,117);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (70,13,1,28,3,8,35);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (70,13,1,30,3,8,112);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (71,7,1,1,3,1,17);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (71,7,1,3,3,1,67);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (71,7,1,6,3,1,35);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (71,7,1,7,3,1,33);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (71,7,1,8,3,1,99);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (71,7,1,11,3,1,26);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (71,7,1,14,3,1,14);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (71,7,1,17,3,1,34);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (71,7,1,18,3,1,23);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (71,7,1,19,3,1,77);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (71,7,1,20,3,1,110);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (71,7,1,21,3,1,68);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (71,7,1,23,3,1,42);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (71,7,1,24,3,1,100);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (71,7,1,27,3,1,86);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (71,7,1,29,3,1,113);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (71,7,1,30,3,1,58);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (72,8,2,1,4,13,6);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (72,8,2,2,4,13,16);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (72,8,2,4,4,13,21);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (72,8,2,5,4,13,82);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (72,8,2,8,4,13,92);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (72,8,2,9,4,13,65);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (72,8,2,11,4,13,21);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (72,8,2,12,4,13,114);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (72,8,2,14,4,13,6);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (72,8,2,15,4,13,44);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (72,8,2,16,4,13,102);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (72,8,2,19,4,13,88);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (72,8,2,20,4,13,25);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (72,8,2,21,4,13,95);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (72,8,2,27,4,13,101);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (73,7,2,2,1,1,12);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (73,7,2,3,1,1,71);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (73,7,2,5,1,1,79);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (73,7,2,7,1,1,117);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (73,7,2,10,1,1,94);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (73,7,2,11,1,1,44);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (73,7,2,13,1,1,88);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (73,7,2,16,1,1,74);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (73,7,2,17,1,1,29);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (73,7,2,18,1,1,24);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (73,7,2,20,1,1,85);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (73,7,2,22,1,1,30);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (73,7,2,26,1,1,109);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (73,7,2,27,1,1,37);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (73,7,2,29,1,1,101);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (73,7,2,30,1,1,76);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (74,11,1,1,4,10,24);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (74,11,1,2,4,10,1);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (74,11,1,3,4,10,117);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (74,11,1,6,4,10,83);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (74,11,1,9,4,10,73);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (74,11,1,10,4,10,90);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (74,11,1,14,4,10,54);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (74,11,1,15,4,10,105);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (74,11,1,18,4,10,116);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (74,11,1,19,4,10,30);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (74,11,1,20,4,10,74);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (74,11,1,21,4,10,81);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (74,11,1,23,4,10,24);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (74,11,1,24,4,10,43);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (74,11,1,26,4,10,83);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (75,3,1,4,2,10,4);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (75,3,1,5,2,10,26);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (75,3,1,6,2,10,30);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (75,3,1,7,2,10,3);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (75,3,1,8,2,10,118);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (75,3,1,11,2,10,47);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (75,3,1,12,2,10,77);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (75,3,1,13,2,10,23);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (75,3,1,17,2,10,106);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (75,3,1,18,2,10,64);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (75,3,1,19,2,10,34);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (75,3,1,21,2,10,1);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (75,3,1,23,2,10,46);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (75,3,1,24,2,10,18);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (75,3,1,25,2,10,88);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (75,3,1,26,2,10,58);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (76,2,1,1,6,13,33);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (76,2,1,2,6,13,13);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (76,2,1,3,6,13,40);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (76,2,1,4,6,13,93);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (76,2,1,5,6,13,34);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (76,2,1,7,6,13,64);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (76,2,1,12,6,13,7);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (76,2,1,13,6,13,1);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (76,2,1,14,6,13,14);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (76,2,1,17,6,13,70);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (76,2,1,21,6,13,54);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (76,2,1,22,6,13,80);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (76,2,1,23,6,13,1);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (76,2,1,26,6,13,89);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (76,2,1,27,6,13,65);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (76,2,1,29,6,13,48);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (77,12,1,1,4,12,6);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (77,12,1,3,4,12,113);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (77,12,1,6,4,12,99);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (77,12,1,7,4,12,84);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (77,12,1,12,4,12,5);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (77,12,1,13,4,12,89);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (77,12,1,14,4,12,88);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (77,12,1,17,4,12,113);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (77,12,1,19,4,12,116);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (77,12,1,20,4,12,89);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (77,12,1,23,4,12,90);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (77,12,1,24,4,12,60);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (77,12,1,25,4,12,74);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (77,12,1,26,4,12,42);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (77,12,1,27,4,12,67);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (77,12,1,29,4,12,56);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (78,13,3,3,5,8,79);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (78,13,3,4,5,8,0);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (78,13,3,5,5,8,9);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (78,13,3,6,5,8,77);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (78,13,3,7,5,8,14);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (78,13,3,9,5,8,90);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (78,13,3,23,5,8,105);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (78,13,3,24,5,8,13);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (78,13,3,25,5,8,10);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (78,13,3,27,5,8,1);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (78,13,3,30,5,8,98);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (79,9,2,4,3,10,60);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (79,9,2,5,3,10,0);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (79,9,2,6,3,10,31);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (79,9,2,7,3,10,1);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (79,9,2,8,3,10,70);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (79,9,2,9,3,10,93);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (79,9,2,10,3,10,108);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (79,9,2,11,3,10,44);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (79,9,2,15,3,10,50);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (79,9,2,16,3,10,36);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (79,9,2,19,3,10,6);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (79,9,2,22,3,10,95);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (79,9,2,24,3,10,58);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (79,9,2,26,3,10,67);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (79,9,2,28,3,10,98);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (79,9,2,30,3,10,42);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (80,1,1,1,6,1,18);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (80,1,1,3,6,1,100);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (80,1,1,4,6,1,75);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (80,1,1,6,6,1,62);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (80,1,1,8,6,1,101);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (80,1,1,9,6,1,110);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (80,1,1,10,6,1,100);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (80,1,1,13,6,1,117);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (80,1,1,14,6,1,30);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (80,1,1,16,6,1,39);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (80,1,1,17,6,1,101);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (80,1,1,18,6,1,15);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (80,1,1,19,6,1,26);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (80,1,1,21,6,1,114);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (80,1,1,22,6,1,57);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (80,1,1,24,6,1,114);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (80,1,1,26,6,1,115);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (81,9,1,2,5,2,29);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (81,9,1,4,5,2,77);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (81,9,1,7,5,2,113);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (81,9,1,8,5,2,79);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (81,9,1,9,5,2,68);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (81,9,1,10,5,2,114);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (81,9,1,14,5,2,62);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (81,9,1,18,5,2,37);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (81,9,1,20,5,2,74);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (81,9,1,21,5,2,72);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (81,9,1,23,5,2,28);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (81,9,1,25,5,2,61);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (81,9,1,28,5,2,52);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (81,9,1,29,5,2,77);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (81,9,1,30,5,2,93);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (82,3,1,3,4,9,2);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (82,3,1,4,4,9,4);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (82,3,1,5,4,9,110);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (82,3,1,10,4,9,22);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (82,3,1,12,4,9,86);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (82,3,1,14,4,9,10);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (82,3,1,16,4,9,74);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (82,3,1,17,4,9,23);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (82,3,1,18,4,9,37);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (82,3,1,23,4,9,22);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (82,3,1,30,4,9,49);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (83,2,2,1,6,10,40);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (83,2,2,3,6,10,9);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (83,2,2,5,6,10,52);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (83,2,2,7,6,10,85);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (83,2,2,9,6,10,101);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (83,2,2,10,6,10,63);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (83,2,2,11,6,10,4);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (83,2,2,13,6,10,10);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (83,2,2,14,6,10,48);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (83,2,2,15,6,10,92);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (83,2,2,18,6,10,23);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (83,2,2,20,6,10,106);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (83,2,2,22,6,10,77);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (83,2,2,24,6,10,19);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (83,2,2,25,6,10,38);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (83,2,2,27,6,10,46);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (83,2,2,28,6,10,60);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (83,2,2,29,6,10,58);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (84,7,1,1,1,9,12);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (84,7,1,2,1,9,10);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (84,7,1,3,1,9,69);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (84,7,1,4,1,9,3);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (84,7,1,7,1,9,81);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (84,7,1,8,1,9,103);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (84,7,1,10,1,9,13);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (84,7,1,11,1,9,60);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (84,7,1,12,1,9,18);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (84,7,1,13,1,9,17);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (84,7,1,16,1,9,105);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (84,7,1,19,1,9,101);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (84,7,1,21,1,9,5);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (84,7,1,23,1,9,40);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (85,13,1,2,2,3,92);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (85,13,1,4,2,3,0);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (85,13,1,6,2,3,83);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (85,13,1,7,2,3,112);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (85,13,1,8,2,3,56);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (85,13,1,15,2,3,60);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (85,13,1,16,2,3,116);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (85,13,1,19,2,3,29);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (85,13,1,20,2,3,49);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (85,13,1,23,2,3,101);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (85,13,1,24,2,3,117);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (85,13,1,25,2,3,114);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (85,13,1,29,2,3,7);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (86,3,2,1,3,7,15);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (86,3,2,2,3,7,4);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (86,3,2,7,3,7,82);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (86,3,2,8,3,7,119);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (86,3,2,9,3,7,44);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (86,3,2,15,3,7,118);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (86,3,2,16,3,7,33);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (86,3,2,21,3,7,79);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (86,3,2,25,3,7,118);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (86,3,2,29,3,7,19);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (86,3,2,30,3,7,69);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (87,11,1,1,2,9,52);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (87,11,1,2,2,9,82);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (87,11,1,4,2,9,43);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (87,11,1,6,2,9,103);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (87,11,1,7,2,9,11);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (87,11,1,8,2,9,16);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (87,11,1,14,2,9,28);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (87,11,1,15,2,9,57);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (87,11,1,16,2,9,1);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (87,11,1,17,2,9,87);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (87,11,1,18,2,9,29);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (87,11,1,21,2,9,63);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (87,11,1,23,2,9,12);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (87,11,1,24,2,9,48);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (87,11,1,25,2,9,103);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (87,11,1,28,2,9,2);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (88,8,2,1,6,8,7);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (88,8,2,2,6,8,75);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (88,8,2,3,6,8,102);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (88,8,2,4,6,8,79);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (88,8,2,5,6,8,21);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (88,8,2,8,6,8,63);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (88,8,2,9,6,8,116);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (88,8,2,10,6,8,57);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (88,8,2,13,6,8,20);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (88,8,2,16,6,8,85);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (88,8,2,18,6,8,83);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (88,8,2,22,6,8,4);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (88,8,2,23,6,8,94);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (88,8,2,25,6,8,15);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (88,8,2,26,6,8,25);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (88,8,2,27,6,8,43);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (88,8,2,28,6,8,9);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (88,8,2,29,6,8,10);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (88,8,2,30,6,8,4);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (89,3,1,2,3,2,58);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (89,3,1,3,3,2,101);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (89,3,1,4,3,2,15);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (89,3,1,5,3,2,59);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (89,3,1,9,3,2,109);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (89,3,1,10,3,2,44);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (89,3,1,12,3,2,24);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (89,3,1,15,3,2,79);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (89,3,1,18,3,2,110);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (89,3,1,20,3,2,107);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (89,3,1,23,3,2,105);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (89,3,1,26,3,2,23);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (89,3,1,29,3,2,4);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (90,5,3,1,5,3,59);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (90,5,3,4,5,3,84);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (90,5,3,8,5,3,12);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (90,5,3,11,5,3,77);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (90,5,3,14,5,3,55);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (90,5,3,15,5,3,103);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (90,5,3,18,5,3,14);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (90,5,3,19,5,3,55);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (90,5,3,22,5,3,66);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (90,5,3,24,5,3,20);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (90,5,3,25,5,3,79);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (90,5,3,27,5,3,0);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (90,5,3,28,5,3,67);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (90,5,3,29,5,3,73);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (91,5,1,1,1,1,61);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (91,5,1,2,1,1,27);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (91,5,1,3,1,1,118);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (91,5,1,7,1,1,66);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (91,5,1,8,1,1,115);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (91,5,1,9,1,1,88);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (91,5,1,11,1,1,83);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (91,5,1,13,1,1,77);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (91,5,1,14,1,1,64);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (91,5,1,17,1,1,39);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (91,5,1,27,1,1,21);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (91,5,1,28,1,1,30);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (91,5,1,30,1,1,80);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (92,2,1,1,5,7,116);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (92,2,1,2,5,7,12);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (92,2,1,4,5,7,98);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (92,2,1,5,5,7,65);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (92,2,1,7,5,7,17);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (92,2,1,8,5,7,70);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (92,2,1,9,5,7,113);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (92,2,1,11,5,7,118);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (92,2,1,12,5,7,54);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (92,2,1,13,5,7,41);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (92,2,1,15,5,7,53);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (92,2,1,18,5,7,19);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (92,2,1,20,5,7,87);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (92,2,1,22,5,7,85);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (92,2,1,24,5,7,24);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (92,2,1,27,5,7,81);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (93,7,2,1,5,13,55);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (93,7,2,4,5,13,103);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (93,7,2,8,5,13,99);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (93,7,2,10,5,13,9);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (93,7,2,11,5,13,77);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (93,7,2,13,5,13,90);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (93,7,2,15,5,13,5);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (93,7,2,18,5,13,79);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (93,7,2,19,5,13,15);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (93,7,2,20,5,13,96);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (93,7,2,23,5,13,10);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (93,7,2,24,5,13,113);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (93,7,2,26,5,13,106);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (93,7,2,29,5,13,37);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (94,11,1,2,3,9,19);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (94,11,1,3,3,9,61);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (94,11,1,4,3,9,114);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (94,11,1,5,3,9,7);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (94,11,1,7,3,9,100);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (94,11,1,8,3,9,22);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (94,11,1,9,3,9,46);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (94,11,1,11,3,9,21);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (94,11,1,12,3,9,86);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (94,11,1,13,3,9,37);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (94,11,1,14,3,9,79);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (94,11,1,16,3,9,66);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (94,11,1,17,3,9,4);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (94,11,1,18,3,9,48);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (94,11,1,19,3,9,73);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (94,11,1,20,3,9,44);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (94,11,1,23,3,9,106);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (94,11,1,30,3,9,100);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (95,4,2,4,5,12,119);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (95,4,2,8,5,12,61);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (95,4,2,10,5,12,93);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (95,4,2,11,5,12,53);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (95,4,2,12,5,12,118);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (95,4,2,13,5,12,4);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (95,4,2,16,5,12,60);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (95,4,2,17,5,12,36);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (95,4,2,22,5,12,45);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (95,4,2,23,5,12,70);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (95,4,2,25,5,12,61);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (95,4,2,26,5,12,13);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (95,4,2,28,5,12,66);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (95,4,2,29,5,12,75);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (96,5,1,1,1,11,62);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (96,5,1,4,1,11,54);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (96,5,1,6,1,11,75);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (96,5,1,7,1,11,100);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (96,5,1,11,1,11,29);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (96,5,1,14,1,11,58);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (96,5,1,15,1,11,69);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (96,5,1,16,1,11,9);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (96,5,1,18,1,11,56);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (96,5,1,19,1,11,68);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (96,5,1,27,1,11,95);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (96,5,1,28,1,11,49);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (96,5,1,29,1,11,96);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (96,5,1,30,1,11,45);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (97,8,1,1,5,11,63);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (97,8,1,7,5,11,81);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (97,8,1,13,5,11,107);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (97,8,1,15,5,11,13);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (97,8,1,16,5,11,24);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (97,8,1,17,5,11,78);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (97,8,1,18,5,11,51);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (97,8,1,19,5,11,39);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (97,8,1,20,5,11,101);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (97,8,1,21,5,11,42);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (97,8,1,22,5,11,19);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (97,8,1,23,5,11,46);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (97,8,1,26,5,11,101);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (97,8,1,27,5,11,26);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (97,8,1,28,5,11,23);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (98,11,3,2,2,9,78);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (98,11,3,4,2,9,40);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (98,11,3,5,2,9,110);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (98,11,3,7,2,9,82);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (98,11,3,10,2,9,83);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (98,11,3,12,2,9,111);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (98,11,3,13,2,9,3);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (98,11,3,14,2,9,45);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (98,11,3,16,2,9,118);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (98,11,3,17,2,9,71);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (98,11,3,18,2,9,68);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (98,11,3,19,2,9,24);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (98,11,3,20,2,9,27);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (98,11,3,24,2,9,79);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (98,11,3,25,2,9,113);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (98,11,3,26,2,9,10);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (98,11,3,28,2,9,31);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (98,11,3,29,2,9,109);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (99,8,1,2,3,5,57);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (99,8,1,3,3,5,47);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (99,8,1,4,3,5,58);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (99,8,1,5,3,5,112);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (99,8,1,7,3,5,20);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (99,8,1,9,3,5,4);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (99,8,1,15,3,5,118);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (99,8,1,16,3,5,3);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (99,8,1,17,3,5,7);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (99,8,1,19,3,5,50);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (99,8,1,20,3,5,17);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (99,8,1,21,3,5,38);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (99,8,1,22,3,5,83);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (99,8,1,24,3,5,88);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (99,8,1,26,3,5,96);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (99,8,1,27,3,5,114);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (99,8,1,28,3,5,105);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (99,8,1,29,3,5,64);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (100,5,3,3,2,9,47);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (100,5,3,7,2,9,70);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (100,5,3,12,2,9,41);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (100,5,3,13,2,9,109);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (100,5,3,18,2,9,51);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (100,5,3,22,2,9,90);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (100,5,3,23,2,9,118);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (100,5,3,28,2,9,83);
INSERT INTO VISIONNAGE(utilisateur_id,plateforme_id,type_plateforme_id,date_id,nationalite_utilisateur_id,nationalite_plateforme_id,temps_visionnage) VALUES (100,5,3,29,2,9,75);

/*UPDATE DES PROFILS UTILISATEURS ET TEMPS*/
UPDATE VISIONNAGE SET profil_utilisateur_id=1 WHERE utilisateur_id IN PROFIL_UTILISATEUR_18_25 AND utilisateur_id IN PROFIL_UTILISATEUR_HOMME;
UPDATE VISIONNAGE SET profil_utilisateur_id=2 WHERE utilisateur_id IN PROFIL_UTILISATEUR_26_35 AND utilisateur_id IN PROFIL_UTILISATEUR_HOMME;
UPDATE VISIONNAGE SET profil_utilisateur_id=3 WHERE utilisateur_id IN PROFIL_UTILISATEUR_36_50 AND utilisateur_id IN PROFIL_UTILISATEUR_HOMME;
UPDATE VISIONNAGE SET profil_utilisateur_id=4 WHERE utilisateur_id IN PROFIL_UTILISATEUR_50_plus AND utilisateur_id IN PROFIL_UTILISATEUR_HOMME;

UPDATE VISIONNAGE SET profil_utilisateur_id=5 WHERE utilisateur_id IN PROFIL_UTILISATEUR_18_25 AND utilisateur_id IN PROFIL_UTILISATEUR_FEMME;
UPDATE VISIONNAGE SET profil_utilisateur_id=6 WHERE utilisateur_id IN PROFIL_UTILISATEUR_26_35 AND utilisateur_id IN PROFIL_UTILISATEUR_FEMME;
UPDATE VISIONNAGE SET profil_utilisateur_id=7 WHERE utilisateur_id IN PROFIL_UTILISATEUR_36_50 AND utilisateur_id IN PROFIL_UTILISATEUR_FEMME;
UPDATE VISIONNAGE SET profil_utilisateur_id=8 WHERE utilisateur_id IN PROFIL_UTILISATEUR_50_plus AND utilisateur_id IN PROFIL_UTILISATEUR_FEMME;

UPDATE VISIONNAGE SET profil_temps_id=1 WHERE temps_visionnage between 0 and 30;
UPDATE VISIONNAGE SET profil_temps_id=2 WHERE temps_visionnage between 31 and 60;
UPDATE VISIONNAGE SET profil_temps_id=3 WHERE temps_visionnage between 61 and 90;
UPDATE VISIONNAGE SET profil_temps_id=4 WHERE temps_visionnage > 90;


/***************************************************/
/******************** REQUETES *********************/
/***************************************************/

/* 1 */
.print 1) Nombre d homme 18-25 utilisant le streaming
SELECT COUNT(*) FROM VISIONNAGE WHERE profil_utilisateur_id=2 AND type_plateforme_id=1;
.print

/* 2 */
.print 2) Age moyen des utilisateurs streaming
SELECT AVG(utilisateur_age) FROM VISIONNAGE,UTILISATEUR WHERE VISIONNAGE.utilisateur_id= UTILISATEUR.utilisateur_age AND type_plateforme_id=2;
.print

/* 3 */
.print 3) Nombre d utilisateur streaming pour chaque profil d utilisateur
SELECT COUNT(utilisateur_id),PROFIL_UTILISATEUR.profil_utilisateur_desc FROM VISIONNAGE,PROFIL_UTILISATEUR WHERE VISIONNAGE.profil_utilisateur_id=PROFIL_UTILISATEUR.profil_utilisateur_id GROUP BY VISIONNAGE.profil_utilisateur_id;
.print

/* 4 */
.print 4) Nombre d utilisateur pour chaque type de plateforme
SELECT COUNT(utilisateur_id),TYPE_PLATEFORME.type_plateforme_desc FROM VISIONNAGE,TYPE_PLATEFORME WHERE VISIONNAGE.type_plateforme_id=TYPE_PLATEFORME.type_plateforme_id GROUP BY VISIONNAGE.type_plateforme_id;
.print

/* 5 */
.print 5) Quelle est la plateforme ayant été la plus visionné par les français ?
.print Nombre Visionnage | Nom Plateforme
SELECT COUNT(utilisateur_id) AS nb_visionnage,plateforme_nom FROM VISIONNAGE,NATIONALITE,PLATEFORME WHERE nationalite_utilisateur_id=nationalite_id AND nationalite_pays='FRANCE' AND VISIONNAGE.plateforme_id=PLATEFORME.plateforme_id GROUP BY VISIONNAGE.plateforme_id ORDER BY nb_visionnage DESC;
.print

/* 6 */
.print 6) Quelle est la proportion de visionnage par plateforme par pays ?
.print PAYS | Television | Streaming | Radio
SELECT nationalite_pays,((SELECT COUNT(*) FROM VISIONNAGE WHERE nationalite_utilisateur_id=nationalite_id AND type_plateforme_id=1)*1.0/(SELECT COUNT(*) FROM VISIONNAGE WHERE nationalite_utilisateur_id=nationalite_id))*100, ((SELECT COUNT(*) FROM VISIONNAGE WHERE nationalite_utilisateur_id=nationalite_id  AND type_plateforme_id=2)*1.0/(SELECT COUNT(*) FROM VISIONNAGE WHERE nationalite_utilisateur_id=nationalite_id))*100, ((SELECT COUNT(*) FROM VISIONNAGE WHERE nationalite_utilisateur_id=nationalite_id AND type_plateforme_id=3)*1.0/(SELECT COUNT(*) FROM VISIONNAGE WHERE nationalite_utilisateur_id=nationalite_id))*100 FROM NATIONALITE GROUP BY nationalite_pays;
.print 

/* 7 */
.print 7) Temps moyen de visionnage par genre 
SELECT U.utilisateur_genre, AVG(temps_visionnage) FROM VISIONNAGE V, UTILISATEUR U WHERE V.utilisateur_id = U.utilisateur_id GROUP BY U.utilisateur_genre;
.print

/* 8 */
.print 8) Nombre de visionnage par pays
SELECT N.nationalite_pays, COUNT(*) FROM VISIONNAGE V, NATIONALITE N WHERE V.nationalite_utilisateur_id = N.nationalite_id GROUP BY N.nationalite_id;
.print

/* 9 */
.print 9) Nombre de visionnage par jour au mois d aout 2019
SELECT jour, COUNT(*) FROM VISIONNAGE V, DATE D WHERE V.date_id = D.date_id AND mois=8 AND annee=2019 GROUP BY jour;
.print

/* 10 */
.print 10) Age moyen des utilisateurs ayant un temps de visionnage de 60 minutes minimum
SELECT AVG(utilisateur_age) FROM VISIONNAGE V, UTILISATEUR U WHERE V.utilisateur_id = U.utilisateur_id AND temps_visionnage > 60;
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