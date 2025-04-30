# Use a stable Ubuntu base image
FROM ubuntu:22.04

# Set environment variables to avoid interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Set JAVA_HOME (required by OpenDaylight/Karaf)
ENV JAVA_HOME=/usr/lib/jvm/java-21-openjdk-amd64

# Set OpenDaylight version and download URL
ARG ODL_VERSION=0.21.2
ARG ODL_DOWNLOAD_URL=https://nexus.opendaylight.org/content/repositories/opendaylight.release/org/opendaylight/integration/karaf/${ODL_VERSION}/karaf-${ODL_VERSION}.tar.gz

# Set the working directory for OpenDaylight installation
WORKDIR /opt

# Install dependencies: Java, wget, tar
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    openjdk-21-jdk \
    wget \
    tar \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Download, extract OpenDaylight, and clean up the archive
RUN wget --progress=dot:giga ${ODL_DOWNLOAD_URL} && \
    tar -xvzf karaf-${ODL_VERSION}.tar.gz && \
    rm karaf-${ODL_VERSION}.tar.gz

# Change working directory to the extracted OpenDaylight folder
WORKDIR /opt/karaf-${ODL_VERSION}

# Copy the entrypoint script
COPY docker-entrypoint.sh /usr/local/bin/
# Make it executable
RUN chmod +x /usr/local/bin/docker-entrypoint.sh


# Expose standard OpenDaylight ports
EXPOSE 8181 8101

# Use the entrypoint script to start Karaf
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
# Default command is empty as entrypoint handles the execution
CMD []

