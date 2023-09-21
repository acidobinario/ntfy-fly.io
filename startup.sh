#!/bin/sh

# Startup script for ntfy
echo "using the following configs"
cat /etc/ntfy/server.yml

# Run ntfy
ntfy serve &

# Get its process ID
ntfy_pid=$!

# Wait for ntfy to start
sleep 5

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
  ntfy user add --role=admin Admin
fi

wait $ntfy_pid
