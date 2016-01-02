USE_CAMERA_STUB := true

# inherit from the proprietary version
-include vendor/huawei/y560-l01/BoardConfigVendor.mk

# Assert
TARGET_OTA_ASSERT_DEVICE := HWY560-L

# Bootloader
TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := msm8909

# Platform
TARGET_BOARD_PLATFORM := msm8909
TARGET_BOARD_PLATFORM_GPU := qcom-adreno306

# Architecture
TARGET_ARCH := arm
TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a7
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true

# Kernel
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.console=ttyHSL0 androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x3F ehci-hcd.park=3 androidboot.bootdevice=7824900.sdhci lpm_levels.sleep_disabled=1 earlyprintk
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_PAGESIZE := 2048
#TARGET_KERNEL_SOURCE := ../kernel/huawei/msm-3.10
#TARGET_KERNEL_CONFIG := y560_defconfig
TARGET_PREBUILT_KERNEL := device/huawei/y560/kernel
BOARD_MKBOOTIMG_ARGS := --dt device/huawei/y560/dt.img

# Partitions
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 33554432
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2053531648
BOARD_USERDATAIMAGE_PARTITION_SIZE := 5065653248
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456
BOARD_PERSISTIMAGE_PARTITION_SIZE := 33554432

# Power
TARGET_POWERHAL_VARIANT := qcom

# Qualcomm support
BOARD_USES_QCOM_HARDWARE := true
BOARD_USES_QC_TIME_SERVICES := true
TARGET_RECOVERY_QCOM_RTC_FIX := true

# Vold
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun%d/file

# Recovery
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_RECOVERY_FSTAB = device/huawei/y560/recovery.fstab
BOARD_CUSTOM_RECOVERY_UI := ../../device/huawei/y560/recovery/qcom_recovery_ui.c
TARGET_RECOVERY_PIXEL_FORMAT := RGB_565
BOARD_SUPPRESS_SECURE_ERASE := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_RECOVERY_HANDLES_MOUNT := true

# Vendor Init
TARGET_PLATFORM_DEVICE_BASE := /devices/soc.0/
