# 🤖 Uno Q Crystal Core: Total UART Bridge
**Target Hardware**: ToAuto Pyramid 300 (SKR Mini E3 V3.0 + Arduino Uno Q)

This repository contains the production-ready configuration and automated installer for bypassing the Qualcomm USB watchdog on the Arduino Uno Q, establishing a **Total UART** serial link between the host and dual MCUs.

## ⚡ Key Features
- **Zero-USB Architecture**: Both MCUs communicate via internal Snapdragon serial nodes.
- **Dual-MCU Sync**: SKR Mini E3 (Motion) and Uno Q (Sensors) bridged via high-speed UART.
- **Resonance Optimized**: Integrated ADXL345 support via the Uno Q SPI1 bridge.

## 🛠 Installation
```bash
./install.sh
```

## 🔌 Hardware Mapping
| MCU | Path | Interface |
| :--- | :--- | :--- |
| **SKR Mini E3** | `/dev/ttyHS1` | EXP1 UART (PA9/PA10) |
| **Uno Q Bridge** | `/dev/ttyMSM0` | Internal UART1 (PA9/PA10) |

---
*Created by **pupvino** - It's not done until it's production ready.*
