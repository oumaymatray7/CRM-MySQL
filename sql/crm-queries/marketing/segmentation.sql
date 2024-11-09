-- segmentation.sql
-- Requêtes pour la segmentation avancée des clients

-- Clients avec des achats fréquents (plus de 5 achats en 1 an)
SELECT Clients.nom, COUNT(Ventes.vente_id) AS nombre_achats_annuels
FROM Clients
JOIN Ventes ON Clients.client_id = Ventes.client_id
WHERE Ventes.date_vente >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
GROUP BY Clients.client_id
HAVING nombre_achats_annuels > 5;

-- Segmenter les clients par fréquence d'achat (Fréquent, Occasionnel, Rare)
SELECT Clients.nom,
       CASE 
           WHEN COUNT(Ventes.vente_id) > 10 THEN 'Fréquent'
           WHEN COUNT(Ventes.vente_id) BETWEEN 5 AND 10 THEN 'Occasionnel'
           ELSE 'Rare'
       END AS categorie_frequence
FROM Clients
JOIN Ventes ON Clients.client_id = Ventes.client_id
GROUP BY Clients.client_id;

-- Clients avec potentiel d'achat futur basé sur les segments de dépenses et de fréquence
SELECT Clients.nom, SUM(Ventes.montant) AS total_depenses,
       CASE 
           WHEN SUM(Ventes.montant) > 500 AND COUNT(Ventes.vente_id) > 10 THEN 'Potentiel élevé'
           WHEN SUM(Ventes.montant) BETWEEN 200 AND 500 THEN 'Potentiel moyen'
           ELSE 'Potentiel faible'
       END AS potentiel_achat
FROM Clients
JOIN Ventes ON Clients.client_id = Ventes.client_id
GROUP BY Clients.client_id;
