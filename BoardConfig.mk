-include vendor/leeco/x3/BoardConfigVendor.mk

DEVICE_PATH := device/leeco/x3

TARGET_SPECIFIC_HEADER_PATH := $(DEVICE_PATH)/include

MTK_K64_SUPPORT := yes

ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_NO_BOOTLOADER := true

TARGET_BOARD_PLATFORM := mt6795

# CPU
ifeq ($(FORCE_32_BIT),true)
TARGET_ARCH := arm
TARGET_CPU_VARIANT := cortex-a7
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_ARCH_VARIANT := armv7-a-neon
else
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53
TARGET_CPU_SMP := true

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53
endif

# Shims
TARGET_LD_SHIM_LIBS := \
    /system/lib/libui.so|/system/vendor/lib/libmtk_ui.so \
    /system/lib64/libui.so|/system/vendor/lib64/libmtk_ui.so \
    /system/lib/liblog.so|/system/vendor/lib/libmtk_xlog.so \
    /system/lib64/liblog.so|/system/vendor/lib64/libmtk_xlog.so \
    /system/lib/libcam_utils.so|/system/vendor/lib/libmtk_cam.so \
    /system/lib64/libcam_utils.so|/system/vendor/lib64/libmtk_cam.so \
    /system/lib/hw/audio.primary.mt6795.so|/system/vendor/lib/libmtk_audio.so \
    /system/lib64/hw/audio.primary.mt6795.so|/system/vendor/lib64/libmtk_audio.so
    /system/lib/libbinder.so|/system/vendor/lib/libmtk_hacks.so \
    /system/lib64/libbinder.so|/system/vendor/lib64/libmtk_hacks.so \
    /system/lib/libgui.so|/system/vendor/lib/libmtk_gui.so \
    /system/lib64/libgui.so|/system/vendor/lib64/libmtk_gui.so \
    /system/lib/libmedia.so|/system/vendor/lib/libmtk_omx.so \
    /system/lib64/libmedia.so|/system/vendor/lib64/libmtk_omx.so \
    /system/lib/libicuuc.so|/system/vendor/lib/libmtk_icu.so \
    /system/lib64/libicuuc.so|/system/vendor/lib64/libmtk_icu.so \
    /system/lib/libcrypto.so|/system/vendor/lib/libmtk_crypto.so \
    /system/lib64/libcrypto.so|/system/vendor/lib64/libmtk_crypto.so \
    /system/lib/libsensor.so|/system/vendor/lib/libmtk_sensor.so \
    /system/lib64/libsensor.so|/system/vendor/lib64/libmtk_sensor.so \
    /system/lib/libssl.so|/system/vendor/lib/libmtk_ssl.so \
    /system/lib64/libssl.so|/system/vendor/lib64/libmtk_ssl.so \
    /system/lib/libbinder.so|/system/vendor/lib/libmtk_string.so \
    /system/lib/libbinder.so|/system/vendor/lib/libmtk_wvm32.so \
    /system/lib64/libbinder.so|/system/vendor/lib64/libmtk_wvm64.so \
    /system/lib64/libbinder.so|/system/vendor/lib64/libmtk_parcel.so
    
# FIX Freezing
TARGET_NO_SENSOR_PERMISSION_CHECK := true
TARGET_REQUIRES_SYNCHRONOUS_SETSURFACE := true

# BOOTLOADER
TARGET_BOOTLOADER_BOARD_NAME := mt6795

# EXT4
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# MTK Hardware
BOARD_USES_MTK_HARDWARE := true
BOARD_HAS_MTK_HARDWARE := true
MTK_HARDWARE := true
TARGET_KMODULES := true
BOARD_GLOBAL_CFLAGS += -DCOMPAT_SENSORS_M
BOARD_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD
BOARD_GLOBAL_CFLAGS += -DDISABLE_ASHMEM_TRACKING
BOARD_GLOBAL_CFLAGS += -DCAMERA_VENDOR_L_COMPAT
BOARD_GLOBAL_CFLAGS += -DDECAY_TIME_DEFAULT=0
BOARD_DISABLE_HW_ID_MATCH_CHECK := true

# Kernel
TARGET_USES_64_BIT_BINDER := true
TARGET_IS_64_BIT := true
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2 androidboot.selinux=permissive androidboot.verifiedbootstate=green
BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := \
	--base 0x40078000 \
	--pagesize 2048 \
	--kernel_offset 0x00008000 \
	--ramdisk_offset 0x03f88000 \
	--second_offset 0x00e88000 \
	--tags_offset 0x0df88000 \
	--board MT6795
TARGET_KERNEL_SOURCE := kernel/leeco/x3
TARGET_KERNEL_CONFIG := x500_defconfig
TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-android-
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb

# build old-style zip files (required for ota updater)
BLOCK_BASED_OTA := false

# Disable memcpy opt (for audio libraries)
TARGET_CPU_MEMCPY_OPT_DISABLE := true

# Display
USE_OPENGL_RENDERER := true
BOARD_EGL_CFG := $(DEVICE_PATH)/configs/egl.cfg
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080
BOARD_EGL_WORKAROUND_BUG_10194508 := true
BOARD_EGL_NEEDS_HANDLE_VALUE := true
MTK_HWC_SUPPORT := yes
MTK_HWC_VERSION := 1.4.1
PRESENT_TIME_OFFSET_FROM_VSYNC_NS := 0

# LightHAL
TARGET_PROVIDES_LIBLIGHT := true

# Enable Minikin text layout engine (will be the default soon)
USE_MINIKIN := true

# Charger
BOARD_CHARGER_SHOW_PERCENTAGE := true

# Offline charging
BOARD_CHARGING_MODE_BOOTING_LPM := /sys/class/BOOT/BOOT/boot/boot_mode

# Fonts
EXTENDED_FONT_FOOTPRINT := true

# Audio
BOARD_USES_MTK_AUDIO := true
BOARD_CONNECTIVITY_VENDOR := MediaTek
USE_XML_AUDIO_POLICY_CONF := 1

# RIL
#BOARD_PROVIDES_RILD := true
BOARD_RIL_CLASS := ../../../$(DEVICE_PATH)/ril
BOARD_CONNECTIVITY_MODULE := conn_soc

# Display
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true

# CMHW
#BOARD_USES_CYANOGEN_HARDWARE := true
BOARD_HARDWARE_CLASS := $(DEVICE_PATH)/lineagehw
#TARGET_TAP_TO_WAKE_NODE := "/sys/bus/i2c/devices/i2c-2/2-004b/wake_gesture_enable"

# Wifi
BOARD_WLAN_DEVICE := MediaTek
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_mt66xx
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_mt66xx
WIFI_DRIVER_FW_PATH_PARAM := "/dev/wmtWifi"
WIFI_DRIVER_FW_PATH_STA := STA
WIFI_DRIVER_FW_PATH_AP := AP
WIFI_DRIVER_FW_PATH_P2P := P2P
WIFI_DRIVER_STATE_CTRL_PARAM := "/dev/wmtWifi"
WIFI_DRIVER_STATE_ON := 1
WIFI_DRIVER_STATE_OFF := 0

# Fix video autoscaling on old OMX decoders
TARGET_OMX_LEGACY_RESCALING:=true

# Bluetooth
MTK_BT_SUPPORT := yes
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_MTK := true
BOARD_BLUETOOTH_DOES_NOT_USE_RFKILL := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth

# GPS
BOARD_GPS_LIBRARIES := true
BOARD_MEDIATEK_USES_GPS := true

# make_ext4fs requires numbers in dec format
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2684354560
BOARD_CACHEIMAGE_PARTITION_SIZE := 444596224
BOARD_USERDATAIMAGE_PARTITION_SIZE := 27992260608
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_FLASH_BLOCK_SIZE := 4096

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/ramdisk/recovery.fstab
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/class/android_usb/android0/f_mass_storage/lun/file

BOARD_HAS_NO_SELECT_BUTTON := true

# CWM
BOARD_RECOVERY_SWIPE := true
BOARD_SUPPRESS_EMMC_WIPE := true
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_15x24.h\"
TARGET_RECOVERY_PIXEL_FORMAT := "RGBA_8888"

# system.prop
TARGET_SYSTEM_PROP := $(DEVICE_PATH)/system.prop

# SELinux
#BOARD_SEPOLICY_DIRS += device/leeco/x3/sepolicy

# Seccomp Filter
BOARD_SECCOMP_POLICY := $(DEVICE_PATH)/seccomp

# Legacy blobs
TARGET_NEEDS_TEXT_RELOCATIONS := true

# Camera
TARGET_HAS_LEGACY_CAMERA_HAL1 := true
BOARD_USES_MTK_MEDIA_PROFILES:=true
TARGET_HAS_LEGACY_LP_CAM := true
TARGET_CAMERASERVICE_CLOSES_NATIVE_HANDLES := true
USE_CAMERA_STUB := true

# Charger
BACKLIGHT_PATH := /sys/class/leds/lcd-backlight/brightness
BOARD_RED_LED_PATH := "/sys/class/leds/red"
BOARD_GREEN_LED_PATH := "/sys/class/leds/green"
BOARD_BLUE_LED_PATH := "/sys/class/leds/blue"

#Treble support
PRODUCT_FULL_TREBLE := false

# HIDL Manifest
DEVICE_MANIFEST_FILE := $(DEVICE_PATH)/manifest.xml

#Software gatekeeper
BOARD_USE_SOFT_GATEKEEPER := true