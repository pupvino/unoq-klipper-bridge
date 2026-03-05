# 🤖 UNO Q CRYSTAL CORE: TOTAL UART BYPASS
**Target**: ToAuto Pyramid 300 (SKR Mini E3 V3.0 + Arduino Uno Q)

## ⚡ ARCHITECTURE
- **MCU 1 (SKR)**: Connected via **EXP1 Header** (PA9/PA10) ➔ `/dev/ttyMSM1`.
- **MCU 2 (Uno Q)**: Connected via **Internal UART1** (PA9/PA10) ➔ `/dev/ttyMSM0`.
- **Probe**: Relocated to **PA3** to clear EXP1 UART conflict.
- **Sensors**: ADXL345 bridged via Uno Q SPI1 (PB2/AR10).

## 🚀 INSTALLATION
```bash
chmod +x install.sh
./install.sh

EOC
