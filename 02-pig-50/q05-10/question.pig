--
fs -rm -f -r output;
-- Carga el archivo desde el disco duro
--
--fs -rm *.tsv
fs -put data.tsv
data = LOAD 'data.tsv' USING PigStorage('\t') AS (f1:CHARARRAY, f2:{t:(p:CHARARRAY)}, f3:CHARARRAY);
   
columns = FOREACH data GENERATE FLATTEN(f2) AS letter;
grouped = GROUP columns BY letter;
conteo = FOREACH grouped GENERATE group, COUNT(columns);

--data2 = FOREACH columns GENERATE 

--s = LIMIT columns 10;
--grouped = ORDER s BY $0,$1,$2;

--DUMP conteo

STORE conteo INTO 'output' USING PigStorage('\t');

fs -get output/ .

