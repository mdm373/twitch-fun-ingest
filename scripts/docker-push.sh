sh ./scripts/docker-build.sh
echo pushing changes to docker...
docker image tag twitch-fun-ingest:0.0.1 mdm373/twitch-fun-ingest:0.0.1
docker image push mdm373/twitch-fun-ingest:0.0.1