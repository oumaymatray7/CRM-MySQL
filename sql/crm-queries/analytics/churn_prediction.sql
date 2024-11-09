-- churn_prediction.sql
-- Requêtes pour identifier les clients à risque de churn

-- Clients sans achat au cours des 6 derniers mois
SELECT Clients.nom, Clients.email
FROM Clients
LEFT JOIN Ventes ON Clients.client_id = Ventes.client_id
WHERE Ventes.date_vente < DATE_SUB(CURDATE(), INTERVAL 6 MONTH) OR Ventes.date_vente IS NULL;

-- Clients avec peu d'interactions récentes (moins de 2 interactions dans les 3 derniers mois)
SELECT Clients.nom, COUNT(Contacts.contact_id) AS nombre_interactions
FROM Clients
JOIN Contacts ON Clients.client_id = Contacts.client_id
WHERE Contacts.date_interaction >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH)
GROUP BY Clients.client_id
HAVING nombre_interactions < 2;

-- Classement des clients par risque d'attrition basé sur des critères de fréquence d'achat et d'interactions
SELECT Clients.nom,
       DATEDIFF(CURDATE(), MAX(Ventes.date_vente)) AS jours_depuis_dernier_achat,
       COUNT(Contacts.contact_id) AS nombre_interactions
FROM Clients
LEFT JOIN Ventes ON Clients.client_id = Ventes.client_id
LEFT JOIN Contacts ON Clients.client_id = Contacts.client_id
GROUP BY Clients.client_id
HAVING jours_depuis_dernier_achat > 180 OR nombre_interactions < 2;
