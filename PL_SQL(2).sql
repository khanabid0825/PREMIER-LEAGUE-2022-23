--- SQL DATA EXPLORATION PROJECT ON PREMIER LEAGUE 2022-23 SEASON (SECOND PART)
--- Inspecting data from the table "Standard stats"
SELECT *
FROM [PremierLeague2022]..['STANDARD STATS$'];

--- Calculating total points collected by each team in the Premier League this season
SELECT Club_Rank, ((Wins_Home * 3)+(Draw_Home * 1)) AS Points_Home, ((Wins_Away * 3) + (Draw_Away * 1)) AS Points_Away
FROM [PremierLeague2022]..['STANDARD STATS$']
ORDER BY Club_Rank

--- Calculating Points Per Game for each team in the Premier League this season
SELECT Club_Rank, ((Wins_Home * 3)+(Draw_Home * 1))/MP_Home AS PPG_Home, ((Wins_Away * 3) + (Draw_Away * 1))/MP_Away AS PPG_Away
FROM [PremierLeague2022]..['STANDARD STATS$']
ORDER BY Club_Rank

--- Calculating the winning and losing percentage for each team in the Premier League this season
-- For Home
SELECT Club_Rank, (Wins_Home * 100)/MP_Home AS WinPercent_Home, (Loss_Home * 100)/MP_Home AS LossPercent_Home
FROM [PremierLeague2022]..['STANDARD STATS$']
ORDER BY Club_Rank
-- For Away
SELECT Club_Rank, (Wins_Away * 100)/MP_Away AS WinPercent_Away, (Loss_Away * 100)/MP_Away AS LossPercent_Away
FROM [PremierLeague2022]..['STANDARD STATS$']
ORDER BY Club_Rank

--- Inspecting data from the second table "GF AND GA"
SELECT *
FROM [PremierLeague2022]..['GF AND GA$']

-- Calculating the avg goals scored and conceded in the league this season
-- Average goals scored in the league this season at home
SELECT SUM(a.GF_Home)/SUM(b.MP_Home) AS AvgGF_League@HOME
FROM [PremierLeague2022]..['GF AND GA$'] a
INNER JOIN [PremierLeague2022]..['STANDARD STATS$'] b
ON a.Club_Rank = b.Club_Rank
-- Average goals scored in the league this season at away
SELECT SUM(a.GF_Away)/SUM(b.MP_Away) AS AvgGF_League@Away
FROM [PremierLeague2022]..['GF AND GA$'] a
INNER JOIN [PremierLeague2022]..['STANDARD STATS$'] b
ON a.Club_Rank = b.Club_Rank
---The average goals scored per game at home in the league would be equal to the average goals conceded per game at away.
--- Similarly, the avg goals scored per game at away games in the league would be = to average goals conceded per game at home.

--- Calculating the avg goals scored and conceded per game by each team in the PL this season
--- For Home 
SELECT a.Club_Rank, (a.GF_Home / b.MP_Home) AS AvgGF_Home, (a.GA_Home/b.MP_Home) AS AvgGA_Home
FROM [PremierLeague2022]..['GF AND GA$'] a
INNER JOIN [PremierLeague2022]..['STANDARD STATS$'] b
ON a.Club_Rank = b.Club_Rank
ORDER BY a.Club_Rank;
--- For Away
SELECT a.Club_Rank, (a.GF_Away / b.MP_Away) AS AvgGF_Away, (a.GA_Away/b.MP_Away) AS AvgGA_Away
FROM [PremierLeague2022]..['GF AND GA$'] a
INNER JOIN [PremierLeague2022]..['STANDARD STATS$'] b
ON a.Club_Rank = b.Club_Rank
ORDER BY a.Club_Rank;

--- Calculating offensive strength of each side in the PL this season
--- Offensive strength is calculated by simply dividing the average goals scored per game by the average of the goals scored in the league.
SELECT a.Club_Rank, ((a.GF_Home / b.MP_Home)/(SELECT SUM(a.GF_Home)/SUM(b.MP_Home) FROM [PremierLeague2022]..['GF AND GA$'] a 
INNER JOIN [PremierLeague2022]..['STANDARD STATS$'] b
ON a.Club_Rank = b.Club_Rank)) AS OS_Home, 
((a.GF_Away/b.MP_Away)/(SELECT SUM (a.GF_Away)/SUM(b.MP_Away)
FROM [PremierLeague2022]..['GF AND GA$'] a 
INNER JOIN [PremierLeague2022]..['STANDARD STATS$'] b
ON a.Club_Rank = b.Club_Rank)) AS OS_Away
FROM [PremierLeague2022]..['GF AND GA$'] a
INNER JOIN [PremierLeague2022]..['STANDARD STATS$'] b
ON a.Club_Rank = b.Club_Rank
ORDER BY a.Club_Rank

--- Defensive strength is calculated by simply dividing the avg goals conceded per game by the avg of goals conceded in the league.
SELECT a.Club_Rank, ((a.GA_Home / b.MP_Home)/(SELECT SUM(a.GA_Home)/SUM(b.MP_Home) FROM [PremierLeague2022]..['GF AND GA$'] a 
INNER JOIN [PremierLeague2022]..['STANDARD STATS$'] b
ON a.Club_Rank = b.Club_Rank)) AS DS_Home, 
((a.GA_Away/b.MP_Away)/(SELECT SUM (a.GA_Away)/SUM(b.MP_Away)
FROM [PremierLeague2022]..['GF AND GA$'] a 
INNER JOIN [PremierLeague2022]..['STANDARD STATS$'] b
ON a.Club_Rank = b.Club_Rank)) AS OS_Away
FROM [PremierLeague2022]..['GF AND GA$'] a
INNER JOIN [PremierLeague2022]..['STANDARD STATS$'] b
ON a.Club_Rank = b.Club_Rank
ORDER BY a.Club_Rank

--- Inspecting data from the table "Saves + Clean sheets"
SELECT *
FROM [PremierLeague2022]..['SAVES+CLEAN SHEETS$']

--- Calculating save percentage for each club in the Premier League this season
SELECT Club_Id, (Saves_Home * 100)/SOTA_Home AS SavePercent_Home, (Saves_Away * 100)/SOTA_Away AS SavePercent_Away
FROM [PremierLeague2022]..['SAVES+CLEAN SHEETS$']
ORDER BY Club_Id

--- Calculating cleen sheets recorded per game for each club in the PL this season
SELECT a.Club_Id, a.CS_Home/b.MP_Home AS AvgCS_Home, a.CS_Away/b.MP_Away AS AvgCS_Away
FROM [PremierLeague2022]..['SAVES+CLEAN SHEETS$'] a
INNER JOIN [PremierLeague2022]..['STANDARD STATS$'] b
ON a.Club_Id = b.Club_Rank

--- Inspecting data from the table "Passes+Possessions"
SELECT *
FROM [PremierLeague2022]..['PASSES+POSSESSION$']

--- Calculating pass completion percentage per game of each team in the PL this season
SELECT Club_Id, (PC_Home * 100)/PA_Home AS PCPercent_Home, (PC_Away * 100)/PA_Away AS PCPercent_Away
FROM [PremierLeague2022]..['PASSES+POSSESSION$']
ORDER BY Club_Id

--- Inspecting data from the table "Shots on targets"
SELECT *
FROM [PremierLeague2022]..['SHOTS ON TARGET$']

--- Segregating clubs based on the shots on target % for each club in the PL this season
SELECT Club_Id, (SOT_Home * 100)/Shots_Home AS SOTPercent_Home, (SOT_Away * 100)/Shots_Away AS SOTPercent_Away
FROM [PremierLeague2022]..['SHOTS ON TARGET$']
ORDER BY Club_Id

--- Segregating clubs based on goals per shot on target
SELECT a.Club_Id, (b.GF_Home/a.SOT_Home) AS GSOT_Home, (b.GF_Away/a.SOT_Away) AS GSOT_Away
FROM [PremierLeague2022]..['SHOTS ON TARGET$'] a
INNER JOIN [PremierLeague2022]..['GF AND GA$'] b
ON a.Club_Id = b.Club_Rank
ORDER BY a.Club_Id;

--- Calculating the shots on target per 90 for each side in the PL this season
SELECT a.Club_Id, (a.SOT_Home/b.MP_Home) AS SOT@Home_90, (a.SOT_Away/b.MP_Away) AS SOT@Away_90
FROM [PremierLeague2022]..['SHOTS ON TARGET$'] a
INNER JOIN [PremierLeague2022]..['STANDARD STATS$'] b
ON a.Club_Id = b.Club_Rank
ORDER BY a.Club_Id;

--- Inspecting data from the table "Tackles2"
SELECT *
FROM [PremierLeague2022]..[TACKLES2$]

--- Calculating tackle completion percentage for each side in the Premier League this season
SELECT Club_Id, (TC_Home * 100)/TM_Home AS TCPercent_Home, (TC_Away * 100)/TM_Away AS TCPercent_Away
FROM [PremierLeague2022]..[TACKLES2$]
ORDER BY Club_Id

--- Segregating clubs based on tackles completed per game for each PL side this season
SELECT a.Club_Id, (a.TC_Home/b.MP_Home) AS TC@Home_90, (a.TC_Away/b.MP_Away) AS TC@Away_90
FROM [PremierLeague2022]..[TACKLES2$] a
INNER JOIN [PremierLeague2022]..['STANDARD STATS$'] b
ON a.Club_Id = b.Club_Rank
ORDER BY a.Club_Id;

--- Segregating clubs based on tackles made at different areas of the pitch per 90
-- For Home
SELECT a.Club_Id, (a.[Tackles at home (DF 3rd)]/b.MP_Home) AS TCDF3rd@Home_90, (a.[Tackles at home (MF 3rd)]/b.MP_Home) AS TCMF3rd@Home, (a.[Tackles at home (ATT 3rd)]/b.MP_Home) AS TCATT3rd@Home
FROM [PremierLeague2022]..[TACKLES2$] a
INNER JOIN [PremierLeague2022]..['STANDARD STATS$'] b
ON a.Club_Id = b.Club_Rank
ORDER BY a.Club_Id;

-- For Away
SELECT a.Club_Id, (a.[Tackles at away (DF 3rd)]/b.MP_Away) AS TCDF3rd@Away_90, (a.[Tackles at away (MF 3rd)]/b.MP_Away) AS TCMF3rd@Away, (a.[Tackles at away (ATT 3rd)]/b.MP_Away) AS TCATT3rd@Away
FROM [PremierLeague2022]..[TACKLES2$] a
INNER JOIN [PremierLeague2022]..['STANDARD STATS$'] b
ON a.Club_Id = b.Club_Rank
ORDER BY a.Club_Id;

--- Inspecting data from the table "touches2"
SELECT * 
FROM [PremierLeague2022]..[TOUCHES2$]

--- Calculating touches per game for each team in the PL this season
SELECT Club_Id, (a.Touches_Home/b.MP_Home) AS Touches@Home_90, (a.Touches_Away/b.MP_Away) AS Touches@Away_90
FROM [PremierLeague2022]..[TOUCHES2$] a
INNER JOIN [PremierLeague2022]..['STANDARD STATS$'] b
ON a.Club_Id = b.Club_Rank
ORDER BY a.Club_Id;

--- Calculating touches in the penalty area per 90 for each side in the PL this season
SELECT Club_Id, (a.HomeTouches_AttPen/b.MP_Home) AS TouchesPenArea@Home_90, (a.AwayTouches_AttPen/b.MP_Away) AS TouchesPenArea@Away_90
FROM [PremierLeague2022]..[TOUCHES2$] a
INNER JOIN [PremierLeague2022]..['STANDARD STATS$'] b
ON a.Club_Id = b.Club_Rank
ORDER BY a.Club_Id;


