FROM debian:7.3
COPY conf/sources.d /etc/apt/sources.list.d
COPY conf/bin /opt/bin
RUN apt-get update
RUN /opt/bin/install-nginx

# clearing space
RUN rm -rf /usr/share/doc/ && \
	apt-get clean && apt-get clean all && \
	rm -rf /tmp/*

CMD /opt/bin/start