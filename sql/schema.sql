CREATE DATABASE CRM;
-- Script pour créer les tables de la base de données CRM
USE CRM;

CREATE TABLE Clients (
    client_id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    telephone VARCHAR(20),
    adresse TEXT
);

CREATE TABLE Contacts (
    contact_id INT AUTO_INCREMENT PRIMARY KEY,
    client_id INT,
    date_interaction DATE NOT NULL,
    type_interaction ENUM('appel', 'email', 'réunion') NOT NULL,
    commentaire TEXT,
    FOREIGN KEY (client_id) REFERENCES Clients(client_id) ON DELETE CASCADE
);

CREATE TABLE Produits (
    produit_id INT AUTO_INCREMENT PRIMARY KEY,
    nom_produit VARCHAR(100) NOT NULL,
    prix DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Ventes (
    vente_id INT AUTO_INCREMENT PRIMARY KEY,
    client_id INT,
    produit_id INT,
    date_vente DATE NOT NULL,
    montant DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (client_id) REFERENCES Clients(client_id) ON DELETE SET NULL,
    FOREIGN KEY (produit_id) REFERENCES Produits(produit_id) ON DELETE SET NULL
);

CREATE TABLE Tickets_Support (
    ticket_id INT AUTO_INCREMENT PRIMARY KEY,
    client_id INT,
    date_ticket DATE NOT NULL,
    statut ENUM('ouvert', 'en cours', 'fermé') NOT NULL,
    priorite ENUM('faible', 'moyenne', 'haute') NOT NULL,
    description TEXT,
    FOREIGN KEY (client_id) REFERENCES Clients(client_id) ON DELETE SET NULL
);
