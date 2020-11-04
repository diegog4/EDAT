CREATE VIEW PAREJAS_MAS_DE_UN_CARRO	 AS
SELECT OD.productcode AS PR_1, OD_2.productcode AS PR_2, count(*) AS CARROS
--Para ello buscamos dos productos que esten en un mismo carro (order)
--Es decir un producto en un order, otro producto en ese mismo order y
FROM orders O JOIN orderdetails OD ON OD.ordernumber=O.ordernumber
JOIN orderdetails OD_2 ON OD_2.ordernumber=O.ordernumber
--asegurarse que no se trate del mismo producto
WHERE OD.productcode<>OD_2.productcode
--Los agrupamos por las veces que aparecen esos productos
--Es decir, los carros diferentes que los contienen
GROUP BY OD.productcode, OD_2.productcode
--filtramos para que solo muestre aquellos que aparecen en al menos un carro
--HAVING COUNT(*) > 1
ORDER BY OD.productcode DESC;

--Una vez con esta tabla ya podemos buscar los que aparecen repetidos cambiando su orden
SELECT PM.pr_1, PM.pr_2, PM.carros+PM_2.carros AS SUM_CARROS
FROM PAREJAS_MAS_DE_UN_CARRO PM, PAREJAS_MAS_DE_UN_CARRO PM_2
--sumamos los carros de los que aparecen x-y e y-x
--mostramos los productos que aparecen en un orden y otro
--al sumar las apariciones de ambos ordenes hallamos el total
--Para que solo cuente las de la forma x-y
WHERE PM.pr_1=PM_2.pr_2 and PM_2.pr_1=PM.pr_2 and PM.pr_1>PM_2.pr_1
--y los unimos con aquellos que solo aparecen en un orden
UNION

(SELECT PMx.*
FROM PAREJAS_MAS_DE_UN_CARRO PMx
--los que solo aparecen en un orden son aquellos que solo aparecen de la forma x-y
--y no existe la forma y-x
WHERE NOT EXISTS(
SELECT PMx_2.*
FROM PAREJAS_MAS_DE_UN_CARRO PMx_2
WHERE PMx_2.pr_2=PMx.pr_1 and PMx_2.pr_1=PMx.pr_2) and PMx.carros>1)
ORDER BY pr_1, pr_2;

