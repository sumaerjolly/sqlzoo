SELECT name 
FROM world
 WHERE population >
     (SELECT population FROM world
      WHERE name='Russia');

SELECT name
FROM world
WHERE continent LIKE 'Europe' AND
    gdp/population> (
SELECT gdp/population
    FROM world
    WHERE name = 'United Kingdom'
)

SELECT name, continent
FROM world
WHERE continent IN(
SELECT continent
FROM world
WHERE name IN('Argentina', 'Australia'))
ORDER BY name;


SELECT name, population
FROM world
WHERE population >(
SELECT population
    FROM world
    WHERE name = 'Canada')
    AND population <(
SELECT population
    FROM world
    WHERE name = 'Poland');


SELECT name, CONCAT(ROUND(population/(
SELECT population
    FROM world
    WHERE name = 'Germany')*100), '%')
FROM world
WHERE continent = 'Europe'

SELECT name
FROM world
WHERE gdp >= all
(SELECT gdp
    FROM world
    WHERE continent LIKE 'Europe'
        AND gdp IS NOT NULL)
    AND continent NOT LIKE 'Europe' ;

SELECT continent, name, area
FROM world x
WHERE area >= ALL
(SELECT area
FROM world y
WHERE y.continent=x.continent AND area>0);


SELECT  name, continent, population FROM world x
where 25000000 >= all (SELECT population FROM world y
WHERE x.continent=y.continent
AND population>0)


SELECT name, continent FROM world x 
WHERE population/3 >= ALL (SELECT population FROM world y  
WHERE y.continent=x.continent AND x.name != y.name);