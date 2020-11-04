SELECT OFC.officecode, 
       Sum(OD.quantityordered) AS SUM_ORDER 
FROM   offices OFC, 
       employees E, 
       customers CS, 
       orders O, 
       orderdetails OD 
WHERE  OD.ordernumber = O.ordernumber 
       AND O.customernumber = CS.customernumber 
       AND CS.salesrepemployeenumber = E.employeenumber 
       AND E.officecode = OFC.officecode 
GROUP  BY OFC.officecode 
ORDER  BY Sum(OD.quantityordered) DESC 
LIMIT  1; 
