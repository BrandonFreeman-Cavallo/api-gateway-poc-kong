FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src
COPY ["GrpcTest.Docker.csproj", "."]
RUN dotnet restore "./GrpcTest.Docker.csproj"
COPY . .
WORKDIR "/src/."
RUN dotnet build "GrpcTest.Docker.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "GrpcTest.Docker.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "GrpcTest.Docker.dll"]
