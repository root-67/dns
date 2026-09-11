FROM mcr.microsoft.com/dotnet/aspnet:10.0-alpine-amd64

WORKDIR /app

RUN apk update && apk upgrade \
    && apk add ca-certificates \
    git \
    wget \
    curl \
    build-base \
    musl-dev \
    tzdata \
    dotnet10-sdk \
    aspnetcore10-runtime \
    libmsquic \
    doggo

WORKDIR /app/opt/technitium/dns

ENTRYPOINT ["/bin/sh/dotnet", "/app/opt/technitium/dns/DnsServerApp.dll"]
CMD ["/app/etc/dns"]

EXPOSE \
   53/udp 53/tcp \
   853/udp 853/tcp \
   443/udp 443/tcp \
   80/tcp 8053/tcp \
   5380/tcp 53443/tcp \
   67/udp

LABEL org.opencontainers.image.source=https://github.com/root-67/dns
LABEL org.opencontainers.image.description="Root-67 DNS"
LABEL org.opencontainers.image.licenses=MIT

