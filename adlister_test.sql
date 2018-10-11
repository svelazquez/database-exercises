create database adlister_db;
use adlister_db;

create table users (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    email VARCHAR(50),
    password VARCHAR(50),
    PRIMARY KEY (id)
);

insert into users(email, password) values
	('greatEmail@email.com', 'greatPassword'),
    ('okayEmail@email.com', 'okayPassword'),
    ('terribleEmail@email.com', 'terriblePassword');
    
create table ads (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    title VARCHAR(100),
    description TEXT,
	user_id INT UNSIGNED NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users (id)
);


insert into ads(user_id, title, description)values
	(1, 'Cat for sale', 'It smells, I don''t want it'),
    (2, 'Looking for cat', 'want a cat that smells'),
    (3, 'Chair for sale', 'Only been sat in once'),
    (1, 'Free pickup', 'I will pick you up. Minimum of 2 feet off the ground for 2 seconds'),
    (3, 'F4M', 'Female seeking male to womansplain to him'),
    (1, 'Selling costume', 'All black, leather. Great halloween costume'),
    (2, 'Looking for car', 'I don''t know where I parked?? Please help??');
    
create table categories (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(255),
    PRIMARY KEY (id)
);

insert into categories (name) values
	('For Sale'),
    ('Looking For'),
    ('Free');
 insert into categories(name) values
	('Fun loving'),
    ('Offers');
    
    select * from categories;

create table ad_category (
	ad_id INT UNSIGNED NOT NULL,
    category_id INT UNSIGNED NOT NULL,
    FOREIGN KEY (ad_id) REFERENCES ads(id),
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

insert into ad_category (ad_id, category_id) VALUES 
	(1, 2), (2,2), (2,4), (3,1),(3,4), (4, 3), (4,5), (5, 2), (5,4), (6,1),(6,4),(6,5),(7,2); 
  
  
-- For a given ad, what is the email address of the user that created it  
select concat(a.title, ': ', a.description) as 'Ad', u.email as 'Email'    
from ads a
join users u
	on u.id = a.user_id;
-- For a given ad, what category or categories does it belong to
select concat(a.title, ': ', a.description) as 'Ad', cat.name as 'Category'
from ads a
join ad_category c on c.ad_id = a.id
join categories cat on cat.id = c.category_id
order by a.id;
-- for a given category, what ads are in the category?
select cat.name as 'Category',concat(a.title, ': ', a.description) as 'Ad'
from ads a
join ad_category c on c.ad_id = a.id
join categories cat on cat.id = c.category_id
order by cat.id;
-- for a given user, show all the ads they have posted
select u.email as 'Email', a.title, concat(a.title, '- ', a.description) as 'Ad'
from users u
join ads a on a.user_id = u.id
order by u.email;



















