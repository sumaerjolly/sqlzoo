SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950;

 SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature';

SELECT yr,subject
  FROM nobel
 WHERE winner LIKE 'Albert Einstein';

 SELECT winner
  FROM nobel
 WHERE yr >= 2000 and subject LIKE 'peace';

 SELECT *
FROM nobel
WHERE subject LIKE 'literature' AND yr BETWEEN 1980 AND 1989 ;

SELECT * 
FROM nobel
WHERE winner LIKE 'Theodore Roosevelt' OR winner LIKE 'Woodrow Wilson' OR winner LIKE 'Jimmy Carter' OR winner LIKE 'Barack Obama';


SELECT winner
FROM nobel
WHERE winner LIKE 'John%' ;


SELECT *
FROM nobel
WHERE subject LIKE 'Physics' AND yr = 1980
 OR subject LIKE 'Chemistry' AND yr = 1984  ;

 SELECT *
FROM nobel
WHERE yr = 1980 AND subject NOT LIKE 'CHEMISTRY' AND subject NOT LIKE 'Medicine';


SELECT *
FROM nobel
WHERE subject = 'Medicine'
    AND yr < 1910
    OR subject = 'Literature'
    AND yr >= 2004;

SELECT *
FROM nobel
WHERE winner = 'Peter Grünberg';

SELECT *
FROM nobel
WHERE winner = 'Eugene O''Neill';

SELECT winner, yr, subject
FROM nobel
WHERE winner LIKE 'Sir%'
ORDER BY yr DESC;


SELECT winner, subject
FROM nobel
WHERE yr=1984
ORDER BY subject
IN ('Physics','Chemistry'), subject, winner;