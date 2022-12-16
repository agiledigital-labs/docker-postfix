FROM ubuntu:jammy-20221130
LABEL org.opencontainers.image.authors="Elliott Ye, Agile Digital <hello@agiledigital.com.au>"

# Set noninteractive mode for apt-get
ENV DEBIAN_FRONTEND noninteractive

# Update
RUN apt update

# Start editing
# Install package here for cache
RUN apt -y install supervisor postfix sasl2-bin opendkim opendkim-tools rsyslog

# Add files
ADD assets/install.sh /opt/install.sh

# Run
CMD /opt/install.sh;/usr/bin/supervisord -c /etc/supervisor/supervisord.conf
