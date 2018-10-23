FROM msoap/shell2http:latest as go_builder

FROM metamap2016v2:latest
RUN apt-get update && apt-get install -y supervisor
RUN mkdir -p /var/log/supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
copy skrmedpostctl /opt/public_mm/bin/
copy wsdserverctl /opt/public_mm/bin/

COPY --from=go_builder /app/shell2http /app/shell2http

CMD ["/usr/bin/supervisord"]
