-- LOT 1
-- ex1
SELECT hot_nom AS "Nom de l hotel",
hot_ville AS "Ville de l hotel"
FROM hotel;
-- ex2
SELECT cli_nom As "Nom du client",
cli_prenom AS "Prénom du client",
cli_adresse AS "Adresse du client"
FROM client
WHERE cli_nom = "white";
-- ex3
SELECT sta_nom AS "Nom de la station",
sta_altitude AS "Altitude de la station"
FROM station 
WHERE sta_altitude > 1000;
-- ex4
SELECT cha_numero AS "Numéro de la chambre",
cha_capacite AS "Capacité de la chambre"
FROM chambre
WHERE cha_capacite > 1
ORDER BY cha_numero;
-- ex5
SELECT cli_nom As "Nom du client",
cli_ville AS "Ville de résidence du client"
FROM client
WHERE cli_ville != "Londre";
-- ex6
SELECT hot_nom AS " Nom de l hotel",
hot_ville AS "Ville de l hotel",
hot_categorie AS "Catégorie de l hotel"
FROM hotel
WHERE (hot_categorie >=3 AND hot_ville = "Bretou");
-- LOT 2
-- ex7
SELECT station.sta_nom AS "Nom de la station",
hotel.hot_nom AS " Nom de l hotel",
hotel.hot_ville AS "Ville de l hotel",
hotel.hot_categorie AS "Catégorie de l hotel"
FROM station
JOIN hotel ON hot_sta_id = sta_id;
-- ex8
SELECT hotel.hot_nom AS "Nom de l hotel",
hotel.hot_categorie AS "Catégorie de l hotel",
hotel.hot_ville AS "Ville de l hotel",
chambre.cha_numero AS "Numéro de chambre"
FROM hotel
JOIN chambre ON cha_hot_id = hot_id;
-- ex9
SELECT hotel.hot_nom AS "Nom de l hotel",
hotel.hot_categorie AS "Catégorie de l hotel",
hotel.hot_ville AS "Ville de l hotel",
chambre.cha_numero AS "Numéro de chambre",
chambre.cha_capacite AS "Capacité de la chambre"
FROM hotel
JOIN chambre ON cha_hot_id = hot_id
WHERE cha_capacite > 1;
-- ex10
SELECT client.cli_nom AS "Nom du client",
hotel.hot_nom AS "Nom de l hotel",
reservation.res_date AS "Date de réservation"
FROM client
JOIN reservation ON reservation.res_cli_id = client.cli_id
JOIN chambre ON chambre.cha_id = reservation.res_cha_id
JOIN hotel ON hotel.hot_id = chambre.cha_hot_id;
-- ex11
SELECT station.sta_nom AS "Nom de la station",
hotel.hot_nom AS "Nom de l hotel",
chambre.cha_numero AS "Numéro de chambre",
chambre.cha_capacite AS "Capacité de la chambre"
FROM station
JOIN hotel ON hotel.hot_sta_id = station.sta_id
JOIN chambre ON chambre.cha_hot_id = hotel.hot_id;
-- ex12
SELECT client.cli_nom AS "Nom du client",
hotel.hot_nom AS "Nom de l hotel",
reservation.res_date_debut AS "Date de début du séjour",
DATEDIFF(res_date_fin, res_date_debut) AS "Durée du séjour"
FROM client
JOIN reservation ON reservation.res_cli_id = client.cli_id
JOIN chambre ON chambre.cha_id = reservation.res_cha_id
JOIN hotel ON hotel.hot_id = chambre.cha_hot_id
-- LOT 3
-- ex13
SELECT COUNT(hotel.hot_id) AS "Nombre d hotel",
station.sta_nom AS "Nom de la station"
FROM hotel
JOIN station ON station.sta_id  = hotel.hot_sta_id 
GROUP BY station.sta_nom;
-- ex14
SELECT station.sta_nom AS "Nom de la station",
COUNT(chambre.cha_id) AS "Nombre de chambre"
FROM chambre
JOIN hotel ON hotel.hot_id = chambre.cha_hot_id
JOIN station ON station.sta_id = hotel.hot_sta_id
GROUP BY station.sta_nom;
-- ex15
SELECT station.sta_nom AS "Nom de la station",
COUNT(chambre.cha_id) AS "Nombre de chambre"
FROM chambre
JOIN hotel ON hotel.hot_id = chambre.cha_hot_id
JOIN station ON station.sta_id = hotel.hot_sta_id
WHERE chambre.cha_capacite > 1
GROUP BY station.sta_nom;
-- ex16
SELECT hotel.hot_nom AS "Liste des hotels où Mr Squire a réservé"
FROM hotel
JOIN chambre ON chambre.cha_hot_id = hotel.hot_id
JOIN reservation ON reservation.res_cha_id = chambre.cha_id
JOIN client ON client.cli_id = reservation.res_cli_id
WHERE client.cli_nom = "Squire";
-- ex17
SELECT station.sta_nom AS "Nom de la station",
AVG(DATEDIFF(res_date_fin, res_date_debut)) AS "Durée moyenne des réservations"
FROM station
JOIN hotel ON hotel.hot_sta_id = station.sta_id
JOIN chambre ON chambre.cha_hot_id = hotel.hot_id
JOIN reservation ON reservation.res_cha_id = chambre.cha_id
GROUP BY station.sta_nom;