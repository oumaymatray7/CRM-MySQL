-- revenue_reports.sql
-- Requêtes pour les rapports de revenu

-- Chiffre d'affaires total par client
SELECT Clients.nom, SUM(Ventes.montant) AS total_depenses
FROM Clients
JOIN Ventes ON Clients.client_id = Ventes.client_id
GROUP BY Clients.client_id
ORDER BY total_depenses DESC;

-- Chiffre d'affaires par produit
SELECT Produits.nom_produit, SUM(Ventes.montant) AS chiffre_affaires
FROM Produits
JOIN Ventes ON Produits.produit_id = Ventes.produit_id
GROUP BY Produits.produit_id
ORDER BY chiffre_affaires DESC;

-- Chiffre d'affaires mensuel
SELECT DATE_FORMAT(date_vente, '%Y-%m') AS mois, SUM(montant) AS chiffre_affaires_mensuel
FROM Ventes
GROUP BY mois
ORDER BY mois DESC;
