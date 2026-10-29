-- Lösungen zu aufgaben_firma.sql
-- Ausführen in sqlite3:   .read loesung_firma.sql
-- Legt die Datenbank zuerst frisch an und arbeitet dann alle Aufgaben der Reihe nach ab.

.read firma.sql
PRAGMA foreign_keys = ON;

-- ===================================================================== DDL
-- 1) Tabelle projekt
CREATE TABLE projekt (
    id           INTEGER PRIMARY KEY,
    titel        VARCHAR(40) NOT NULL,
    abteilung_id INTEGER NOT NULL REFERENCES abteilung(id),
    budget       INTEGER CHECK (budget >= 0),
    status       VARCHAR(10) DEFAULT 'geplant'
);

-- 2) Spalte telefon
ALTER TABLE mitarbeiter ADD COLUMN telefon VARCHAR(20);

-- ===================================================================== DML
-- 3) Drei Projekte
INSERT INTO projekt (id, titel, abteilung_id, budget) VALUES
    (1, 'Neues Intranet', 1, 20000),
    (2, 'Messeauftritt',  4,  8000),
    (3, 'Recruiting-Tag', 2,  3000);
SELECT * FROM projekt;

-- 4) Telefon für Anna
UPDATE mitarbeiter SET telefon = '0351 1234-11' WHERE id = 1;
SELECT vorname, telefon FROM mitarbeiter WHERE id = 1;

-- 5) Vertrieb Dresden +100
UPDATE mitarbeiter SET gehalt = gehalt + 100
WHERE abteilung_id = 3 AND standort = 'Dresden';
SELECT vorname, gehalt FROM mitarbeiter WHERE abteilung_id = 3;

-- 6) Recruiting-Tag löschen
DELETE FROM projekt WHERE titel = 'Recruiting-Tag';
SELECT COUNT(*) AS projekte FROM projekt;

-- 7) Projekt für Abteilung 99 (Fehler erwartet)
INSERT INTO projekt (titel, abteilung_id) VALUES ('Geisterprojekt', 99);

-- ===================================================================== DQL
-- 8) Gehalt über 3500, absteigend
SELECT vorname, nachname, gehalt FROM mitarbeiter
WHERE gehalt > 3500
ORDER BY gehalt DESC, nachname;

-- 9) Standorte
SELECT DISTINCT standort FROM mitarbeiter ORDER BY standort;

-- 10) Ohne Abteilung
SELECT vorname, nachname FROM mitarbeiter WHERE abteilung_id IS NULL;

-- ===================================================================== JOIN
-- 11) INNER JOIN
SELECT m.vorname, m.nachname, a.name AS abteilung
FROM mitarbeiter m
INNER JOIN abteilung a ON m.abteilung_id = a.id
ORDER BY a.name, m.nachname;

-- 12) LEFT JOIN
SELECT m.vorname, a.name AS abteilung
FROM mitarbeiter m
LEFT JOIN abteilung a ON m.abteilung_id = a.id
ORDER BY m.id;

-- 13) RIGHT JOIN
SELECT a.name AS abteilung, m.vorname
FROM mitarbeiter m
RIGHT JOIN abteilung a ON m.abteilung_id = a.id
ORDER BY a.id, m.vorname;

-- 14) Abteilungen ohne Mitarbeiter
SELECT a.name
FROM abteilung a
LEFT JOIN mitarbeiter m ON m.abteilung_id = a.id
WHERE m.id IS NULL;

-- 15) Projekte mit Abteilung
SELECT p.titel, a.name AS abteilung, p.budget
FROM projekt p
JOIN abteilung a ON p.abteilung_id = a.id
ORDER BY p.titel;

-- 16) Wer arbeitet am Neuen Intranet?
SELECT m.vorname, m.nachname
FROM projekt p
JOIN abteilung a   ON p.abteilung_id = a.id
JOIN mitarbeiter m ON m.abteilung_id = a.id
WHERE p.titel = 'Neues Intranet'
ORDER BY m.vorname;

-- 17) Abteilungen ohne Projekt
SELECT a.name
FROM abteilung a
LEFT JOIN projekt p ON p.abteilung_id = a.id
WHERE p.id IS NULL
ORDER BY a.name;

-- ===================================================================== TCL
-- 18) Umbuchung 5000 vom Intranet zur Messe
BEGIN TRANSACTION;
UPDATE projekt SET budget = budget - 5000 WHERE titel = 'Neues Intranet';
UPDATE projekt SET budget = budget + 5000 WHERE titel = 'Messeauftritt';
COMMIT;
SELECT titel, budget FROM projekt;

-- 19) Alle Projekte löschen und zurücknehmen
BEGIN TRANSACTION;
DELETE FROM projekt;
SELECT COUNT(*) AS nach_delete FROM projekt;
ROLLBACK;
SELECT COUNT(*) AS nach_rollback FROM projekt;

-- 20) SAVEPOINT
BEGIN TRANSACTION;
UPDATE projekt SET status = 'aktiv' WHERE id = 1;
SAVEPOINT vor_messe;
UPDATE projekt SET status = 'aktiv' WHERE id = 2;
ROLLBACK TO vor_messe;
COMMIT;
SELECT titel, status FROM projekt;

-- 21) Budget unter null (Fehler erwartet)
BEGIN TRANSACTION;
UPDATE projekt SET budget = budget + 20000 WHERE id = 2;
UPDATE projekt SET budget = budget - 20000 WHERE id = 1;
ROLLBACK;
SELECT titel, budget FROM projekt;
