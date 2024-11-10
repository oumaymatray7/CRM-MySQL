-- retention_analysis.sql
-- Requêtes pour analyser la fidélisation des clients

-- Taux de retour des clients (clients ayant fait plus d'un achat)
SELECT (COUNT(DISTINCT Clients.client_id) / COUNT(Clients.client_id)) * 100 AS taux_retour
FROM Clients
JOIN Ventes ON Clients.client_id = Ventes.client_id
GROUP BY Clients.client_id
HAVING COUNT(Ventes.vente_id) > 1;

-- Temps moyen entre deux achats pour chaque client
SELECT Clients.nom, AVG(DATEDIFF(lead(date_vente) OVER (PARTITION BY Clients.client_id ORDER BY date_vente), date_vente)) AS temps_moyen_entre_achats
FROM Clients
JOIN Ventes ON Clients.client_id = Ventes.client_id
GROUP BY Clients.client_id;

-- Identification des clients fidèles (clients ayant plus de 5 achats)
SELECT Clients.nom, COUNT(Ventes.vente_id) AS nombre_achats
FROM Clients
JOIN Ventes ON Clients.client_id = Ventes.client_id
GROUP BY Clients.client_id
HAVING nombre_achats > 5;
