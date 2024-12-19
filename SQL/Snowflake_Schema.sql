show databases;
create database starschema;
use starschema;

CREATE TABLE fact_sales (
    sales_id INT PRIMARY KEY,
    product_id INT,
    customer_id INT,
    date_id INT,
    store_id INT,
    sales_amount DECIMAL(10, 2),
    quantity_sold INT
);

CREATE TABLE dim_product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10, 2)
);

CREATE TABLE dim_customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    gender VARCHAR(10),
    region_id VARCHAR(50)
);

-- ALTER TABLE dim_customer CHANGE region region_id INT; 

CREATE TABLE dim_date (
    date_id INT PRIMARY KEY,
    full_date DATE,
    year INT,
    month INT,
    day INT,
    weekday VARCHAR(20)
);
CREATE TABLE dim_store (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(100),
    location VARCHAR(100),
    manager_name VARCHAR(100)
);

ALTER TABLE fact_sales
ADD CONSTRAINT fk_product FOREIGN KEY (product_id) REFERENCES dim_product(product_id);

ALTER TABLE fact_sales
ADD CONSTRAINT fk_customer FOREIGN KEY (customer_id) REFERENCES dim_customer(customer_id);

ALTER TABLE fact_sales
ADD CONSTRAINT fk_date FOREIGN KEY (date_id) REFERENCES dim_date(date_id);

ALTER TABLE fact_sales
ADD CONSTRAINT fk_store FOREIGN KEY (store_id) REFERENCES dim_store(store_id);


CREATE TABLE dim_region (
    region_id INT PRIMARY KEY,
    region_name VARCHAR(50),
    country VARCHAR(50)
);

ALTER TABLE dim_customer
ADD CONSTRAINT fk_region FOREIGN KEY (region_id) REFERENCES dim_region(region_id);


CREATE TABLE dim_holiday (
    holiday_id INT PRIMARY KEY,
    date_id INT,
    holiday_name VARCHAR(100),
    holiday_type VARCHAR(50),
    FOREIGN KEY (date_id) REFERENCES dim_date(date_id)
);