/*
View to return RouteID and distance, in miles, for all routes. 
Distances will NOT be unique. Distance from A to B is the same distance from B to A. Multiple airlines can travel from A to B.

Example: SELECT [RouteID], [Distance] FROM [Flights2017].[dbo].[RouteDistanceMi] ORDER BY [Distance] DESC
This returns the RouteID and distance, in miles, and orders the results by the greatest to least distance.
*/

USE [Flights2017]
GO

CREATE VIEW [dbo].[RouteDistanceMi]
WITH SCHEMABINDING
AS
	SELECT routes.RouteID, [dbo].[GetDistanceMi] (routes.SourceAirport,routes.DestinationAirport) as Distance
	FROM dbo.Routes
GO