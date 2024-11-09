-- roi_analysis.sql
-- Requêtes pour analyser le retour sur investissement des campagnes

-- ROI de chaque campagne (revenu - coût de la campagne)
SELECT Campagnes.nom_campagne, SUM(Ventes.montant) AS revenu_genere, Campagnes.cout,
       (SUM(Ventes.montant) - Campagnes.cout) AS profit,
       ((SUM(Ventes.montant) - Campagnes.cout) / Campagnes.cout) * 100 AS ROI
FROM Campagnes
JOIN Ventes ON Campagnes.campagne_id = Ventes.campagne_id
GROUP BY Campagnes.nom_campagne;

-- Coût par client acquis par campagne
SELECT Campagnes.nom_campagne, Campagnes.cout, COUNT(DISTINCT Ventes.client_id) AS clients_acquis,
       (Campagnes.cout / COUNT(DISTINCT Ventes.client_id)) AS cout_par_client
FROM Campagnes
JOIN Ventes ON Campagnes.campagne_id = Ventes.campagne_id
GROUP BY Campagnes.nom_campagne;
