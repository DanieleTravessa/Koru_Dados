/*Queries de Criação de Views*/

CREATE VIEW UBS_NE AS
	SELECT 'NE', SUM(ContagemUBS) as TotalUBSne
    FROM (
		SELECT kuf.UF, COUNT(kdt.CNES) AS ContagemUBS
		FROM kdt
		INNER JOIN kuf 
		ON kdt.uf = kuf.codigo_uf
		WHERE kdt.UF BETWEEN 17 AND 29
		GROUP BY kuf.UF) AS Total;
        
DROP VIEW UBS_NE;

CREATE VIEW ubs_sp AS
SELECT kuf.uf, COUNT(CNES) AS TotalUBSsp
FROM kuf
INNER JOIN kdt
ON kuf.codigo_uf = kdt.uf
WHERE kuf.uf = 'SP';

DROP VIEW ubs_sp;