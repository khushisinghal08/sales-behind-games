CREATE DATABASE video_game_analysis;

USE video_game_analysis;

-- 1. Genres Table
CREATE TABLE Genres (
    Genre_Id INT AUTO_INCREMENT PRIMARY KEY,
    Genre_Name VARCHAR(100) UNIQUE NOT NULL
) ENGINE=InnoDB;

-- 2. Teams Table
CREATE TABLE Teams (
    Team_Id INT AUTO_INCREMENT PRIMARY KEY,
    Team_Name VARCHAR(255) UNIQUE NOT NULL
) ENGINE=InnoDB;

-- 3. Platforms Table
CREATE TABLE Platforms (
    Platform_Id INT AUTO_INCREMENT PRIMARY KEY,
    Platform_Name VARCHAR(50) UNIQUE NOT NULL
) ENGINE=InnoDB;


-- 4. Publishers Table
CREATE TABLE Publishers (
    Publisher_Id INT AUTO_INCREMENT PRIMARY KEY,
    Publisher_Name VARCHAR(255) UNIQUE NOT NULL
) ENGINE=InnoDB;

-- 5. Games Table (Engagement Dataset)
CREATE TABLE Games (
    Game_Id INT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Release_Date DATE,
    Rating DECIMAL(3,2),
    Times_Listed INT,
    Number_Of_Reviews INT,
    Summary LONGTEXT,
    Reviews LONGTEXT,
    Plays INT,
    Playing INT,
    Backlogs INT,
    Wishlist INT
) ENGINE=InnoDB;

-- 6. Game Genre Bridge Table
CREATE TABLE Game_Genre (
    Game_Id INT,
    Genre_Id INT,

    PRIMARY KEY (Game_Id, Genre_Id),

    FOREIGN KEY (Game_Id)
        REFERENCES Games(Game_Id),

    FOREIGN KEY (Genre_Id)
        REFERENCES Genres(Genre_Id)
) ENGINE=InnoDB;


-- 7. Game Teams Bridge Table
CREATE TABLE Game_Teams (
    Game_Id INT,
    Team_Id INT,

    PRIMARY KEY (Game_Id, Team_Id),

    FOREIGN KEY (Game_Id)
        REFERENCES Games(Game_Id),

    FOREIGN KEY (Team_Id)
        REFERENCES Teams(Team_Id)
) ENGINE=InnoDB;

-- 8. Sales Games Table
CREATE TABLE Sales_Games (
    Sales_Game_Id INT AUTO_INCREMENT PRIMARY KEY,
    Game_Name VARCHAR(255) UNIQUE NOT NULL
) ENGINE=InnoDB;


-- 9. Sales Fact Table
CREATE TABLE Sales (
    Sale_Id INT AUTO_INCREMENT PRIMARY KEY,

    Source_Rank INT,
    Sales_Game_Id INT NOT NULL,
    Platform_Id INT NOT NULL,
    Publisher_Id INT,
    Genre_Id INT,

    Year INT,

    NA_Sales DECIMAL(10,2),
    EU_Sales DECIMAL(10,2),
    JP_Sales DECIMAL(10,2),
    Other_Sales DECIMAL(10,2),
    Global_Sales DECIMAL(10,2),

    FOREIGN KEY (Sales_Game_Id)
        REFERENCES Sales_Games(Sales_Game_Id),

    FOREIGN KEY (Platform_Id)
        REFERENCES Platforms(Platform_Id),

    FOREIGN KEY (Publisher_Id)
        REFERENCES Publishers(Publisher_Id),

    FOREIGN KEY (Genre_Id)
        REFERENCES Genres(Genre_Id)
) ENGINE=InnoDB;



-- Indexes for analytical queries
CREATE INDEX idx_games_title ON Games(Title);
CREATE INDEX idx_sales_year ON Sales(Year);
CREATE INDEX idx_sales_global ON Sales(Global_Sales);
CREATE INDEX idx_sales_game ON Sales(Sales_Game_Id);







