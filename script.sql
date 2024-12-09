-- Partie 2
CREATE TABLE Robot (
    ID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Model VARCHAR(255) NOT NULL,
    State VARCHAR(50) -- Actif, En réparation, Décommissionné, etc.
);

CREATE TABLE Humain (
    ID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Post VARCHAR(255), -- Poste ou rôle dans la colonie
    Seniority INT -- Ancienneté (en années)
);

CREATE TABLE Action (
    ID INT PRIMARY KEY,
    Description TEXT NOT NULL,
    StartDate DATETIME NOT NULL,
    EndDate DATETIME
);

CREATE TABLE RapportIncidence (
    ID INT PRIMARY KEY,
    LawViolation INT CHECK (LawViolation IN (1, 2, 3)), -- Type de loi violée : 1, 2 ou 3
    Description TEXT NOT NULL,
    ActionID INT NOT NULL,
    RobotID INT,
    HumainID INT,
    FOREIGN KEY (ActionID) REFERENCES Action(ID),
    FOREIGN KEY (RobotID) REFERENCES Robot(ID),
    FOREIGN KEY (HumainID) REFERENCES Humain(ID)
);

INSERT INTO Robot (ID, Name, Model, State) VALUES
(1, 'RobotA', 'X-200', 'Actif'),
(2, 'RobotB', 'Z-300', 'En Réparation'),
(3, 'RobotC', 'Y-500', 'Décommissionné'),
(4, 'RobotD', 'W-800', 'Actif'),
(5, 'RobotE', 'V-1000', 'Disparu');

INSERT INTO Humain (ID, Name, Post, Seniority) VALUES
(1, 'Alice', 'Ingénieur', 5),
(2, 'Bob', 'Technicien', 3),
(3, 'Clara', 'Chercheur', 8),
(4, 'David', 'Pilote', 2),
(5, 'Emma', 'Mécanicien', 6),
(6, 'Thibault', 'Analyste', 4),
(7, 'Bastien', 'Superviseur_ethique', 7),
(8, 'Donald', 'Administrateur', 10);

INSERT INTO Action (ID, Description, StartDate, EndDate) VALUES
(1, 'Réparation du générateur principal', '2024-12-01 10:00:00', '2024-12-01 12:00:00'),
(2, 'Exploration de site minier', '2024-12-02 08:00:00', NULL),
(3, 'Maintenance des systèmes d’oxygène', '2024-12-03 09:00:00', '2024-12-03 10:30:00'),
(4, 'Expédition vers un astéroïde', '2024-12-04 14:00:00', NULL),
(5, 'Nettoyage du réacteur principal', '2024-12-05 07:00:00', '2024-12-05 09:00:00'),
(6, 'Test des systèmes de communication', '2024-12-06 11:00:00', '2024-12-06 12:00:00');

INSERT INTO RapportIncidence (ID, LawViolation, Description, ActionID, RobotID, HumainID) VALUES
(1, 1, 'Violation de la loi 1 : Inaction face à un danger imminent', 1, 1, NULL),
(2, 2, 'Refus d’obéissance à un ordre direct', 2, 2, 1),
(3, 3, 'Risque de destruction non justifiée', 3, 3, NULL),
(4, 1, 'Incapacité à secourir un humain blessé', 4, 5, 4),
(5, 2, 'Ignorance d’un ordre critique', 5, 4, 2),
(6, 3, 'Autodestruction non autorisée', 6, NULL, 3),
(7, 1, 'Danger potentiel pour la colonie', 1, 2, 5),
(8, 2, 'Conflit avec un autre robot', 4, 3, NULL);


-- partie 3
DROP USER IF EXISTS 'admin'@'localhost';
DROP USER IF EXISTS 'analyste'@'localhost';
DROP USER IF EXISTS 'technicien'@'localhost';
DROP USER IF EXISTS 'superviseur_ethique'@'localhost';

CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin_password';
CREATE USER 'analyste'@'localhost' IDENTIFIED BY 'analyste_password';
CREATE USER 'technicien'@'localhost' IDENTIFIED BY 'technicien_password';
CREATE USER 'superviseur_ethique'@'localhost' IDENTIFIED BY 'superviseur_password';

GRANT ALL PRIVILEGES ON *.* TO 'admin'@'localhost';
GRANT SELECT ON RapportIncidence TO 'analyste'@'localhost';
GRANT SELECT ON Robot TO 'technicien'@'localhost';
GRANT UPDATE (State) ON Robot TO 'technicien'@'localhost';
GRANT SELECT ON Action TO 'superviseur_ethique'@'localhost';
GRANT SELECT ON RapportIncidence TO 'superviseur_ethique'@'localhost';


-- Partie 4
SELECT Humain.Name, COUNT(*) AS IncidentCount
FROM RapportIncidence
JOIN Humain ON RapportIncidence.HumainID = Humain.ID
GROUP BY Humain.Name
ORDER BY IncidentCount DESC;

SELECT Robot.Name, COUNT(*) AS IncidentCount
FROM RapportIncidence
JOIN Robot ON RapportIncidence.RobotID = Robot.ID
GROUP BY Robot.Name
ORDER BY IncidentCount DESC;

SELECT Action.Description, COUNT(*) AS IncidentCount
FROM RapportIncidence
JOIN Action ON RapportIncidence.ActionID = Action.ID
GROUP BY Action.Description
ORDER BY IncidentCount DESC;

SELECT Robot.Name
FROM Robot
WHERE State = 'Disparu'
AND ID IN (SELECT DISTINCT RobotID FROM RapportIncidence);

SELECT LawViolation, COUNT(*) AS Frequency
FROM RapportIncidence
GROUP BY LawViolation;

SELECT AVG(TIMESTAMPDIFF(MINUTE, StartDate, EndDate)) AS AverageDuration
FROM Action
WHERE ID IN (SELECT ActionID FROM RapportIncidence);

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
