-- Count of airports in countries descending order
select Country, count(*) as count
from dbo.Airports
group by Airports.Country
order by count desc
GO

-- Count of airports in countries descending order with percentages of airports in country in world
select Country, count(*) as [Number of Airports], cast(count(*) * 100.0/(sum(count(*)) over()) as numeric(6,3)) as Percentage
from dbo.Airports
group by Airports.Country
order by [Number of Airports] desc
GO

-- Count of routes per airline in descending order
select Airlines.Name, count(*) as [Number of Routes]
from dbo.Routes
join dbo.Airlines
on airlines.AirlineID = Routes.AirlineID
group by Airlines.Name
order by [Number of Routes] desc
GO

-- Count of routes per airline in United States. Also return running total in order of Number of Routes Descending
WITH Source 
    AS (SELECT r.RouteID, 
            al.NAME         AS [Airline Name], 
            r.SourceAirport AS [Source Airport Code], 
            ap.NAME         AS [Source Airport], 
            ap.City         AS [Source City], 
            ap.Country 
        FROM   dbo.Routes AS r 
            JOIN dbo.Airports AS ap 
                ON r.SourceAirportID = ap.AirportID 
            JOIN dbo.Airlines AS al 
                ON r.AirlineID = al.AirlineID 
        WHERE  ap.Country = 'united states'), 
    Destination 
    AS (SELECT r.RouteID, 
            al.NAME              AS [Airline Name], 
            r.DestinationAirport AS [Destination Airport Code], 
            ap.NAME              AS [Destination Airport], 
            ap.City              AS [Destination City], 
            ap.Country 
        FROM   dbo.Routes AS r 
            JOIN dbo.Airports AS ap 
                ON r.DestinationAirportID = ap.AirportID 
            JOIN dbo.Airlines AS al 
                ON r.AirlineID = al.AirlineID 
        WHERE  ap.Country = 'united states') 
SELECT Source.[Airline Name], COUNT(*) as [Number of Routes], SUM(COUNT(*)) OVER(ORDER BY COUNT(*) DESC ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) as [Running Total]
FROM   Source 
       JOIN Destination 
         ON Source.RouteID = Destination.RouteID 
GROUP BY Source.[Airline Name]
ORDER BY [Number of Routes] DESC
GO

-- Returns the number of routes and airline rank for routes with same source and destination country. Uses user defined view.
SELECT [Airline Name], [Source Country], COUNT(*) as [Number of Routes], ROW_NUMBER() OVER(PARTITION BY [Source Country] ORDER BY COUNT(*) DESC) AS [Airline rank in Country]
FROM   [dbo].[RoutesInSameCountry]
GROUP BY [Source Country], [Airline Name]
GO

-- Top 5 distances for each country, removed duplicate routes where airlines are the same. This avoids same routes twice because round trips
WITH C as
(
	SELECT DISTINCT [Source Country] FROM RoutesInSameCountry JOIN RouteDistanceMi 
		on RoutesInSameCountry.RouteID = RouteDistanceMi.RouteID
),
D AS
(
	SELECT RoutesInSameCountry.[Airline Name], RoutesInSameCountry.[Source Country], RouteDistanceMi.Distance FROM RoutesInSameCountry JOIN RouteDistanceMi 
		on RoutesInSameCountry.RouteID = RouteDistanceMi.RouteID
		GROUP BY RoutesInSameCountry.[Airline Name], RoutesInSameCountry.[Source Country], RouteDistanceMi.Distance
)

SELECT C.[Source Country], K.[Airline Name], K.Distance
FROM C
CROSS APPLY (SELECT TOP 5 * FROM D WHERE C.[Source Country] = D.[Source Country] ORDER BY D.Distance DESC) as K
ORDER BY C.[Source Country], K.Distance, K.[Airline Name]
GO