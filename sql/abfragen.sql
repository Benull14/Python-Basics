SELECT vorname, nachname, abteilung
FROM mitarbeiter;

SELECT * FROM mitarbeiter;


SELECT vorname, nachname, abteilung
FROM mitarbeiter
WHERE abteilung = 'IT';

SELECT vorname
FROM mitarbeiter
WHERE gehalt > 3000;

SELECT vorname, standort, gehalt
FROM mitarbeiter
WHERE gehalt > 3000 AND standort = 'Leipzig';


SELECT nachname, standort, abteilung
FROM mitarbeiter
WHERE standort = 'Dresden' 
    AND abteilung = 'Vertrieb';

SELECT nachname, standort, abteilung
FROM mitarbeiter
WHERE standort = 'Dresden' 
    OR abteilung = 'Vertrieb';

SELECT * FROM mitarbeiter;

SELECT vorname, nachname
FROM mitarbeiter
WHERE nachname LIKE '%z';  -- nachnamen, die mit "z" enden

SELECT vorname
FROM mitarbeiter
WHERE nachname LIKE '_e%';  -- nachnamen, die an der 2. Stelle ein "e" haben

SELECT vorname, nachname
FROM mitarbeiter
WHERE vorname LIKE 'a%';

SELECT vorname, nachname
FROM mitarbeiter
ORDER BY vorname DESC; -- nach vornamen absteigend sortieren

SELECT vorname, nachname
FROM mitarbeiter
ORDER BY nachname ASC; -- nach nachnamen aufsteigend sortieren

SELECT *
FROM mitarbeiter
ORDER BY abteilung ASC, vorname ASC; -- erstmal nach abteilung aufsteigend sortieren und dann bei Gleichstand nach vorname aufsteigend sortieren

SELECT DISTINCT abteilung
FROM mitarbeiter;

SELECT DISTINCT abteilung, standort
FROM mitarbeiter
ORDER BY abteilung, standort;

