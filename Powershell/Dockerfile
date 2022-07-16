FROM mcr.microsoft.com/powershell:debian-bullseye-slim
ENV POWERSHELL_TELEMETRY_OPTOUT=1
RUN groupadd nonroot && useradd nonroot --system -g nonroot
WORKDIR /app
COPY hello_world.ps1 .
#RUN pwsh -c "Install-Module -Name Az.Storage -RequiredVersion 4.7.0 -Force"
USER nonroot:nonroot
CMD [ "pwsh", "hello_world.ps1"]
