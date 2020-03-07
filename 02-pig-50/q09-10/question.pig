--
fs -rm -f -r output;
-- Carga el archivo desde el disco duro
--
data = LOAD 'data.csv' USING PigStorage(',') AS (f1:CHARARRAY, f2:CHARARRAY, f3:CHARARRAY,f4:CHARARRAY, f5:CHARARRAY, f6:CHARARRAY);
   
columns = FOREACH data GENERATE CONCAT(f2,'@',f3);
--datos2 = FOREACH columns GENERATE $0,SUBSTRING($1,0,3);
--datos3 = FOREACH datos2 GENERATE FLATTEN($0),$1;
--grouped = GROUP datos3 BY ($0,$1);
--conteo = FOREACH grouped GENERATE group, COUNT(datos3);

--data2 = FOREACH columns GENERATE 

--s = LIMIT columns 10;
--grouped = ORDER datos2 BY $0,$1,$2;

--DUMP columns

STORE columns INTO 'output' USING PigStorage('\t');

fs -get output/ .
