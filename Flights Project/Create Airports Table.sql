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
DROP TABLE IF EXISTS [Airports]
GO
CREATE TABLE [dbo].[Airports]
	(
	[AirportID] [int] NOT NULL,
	[Name] [nvarchar](150) NULL,
	[City] [nvarchar](150) NULL,
	[Country] [nvarchar](150) NULL,
	[IATA] [nvarchar](150) NULL,
	[ICAO] [nvarchar](150) NULL,
	[Latitude] [numeric](30, 0) NULL,
	[Longitude] [numeric](30, 0) NULL,
	[Altitude] [numeric](30, 0) NULL,
	[Timezone] [numeric](30, 0) NULL,
	[DST] [nvarchar](150) NULL
	)  ON SECONDARY
GO
ALTER TABLE [dbo].[Airports] SET (LOCK_ESCALATION = TABLE)
GO
COMMIT