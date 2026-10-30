-- Übung 7: Benutzer anlegen und Rechte vergeben (DCL) – als root ausführen
-- '%' = Anmeldung von jedem Rechner (nötig für phpMyAdmin im Container),
-- 'localhost' = nur vom selben Rechner (MySQL ohne Docker)

DROP USER IF EXISTS 'azubi'@'localhost', 'personal'@'localhost';

CREATE USER 'azubi'@'localhost'    IDENTIFIED BY 'Azubi-2026!';
CREATE USER 'personal'@'localhost' IDENTIFIED BY 'Personal-2026!';

-- azubi darf die ganze Datenbank firma nur lesen
GRANT SELECT ON firma.* TO 'azubi'@'localhost';

-- personal darf mitarbeiter lesen, ergänzen und ändern, aber nicht löschen
GRANT SELECT, INSERT, UPDATE ON firma.mitarbeiter TO 'personal'@'localhost';

SHOW GRANTS FOR 'azubi'@'localhost';
SHOW GRANTS FOR 'personal'@'localhost';

-- Recht wieder entziehen
REVOKE UPDATE ON firma.mitarbeiter FROM 'personal'@'localhost';
SHOW GRANTS FOR 'personal'@'localhost';

-- Übersicht aller Benutzer
SELECT user, host FROM mysql.user ORDER BY user;
