-- client_retention.sql
-- Requêtes pour analyser la fidélisation des clients

-- Calcul du taux de retour des clients (clients ayant fait plus d'un achat)
SELECT COUNT(DISTINCT Clients.client_id) AS clients_recurrents,
       COUNT(Clients.client_id) AS total_clients,
       (COUNT(DISTINCT Clients.client_id) / COUNT(Clients.client_id)) * 100 AS taux_retour
FROM Clients
JOIN Ventes ON Clients.client_id = Ventes.client_id
GROUP BY Clients.client_id
HAVING COUNT(Ventes.vente_id) > 1;

-- Temps moyen entre deux achats pour chaque client
SELECT client_id, AVG(interval_jours) AS temps_moyen_entre_achats
FROM (
    SELECT client_id,
           DATEDIFF(LEAD(date_vente) OVER (PARTITION BY client_id ORDER BY date_vente), date_vente) AS interval_jours
    FROM Ventes
) AS ventes_suivantes
WHERE interval_jours IS NOT NULL
GROUP BY client_id;

