-- top_customers.sql
-- Requêtes pour identifier les clients principaux

-- Clients ayant le plus gros chiffre d'affaires
SELECT Clients.nom, SUM(Ventes.montant) AS total_depenses
FROM Clients
JOIN Ventes ON Clients.client_id = Ventes.client_id
GROUP BY Clients.client_id
ORDER BY total_depenses DESC
LIMIT 10;

-- Clients les plus fréquents (en termes de nombre d'achats)
SELECT Clients.nom, COUNT(Ventes.vente_id) AS nombre_achats
FROM Clients
JOIN Ventes ON Clients.client_id = Ventes.client_id
GROUP BY Clients.client_id
ORDER BY nombre_achats DESC
LIMIT 10;

-- Clients fidèles ayant fait un achat chaque mois dans l'année en cours
SELECT Clients.nom, COUNT(DISTINCT DATE_FORMAT(Ventes.date_vente, '%Y-%m')) AS mois_achats
FROM Clients
JOIN Ventes ON Clients.client_id = Ventes.client_id
WHERE YEAR(Ventes.date_vente) = YEAR(CURDATE())
GROUP BY Clients.client_id
HAVING mois_achats = 12;
