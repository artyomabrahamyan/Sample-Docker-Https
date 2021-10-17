FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /src
COPY ["SampleCallerApi/SampleCallerApi.csproj", "SampleCallerApi/"]
RUN dotnet restore "SampleCallerApi/SampleCallerApi.csproj"
COPY . .
WORKDIR "/src/SampleCallerApi"
RUN dotnet build "SampleCallerApi.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "SampleCallerApi.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
COPY localhost.crt /usr/local/share/ca-certificates
RUN chmod 644 /usr/local/share/ca-certificates/localhost.crt && update-ca-certificates
ENTRYPOINT ["dotnet", "SampleCallerApi.dll"]