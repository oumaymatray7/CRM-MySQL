-- support_tickets.sql
-- Requêtes CRUD pour la gestion des tickets de support

-- Créer un nouveau ticket de support pour un client
INSERT INTO Tickets_Support (client_id, date_ticket, statut, priorite, description) 
VALUES (1, '2024-11-07', 'ouvert', 'haute', 'Problème avec l\');

-- Afficher tous les tickets de support d’un client spécifique
SELECT * FROM Tickets_Support WHERE client_id = 1 ORDER BY date_ticket DESC;

-- Mettre à jour le statut d’un ticket
UPDATE Tickets_Support SET statut = 'fermé' WHERE ticket_id = 1;

-- Supprimer un ticket de support
DELETE FROM Tickets_Support WHERE ticket_id = 1;
