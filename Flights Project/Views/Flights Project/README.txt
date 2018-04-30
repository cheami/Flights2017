YOU NEED TO:
Create "C:\Flights Project\" folder
Create "C:\Flights Project\Data\" folder


Create database and tables.dtsx
1. Execute SQL Task: Executes [Create Flights2017 Database.sql]
2a. Execute SQL Task: Executes [Create Airports Table.sql]
2b. Execute SQL Task: Executes [Create Airlines Table.sql]
2c. Execute SQL Task: Executes [Create Routes Table.sql]


ETL Process.dtsx
1. Execute Process Task: Executes PowerShell.exe with agruments to execute [Download Data.ps1]. This will download all three .dat files (airports, airlines, routes) to "C:\Flights Project\" folder
2. Foreach Loop Container:
2a. File System Task: Moves all .dat files from "C:\Flights Project\" folder to "C:\Flights Project\Data\" folder
3. Foreach Loop Container: Writes filename to variable in loop and reads in script
3a. Script Task: Executes C# script to clean data in .dat files. Finds and replaces excape characters and remove carriage returns
4. Execute SQL Task: Truncates [dbo].[Airports], [dbo].[Airlines], and [dbo].[Routes]
5. Data Flow Task(3):
5a: Flat File Source: Extracts .dat file from source. Formats each column coming out to proper data type
5b: Row Count: Counts row and set number to variable
5c. OLE DB Destination: Load data to database destination
6: Script Task: Executes C# to display messagebox with row counts for all three data flow tasks


Notes:
You will need to change Connection Managers for connection to the database.
[Create database and tables.dtsx] drops data and tables if they already exist. You can run this package repeatable with same results.
[ETL Process.dtsx] will overwrite files and truncate tables. You can run this package repeatable with same results.

Credits:
"https://github.com/jpatokal/openflights" for the data