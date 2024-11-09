-- campaign_tracking.sql
-- Requêtes pour le suivi des campagnes marketing

-- Nombre de clients acquis par campagne
SELECT Campagnes.nom_campagne, COUNT(DISTINCT Ventes.client_id) AS clients_acquis
FROM Campagnes
JOIN Ventes ON Campagnes.campagne_id = Ventes.campagne_id
GROUP BY Campagnes.nom_campagne;

-- Revenus générés par chaque campagne
SELECT Campagnes.nom_campagne, SUM(Ventes.montant) AS total_revenu
FROM Campagnes
JOIN Ventes ON Campagnes.campagne_id = Ventes.campagne_id
GROUP BY Campagnes.nom_campagne;

-- Moyenne des ventes par client acquis par campagne
SELECT Campagnes.nom_campagne, AVG(Ventes.montant) AS moyenne_ventes_par_client
FROM Campagnes
JOIN Ventes ON Campagnes.campagne_id = Ventes.campagne_id
GROUP BY Campagnes.nom_campagne;
