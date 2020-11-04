SELECT OFC.country, COUNT(OFC.officecode) AS N_OFFICES
FROM OFFICES OFC
WHERE OFC.officecode IN
(SELECT OFC.officecode
FROM OFFICES OFC, EMPLOYEES E, CUSTOMERS CS, ORDERS O 
except

(SELECT OFC.officecode
FROM OFFICES OFC, EMPLOYEES E, CUSTOMERS CS, ORDERS O 
WHERE OFC.officecode = E.officecode
	AND E.employeenumber = CS.salesrepemployeenumber
	AND CS.customernumber = O.customernumber
	AND O.customernumber IN
	(SELECT O.customernumber
 	FROM ORDERS O
 	WHERE O.ordernumber IN(
		SELECT O.ordernumber
		FROM ORDERS O
		WHERE 2003 = extract(year from O.orderdate))))
 )
 GROUP BY OFC.COUNTRY;
