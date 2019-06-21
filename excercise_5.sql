SELECT matchid, player 
FROM goal 
  WHERE teamid LIKE 'Ger';

SELECT player, teamid, stadium,mdate 
  FROM game JOIN goal ON (id=matchid)
WHERE teamid = 'GER';

SELECT Team1, team2, player
  FROM game JOIN goal ON (id=matchid)
WHERE player LIKE 'Mario%';

SELECT player, teamid, coach, gtime
  FROM goal JOIN eteam ON teamid = id
 WHERE gtime<=10;

SELECT mdate, teamname 
FROM game 
JOIN eteam ON team1=eteam.id 
WHERE coach = 'Fernando Santos';

SELECT player
FROM goal JOIN game ON game.id = goal.matchid
WHERE stadium = 'National Stadium, Warsaw';


SELECT DISTINCT player
FROM game JOIN goal ON matchid = id 
WHERE goal.teamid != 'Ger' and (team1 = 'Ger' or team2 = 'Ger');

SELECT teamname, count(*)
FROM eteam JOIN goal ON id=teamid
GROUP BY teamname;

SELECT stadium, count(*)
FROM game JOIN goal ON id=matchid
GROUP BY stadium;

SELECT matchid,mdate, count(*)
FROM goal JOIN game ON matchid = id 
WHERE (team1 = 'POL' OR team2 = 'POL')
GROUP by matchid, mdate;

SELECT matchid, mdate, count(*) 
FROM goal JOIN game ON  matchid = id
WHERE teamid = 'GER'
group by matchid, mdate;

SELECT game.mdate, game.team1, 
SUM(CASE WHEN goal.teamid = game.team1 THEN 1 ELSE 0 END) AS score1,
game.team2,
SUM(CASE WHEN goal.teamid = game.team2 THEN 1 ELSE 0 END) AS score2
FROM game LEFT JOIN goal ON matchid = id
GROUP BY game.id,game.mdate, game.team1, game.team2 
ORDER BY mdate,matchid,team1,team2;