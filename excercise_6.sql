SELECT id, title
 FROM movie
 WHERE yr=1962;


SELECT yr
 FROM movie
 WHERE title like 'Citizen Kane';

 SELECT id,title,yr
FROM movie
WHERE title like 'Star Trek%';

SELECT id
FROM actor
WHERE name LIKE 'Glenn Close';

SELECT id
FROM movie
WHERE title LIKE 'Casablanca';

SELECT name 
FROM actor 
JOIN casting ON id = actorid 
WHERE movieid = 11768;

SELECT name 
FROM actor 
JOIN casting ON id = actorid
JOIN movie ON movie.id = movieid
WHERE title = 'Alien';

SELECT title
FROM actor
JOIN casting ON actor.id = actorid 
JOIN movie ON movie.id = movieid WHERE name = 'Harrison Ford';

SELECT title, name 
FROM actor
JOIN casting ON actor.id = actorid 
JOIN movie ON movie.id = movieid WHERE yr = 1962 and ord = 1;


SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
         JOIN actor   ON actorid=actor.id
where name='John Travolta'
GROUP BY yr
HAVING COUNT(title)=(SELECT MAX(c) FROM
(SELECT yr,COUNT(title) AS c FROM
   movie JOIN casting ON movie.id=movieid
         JOIN actor   ON actorid=actor.id
 where name='John Travolta'
 GROUP BY yr) AS t
)

SELECT title,name
FROM movie JOIN casting ON(movieid=movie.id
AND ord = 1)
JOIN actor ON (actorid = actor.id)
WHERE movie.id IN(
SELECT movieid FROM casting
WHERE actorid IN(
SELECT id FROM actor
WHERE name = 'Julie Andrews'));

SELECT actor.name
FROM actor JOIN casting ON (actor.id=casting.actorid)
WHERE casting.ord=1
GROUP BY actor.name
HAVING COUNT(actor.name) >= 30;


SELECT title, count(*) 
FROM movie 
JOIN casting ON (casting.movieid = movie.id) 
JOIN actor ON (casting.actorid = actor.id) 
WHERE yr = 1978
GROUP BY title
ORDER BY COUNT(*) DESC, title;

SELECT name 
FROM movie 
JOIN casting ON (movie.id=movieid)
JOIN actor ON (actor.id=actorid)
WHERE name != 'Art Garfunkel' 
AND movie.id  IN (SELECT movieid FROM casting 
WHERE actorid IN (SELECT id FROM actor WHERE name LIKE 'Art Garfunkel'));