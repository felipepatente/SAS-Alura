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