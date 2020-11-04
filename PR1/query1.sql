SELECT CS.customernumber, CS.customername, Sum(D.quantityordered * D.priceeach) AS total_paid 
FROM customers CS, orders O, orderdetails D, products PR 
WHERE PR.productcode = D.productcode 
  AND D.ordernumber = O.ordernumber 
  AND O.customernumber = CS.customernumber
  AND CS.customernumber IN(
	  SELECT CS.customernumber
	  FROM customers CS, orders O, orderdetails D, products PR 
	  WHERE  PR.productname = '1940 Ford Pickup Truck' 
       	 AND PR.productcode = D.productcode 
         AND D.ordernumber = O.ordernumber 
         AND O.customernumber = CS.customernumber)
	   
GROUP  BY CS.customernumber 
ORDER  BY total_paid DESC;



