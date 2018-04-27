BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
USE Flights2017
GO
DROP TABLE IF EXISTS [Routes]
GO
CREATE TABLE [dbo].[Routes]
	(
	[Airline] [nvarchar](10) NULL,
	[AirlineID] [numeric](18, 0) NULL,
	[SourceAirport] [nvarchar](10) NULL,
	[SourceAirportID] [numeric](18, 0) NULL,
	[DestinationAirport] [nvarchar](10) NULL,
	[DestinationAirportID] [numeric](18, 0) NULL,
	[Codeshare] [nvarchar](10) NULL,
	[Stops] [numeric](18, 0) NULL,
	[Equipment] [nvarchar](100) NULL
	)  ON SECONDARY
GO
ALTER TABLE [dbo].[Routes] SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
