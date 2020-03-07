--
fs -rm -f -r output;
-- Carga el archivo desde el disco duro
--
data = LOAD 'data.tsv' USING PigStorage('\t') AS (f1:CHARARRAY, f2:{t:(p:CHARARRAY)}, f3:CHARARRAY);
   
columns = FOREACH data GENERATE f1,f2,TOKENIZE(SUBSTRING(f3,1,(int)SIZE(f3)-1));
datos2 = FOREACH columns GENERATE $0,COUNT($1),COUNT($2);
--grouped = GROUP datos2 BY $0;
--conteo = FOREACH grouped GENERATE group, COUNT(datos2);

--data2 = FOREACH columns GENERATE 

--s = LIMIT columns 10;
grouped = ORDER datos2 BY $0,$1,$2;

--DUMP grouped

STORE grouped INTO 'output' USING PigStorage(',');

fs -get output/ .
