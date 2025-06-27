USE new_schema;

select * from ec;

-- 1. Select and arrange in cost in decending order
SELECT ID, Cost_of_the_Product, Mode_of_Shipment
FROM ec
ORDER BY Cost_of_the_Product DESC;

-- 2.Average product cost per shipment mode
SELECT Mode_of_Shipment, AVG(Cost_of_the_Product) AS Avg_Cost
FROM ec
GROUP BY Mode_of_Shipment;

-- create new table
CREATE TABLE shipment_status (
  ID INT,
  Delivery_Status VARCHAR(50)
);

-- Sample JOIN to combine order with status
SELECT ec.ID, ec.Mode_of_Shipment, shipment_status.Delivery_Status
FROM ec
INNER JOIN shipment_status ON ec.ID = shipment_status.ID;

-- 3. Customers who paid more than the average product cost
SELECT ID, Cost_of_the_Product
FROM ec
WHERE Cost_of_the_Product > (
    SELECT AVG(Cost_of_the_Product) FROM ec
);

-- 4. create view
CREATE VIEW avg_rating_by_gender AS
SELECT Gender, AVG(Customer_rating) AS Avg_Rating
FROM ec
GROUP BY Gender;

SELECT * FROM avg_rating_by_gender;

-- 5. Create index 
CREATE INDEX idx_cost ON ec(Cost_of_the_Product);
SHOW INDEX FROM ec;





