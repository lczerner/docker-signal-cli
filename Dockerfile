FROM alpine:latest

ENV SIGNAL_CLI_VERSION 0.12.5

# Install dependencies
RUN apk add --no-cache openjdk17-jre \
    wget \
    libgcc \
    gcompat \
    tar \
    gzip

# Get defined version of signal-cli
RUN wget https://github.com/AsamK/signal-cli/releases/download/v"${SIGNAL_CLI_VERSION}"/signal-cli-"${SIGNAL_CLI_VERSION}".tar.gz

# Unpack it
RUN tar xf signal-cli-"${SIGNAL_CLI_VERSION}".tar.gz -C /opt

# Link the signal-cli executable into $PATH
RUN ln -sf /opt/signal-cli-"${SIGNAL_CLI_VERSION}"/bin/signal-cli /usr/local/bin/

# Create directory to store configuration
RUN mkdir -p /etc/signal-cli

# Run signal-cli with specific configuration directory
ENTRYPOINT ["/usr/local/bin/signal-cli", "--config", "/etc/signal-cli"]

# By default just run --help
CMD ["--help"]
