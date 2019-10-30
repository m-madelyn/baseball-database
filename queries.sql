UPDATE teams SET abbreviation = 'WAS' WHERE abbreviation = 'WSH';

SELECT startTime, homeScore, awayScore FROM games WHERE startTime >= '2019-06-06 00:00:00' AND startTime <= '2019-06-06 17:00:00';

SELECT * FROM teams WHERE league = 'NL';

SELECT concat(firstName, ' ', lastName) as "Full Name", Position, Hits, Throws, abbreviation as "Team Abbreviation"
FROM   players
       JOIN teams
         ON players.currentteamid = teams.id 
WHERE  teams.mascot = 'Red Sox'; 

SELECT concat(firstName, ' ', lastName) as "Full Name", Position, abbreviation as "Team Abbreviation", HomeRuns
FROM   players
       JOIN teams
         ON players.currentteamid = teams.id 
       JOIN hittingstats 
         ON players.id = hittingstats.playerid 
       JOIN games
         ON hittingstats.gameid = games.id 
WHERE startTime > '2019-06-06'
ORDER  BY hittingstats.homeruns DESC 
LIMIT  5;

SELECT concat(firstName, ' ', lastName) as "Full Name", abbreviation as "Team Abbreviation", earnedRuns as "ERA"
FROM players
	 JOIN teams
		ON players.currentteamid = teams.id 
	 JOIN pitchingstats
		ON players.id = pitchingstats.playerId
	JOIN games
		ON pitchingstats.gameId = games.id
WHERE startTime > '2019-06-06' AND inningsPitched > 3.9
ORDER BY earnedRuns DESC
LIMIT 5;

SELECT concat(firstName, ' ', lastName) as "Full Name", 
	   Position, 
	   abbreviation as "Team Abbreviation", 
	   doubles, 
	   startTime as "Game Start Time",
       homeTeamId as "Home Team", 
	   awayTeamId as "Away Team"
FROM teams
	JOIN players
		ON players.currentteamid = teams.id
	JOIN hittingstats
		ON players.id = hittingstats.playerId
    JOIN games
		ON hittingstats.gameId = games.id
WHERE startTime > '2019-06-06'
ORDER BY doubles DESC
LIMIT 1;



