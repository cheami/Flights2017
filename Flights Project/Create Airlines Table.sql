USE [Flights2017]
GO

CREATE TABLE [dbo].[Airlines](
	[AirlineID] [int] NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Alias] [nvarchar](100) NULL,
	[IATA] [nvarchar](10) NULL,
	[ICAO] [nvarchar](10) NULL,
	[Callsign] [nvarchar](100) NULL,
	[Country] [nvarchar](75) NULL,
	[Active] [nvarchar](10) NULL,
 CONSTRAINT [PK_Airlines] PRIMARY KEY CLUSTERED([AirlineID] ASC)
	WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [SECONDARY]) 
	ON [SECONDARY]
GO