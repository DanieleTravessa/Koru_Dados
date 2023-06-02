/*Queries de Criação de Views*/

CREATE VIEW UBS_NE AS
	SELECT 'NE', SUM(ContagemUBS) as TotalUBSne
    FROM (
		SELECT kuf.UF, COUNT(kdt.CNES) AS ContagemUBS
		FROM kdt
		INNER JOIN kuf 
		ON kdt.uf = kuf.codigo_uf
		WHERE kdt.UF BETWEEN 21 AND 29
		GROUP BY kuf.UF) AS Total;
        
DROP VIEW UBS_NE;

CREATE VIEW ubs_sp AS
SELECT kuf.uf, COUNT(CNES) AS TotalUBSsp
FROM kuf
INNER JOIN kdt
ON kuf.codigo_uf = kdt.uf
WHERE kuf.uf = 'SP';

DROP VIEW ubs_sp;

/*
A maioria das UBSs, nos respectivos estados, estão localizados nas
regiões centrais das cidades (use como base os bairros intitulados
como CENTRO).
Resultado: Falso*/

CREATE VIEW centro AS
SELECT kuf.uf, COUNT(CNES) AS CENTRO 
FROM kdt INNER JOIN kuf
ON kdt.UF = codigo_uf
WHERE BAIRRO = 'CENTRO'
GROUP BY kuf.uf;

CREATE VIEW bairros AS
SELECT kuf.uf, COUNT(CNES) AS BAIRROS
FROM kdt
INNER JOIN kuf
ON kdt.UF = codigo_uf
WHERE BAIRRO <> 'CENTRO'
GROUP BY kuf.uf;

CREATE VIEW CENTROxBAIRRO AS
SELECT kuf.UF, COUNT(CNES) AS BAIRROS, (SELECT COUNT(CNES)
FROM kdt WHERE BAIRRO = 'CENTRO' AND kdt.uf = kuf.codigo_uf) AS CENTRO,
(SELECT COUNT(CNES) FROM kdt WHERE kdt.uf = kuf.codigo_uf) AS TotalPorEstado
FROM kdt
INNER JOIN kuf
ON kdt.UF = kuf.codigo_uf
WHERE kdt.BAIRRO <> 'CENTRO'
GROUP BY kdt.uf
ORDER BY kuf.uf;

