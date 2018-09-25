# metamap_docker_server
Based on the docker metamap image. Serves tagger and WSD services via supervisord.

## Prerequisite:
`docker load --input metamap2016v2.dockerimage`

## Build image:
`docker build . -t metamap_server`

## Run server: 
`docker run -d --restart unless-stopped -p 1795:1795 -p 5554:5554 metamap_server`
