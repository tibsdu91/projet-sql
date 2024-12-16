DROP DATABASE IF EXISTS sql_project;

create database sql_project;
use sql_project;


-- creation des tables de la base de donnée

CREATE TABLE Robot (
    ID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Model VARCHAR(255) NOT NULL,
    State VARCHAR(50) -- Actif, en réparation, décommissionné, etc.
);

CREATE TABLE Humain (
    ID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Post VARCHAR(255), -- Rôle dans la colonie
    Seniority INT -- l'ancienneté en année
);

CREATE TABLE Action (
    ID INT PRIMARY KEY,
    Description TEXT NOT NULL,
    StartDate DATETIME NOT NULL,
    EndDate DATETIME
);

CREATE TABLE RapportIncidence (
    ID INT PRIMARY KEY,
    LawViolation INT CHECK (LawViolation IN (1, 2, 3)), -- type de loi violée : 1, 2 ou 3
    Description TEXT NOT NULL,
    ActionID INT NOT NULL,
    RobotID INT,
    HumainID INT,
    FOREIGN KEY (ActionID) REFERENCES Action(ID),
    FOREIGN KEY (RobotID) REFERENCES Robot(ID),
    FOREIGN KEY (HumainID) REFERENCES Humain(ID)
);

-- insertion des données
INSERT INTO Robot (ID, Name, Model, State) VALUES
(1, 'RoboX', 'Model-X100', 'Actif'),
(2, 'TechnoBot', 'Model-T200', 'En réparation'),
(3, 'AlphaRobo', 'Model-A300', 'Actif'),
(4, 'BetaRobo', 'Model-B400', 'Décommissionné'),
(5, 'GammaBot', 'Model-G500', 'Disparu'),
(6, 'DeltaBot', 'Model-D600', 'Actif'),
(7, 'EchoRobo', 'Model-E700', 'Décommissionné'),
(8, 'ZetaBot', 'Model-Z800', 'Actif'),
(9, 'OmegaRobo', 'Model-O900', 'En réparation'),
(10, 'SigmaBot', 'Model-S1000', 'Disparu'),
(11, 'LunaBot', 'Model-L1100', 'Actif'),
(12, 'VegaRobo', 'Model-V1200', 'En réparation'),
(13, 'AuroraBot', 'Model-A1300', 'Actif'),
(14, 'NovaBot', 'Model-N1400', 'Disparu'),
(15, 'PlutoBot', 'Model-P1500', 'Actif'),
(16, 'MercuryBot', 'Model-M1600', 'En réparation'),
(17, 'MarsRobo', 'Model-M1700', 'Actif'),
(18, 'JupiterBot', 'Model-J1800', 'Décommissionné'),
(19, 'SaturnBot', 'Model-S1900', 'Actif'),
(20, 'NeptuneRobo', 'Model-N2000', 'En réparation'),
(21, 'TitanBot', 'Model-T2100', 'Actif'),
(22, 'ArtemisBot', 'Model-A2200', 'Actif'),
(23, 'ApolloRobo', 'Model-A2300', 'Disparu'),
(24, 'HeraBot', 'Model-H2400', 'Actif'),
(25, 'AthenaRobo', 'Model-A2500', 'Décommissionné'),
(26, 'ZeusBot', 'Model-Z2600', 'Actif'),
(27, 'HermesRobo', 'Model-H2700', 'En réparation'),
(28, 'PoseidonBot', 'Model-P2800', 'Actif'),
(29, 'AresBot', 'Model-A2900', 'Disparu'),
(30, 'HephaestusRobo', 'Model-H3000', 'Actif'),
(31, 'HestiaBot', 'Model-H3100', 'Actif'),
(32, 'ErosBot', 'Model-E3200', 'En réparation'),
(33, 'GaiaRobo', 'Model-G3300', 'Actif'),
(34, 'RheaBot', 'Model-R3400', 'En réparation'),
(35, 'CronusBot', 'Model-C3500', 'Actif'),
(36, 'SeleneRobo', 'Model-S3600', 'Actif'),
(37, 'AtlasBot', 'Model-A3700', 'Décommissionné'),
(38, 'PandoraRobo', 'Model-P3800', 'Disparu'),
(39, 'PrometheusBot', 'Model-P3900', 'Actif'),
(40, 'OrpheusBot', 'Model-O4000', 'Actif'),
(41, 'ChironBot', 'Model-C4100', 'En réparation'),
(42, 'HadesRobo', 'Model-H4200', 'Actif'),
(43, 'PerseusBot', 'Model-P4300', 'Décommissionné'),
(44, 'ElysiumBot', 'Model-E4400', 'Actif'),
(45, 'ThemisBot', 'Model-T4500', 'En réparation'),
(46, 'CerberusRobo', 'Model-C4600', 'Actif'),
(47, 'IcarusBot', 'Model-I4700', 'Actif'),
(48, 'HeliosRobo', 'Model-H4800', 'Disparu'),
(49, 'PhaetonBot', 'Model-P4900', 'Actif'),
(50, 'CharonRobo', 'Model-C5000', 'En réparation'),
(51, 'DionysusBot', 'Model-D5100', 'Actif'),
(52, 'LachesisRobo', 'Model-L5200', 'Actif'),
(53, 'ClothoBot', 'Model-C5300', 'Décommissionné'),
(54, 'AtroposRobo', 'Model-A5400', 'Actif'),
(55, 'TantalusBot', 'Model-T5500', 'En réparation'),
(56, 'SisyphusRobo', 'Model-S5600', 'Actif'),
(57, 'HyperionBot', 'Model-H5700', 'Actif'),
(58, 'EpimetheusBot', 'Model-E5800', 'Disparu'),
(59, 'PrometheusBot', 'Model-P5900', 'Actif'),
(60, 'EosBot', 'Model-E6000', 'En réparation'),
(61, 'NyxRobo', 'Model-N6100', 'Actif'),
(62, 'MorosBot', 'Model-M6200', 'Actif'),
(63, 'ThanatosBot', 'Model-T6300', 'En réparation'),
(64, 'HypnosRobo', 'Model-H6400', 'Actif'),
(65, 'NemesisBot', 'Model-N6500', 'Décommissionné'),
(66, 'TycheRobo', 'Model-T6600', 'Actif'),
(67, 'HecateBot', 'Model-H6700', 'En réparation'),
(68, 'AeolusRobo', 'Model-A6800', 'Actif'),
(69, 'BoreasBot', 'Model-B6900', 'Actif'),
(70, 'NotusBot', 'Model-N7000', 'Disparu'),
(71, 'ZephyrusRobo', 'Model-Z7100', 'Actif'),
(72, 'HermesBot', 'Model-H7200', 'En réparation'),
(73, 'ArionRobo', 'Model-A7300', 'Actif'),
(74, 'MorpheusBot', 'Model-M7400', 'Actif'),
(75, 'AetherRobo', 'Model-A7500', 'Décommissionné'),
(76, 'UranusBot', 'Model-U7600', 'Actif'),
(77, 'GaiaRobo', 'Model-G7700', 'En réparation'),
(78, 'OuranosBot', 'Model-O7800', 'Actif'),
(79, 'CronusRobo', 'Model-C7900', 'Actif'),
(80, 'TitanRobo', 'Model-T8000', 'En réparation'),
(81, 'HypatiaBot', 'Model-H8100', 'Actif'),
(82, 'AnankeBot', 'Model-A8200', 'Actif'),
(83, 'CalypsoBot', 'Model-C8300', 'Décommissionné'),
(84, 'ElaraRobo', 'Model-E8400', 'Actif'),
(85, 'PandoraBot', 'Model-P8500', 'En réparation'),
(86, 'ThemisBot', 'Model-T8600', 'Actif'),
(87, 'ChironRobo', 'Model-C8700', 'Décommissionné'),
(88, 'PhaedraBot', 'Model-P8800', 'Actif'),
(89, 'LedaRobo', 'Model-L8900', 'En réparation'),
(90, 'EuropaBot', 'Model-E9000', 'Actif'),
(91, 'IoRobo', 'Model-I9100', 'Actif'),
(92, 'GanymedeBot', 'Model-G9200', 'En réparation'),
(93, 'CallistoBot', 'Model-C9300', 'Actif'),
(94, 'MetisRobo', 'Model-M9400', 'Actif'),
(95, 'DioneBot', 'Model-D9500', 'Décommissionné'),
(96, 'RheaBot', 'Model-R9600', 'Actif'),
(97, 'TitanRobo', 'Model-T9700', 'En réparation'),
(98, 'HyperionBot', 'Model-H9800', 'Actif'),
(99, 'AtlasRobo', 'Model-A9900', 'Actif'),
(100, 'PrometheusRobo', 'Model-P10000', 'Disparu');

INSERT INTO Humain (ID, Name, Post, Seniority) VALUES
(1, 'Alice', 'Ingénieur', 5),
(2, 'Bob', 'Technicien', 3),
(3, 'Clara', 'Chercheur', 8),
(4, 'David', 'Pilote', 2),
(5, 'Emma', 'Mécanicien', 6),
(6, 'Thibault', 'Analyste', 4),
(7, 'Bastien', 'Superviseur_ethique', 7),
(8, 'Donald', 'Administrateur', 10),
(9, 'Fanny', 'Analyste', 3),
(10, 'Georges', 'Technicien', 1),
(11, 'Hugo', 'Ingénieur', 9),
(12, 'Inès', 'Mécanicien', 4),
(13, 'Jacques', 'Chercheur', 5),
(14, 'Karine', 'Pilote', 6),
(15, 'Léo', 'Analyste', 2),
(16, 'Monique', 'Superviseur_ethique', 8),
(17, 'Nicolas', 'Administrateur', 7),
(18, 'Olivia', 'Technicien', 3),
(19, 'Paul', 'Ingénieur', 11),
(20, 'Quentin', 'Chercheur', 9),
(21, 'Rosa', 'Pilote', 4),
(22, 'Samuel', 'Mécanicien', 10),
(23, 'Thérèse', 'Technicien', 2),
(24, 'Ursule', 'Superviseur_ethique', 12),
(25, 'Victor', 'Analyste', 5),
(26, 'Willy', 'Chercheur', 3),
(27, 'Xavier', 'Technicien', 7),
(28, 'Yasmine', 'Mécanicien', 4),
(29, 'Zachary', 'Administrateur', 13),
(30, 'Amandine', 'Ingénieur', 6),
(31, 'Bruno', 'Analyste', 4),
(32, 'Céline', 'Pilote', 5),
(33, 'David', 'Superviseur_ethique', 7),
(34, 'Elisabeth', 'Technicien', 3),
(35, 'François', 'Chercheur', 8),
(36, 'Géraldine', 'Mécanicien', 9),
(37, 'Hélène', 'Technicien', 1),
(38, 'Isabelle', 'Administrateur', 10),
(39, 'Julien', 'Ingénieur', 7),
(40, 'Khaled', 'Analyste', 6),
(41, 'Lucie', 'Pilote', 2),
(42, 'Marc', 'Superviseur_ethique', 6),
(43, 'Nathalie', 'Technicien', 4),
(44, 'Olivier', 'Chercheur', 11),
(45, 'Patrick', 'Mécanicien', 6),
(46, 'Quentin', 'Analyste', 7),
(47, 'Rachelle', 'Superviseur_ethique', 10),
(48, 'Sophie', 'Technicien', 3),
(49, 'Thomas', 'Administrateur', 12),
(50, 'Ursula', 'Ingénieur', 10),
(51, 'Valérie', 'Chercheur', 5),
(52, 'Warren', 'Pilote', 2),
(53, 'Xena', 'Mécanicien', 8),
(54, 'Yves', 'Technicien', 7),
(55, 'Zoe', 'Analyste', 4),
(56, 'Alice', 'Superviseur_ethique', 3),
(57, 'Benjamin', 'Administrateur', 6),
(58, 'Clara', 'Chercheur', 9),
(59, 'Damien', 'Pilote', 4),
(60, 'Elsa', 'Technicien', 5),
(61, 'Fabrice', 'Mécanicien', 12),
(62, 'Gwen', 'Analyste', 3),
(63, 'Hervé', 'Superviseur_ethique', 7),
(64, 'Ingrid', 'Technicien', 8),
(65, 'Jérôme', 'Ingénieur', 11),
(66, 'Karim', 'Chercheur', 4),
(67, 'Laurence', 'Pilote', 2),
(68, 'Maxime', 'Mécanicien', 9),
(69, 'Nicolas', 'Technicien', 6),
(70, 'Omar', 'Administrateur', 14),
(71, 'Pauline', 'Analyste', 5),
(72, 'Quentin', 'Superviseur_ethique', 3),
(73, 'Renaud', 'Technicien', 5),
(74, 'Sabrina', 'Chercheur', 10),
(75, 'Tanguy', 'Mécanicien', 4),
(76, 'Ugo', 'Analyste', 6),
(77, 'Valérie', 'Superviseur_ethique', 12),
(78, 'William', 'Technicien', 8),
(79, 'Xavier', 'Administrateur', 13),
(80, 'Yann', 'Chercheur', 7),
(81, 'Zoe', 'Pilote', 9),
(82, 'Alice', 'Mécanicien', 10),
(83, 'Benoît', 'Technicien', 6),
(84, 'Catherine', 'Analyste', 7),
(85, 'David', 'Superviseur_ethique', 5),
(86, 'Elodie', 'Technicien', 2),
(87, 'Franck', 'Ingénieur', 4),
(88, 'Gérald', 'Chercheur', 8),
(89, 'Hélène', 'Pilote', 10),
(90, 'Isabelle', 'Mécanicien', 5),
(91, 'Jérémie', 'Technicien', 7),
(92, 'Karim', 'Superviseur_ethique', 4),
(93, 'Lucie', 'Analyste', 2),
(94, 'Marc', 'Technicien', 5),
(95, 'Nadia', 'Mécanicien', 11),
(96, 'Olivier', 'Administrateur', 12),
(97, 'Pierre', 'Analyste', 9),
(98, 'Quentin', 'Superviseur_ethique', 6),
(99, 'Romain', 'Technicien', 8),
(100, 'Sophie', 'Chercheur', 10);


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


-- supression des potentiels droit d'accès
DROP USER IF EXISTS 'admin'@'localhost';
DROP USER IF EXISTS 'analyste'@'localhost';
DROP USER IF EXISTS 'technicien'@'localhost';
DROP USER IF EXISTS 'superviseur_ethique'@'localhost';

-- initialisation des credentials

CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin_password';
CREATE USER 'analyste'@'localhost' IDENTIFIED BY 'analyste_password';
CREATE USER 'technicien'@'localhost' IDENTIFIED BY 'technicien_password';
CREATE USER 'superviseur_ethique'@'localhost' IDENTIFIED BY 'superviseur_password';

-- instentation des privileges

GRANT ALL PRIVILEGES ON *.* TO 'admin'@'localhost';
GRANT SELECT ON RapportIncidence TO 'analyste'@'localhost';
GRANT SELECT ON Robot TO 'technicien'@'localhost';
GRANT UPDATE (State) ON Robot TO 'technicien'@'localhost';
GRANT SELECT ON Action TO 'superviseur_ethique'@'localhost';
GRANT SELECT ON RapportIncidence TO 'superviseur_ethique'@'localhost';

