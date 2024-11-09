-- resolution_reports.sql
-- Requêtes pour analyser le temps de résolution des tickets

-- Temps moyen de résolution des tickets
SELECT AVG(DATEDIFF(date_fermeture, date_ticket)) AS duree_moyenne_resolution
FROM Tickets_Support
WHERE statut = 'fermé' AND date_fermeture IS NOT NULL;

-- Détail des tickets avec un temps de résolution supérieur à la moyenne
SELECT ticket_id, client_id, date_ticket, date_fermeture, DATEDIFF(date_fermeture, date_ticket) AS duree_resolution
FROM Tickets_Support
WHERE statut = 'fermé' AND DATEDIFF(date_fermeture, date_ticket) > 
      (SELECT AVG(DATEDIFF(date_fermeture, date_ticket)) FROM Tickets_Support WHERE statut = 'fermé');

-- Temps de résolution par agent de support
SELECT agent_id, AVG(DATEDIFF(date_fermeture, date_ticket)) AS duree_moyenne_resolution
FROM Tickets_Support
WHERE statut = 'fermé' AND date_fermeture IS NOT NULL
GROUP BY agent_id;
