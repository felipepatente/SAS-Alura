/*Lendo arquivo txt, o caminho do arquivo só muda da pasta myfolders em diante*/
DATA sdata_blanks;
	infile "/folders/myfolders/Arquivos/DATA_blanks.txt";
	input name $ Gender $ Age Weight;
RUN;

PROC PRINT
	DATA=sdata_blanks;
RUN;

/*Lendo arquivo csv*/
DATA sdata_commas;
	infile "/folders/myfolders/Arquivos/DATA_commas.csv";
	input name $ Gender $ Age Weight;
RUN;

PROC PRINT
	DATA=sdata_commas;
RUN;

/*Importando arquivo excel*/
PROC IMPORT
	DATAFILE="/folders/myfolders/Arquivos/excel_data"
	DBMS = xlsx out = excel_data1 replace;
RUN;

PROC PRINT
	DATA=excel_data1;
RUN;

/*Exemplo simples de SQL*/
PROC SQL;
	select name, score_raw
	from excel_data1
	where score_raw = '65';
QUIT;


