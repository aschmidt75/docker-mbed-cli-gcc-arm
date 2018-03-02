# docker-mbed-cli-gcc-arm
A Docker image for running ARM mbed client and the GCC_ARM toolchain. Allows for identical mbed-cli use
on Linux, Mac (using Docker for Mac) and Win (using Docker for Windows).

This Dockerfile follows the [installation instructions of ARMs mbed-cli app](https://github.com/ARMmbed/mbed-cli/blob/master/README.md).
It installs necessary components. Projects, source code and build artifacts need to be bind-mounted to `/mbed` (see alias below):


## Build

```bash
$ docker build -t mbed-cli .
$ alias mbed='docker run -ti -v $(pwd):/mbed:cached mbed-cli'
```

## Use

Alias above starts mbed-cli as entrypoint:

```bash
$ mbed
usage: mbed [-h] [--version]             ...

Command-line code management tool for ARM mbed OS - http://www.mbed.com
version 1.4.0
(...)
```

**New mbed project/program**

```bash
$ mbed new --program demo
[mbed] Creating new program "demo" (git)
[mbed] Adding library "mbed-os" from "https://github.com/ARMmbed/mbed-os" at branch/tag "latest"
(...)
```

creates a directory `demo`, cd there and:

**Set target and toolchain**

i.e. 
```bash
$ mbed target nucleo_f207zg
[mbed] nucleo_f207zg now set as default target in program "mbed"
$ mbed toolchain gcc_arm
[mbed] gcc_arm now set as default toolchain in program "mbed"
```

**Compile**

```bash
$ mbed compile
(...)
Image: ./BUILD/nucleo_f207zg/gcc_arm/mbed.bin
```

## Contribute

Feel free to fork, PRs welcome.

## License

by @aschmidt75. Apache 2. See LICENSE.

