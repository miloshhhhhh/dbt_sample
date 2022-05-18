
-- Create table customers, with columns:
--   id: integer, primary key, autoincrement
--   name: varchar(255)
--   address: varchar(255)
--   city: varchar(255)
--   state: varchar(255)
--   zip: varchar(255)
--   phone: varchar(255)
--   email: varchar(255)

create table customers (
  id integer primary key autoincrement,
  name varchar(255),
  address varchar(255),
  city varchar(255),
  state varchar(255),
  zip varchar(255),
  phone varchar(255),
  email varchar(255)
);

-- # craete table orders, with columns:
-- #   id: integer, primary key, autoincrement
-- #   customer_id: integer, foreign key
-- #   order_date: date
-- #   shipped_date: date
-- #   status: varchar(255)


create table orders (
  id integer primary key autoincrement,
  customer_id integer,
  order_date date,
  shipped_date date,
  status varchar(255)
);

-- create table company_info, with columns: 
--   id: integer, primary key, autoincrement
--   name: varchar(255)
--   address: varchar(255)
--   city: varchar(255)
--   state: varchar(255)
--   zip: varchar(255)
--   phone: varchar(255)
--   email: varchar(255)


create table company_info (
  id integer primary key autoincrement,
  name varchar(255),
  address varchar(255),
  city varchar(255),
  state varchar(255),
  zip varchar(255),
  phone varchar(255),
  email varchar(255)
);


-- create table products, with columns:
--   id: integer, primary key, autoincrement
--   name: varchar(255)
--   description: varchar(255)
--   price: float
--   stock: integer
--   image: varchar(255)


create table products (
  id integer primary key autoincrement,
  name varchar(255),
  description varchar(255),
  price float,
  stock integer,
  image varchar(255)
);


-- create table order_items, with columns:
--   id: integer, primary key, autoincrement
--   order_id: integer
--   product_id: integer
--   quantity: integer
--   price: float


create table order_items (
  id integer primary key autoincrement,
  order_id integer,
  product_id integer,
  quantity integer,
  price float
);


-- create table tax_rates, with columns:
--   id: integer, primary key, autoincrement
--   state: varchar(255)
--   rate: float


create table tax_rates (
  id integer primary key autoincrement,
  state varchar(255),
  rate float
);

-- customers data for dbt model
with customer_data as (
  select
    customers.id as customer_id,
    customers.name as customer_name,
    customers.address as customer_address,
    customers.city as customer_city,
    customers.state as customer_state,
    customers.zip as customer_zip,
    customers.phone as customer_phone,
    customers.email as customer_email,
    orders.id as order_id,
    orders.order_date as order_date,
    orders.shipped_date as shipped_date,
    orders.status as status,
    order_items.id as order_item_id,
    order_items.product_id as product_id,
    order_items.quantity as quantity,
    order_items.price as price,
    products.name as product_name,
    products.description as product_description,
    products.price as product_price,
    products.stock as product_stock,
    products.image as product_image
  from customers
  join orders on customers.id = orders.customer_id
  join order_items on orders.id = order_items.order_id
  join products on order_items.product_id = products.id
)



select * from customers_data;

-------------------------------------------------------------------------------------------------------------------
-- Create insert statments for tables:
-- TAX_RATES
insert into tax_rates (state, rate) values ('CA', 0.08);
insert into tax_rates (state, rate) values ('NY', 0.08);
insert into tax_rates (state, rate) values ('TX', 0.08);
insert into tax_rates (state, rate) values ('FL', 0.08);
insert into tax_rates (state, rate) values ('AL', 0.08);
insert into tax_rates (state, rate) values ('GA', 0.08);
-- PRODUCTS
insert into products (name, description, price, stock, image) values ('Coffee', 'Coffee is a brewed drink prepared from roasted coffee beans, which are the seeds of berries from the Coffea plant. The genus Coffea is native to South America and Madagascar, where it is also known as the coffee plant.', 3.99, 10, 'coffee.jpg');
insert into products (name, description, price, stock, image) values ('Espresso', 'Espresso is coffee brewed by forcing a small amount of nearly boiling water under pressure through finely ground coffee beans. Espresso is traditionally served in a cup.', 4.99, 10, 'espresso.jpg');
insert into products (name, description, price, stock, image) values ('Latte', 'A latte is an espresso-based coffee drink that originated in Italy, and is traditionally prepared with steamed milk and foam.', 5.99, 10, 'latte.jpg');
insert into products (name, description, price, stock, image) values ('Cappuccino', 'Cappuccino is a coffee-based drink that originated in Italy, and is traditionally prepared with steamed milk foam and foamed milk.', 6.99, 10, 'cappuccino.jpg');
insert into products (name, description, price, stock, image) values ('Mocha', 'Mocha is a beverage prepared from espresso and steamed milk, and is traditionally served in a small glass cup.', 7.99, 10, 'mocha.jpg');
insert into products (name, description, price, stock, image) values ('Macchiato', 'Macchiato is a coffee-based drink that originated in Italy, and is traditionally prepared with steamed milk and foam.', 8.99, 10, 'macchiato.jpg');

-- ORDER_ITEMS
insert into order_items (order_id, product_id, quantity, price) values (1, 1, 1, 3.99);
insert into order_items (order_id, product_id, quantity, price) values (1, 2, 1, 4.99);
insert into order_items (order_id, product_id, quantity, price) values (1, 3, 1, 5.99);
insert into order_items (order_id, product_id, quantity, price) values (1, 4, 1, 6.99);
insert into order_items (order_id, product_id, quantity, price) values (1, 5, 1, 7.99);
insert into order_items (order_id, product_id, quantity, price) values (1, 6, 1, 8.99);

-- ORDERS
insert into orders (customer_id, order_date, shipped_date, status) values (1, '2017-01-01', '2017-01-01', 'shipped');
insert into orders (customer_id, order_date, shipped_date, status) values (2, '2017-01-01', '2017-01-01', 'shipped');
insert into orders (customer_id, order_date, shipped_date, status) values (3, '2017-01-01', '2017-01-01', 'shipped');
insert into orders (customer_id, order_date, shipped_date, status) values (4, '2017-01-01', '2017-01-01', 'shipped');
insert into orders (customer_id, order_date, shipped_date, status) values (5, '2017-01-01', '2017-01-01', 'shipped');
insert into orders (customer_id, order_date, shipped_date, status) values (6, '2017-01-01', '2017-01-01', 'shipped');

-- CUSTOMERS
insert into customers (name, address, city, state, zip, phone, email) values ('John Smith', '123 Main St', 'Anytown', 'NY', '12345', '555-555-5555', 'asd@dsa.com');
insert into customers (name, address, city, state, zip, phone, email) values ('Jane Doe', '456 Elm St', 'Anytown', 'NY', '12345', '555-555-5555', 'rew@dsa.com');
insert into customers (name, address, city, state, zip, phone, email) values ('John Doe', '789 Elm St', 'Anytown', 'NY', '12345', '555-555-5555', '');

-- COMPANY_INFO
insert into company_info (name, address, city, state, zip, phone, email) values ('Company Name', '123 Main St', 'Anytown', 'NY', '12345', '555-555-5555', '');
insert into company_info (name, address, city, state, zip, phone, email) values ('Company Name', '456 Elm St', 'Anytown', 'NY', '12345', '555-555-5555', '');
insert into company_info (name, address, city, state, zip, phone, email) values ('Company Name', '789 Elm St', 'Anytown', 'NY', '12345', '555-555-5555', '');

