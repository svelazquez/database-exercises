USE codeup_test_db;

SELECT name FROM albums WHERE artist = 'Pink Floyd';
SELECT release_date FROM albums WHERE name = 'Sgt. Pepper''s Lonely Hearts Club';
SELECT genre FROM albums WHERE name = 'Nevermind';
SELECT name FROM albums WHERE release_date >= 1990 and release_date < 2000;
SELECT name FROM albums WHERE sales < 20000000;
SELECT name FROM albums WHERE genre = 'Rock';
