sh ./scripts/docker-push.sh
echo creating new task definition revision...
registerTaskResponse=$(aws ecs register-task-definition --cli-input-json file://scripts/config/update-task-def.json)
revision=$(echo $registerTaskResponse | jq -r ".taskDefinition.revision")
echo updating to revision: $revision...
serviceResponse=$(aws ecs update-service --service twitch-fun-api --cluster twitch-fun-api --force-new-deployment --task-definition twitch-fun-api:$revision)
echo ecs service updated!