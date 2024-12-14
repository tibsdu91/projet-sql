
--  liste des humains ayant le plus grand nombre d'incidents, classés par ordre décroissant.
SELECT Humain.Name, COUNT(*) AS IncidentCount
FROM RapportIncidence
JOIN Humain ON RapportIncidence.HumainID = Humain.ID
GROUP BY Humain.Name
ORDER BY IncidentCount DESC;

-- liste des robots ayant le plus grand nombre d'incidents, classés par ordre décroissant.
SELECT Robot.Name, COUNT(*) AS IncidentCount
FROM RapportIncidence
JOIN Robot ON RapportIncidence.RobotID = Robot.ID
GROUP BY Robot.Name
ORDER BY IncidentCount DESC;

 -- Permet de connaître quelle action a entraîné le plus grand nombre d'incidents, en la classant de manière décroissante.
SELECT Action.Description, COUNT(*) AS IncidentCount
FROM RapportIncidence
JOIN Action ON RapportIncidence.ActionID = Action.ID
GROUP BY Action.Description
ORDER BY IncidentCount DESC;

-- lise tous les robots disparus qui ont été associés à un incident dans la base de données.
SELECT Robot.Name
FROM Robot
WHERE State = 'Disparu'
AND ID IN (SELECT DISTINCT RobotID FROM RapportIncidence);

-- donne un compte de chaque type de violation de la loi à partir des incidents enregistrés

SELECT LawViolation, COUNT(*) AS Frequency
FROM RapportIncidence
GROUP BY LawViolation;

-- calcule du temps moyen de la requette
SELECT AVG(TIMESTAMPDIFF(MINUTE, StartDate, EndDate)) AS AverageDuration
FROM Action
WHERE ID IN (SELECT ActionID FROM RapportIncidence);

-- index pour reduire le temps de recherche dans les colonnes
CREATE INDEX idx_RobotID ON RapportIncidence(RobotID);
CREATE INDEX idx_HumainID ON RapportIncidence(HumainID);
CREATE INDEX idx_ActionID ON RapportIncidence(ActionID);


-- Partie 5 
CREATE VIEW VueIncidences AS
SELECT Action.Description, COUNT(*) AS IncidentCount
FROM RapportIncidence
JOIN Action ON RapportIncidence.ActionID = Action.ID
GROUP BY Action.Description;

SELECT * FROM VueIncidences
ORDER BY IncidentCount DESC;