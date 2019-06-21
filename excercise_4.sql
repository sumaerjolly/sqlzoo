SELECT DISTINCT continent
FROM world;


Select SUM(GDP)
FROM world
WHERE continent LIKE 'AFRICA';

SELECT COUNT(*)
FROM world
WHERE area >= 1000000;


SELECT SUM(population) AS total
FROM world
WHERE name LIKE 'Estonia'
OR name LIKE 'Latvia'
OR name LIKE 'Lithuania';

SELECT continent, count(name) AS number_of_countries
FROM world
GROUP BY continent;

SELECT continent, count(name) AS number_of_countries
FROM world
WHERE population > 10000000
GROUP BY continent;

SELECT continent 
FROM world  
GROUP BY continent 
HAVING SUM(population) >= 100000000;