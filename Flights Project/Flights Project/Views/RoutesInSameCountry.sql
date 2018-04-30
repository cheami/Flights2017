/*
View to return all routes with same source and destination country.

Example: SELECT * FROM [dbo].[RoutesInSameCountry]
Returns all routes with same source and destination country.
*/

USE [Flights2017]
GO

CREATE VIEW [dbo].[RoutesInSameCountry]
AS
WITH Source 
    AS (SELECT r.RouteID	AS [Source RouteID],
            al.NAME         AS [Airline Name], 
            r.SourceAirport AS [Source Airport Code], 
            ap.NAME         AS [Source Airport], 
            ap.City         AS [Source City], 
            ap.Country 		AS [Source Country]
        FROM   dbo.Routes AS r 
            JOIN dbo.Airports AS ap 
                ON r.SourceAirportID = ap.AirportID 
            JOIN dbo.Airlines AS al 
                ON r.AirlineID = al.AirlineID), 
    Destination 
    AS (SELECT r.RouteID		 AS [Destination RouteID], 
            r.DestinationAirport AS [Destination Airport Code], 
            ap.NAME              AS [Destination Airport], 
            ap.City              AS [Destination City], 
            ap.Country			 AS [Destination Country]
        FROM   dbo.Routes AS r 
            JOIN dbo.Airports AS ap 
                ON r.DestinationAirportID = ap.AirportID 
            JOIN dbo.Airlines AS al 
                ON r.AirlineID = al.AirlineID)
SELECT [Source RouteID] AS RouteID, [Airline Name], [Source Airport Code], [Source Airport], [Source City], [Destination Airport Code], [Destination Airport], [Destination City], [Source Country]
FROM   Source 
       JOIN Destination 
         ON Source.[Source RouteID] = Destination.[Destination RouteID]
		 AND Source.[Source Country] = Destination.[Destination Country]
GO