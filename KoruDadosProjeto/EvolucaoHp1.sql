/*Evolução Hp1*/

#f1
SELECT COUNT(CNES)
FROM kdt
INNER JOIN kuf
ON kdt.UF = codigo_uf 
WHERE kuf.uf ='SP';

SELECT COUNT(CNES)
FROM kdt
INNER JOIN kuf
ON kdt.UF = codigo_uf 
WHERE kuf.uf IN ('PI', 'ÇE', 'RN', 'PE', 'AL', 'SE', 'BA');

#f2 Criaçao de Views
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

#f3 Union das Views
SELECT * FROM ubs_ne
UNION
SELECT * FROM ubs_sp;

#f4
SELECT kuf.UF, COUNT(CNES) AS TotalUBSsp, 'NE' AS Região_NE ,(
SELECT SUM(ContagemUBS) AS TotalUBSne
FROM ( SELECT COUNT(kdt.CNES) AS ContagemUBS
	FROM kdt
	INNER JOIN kuf 
	ON kdt.uf = kuf.codigo_uf
	WHERE kdt.UF BETWEEN 21 AND 29
	GROUP BY kuf.UF) AS Total) AS TotalUBSne
FROM kuf
INNER JOIN kdt
ON kuf.codigo_uf = kdt.uf
WHERE kuf.uf = 'SP';

#f5
SELECT *, IF(TotalUBSsp > TotalUBSne, 'Verdadeira', 'Falsa') AS Hipótese
FROM (
	SELECT kuf.UF, COUNT(CNES) AS TotalUBSsp, 'Nordeste' AS Região_NE,(
		SELECT SUM(ContagemUBS) AS TotalUBSne
		FROM (  SELECT COUNT(kdt.CNES) AS ContagemUBS
				FROM kdt
				INNER JOIN kuf 
				ON kdt.uf = kuf.codigo_uf
				WHERE kdt.UF BETWEEN 21 AND 29
				GROUP BY kuf.UF) AS Total) AS TotalUBSne
	FROM kuf
	INNER JOIN kdt
	ON kuf.codigo_uf = kdt.uf
	WHERE kuf.uf = 'SP'
	) AS Qhp1;

