# Developer Quick Start

TL,DR: github process, github actions, GCC, gtest, java.

rusEFI is an open source internal combustion engine control unit primarily running on stm32f4/f7 microcontrollers.

Well, really the first step is to fork https://github.com/rusefi/rusefi and then make sure you have github actions enabled (see below)

```shell
git clone --recurse-submodules https://github.com/rusefi/rusefi
misc/actions/ubuntu-install-tools.sh
cd firmware
./setup_linux_environment.sh
make
```

## Embedded firmware

See https://github.com/rusefi/rusefi/blob/master/firmware/readme.md

STM32F407 firmware including pre-compiled PC application to send commands: [rusEFI Firmware bundle](https://rusefi.com/build_server/rusefi_bundle_f407-discovery.zip)

See also <https://github.com/rusefi/rusefi/blob/master/firmware/setup_linux_environment.sh>

## Unit Tests

We are heavy in CI/CD so https://github.com/rusefi/rusefi/wiki/Dev-Quality-Control and https://github.com/rusefi/rusefi/blob/master/unit_tests/readme.md

## GitHub Actions

We rely on github actions heavily. We commit manual changes while github actions are commiting auto-generated stuff if needed.

Note the green icon for happy continues integration, note commits by actions-user.

![image](https://github.com/rusefi/rusefi/assets/48498823/563b839a-b56b-4c88-a44d-3696c81e11a6)

Make sure that your fork has Actions enabled:

![image](https://github.com/rusefi/rusefi/assets/48498823/c7752a3f-3278-45d7-86d3-1439e5571e56)
