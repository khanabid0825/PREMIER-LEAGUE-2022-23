--- SQL DATA EXPLORATION PROJECT ON PREMIER LEAGUE 2022-23 SEASON (FIRST PART)
--- Inspecting data from the table "Matchday week" 
SELECT *
FROM PremierLeague2022.DBO.['MATCHDAY WEEK $'];

-- Segregating clubs based on the matches they played at home and away
--- For Home
SELECT Club_Rank, COUNT ([Matches played]) AS MP_Home
FROM PremierLeague2022.DBO.['MATCHDAY WEEK $']
WHERE Venue = 'Home'
GROUP BY Club_Rank
ORDER BY Club_Rank;
--- For Away
SELECT Club_Rank, COUNT([Matches played]) AS MP_Away
FROM PremierLeague2022.DBO.['MATCHDAY WEEK $']
WHERE VENUE = 'Away'
GROUP BY Club_Rank
ORDER BY Club_Rank;

--- Segregating clubs based on the number of wins in the PL this season
-- For Home
SELECT Club_Rank, COUNT(Result) AS Wins_Home
FROM PremierLeague2022.DBO.['MATCHDAY WEEK $']
WHERE RESULT ='W' AND VENUE = 'HOME'
GROUP BY Club_Rank
ORDER BY Club_Rank;
-- For Away
SELECT Club_Rank, COUNT(RESULT) AS Wins_Away
FROM PremierLeague2022.DBO.['MATCHDAY WEEK $']
WHERE RESULT = 'W' AND VENUE = 'AWAY'
GROUP BY Club_Rank
ORDER BY Club_Rank;

--- Segregating clubs based on the number of losses registered in the Premier League this season
--- For Home
SELECT Club_Rank, COUNT(RESULT) AS Loss_Home
FROM PremierLeague2022.DBO.['MATCHDAY WEEK $']
WHERE RESULT = 'L' AND VENUE = 'HOME'
GROUP BY Club_Rank
ORDER BY Club_Rank;
--- For Away
SELECT Club_Rank, COUNT(RESULT) AS Loss_Away
FROM PremierLeague2022.DBO.['MATCHDAY WEEK $']
WHERE RESULT = 'L' AND VENUE = 'AWAY'
GROUP BY Club_Rank
ORDER BY Club_Rank;

--- Segregating the clubs based on the number of draws in the PL this season
--- For Home
SELECT Club_Rank, COUNT(RESULT) AS Draw_Home
FROM PremierLeague2022.DBO.['MATCHDAY WEEK $']
WHERE RESULT = 'D' AND VENUE = 'HOME'
GROUP BY Club_Rank
ORDER BY Club_Rank;
--- For Away
SELECT Club_Rank, COUNT(RESULT) AS Draw_Away
FROM PremierLeague2022.DBO.['MATCHDAY WEEK $']
WHERE RESULT = 'D' AND VENUE = 'AWAY'
GROUP BY Club_Rank
ORDER BY Club_Rank;

--- Segregating clubs based on the number of goals scored this season in the Premier League
-- For Home
SELECT Club_Rank, SUM(GF) AS GF_Home
FROM PremierLeague2022.DBO.['MATCHDAY WEEK $']
WHERE VENUE = 'HOME'
GROUP BY Club_Rank
ORDER BY Club_Rank;
-- For Away
SELECT Club_Rank, SUM(GF) AS GF_Away
FROM PremierLeague2022.DBO.['MATCHDAY WEEK $']
WHERE VENUE = 'AWAY'
GROUP BY Club_Rank
ORDER BY Club_Rank;

--- Segregating clubs based on the number of goals allowed in the PL this season
--- For Home
SELECT Club_Rank, SUM(GA) AS GA_Home
FROM PremierLeague2022.DBO.['MATCHDAY WEEK $']
WHERE VENUE = 'HOME'
GROUP BY Club_Rank
ORDER BY Club_Rank
--- For Away
SELECT Club_Rank, SUM(GA) AS GA_Away
FROM PremierLeague2022.DBO.['MATCHDAY WEEK $']
WHERE VENUE = 'AWAY'
GROUP BY Club_Rank
ORDER BY Club_Rank

--- Inspecting data from the second table "Passes and Possesions"
SELECT *
FROM PremierLeague2022.DBO.['PASSES AND POSSESSION$'];

--- Segregating clubs based on the total passes attempted and completed in the PL this season
--- For Home
SELECT Club_Rank, SUM([Passes attempted]) AS PA_Home, SUM([Passes completed]) AS PC_Home
FROM PremierLeague2022.DBO.['PASSES AND POSSESSION$']
WHERE VENUE = 'HOME'
GROUP BY Club_Rank
ORDER BY Club_Rank;
--- For Away
SELECT Club_Rank, SUM([Passes attempted]) AS PA_Away, SUM([Passes completed]) AS PC_Away
FROM PremierLeague2022.DBO.['PASSES AND POSSESSION$']
WHERE VENUE = 'AWAY'
GROUP BY Club_Rank
ORDER BY Club_Rank;

--- Segregating clubs based on the average of the possession registered in the PL this season
-- For Home
SELECT Club_Rank, CAST(AVG (Possession) AS DECIMAL (10,2)) AS Possession_Home
FROM PremierLeague2022.DBO.['PASSES AND POSSESSION$']
WHERE VENUE = 'HOME'
GROUP BY Club_Rank
ORDER BY Club_Rank
--- For Away
SELECT Club_Rank, CAST(AVG(Possession) AS DECIMAL (10,2)) AS Possession_Away
FROM PremierLeague2022.DBO.['PASSES AND POSSESSION$']
WHERE VENUE = 'AWAY'
GROUP BY Club_Rank
ORDER BY Club_Rank;

--- Inspecting data from the third table "Saves and Clean Sheets"
SELECT *
FROM PremierLeague2022.DBO.['SAVES AND CLEAN SHEETS$'];

--- Segregating clubs based on the shots on target against and the saves made in the PL this season
--- For Home
SELECT Club_Rank, SUM([Shots on target against]) AS SOTA_Home, SUM(Saves) AS Saves_Home
FROM PremierLeague2022.DBO.['SAVES AND CLEAN SHEETS$']
WHERE VENUE = 'HOME'
GROUP BY Club_Rank
ORDER BY Club_Rank
--- For Away
SELECT Club_Rank, SUM([Shots on target against]) AS SOTA_Away, SUM(Saves) AS Saves_Away
FROM PremierLeague2022.DBO.['SAVES AND CLEAN SHEETS$']
WHERE VENUE = 'AWAY'
GROUP BY Club_Rank
ORDER BY Club_Rank

--- Segregating clubs based on the number of clean sheets registered in the PL this season
--- For Home
SELECT Club_Rank, COUNT([Clean sheets]) AS CS_Home
FROM PremierLeague2022.DBO.['SAVES AND CLEAN SHEETS$']
WHERE [Clean sheets] = 1 AND VENUE = 'HOME'
GROUP BY Club_Rank
ORDER BY Club_Rank
--- For Away
SELECT Club_Rank, COUNT([Clean sheets]) AS CS_Away
FROM PremierLeague2022.DBO.['SAVES AND CLEAN SHEETS$']
WHERE [Clean sheets] = 1 AND VENUE = 'AWAY'
GROUP BY Club_Rank
ORDER BY Club_Rank

--- Inspecting data from the fourth table "Shots, Distance and Formation"
SELECT *
FROM PremierLeague2022.DBO.['SHOTS, DISTANCE AND FORMATION$'];

---Segregating clubs based on the total shots attempted and the total shots on target in the PL this season
-- For Home
SELECT Club_Rank, SUM(Shots) AS Shots_Home, SUM(SOT) AS SOT_Home
FROM PremierLeague2022.DBO.['SHOTS, DISTANCE AND FORMATION$']
WHERE VENUE = 'HOME'
GROUP BY Club_Rank
ORDER BY Club_Rank;
--- For Away
SELECT Club_Rank, SUM(Shots) AS Shots_Away, SUM(SOT) AS SOT_Away
FROM PremierLeague2022.DBO.['SHOTS, DISTANCE AND FORMATION$']
WHERE VENUE = 'AWAY'
GROUP BY Club_Rank
ORDER BY Club_Rank;

--- Segregating clubs based on the number of formations they played this season 
--- For Home
SELECT Club_Rank, COUNT(DISTINCT Formation) AS Formation_Home
FROM PremierLeague2022.dbo.['SHOTS, DISTANCE AND FORMATION$']
WHERE VENUE = 'HOME'
GROUP BY Club_Rank
ORDER BY Club_Rank

--- For Away
SELECT Club_Rank, COUNT(DISTINCT Formation) AS Formation_Away
FROM PremierLeague2022.DBO.['SHOTS, DISTANCE AND FORMATION$']
WHERE VENUE = 'AWAY'
GROUP BY Club_Rank
ORDER BY Club_Rank

--- Inspecting data from the fifth table "Tackles"
SELECT *
FROM PremierLeague2022.DBO.TACKLES$

--- Segregating clubs based on the total tackles made and won in the PL this season
--- For Home
SELECT Club_Rank, SUM([Tackles made]) AS TM_Home, SUM([Tackles won]) AS TW_Home
FROM PremierLeague2022.DBO.TACKLES$
WHERE VENUE = 'HOME'
GROUP BY Club_Rank
ORDER BY Club_Rank
--- For Away
SELECT Club_Rank, SUM([Tackles made]) AS TM_Away, SUM([Tackles won]) AS TW_Away
FROM PremierLeague2022.DBO.TACKLES$
WHERE VENUE = 'AWAY'
GROUP BY Club_Rank
ORDER BY Club_Rank

--- Segregating tackles (defensive third), tackles (middle third), tackles (attacking third)
--- For Home
SELECT Club_Rank, SUM([Tackles (Defensive 3rd)]) AS HTacklesDF_3RD, SUM([Tackles (Middle 3rd)]) AS HTacklesMF_3RD, SUM([Tackles (Attacking 3rd)]) AS HTacklesATT_3RD
FROM PremierLeague2022.DBO.TACKLES$
WHERE VENUE = 'HOME'
GROUP BY Club_Rank
ORDER BY Club_Rank
--- For Away
SELECT Club_Rank, SUM([Tackles (Defensive 3rd)]) AS ATacklesDF_3RD, SUM([Tackles (Middle 3rd)]) AS ATacklesMF_3RD, SUM([Tackles (Attacking 3rd)]) AS ATacklesATT_3RD
FROM PremierLeague2022.DBO.TACKLES$
WHERE VENUE = 'AWAY'
GROUP BY Club_Rank
ORDER BY Club_Rank

--- Inspecting data from the sixth table "Touches"
SELECT *
FROM PremierLeague2022.DBO.TOUCHES$

--- Segregating clubs based on total touches and total touches made in penalty area, defensive third, middle third and attacking third
-- For Home
SELECT Club_Rank, SUM([Touches total]) AS Touches_Home, SUM([Def Pen]) AS DefPen_Home, SUM([Def 3rd]) AS HomeTouches_DF3rd, SUM([Mid 3rd]) AS HomeTouches_MF3rd, SUM([Att 3rd]) AS HomeTouches_Att3rd, SUM([Att Pen]) AS HomeTouches_AttPen
FROM PremierLeague2022.DBO.TOUCHES$
WHERE VENUE = 'HOME'
GROUP BY Club_Rank
ORDER BY Club_Rank
-- For Away
SELECT Club_Rank, SUM([Touches total]) AS Touches_Away, SUM([Def Pen]) AS DefPen_Away, SUM([Def 3rd]) AS AwayTouches_DF3rd, SUM([Mid 3rd]) AS AwayTouches_MF3rd, SUM([Att 3rd]) AS AwayTouches_Att3rd, SUM([Att Pen]) AS AwayTouches_AttPen
FROM PremierLeague2022.DBO.TOUCHES$
WHERE VENUE = 'AWAY'
GROUP BY Club_Rank
ORDER BY Club_Rank
