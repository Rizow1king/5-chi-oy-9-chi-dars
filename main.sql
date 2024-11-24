-- 1-chi topshiriq
DROP TABLE IF EXISTS categories CASCADE;
DROP TABLE IF EXISTS products CASCADE;

CREATE TABLE IF NOT EXISTS categories (
    id SERIAL PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS products (
    id SERIAL PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    product_quantity INTEGER CHECK (product_quantity > 0),
    product_price INTEGER DEFAULT 100, 
    category_id INTEGER REFERENCES categories(id) ON DELETE SET NULL
);

INSERT INTO categories (category_name) VALUES
    ('Electronics'),
    ('Clothing'),
    ('Home Appliances'),
    ('Books'),
    ('Toys');

INSERT INTO products (product_name, product_quantity, category_id) VALUES
    ('Laptop', 5, 1),
    ('Smartphone', 6, 1),
    ('T-shirt', 7, 2),
    ('Washing Machine', 2, 3),
    ('Novel', 2, 4),
    ('Toy Car', 9, 5),
    ('Tablet', 4, 1),
    ('Headphones', 10, 1),
    ('Jacket', 3, 2),
    ('Refrigerator', 1, 3),
    ('Cookbook', 6, 4),
    ('Board Game', 8, 5),
    ('Microwave', 2, 3),
    ('Sneakers', 5, 2),
    ('Puzzle', 7, 5);

-- Запросы
SELECT * FROM products;
SELECT * FROM categories;

SELECT * FROM categories
JOIN products ON categories.id = products.category_id;

SELECT * FROM categories 
LEFT JOIN products ON categories.id = products.category_id
WHERE products.category_id IS NULL;

SELECT * FROM products
LEFT JOIN categories ON categories.id = products.category_id;

SELECT * FROM products WHERE category_id IS NULL;

SELECT * FROM categories
FULL JOIN products ON products.category_id = categories.id;

SELECT * FROM categories
FULL JOIN products ON categories.id = products.category_id
WHERE products.category_id IS NULL;

SELECT * FROM categories CROSS JOIN products;

SELECT * FROM categories NATURAL JOIN products;

-- 2-chi topshiriq
DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    employee_name VARCHAR(100),
    manager_id INTEGER REFERENCES employees(employee_id)
);

INSERT INTO employees (employee_name, manager_id) VALUES
    ('John Doe', NULL), 
    ('Jane Smith', 1),  
    ('Alice Johnson', 1), 
    ('Bob Brown', 2);  

SELECT e.employee_name AS employee, m.employee_name AS manager
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.employee_id;

-- 3-chi topshiriq
DROP TABLE IF EXISTS mov_all CASCADE;
DROP TABLE IF EXISTS movies CASCADE;
DROP TABLE IF EXISTS actors CASCADE;

CREATE TABLE IF NOT EXISTS actors(
    actor_id SERIAL PRIMARY KEY,
    actor_name VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS movies(
    movie_id SERIAL PRIMARY KEY,
    movie_name VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS mov_all(
    actor_id INTEGER REFERENCES actors(actor_id) ON DELETE SET NULL,
    movie_id INTEGER REFERENCES movies(movie_id) ON DELETE SET NULL
);

INSERT INTO actors(actor_name) VALUES
    ('Robert Downey Jr.'),
    ('Chris Evans'),
    ('Scarlett Johansson'),
    ('Mark Ruffalo'),
    ('Chris Hemsworth'), 
    ('Tom Holland'),
    ('Benedict Cumberbatch'),
    ('Gal Gadot'),
    ('Jason Momoa'),
    ('Henry Cavill'),
    ('Dwayne Johnson'),
    ('Ryan Reynolds');

INSERT INTO movies(movie_name) VALUES
    ('Iron Man, Avengers: Endgame'),
    ('Captain America: The First Avenger, Avengers: Endgame'),
    ('Black Widow, Avengers: Endgame'),
    ('The Hulk, Avengers: Endgame'),
    ('Thor: Ragnarok, Avengers: Endgame'),
    ('Spider-Man: Homecoming, Avengers: Endgame'),
    ('Doctor Strange, Avengers: Endgame'),
    ('Wonder Woman, Justice League'),
    ('Aquaman, Justice League'),
    ('Man of Steel, Justice League'),
    ('Black Adam, Jumanji: Welcome to the Jungle');

INSERT INTO mov_all(actor_id, movie_id) VALUES
    (1, 1), 
	(2, 2), 
	(3, 3), 
	(4, 4), 
	(5, 5),
    (6, 6),
	(7, 7),
	(8, 8),
	(9, 9),
	(10, 10),
    (11, 11);
