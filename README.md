🎮 **Sales Behind Games – End-to-End Video Game Sales & Engagement Analysis**

📌 ** Project Overview**

Sales Behind Games is an end-to-end data analytics capstone project focused on understanding the video game industry's sales performance, regional market trends, game ratings, and player engagement.

The project combines two datasets to explore different aspects of the gaming industry:

Video Game Sales Dataset: Analyses global sales, regional performance, platforms, genres, publishers, and yearly sales trends.

Game Engagement Dataset: Explores game ratings, reviews, plays, playing activity, backlogs, and wishlists.

The project follows a complete analytics workflow, including data preparation, relational database design, data loading, SQL-based business analysis, interactive Power BI dashboards, and business insight generation.

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

1. Microsoft Excel

Excel was used for data preparation and standardisation.

Game Engagement Dataset

Updated the data types of seven fields: Release Date, Times Listed, Number of Reviews, Plays, Playing, Backlogs, and Wishlist.

Converted abbreviated values in Number of Reviews, Plays, Playing, Backlogs, and Wishlist into numeric values by handling K, M, and commas.

Expanded the multi-value Team and Genre fields into separate records.

Standardised column names and records.

Removed duplicate records.

Filled missing Rating values using the average rating of the corresponding genre.

Video Game Sales Dataset

Converted Year from a decimal/float format to an integer format.

Replaced missing Publisher values with Unknown.

Data Quality Note: Ratings filled using genre averages are estimated values, not original user ratings. This should be considered when interpreting rating-based results.

2. Python

Python was used for exploratory data analysis and working with the datasets.

Libraries used:

Pandas

NumPy

Cleaned Dataset : https://github.com/khushisinghal08/sales-behind-games/tree/main/3_cleaned_datasets

Python Notebooks : https://github.com/khushisinghal08/sales-behind-games/tree/main/2_Python_Notebooks

🛢️ Database Design & SQL Analysis

Database: MySQL 8.0
Database Tool: MySQL Workbench
Database Name: video_game_analysis

The cleaned data was organised into a relational database using separate lookup tables and bridge tables to manage multi-value relationships, such as games belonging to multiple genres or teams.

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

<img width="1422" height="808" alt="image" src="https://github.com/user-attachments/assets/75d25e34-aec4-4a9b-aec7-00e0fb2b8691" />

<img width="1457" height="817" alt="image" src="https://github.com/user-attachments/assets/bf12635b-07c4-4003-a13f-fd36b0ac7ea6" />

<img width="1442" height="821" alt="image" src="https://github.com/user-attachments/assets/05c56442-83df-47c1-875d-6b7a806d53be" />

<img width="1486" height="821" alt="image" src="https://github.com/user-attachments/assets/9ec414a7-6efa-4849-a728-7bc0a527634d" />

<img width="1413" height="791" alt="image" src="https://github.com/user-attachments/assets/cfcea224-c6e9-407a-8a33-08a9f807c949" />

Tool Used : PowerBI

Key Measures Used :

Top Selected or Overall Platform (Returns the Platform which is Highest in Sales)

Highest Selling game

Top Publisher & Team 

Dashboard File : https://github.com/khushisinghal08/sales-behind-games/tree/main/5_Interactive_Dashboard


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

📄 Business Report

A detailed business report is available here : https://github.com/khushisinghal08/sales-behind-games/tree/main/6_business_report

It documents the project objectives, datasets, methodology, data preparation, analysis, dashboard findings, business recommendations, and conclusion.

⚙ Tech Stack
Python (Numpy,Pandas)

SQL

PowerBI (DAX Queries)

🛠 Tool Stack

Microsoft Excel

Jupyter Notebook (Data Cleaning & Preparation)

MySQL 8.0

MySQL Workbench

Microsoft PowerBI (Dashboard Visualization)

🏁 Conclusion

The Sales Behind Games project demonstrates how raw datasets can be transformed into structured information and actionable business insights.

By combining MySQL-based data management, SQL analysis, and Power BI visualization, the project explores both the commercial performance of video games and the behaviour of their player communities.

It also highlights an important distinction: a game's sales performance, player engagement, and ratings do not always move together.

This project represents my practical application of data analytics concepts across the complete data analysis lifecycle.

Project: Sales Behind Games – End-to-End Video Game Sales & Engagement Analysis

Tools: MySQL Workbench | SQL | Power BI | Excel

Author: Khushi Singhal

Linkedin : www.linkedin.com/in/khushi-singhal-

Email - khushisinghal694@gmail.com




