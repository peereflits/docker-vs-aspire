var builder = DistributedApplication.CreateBuilder(args);

// See also: var dbs = builder.AddConnectionString()
var password = builder.AddParameter("password", secret: true, value: "MyStrong!P@ssw0rd");

var sql = builder.AddSqlServer("DemoDbs", password)
        .WithDataVolume(name: "demo-database_sqlserverdata")
        .WithLifetime(ContainerLifetime.Persistent)
        .WithContainerName("demo-database")
        .WithEnvironment("MSSQL_PID", "Express")
        .WithEnvironment("ACCEPT_EULA", "Y")
    ;

var db = sql.AddDatabase("DxtTestDb");

const int backendServerPortNumber = 5001;

var backend = builder.AddProject<Projects.Backend>("demo-backend")
    .WithHttpEndpoint(port: 5000)
    .WithHttpsEndpoint(port: backendServerPortNumber)
    .WithExternalHttpEndpoints()
    .WithReference(db, connectionName: "DemoDbs")
    .WaitFor(db);

builder.AddProject<Projects.FrontEnd>("demo-frontend")
    .WithHttpEndpoint(port: 5003)
    .WithHttpsEndpoint(port: 5004)
    .WithExternalHttpEndpoints()
    .WithReference(backend)
    .WaitFor(backend);

builder.Build().Run();