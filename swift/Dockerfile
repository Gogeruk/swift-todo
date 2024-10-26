FROM swift:latest

### install necessary dependencies
RUN apt-get update && apt-get install -y \
    git \
    libssl-dev \
    libcurl4-openssl-dev \
    libicu-dev \
    libz-dev \
    libedit-dev \
    && rm -rf /var/lib/apt/lists/*

### set the working directory
WORKDIR /app

### copy specific project files to the container
COPY Package.swift /app/Package.swift
COPY Sources /app/Sources

### copy the entrypoint script and set permissions
COPY ./entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

### expose the port Swift application listens on
EXPOSE 8080

### set the entrypoint
ENTRYPOINT ["entrypoint.sh"]