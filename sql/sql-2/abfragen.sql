PRAGMA foreign_key = on;



-- name von Abteilung 'Vertrieb' auf 'Verkauf' ändern bzw. aktualsieren

.print '-- name von Abteilung 'Vertrieb' auf 'Verkauf' ändern bzw. aktualsieren'
UPDATE abteilung SET name = 'Verkauf' WHERE name = 'Vertrieb';

-- gehalt von Mitarbeiter in Leipzig +500 erhöhen

UPDATE mitarbeiter SET gehalt = gehalt + 500 WHERE standort = 'Leipzig';

-- Eine Spalte budget je Abteilung hinzufügen

ALTER TABLE abteilung ADD COLUMN budget INTEGER DEFAULT 200;
.schema abteilung
SELECT * FROM abteilung;

-- Spalte budget aus der Tabelle abteilung löschen

ALTER TABLE abteilung DROP COLUMN budget;
.schema abteilung
SELECT * FROM abteilung;

-- Hakan Yilmaz mit ID 8 aus der Tabelle mitarbeiter löschen
SELECT * FROM mitarbeiter;
DELETE FROM mitarbeiter WHERE id = 8;
SELECT * FROM mitarbeiter;

-- Alle Mitarbeiter mit vor- und nachnamen, die eine Abteilung haben mit Abteilungsnamen
SELECT m.vorname, m.nachname, a.name AS Abteilung
FROM mitarbeiter m
INNER JOIN abteilung a ON m.abteilung_id = a.id;

-- Alle Mitarbeiter mit vor- und nachnamen, die eine Abteilung haben und die keine Abteilung haben mit Abteilungsnamen

SELECT m.vorname, m.nachname, a.name AS Abteilung
FROM mitarbeiter m
LEFT JOIN abteilung a ON m.abteilung_id = a.id;

-- ODER:

SELECT m.vorname, m.nachname, a.name AS Abteilung
FROM abteilung a
RIGHT JOIN mitarbeiter m ON m.abteilung_id = a.id;

-- Alle Abteilungen, die sowohl Mitarbeiter haben als auch keine Mitarbeiter haben mit vor- und nachnamen anzeigen

SELECT m.vorname, m.nachname, a.name AS Abteilung
FROM mitarbeiter m
RIGHT JOIN abteilung a ON m.abteilung_id = a.id
ORDER BY m.vorname;

-- ODER

SELECT m.vorname, m.nachname, a.name AS Abteilung
FROM abteilung a
LEFT JOIN mitarbeiter m ON m.abteilung_id = a.id
ORDER BY m.vorname;

-- Abteilungen, die keine Mitarbeiter haben
SELECT a.name AS Abteilung
FROM abteilung a
LEFT JOIN mitarbeiter m ON m.abteilung_id = a.id
WHERE m.id IS NULL;

-- Abteilungen, die Mitarbeiter haben, die mehr als 4000 Euro verdienen
SELECT DISTINCT a.name AS Abteilung
FROM abteilung a
JOIN mitarbeiter m ON m.abteilung_id = a.id
WHERE m.gehalt > 4000;

-- Mitarbeiter (vorname, nachname, gehalt), die in Dresden in der IT-Abteilung arbeiten

SELECT m.vorname, m.nachname, m.gehalt
FROM mitarbeiter m
JOIN abteilung a ON a.id = m.abteilung_id
WHERE m.standort = 'Dresden' AND a.name = 'IT';




-- Spalte budget zur Tabelle abteilung mit Standardwert von 10000 hinzufügen


ALTER TABLE abteilung ADD COLUMN budget INTEGER DEFAULT 10000;
SELECT * FROM abteilung;


-- Transaktionen - TCL

-- COMMIT: 5000 EUR budget von der IT-Abteilung in die Marketingabteilung umbuchen

-- OHNE TRANSAKION

UPDATE abteilung SET budget = budget - 5000 WHERE name = 'IT';
UPDATE abteilung SET budget = budget + 5000 WHERE name = 'Marketing';

SELECT * FROM abteilung;

-- MIT TRANSAKTION

BEGIN TRANSACTION;
UPDATE abteilung SET budget = budget - 5000 WHERE name = 'IT';
UPDATE abteilung SET budget = budget + 5000 WHERE name = 'Marketing';
COMMIT;
SELECT * FROM abteilung;


-- ROLLBACK

BEGIN TRANSACTION;
DELETE FROM mitarbeiter;
SELECT COUNT(*) FROM mitarbeiter;
ROLLBACK;

SELECT * FROM mitarbeiter;

-- SAVEPOINT

BEGIN TRANSACTION;
UPDATE mitarbeiter SET standort = 'Leipzig' WHERE id = 4;
SELECT * FROM mitarbeiter;
SAVEPOINT nach_umzug;
UPDATE mitarbeiter SET standort = 'München' WHERE id = 7;
SELECT * FROM mitarbeiter;
ROLLBACK TO nach_umzug;
COMMIT;

SELECT * FROM mitarbeiter;


