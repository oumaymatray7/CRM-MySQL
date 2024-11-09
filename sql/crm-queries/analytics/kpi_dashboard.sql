-- kpi_dashboard.sql
-- Requêtes pour générer un tableau de bord des KPI

-- Taux de rétention des clients (clients ayant fait plus d'un achat)
SELECT (COUNT(DISTINCT Clients.client_id) / (SELECT COUNT(*) FROM Clients)) * 100 AS taux_retention
FROM Clients
JOIN Ventes ON Clients.client_id = Ventes.client_id
GROUP BY Clients.client_id
HAVING COUNT(Ventes.vente_id) > 1;

-- Taux de satisfaction des clients (basé sur des enquêtes ou des feedbacks)
SELECT AVG(note_satisfaction) AS satisfaction_moyenne
FROM Feedbacks;

-- Taux de résolution des tickets de support
SELECT (COUNT(CASE WHEN statut = 'fermé' THEN 1 END) / COUNT(*)) * 100 AS taux_resolution
FROM Tickets_Support;
