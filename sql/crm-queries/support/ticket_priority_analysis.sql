-- ticket_priority_analysis.sql
-- Requêtes pour analyser les priorités des tickets de support

-- Nombre de tickets par niveau de priorité
SELECT priorite, COUNT(ticket_id) AS nombre_tickets
FROM Tickets_Support
GROUP BY priorite;

-- Temps moyen de résolution par niveau de priorité
SELECT priorite, AVG(DATEDIFF(date_fermeture, date_ticket)) AS duree_moyenne_resolution
FROM Tickets_Support
WHERE statut = 'fermé' AND date_fermeture IS NOT NULL
GROUP BY priorite;

-- Tickets prioritaires (haute priorité) non résolus
SELECT * FROM Tickets_Support
WHERE priorite = 'haute' AND statut != 'fermé'
ORDER BY date_ticket;
