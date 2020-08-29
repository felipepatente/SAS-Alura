* Declaração da biblioteca do AluraPlay ;
LIBNAME alura '/folders/myfolders/AluraPlay';

/*
 * CALCULA A IDADE DOS CLIENTES
 */

/*Checa a base de clientes V2 */
PROC CONTENTS DATA=ALURA.CADASTRO_CLIENTE_V2; RUN;

/* Calcula a idade do cliente*/
DATA cad_cli_idade;
SET ALURA.CADASTRO_CLIENTE_V2;

*data_nascimento = input(nascimento, YYMMDD10.);
*hoje = mdy(12,1,2017);
*idade = int((hoje - data_nascimento) / 365);
*idade1 = intck('YEAR',data_nascimento,hoje);

idade = intck('YEAR', input(nascimento, YYMMDD10.), mdy(12,1,2017),'c');
*FORMAT data_nascimento DDMMYYD10. hoje DDMMYYD10.;

*if idade1 ~= idade2;

RUN;

/* Imprimi a base*/
PROC PRINT DATA=ALURA.cad_cli_idade; RUN;

/*
 * Year
 * Month
 * Day
 * 
 * YYYY-MM-DD
 */