#! /bin/bash
end=$((SECONDS+ 5 * 60))

# Wait for ed-fi-gateway container to be healthy
until [[ "$(docker inspect -f '{{.State.Health.Status}}' ed-fi-gateway)" == "healthy" || $SECONDS -gt $end ]]; do
    echo "Waiting for ed-fi-gateway to be healthy..."
    sleep 2
done

if [ "$(docker inspect -f '{{.State.Health.Status}}' ed-fi-gateway)" != "healthy" ]; then
    echo "ed-fi-gateway did not become healthy in time."
    docker ps
    docker logs ed-fi-gateway --tail 50
    exit 1
fi

# Now check the actual endpoint
for i in {1..30}; do
    if curl -k --silent --fail https://localhost/adminapp/Identity/Login; then
        echo "AdminApp is up and responding through gateway!"
        exit 0
    fi
    echo "Waiting for AdminApp endpoint to respond..."
    sleep 5
done

echo "AdminApp endpoint did not respond in time."
exit 1
