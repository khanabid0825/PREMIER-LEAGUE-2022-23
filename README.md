# PREMIER-LEAGUE-2022-23
With a potential TV audience of 4.7 billion people, the English Premier League's exponential rise to the top of the football food chain has been nothing short of remarkable. Whether it is the intensity, the revenue, the recruitment of talent, global interest, or even the level of coaching, England's first division league is head and shoulders above the rest of its European counteparts. This Premier League season, just like all other seasons, has been no different. While some consistently high-performing sides, like Liverpool, have seen their form dip halfway through the season, other sides like Newcastle United as well as Arsenal, have stepped up to rub shoulders with Manchester City. 

The idea behind the project:
The basic idea behind this project was to utilize the data available for this current PL season to segregate teams based on different factors as well as to forecast how the rest of the seasons plays out. 
All match data up until matchday week 19 has been taken into account to differentiate clubs based on different factors that influence a game of football. These include shots on target per goals ratio, game winning percentage, points earned per game, clean sheets per 90, etc.

A walkthrough of the project:

-> https://fbref.com/en/, a very popular website that regularly updates and maintains football data, was used to extract all information significant to commence 
data exploration in Microsoft Excel and Microsoft SQL Server. 

-> The information withdrawn from the above mentioned source was then cleaned and manipulated to sit with the requirements of the project 
in Microsoft Excel. The original 'csv' file was segregated into different worksheets.

-> These XML format worksheets were then imported into the Microsoft SQL Server inside the "Premier League" database. 
With the help of different SQL functions and commands, I successfully gathered the information I needed to understand and compare the varying factors that influence the performance of a Premier League team.

-> The values gathered with each passing query were copied and subsequently pasted in another Microsoft Excel workbook for further analysis in SQL. 
Alike Table I, Table II was also imported into the "Premier League" database to perform a varying range of queries. Factors like winning percentage of a side (both home and away), points earned per game, shots on target per goals ratio, etc, were calculated.

-> After all calculations were made with the help of SQL, the results of these queries were then pasted into another workbook. 
This workbook was generally created to engineer out a model that would aid in understanding how the Premier League might wrap up this season.

-> For predictive modelling, tools like data validation, forecasting tools like what-if analysis, and statistical functions, 
preferably binomial inverse, were used to perform simulations. 
![2023-01-28](https://user-images.githubusercontent.com/123303003/215220254-ee0ddae5-0502-4d2b-a27b-8ffc39a2d4a1.png)

-> The home side was given an advantage of 0.5 over the opposition away side. A total of 10,000 games were simulated each time and the results (home win/draw/away win) were then compiled using the COUNTIF function in Microsoft Excel. 

-> To ensure the quality of our prediction model, these were the factors that were taken into consideration:

--- ATT Strength

--- DEF Strength

--- Goals per shot on target

--- Matches won by a team per 90 

--- Avg possession maintained by a side

--- Home advantage

--- Goal expectancy

-> The information extracted from both tables as well as the predictive model was then imported into Microsoft POWER BI for data visualization.  
Check here to view the interactive dashboard - https://app.powerbi.com/links/X_L_RxbQcr?ctid=bd26ed6d-f828-440c-b70f-57a97cbc2cd6&pbi_source=linkShare

What I Found:

Factors like offensive and defensive strength combined with possession, shots on target that led to a goal per 90, clean sheets maintained as well as the percentage of saves made per 90 
are strong determinants. Whilst it is impossible to accurately assess how things will pan out in the future, the prediction model does a fine job in predicting how the next couple of fixtures might pan out, keeping in view the current form and performance.
With Liverpool struggling to match up the level of performances they have put in, in the last couple of years, it's Arsenal who has deservedly ascended to the top to rub shoulders with Pep Guardiola's Manchester City.
As less of a thought as it was before the current season had began, Arsenal now happen to be the odds on favourite to win the Premier League, beating the likes of Manchester City, Newcastle Utd and Manchester Utd.
The predictive model also helped me in understanding Liverpool's fate this season, with Jurgen Klopp's side predicted to finish outside the top four.









