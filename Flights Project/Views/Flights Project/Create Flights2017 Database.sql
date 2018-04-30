USE master
GO
DROP DATABASE IF EXISTS [Flights2017]
GO
CREATE DATABASE [Flights2017]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Flights2017', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Flights2017.mdf' , SIZE = 8192KB , FILEGROWTH = 65536KB ), 
 FILEGROUP [SECONDARY] 
( NAME = N'Flights2017_1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Flights2017_1.ndf' , SIZE = 8192KB , FILEGROWTH = 65536KB ),
( NAME = N'Flights2017_2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Flights2017_2.ndf' , SIZE = 8192KB , FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Flights2017_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Flights2017_log.ldf' , SIZE = 8192KB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Flights2017] SET COMPATIBILITY_LEVEL = 140
GO
ALTER DATABASE [Flights2017] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Flights2017] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Flights2017] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Flights2017] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Flights2017] SET ARITHABORT OFF 
GO
ALTER DATABASE [Flights2017] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Flights2017] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Flights2017] SET AUTO_CREATE_STATISTICS ON(INCREMENTAL = OFF)
GO
ALTER DATABASE [Flights2017] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Flights2017] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Flights2017] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Flights2017] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Flights2017] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Flights2017] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Flights2017] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Flights2017] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Flights2017] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Flights2017] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Flights2017] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Flights2017] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Flights2017] SET  READ_WRITE 
GO
ALTER DATABASE [Flights2017] SET RECOVERY FULL 
GO
ALTER DATABASE [Flights2017] SET  MULTI_USER 
GO
ALTER DATABASE [Flights2017] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Flights2017] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Flights2017] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Flights2017]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = Off;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = Primary;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = On;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = Primary;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = Off;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = Primary;
GO
USE [Flights2017]
GO
IF NOT EXISTS (SELECT name FROM sys.filegroups WHERE is_default=1 AND name = N'SECONDARY') ALTER DATABASE [Flights2017] MODIFY FILEGROUP [SECONDARY] DEFAULT
GO
