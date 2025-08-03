#
# Copyright (C) 2025 The Android Open Source Project
# Copyright (C) 2025 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/asus/P021

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# Architecture

TARGET_ARCH := x86
TARGET_ARCH_VARIANT := atom
TARGET_CPU_ABI := x86
TARGET_CPU_VARIANT := x86
TARGET_CPU_ABI2 := armeabi-v7a
TARGET_CPU_ABI_LIST := x86,armeabi-v7a,armeabi
TARGET_CPU_ABI_LIST_32_BIT := x86,armeabi-v7a,armeabi
TARGET_CPU_SMP := true

# Display
TARGET_SCREEN_DENSITY := 160

# Kernel
BOARD_KERNEL_BASE := 0x007f8000
BOARD_KERNEL_CMDLINE := androidboot.selinux=permissive idle=halt androidboot.hardware=sofia3g nolapic_pm firmware_class.path=/system/vendor/firmware nolapic_timer x86_intel_xgold_timer=soctimer_only vmalloc=256M slub_max_order=0 build_version=3 debug notsc
BOARD_KERNEL_PAGESIZE := 4096
BOARD_RAMDISK_OFFSET := 0xffc08000
BOARD_KERNEL_TAGS_OFFSET := 0xff808100
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_KERNEL_IMAGE_NAME := Image
TARGET_KERNEL_CONFIG := P021_defconfig
TARGET_KERNEL_SOURCE := kernel/asus/P021

# Kernel - prebuilt
TARGET_FORCE_PREBUILT_KERNEL := true
ifeq ($(TARGET_FORCE_PREBUILT_KERNEL),true)
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
endif

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 41943040
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 42024960
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0x08c60000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x105c0000
BOARD_FLASH_BLOCK_SIZE := 131072

# Platform
TARGET_BOARD_PLATFORM := sofia3g

TARGET_DROIDBOOT_LIBS := libintel_droidboot
TARGET_BOOTLOADER_IS_2ND := true
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
COMMON_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD

# EGL
BOARD_EGL_CFG := device/asus/p023/configs/egl.cfg

# Recovery
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := false

# Hack: prevent anti rollback
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 16.1.0

# TWRP Configuration
TW_THEME := portrait_hdpi
TW_EXTRA_LANGUAGES := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_USE_TOOLBOX := true
