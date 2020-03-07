--
fs -rm -f -r output;
--
data = LOAD 'data.csv' USING PigStorage(',') 
    AS (id:int, 
        firstname:CHARARRAY, 
        surname:CHARARRAY, 
        birthday:CHARARRAY, 
        color:CHARARRAY, 
        quantity:INT);
-- Carga el archivo desde el disco duro
--data = LOAD 'data.csv' USING PigStorage(',') AS (f1:CHARARRAY, f2:CHARARRAY, f3:CHARARRAY,f4:CHARARRAY, f5:CHARARRAY, f6:CHARARRAY);
   
columns = FOREACH data GENERATE firstname,color;
filtro = FILTER columns BY not((color matches 'black') OR (color matches 'blue'));
--filtro2 = FILTER filtro BY surname < 'L';


--datos2 = FOREACH columns GENERATE $0,SUBSTRING($1,0,3);
--datos3 = FOREACH datos2 GENERATE FLATTEN($0),$1;
--grouped = GROUP datos3 BY ($0,$1);
--conteo = FOREACH grouped GENERATE group, COUNT(datos3);

--data2 = FOREACH columns GENERATE 


--grouped = ORDER columns BY $1 DESC,$0;
--s = LIMIT grouped 5;
--DUMP columns
--DUMP filtro
STORE filtro INTO 'output' USING PigStorage(',');

fs -get output/ .
