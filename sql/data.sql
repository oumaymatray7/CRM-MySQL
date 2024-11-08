-- Données d'exemple pour la table Clients
INSERT INTO Clients (nom, email, telephone, adresse) VALUES
('Jean Dupont', 'jean.dupont@gmail.com', '0601234567', '12 Rue de Paris, Paris'),
('Marie Lefèvre', 'marie.lefevre@yahoo.fr', '0609876543', '34 Avenue de Lyon, Lyon'),
('Paul Martin', 'paul.martin@outlook.fr', '0600001111', '56 Boulevard Sud, Marseille'),
('Sophie Durand', 'sophie.durand@wanadoo.fr', '0654321098', '78 Rue Verte, Lille');

-- Données d'exemple pour la table Produits
INSERT INTO Produits (nom_produit, prix) VALUES
('Logiciel CRM Pro', 199.99),
('Service Cloud', 99.99),
('Pack Marketing', 149.99),
('Formation en ligne', 49.99);

-- Données d'exemple pour la table Contacts
INSERT INTO Contacts (client_id, date_interaction, type_interaction, commentaire) VALUES
(1, '2024-10-05', 'appel', 'Présentation de l\'offre CRM'),
(1, '2024-10-10', 'email', 'Envoi de documentation'),
(2, '2024-10-15', 'réunion', 'Discussion sur les besoins du client'),
(3, '2024-10-18', 'appel', 'Appel de suivi'),
(4, '2024-10-20', 'email', 'Réponse aux questions techniques');

-- Données d'exemple pour la table Ventes
INSERT INTO Ventes (client_id, produit_id, date_vente, montant) VALUES
(1, 1, '2024-10-11', 199.99),
(2, 2, '2024-10-16', 99.99),
(3, 3, '2024-10-19', 149.99),
(4, 4, '2024-10-21', 49.99);

-- Données d'exemple pour la table Tickets_Support
INSERT INTO Tickets_Support (client_id, date_ticket, statut, priorite, description) VALUES
(1, '2024-10-12', 'ouvert', 'moyenne', 'Problème avec la configuration initiale'),
(2, '2024-10-17', 'en cours', 'haute', 'Assistance pour l\'intégration avec ERP'),
(3, '2024-10-20', 'fermé', 'faible', 'Demande d\'informations supplémentaires'),
(4, '2024-10-22', 'ouvert', 'moyenne', 'Difficulté à accéder aux rapports');
