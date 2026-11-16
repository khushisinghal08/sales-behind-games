USE video_game_analysis;

SHOW TABLES;


CREATE TABLE Cleaned_Games_Stage (
    Game_Id INT,
    Title TEXT,
    Release_Date VARCHAR(30),
    Team TEXT,
    Rating DOUBLE,
    Times_Listed DOUBLE,
    Number_Of_Reviews DOUBLE,
    Genres TEXT,
    Summary LONGTEXT,
    Reviews LONGTEXT,
    Plays DOUBLE,
    Playing DOUBLE,
    Backlogs DOUBLE,
    Wishlist DOUBLE
);


SHOW VARIABLES LIKE 'local_infile';


SHOW VARIABLES LIKE 'secure_file_priv';

USE video_game_analysis;


LOAD DATA INFILE
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Cleaned_Games__.csv'
INTO TABLE Cleaned_Games_Stage
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@extra_index, Game_Id, Title, Release_Date, Team,
 Rating, Times_Listed, Number_Of_Reviews, Genres,
 Summary, Reviews, Plays, Playing, Backlogs, Wishlist);
 
 SELECT COUNT(*) FROM Cleaned_Games_Stage;


SELECT * FROM Cleaned_Games_Stage LIMIT 5;

SELECT COUNT(DISTINCT Game_Id)
FROM Cleaned_Games_Stage;


CREATE TABLE Cleaned_VGSales_Stage (
    `Rank` INT,
    Name TEXT,
    Platform VARCHAR(50),
    `Year` INT,
    Genre VARCHAR(100),
    Publisher TEXT,
    NA_Sales DECIMAL(10,2),
    EU_Sales DECIMAL(10,2),
    JP_Sales DECIMAL(10,2),
    Other_Sales DECIMAL(10,2),
    Global_Sales DECIMAL(10,2)
);

LOAD DATA INFILE
"C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Cleaned_VGSales.csv"
INTO TABLE Cleaned_VGSales_Stage
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@extra_index, `Rank`, Name, Platform, @year, Genre,
 Publisher, NA_Sales, EU_Sales, JP_Sales, Other_Sales, Global_Sales)
SET `Year` = NULLIF(@year, '');

SELECT COUNT(*) FROM Cleaned_VGSales_Stage;

SELECT * FROM Cleaned_VGSales_Stage LIMIT 5;



SELECT
    COUNT(*) AS Total_Rows,
    SUM(`Year` IS NULL) AS Missing_Years
FROM Cleaned_VGSales_Stage;