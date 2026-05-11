#!/bin/bash

echo "=================================="
echo " Linux USB Automation Tool "
echo "=================================="

echo
echo "[INFO] Starting device selection..."
source ./device.sh

echo
echo "[INFO] Starting partition setup..."
source ./partition.sh

echo
echo "[INFO] Starting filesystem formatting..."
source ./format.sh

echo
echo "[INFO] Starting mount process..."
source ./mount.sh

echo
echo "=================================="
echo "[OK] USB automation completed."
echo "=================================="
