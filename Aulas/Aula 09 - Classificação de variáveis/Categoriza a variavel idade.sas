* Declaração da biblioteca do AluraPlay ;
LIBNAME alura '/folders/myfolders/AluraPlay';

/*
 * CLASSIFICAÇÃO DA VARIÁVEL DE IDADE
 */

/* Cria uma variável que classifica a Idade em 5 faixas */
PROC RANK
	DATA=ALURA.cadastro_cliente_v3
	OUT=BASE_RANKS
	GROUPS=5;
	VAR Idade;
	RANKS Faixa_Idade;
RUN;

PROC FREQ
	DATA=BASE_RANKS;
	TABLE Faixa_Idade;
RUN;

/* Ordena a base com os ranks */

PROC SORT
	DATA=BASE_RANKS;
	BY Faixa_Idade;
RUN;
	
	
/*PROC UNIVARIATE
	DATA=BASE_RANKS;
	VAR Idade;
	BY Faixa_Idade;
RUN;*/

/*PROC MEANS
	DATA=BASE_RANKS NOPRINT;
	VAR Idade;
	BY Faixa_Idade;
	OUTPUT OUT=Baixa_Faixas_Idade
		(DROP=_TYPE_ _FREQ_)
		N=Quantidade
		MIN=Minimo
		MAX=Maximo;
RUN;*/

/* Sumariza a base pelas as faixas de idade usando SUMMARY */

PROC SUMMARY
	DATA=BASE_RANKS;
	VAR Idade;
	BY Faixa_Idade;
	OUTPUT OUT=Baixa_Faixas_Idade
		(DROP=_TYPE_ _FREQ_)
		N=Quantidade
		MIN=Minimo
		MAX=Maximo;
RUN;

/* Sumariza a base pelas as faixas de idade usando o SQL */

PROC SQL;
	
	CREATE TABLE alura.FAIXAS_IDADE AS
	
	SELECT Faixa_Idade LABEL = "Faixas de Idade",
		   Count(*) AS Quantidade LABEL="Quantidade de clientes",
		   MIN(Idade) AS Minimo LABEL="Mínimo da Idade na faixa",
		   MAX(Idade) AS Maximo LABEL="Maximo da Idade na faixa"
	FROM BASE_RANKS
	GROUP BY Faixa_Idade;
QUIT;
	
	
PROC SQL;
	SELECT * FROM ALURA.FAIXAS_IDADE;
QUIT;
	
























