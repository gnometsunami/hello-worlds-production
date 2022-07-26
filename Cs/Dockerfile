# Build Image
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build-env
ENV DOTNET_CLI_TELEMETRY_OPTOUT=1
ARG dpkgArch="$(dpkg --print-architecture)"; \
        case "$dpkgArch" in \
            amd64) export RID='linux-x64' ;; \
            arm64) export RID='linux-arm64' ;; \
            s390x) export RID='linux-s390x' ;; \
            *) export RID='linux-x64' ;; \
        esac;
WORKDIR /build
COPY *.csproj .
RUN dotnet restore
COPY src .
RUN dotnet publish -c Release -r "$RID" --self-contained true -o /app

# Run app using distroless
FROM gcr.io/distroless/cc-debian11:nonroot
ENV DOTNET_CLI_TELEMETRY_OPTOUT=1
WORKDIR /app
COPY --from=build-env /app .
USER nonroot:nonroot
CMD [ "./hello_world" ]
