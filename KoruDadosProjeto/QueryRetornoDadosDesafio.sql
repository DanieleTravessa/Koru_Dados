/*DESAFIO: Observe nos dados das UBSs que existe uma coluna intitulada "IBGE". Crie
um relatório que liste todas as UBS de um respectivo município/distrito/subdistrito.

DICA: Observe como são estruturados os dados que descrevem os municípios/distrito/subdistritos elencados pelo IBGE.*/
SELECT DISTINCT IBGE, NOME, kuf.uf
FROM kdt
INNER JOIN kuf ON kuf.codigo_uf = kdt.uf
ORDER BY kuf.uf;

select DISTINCT IBGE, NOME from kdt;

SELECT distinct CNES, NOME, IBGE from kdt;
SELECT UF, Nome from kdt group by IBGE;

SELECT IBGE, GROUP_CONCAT(' ', CNES, ' - ', NOME,' 'SEPARATOR ' | ') AS UBS_dos_Municípios
FROM kdt
group by IBGE;

SELECT kdt.IBGE, GROUP_CONCAT(' ', kdt.CNES, ' - ', kdt.NOME,' 'SEPARATOR ' | ') AS UBS_dos_Municípios
FROM kdt
GROUP BY IBGE;