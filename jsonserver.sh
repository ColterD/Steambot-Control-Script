#!/bin/bash
#
# description: Startup the JSON server

SCRIPT_HOME=/home/arkarr/JSON;
export SCRIPT_HOME

start() {
        echo -n "Starting JSON Server: "
        java -jar $SCRIPT_HOME/JSONSteamMarket.jar &
        sleep 2
        echo "JSON server started"
}

stop() {
        echo -n "Stopping JSON Server: "
        jsonPID=$(pgrep -f JSONSteamMarket.jar)
        kill $jsonPID
        echo "JSON server stopped."
}

# See how we were called.
case "$1" in
        start)
                start
                ;;
        stop)
                stop
                ;;
        restart)
                stop
                start
                ;;
        *)
                echo $"Usage: jsonserver {start|stop|restart}"
                exit
esac
