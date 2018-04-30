/*
Multi Statement Table-value Function to return all flights in a country with source location.
Parameter 1: Country
Parameter 2: Airport IATA

Example: SELECT * FROM [dbo].[FlightsInCountryByAirportCode]('United States', 'TPA')
This returns all flights that depart (source) from TPA and arrives (destination) in same country (United States).
*/

USE [Flights2017]
GO

CREATE FUNCTION [dbo].[FlightsInCountryByAirportCode](
	@country nvarchar(50), 
	@airportcode nvarchar(10))
RETURNS TABLE
AS RETURN
(
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
         WHERE  ap.Country = @country), 
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
         WHERE  ap.Country = @country) 
SELECT Source.RouteID, 
       Source.[Airline Name], 
       Source.[Source Airport Code], 
       Source.[Source Airport], 
       Source.[Source City], 
       Destination.[Destination Airport Code], 
       Destination.[Destination Airport], 
       Destination.[Destination City], 
       Destination.Country 
FROM   Source 
       JOIN Destination 
         ON Source.RouteID = Destination.RouteID 
WHERE  [Source Airport Code] = @airportcode)
GO


