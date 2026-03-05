#!/bin/bash
# ════════════════════════════════════════════════════════════════════════
# CRYSTAL CORE - Post-Install Maintenance Script
# ════════════════════════════════════════════════════════════════════════
echo "🚀 Starting Neural Link Housekeeping..."

# Mask the 'Barnacle' Services
echo "📦 Masking Arduino services to prevent port contention..."
sudo systemctl mask serial-getty@ttyMSM0.service
sudo systemctl mask arduino-router-serial.service
sudo systemctl mask arduino-app-cli.service

# Force-stop the active listeners
sudo systemctl stop serial-getty@ttyMSM0.service arduino-router-serial.service arduino-app-cli.service

# Restart the Heartbeat [cite: 2025-12-06]
echo "💓 Restarting Klipper Service..."
sudo systemctl restart klipper

echo "✅ Housekeeping Complete. Total UART active on /dev/ttyHS1 and /dev/ttyMSM0."
