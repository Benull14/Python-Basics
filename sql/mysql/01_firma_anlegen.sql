-- Übung 4: Datenbank und Tabellen anlegen (DDL) und Daten einfügen (DML)
-- Kann beliebig oft ausgeführt werden – die Datenbank wird jedes Mal neu angelegt.

DROP DATABASE IF EXISTS firma;
CREATE DATABASE firma CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE firma;

CREATE TABLE abteilung (
    id           INT          PRIMARY KEY,
    name         VARCHAR(20)  NOT NULL UNIQUE,
    kostenstelle CHAR(5)      NOT NULL
);

CREATE TABLE mitarbeiter (
    id           INT          PRIMARY KEY AUTO_INCREMENT,
    vorname      VARCHAR(30)  NOT NULL,
    nachname     VARCHAR(30)  NOT NULL,
    abteilung_id INT,                                  -- darf NULL sein
    standort     VARCHAR(20),
    gehalt       DECIMAL(8,2) CHECK (gehalt > 0),
    eintritt     DATE,
    FOREIGN KEY (abteilung_id) REFERENCES abteilung(id)
);

INSERT INTO abteilung (id, name, kostenstelle) VALUES
    (1, 'IT',        'K-100'),
    (2, 'HR',        'K-200'),
    (3, 'Vertrieb',  'K-300'),
    (4, 'Marketing', 'K-400');      -- hat (noch) keine Mitarbeiter

INSERT INTO mitarbeiter (vorname, nachname, abteilung_id, standort, gehalt, eintritt) VALUES
    ('Anna',  'Berger',   1,    'Dresden', 4200, '2019-03-01'),
    ('Ben',   'Hoffmann', 2,    'Leipzig', 2800, '2021-06-15'),
    ('Clara', 'Winter',   1,    'Leipzig', 3500, '2018-11-20'),
    ('Dirk',  'Krause',   3,    'Dresden', 3100, '2020-01-10'),
    ('Eva',   'Adler',    1,    'Dresden', 4200, '2022-07-01'),
    ('Felix', 'Nowak',    3,    'Leipzig', 2900, '2023-02-01'),
    ('Greta', 'Schulz',   2,    'Dresden', 3300, '2017-05-12'),
    ('Hakan', 'Yilmaz',   3,    'Dresden', 3900, '2016-09-05'),
    ('Ida',   'Lang',     NULL, 'Leipzig', 1100, '2026-08-01');   -- Azubi, noch ohne Abteilung

SHOW TABLES;
SELECT * FROM mitarbeiter;
