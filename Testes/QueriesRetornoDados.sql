/*Queries de retorno dos dados*/

use korubs;

SELECT DISTINCT kuf.uf, kdt.uf 
FROM kuf 
join kdt on kuf.codigo_uf = kdt.uf
Order by kdt.uf;

SELECT kuf.UF, COUNT(kdt.CNES)
FROM kdt
INNER JOIN kuf
ON kdt.uf = kuf.codigo_uf
WHERE kdt.UF BETWEEN 21 AND 29
GROUP BY kuf.UF; 

SELECT kuf.uf, COUNT(kdt.cnes) AS TotalUBS_SP, 
       (SELECT SUM(COUNT(kdt.cnes)) FROM kuf JOIN kdt ON kuf.codigo_uf = kdt.uf WHERE kuf.uf BETWEEN 17 AND 29) AS somatorio_cnes
FROM kuf
JOIN kdt ON kuf.codigo_uf = kdt.uf
WHERE kuf.uf = 'SP'
GROUP BY kuf.uf;

