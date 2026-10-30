USE firma;

-- Übung 5: Daten ändern (DML)
UPDATE mitarbeiter SET gehalt = gehalt * 1.05 WHERE abteilung_id = 1;
-- WHERE immer über den Schlüssel (id) – Workbench verlangt das im Safe Update Mode
UPDATE mitarbeiter SET standort = 'Dresden' WHERE id = 9;        -- Ida
INSERT INTO mitarbeiter (vorname, nachname, abteilung_id, standort, gehalt, eintritt)
VALUES ('Jonas', 'Becker', 3, 'Leipzig', 3000, '2026-10-01');
SELECT id, vorname, nachname FROM mitarbeiter WHERE nachname = 'Becker';   -- id = 10
DELETE FROM mitarbeiter WHERE id = 10;

-- Fehler absichtlich: Abteilung 9 gibt es nicht (Fremdschlüssel)
-- INSERT INTO mitarbeiter (vorname, nachname, abteilung_id) VALUES ('Test', 'Fehler', 9);

-- Übung 6: Abfragen mit JOIN
-- INNER JOIN: nur Mitarbeiter MIT Abteilung
SELECT m.vorname, m.nachname, a.name AS abteilung
FROM mitarbeiter m
INNER JOIN abteilung a ON m.abteilung_id = a.id
ORDER BY a.name, m.nachname;

-- LEFT JOIN: alle Mitarbeiter, auch Ida ohne Abteilung
SELECT m.vorname, m.nachname, a.name AS abteilung
FROM mitarbeiter m
LEFT JOIN abteilung a ON m.abteilung_id = a.id;

-- RIGHT JOIN: alle Abteilungen, auch die ohne Mitarbeiter
SELECT a.name AS abteilung, m.nachname
FROM mitarbeiter m
RIGHT JOIN abteilung a ON m.abteilung_id = a.id
ORDER BY a.name;

-- JOIN mit Gruppierung: Kopfzahl und Durchschnittsgehalt je Abteilung
SELECT a.name AS abteilung, COUNT(m.id) AS anzahl, ROUND(AVG(m.gehalt), 2) AS schnitt
FROM abteilung a
LEFT JOIN mitarbeiter m ON m.abteilung_id = a.id
GROUP BY a.name
ORDER BY anzahl DESC;
