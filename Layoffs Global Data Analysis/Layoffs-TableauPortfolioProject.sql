/*Tableau Visualization*/
/*--1. Rolling Total of Layoffs Per Month*/

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



/*2.Layoffs by Funding Stage
This query shows the total number of layoffs for each company funding stage (e.g. Series A, Post-IPO)*/

SELECT stage, SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging2
GROUP BY stage
ORDER BY total_laid_off DESC;
    
    
    
/*3. Layoffs by Country
This query shows which countries have experienced the most layoffs.*/

SELECT country, SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging2
GROUP BY country
ORDER BY total_laid_off DESC;
    
    
    
/*4.Top 10 Companies by Total Layoffs¶
This query highlights the companies with the most total layoffs.*/

SELECT company, SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging2
GROUP BY company
ORDER BY total_laid_off DESC
LIMIT 10;
    
    
    
/*5. Top 10 Companies with 100% Layoffs (By Funds Raised)
Shows companies that raised significant funds but still laid off 100% of employees.*/

SELECT company, MAX(funds_raised) AS funds_raised
FROM layoffs_staging2
WHERE total_laid_off >= 100
GROUP BY company
ORDER BY funds_raised DESC
LIMIT 10;
    
    
    
    
    
    
    