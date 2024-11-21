# DemoOnDocker.sln

This continues on initial solution that should, when finalized, run in a configuration locally on Docker Desktop.

Please make sure you have installed [Docker Desktop](https://docs.docker.com/desktop/setup/install/windows-install/).

To install the required images, run:

* `docker pull mcr.microsoft.com/mssql/server:2022-latest`
* `docker pull mcr.microsoft.com/dotnet/sdk:9.0`
* `docker pull mcr.microsoft.com/dotnet/aspnet:9.0`
* `docker pull nginx:alpine`

Try to make the application run on docker desktop with a SQL Server on a docker image. 

Start working in folder `.\02.docker\initial`. It is mostly the same as the initial application with only the required docker files blank.

The files to fill in are:
* [Backend Dockerfile](./02.docker/initial/Backend/Dockerfile)
* [FrontEnd Dockerfile](./02.docker/initial/FrontEnd/Dockerfile)
* [FrontEnd nginx file](./02.docker/initial/FrontEnd/nginx.conf) (as Blazor WASM is a stand alone file served app)
* [Docker compose file](./02.docker/initial/docker-compose.yml)

When completed you should be able to run the app by executing `docker compose up` and run in a brouwer
* the [backend](http://localhost:5000/swagger/index.html)
* the [frontend](http://localhost:8080/home)

The final and completed solution can be found in the `.\02.docker\final` folder.

### Questions

What files are also changed to make the app up-and-running?

What are the advantages and disadvantages of running on Docker?
