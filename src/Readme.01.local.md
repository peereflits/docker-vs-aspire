# DemoOnLocal.sln

This is the initial solution/application that should run in a local configuration.

The solution exists of two .NET 9.0 projects and assumes a running SQL Server instance.

1. `FrontEnd` is a Blazor WASM UI app.
2. `FrontEnd` is a WebApi with three controllers:
   - `TestController` with methods to check if the app is up and running
   - The default `WeatherForecastController` that returns in-memory generated data
   - `LanguagesController` that returns the data from a languages table in a SQL Server database
3. A SQL Server database with a languages table is assumed to be up-and-running. Run script [Initialize.dbs.sql](./01.local/Initialize.dbs.sql) on a local SQL Server instance to create the demo database with a table and data.

**Note:** Change the connection string in [appsettings.json](./01.local/Backend/appsettings.json) accordingly.
