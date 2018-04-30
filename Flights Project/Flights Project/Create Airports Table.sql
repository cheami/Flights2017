USE [Flights2017]
GO

CREATE TABLE [dbo].[Airports](
	[AirportID] [int] NOT NULL,
	[Name] [nvarchar](150) NULL,
	[City] [nvarchar](150) NULL,
	[Country] [nvarchar](75) NULL,
	[IATA] [nvarchar](10) NULL,
	[ICAO] [nvarchar](10) NULL,
	[Latitude] [numeric](30, 25) NULL,
	[Longitude] [numeric](30, 25) NULL,
	[Altitude] [numeric](18, 5) NULL,
	[Timezone] [numeric](18, 5) NULL,
	[DST] [nvarchar](100) NULL,
 CONSTRAINT [PK_Airports] PRIMARY KEY CLUSTERED([AirportID] ASC)
	WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [SECONDARY]) 
	ON [SECONDARY]
GO