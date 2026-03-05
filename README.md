# 🤖 Uno Q Crystal Core: Total UART Bridge
**Target Hardware**: ToAuto Pyramid 300 (SKR Mini E3 V3.0 + Arduino Uno Q)

This repository establishes a **Total UART** serial link for Klipper, bypassing the Qualcomm Snapdragon's USB watchdog by utilizing internal high-speed serial nodes.

## ⚡ Architecture
- **MCU 'mcu' (Motion)**: SKR Mini E3 V3.0 via `/dev/ttyHS1` (High-Speed UART).
- **MCU 'unoq' (Sensors)**: Uno Q Bridge via `/dev/ttyMSM0` (Internal MSM UART).
- **Resonance Testing**: Integrated ADXL345 support via the Uno Q SPI1 bridge.

## 🛠 Deployment
1. Mask system services to liberate serial ports:
   `sudo systemctl mask serial-getty@ttyMSM0.service arduino-router-serial.service`
2. Run the provided `install.sh` to flash MCUs via the internal SWD backdoor.

---
*Maintained by **pupvino** - It's not done until it's production ready.*
