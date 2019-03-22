DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS manufacturers;
DROP TABLE IF EXISTS categories;

CREATE TABLE manufacturers (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  country VARCHAR(255),
  phone VARCHAR(20),
  email VARCHAR(255)
);

CREATE TABLE categories (
  id SERIAL4 PRIMARY KEY,
  type VARCHAR(255),
);

CREATE TABLE products (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  description VARCHAR(255),
  stock_quantity INT4,
  buying_cost MONEY,
  selling_price MONEY,
  order_date DATETIME,
  manufacturer_id INT4 REFERENCES manufacturers(id),
  category_id INT4 REFERENCES categories(id)
);
