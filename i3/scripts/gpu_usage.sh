#!/bin/bash

if [ -f /sys/module/amdgpu/drivers/pci:amdgpu/0000:2b:00.0/gpu_busy_percent ]; then
	usage=$(awk '{print $1}' /sys/module/amdgpu/drivers/pci:amdgpu/0000:2b:00.0/gpu_busy_percent)
	echo "${usage}%"
else
	echo "N/A"
fi
