/*Queries de Hipóteses*/
/* Com os dados disponibilizados na base de dados em MySQL, 
a equipe deve validar as seguintes hipóteses:*/

/* O estado de São Paulo (SP) possui um número de UBSs maior que o
somatório de todas as UBSs dos estados da região nordeste. */
/*Resposta: Falso*/

SELECT * FROM ubs_ne
UNION
SELECT * FROM ubs_sp;

SELECT IF(ubs_sp.TotalUBSsp > ubs_ne.TotalUBSne, 'Verdadeira', 'Falsa') AS Hipótese
FROM ubs_sp, ubs_ne;

SELECT *, IF(ubs_sp.TotalUBSsp > ubs_ne.TotalUBSne, 'Verdadeira', 'Falsa') AS Hipótese
FROM ubs_sp, ubs_ne;

/*
A maioria das UBSs, nos respectivos estados, estão localizados nas
regiões centrais das cidades (use como base os bairros intitulados
como CENTRO).
Resultado: Falso*/

SELECT centro.uf, CENTRO, bairros.BAIRROS, 
IF(CENTRO > bairros.BAIRROS, 'Verdadeira', 'Falsa') AS Hipótese 
FROM CENTRO INNER JOIN BAIRROS 
ON centro.uf = bairros.uf
ORDER by centro.uf;

/*DESAFIO: Observe nos dados das UBSs que existe uma coluna intitulada "IBGE". Crie
um relatório que liste todas as UBS de um respectivo município/distrito/subdistrito.

DICA: Observe como são estruturados os dados que descrevem os municípios/distrito/subdistritos elencados pelo IBGE.*/
SELECT IBGE, NOME
FROM korubs_data
ORDER BY IBGE;