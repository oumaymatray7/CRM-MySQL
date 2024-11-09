-- team_performance.sql
-- Requêtes pour analyser la performance de l’équipe de support

-- Nombre de tickets traités par agent de support
SELECT agent_id, COUNT(ticket_id) AS tickets_traite
FROM Tickets_Support
WHERE statut = 'fermé'
GROUP BY agent_id;

-- Temps de résolution moyen par agent
SELECT agent_id, AVG(DATEDIFF(date_fermeture, date_ticket)) AS duree_moyenne_resolution
FROM Tickets_Support
WHERE statut = 'fermé' AND date_fermeture IS NOT NULL
GROUP BY agent_id;

-- Taux de satisfaction moyen par agent (si une enquête de satisfaction est disponible)
SELECT agent_id, AVG(note_satisfaction) AS satisfaction_moyenne
FROM Feedbacks
WHERE ticket_id IS NOT NULL
GROUP BY agent_id;
