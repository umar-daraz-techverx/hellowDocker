FROM mcr.microsoft.com/dotnet/core/sdk:3.1-buster AS build
WORKDIR /app
COPY ./hellow/publish .
EXPOSE 80

ENTRYPOINT ["dotnet", "hellow.dll"]
