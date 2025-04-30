#!/bin/bash
# Exit immediately if a command exits with a non-zero status.
set -e

echo "Starting Karaf in server mode via entrypoint..."

# Execute karaf in server (background) mode.
# 'exec' replaces the shell process with the karaf process.
exec ./bin/karaf server
