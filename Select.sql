/* SELECAO, PROJECAO E JUNCAO */

/* PROJECAO --> É TUDO QUE VOCE QUER VER NA TELA*/


SELECT NOW() AS DATA_ATUAL;

SELECT 2+2 AS SOMA;

SELECT 2 + 2 AS SOMA, NOME, NOW()
FROM CLIENTE; 

/* SELECAO -- TRAZER UM SUBCONJUNTO DE UM CONJUNTO TOTAL DE REGISTROS
DE UMA TABELA
A CLAUSULA DE SELECAO É O WHERE*/ 

SELECT NOME, SEXO, EMAIL /*PROJECAO*/
FROM CLIENTE /*ORIGEM*/
WHERE SEXO = 'F'; /*SELECAO*/

SELECT NUMERO /*PROJECAO*/
FROM TELEFONE /*ORIGEM*/
WHERE TIPO = 'CEL'; /*SELECAO*/

/* JUNCAO -> JOIN JUNTAR DUAS OU MAIS TABELAS */

SELECT NOME, EMAIL, IDCLIENTE 
FROM CLIENTE; 

SELECT ID_CLIENTE, BAIRRO, CIDADE
FROM ENDERECO; 

+---------+-------------------+-----------+
| NOME    | EMAIL             | IDCLIENTE |
+---------+-------------------+-----------+
| JOAO    | joao@ig.com       |         1 |
| FLAVIO  | FLAVIO@IG.COM     |         2 |
| ANDRE   | ANDRE@GLOBO.COM   |         3 |
| GIOVANA | NULL              |         4 |
| KARLA   | KARLA@GMAIL.COM   |         5 |
| DANIELE | DANIELE@GMAIL.COM |         6 |
| LORENA  | NULL              |         7 |
| EDUARDO | NULL              |         8 |
| ANTONIO | ANTONIO@IG.COM    |         9 |
| ANTONIO | ANTONIO@UOL.COM   |        10 |
| ELAINE  | ELAINE@GLOBO.COM  |        11 |
| CARMEM  | CARMEM@IG.COM     |        12 |
| ADRIANA | ADRIANA@GMAIL.COM |        13 |
| JOICE   | JOICE@GMAIL.COM   |        14 |
+---------+-------------------+-----------+

+------------+------------+----------------+
| ID_CLIENTE | BAIRRO     | CIDADE         |
+------------+------------+----------------+
|          4 | CENTRO     | BELO HORIZONTE |
|          9 | CASCADURA  | B. HORIZONTE   |
|         10 | ESTACIO    | RIO DE JANEIRO |
|         11 | CENTRO     | RIO DE JANEIRO |
|         12 | COPACABANA | RIO DE JANEIRO |
|         13 | CENTRO     | VITORIA        |
|          1 | LEBLON     | RIO DE JANEIRO |
|          2 | CENTRO     | CURITIBA       |
|          3 | JARDINS    | SAO PAULO      |
|          5 | BOM RETIRO | CURITIBA       |
|          6 | LAPA       | SAO PAULO      |
|          7 | CENTRO     | RIO DE JANEIRO |
|          8 | CENTRO     | RIO DE JANEIRO |
|         14 | CENTRO     | RIO DE JANEIRO |
+------------+------------+----------------+


/* NOME, SEXO, BAIRRO, CIDADE */

SELECT NOME, SEXO, BAIRRO, CIDADE /*PROJECAO */ 
FROM CLIENTE, ENDERECO /*ORIGEM*/
WHERE IDCLIENTE = ID_CLIENTE; /* JUNCAO */ 

+---------+------+------------+----------------+
| NOME    | SEXO | BAIRRO     | CIDADE         |
+---------+------+------------+----------------+
| JOAO    | M    | LEBLON     | RIO DE JANEIRO |
| FLAVIO  | M    | CENTRO     | CURITIBA       |
| ANDRE   | M    | JARDINS    | SAO PAULO      |
| GIOVANA | F    | CENTRO     | BELO HORIZONTE |
| KARLA   | M    | BOM RETIRO | CURITIBA       |
| DANIELE | M    | LAPA       | SAO PAULO      |
| LORENA  | M    | CENTRO     | RIO DE JANEIRO |
| EDUARDO | M    | CENTRO     | RIO DE JANEIRO |
| ANTONIO | F    | CASCADURA  | B. HORIZONTE   |
| ANTONIO | M    | ESTACIO    | RIO DE JANEIRO |
| ELAINE  | M    | CENTRO     | RIO DE JANEIRO |
| CARMEM  | M    | COPACABANA | RIO DE JANEIRO |
| ADRIANA | F    | CENTRO     | VITORIA        |
| JOICE   | F    | CENTRO     | RIO DE JANEIRO |
+---------+------+------------+----------------+

SELECT NOME, SEXO, BAIRRO, CIDADE
FROM CLIENTE, ENDERECO 
WHERE IDCLIENTE = ID_CLIENTE
AND SEXO ='F'; 

+---------+------+-----------+----------------+
| NOME    | SEXO | BAIRRO    | CIDADE         |
+---------+------+-----------+----------------+
| GIOVANA | F    | CENTRO    | BELO HORIZONTE |
| ANTONIO | F    | CASCADURA | B. HORIZONTE   |
| ADRIANA | F    | CENTRO    | VITORIA        |
| JOICE   | F    | CENTRO    | RIO DE JANEIRO |
+---------+------+-----------+----------------+

/* WHERE IDCLIENTE = ID_CLIENTE 
AND SEXO = 'F'; TABELA VERDADE */ 

SELECT NOME, SEXO, BAIRRO, CIDADE /*PROJECAO*/
FROM CLIENTE /*ORIGEM*/
	INNER JOIN ENDERECO /*JUNCAO*/
	ON IDCLIENTE = ID_CLIENTE
WHERE SEXO = 'F'; /*SELECAO*/

/* NOME, SEXO, EMAIL, TIPO, NUMERO*/

SELECT NOME, SEXO, EMAIL, TIPO, NUMERO
FROM CLIENTE 
INNER JOIN TELEFONE 
ON IDCLIENTE = ID_CLIENTE;


/*NOME, SEXO, BAIRRO, CIDADE, TIPO, NUMERO */ 

SELECT CLIENTE.NOME, CLIENTE.SEXO, ENDERECO.BAIRRO, ENDERECO.CIDADE, TELEFONE.TIPO, TELEFONE.NUMERO
FROM CLIENTE 
INNER JOIN ENDERECO
ON CLIENTE.IDCLIENTE = ENDERECO.ID_CLIENTE
INNER JOIN TELEFONE 
ON CLIENTE.IDCLIENTE = TELEFONE.ID_CLIENTE;

+---------+------+------------+----------------+------+----------+
| NOME    | SEXO | BAIRRO     | CIDADE         | TIPO | NUMERO   |
+---------+------+------------+----------------+------+----------+
| JOAO    | M    | LEBLON     | RIO DE JANEIRO | CEL  | 99656675 |
| FLAVIO  | M    | CENTRO     | CURITIBA       | COM  | 55689654 |
| ANDRE   | M    | JARDINS    | SAO PAULO      | COM  | 88687979 |
| GIOVANA | F    | CENTRO     | BELO HORIZONTE | COM  | 88965676 |
| KARLA   | M    | BOM RETIRO | CURITIBA       | CEL  | 34546342 |
| DANIELE | M    | LAPA       | SAO PAULO      | COM  | 88679978 |
| LORENA  | M    | CENTRO     | RIO DE JANEIRO | CEL  | 89966809 |
| EDUARDO | M    | CENTRO     | RIO DE JANEIRO | CEL  | 99655768 |
| ANTONIO | F    | CASCADURA  | B. HORIZONTE   | RES  | 89955665 |
| ANTONIO | M    | ESTACIO    | RIO DE JANEIRO | RES  | 77455786 |
| ANTONIO | M    | ESTACIO    | RIO DE JANEIRO | RES  | 89766554 |
| ELAINE  | M    | CENTRO     | RIO DE JANEIRO | CEL  | 33567765 |
| ELAINE  | M    | CENTRO     | RIO DE JANEIRO | CEL  | 88668786 |
| ELAINE  | M    | CENTRO     | RIO DE JANEIRO | RES  | 77755785 |
| ELAINE  | M    | CENTRO     | RIO DE JANEIRO | COM  | 44522578 |
+---------+------+------------+----------------+------+----------+

SELECT C.NOME, C.SEXO, E.BAIRRO, E.CIDADE, T.TIPO, T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE;

/* 
 	DML - DATA MANIPULATION LANGUAGE
 	DDL - DATA DEFINITION LANGUAGE
 	DCL - DATA CONTROL LANGUAGE - CONTROLE DE ACESSO
 	TCL- TRANSACTION CONTROL LANGUAGE -  CONTROLE DE TRANSACAO
*/