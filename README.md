💻 Game : Sales & Engagement Optimization
Analyzed and visualized the video game sales and engagement data to uncover trends in game popularity, user behavior, and platform performance by merging sales and engagement data.


📌 Problem Statement
To Clean & Standardize the data in Dataset and enforcing the relationship between tables and then analyze and visualize the video game sales and engagement data to uncover trends in game popularity, user behavior, and platform performance and make a interactive user friendly Dashboard.

🏢 Dataset
Data : VG Sales & Engagement Data (1980 -2025) https://github.com/khushisinghal08/sales-behind-games/tree/main/1_Raw_Dataset
Source : Kaggle
Size :
Games Meta → 1512 rows & 14 columns.
Games Sales → 16598 rows & 11 columns.
Fields :
Games Meta → Team,Release_Date,Team,Rating etc.
Games Sales → Name ,Platform ,Genre ,Publisher ,Region Sales etc.

🧹 Data Cleaning & Preparation
--> Games Meta :-
Changed Data type of 7 fields (Release Date,Times Listed,Number of Reviews,Plays,Playing,Backlog,Wishlist) for accurate analysis.
Converted the Values of columns (Number of Reviews,Plays,Playing,Backlog,Wishlist by replacing {K,M,comma}).
Exploded Team & Genre Fields by unpivoting them.
Standardized Column names & their records following by removing duplicates.
Replacing null values in Rating with their respective genres average rating.
--> Games Sales :-
Converted Data type of Year from float to int for better calculated analysis.
Replaced null values from Publisher to ‘Unknown’ .

Cleaned Dataset : https://github.com/khushisinghal08/sales-behind-games/tree/main/3_cleaned_datasets

Python Notebooks : https://github.com/khushisinghal08/sales-behind-games/tree/main/2_Python_Notebooks

🔁 Data Pre-Processing / Transformation
Split & transformed the cleaned 2 Dataset (csv files) in to 8 tables and enforced the primary keys and unique keys in them for maintaining relationship.
Fact Tables : Sales & Games
Dimension Tables : Genres,Platforms,Publishers,Teams,Game_genres,Games_Teams
Inserted Cleaned records from Sales and Games Cleaned CSV files in to tables

SQL Queries : https://github.com/khushisinghal08/sales-behind-games/tree/main/4_sql_queries

📈 Exploratory Data Analysis (EDA)
Adventure Genre genrates 66 % of overall sales.
X360 and PS3 produces highest sales across all platforms.
Sales peaked during 2006 - 2013 Years.
Total Sales is done 2.29k.
Strategy based games have highest rating (4.0).
More than 40% of users has played and playing on Nintendo Publisher.

🏨 Dashboard / Visualization

<img width="1458" height="807" alt="image" src="https://github.com/user-attachments/assets/16af0153-edd9-4bce-a168-83ddfb1313ae" />

<img width="1452" height="815" alt="image" src="https://github.com/user-attachments/assets/57cc131d-b0a4-46b4-a794-1a23bfb2d365" />

<img width="1427" height="805" alt="image" src="https://github.com/user-attachments/assets/48a3cb7d-4995-47a7-9e2b-6f6683f58360" />

<img width="1408" height="811" alt="image" src="https://github.com/user-attachments/assets/ae505ddf-c47c-4975-8e35-b692b3dda594" />

<img width="1447" height="803" alt="image" src="https://github.com/user-attachments/assets/7cc7e0cd-40c4-4580-aa47-4fa6002e1790" />

Tool Used : PowerBI
Key Measures Used :
Top Selected or Overall Platform (Returns the Platform which is Highest in Sales)
Highest Selling game
Top Publisher & Team 

💡 Key Business Insights

The analysis highlighted several important patterns:

Sales Leadership: Grand Theft Auto V emerged as the highest-selling game in the analysed sales data.

Regional Preference: North America contributed the largest share of global sales.

Genre Performance: Adventure was identified as the highest-revenue genre.

Ratings vs Sales: Higher game ratings did not necessarily translate into higher sales. Some strategy-based genres received strong ratings while contributing comparatively less to sales.

Yearly Trends: Sales showed an overall growth pattern across several years, followed by a noticeable decline after 2022.

Publisher Performance: Nintendo was identified as a leading publisher in the analysis.

Platform Performance: X360 and PS3 were among the notable platforms in the analysis.

Player Engagement: Grand Theft Auto V led the displayed most-played games.

Player Interest: Yakuza 0 led the displayed most-wishlisted games.

🗣 Recommendations
Company must consider those Budget games which can be accessible on X360 or PS3 Platforms and focus more on Adventure Genre.
Adventure Genre games should make some updates by putting Strategies & Puzzles in their games with a storyline making them good in rating too.
Advertise more in Japan and Europe as they produce less sales.

⚙ Tech Stack
Python (Numpy,Pandas)
SQL
PowerBI (DAX Queries)

🛠 Tool Stack
Jupyter Notebook (Data Cleaning & Preparation)
SQL Server Management Studio (SSMS) - (Creating Tables & Relationship)
Microsoft PowerBI (Dashboard Visualization)

🏁 Conclusion

The Sales Behind Games project demonstrates how raw datasets can be transformed into structured information and actionable business insights.

By combining MySQL-based data management, SQL analysis, and Power BI visualization, the project explores both the commercial performance of video games and the behaviour of their player communities.

It also highlights an important distinction: a game's sales performance, player engagement, and ratings do not always move together.

This project represents my practical application of data analytics concepts across the complete data analysis lifecycle.

Project: Sales Behind Games – End-to-End Video Game Sales & Engagement Analysis
Tools: MySQL Workbench | SQL | Power BI | Excel
Author: Khushi Singhal




