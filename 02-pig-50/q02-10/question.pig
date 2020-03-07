--
fs -rm -f -r output;
-- Carga el archivo desde el disco duro
--

data = LOAD 'data.tsv' AS (letter:CHARARRAY, date:CHARARRAY, value:INT);
   
grouped = ORDER data BY $0,$2;

tabs = FOREACH grouped GENERATE CONCAT($0,'\t',$1,'\t',$2);

STORE grouped INTO 'output';

fs -get output/ .

