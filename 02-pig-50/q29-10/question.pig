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


columns = FOREACH data GENERATE birthday,ToDate(birthday, 'yyyy-MM-dd') AS date:DateTime;
columns2 = FOREACH columns GENERATE birthday,LOWER(ToString(date, 'MMM')),ToString(date, 'MM'),ToString(date, 'M');

columns3 = FOREACH columns2 GENERATE $0,CASE $1
                                WHEN 'jan' THEN 'ene'
                                WHEN 'feb' THEN 'feb'
                                WHEN 'mar' THEN 'mar'
                                WHEN 'apr' THEN 'abr'
                                WHEN 'may' THEN 'may'
                                WHEN 'jun' THEN 'jun'
                                WHEN 'jul' THEN 'jul'
                                WHEN 'aug' THEN 'ago'
                                WHEN 'sep' THEN 'sep'
                                WHEN 'oct' THEN 'oct'
                                WHEN 'nov' THEN 'nov'
                                WHEN 'dec' THEN 'dic'
                                END,$2,$3;


--filtro = FILTER columns BY SUBSTRING($0,0,1)>='M';
--filtro2 = FILTER filtro BY surname < 'L';

--datos2 = FOREACH columns GENERATE $0,SUBSTRING($1,0,3);
--datos3 = FOREACH datos2 GENERATE FLATTEN($0),$1;
--grouped = GROUP datos3 BY ($0,$1);
--conteo = FOREACH grouped GENERATE group, COUNT(datos3);

--data2 = FOREACH columns GENERATE 


--grouped = ORDER columns BY $1 DESC,$0;
--s = LIMIT grouped 5;
--DUMP columns3
--DUMP filtro
STORE columns3 INTO 'output' USING PigStorage(',');

fs -get output/ .
