-- TOP 5 Genres by highest rating
SELECT Genres, round(avg(Rating), 2) as Avg_rating
From `twishi-1.google_playstore.description` 
Group by Genres
Order by Avg_rating desc
limit 5;

-- Average rating of apps for each genre
SELECT Genres, Count(ID) as NumberofApps, round(avg(Rating), 2) as Average_rating
FROM `twishi-1.google_playstore.description` 
Group by Genres
Order by NumberofApps desc;

-- Number of apps by Contect_Rating
SELECT Content_Rating, count(*) as TotalApps
FROM `twishi-1.google_playstore.description` 
GROUP BY Content_Rating
Order by TotalApps desc;

-- Which apps are consistent with the most recent android version?
SELECT Category,App, Count(*) as TotalApps
FROM `twishi-1.google_playstore.description` 
WHERE Android_Ver >= '8.0 and up'
Group by Category, App
order by TotalApps desc;

-- Top 10 most reviewed apps
SELECT d.app as App, d.genres as Genre, sum(Reviews) as NumberofReviews
FROM `twishi-1.google_playstore.description` as d
INNER JOIN `twishi-1.google_playstore.finance`as f
ON d.Id = f.Id
GROUP BY app, Genres
ORDER BY NumberofReviews desc
LIMIT 10;

-- Which 10 apps have highest number of installs?
SELECT d.app, sum(f.installs) as NumberofInstalls
FROM `twishi-1.google_playstore.description`as d
INNER JOIN `twishi-1.google_playstore.finance` as f
ON d.Id = f.Id
GROUP BY app
ORDER BY NumberofInstalls desc
LIMIT 10;

-- How many free apps are there in the education genre?
SELECT count(d.Id) as TotalApps
FROM `twishi-1.google_playstore.description` as d
INNER JOIN `twishi-1.google_playstore.finance` as f
ON d.Id = f.Id
WHERE genres = "Education" and type = "Free"

