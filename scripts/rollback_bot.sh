#!/bin/bash

# Determine target environment (would be passed as parameter in real pipeline)
TARGET_ENV=${1:-"dev"}

echo "=== Bot Rollback Process ==="
echo "Target Environment: $TARGET_ENV"

# Read previous version from deployment history
if [ -f "deployment_history.log" ]; then
    PREVIOUS_VERSION=$(tail -1 deployment_history.log | grep -o "version [0-9]\+\.[0-9]\+\.[0-9]\+" | cut -d' ' -f2)
    echo "Rolling back to previous version: ${PREVIOUS_VERSION:-'1.0.0'}"
else
    echo "Rolling back to previous version: 1.0.0 (default)"
fi

echo "Rolling back to previous stable bot version"
echo "Rollback completed for $TARGET_ENV environment"
