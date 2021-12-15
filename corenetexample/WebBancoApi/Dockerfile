FROM mcr.microsoft.com/dotnet/core/aspnet:3.1-buster-slim AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/core/sdk:3.1-buster AS build
WORKDIR /src
COPY ["WebBancoApi/WebBancoApi.csproj", "WebBancoApi/"]
RUN dotnet restore "WebBancoApi/WebBancoApi.csproj"
COPY . .
WORKDIR "/src/WebBancoApi"
RUN dotnet build "WebBancoApi.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "WebBancoApi.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "WebBancoApi.dll"]