-- sales_management.sql
-- Requêtes CRUD pour la gestion des ventes

-- Ajouter une nouvelle vente
INSERT INTO Ventes (client_id, produit_id, date_vente, montant) 
VALUES (1, 2, '2024-11-06', 99.99);

-- Afficher toutes les ventes d’un client spécifique
SELECT * FROM Ventes WHERE client_id = 1;

-- Mettre à jour le montant d’une vente
UPDATE Ventes SET montant = 109.99 WHERE vente_id = 1;

-- Supprimer une vente
DELETE FROM Ventes WHERE vente_id = 1;
