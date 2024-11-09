-- client_interactions.sql
-- Requêtes pour gérer les interactions client

-- Ajouter une nouvelle interaction pour un client
INSERT INTO Contacts (client_id, date_interaction, type_interaction, commentaire) VALUES (1, '2024-11-05', 'email', 'Envoi de documentation de mise à jour.');

-- Afficher toutes les interactions pour un client spécifique
SELECT * FROM Contacts WHERE client_id = 1 ORDER BY date_interaction DESC;

-- Afficher les interactions récentes (5 dernières) d'un client
SELECT * FROM Contacts WHERE client_id = 1 ORDER BY date_interaction DESC LIMIT 5;

