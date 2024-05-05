SELECT
    p.productLine,
    pl.textDescription AS productLineDescription,
    SUM(p.quantityInStock) AS totalInventory,
    SUM(od.quantityOrdered) AS totalSales,
    SUM(od.priceEach * od.quantityOrdered) AS totalRevenue,
    100.0 * SUM(od.quantityOrdered) / SUM(p.quantityInStock) AS salesToInventoryPercentage
FROM
    mintclassics.products AS p
    LEFT JOIN mintclassics.productlines AS pl ON p.productLine = pl.productLine
    LEFT JOIN mintclassics.orderdetails AS od ON p.productCode = od.productCode
GROUP BY
    p.productLine, pl.textDescription
ORDER BY
    salesToInventoryPercentage DESC;