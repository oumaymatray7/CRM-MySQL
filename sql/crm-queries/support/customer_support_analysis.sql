-- customer_support_analysis.sql
-- Requêtes pour analyser les besoins de support par client

-- Clients avec le plus grand nombre de tickets de support
SELECT Clients.nom, COUNT(Tickets_Support.ticket_id) AS nombre_tickets
FROM Clients
JOIN Tickets_Support ON Clients.client_id = Tickets_Support.client_id
GROUP BY Clients.client_id
ORDER BY nombre_tickets DESC;

-- Délai moyen de résolution des tickets pour chaque client
SELECT Clients.nom, AVG(DATEDIFF(date_fermeture, date_ticket)) AS duree_moyenne_resolution
FROM Clients
JOIN Tickets_Support ON Clients.client_id = Tickets_Support.client_id
WHERE Tickets_Support.statut = 'fermé' AND date_fermeture IS NOT NULL
GROUP BY Clients.client_id;

-- Identification des clients ayant des tickets de support ouverts
SELECT Clients.nom, Clients.email, COUNT(Tickets_Support.ticket_id) AS tickets_ouverts
FROM Clients
JOIN Tickets_Support ON Clients.client_id = Tickets_Support.client_id
WHERE Tickets_Support.statut = 'ouvert'
GROUP BY Clients.client_id
HAVING tickets_ouverts > 0;
