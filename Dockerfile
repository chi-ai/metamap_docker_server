FROM metamap2016v2:latest
RUN apt-get update && apt-get install -y supervisor
RUN mkdir -p /var/log/supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
copy skrmedpostctl /opt/public_mm/bin/
copy wsdserverctl /opt/public_mm/bin/
CMD ["/usr/bin/supervisord"]
