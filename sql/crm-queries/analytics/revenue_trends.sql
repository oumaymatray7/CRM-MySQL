-- revenue_trends.sql
-- Requêtes pour analyser les tendances de revenu

-- Tendance mensuelle des ventes
SELECT DATE_FORMAT(Ventes.date_vente, '%Y-%m') AS mois, SUM(Ventes.montant) AS total_ventes
FROM Ventes
GROUP BY mois
ORDER BY mois;

-- Tendance trimestrielle des ventes
SELECT CONCAT(YEAR(Ventes.date_vente), '-T', QUARTER(Ventes.date_vente)) AS trimestre, SUM(Ventes.montant) AS total_ventes
FROM Ventes
GROUP BY trimestre
ORDER BY trimestre;

-- Tendance annuelle des ventes
SELECT YEAR(Ventes.date_vente) AS annee, SUM(Ventes.montant) AS total_ventes
FROM Ventes
GROUP BY annee
ORDER BY annee;
