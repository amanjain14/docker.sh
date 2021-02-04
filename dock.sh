#!/bin/bash

# name=$1

# matchingStarted=$(docker images -f "dangling=false" --format "{{.Repository}}" | xargs)
# [[ -n $matchingStarted ]] && trivy image -f json -o "${matchingStarted}.json" $matchingStarted
curl -sfL https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/install.sh | sh -s -- -b /usr/local/bin
i=0;
for container_id in $(docker ps --format "{{.Image}}");do echo $container_id ;trivy image -f json -o "result-${i}.json" $container_id && i=$((i+1)); done


# matching=$(docker ps -a --filter="name=$name" -q | xargs)
# [[ -n $matching ]] && docker rm $matching