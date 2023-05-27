CREATE DATABASE korubs;

USE korubs;

CREATE TABLE korubs_uf (
codigo_uf INT PRIMARY KEY NOT NULL,
unidade_da_federacao VARCHAR(25) NOT NULL,
uf CHAR(2) NOT NULL 
);

DROP DATABASE ubs_koru;

CREATE TABLE korubs_data (
CNES INT PRIMARY KEY NOT NULL,
UF INT NOT NULL,
IBGE INT NOT NULL,
NOME VARCHAR(100) NOT NULL,
LOGRADOURO VARCHAR(100) NOT NULL,
BAIRRO VARCHAR(40) NOT NULL,
LATITUDE VARCHAR(100) NOT NULL,
LONGITUDE VARCHAR(100) NOT NULL
);

SELECT COUNT(*)
FROM korubs_data;

/* Com os dados disponibilizados na base de dados em MySQL, 
a equipe deve validar as seguintes hipóteses:*/

/* O estado de São Paulo (SP) possui um número de UBSs maior que o
somatório de todas as UBSs dos estados da região nordeste. */
/*Resposta: Falso*/

SELECT uf
FROM korubs_uf;

SELECT codigo_uf, kdt.UF, CNES, NOME
FROM korubs_uf AS kuf
INNER JOIN korubs_data AS kdt
ON codigo_uf = kdt.UF;

SELECT COUNT(CNES)
FROM korubs_data AS kdt
INNER JOIN korubs_uf AS kuf
ON kdt.UF = codigo_uf 
WHERE kuf.uf ='SP';

SELECT COUNT(CNES)
FROM korubs_data AS kdt
INNER JOIN korubs_uf AS kuf
ON kdt.UF = codigo_uf 
WHERE kuf.uf IN ('PI', 'ÇE', 'RN', 'PE', 'AL', 'SE', 'BA');

/*
A maioria das UBSs, nos respectivos estados, estão localizados nas
regiões centrais das cidades (use como base os bairros intitulados
como CENTRO).
Resultado: Falso*/

SELECT COUNT(CNES) 
FROM korubs_data AS kdt
INNER JOIN korubs_uf AS kuf
ON kdt.UF = codigo_uf
WHERE BAIRRO = 'CENTRO'; 

SELECT COUNT(CNES) 
FROM korubs_data AS kdt
INNER JOIN korubs_uf AS kuf
ON kdt.UF = codigo_uf
WHERE BAIRRO <> 'CENTRO';


/*DESAFIO: Observe nos dados das UBSs que existe uma coluna intitulada "IBGE". Crie
um relatório que liste todas as UBS de um respectivo município/distrito/subdistrito.

DICA: Observe como são estruturados os dados que descrevem os municípios/distrito/subdistritos elencados pelo IBGE.*/
SELECT IBGE, NOME
FROM korubs_data
ORDER BY IBGE;