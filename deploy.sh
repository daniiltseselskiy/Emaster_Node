#!/bin/sh
#
# deploy.sh
# CircleCI will call this script to deploy a new version of the
# eMasters connection API from the github repo
#

#Get the last source version
echo "=> Pulling fresh code.."
git pull git@github.com:mataide/proak-dota2.git

#Generate the Dockerfile
echo "=> Creating Dockerfile…"
cat > Dockerfile <<EOF

FROM node:10-alpine
RUN mkdir -p ~/eMasters-connection-api
WORKDIR ~/eMasters-connection-api
COPY . .
RUN npm install
EXPOSE 80
CMD [ "npm start" ]
EOF

#Cleaning previous runs
echo "=> Cleaning all containers to save space"

#Stop all containers
sudo docker stop $(sudo docker ps -a -q)

# Delete all containers
sudo docker rm $(sudo docker ps -a -q)

# Delete all images
sudo docker rmi $(sudo docker images -q)

#Run the app within the container
sudo docker run -d -p 8080:80 --name emasters-connection-api
echo "=> Running eMasters Connection API.."
