SELECT e.employeenumber, 
       e.lastname 
FROM   employees e, 
       employees e_1, 
       employees e_2 
--e reporta a e_1 que reporta a e_2 que es el jefe 
WHERE  e.reportsto = e_1.employeenumber 
       AND e_1.reportsto = e_2.employeenumber 
       AND e_2.reportsto IS NULL; 
