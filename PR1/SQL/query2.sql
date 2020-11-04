SELECT L.productline, AVG(O.shippeddate - O.orderdate) AS delivering_time
FROM ORDERS O, ORDERDETAILS D, PRODUCTS PR, PRODUCTLINES L
WHERE O.ordernumber = D.ordernumber
	AND D.productcode = PR.productcode
	AND PR.productline = L.productline
	
GROUP BY L.productline
ORDER BY delivering_time ASC;
