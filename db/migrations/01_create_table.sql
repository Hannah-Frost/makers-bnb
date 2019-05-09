CREATE TABLE properties (id serial PRIMARY KEY, name VARCHAR(60), description VARCHAR(300), price VARCHAR(20), owner VARCHAR(60));
CREATE TABLE users(name varchar(15),email varchar(60),password varchar(500));
CREATE TABLE calendar(property VARCHAR(60), month VARCHAR(20), date VARCHAR(2), availability VARCHAR(20));
