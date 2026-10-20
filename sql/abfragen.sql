SELECT vorname, nachname, abteilung
FROM mitarbeiter;

SELECT * FROM mitarbeiter;


SELECT vorname, nachname, abteilung
FROM mitarbeiter
WHERE abteilung = 'IT';

SELECT vorname, gehalt
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
