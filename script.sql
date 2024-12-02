-- Insérer un rapport avec un RobotID inexistant
INSERT INTO RapportIncidence (ID, LawViolation, Description, ActionID, RobotID, HumainID)
VALUES (10, 1, 'Invalid RobotID Test', 1, 999, 1);

-- Insérer un rapport avec un ActionID inexistant
INSERT INTO RapportIncidence (ID, LawViolation, Description, ActionID, RobotID, HumainID)
VALUES (11, 2, 'Invalid ActionID Test', 999, 1, 1);
