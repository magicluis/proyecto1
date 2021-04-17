
----- BACKUP FULL

USE master;  
ALTER DATABASE PROYECTO SET RECOVERY FULL;  
GO  
-- Back up the AdventureWorks2012 database to new media set (backup set 1).  
BACKUP DATABASE PROYECTO  
  TO DISK = 'C:\BackupSQL\BackupPROYECTO.bak'   
  WITH FORMAT;  
GO  
--Create a routine log backup (backup set 2).  
BACKUP LOG PROYECTO TO DISK = 'C:\BackupSQL\BackupPROYECTO.bak';  
GO


------ RESTAURAR BD

USE [master]
GO
RESTORE DATABASE PROYECTO
FROM DISK = 'C:\BackupSQL\BackupPROYECTO.bak'
WITH
MOVE 'PROYECTO' TO 'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\PROYECTO.mdf',
MOVE 'PROYECTO_log' TO 'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\PROYECTO.ldf',
REPLACE

RESTORE FILELISTONLY 
FROM DISK = 'C:\BackupSQL\BackupPROYECTO.bak'


----- TRUNCAR LOG

-- VER TAMAÑO
sp_helpdb PROYECTO;

-- Saber tipo de backup en la base de datos
SELECT DATABASEPROPERTYEX('PROYECTO', 'RECOVERY')

-- Cambiamos el modo de backup a simple
ALTER DATABASE PROYECTO
SET RECOVERY SIMPLE;

DBCC SQLPERF(LOGSPACE);
DBCC LOGINFO(PROYECTO);
DBCC OPENTRAN; 
CHECKPOINT;

--TRUNCAMOS.
use PROYECTO
DBCC SHRINKFILE(PROYECTO_log);

-- Cambiamos el modo de backup a full
ALTER DATABASE PROYECTO
SET RECOVERY FULL;
