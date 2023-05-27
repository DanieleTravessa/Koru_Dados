/*Queries de Hipótese*/

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
