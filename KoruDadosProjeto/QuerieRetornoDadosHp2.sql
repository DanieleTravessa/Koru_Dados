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