/*Evolução Hp2*/

#f1
SELECT COUNT(CNES) 
FROM korubs_data AS kdt
INNER JOIN korubs_uf AS kuf
ON kdt.UF = codigo_uf
WHERE BAIRRO = 'CENTRO'; 

SELECT COUNT(CNES) 
FROM korubs_data AS kdt
INNER JOIN korubs_uf AS kuf
ON kdt.UF = codigo_uf
WHERE BAIRRO <> 'CENTRO';

#f2
SELECT *, IF(CENTRO > BAIRROS, 'Verdadeira', 'Falsa') as Hipótese
FROM (SELECT kuf.UF, COUNT(CNES) AS BAIRROS, (SELECT COUNT(CNES)
FROM kdt WHERE BAIRRO = 'CENTRO' AND kdt.uf = kuf.codigo_uf) AS CENTRO,
(SELECT COUNT(CNES) FROM kdt WHERE kdt.uf = kuf.codigo_uf) AS TotalPorEstado
FROM kdt
INNER JOIN kuf
ON kdt.UF = kuf.codigo_uf
WHERE kdt.BAIRRO <> 'CENTRO'
GROUP BY kdt.uf
ORDER BY kuf.uf) AS QHp2;

Alter table [tabela] rename [nomeNovo];