BACKUP DATABASE [Flights2017] TO  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\Backup\Flights2017.bak' WITH NOFORMAT, NOINIT,  NAME = N'Flights2017-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10, CHECKSUM
GO
declare @backupSetId as int
select @backupSetId = position from msdb..backupset where database_name=N'Flights2017' and backup_set_id=(select max(backup_set_id) from msdb..backupset where database_name=N'Flights2017' )
if @backupSetId is null begin raiserror(N'Verify failed. Backup information for database ''Flights2017'' not found.', 16, 1) end
RESTORE VERIFYONLY FROM  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\Backup\Flights2017.bak' WITH  FILE = @backupSetId,  NOUNLOAD,  NOREWIND
GO
