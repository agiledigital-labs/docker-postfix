FROM ubuntu:jammy-20230126
LABEL org.opencontainers.image.authors="Elliott Ye, Agile Digital <hello@agiledigital.com.au>"

# Set noninteractive mode for apt-get
ENV DEBIAN_FRONTEND noninteractive

# Update
RUN apt update

# Start editing
# Install package here for cache
#
# libssl3 is installed (upgraded) here to fix CVE-2023-0286. It can be removed from this command
# when apt starts resolving it to version 3.0.2-0ubuntu1.8 or higher.
RUN apt -y install supervisor postfix sasl2-bin opendkim opendkim-tools rsyslog libssl3

# Add files
ADD assets/install.sh /opt/install.sh

# Run
CMD /opt/install.sh;/usr/bin/supervisord -c /etc/supervisor/supervisord.conf
