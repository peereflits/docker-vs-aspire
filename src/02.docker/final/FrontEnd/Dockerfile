# Build stage
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /src
COPY . .
RUN dotnet publish "FrontEnd.csproj" --force -c Release -o published/ -v d

# Publish stage
FROM nginx:alpine AS frontend-publish
WORKDIR /usr/share/nginx/html
COPY --from=build /src/published/wwwroot .
COPY nginx.conf /etc/nginx/nginx.conf
