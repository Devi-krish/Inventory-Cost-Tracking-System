CREATE DATABASE inventory_system;
USE inventory_system;

-- ITEM MASTER TABLE
CREATE TABLE item_master(
item_id INT AUTO_INCREMENT PRIMARY KEY ,
item_name VARCHAR(100),
category VARCHAR(50)
);

-- INVENTORY STOCK TABLE 
CREATE TABLE inventory_stock(
stock_id INT AUTO_INCREMENT PRIMARY KEY,
item_id INT,
quantity INT
);

-- COST TABLE 
CREATE TABLE item_cost(
cost_id INT PRIMARY KEY,
item_id INT ,
Cost_per_unit DECIMAL(10,2)
);

INSERT INTO item_master VALUES (1,"LAPTOP","ELECTRONICS"),(2,"MOUSE","ACCESSORIES"),(3,"KEYBOARD","ACCESSORIES");
INSERT INTO inventory_stock VALUES (1,1,10),(2,2,5),(3,3,50);
INSERT INTO item_cost VALUES(1,1,50000),(2,2,500),(3,3,1000);


-- STOCK ON HAND REPORT-- Shows current inventory
SELECT item_name,quantity
FROM item_master JOIN inventory_stock 
ON item_master.item_id = inventory_stock.item_id;

-- LOW INVENTORY ITEMS - 
SELECT item_name ,quantity
FROM item_master 
JOIN inventory_stock 
ON item_master.item_id = inventory_stock.item_id
WHERE quantity < 10 ;

-- TOTAL INVENTORY COST 
SELECT item_name,quantity * cost_per_unit AS total_cost
FROM item_master 
JOIN inventory_stock ON item_master.item_id = inventory_stock.item_id
JOIN item_cost ON item_master.item_id = item_cost.item_id;