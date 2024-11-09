-- customer_lifetime_value.sql
-- Requêtes pour calculer la valeur à vie des clients

-- Valeur totale des ventes par client
SELECT Clients.nom, Clients.email, SUM(Ventes.montant) AS valeur_totale
FROM Clients
JOIN Ventes ON Clients.client_id = Ventes.client_id
GROUP BY Clients.client_id;

-- Valeur à vie estimée basée sur la fréquence d'achat et le montant moyen par vente
SELECT Clients.nom,
       AVG(DATEDIFF(lead(date_vente) OVER (PARTITION BY client_id ORDER BY date_vente), date_vente)) AS frequence_achat_moyenne,
       AVG(Ventes.montant) AS montant_moyen,
       (AVG(Ventes.montant) * COUNT(Ventes.vente_id)) AS clv_estime
FROM Clients
JOIN Ventes ON Clients.client_id = Ventes.client_id
GROUP BY Clients.client_id;
