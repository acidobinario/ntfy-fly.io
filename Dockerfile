# Use ntfy's official image as base
FROM binwiederhier/ntfy:latest

# Copy config file and startup script
COPY ./server.yml /etc/ntfy/server.yml
COPY ./startup.sh /app/startup.sh

# Make the startup script executable
RUN chmod +x /app/startup.sh

# Set working directory
WORKDIR /app

# Set the startup script as the entry point
ENTRYPOINT ["/app/startup.sh"]
