

PRAGMA foreign_keys = ON;

-- Erstellung der Tabellen Mitarbeiter und Ableitung

DROP TABLE IF EXISTS mitarbeiter;
DROP TABLE IF EXISTS abteilung;

CREATE TABLE mitarbeiter (
    id              INTEGER PRIMARY KEY,
    vorname         VARCHAR(30) NOT NULL,
    nachname         VARCHAR(30) NOT NULL,
    standort        VARCHAR(30),
    gehalt          INTEGER CHECK (gehalt > 0),
    eintritt        DATE,
    abteilung_id    INTEGER REFERENCES abteilung(id) 
); 

CREATE TABLE abteilung (
    id              INTEGER PRIMARY KEY,
    name         VARCHAR(30) NOT NULL UNIQUE,
    kostenstelle    CHAR(5) NOT NULL
);

INSERT INTO abteilung(id, name, kostenstelle) VALUES
    (1, 'IT',        'K-100'),
    (2, 'HR',        'K-200'),
    (3, 'Vertrieb',  'K-300'),
    (4, 'Marketing', 'K-400');


INSERT INTO mitarbeiter(id, vorname, nachname, standort, gehalt, eintritt, abteilung_id) VALUES
    (1, 'Anna',  'Berger','Dresden', 4200, '2019-03-01', 1),
    (2, 'Ben',   'Hoffmann', 'Leipzig', 2800, '2021-06-15', 2),
    (3, 'Clara', 'Winter', 'Leipzig', 3500, '2018-11-20', 1),
    (4, 'Dirk',  'Krause', 'Dresden', 3100, '2020-01-10', 3),
    (5, 'Eva',   'Adler',   'Dresden', 4200, '2022-07-01', 1),
    (6, 'Felix', 'Nowak',   'Leipzig', 2900, '2023-02-01', 3),
    (7, 'Greta', 'Schulz',  'Dresden', 3300, '2017-05-12', 2),
    (8, 'Hakan', 'Yilmaz',   'Dresden', 3900, '2016-09-05', 3),
    (9, 'Ida',   'Lang','Leipzig', 1100, '2026-08-01', NULL);


