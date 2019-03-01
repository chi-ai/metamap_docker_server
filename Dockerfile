FROM metamap2016v2:latest as builder
from python:3.7.2 as base

run mkdir -p /opt/

COPY --from=builder /opt/public_mm/ /opt/public_mm/
#FROM partlab/ubuntu-websocketd:latest as ws_builder

RUN apt-get update && apt-get install -y supervisor vim psmisc net-tools
RUN mkdir -p /var/log/supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
copy wrapper.py /app/
workdir /app

copy skrmedpostctl /opt/public_mm/bin/
copy wsdserverctl /opt/public_mm/bin/

run apt-get install -y python-pip
run apt-get install -y python-dev
run apt-get install -y openjdk-8-jre-headless

run pip install Flask==1.0.2
#FROM msoap/shell2http:latest as go_builder
#COPY --from=go_builder /app/shell2http /app/shell2http
#COPY --from=ws_builder /usr/bin/websocketd /usr/bin/websocketd

CMD ["/usr/bin/supervisord"]
