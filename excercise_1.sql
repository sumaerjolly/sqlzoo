SELECT name, continent, population 
FROM world;


-- Show the name for the countries that have a population of at least 200 million
SELECT name 
FROM world
WHERE population > 200000000;


-- Calculate the per capita GDP
SELECT name, (gdp/population) AS perCapitaGdp 
FROM world
WHERE population > 200000000;


-- Show the name and population in millions for the countries of the continent 'South America'. Divide the population by 1000000 to get population in millions.
SELECT name, (population/1000000) AS population
FROM world
WHERE continent LIKE 'South America';

-- Show the name and population for France, Germany, Italy
Select name,population
FROM world
WHERE name LIKE 'FRANCE' OR  name LIKE 'GERMANY' or name LIKE 'ITALY';

-- Show the countries which have a name that includes the word 'United'
Select name
FROM world
WHERE name LIKE  '%UNITED%';

-- Show the countries that are big by area or big by population. Show name, population and area.

Select name,population,area
FROM world
WHERE area > 3000000 OR population > 250000000;


Select name,population,area
FROM world
WHERE area > 3000000 XOR population > 250000000;

SELECT name, ROUND(population/1000000,2), ROUND(gdp/1000000000,2)
FROM world
WHERE continent = 'South America';


SELECT name,capital
FROM world
WHERE LENGTH(name) = LENGTH(capital);


SELECT name, capital
FROM world
WHERE LEFT(name, 1) = LEFT(capital, 1) and name <> capital;


SELECT name
FROM world
WHERE name LIKE '%a%'
    AND name LIKE '%e%'
    AND name LIKE '%i%'
    AND name LIKE '%o%'
    AND name LIKE '%u%'
    AND name NOT LIKE '% %';