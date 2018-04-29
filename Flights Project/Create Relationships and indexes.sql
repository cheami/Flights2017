--RELATIONSHIPS
ALTER TABLE [dbo].[Airports] WITH NOCHECK ADD CONSTRAINT [FK_Airports_Countries] FOREIGN KEY([Country])
	REFERENCES [dbo].[Countries] ([Country])
GO

ALTER TABLE [dbo].[Airports] CHECK CONSTRAINT [FK_Airports_Countries]
GO

ALTER TABLE [dbo].[Airlines] WITH NOCHECK ADD CONSTRAINT [FK_Airlines_Countries] FOREIGN KEY([Country])
	REFERENCES [dbo].[Countries] ([Country])
GO

ALTER TABLE [dbo].[Airlines] CHECK CONSTRAINT [FK_Airlines_Countries]
GO

ALTER TABLE [dbo].[Routes] WITH CHECK ADD CONSTRAINT [FK_Routes_Airlines] FOREIGN KEY([AirlineID])
	REFERENCES [dbo].[Airlines] ([AirlineID])
GO

ALTER TABLE [dbo].[Routes] CHECK CONSTRAINT [FK_Routes_Airlines]
GO

ALTER TABLE [dbo].[Routes] WITH NOCHECK ADD CONSTRAINT [FK_Routes_Airports] FOREIGN KEY([SourceAirportID])
	REFERENCES [dbo].[Airports] ([AirportID])
GO

ALTER TABLE [dbo].[Routes] CHECK CONSTRAINT [FK_Routes_Airports]
GO

ALTER TABLE [dbo].[Routes] WITH NOCHECK ADD CONSTRAINT [FK_Routes_Airports1] FOREIGN KEY([DestinationAirportID])
	REFERENCES [dbo].[Airports] ([AirportID])
GO

ALTER TABLE [dbo].[Routes] CHECK CONSTRAINT [FK_Routes_Airports1]
GO





--INDEXES
CREATE NONCLUSTERED INDEX [IX_Airports] ON [dbo].[Airports]([IATA] ASC)
	 ON [SECONDARY]
GO

CREATE NONCLUSTERED INDEX [IX_Routes] ON [dbo].[Routes]([SourceAirportID] ASC, [DestinationAirportID] ASC)
	ON [SECONDARY]
GO
