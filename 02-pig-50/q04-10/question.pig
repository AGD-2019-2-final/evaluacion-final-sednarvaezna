--
fs -rm -f -r output;
-- Carga el archivo desde el disco duro
--

data = LOAD 'truck_event_text_partition.csv' USING PigStorage(',') AS (driverId:INT, truckId:INT, eventTime:CHARARRAY);
   
columns = FOREACH data GENERATE $0,$1,$2;
s = LIMIT columns 10;
grouped = ORDER s BY $0,$1,$2;

-- DUMP grouped

STORE grouped INTO 'output' USING PigStorage(',');

fs -get output/ .

