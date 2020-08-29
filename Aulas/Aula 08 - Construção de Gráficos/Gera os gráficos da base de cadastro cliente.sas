* Declaração da biblioteca do AluraPlay ;
LIBNAME alura '/folders/myfolders/AluraPlay';

* GERA OS GRÁFICOS DA ANÁLISE NA BASE DE CADASTRO CLIENTE ;

/*
 * Criamos as variáveis de Estado e Idade
 * na base de cadastro dos clientes
 */

PROC FORMAT;
	VALUE estados_
		low - 09  = "Grande SP"
		10 - 19   = "Interior SP"
		19 <-< 29 = "Rio de Janeiro"
		30 - 39   = "Minas Gerais"
		80 - high = "Região sul"
		OTHER     = "Demais estados";
RUN;

DATA alura.CADASTRO_CLIENTE_V3;
set alura.cadastro_cliente;

Estado = put(input(substr(cep,1,2),best.),estados_.);
Idade = intck('YEAR', input(Nascimento, YYMMDD10.), mdy(12,1,2017),'c');
RUN;

/*Gera uma tabela de frequência das variáveis de Estado e Idade*/
PROC FREQ
	DATA=ALURA.CADASTRO_CLIENTE_V3;
	TABLE ESTADO IDADE;
RUN;

/* Plota o gráfico da variável Estado */
title "Quantidade de clientes por estado";
PROC SGPLOT
	data=alura.cadastro_cliente_v3;
	VBAR Estado / fillattrs=(color=green);
	yaxis label="Número de clientes"
		values=(0 to 35 by 5) grid
		minor minorcount=4;
	*title "Quantidade de clientes por estado";
RUN;
title;

/* Plota o gráfico da variável Idade */
title "Número de clientes por faixas de idade";
PROC SGPLOT
	DATA=ALURA.CADASTRO_CLIENTE_V3;
	HISTOGRAM IDADE / fillattrs=(color=green);
	YAXIS GRID MINOR MINORCOUNT=9 LABEL="Número de clientes";
	XAXIS GRID MINOR MINORCOUNT=9 LABEL="Idade (anos)";
RUN;

PROC UNIVARIATE
	DATA=alura.cadastro_cliente_v3;
	VAR Idade;
	HISTOGRAM;
RUN;










