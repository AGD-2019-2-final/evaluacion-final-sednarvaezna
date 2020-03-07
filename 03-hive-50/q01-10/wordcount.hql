
DROP TABLE IF EXISTS docs;
DROP TABLE IF EXISTS word_counts;

CREATE TABLE docs (line STRING);

LOAD DATA LOCAL INPATH "data.tsv" OVERWRITE INTO TABLE docs;

CREATE TABLE word_counts
AS
    SELECT word, count(1) AS count
    FROM
        (SELECT explode(split(line, '\\s')) AS word FROM docs) w
GROUP BY
    word
ORDER BY
    word;

INSERT OVERWRITE DIRECTORY '/tmp/output'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
SELECT * FROM word_counts;
