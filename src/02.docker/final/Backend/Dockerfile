# See https://aka.ms/customizecontainer to learn how to customize your debug container 
# and how Visual Studio uses this Dockerfile to build your images for faster debugging.

# Build stage
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /src
COPY . .
RUN dotnet publish "Backend.csproj" --force -c Release -o published/ -v d /p:UseAppHost=false

# Publish stage
FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS backend-publish
WORKDIR /app
COPY --from=build /src/published ./
ENTRYPOINT ["dotnet", "Backend.dll"]
