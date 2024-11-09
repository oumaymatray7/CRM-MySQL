-- client_activity_report.sql
-- Générer un rapport d'activité complet pour un client

-- Rapport complet d'un client : interactions, ventes, tickets de support
SELECT 'Interaction' AS Type, date_interaction AS Date, type_interaction AS Detail 
FROM Contacts 
WHERE client_id = 1
UNION
SELECT 'Vente', date_vente, CONCAT('Achat de ', nom_produit) 
FROM Ventes 
JOIN Produits ON Ventes.produit_id = Produits.produit_id 
WHERE client_id = 1
UNION
SELECT 'Ticket', date_ticket, CONCAT(statut, ' - ', description)
FROM Tickets_Support 
WHERE client_id = 1
ORDER BY Date DESC;
