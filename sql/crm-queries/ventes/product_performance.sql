-- product_performance.sql
-- Requêtes pour analyser les performances des produits

-- Ventes totales par produit
SELECT Produits.nom_produit, COUNT(Ventes.vente_id) AS nombre_ventes
FROM Produits
JOIN Ventes ON Produits.produit_id = Ventes.produit_id
GROUP BY Produits.produit_id
ORDER BY nombre_ventes DESC;

-- Chiffre d'affaires généré par produit
SELECT Produits.nom_produit, SUM(Ventes.montant) AS chiffre_affaires
FROM Produits
JOIN Ventes ON Produits.produit_id = Ventes.produit_id
GROUP BY Produits.produit_id
ORDER BY chiffre_affaires DESC;

-- Produits avec le montant moyen par vente le plus élevé
SELECT Produits.nom_produit, AVG(Ventes.montant) AS montant_moyen_par_vente
FROM Produits
JOIN Ventes ON Produits.produit_id = Ventes.produit_id
GROUP BY Produits.produit_id
ORDER BY montant_moyen_par_vente DESC;
