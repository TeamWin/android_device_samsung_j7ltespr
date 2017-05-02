# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := MSM8916
TARGET_NO_BOOTLOADER := true
TARGET_PLATFORM_DEVICE_BASE := /devices/soc.0/

# Platform
TARGET_BOARD_PLATFORM := msm8916
TARGET_BOARD_PLATFORM_GPU := qcom-adreno306

# Architecture
TARGET_ARCH := arm
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_CPU_VARIANT := cortex-a53
TARGET_CPU_CORTEX_A53 := true

BOARD_KERNEL_CMDLINE := console=null androidboot.hardware=qcom user_debug=23 msm_rtb.filter=0x3F ehci-hcd.park=3 androidboot.bootdevice=7824900.sdhci

BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x80008000 --ramdisk_offset 0x82000000 --tags_offset 0x81e00000 --dt device/samsung/j7ltespr/dt.img

# prebuilt kernel
TARGET_PREBUILT_KERNEL := device/samsung/j7ltespr/kernel

# fstab
TARGET_RECOVERY_FSTAB := device/samsung/j7ltespr/twrp/twrp.fstab

BOARD_BOOTIMAGE_PARTITION_SIZE := 13631488
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 15728640
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3294625792
BOARD_PERSISTIMAGE_PARTITION_SIZE := 8388608
BOARD_CACHEIMAGE_PARTITION_SIZE := 314572800
BOARD_USERDATAIMAGE_PARTITION_SIZE := 11900268544
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_HAS_NO_SELECT_BUTTON := true

TW_THEME := portrait_hdpi
BOARD_SUPPRESS_SECURE_ERASE := true
TW_NO_REBOOT_BOOTLOADER := true
# reboot recovery does not seem to work on this device
TW_NO_REBOOT_RECOVERY := true
TW_HAS_DOWNLOAD_MODE := true
# disable phantom mouse device
TW_INPUT_BLACKLIST := "hbtp_vm"
