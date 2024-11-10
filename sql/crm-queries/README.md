# CRM SQL Queries

Ce projet contient un ensemble de requêtes SQL utilisées couramment dans les systèmes de CRM (Customer Relationship Management). Les requêtes sont organisées par fonctionnalité pour faciliter l’analyse, la gestion, et l’optimisation de la relation client.

## Structure des Dossiers

- `clients/` : Requêtes pour gérer les informations client, suivre les interactions et segmenter les clients.
- `ventes/` : Requêtes pour gérer les ventes, suivre les performances des produits, et analyser les revenus.
- `support/` : Requêtes pour le suivi des tickets de support client et l’analyse des performances de l’équipe de support.
- `marketing/` : Requêtes pour suivre l’efficacité des campagnes marketing et analyser la fidélisation client.
- `analytics/` : Requêtes pour des analyses avancées telles que la valeur à vie des clients et la prédiction du churn.
## Diagramme de la Base de Données

Voici la structure de la base de données utilisée dans le projet CRM :

![Diagramme de la Base de Données](sql\doc\diagramme.png)

## Exemples d’Utilisation

### Gestion des Clients
Le fichier `clients/client_management.sql` contient des requêtes pour ajouter, mettre à jour, et supprimer des clients.

```sql
-- Ajouter un nouveau client
INSERT INTO Clients (nom, email, telephone, adresse) 
VALUES ('Alice Robert', 'alice.robert@example.com', '0612345678', '123 Rue de Lille, Lille');
