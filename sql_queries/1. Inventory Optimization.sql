SELECT 
    p.productCode, 
    p.productName, 
    p.quantityInStock, 
    SUM(od.quantityOrdered) AS totalOrdered,
    (p.quantityInStock - SUM(od.quantityOrdered)) AS inventoryShortage
FROM 
    mintclassics.products AS p
LEFT JOIN 
    mintclassics.orderdetails AS od ON p.productCode = od.productCode
GROUP BY 
    p.productCode, 
    p.productName, 
    p.quantityInStock
HAVING 
    (p.quantityInStock - SUM(od.quantityOrdered)) > 0
ORDER BY 
    inventoryShortage DESC;