IMAGE="$1:1.0-SNAPSHOT"

cd $1
docker build -t "$IMAGE" .
docker run --name=$1 -P -ti --rm "$IMAGE"