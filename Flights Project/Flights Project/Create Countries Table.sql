USE [Flights2017]
GO

CREATE TABLE [dbo].[Countries](
	[Country] [nvarchar](75) NOT NULL,
	[CountryID] [nvarchar](10) NOT NULL,
	[ISO] [nvarchar](10) NULL,
	[Continent] [nvarchar](10) NULL,
 CONSTRAINT [PK_Countries_1] PRIMARY KEY CLUSTERED([Country] ASC)
	WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [SECONDARY])
	ON [SECONDARY]
GO