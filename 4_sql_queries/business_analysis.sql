use video_game_analysis;

##Top 10 best selling games

SELECT * FROM sales_games;
SELECT * FROM sales;

SELECT s.Game_name , SUM(s2.Global_Sales) AS Total_global_sales
FROM sales_games s 
JOIN sales s2 
ON s.Sales_Game_Id = s2.Sales_Game_Id
GROUP BY s.Game_Name
ORDER BY Total_global_sales DESC
LIMIT 10;


## Best performing plateforms

SELECT p.Platform_Name , SUM(s.Global_Sales) AS Total_global_sales
FROM platforms p 
JOIN sales s 
ON p.Platform_Id = s.Platform_Id
GROUP BY p.Platform_Name
ORDER BY Total_global_sales DESC;

##Genre-wise global sales

SELECT g.Genre_Name ,  SUM(s.Global_Sales) AS Total_global_sales
FROM genres g 
JOIN sales s
ON g.Genre_Id = s.Genre_Id
GROUP BY g.Genre_Name 
ORDER BY Total_global_sales DESC;

##Year-wise global sales trend

SELECT YEAR as Release_year, SUM(Global_Sales) AS Total_global_sales
FROM sales
WHERE Year IS NOT NULL
GROUP BY Release_year
ORDER BY Release_year;

##Top 5 publishers by global sales

SELECT p.Publisher_Name , SUM(s.Global_Sales) AS Total_global_sales
FROM publishers p 
JOIN sales s 
ON p.Publisher_Id = s.Publisher_Id
GROUP BY  p.Publisher_Name
ORDER BY Total_global_sales DESC
LIMIT 5;

##Regional sales comparison

SELECT SUM(NA_Sales) AS North_America_sales, SUM(EU_Sales) AS Europe_sales , SUM(JP_Sales) AS Japan_sales , SUM(Other_Sales) AS other_sales , SUM(Global_Sales) AS Total_global_sales
FROM sales;

##Platform-wise regional sales

SELECT
    p.Platform_Name,
    SUM(s.NA_Sales) AS North_America_Sales,
    SUM(s.EU_Sales) AS Europe_Sales,
    SUM(s.JP_Sales) AS Japan_Sales,
    SUM(s.Global_Sales) AS Total_Global_Sales
FROM Platforms p
JOIN Sales s
    ON p.Platform_Id = s.Platform_Id
GROUP BY p.Platform_Name
ORDER BY Total_Global_Sales DESC;


SELECT
    'North America' AS Region,
    SUM(NA_Sales) AS Total_Sales,
    ROUND(
        SUM(NA_Sales) * 100.0 / SUM(Global_Sales),
        2
    ) AS Sales_Percentage
FROM Sales

UNION ALL

SELECT
    'Europe',
    SUM(EU_Sales),
    ROUND(SUM(EU_Sales) * 100.0 / SUM(Global_Sales), 2)
FROM Sales

UNION ALL

SELECT
    'Japan',
    SUM(JP_Sales),
    ROUND(SUM(JP_Sales) * 100.0 / SUM(Global_Sales), 2)
FROM Sales

UNION ALL

SELECT
    'Other',
    SUM(Other_Sales),
    ROUND(SUM(Other_Sales) * 100.0 / SUM(Global_Sales), 2)
FROM Sales;

##Top 5 best-selling games in each region.
WITH regional_sales AS (

    SELECT
        sg.Game_Name,
        'North America' AS Region,
        SUM(s.NA_Sales) AS Total_Sales
    FROM Sales_Games sg
    JOIN Sales s
        ON sg.Sales_Game_Id = s.Sales_Game_Id
    GROUP BY sg.Game_Name

    UNION ALL

    SELECT
        sg.Game_Name,
        'Europe' AS Region,
        SUM(s.EU_Sales) AS Total_Sales
    FROM Sales_Games sg
    JOIN Sales s
        ON sg.Sales_Game_Id = s.Sales_Game_Id
    GROUP BY sg.Game_Name

    UNION ALL

    SELECT
        sg.Game_Name,
        'Japan' AS Region,
        SUM(s.JP_Sales) AS Total_Sales
    FROM Sales_Games sg
    JOIN Sales s
        ON sg.Sales_Game_Id = s.Sales_Game_Id
    GROUP BY sg.Game_Name
),

ranked_games AS (
    SELECT
        Game_Name,
        Region,
        Total_Sales,
        RANK() OVER (
            PARTITION BY Region
            ORDER BY Total_Sales DESC
        ) AS Game_Rank
    FROM regional_sales
)

SELECT
    Region,
    Game_Name,
    Total_Sales,
    Game_Rank
FROM ranked_games
WHERE Game_Rank <= 5
ORDER BY Region, Game_Rank;

##Which publishers have the highest average sales per game

SELECT
    p.Publisher_Name,
    COUNT(DISTINCT sg.Sales_Game_Id) AS Total_Games,
    ROUND(AVG(game_sales.Total_Global_Sales), 2) AS Avg_Sales_Per_Game
FROM Publishers p
JOIN (
    SELECT
        Publisher_Id,
        Sales_Game_Id,
        SUM(Global_Sales) AS Total_Global_Sales
    FROM Sales
    GROUP BY Publisher_Id, Sales_Game_Id
) game_sales
    ON p.Publisher_Id = game_sales.Publisher_Id
JOIN Sales_Games sg
    ON game_sales.Sales_Game_Id = sg.Sales_Game_Id
GROUP BY p.Publisher_Id, p.Publisher_Name
ORDER BY Avg_Sales_Per_Game DESC
LIMIT 10;

##Which games have global sales higher than the average global sales of all games?

WITH game_sales AS (
    SELECT
        sg.Sales_Game_Id,
        sg.Game_Name,
        SUM(s.Global_Sales) AS Total_Global_Sales
    FROM Sales_Games sg
    JOIN Sales s
        ON sg.Sales_Game_Id = s.Sales_Game_Id
    GROUP BY
        sg.Sales_Game_Id,
        sg.Game_Name
),

average_sales AS (
    SELECT
        AVG(Total_Global_Sales) AS Avg_Global_Sales
    FROM game_sales
)

SELECT
    gs.Game_Name,
    gs.Total_Global_Sales
FROM game_sales gs
CROSS JOIN average_sales av
WHERE gs.Total_Global_Sales > av.Avg_Global_Sales
ORDER BY gs.Total_Global_Sales DESC;

