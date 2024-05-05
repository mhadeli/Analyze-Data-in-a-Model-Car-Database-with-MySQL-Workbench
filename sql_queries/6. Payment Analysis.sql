SELECT
    c.customerNumber,
    c.customerName,
    p.paymentDate,
    p.amount AS paymentAmount
FROM
    mintclassics.payments AS p
    LEFT JOIN mintclassics.customers AS c ON p.customerNumber = c.customerNumber
ORDER BY
    paymentAmount DESC;