# Layoffs-Global-Data-Analysis
Layoffs-Global-Data-Analysis-Project

## INTRODUCTION
This project analyses global company layoffs using the Layoffs dataset from Kaggle. 
The dashboard was created in Tableau to explore layoff trends across companies, countries, funding stages, and time periods.
The objective of this project is to identify patterns in workforce reductions, understand the industries and companies most affected, and analyze how layoffs changed over time.

## OBJECTIVES
* Clean raw layoffs data using SQL
* Perform exploratory data analysis
* Identify global layoff trends
* Build an interactive Tableau dashboard
* Generate meaningful business insights

## DATASET INFORMATION

#### Dataset Source
Layoffs Dataset from [Kaggle.](https://www.kaggle.com/datasets/theakhilb/layoffs-data-2022) Data includes worldwide company layoffs from different industries and funding stages.

#### Dataset Contains:
`company`   Company Name
`location`	Location
`industry`	Industry
`country`	  Country
`total_laid_off`	 Number of Employees Laid Off
`percentage_laid_off`   Percentage Laid Off
`funds_raised_millions`	  Funding Raised
`stage`  Company Stage
`date`  Date of Layoffs


## DATA CLEANING PROCESS
The cleaning process followed these major steps:

1. Create staging tables
2. Remove duplicates
3. Standardize data
  * Handle null values
  * Fix formatting issues
4. Remove unnecessary rows and columns

[Data Cleaning Using SQL](https://github.com/DeeptivkAnalyst-art/Layoffs-Global-Data-Analysis/blob/main/LayoffsDataCleaning-SQLPortfolioProject1.sql)

## EXPLORATORY DATA ANALYSIS (EDA)
The analysis included
1. Companies with the biggest single Layoff (single day).
2. Companies with the most Total Layoffs.
3. Companies with the most Layoffs per year.
4. Rolling Total of Layoffs Per Month.
[Complete Exploratory Data Analysis (EDA) Using SQL.](https://github.com/DeeptivkAnalyst-art/Layoffs-Global-Data-Analysis/blob/main/LayoffsEDA-SQLPortfolioProjecT1.sql)


## VISUALIZATION :- 

[LAYOFFS DASHBOARD](https://public.tableau.com/app/profile/deepti.k6698/viz/LayoffsDashboardProject/Dashboard1)

##### 1. Rolling Total of Layoffs Per Month

```
SELECT SUBSTRING(date,1,7) as dates, SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging2
GROUP BY dates
ORDER BY dates ASC;

WITH DATE_CTE AS 
(
SELECT SUBSTRING(date,1,7) as dates, SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging2
GROUP BY dates
ORDER BY dates ASC
)
SELECT dates, SUM(total_laid_off) OVER (ORDER BY dates ASC) as rolling_total_layoffs
FROM DATE_CTE
ORDER BY dates ASC;
```
<img width="495" height="626" alt="1" src="https://github.com/user-attachments/assets/b196ecf7-4228-4257-bd25-c77da01ed67f" />


##### 2. Layoffs by Funding Stage

```
SELECT stage, SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging2
GROUP BY stage
ORDER BY total_laid_off DESC;
```
<img width="726" height="615" alt="2" src="https://github.com/user-attachments/assets/b4a1492d-7d85-4168-b489-90c8a97a8797" />

##### 3. Layoffs by Country
```
SELECT country, SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging2
GROUP BY country
ORDER BY total_laid_off DESC;
```
<img width="456" height="359" alt="3" src="https://github.com/user-attachments/assets/e21135be-5360-4780-980c-2e13c5a1ad6b" />


##### 4. Top 10 Companies by Total Layoffs
```
SELECT company, SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging2
GROUP BY company
ORDER BY total_laid_off DESC
LIMIT 10;
```
<img width="691" height="629" alt="4" src="https://github.com/user-attachments/assets/1f56a3b5-2629-4b9b-ab4b-2569dd40fd20" />

##### 5. Top 10 Companies with 100% Layoffs (By Funds Raised)
```
SELECT company, MAX(funds_raised) AS funds_raised
FROM layoffs_staging2
WHERE total_laid_off >= 100
GROUP BY company
ORDER BY funds_raised DESC
LIMIT 10;
```
<img width="537" height="492" alt="5" src="https://github.com/user-attachments/assets/694c4325-7696-40ef-aa60-e0fe224cbefa" />


### Key Insights
* The United States recorded the highest layoffs.
* Tech companies dominated global layoffs.
* Layoffs steadily increased over time.
* Post-IPO firms experienced major workforce reductions.
* Several startups shut down completely after funding challenges.

### Conclusion

1. This project demonstrates a complete end-to-end data analytics workflow:
* Raw data cleaning using SQL
* Exploratory analysis using MySQL
* Interactive dashboard creation in Tableau
* Business insight generation
  
2. The dashboard provides valuable insights into:
* Global layoff trends
* Company workforce reductions
* Country-wise economic impact
* Startup funding risks
* Industry-level layoffs.






