-- client_management.sql
-- Requêtes CRUD pour gérer les informations des clients

-- Créer un nouveau client
INSERT INTO Clients (nom, email, telephone, adresse) 
VALUES ('Alice Robert', 'alice.robert@example.com', '0612345678', '123 Rue de Lille, Lille');

-- Afficher les informations d'un client spécifique
SELECT * FROM Clients WHERE client_id = 1;

-- Mettre à jour les informations d'un client
UPDATE Clients 
SET email = 'alice.newemail@example.com' 
WHERE client_id = 1;

-- Supprimer un client
DELETE FROM Clients WHERE client_id = 1;
