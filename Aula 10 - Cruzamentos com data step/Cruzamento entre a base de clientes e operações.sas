* Declaração da biblioteca do AluraPlay ;
LIBNAME alura '/folders/myfolders/AluraPlay';

PROC CONTENTS
	DATA=alura.operacoes_201709 VARNUM;
RUN;

PROC CONTENTS 
	DATA=alura.cadastro_cliente_v3 VARNUM;
RUN;

/* Agrupado a base de operações pelo CPF */
PROC SQL;
	CREATE TABLE contratos_cpf AS
	SELECT CPF, COUNT(*) AS Quantidade_Jogos
	FROM alura.operacoes_201709
	GROUP BY CPF;
QUIT;

/* Converter o CPF da base de clientes em CPF raiz */

DATA cad_cli_cpf_raiz;
SET alura.cadastro_cliente_v3;

CPF_RAIZ = input(substr(CPF,1,11), COMMAX11.0);

RUN;

/* Ordenar a base de clientes */

PROC SORT
	DATA=cad_cli_cpf_raiz
	OUT=cad_cli_cpf_sort
	NODUPKEY;
	by CPF_RAIZ;
RUN;

PROC CONTENTS
	DATA=V;
RUN;

PROC CONTENTS
	DATA=contratos_cpf;
RUN;


/* Cruzamento das bases usando um data merge */

DATA cad_cli_jogos;
MERGE cad_cli_cpf_sort (IN=A)
	  contratos_cpf (RENAME=(CPF=CPF_RAIZ));
BY CPF_RAIZ;
IF A;
RUN;


PROC PRINT DATA=cad_cli_jogos; RUN;
PROC PRINT DATA=contratos_cpf; RUN;



























