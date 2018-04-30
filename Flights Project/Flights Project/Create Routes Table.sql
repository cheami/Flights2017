USE [Flights2017]
GO

CREATE TABLE [dbo].[Routes](
	[Airline] [nvarchar](10) NULL,
	[AirlineID] [int] NULL,
	[SourceAirport] [nvarchar](10) NULL,
	[SourceAirportID] [int] NULL,
	[DestinationAirport] [nvarchar](10) NULL,
	[DestinationAirportID] [int] NULL,
	[Codeshare] [nvarchar](10) NULL,
	[Stops] [int] NOT NULL,
	[Equipment] [nvarchar](100) NULL,
	[RouteID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Routes] PRIMARY KEY CLUSTERED([RouteID] ASC)
	WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [SECONDARY])
	ON [SECONDARY]
GO