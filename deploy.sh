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

#Build the Docker container
docker build -t emasters-connection-api .
echo "=> Running eMasters Connection API.."

#Run the app within the container
sudo docker run -d --name emasters-connection-api
echo "=> Running eMasters Connection API.."
