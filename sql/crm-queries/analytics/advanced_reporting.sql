-- advanced_reporting.sql
-- Requêtes pour des rapports avancés

-- Taux de conversion des prospects en clients (nombre de prospects devenus clients)
SELECT COUNT(DISTINCT prospect_id) AS nombre_prospects, COUNT(DISTINCT client_id) AS nombre_clients,
       (COUNT(DISTINCT client_id) / COUNT(DISTINCT prospect_id)) * 100 AS taux_conversion
FROM Prospects
LEFT JOIN Clients ON Prospects.prospect_id = Clients.prospect_id;

-- Analyse de rentabilité par campagne marketing (coût de la campagne vs revenu généré)
SELECT Campagnes.nom_campagne, SUM(Ventes.montant) AS revenu_genere, Campagnes.cout,
       (SUM(Ventes.montant) - Campagnes.cout) AS profit
FROM Campagnes
JOIN Ventes ON Campagnes.campagne_id = Ventes.campagne_id
GROUP BY Campagnes.nom_campagne;

-- Résumé de la performance des ventes par période (exemple : mensuel)
SELECT DATE_FORMAT(Ventes.date_vente, '%Y-%m') AS mois, SUM(Ventes.montant) AS total_ventes, COUNT(Ventes.vente_id) AS nombre_ventes
FROM Ventes
GROUP BY mois
ORDER BY mois DESC;
