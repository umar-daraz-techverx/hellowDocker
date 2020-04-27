FROM mcr.microsoft.com/dotnet/core/aspnet:3.1-buster-slim AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/core/sdk:3.1-buster AS build
WORKDIR /src
COPY ["hellow/hellow.csproj", "hellow/"]
RUN dotnet restore "hellow/hellow.csproj"
COPY . .
WORKDIR "hellow/"
RUN dotnet build "hellow.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "hellow.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "hellow.dll"]

