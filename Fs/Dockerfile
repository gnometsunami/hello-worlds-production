# Build Image
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build-env
ENV DOTNET_CLI_TELEMETRY_OPTOUT=1
WORKDIR /build
COPY *.fsproj .
RUN dotnet restore
COPY src .
RUN dotnet publish -c Release -r linux-x64 --self-contained true -o /app

# Run app using distroless
FROM gcr.io/distroless/cc
ENV DOTNET_CLI_TELEMETRY_OPTOUT=1
WORKDIR /app
COPY --from=build-env /app .
USER nonroot:nonroot
CMD [ "./hello_world" ]
