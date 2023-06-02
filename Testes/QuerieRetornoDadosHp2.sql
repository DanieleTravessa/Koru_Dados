/*
A maioria das UBSs, nos respectivos estados, estão localizados nas
regiões centrais das cidades (use como base os bairros intitulados
como CENTRO).
Resultado: Falso*/

SELECT kuf.uf, COUNT(CNES) AS CENTRO 
FROM kdt INNER JOIN kuf
ON kdt.UF = codigo_uf
WHERE BAIRRO = 'CENTRO'
GROUP BY kuf.uf;

SELECT kuf.uf, COUNT(CNES) AS BAIRROS
FROM kdt
INNER JOIN kuf
ON kdt.UF = codigo_uf
WHERE BAIRRO <> 'CENTRO'
GROUP BY kuf.uf;

SELECT DISTINCT Centro.uf, CENTRO, bairros.BAIRROS FROM CENTRO INNER JOIN BAIRROS 
ON centro.uf = bairros.uf;

SELECT * FROM BAIRROS;

SELECT * FROM CENTRO, BAIRROS;

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