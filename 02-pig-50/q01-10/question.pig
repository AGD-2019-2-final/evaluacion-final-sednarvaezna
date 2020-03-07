--
fs -rm -f -r output;
-- Carga el archivo desde el disco duro
--

data = LOAD 'data.tsv' USING PigStorage('\t')
    AS (letter:CHARARRAY,
        date:CHARARRAY,
        value:INT);
    
grouped = GROUP data BY letter;

letter_count = FOREACH grouped GENERATE group, COUNT(data);
STORE letter_count INTO 'output';
fs -get output/ .
