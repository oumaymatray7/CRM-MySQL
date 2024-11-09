-- client_segments.sql
-- Requêtes pour segmenter les clients

-- Segmenter les clients par niveau de dépenses (Or, Argent, Bronze)
SELECT Clients.nom,
       CASE 
           WHEN SUM(Ventes.montant) < 100 THEN 'Bronze'
           WHEN SUM(Ventes.montant) BETWEEN 100 AND 500 THEN 'Argent'
           ELSE 'Or'
       END AS categorie_client
FROM Clients
JOIN Ventes ON Clients.client_id = Ventes.client_id
GROUP BY Clients.client_id;

-- Identifier les clients inactifs (aucune interaction dans les 6 derniers mois)
SELECT Clients.nom, Clients.email
FROM Clients
LEFT JOIN Contacts ON Clients.client_id = Contacts.client_id
WHERE Contacts.date_interaction < DATE_SUB(CURDATE(), INTERVAL 6 MONTH);
