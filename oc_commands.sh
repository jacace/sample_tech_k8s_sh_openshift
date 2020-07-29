# This script summarizes the most common oc commands in Openshift 4.4
oc login --server=https://<your_server>

# Command to create a secret
oc secrets new-dockercfg <secret_name> --docker-server=<your_private_docker_repo> --docker-username=<user_name> --docker-password=<user_password> --docker-email=<user_email>

#In previous versions, it was required to link a secret with the default account
oc secrets add sa/default secrets/<secret_name> --for=pull

#To create a resource based on a JSON file
#Note you can use the image stream here for example 
oc create -f <file_name>.json
