USE codeup_test_db;

SELECT sales, name FROM albums;
UPDATE albums SET sales = sales * 10;
SELECT sales, name FROM albums;

SELECT name, release_date FROM albums WHERE release_date < 1980;
update albums set release_date = release_date - 100 where release_date < 1980;
SELECT name, release_date FROM albums WHERE release_date < 1980;

SELECT name FROM albums where artist = 'Michael Jackson';
UPDATE albums set artist = 'Peter Jackson' where artist = 'Michael Jackson';
SELECT artist FROM albums;
