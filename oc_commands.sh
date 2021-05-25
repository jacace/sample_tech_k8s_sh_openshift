# This script summarizes the most common oc commands in Openshift 4.4
oc login --server=https://<your_server>

#To enter a project
oc project <project_name>

#To deploy an app
oc new-app <image_name> --name=<napp_name>

# Command to create a secret
oc secrets new-dockercfg <secret_name> --docker-server=<your_private_docker_repo> --docker-username=<user_name> --docker-password=<user_password> --docker-email=<user_email>

#In previous versions, it was required to link a secret with the default account
#Notes about secrets:
#  App Secrets -> sa/default
#  Pull secret -> sa/default
#  Push secret -> bc and sa/builder
oc secrets add sa/default secrets/<secret_name> --for=pull

#To create a resource based on a JSON file
oc create -f <file_name>.json

#To create configmaps
oc create configmap configname --from-file=path/to/dir/ui.properties
#To project a ConfigMap in env vars:
oc set env --from=configmap/configname dc/blue
#To project a ConfigMap in volumes:
oc volume dc/blue --overwrite --add -t configmap -m /etc/config --name=config-volume --configmap-name=configname
#Env variables defined in DeployConfigs are available to pods

#To label resources
oc label builds <object_name> \ <label>

#To scale up resources
oc scale rc <replication-controller-name> --replicas=<n>

#To get logs
oc logs <pod name>

#To stop and delete a deployment
oc stop dc <deploy_name>
oc delete dc/<deploy_name>

#Sample commands for any resource: Read, Update and Patch
oc describe configmap/appuiandtomcatconfig
oc update -f configmap_appuiandtomcatconfig.json
oc patch dc/dummy -p '{"spec": {"template": {"spec": {"containers": [{"image": "dockerimagename","name": "imagename"}]}}}}'
oc patch route/<route> -p '{"spec":{"to":{"name":"<new_route>"}}}'