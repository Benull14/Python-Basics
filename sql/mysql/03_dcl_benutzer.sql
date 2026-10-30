-- Übung 7: Benutzer anlegen und Rechte vergeben (DCL) – als root ausführen
-- '%' = Anmeldung von jedem Rechner (nötig für phpMyAdmin im Container),
-- 'localhost' = nur vom selben Rechner (MySQL ohne Docker)

DROP USER IF EXISTS 'azubi'@'%', 'personal'@'%';

CREATE USER 'azubi'@'%'    IDENTIFIED BY 'Azubi-2026!';
CREATE USER 'personal'@'%' IDENTIFIED BY 'Personal-2026!';

-- azubi darf die ganze Datenbank firma nur lesen
GRANT SELECT ON firma.* TO 'azubi'@'%';

-- personal darf mitarbeiter lesen, ergänzen und ändern, aber nicht löschen
GRANT SELECT, INSERT, UPDATE ON firma.mitarbeiter TO 'personal'@'%';

SHOW GRANTS FOR 'azubi'@'%';
SHOW GRANTS FOR 'personal'@'%';

-- Recht wieder entziehen
REVOKE UPDATE ON firma.mitarbeiter FROM 'personal'@'%';
SHOW GRANTS FOR 'personal'@'%';

-- Übersicht aller Benutzer
SELECT user, host FROM mysql.user ORDER BY user;
