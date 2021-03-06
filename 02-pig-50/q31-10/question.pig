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


columns = FOREACH data GENERATE ToDate(birthday, 'yyyy-MM-dd') AS date:DateTime;
columns2 = FOREACH columns GENERATE ToString(date, 'yyyy');
--filtro = FILTER columns BY SUBSTRING($0,0,1)>='M';
--filtro2 = FILTER filtro BY surname < 'L';

--datos2 = FOREACH columns GENERATE $0,SUBSTRING($1,0,3);
--datos3 = FOREACH datos2 GENERATE FLATTEN($0),$1;
grouped = GROUP columns2 BY ($0);
conteo = FOREACH grouped GENERATE group, COUNT(columns2);

--data2 = FOREACH columns GENERATE 


--grouped = ORDER columns BY $1 DESC,$0;
--s = LIMIT grouped 5;
--DUMP conteo
--DUMP filtro
STORE conteo INTO 'output' USING PigStorage(',');

fs -get output/ .
