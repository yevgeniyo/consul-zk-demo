#/bin/sh

MODE=$(echo srvr | nc localhost 2181 | grep Mode) 

if [ -z "$MODE" ]; then 
    exit 2; 
else 
    echo $MODE | awk '{print $2}'| awk '{ print($0); if($0 !="follower" && $0 !="leader") exit 2;}'; fi
