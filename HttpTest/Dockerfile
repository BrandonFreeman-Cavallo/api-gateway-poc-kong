FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src
COPY ["HttpTest.Docker.csproj", "."]
RUN dotnet restore "./HttpTest.Docker.csproj"
COPY . .
WORKDIR "/src/."
RUN dotnet build "HttpTest.Docker.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "HttpTest.Docker.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "HttpTest.Docker.dll"]
