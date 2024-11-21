REM /*****************************************************/
REM /** Install and run SQL Server on Docker            **/
REM /** Run this batch file in the VS Dev commandprompt **/
REM /** in adminisrator mode                            **/
REM /*****************************************************/

ECHO OFF
CLS

pushd "%~dp0"

COLOR 06
ECHO.
ECHO ===============================================
ECHO == Install and run a SQL Server image on Docker
ECHO ===============================================
ECHO Continue?

ECHO Is docker running?
docker -v
IF %errorlevel% NEQ 0 GOTO:err

ECHO Pull SQL Server image...
docker pull mcr.microsoft.com/mssql/server:2022-latest
IF %errorlevel% NEQ 0 GOTO:err

SET %sqldir%=C:\Projects\Test\SqlOnDocker\

ECHO Run docker image
docker run -e 'ACCEPT_EULA=Y' -e 'MSSQL_SA_PASSWORD=MyStrong!P@ssw0rd' -e 'MSSQL_PID=Express' -p 1433:1433 --name sqlserver --hostname sql1 -v %sqldir%data:/var/opt/mssql/data -v %sqldir%log:/var/opt/mssql/log -v %sqldir%secrets:/var/opt/mssql/secrets -d mcr.microsoft.com/mssql/server:2022-latest

IF %errorlevel% NEQ 0 GOTO:err

ECHO SQL Server is running in docker
GOTO:eof

:err
COLOR 04
ECHO Something went wrong.
ECHO %errorlevel% 
COLOR 06

:eof
ECHO bye...
