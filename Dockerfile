FROM alpine:latest

ARG signal_cli_version
ENV ENV_SIGNAL_CLI_VERSION=$signal_cli_version

# Install dependencies
RUN apk add --no-cache openjdk17-jre \
    wget \
    libgcc \
    gcompat \
    tar \
    gzip

# Get defined version of signal-cli
RUN wget https://github.com/AsamK/signal-cli/releases/download/v"${ENV_SIGNAL_CLI_VERSION}"/signal-cli-"${ENV_SIGNAL_CLI_VERSION}".tar.gz

# Unpack it
RUN tar xf signal-cli-"${ENV_SIGNAL_CLI_VERSION}".tar.gz -C /opt

# Link the signal-cli executable into $PATH
RUN ln -sf /opt/signal-cli-"${ENV_SIGNAL_CLI_VERSION}"/bin/signal-cli /usr/local/bin/

# Create directory to store configuration
RUN mkdir -p /etc/signal-cli

# Run signal-cli with specific configuration directory
ENTRYPOINT ["/usr/local/bin/signal-cli", "--config", "/etc/signal-cli"]

# By default just run --help
CMD ["--help"]
