SELECT count(id)
FROM stops;

SELECT id
FROM stops
WHERE name LIKE 'Craiglockhart';

SELECT id,name
FROM stops
JOIN route ON stops.id = route.stop
WHERE company LIKE 'LRT' AND num = 4;

SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING count(*) > 1;

SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=53 AND b.stop = 149;

SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name =  'London Road';

SELECT DISTINCT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Haymarket' AND stopb.name =  'Leith';

SELECT DISTINCT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Haymarket' AND stopb.name =  'Leith';


SELECT DISTINCT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name =  'Tollcross';


SELECT name, company, num
FROM stops JOIN route ON id = stop
WHERE num IN (SELECT num
    FROM stops JOIN route ON id = stop
    WHERE name = 'Craiglockhart') AND company = 'LRT';


SELECT DISTINCT Route1.num , Route1.company , name, Route2.num , Route2.company 
FROM stops
    INNER JOIN route Route1 ON Route1.stop = id
    INNER JOIN route Route2 ON Route2.stop = id
WHERE exists(
SELECT 1
    FROM route Route3
        INNER JOIN stops Stop1 ON Route3.stop = Stop1.id
    WHERE Stop1.name='Craiglockhart' AND Route3.num = Route1.num AND Route3.company = Route1.company)
    AND exists(
SELECT 1
    FROM route Route4
        INNER JOIN stops Stop2 ON Route4.stop = Stop2.id
    WHERE Stop2.name='Lochend' AND Route4.num = Route2.num AND Route4.company = Route2.company);