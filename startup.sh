#!/bin/sh

# Startup script for ntfy

# Export environment variables
export NTFY_AUTH_FILE="/app/data/user.db"
export NTFY_CACHE_FILE="/app/data/cache.db"

# Check if NTFY_PASSWORD is empty
if [ -z "$NTFY_PASSWORD" ]; then
  # NTFY_PASSWORD is empty, set a new value
  # Replace "your-password-here" with the actual password for initialization
  export NTFY_PASSWORD="default_password"
else
  # NTFY_PASSWORD is not empty, don't overwrite it
  echo "NTFY_PASSWORD is already set, not overwriting."
fi

# Check if the user database exists. If not, create an initial user.
if [ ! -f "${NTFY_AUTH_FILE}" ]; then
  echo "Creating initial user..."
  ntfy user add --role=admin 
fi

# Run ntfy
ntfy server --config /app/server.yaml

