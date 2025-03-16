#!/bin/bash
while true; do
    echo "Checking for LISTEN process on port 8000..."
    LISTEN_PID=$({ sudo lsof -t -i :8000 | xargs -I {} sudo lsof -i :8000 -a -p {} | grep LISTEN | awk '{print $2}' | tail -n 1; } 2>/dev/null)
    if [ -n "$LISTEN_PID" ]; then
        echo "Killing LISTEN process $LISTEN_PID on port 8000..."
        sudo kill -9 "$LISTEN_PID"
    fi

    echo "Starting the application..."
    npm start
    echo "Application stopped. Restarting in 5 seconds..."
    sleep 5
done
