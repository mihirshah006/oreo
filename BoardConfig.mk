#
# Copyright (C) 2016 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

include device/motorola/msm8916-common/BoardConfigCommon.mk

-include vendor/motorola/harpia/BoardConfigVendor.mk

DEVICE_PATH := device/motorola/harpia

# Asserts
TARGET_OTA_ASSERT_DEVICE := harpia,harpia_retail

# Init
TARGET_INIT_VENDOR_LIB := libinit_harpia
TARGET_RECOVERY_DEVICE_MODULES := libinit_harpia

# Kernel
TARGET_KERNEL_CONFIG := harpia_defconfig

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216     # 16384 * 1024 mmcblk0p31
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456   # 262144 * 1024 mmcblk0p38
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16879616 # 16484 * 1024 mmcblk0p32
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2684354560 # 2621440 * 1024 mmcblk0p41
BOARD_PERSISTIMAGE_PARTITION_SIZE := 8388608   # 8192 * 1024 mmcblk0p29
BOARD_USERDATAIMAGE_PARTITION_SIZE := 11775377408 # 11499392 * 1024 mmcblk0p42

# Filesystem
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_ANDROID_FILESYSTEM_CONFIG_H := $(DEVICE_PATH)/android_filesystem_config.h

# Flags
#TARGET_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD

# FM
AUDIO_FEATURE_ENABLED_FM_POWER_OPT := true
TARGET_QCOM_NO_FM_FIRMWARE := true
BOARD_HAVE_QCOM_FM := true

# GPS
TARGET_NO_RPC := true
USE_DEVICE_SPECIFIC_GPS := true

# Init
TARGET_LIBINIT_MSM8916_DEFINES_FILE := $(DEVICE_PATH)/init/init_wt88047.cpp
TARGET_INIT_VENDOR_LIB := libinit_msm8916
TARGET_PLATFORM_DEVICE_BASE := /devices/soc.0/
TARGET_RECOVERY_DEVICE_MODULES := libinit_msm8916

# Keymaster
TARGET_KEYMASTER_WAIT_FOR_QSEE := true

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Power
TARGET_POWERHAL_HEADER_PATH := $(DEVICE_PATH)/power

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
