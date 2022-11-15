-- Use this file to define your SQL tables
-- The SQL in this file will be executed when you run `npm run setup-db`
DROP TABLE IF EXISTS authors CASCADE;

CREATE TABLE authors (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR NOT NULL,
    dob DATE,
    pob VARCHAR
);

INSERT INTO
  authors (name, dob, pob)
VALUES
  ('Christopher Moore', '1957-1-1', 'Toledo, Ohio'),
  ('J.R.R. Tolkien', '1892-1-3', 'Bloemfontein, South Africa'),
  ('Craig Ferguson', '1962-5-17', 'Glasgow, Scotland'),
  ('Maya Banks', '1964-8-20', 'Texas'),
  ('Judy Blume', '1938-2-12', 'Elizabeth, New Jersey'),
  ('Joseph Heller', '1923-5-1', 'Coney Island, New York, New York');

DROP TABLE IF EXISTS books CASCADE;

CREATE TABLE books (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    title VARCHAR NOT NULl,
    released INT NOT NULL
);

INSERT INTO
  books (title, released)
VALUES
  ('The Lust Lizard of Melancholy Cove', 1999),
  ('A Dirty Job', 2006),
  ('Lamb: The Gospel According to Biff, Christs Childhood Pal', 2002),
  ('Fluke, or, I know why the Winged Shale Sings', 2003),
  ('Bloodsucking Fiends: A Love Story', 2007),
  ('The Lord of the Rings', 1954),
  ('Beren and Luthien', 2017),
  ('The Silmarillion', 1977),
  ('Between the Bridge and the River', 2006),
  ('Riding the Elephant: A Memoir of Altercations, Humiliations, Hallucinations, and Obersevations', 2019),
  ('The Breathless Trilogy', 2013),
  ('Sweet Persuasion', 2009),
  ('Seduction of a Highland Lass', 2011),
  ('Never Seduce a Scot', 2012),
  ('Forever', 1975),
  ('Blubber', 1974),
  ('Good as Gold', 1979),
  ('Catch-22', 1961),
  ('God Knows', 1984);

DROP TABLE IF EXISTS authors_books;

CREATE TABLE authors_books (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    author_id BIGINT,
    book_id BIGINT,
    FOREIGN KEY (author_id) REFERENCES authors(id),
    FOREIGN KEY (book_id) REFERENCES books(id)
);

INSERT INTO authors_books (author_id, book_id)
VALUES
  (1, 1),
  (1, 2),
  (1, 3),
  (1, 4),
  (1, 5),
  (2, 6),
  (2, 7),
  (2, 8),
  (3, 9),
  (3, 10),
  (4, 11),
  (4, 12),
  (4, 13),
  (4, 14),
  (5, 15),
  (5, 16),
  (6, 17),
  (6, 18),
  (6, 19);