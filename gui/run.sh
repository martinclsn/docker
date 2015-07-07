#docker --tlsverify=false run -ti --rm -e DISPLAY=$DISPLAY firefox
docker --tlsverify=false run -ti --rm \
       -e DISPLAY=$DISPLAY \
       -v /tmp/.X11-unix:/tmp/.X11-unix \
       firefox