USE video_game_analysis;

##Insertion in genres

INSERT IGNORE INTO Genres (Genre_Name)
SELECT DISTINCT Genres
FROM Cleaned_Games_Stage
WHERE Genres IS NOT NULL AND TRIM(Genres) <> ''

UNION

SELECT DISTINCT Genre
FROM Cleaned_VGSales_Stage
WHERE Genre IS NOT NULL AND TRIM(Genre) <> '';

##Insertion in teams

INSERT IGNORE INTO Teams (Team_Name)
SELECT DISTINCT Team
FROM Cleaned_Games_Stage
WHERE Team IS NOT NULL AND TRIM(Team) <> '';

##Insertion in platforms
INSERT IGNORE INTO Platforms (Platform_Name)
SELECT DISTINCT Platform
FROM Cleaned_VGSales_Stage
WHERE Platform IS NOT NULL AND TRIM(Platform) <> '';

##Insertion in Publishers 

INSERT IGNORE INTO Publishers (Publisher_Name)
SELECT DISTINCT Publisher
FROM Cleaned_VGSales_Stage
WHERE Publisher IS NOT NULL AND TRIM(Publisher) <> '';

##Game Table

INSERT INTO Games (
    Game_Id,
    Title,
    Release_Date,
    Rating,
    Times_Listed,
    Number_Of_Reviews,
    Summary,
    Reviews,
    Plays,
    Playing,
    Backlogs,
    Wishlist
)
SELECT
    Game_Id,
    MAX(Title),
    MAX(STR_TO_DATE(Release_Date, '%Y-%m-%d')),
    MAX(Rating),
    MAX(Times_Listed),
    MAX(Number_Of_Reviews),
    MAX(Summary),
    MAX(Reviews),
    MAX(Plays),
    MAX(Playing),
    MAX(Backlogs),
    MAX(Wishlist)
FROM Cleaned_Games_Stage
WHERE Game_Id IS NOT NULL
GROUP BY Game_Id;

##Game genre table

INSERT IGNORE INTO Game_Genre (Game_Id, Genre_Id)
SELECT DISTINCT
    cg.Game_Id,
    ge.Genre_Id
FROM Cleaned_Games_Stage cg
JOIN Genres ge
    ON ge.Genre_Name = cg.Genres
JOIN Games g
    ON g.Game_Id = cg.Game_Id;
    
    
##game Teams table

INSERT IGNORE INTO Game_Teams (Game_Id, Team_Id)
SELECT DISTINCT
    cg.Game_Id,
    t.Team_Id
FROM Cleaned_Games_Stage cg
JOIN Teams t
    ON t.Team_Name = cg.Team
JOIN Games g
    ON g.Game_Id = cg.Game_Id;
    
    ##sales games table
    
    INSERT IGNORE INTO Sales_Games (Game_Name)
SELECT DISTINCT Name
FROM Cleaned_VGSales_Stage
WHERE Name IS NOT NULL;

##sales table

INSERT INTO Sales (
    Source_Rank,
    Sales_Game_Id,
    Platform_Id,
    Publisher_Id,
    Genre_Id,
    Year,
    NA_Sales,
    EU_Sales,
    JP_Sales,
    Other_Sales,
    Global_Sales
)
SELECT
    v.`Rank`,
    sg.Sales_Game_Id,
    p.Platform_Id,
    pub.Publisher_Id,
    ge.Genre_Id,
    v.`Year`,
    v.NA_Sales,
    v.EU_Sales,
    v.JP_Sales,
    v.Other_Sales,
    v.Global_Sales
FROM Cleaned_VGSales_Stage v
JOIN Sales_Games sg
    ON sg.Game_Name = v.Name
JOIN Platforms p
    ON p.Platform_Name = v.Platform
LEFT JOIN Publishers pub
    ON pub.Publisher_Name = v.Publisher
LEFT JOIN Genres ge
    ON ge.Genre_Name = v.Genre;
    
    
    
    SELECT 'Games' AS Table_Name, COUNT(*) AS Total_Rows FROM Games
UNION ALL
SELECT 'Game_Genre', COUNT(*) FROM Game_Genre
UNION ALL
SELECT 'Game_Teams', COUNT(*) FROM Game_Teams
UNION ALL
SELECT 'Sales_Games', COUNT(*) FROM Sales_Games
UNION ALL
SELECT 'Sales', COUNT(*) FROM Sales;

SELECT COUNT(*) AS Total_Platforms FROM Platforms;

SELECT COUNT(*) AS Total_Publishers FROM Publishers;

SELECT COUNT(*) AS Total_Genres FROM Genres;

SELECT COUNT(*) AS Total_Staging_Sales
FROM Cleaned_VGSales_Stage;

SELECT COUNT(*) AS Matching_Games
FROM Cleaned_VGSales_Stage v
JOIN Sales_Games sg
ON sg.Game_Name = v.Name;

SELECT COUNT(*) AS Matching_Platforms
FROM Cleaned_VGSales_Stage v
JOIN Platforms p
ON p.Platform_Name = v.Platform;

SELECT COUNT(*) AS Rows_Ready_For_Insertion
FROM Cleaned_VGSales_Stage v
JOIN Sales_Games sg
    ON sg.Game_Name = v.Name
JOIN Platforms p
    ON p.Platform_Name = v.Platform
LEFT JOIN Publishers pub
    ON pub.Publisher_Name = v.Publisher
LEFT JOIN Genres ge
    ON ge.Genre_Name = v.Genre;
    
    INSERT INTO Sales (
    Source_Rank,
    Sales_Game_Id,
    Platform_Id,
    Publisher_Id,
    Genre_Id,
    Year,
    NA_Sales,
    EU_Sales,
    JP_Sales,
    Other_Sales,
    Global_Sales
)
SELECT
    v.`Rank`,
    sg.Sales_Game_Id,
    p.Platform_Id,
    pub.Publisher_Id,
    ge.Genre_Id,
    v.`Year`,
    v.NA_Sales,
    v.EU_Sales,
    v.JP_Sales,
    v.Other_Sales,
    v.Global_Sales
FROM Cleaned_VGSales_Stage v
JOIN Sales_Games sg
    ON sg.Game_Name = v.Name
JOIN Platforms p
    ON p.Platform_Name = v.Platform
LEFT JOIN Publishers pub
    ON pub.Publisher_Name = v.Publisher
LEFT JOIN Genres ge
    ON ge.Genre_Name = v.Genre;
    
    SELECT COUNT(*) AS Total_Sales_Records
FROM Sales;


SELECT
    sg.Sales_Game_Id,
    p.Platform_Id,
    pub.Publisher_Id,
    v.Year,
    v.NA_Sales,
    v.EU_Sales,
    v.JP_Sales,
    v.Other_Sales,
    v.Global_Sales

FROM Cleaned_VGSales_Stage v

JOIN Sales_Games sg
    ON sg.Game_Name = v.Name

JOIN Platforms p
    ON p.Platform_Name = v.Platform

LEFT JOIN Publishers pub
    ON pub.Publisher_Name = v.Publisher;