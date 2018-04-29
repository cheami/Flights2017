/*
Scalar-value Function to return distance, in miles, between airports.
Parameter 1: Airport IATA 1
Parameter 2: Airport IATA 2

Example: SELECT [dbo].[GetDistanceMi]('TPA', 'LAS') as [Distance in miles]
This returns the distance, in miles, between TPA and LAS.
*/

USE [Flights2017]
GO

CREATE FUNCTION [dbo].[GetDistanceMi]
(
	@SourceAirport nvarchar(10),
	@DestinationAirport nvarchar(10)
)
RETURNS numeric(15,5) WITH SCHEMABINDING
AS
BEGIN
	DECLARE @Distance numeric(15,5)
	IF NOT EXISTS (select IATA from [dbo].[Airports] where IATA = @SourceAirport) OR NOT EXISTS (select IATA from [dbo].[Airports] where IATA = @DestinationAirport)
		RETURN NULL
	DECLARE @SourceLoc geography = geography::Point((select Latitude from [dbo].[Airports] where IATA = @SourceAirport), (select Longitude from [dbo].[Airports] where IATA = @SourceAirport), 4326);

	SELECT @Distance = @SourceLoc.STDistance(geography::Point((select Latitude from [dbo].[Airports] where IATA = @DestinationAirport), (select Longitude from [dbo].[Airports] where IATA = @DestinationAirport), 4326))

	RETURN @Distance/1000*0.621371

END
GO