LIBNAME alura "/folders/myfolders/AluraPlay";

PROC DATASETS
	LIB=alura details;
RUN;

PROC CONTENTS
	DATA=alura.cadastro_produto;
RUN;

PROC PRINT
	data=alura.cadastro_produto;
RUN;

PROC FREQ
	DATA=ALURA.cadastro_produto NLEVELS;
	TABLE GENERO PLATAFORMA NOME;
RUN;

data teste;
set alura.cadastro_produto;

IF DATA > 201606 
	THEN LANCAMENTO = 1;
	ELSE LANCAMENTO = 0;
RUN;

PROC PRINT
	DATA=TESTE noobs;
RUN;

PROC FREQ
	DATA=TESTE;
	TABLE LANCAMENTO;
RUN;

proc freq
	data=teste;
	table genero*lancamento
	/nocol norow nopercent;
run;
























