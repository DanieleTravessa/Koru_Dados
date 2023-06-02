SELECT kuf.uf, COUNT(kdt.cnes) AS TotalUBS_SP, 
(SELECT SUM(COUNT(kdt.cnes)) FROM kuf JOIN kdt ON kuf.codigo_uf = kdt.uf WHERE kuf.uf BETWEEN 17 AND 29) AS somatorio_cnes
FROM kuf
JOIN kdt ON kuf.codigo_uf = kdt.uf
WHERE kuf.uf = 'SP'
GROUP BY kdf.uf;

SELECT kuf.UF, COUNT(kdt.CNES)
FROM kdt
INNER JOIN kuf
ON kdt.uf = kuf.codigo_uf
WHERE kdt.UF BETWEEN 21 AND 29
GROUP BY kuf.UF; 

SELECT kuf.UF, COUNT(CNES) AS TotalUBS#sp
FROM kuf
INNER JOIN kdt
ON kuf.codigo_uf = kdt.uf
WHERE kuf.uf = 'SP'
UNION
SELECT 'NE', SUM(ContagemUBS) /*as TotalUBSne*/
FROM (
	SELECT kuf.UF, COUNT(kdt.CNES) AS ContagemUBS
	FROM kdt
	INNER JOIN kuf 
	ON kdt.uf = kuf.codigo_uf
	WHERE kdt.UF BETWEEN 21 AND 29
	GROUP BY kuf.UF) AS Total;
    
    Alter table kdt rename column ubs to cnes; 
    
SELECT IF(ubs_sp.TotalUBSsp > ubs_ne.TotalUBSne, 'Verdadeira', 'Falsa') AS Hipótese
FROM ubs_sp, ubs_ne;

SELECT kuf.UF, COUNT(CNES) AS TotalUBSsp, (SELECT 'NE', SUM(ContagemUBS) as TotalUBSne
FROM (SELECT kuf.UF, COUNT(kdt.CNES) AS ContagemUBS
	FROM kdt INNER JOIN kuf 
	ON kdt.uf = kuf.codigo_uf
	WHERE kdt.UF BETWEEN 21 AND 29
	GROUP BY kuf.UF) AS Total)
FROM kuf INNER JOIN kdt
ON kuf.codigo_uf = kdt.uf
WHERE kuf.uf = 'SP';

SELECT kuf.UF, COUNT(kdt.CNES) AS TotalUBSsp, Total.TotalUBSne
FROM kuf INNER JOIN kdt ON kuf.codigo_uf = kdt.uf
LEFT JOIN (SELECT kuf.UF, SUM(ContagemUBS) AS TotalUBSne
    FROM (SELECT kuf.UF, COUNT(kdt.CNES) AS ContagemUBS
        FROM kuf INNER JOIN kdt ON kdt.uf = kuf.codigo_uf
        WHERE kdt.UF BETWEEN 21 AND 29 GROUP BY kuf.UF) AS Total
    GROUP BY kuf.UF
) AS Total ON kdt.UF = kuf.codigo_UF
WHERE kuf.uf = 'SP'
GROUP BY kdt.UF, Total.TotalUBSne;

	SELECT *, IF(TotalUBSsp > TotalUBSne, 'Verdadeira', 'Falsa') AS Hipótese
	FROM (
		SELECT kuf.UF, COUNT(CNES) AS TotalUBSsp, 'NE',(
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
    
    Alter table kdt rename column ubs to cnes; 
    Alter Table kdt 