#!/bin/bash
# ════════════════════════════════════════════════════════════════════════
# CRYSTAL CORE OS - Uno Q Total UART Installer (ToAuto Pyramid 300)
# ════════════════════════════════════════════════════════════════════════
echo -e "\033[1;35m[SYSTEM] \033[0mStarting Neural Link Injection Protocol..."

# --- Bypass the Qualcomm Watchdog ---
echo -e "\033[1;36m[WATCHDOG] \033[0mNeutralizing USB Power Management..."
sudo sh -c "echo -1 > /sys/bus/usb/devices/usb1/power/autosuspend_delay_ms"
sudo sh -c "echo on > /sys/bus/usb/devices/usb1/power/control"

# --- Build & Flash SKR Mini E3 V3.0 (EXP1 UART PA9/PA10) [cite: 2026-03-04] ---
echo -e "\033[1;36m[COMPILE] \033[0mBuilding SKR Mini E3 V3.0 (USART1: PA9/PA10)..."
cd ~/klipper && make clean
cat <<EOC > .config
CONFIG_LOW_LEVEL_OPTIONS=y
CONFIG_MACH_STM32=y
CONFIG_MACH_STM32G0B1=y
CONFIG_MCU="stm32g0b1xx"
CONFIG_CLOCK_FREQ=64000000
CONFIG_STM32_SERIAL_PA10_PA9=y
CONFIG_SERIAL_BAUD=250000
EOC
make olddefconfig && make -j$(nproc)
echo -e "\033[1;35m[FLASH] \033[0mInjecting SKR Payload via ttyACM0..."
./scripts/flash-sdcard.sh /dev/ttyACM0 btt-skr-mini-e3-v3

# --- Build & Flash Uno Q Bridge (Internal UART PA9/PA10) ---
echo -e "\033[1;36m[COMPILE] \033[0mBuilding Uno Q Bridge (USART1: PA9/PA10)..."
make clean
cat <<EOC > .config
CONFIG_LOW_LEVEL_OPTIONS=y
CONFIG_MACH_STM32=y
CONFIG_MACH_STM32U585=y
CONFIG_MCU="stm32u585xx"
CONFIG_CLOCK_FREQ=160000000
CONFIG_STM32_SERIAL_PA10_PA9=y
CONFIG_SERIAL_BAUD=250000
EOC
make olddefconfig && make -j$(nproc)
echo -e "\033[1;35m[FLASH] \033[0mInjecting Uno Q Payload via SWD Backdoor..."
sudo /usr/local/bin/arduino-flash ~/klipper/out/klipper.bin

echo -e "\033[1;32m[SUCCESS] \033[0mTotal UART Bypass Active. Link established via /dev/ttyMSM0 & /dev/ttyMSM1"
