/*
Script de implementación para TiendaDiscosProDB

Una herramienta generó este código.
Los cambios realizados en este archivo podrían generar un comportamiento incorrecto y se perderán si
se vuelve a generar el código.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "TiendaDiscosProDB"
:setvar DefaultFilePrefix "TiendaDiscosProDB"
:setvar DefaultDataPath ""
:setvar DefaultLogPath ""

GO
:on error exit
GO
/*
Detectar el modo SQLCMD y deshabilitar la ejecución del script si no se admite el modo SQLCMD.
Para volver a habilitar el script después de habilitar el modo SQLCMD, ejecute lo siguiente:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'El modo SQLCMD debe estar habilitado para ejecutar correctamente este script.';
        SET NOEXEC ON;
    END


GO
USE [master];


GO

IF (DB_ID(N'$(DatabaseName)') IS NOT NULL) 
BEGIN
    ALTER DATABASE [$(DatabaseName)]
    SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [$(DatabaseName)];
END

GO
PRINT N'Creando la base de datos $(DatabaseName)...'
GO
CREATE DATABASE [$(DatabaseName)] COLLATE SQL_Latin1_General_CP1_CI_AS
GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CLOSE OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
USE [$(DatabaseName)];


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ANSI_NULLS ON,
                ANSI_PADDING ON,
                ANSI_WARNINGS ON,
                ARITHABORT ON,
                CONCAT_NULL_YIELDS_NULL ON,
                NUMERIC_ROUNDABORT OFF,
                QUOTED_IDENTIFIER ON,
                ANSI_NULL_DEFAULT ON,
                CURSOR_DEFAULT LOCAL,
                RECOVERY FULL,
                CURSOR_CLOSE_ON_COMMIT OFF,
                AUTO_CREATE_STATISTICS ON,
                AUTO_SHRINK OFF,
                AUTO_UPDATE_STATISTICS ON,
                RECURSIVE_TRIGGERS OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ALLOW_SNAPSHOT_ISOLATION OFF;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET READ_COMMITTED_SNAPSHOT OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_UPDATE_STATISTICS_ASYNC OFF,
                PAGE_VERIFY NONE,
                DATE_CORRELATION_OPTIMIZATION OFF,
                DISABLE_BROKER,
                PARAMETERIZATION SIMPLE,
                SUPPLEMENTAL_LOGGING OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET TRUSTWORTHY OFF,
        DB_CHAINING OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'No se puede modificar la configuración de la base de datos. Debe ser un administrador del sistema para poder aplicar esta configuración.';
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET HONOR_BROKER_PRIORITY OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'No se puede modificar la configuración de la base de datos. Debe ser un administrador del sistema para poder aplicar esta configuración.';
    END


GO
ALTER DATABASE [$(DatabaseName)]
    SET TARGET_RECOVERY_TIME = 0 SECONDS 
    WITH ROLLBACK IMMEDIATE;


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET FILESTREAM(NON_TRANSACTED_ACCESS = OFF),
                CONTAINMENT = NONE 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CREATE_STATISTICS ON(INCREMENTAL = OFF),
                MEMORY_OPTIMIZED_ELEVATE_TO_SNAPSHOT = OFF,
                DELAYED_DURABILITY = DISABLED 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE (QUERY_CAPTURE_MODE = ALL, DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_PLANS_PER_QUERY = 200, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 367), MAX_STORAGE_SIZE_MB = 100) 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE = OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET TEMPORAL_HISTORY_RETENTION ON 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF fulltextserviceproperty(N'IsFulltextInstalled') = 1
    EXECUTE sp_fulltext_database 'enable';


GO
PRINT N'Creando Tabla [dbo].[Album]...';


GO
CREATE TABLE [dbo].[Album] (
    [AlbumId]  INT            NOT NULL,
    [Title]    NVARCHAR (160) NOT NULL,
    [ArtistId] INT            NOT NULL,
    CONSTRAINT [PK_Album] PRIMARY KEY CLUSTERED ([AlbumId] ASC)
);


GO
PRINT N'Creando Tabla [dbo].[Artist]...';


GO
CREATE TABLE [dbo].[Artist] (
    [ArtistId] INT            NOT NULL,
    [Name]     NVARCHAR (120) NULL,
    CONSTRAINT [PK_Artist] PRIMARY KEY CLUSTERED ([ArtistId] ASC)
);


GO
PRINT N'Creando Tabla [dbo].[Customer]...';


GO
CREATE TABLE [dbo].[Customer] (
    [CustomerId]   INT           NOT NULL,
    [FirstName]    NVARCHAR (40) NOT NULL,
    [LastName]     NVARCHAR (20) NOT NULL,
    [Company]      NVARCHAR (80) NULL,
    [Address]      NVARCHAR (70) NULL,
    [City]         NVARCHAR (40) NULL,
    [State]        NVARCHAR (40) NULL,
    [Country]      NVARCHAR (40) NULL,
    [PostalCode]   NVARCHAR (10) NULL,
    [Phone]        NVARCHAR (24) NULL,
    [Fax]          NVARCHAR (24) NULL,
    [Email]        NVARCHAR (60) NOT NULL,
    [SupportRepId] INT           NULL,
    CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED ([CustomerId] ASC)
);


GO
PRINT N'Creando Tabla [dbo].[Employee]...';


GO
CREATE TABLE [dbo].[Employee] (
    [EmployeeId] INT           NOT NULL,
    [LastName]   NVARCHAR (20) NOT NULL,
    [FirstName]  NVARCHAR (20) NOT NULL,
    [Title]      NVARCHAR (30) NULL,
    [ReportsTo]  INT           NULL,
    [BirthDate]  DATETIME      NULL,
    [HireDate]   DATETIME      NULL,
    [Address]    NVARCHAR (70) NULL,
    [City]       NVARCHAR (40) NULL,
    [State]      NVARCHAR (40) NULL,
    [Country]    NVARCHAR (40) NULL,
    [PostalCode] NVARCHAR (10) NULL,
    [Phone]      NVARCHAR (24) NULL,
    [Fax]        NVARCHAR (24) NULL,
    [Email]      NVARCHAR (60) NULL,
    CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED ([EmployeeId] ASC)
);


GO
PRINT N'Creando Tabla [dbo].[Genre]...';


GO
CREATE TABLE [dbo].[Genre] (
    [GenreId] INT            NOT NULL,
    [Name]    NVARCHAR (120) NULL,
    CONSTRAINT [PK_Genre] PRIMARY KEY CLUSTERED ([GenreId] ASC)
);


GO
PRINT N'Creando Tabla [dbo].[Invoice]...';


GO
CREATE TABLE [dbo].[Invoice] (
    [InvoiceId]         INT             NOT NULL,
    [CustomerId]        INT             NOT NULL,
    [InvoiceDate]       DATETIME        NOT NULL,
    [BillingAddress]    NVARCHAR (70)   NULL,
    [BillingCity]       NVARCHAR (40)   NULL,
    [BillingState]      NVARCHAR (40)   NULL,
    [BillingCountry]    NVARCHAR (40)   NULL,
    [BillingPostalCode] NVARCHAR (10)   NULL,
    [Total]             NUMERIC (10, 2) NOT NULL,
    CONSTRAINT [PK_Invoice] PRIMARY KEY CLUSTERED ([InvoiceId] ASC)
);


GO
PRINT N'Creando Tabla [dbo].[InvoiceLine]...';


GO
CREATE TABLE [dbo].[InvoiceLine] (
    [InvoiceLineId] INT             NOT NULL,
    [InvoiceId]     INT             NOT NULL,
    [TrackId]       INT             NOT NULL,
    [UnitPrice]     NUMERIC (10, 2) NOT NULL,
    [Quantity]      INT             NOT NULL,
    CONSTRAINT [PK_InvoiceLine] PRIMARY KEY CLUSTERED ([InvoiceLineId] ASC)
);


GO
PRINT N'Creando Tabla [dbo].[MediaType]...';


GO
CREATE TABLE [dbo].[MediaType] (
    [MediaTypeId] INT            NOT NULL,
    [Name]        NVARCHAR (120) NULL,
    CONSTRAINT [PK_MediaType] PRIMARY KEY CLUSTERED ([MediaTypeId] ASC)
);


GO
PRINT N'Creando Tabla [dbo].[Playlist]...';


GO
CREATE TABLE [dbo].[Playlist] (
    [PlaylistId] INT            NOT NULL,
    [Name]       NVARCHAR (120) NULL,
    CONSTRAINT [PK_Playlist] PRIMARY KEY CLUSTERED ([PlaylistId] ASC)
);


GO
PRINT N'Creando Tabla [dbo].[PlaylistTrack]...';


GO
CREATE TABLE [dbo].[PlaylistTrack] (
    [PlaylistId] INT NOT NULL,
    [TrackId]    INT NOT NULL,
    CONSTRAINT [PK_PlaylistTrack] PRIMARY KEY CLUSTERED ([PlaylistId] ASC, [TrackId] ASC)
);


GO
PRINT N'Creando Tabla [dbo].[Track]...';


GO
CREATE TABLE [dbo].[Track] (
    [TrackId]      INT             NOT NULL,
    [Name]         NVARCHAR (200)  NOT NULL,
    [AlbumId]      INT             NULL,
    [MediaTypeId]  INT             NOT NULL,
    [GenreId]      INT             NULL,
    [Composer]     NVARCHAR (220)  NULL,
    [Milliseconds] INT             NOT NULL,
    [Bytes]        INT             NULL,
    [UnitPrice]    NUMERIC (10, 2) NOT NULL,
    CONSTRAINT [PK_Track] PRIMARY KEY CLUSTERED ([TrackId] ASC)
);


GO
DECLARE @VarDecimalSupported AS BIT;

SELECT @VarDecimalSupported = 0;

IF ((ServerProperty(N'EngineEdition') = 3)
    AND (((@@microsoftversion / power(2, 24) = 9)
          AND (@@microsoftversion & 0xffff >= 3024))
         OR ((@@microsoftversion / power(2, 24) = 10)
             AND (@@microsoftversion & 0xffff >= 1600))))
    SELECT @VarDecimalSupported = 1;

IF (@VarDecimalSupported > 0)
    BEGIN
        EXECUTE sp_db_vardecimal_storage_format N'$(DatabaseName)', 'ON';
    END


GO
PRINT N'Actualización completada.';


GO
