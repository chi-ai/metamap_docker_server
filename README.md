# metamap_docker_server
Based on the docker metamap image. Serves native Metamap services - Tagger and WSD via supervisord. As an addition there is 8080 port serves http2shell wrapper which executed command line metamap with arguments as parameters.   
`curl "http://metamap-host:8080/form?input=cancer&args=-N"`

## Prerequisite:
Get metamap2016v2.dockerimage original image from https://metamap.nlm.nih.gov/   
`docker load --input metamap2016v2.dockerimage.tgz`   
`docker tag metamap2016v2.dockerimage metamap2016v2`

## Build image:
`docker build . -t metamap_server`

## Run server: 
`docker run -d --restart unless-stopped -p 1795:1795 -p 5554:5554 -p 8080:8080  metamap_server`

# Usage
## Native metamap client command line use
`/home/metamap16/bin/metamap16 -S chi-metamap.ddns.net -@ chi-metamap.ddns.net`

## Test

`curl -X POST -d "input=cancer&args=-N" "http://chi-metamap.ddns.net:8080/form"`  
