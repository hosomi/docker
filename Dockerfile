FROM quantumobject/docker-tomcat8

RUN apt-get update && apt-get install -y -q --force-yes tomcat8-common \
                                                        tomcat8-docs \
                                                        tomcat8-admin \
                                                        tomcat8-examples \
                                                        tomcat8-user \
                                                  && apt-get clean \
                                                  && rm -rf /tmp/* /var/tmp/* \
                                                  && rm -rf /var/lib/apt/lists/*

#pre-config scritp for different service that need to be run when container image is create
#maybe include additional software that need to be installed ... with some service running ... like example mysqld
COPY pre-conf.sh /sbin/pre-conf
RUN chmod +x /sbin/pre-conf ; sync\
              && /bin/bash -c /sbin/pre-conf \
              && rm /sbin/pre-conf

# to allow access from outside of the container to the container service
# at that ports need to allow access from firewall if need to access it outside of the server.
EXPOSE 8080

#Use baseimage-docker's init system.
CMD ["/sbin/my_init"]
