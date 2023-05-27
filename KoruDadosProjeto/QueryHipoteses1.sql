/*Queries de Hipótese*/

SELECT * FROM ubs_ne
UNION
SELECT * FROM ubs_sp;

SELECT IF(ubs_sp.TotalUBSsp > ubs_ne.TotalUBSne, 'Verdadeira', 'Falsa') AS Hipótese
FROM ubs_sp, ubs_ne;

SELECT *, IF(ubs_sp.TotalUBSsp > ubs_ne.TotalUBSne, 'Verdadeira', 'Falsa') AS Hipótese
FROM ubs_sp, ubs_ne;
