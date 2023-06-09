/* 
Pregunta
===========================================================================

Para resolver esta pregunta use el archivo `data.tsv`.

Compute la cantidad de registros por cada letra de la columna 1.
Escriba el resultado ordenado por letra. 

Apache Hive se ejecutará en modo local (sin HDFS).

Escriba el resultado a la carpeta `output` de directorio de trabajo.

        >>> Escriba su respuesta a partir de este punto <<<
*/

DROP TABLE IF EXISTS birthdays;

CREATE TABLE birthdays (
letter STRING,
date_event STRING,
value INT
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY  '\t';

LOAD DATA LOCAL INPATH 'data.tsv' OVERWRITE INTO TABLE birthdays;

INSERT OVERWRITE DIRECTORY 'output'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','

SELECT letter, count(1) AS count
FROM birthdays
GROUP BY letter
ORDER BY letter;