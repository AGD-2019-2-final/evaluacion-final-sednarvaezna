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
columns2 = FOREACH columns GENERATE birthday,ToString(date, 'dd'),ToString(date, 'd'),ToString(date,'EEE'),ToString(date,'EEE');
columns3 = FOREACH columns2 GENERATE $0,$1,$2,
                                (CASE $3
                                          WHEN 'Mon' THEN 'lun'
                                          WHEN 'Tue' THEN 'mar'
                                          WHEN 'Wed' THEN 'mie'
                                          WHEN 'Thu' THEN 'jue'
                                          WHEN 'Fri' THEN 'vie'
                                          WHEN 'Sat' THEN 'sab'
                                          WHEN 'Sun' THEN 'dom' END),
                                (CASE $4 
                                          WHEN 'Mon' THEN 'lunes'
                                          WHEN 'Tue' THEN 'martes'
                                          WHEN 'Wed' THEN 'miercoles'
                                          WHEN 'Thu' THEN 'jueves'
                                          WHEN 'Fri' THEN 'viernes'
                                          WHEN 'Sat' THEN 'sabado'
                                          WHEN 'Sun' THEN 'domingo' END);


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
