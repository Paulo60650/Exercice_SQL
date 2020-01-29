-- JOINTURES
-- ex1
SELECT prenom, nodep, noregion
FROM employe 
JOIN dept ON employe.nodep = dept.nodept;
-- ex2
SELECT nodep AS "Numero de département",
dept.nom AS "Nom du departement", 
employe.nom AS "Nom de l'employé"
FROM employe 
JOIN dept ON employe.nodep =  dept.nodept
ORDER BY nodep;
-- ex3
SELECT employe.nom AS "Employés du département distribution" 
FROM employe 
JOIN dept ON employe.nodep = dept.nodept 
WHERE dept.nom = "distribution";
-- AUTO-JOINTURES
-- ex4
SELECT tab1.nom AS "Nom employé", 
tab1.salaire AS "Salaire de employé",  
tab2.nom AS "Nom du supérieur", 
tab2.salaire AS "Salaire du supérieur"
FROM employe AS tab1
JOIN employe AS tab2 ON tab2.noemp = tab1.nosup
WHERE tab1.salaire > tab2.salaire; 
-- SOUS-REQUÊTES
-- ex5
SELECT nom, titre
FROM employe
WHERE titre IN
(SELECT titre FROM employe WHERE nom ="amartakaldire")
AND nom != "amartakaldire";
-- ex6
SELECT nom AS "Nom employé",
salaire AS "Salaire de employé",
nodep AS "Numéro du département" 
FROM employe
WHERE salaire > ALL
(SELECT MIN(salaire) FROM employe WHERE nodep = 31)
ORDER BY nodep, salaire;
-- ex7
SELECT nom AS "Nom employé",
salaire AS "Salaire de employé",
nodep AS "Numéro du département" 
FROM employe
(SELECT salaire FROM employe WHERE nodep = 31)
ORDER BY nodep, salaire;
-- ex8
SELECT nom AS "Nom employé",
titre AS "Titre"
FROM employe
WHERE nodep = 31 AND titre = ANY
(SELECT titre FROM employe WHERE nodep = 32);
-- ex9
SELECT nom AS "Nom employé",
titre AS "Titre"
FROM employe
WHERE nodep = 31 AND titre != ALL
(SELECT titre FROM employe WHERE nodep = 32);
-- ex10
SELECT nom AS "Nom employé",
titre AS "Titre",
salaire AS "Salaire de employé"
FROM employe
WHERE titre = (SELECT titre FROM employe WHERE nom = "fairent") 
AND salaire = (SELECT salaire FROM employe WHERE nom = "fairent")
AND nom != "fairent";
-- REQUÊTES EXTERNES
-- ex11
SELECT dept.nodept AS "Numéro du département", 
dept.nom AS " Nom du département", 
employe.nom AS "Nom employé"
FROM dept
LEFT JOIN employe ON nodept = nodep
ORDER BY nodep;
-- UTILISATION DE FONCTIONS DE GROUPES
-- ex12
SELECT titre AS "Titre",
Count(noemp) AS "Nombre d'employé"
FROM employe
GROUP BY titre;
-- ex13
SELECT noregion AS "Numéro de région",
AVG(employe.salaire) AS "Salaire moyen",
SUM(employe.salaire) AS "Somme des salaires"
FROM employe 
JOIN dept ON employe.nodep = dept.nodept
GROUP BY noregion;
-- LA CLAUSE HAVING
-- ex14
SELECT nodep AS "Numéro du département", 
Count(noemp) AS "Nombre d'employé"
FROM employe
GROUP BY nodep
HAVING COUNT(*) >= 3;
-- ex15
SELECT SUBSTRING(nom, 1, 1) AS "Initiale",
COUNT(SUBSTRING(nom, 1, 1)) AS "Occurence"
FROM employe 
GROUP BY Initiale
HAVING Occurence >= 3;
-- ex16
SELECT Min(salaire) AS "Salaire minimum",
Max(salaire) AS "Salaire maximum",
MAX(salaire) - MIN(salaire) AS "Différence entre max et min"
FROM employe;
-- ex17
SELECT COUNT(Distinct titre) AS "Nombre de titre différents"
FROM employe;
-- ex18
SELECT titre AS "Titre",
COUNT(titre) "Nombre d'employé"
FROM employe
GROUP BY titre;
-- ex19
SELECT DISTINCT titre AS "Titre",
AVG(salaire) AS "Salaire moyen"
FROM employe
GROUP BY titre
HAVING AVG(salaire) > 
(SELECT AVG(salaire) FROM employe WHERE titre = "représentant");
-- ex20
SELECT COUNT(salaire) AS "Nombre de salaire renseigné",
COUNT(tauxcom) AS "Nombre de taux de commission renseigné"
FROM employe;