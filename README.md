# Signal-cli Docker Image

This repository hosts a `Dockerfile` designed to create a Docker image that
encapsulates `signal-cli`, a command-line interface for Signal.

The Docker image is constructed using a pre-built tar file sourced from the
[AsamK/signal-cli project on GitHub](https://github.com/AsamK/signal-cli).

## Building the Image

To build this Docker image, you must have the latest version of Docker
installed. Guidance on Docker installation is beyond the scope of this README.

To construct the image, execute the following command:

```bash
make
```

Upon successful build, the image will be tagged as `signal`.

## Configuration

`signal-cli` necessitates a specific directory for storing its configuration
files. In this Docker image, `/etc/signal-cli` is set as the default
configuration path. To persist your configuration externally, mount your
preferred configuration directory or volume to `/etc/signal-cli`.

## Usage

You can directly utilize the `signal` image by executing:

```bash
docker run -v /path/to/store/config:/etc/signal-cli signal <signal-cli parameters>
```

For an optimal experience, it is recommended to use the `signal-cli` executable
included in this repository. Refer to the `Installation` section below for
details.

## Installation

To install the `signal-cli` executable, run:

```bash
sudo make install
```

This command places the `signal-cli` executable in the appropriate directory.
You can then use it as follows:

```bash
signal-cli --help
```

The configuration files will be stored in the standard directory
`$HOME/.local/share/signal-cli`.

