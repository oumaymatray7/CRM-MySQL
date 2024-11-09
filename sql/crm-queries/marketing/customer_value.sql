-- customer_value.sql
-- Requêtes pour évaluer la valeur des clients

-- Segmenter les clients en fonction de la valeur des achats (Or, Argent, Bronze)
SELECT Clients.nom,
       CASE 
           WHEN SUM(Ventes.montant) < 100 THEN 'Bronze'
           WHEN SUM(Ventes.montant) BETWEEN 100 AND 500 THEN 'Argent'
           ELSE 'Or'
       END AS categorie_client
FROM Clients
JOIN Ventes ON Clients.client_id = Ventes.client_id
GROUP BY Clients.client_id;

-- Clients avec le montant total d'achat le plus élevé
SELECT Clients.nom, SUM(Ventes.montant) AS total_depenses
FROM Clients
JOIN Ventes ON Clients.client_id = Ventes.client_id
GROUP BY Clients.client_id
ORDER BY total_depenses DESC
LIMIT 10;

-- Fréquence moyenne d'achat par client
SELECT Clients.nom, 
       AVG(DATEDIFF(lead(date_vente) OVER (PARTITION BY client_id ORDER BY date_vente), date_vente)) AS frequence_achat_moyenne
FROM Clients
JOIN Ventes ON Clients.client_id = Ventes.client_id
GROUP BY Clients.client_id;

