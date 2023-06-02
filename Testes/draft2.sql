SELECT IF(ubs_sp.TotalUBSsp > ubs_ne.TotalUBSne, 'Verdadeira', 'Falsa') AS Hipótese
FROM ubs_sp, ubs_ne;