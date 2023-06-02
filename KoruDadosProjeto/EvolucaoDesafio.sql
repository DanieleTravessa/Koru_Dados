SELECT kuf.uf, IBGE, NOME 
FROM kdt
INNER JOIN kuf ON kuf.codigo_uf = kdt.uf
ORDER BY KUF.UF, IBGE;

SELECT IBGE, GROUP_CONCAT(' ', CNES, ' - ', NOME,' 'SEPARATOR ' | ') 
AS UBS_dos_Municípios
FROM kdt
GROUP BY IBGE;

SELECT kbge.IBGE, kbge.UF, MUNICIPIO, CNES, NOME 
FROM kbge INNER JOIN kdt ON kbge.ibge = kdt.ibge;
        
SELECT GROUP_CONCAT(' ', UF, ' - ', Municipio,' 'SEPARATOR ' | ')
Municípios, GROUP_CONCAT(' ', CNES, ' - ', NOME,' 'SEPARATOR ' | ')
UBS_dos_Municípios
FROM (SELECT kbge.IBGE, kbge.UF, MUNICIPIO, CNES, NOME 
		FROM kbge INNER JOIN kdt ON kbge.IBGE = kdt.IBGE) AS kbg
GROUP BY IBGE
ORDER BY Municípios;

