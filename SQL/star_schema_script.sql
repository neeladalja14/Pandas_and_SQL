create database warehouse;
use warehouse;

CREATE TABLE fact_sales (
sales_id INT PRIMARY KEY,
product_id INT,
customer_id INT,
date_id INT,
store_id DECIMAL(10, 2)
);

ALTER TABLE fact_sales CHANGE sales_amount store_id INT;
-- ALTER TABLE fact_sales ADD date_id INT;   this is to add a column to a table. 

CREATE TABLE dim_product (
product_id INT PRIMARY KEY,
product_name VARCHAR(50),
category VARCHAR(50)
);

-- ALTER TABLE dim_product CHANGE product_id product_id INT;   this is to change table column name. 
-- ALTER TABLE diiim_product RENAME TO dim_product;  this is to change the table name

CREATE TABLE dim_customer (
customer_id INT PRIMARY KEY,
customer_name VARCHAR(50),
region VARCHAR(50)
);

CREATE TABLE dim_date (
date_id INT PRIMARY KEY,
date DATE,
year INT,
month INT
);

ALTER TABLE diim_date rename to dim_date; 

ALTER TABLE fact_sales
ADD CONSTRAINT fk_product
FOREIGN KEY (product_id) REFERENCES dim_product(product_id);

ALTER TABLE fact_sales
ADD CONSTRAINT fk_customer
FOREIGN KEY (customer_id) REFERENCES dim_customer(customer_id);

ALTER TABLE fact_sales
ADD CONSTRAINT fk_date
FOREIGN KEY (date_id) REFERENCES dim_date(date_id);

CREATE TABLE dim_store (
store_id INT PRIMARY KEY,
employee_name VARCHAR(50)
);

ALTER TABLE fact_sales
ADD CONSTRAINT fk_store
FOREIGN KEY (store_id) REFERENCES dim_store(store_id);