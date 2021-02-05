# Command to describe a Service Account (and see its secrets)
kubectl get serviceaccounts/build-robot -o yaml

#Command to describe a specific secret
kubectl describe secrets/build-robot-secret

#Command to create a secret (to pull docker images)
kubectl create secret docker-registry myregistrykey --docker-server=DUMMY_SERVER \
        --docker-username=DUMMY_USERNAME --docker-password=DUMMY_DOCKER_PASSWORD \
        --docker-email=DUMMY_DOCKER_EMAIL