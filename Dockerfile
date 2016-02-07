FROM debian:7.3
COPY conf/sources.d /etc/apt/sources.list.d
COPY conf/bin /opt/bin
RUN apt-get update
RUN /opt/bin/install-nginx

# limpando espaço
RUN rm -rf /usr/share/doc/ && \
	apt-get clean && apt-get clean all && \
	rm -rf /tmp/

#	sudo apt-get update -o Dir::Etc::sourcelist="sources.list.d/${source}" \
#	        -o Dir::Etc::sourceparts="-" -o APT::Get::List-Cleanup="0"    
#RUN cd /usr/share/ && \
#	mkdir locale.new && \
#	cp -R locale/eu locale.new && \
#	cp -R locale/en_GB locale.new && \
#	rm -rf locale && \
#	mv locale.new locale && \
CMD /opt/bin/start