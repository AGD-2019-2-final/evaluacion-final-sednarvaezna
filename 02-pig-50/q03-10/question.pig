--
fs -rm -f -r output;
-- Carga el archivo desde el disco duro
--

data = LOAD 'data.tsv' AS (letter:CHARARRAY, date:CHARARRAY, value:INT);
   
values = FOREACH data GENERATE $2;

grouped = ORDER values BY $0;

s = LIMIT grouped 5;

STORE s INTO 'output';

fs -get output/ .

