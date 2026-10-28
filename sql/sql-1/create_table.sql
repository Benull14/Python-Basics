DROP TABLE IF EXISTS mitarbeiter;

CREATE TABLE mitarbeiter (
    id        INTEGER PRIMARY KEY,
    vorname   VARCHAR(30) NOT NULL,
    nachname  VARCHAR(30) NOT NULL,
    abteilung VARCHAR(20),
    standort  VARCHAR(20),
    gehalt    INTEGER,
    eintritt  DATE
);

INSERT INTO mitarbeiter (id, vorname, nachname, abteilung, standort, gehalt, eintritt) VALUES
    (1, 'Anna',  'Berger',   'IT',       'Dresden', 4200, '2019-03-01'),
    (2, 'Ben',   'Hoffmann', 'HR',       'Leipzig', 2800, '2021-06-15'),
    (3, 'Clara', 'Winter',   'IT',       'Leipzig', 3500, '2018-11-20'),
    (4, 'Dirk',  'Krause',   'Vertrieb', 'Dresden', 3100, '2020-01-10'),
    (5, 'Eva',   'Adler',    'IT',       'Dresden', 4200, '2022-07-01'),
    (6, 'Felix', 'Nowak',    'Vertrieb', 'Leipzig', 2900, '2023-02-01'),
    (7, 'Greta', 'Schulz',   'HR',       'Dresden', 3300, '2017-05-12'),
    (8, 'Hakan', 'Yilmaz',   'Vertrieb', 'Dresden', 3900, '2016-09-05');

CREATE TABLE buecher (
    buch_id INTEGER PRIMARY KEY,
    titel TEXT,
    autor TEXT,
    genre TEXT,
    jahr INTEGER,
    seiten INTEGER
);

INSERT INTO buecher (buch_id, titel, autor, genre, jahr, seiten) VALUES
(1, 'Der letzte Bug', 'L. Hartmann', 'Krimi', 2019, 312),
(2, 'Netzwerke für Einsteiger', 'T. Brandt', 'Sachbuch', 2021, 248),
(3, 'Schatten über Leipzig', 'L. Hartmann', 'Krimi', 2015, 280),
(4, 'Python Schritt für Schritt', 'A. Kaya', 'Sachbuch', 2023, 410),
(5, 'Sommer am Elbufer', 'M. Vogt', 'Roman', 2018, 196),
(6, 'Datenbanken verstehen', 'A. Kaya', 'Sachbuch', 2020, 352),
(7, 'Die Spur im Schnee', 'R. Okafor', 'Krimi', 2022, 304),
(8, 'Zwischen den Zeilen', 'M. Vogt', 'Roman', 2012, 224);