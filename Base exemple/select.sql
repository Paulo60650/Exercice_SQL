-- ex1
SELECT * FROM employe;
-- ex2
SELECT nodept, nom, noregion
FROM dept;
-- ex3
SELECT nom AS "Nom de l'employé", 
dateemb AS "Date d'embauche", 
nosup AS "Numéro du supérieur", 
nodep AS "Numéro du département", 
salaire AS "Salaire" 
FROM employe;
-- ex4
SELECT nom AS "Nom de l'employé",
titre AS "Titre"
FROM employe;
-- ex5
SELECT DISTINCT titre FROM employe;
-- ex6
SELECT nom AS "Nom de l'employé",
noemp AS "Numéro d'employé",
nodep AS "Numéro du département"
FROM employe
WHERE titre = "secrétaire";
-- ex7
SELECT nom AS "Nom de l'employé",
nodep AS "Numéro du département"
FROM employe
WHERE nodep > 40;
-- ex8
SELECT nom AS "Nom de l'employé",
prenom AS "Prenom de l'employé"
FROM employe 
WHERE nom < prenom;
-- ex9
SELECT nom AS "Nom de l'employé",   
nodep AS "Numéro du département", 
salaire AS "Salaire"
FROM employe
WHERE titre = "représentant"
AND nodep = 35
AND salaire > 20000;
-- ex10
SELECT nom AS "Nom de l'employé",   
nodep AS "Numéro du département", 
salaire AS "Salaire"
FROM employe
WHERE titre = "représentant" OR titre = "président";
-- ex11
SELECT nom AS "Nom de l'employé",
titre AS "Titre",
nodep AS "Numéro du département", 
salaire AS "Salaire"
FROM employe
WHERE nodep = 34
AND (titre = "représentant" OR titre = "secrétaire");
-- ex12
SELECT nom AS "Nom de l'employé",
titre AS "Titre",
nodep AS "Numéro du département", 
salaire AS "Salaire"
FROM employe
WHERE titre = "représentant"
OR (titre = "secrétaire" AND nodep = 34);
-- ex13
SELECT nom AS "Nom de l'employé",
salaire AS "Salaire"
FROM employe 
WHERE (salaire > 20000 AND salaire < 30000);
-- ex15
SELECT nom AS "Nom de l'employé"
FROM employe
WHERE (nom LIKE "h%");
-- ex16
SELECT nom AS "Nom de l'employé"
FROM employe
WHERE (nom LIKE "%n");
-- ex17
SELECT nom AS "Nom de l'employé"
FROM employe
WHERE (nom LIKE "__u%");
-- ex18
SELECT nom AS "Nom de l'employé",
salaire AS "Salaire"
FROM employe 
WHERE nodep = 41
ORDER BY salaire;
-- ex19
SELECT nom AS "Nom de l'employé",
salaire AS "Salaire"
FROM employe 
WHERE nodep = 41
ORDER BY salaire DESC;
-- ex20
SELECT nom AS "Nom de l'employé",
titre AS "Titre",
salaire AS "Salaire"
FROM employe 
ORDER BY titre, salaire DESC;
-- ex21
SELECT nom AS "Nom de l'employé",
tauxcom As "Taux de commission",
salaire AS "Salaire"
FROM employe
ORDER BY tauxcom;
-- ex22
SELECT nom AS "Nom de l'employé",
tauxcom As "Taux de commission",
titre AS "Titre",
salaire AS "Salaire"
FROM employe
WHERE tauxcom IS NULL;
-- ex23
SELECT nom AS "Nom de l'employé",
tauxcom As "Taux de commission",
titre AS "Titre",
salaire AS "Salaire"
FROM employe
WHERE tauxcom IS NOT NULL;
-- ex24
SELECT nom AS "Nom de l'employé",
tauxcom As "Taux de commission",
titre AS "Titre",
salaire AS "Salaire"
FROM employe
WHERE tauxcom < 15;
-- ex25
SELECT nom AS "Nom de l'employé",
tauxcom As "Taux de commission",
titre AS "Titre",
salaire AS "Salaire"
FROM employe
WHERE tauxcom > 15;
-- ex26
SELECT nom AS "Nom de l'employé",
tauxcom As "Taux de commission",
titre AS "Titre",
salaire AS "Salaire",
(salaire * tauxcom) / 100 AS "Commission"
FROM employe
WHERE tauxcom IS NOT NULL;
-- ex27
SELECT nom AS "Nom de l'employé",
tauxcom As "Taux de commission",
titre AS "Titre",
salaire AS "Salaire",
(salaire * tauxcom) / 100 AS "Commission"
FROM employe
WHERE tauxcom IS NOT NULL
ORDER BY tauxcom;
-- ex28
SELECT CONCAT(nom, " ", prenom) AS "Employé"
FROM employe;
-- ex29
SELECT SUBSTRING(nom, 1, 5) AS "Nom de l'employé"
FROM employe;
-- ex30
SELECT nom,
LOCATE("r", nom) AS "Rand du r dans les noms"
FROM employe;
-- ex31
SELECT nom,
UPPER(nom) AS "Nom en majuscule",
LOWER(nom) AS "Nom en minuscule"
FROM employe;
-- ex32
SELECT nom,
LENGTH(nom) AS "Longueur du nom"
FROM employe;
