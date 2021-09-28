CREATE DATABASE demo_1;
USE demo_1;
CREATE TABLE products(
id INT AUTO_INCREMENT PRIMARY KEY,
product_code INT,
product_name VARCHAR(45),
product_price DOUBLE,
product_amount INT,
product_description VARCHAR(45),
productStatus VARCHAR(45)
);
INSERT INTO products (product_code,product_name,product_price,product_amount,product_description,productStatus)
VALUES (1,"Vở",10000,4,"v","oke"),
(2,"Sách",20000,3,"s","oke"),
(3,"Thước",10000,6,"t","oke");
CREATE UNIQUE INDEX index_products ON products (product_code);
CREATE INDEX index_product_name_product_price ON products(product_name,product_price);
EXPLAIN SELECT * FROM products;

CREATE VIEW view_product AS 
SELECT product_code,product_name,product_price,productStatus
FROM products;

SELECT * FROM view_product;
CREATE OR REPLACE VIEW view_product AS
SELECT  product_code,product_name,product_price,productStatus,product_amount
FROM products
WHERE product_price = 10000;
DROP VIEW view_product;

DELIMITER //
CREATE PROCEDURE get_products()
BEGIN
  SELECT * FROM products ;
END //
DELIMITER ;

call get_products();

DELIMITER //
CREATE PROCEDURE add_new_products(product_code1 INT,product_name1 VARCHAR(45),product_price1 DOUBLE,product_amount1 INT,product_description1 VARCHAR(45),productStatus1 VARCHAR(45))
BEGIN
  INSERT INTO products (product_code,product_name,product_price,product_amount,product_description,productStatus)
  VALUES (product_code1,product_name1,product_price1,product_amount1,product_description1,productStatus1);
END //
DELIMITER ;

CALL add_new_products (4,"Tẩy",5000,4,"t","oke");

DELIMITER //
CREATE PROCEDURE edit_products (id1 INT,product_code1 INT,product_name1 VARCHAR(45),product_price1 DOUBLE,product_amount1 INT,
product_description1 VARCHAR(45),productStatus1 VARCHAR(45))
BEGIN
  UPDATE products SET
  product_code = product_code1,
  product_name = product_name1,
  product_price = product_price1,
  product_amount = product_amount1,
  product_description = product_description1,
  productStatus = productStatus1
  WHERE id = id1;
  
END //
DELIMITER ;

CALL edit_products (2,5,"Thước",10000,6,"t","oke");

DELIMITER //
CREATE PROCEDURE delete_products (id1 INT)
BEGIN
DELETE FROM products WHERE id = id1;
END //
DELIMITER ;
CALL delete_products(1);
