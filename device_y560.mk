$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/huawei/y560/y560-vendor.mk)

# Use high-density artwork where available
PRODUCT_LOCALES += hdpi
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

DEVICE_PACKAGE_OVERLAYS += device/huawei/y560/overlay

# Insecure ADBD
# (ro.adb.secure=3)
ADDITIONAL_DEFAULT_PROPERTIES += \
	ro.adb.secure=0 \
	persist.service.adb.enable=1

# Enable adb during bootup
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    mtp,adb

# Audio calibration
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/MTP/MTP_Bluetooth_cal.acdb:system/etc/acdbdata/MTP/MTP_Bluetooth_cal.acdb \
    $(LOCAL_PATH)/audio/MTP/MTP_General_cal.acdb:system/etc/acdbdata/MTP/MTP_General_cal.acdb \
    $(LOCAL_PATH)/audio/MTP/MTP_Global_cal.acdb:system/etc/acdbdata/MTP/MTP_Global_cal.acdb \
    $(LOCAL_PATH)/audio/MTP/MTP_Handset_cal.acdb:system/etc/acdbdata/MTP/MTP_Handset_cal.acdb \
    $(LOCAL_PATH)/audio/MTP/MTP_Hdmi_cal.acdb:system/etc/acdbdata/MTP/MTP_Hdmi_cal.acdb \
    $(LOCAL_PATH)/audio/MTP/MTP_Headset_cal.acdb:system/etc/acdbdata/MTP/MTP_Headset_cal.acdb \
    $(LOCAL_PATH)/audio/MTP/MTP_Speaker_cal.acdb:system/etc/acdbdata/MTP/MTP_Speaker_cal.acdb \
    $(LOCAL_PATH)/audio/QRD/QRD_Bluetooth_cal.acdb:system/etc/acdbdata/QRD/QRD_Bluetooth_cal.acdb \
    $(LOCAL_PATH)/audio/QRD/QRD_General_cal.acdb:system/etc/acdbdata/QRD/QRD_General_cal.acdb \
    $(LOCAL_PATH)/audio/QRD/QRD_Global_cal.acdb:system/etc/acdbdata/QRD/QRD_Global_cal.acdb \
    $(LOCAL_PATH)/audio/QRD/QRD_Handset_cal.acdb:system/etc/acdbdata/QRD/QRD_Handset_cal.acdb \
    $(LOCAL_PATH)/audio/QRD/QRD_Hdmi_cal.acdb:system/etc/acdbdata/QRD/QRD_Hdmi_cal.acdb \
    $(LOCAL_PATH)/audio/QRD/QRD_Headset_cal.acdb:system/etc/acdbdata/QRD/QRD_Headset_cal.acdb \
    $(LOCAL_PATH)/audio/QRD/QRD_Speaker_cal.acdb:system/etc/acdbdata/QRD/QRD_Speaker_cal.acdb \
    $(LOCAL_PATH)/audio/QRD/msm8909-skue-snd-card/QRD_SKUE_Bluetooth_cal.acdb:system/etc/acdbdata/QRD/msm8909-skue-snd-card/QRD_SKUE_Bluetooth_cal.acdb \
    $(LOCAL_PATH)/audio/QRD/msm8909-skue-snd-card/QRD_SKUE_General_cal.acdb:system/etc/acdbdata/QRD/msm8909-skue-snd-card/QRD_SKUE_General_cal.acdb \
    $(LOCAL_PATH)/audio/QRD/msm8909-skue-snd-card/QRD_SKUE_Global_cal.acdb:system/etc/acdbdata/QRD/msm8909-skue-snd-card/QRD_SKUE_Global_cal.acdb \
    $(LOCAL_PATH)/audio/QRD/msm8909-skue-snd-card/QRD_SKUE_Handset_cal.acdb:system/etc/acdbdata/QRD/msm8909-skue-snd-card/QRD_SKUE_Handset_cal.acdb \
    $(LOCAL_PATH)/audio/QRD/msm8909-skue-snd-card/QRD_SKUE_Hdmi_cal.acdb:system/etc/acdbdata/QRD/msm8909-skue-snd-card/QRD_SKUE_Hdmi_cal.acdb \
    $(LOCAL_PATH)/audio/QRD/msm8909-skue-snd-card/QRD_SKUE_Headset_cal.acdb:system/etc/acdbdata/QRD/msm8909-skue-snd-card/QRD_SKUE_Headset_cal.acdb \
    $(LOCAL_PATH)/audio/QRD/msm8909-skue-snd-card/QRD_SKUE_Speaker_cal.acdb:system/etc/acdbdata/QRD/msm8909-skue-snd-card/QRD_SKUE_Speaker_cal.acdb 

# media_profiles and media_codecs xmls for 8909
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilts/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/prebuilts/media_profiles.xml:system/etc/media_profiles.xml
    
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml
    
# Audio configuration file
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilts/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/prebuilts/mixer_paths.xml:system/etc/mixer_paths.xml \
    $(LOCAL_PATH)/prebuilts/mixer_paths_qrd_skuh.xml:system/etc/mixer_paths_qrd_skuh.xml

# Feature definition files for msm8909
PRODUCT_COPY_FILES += \
    external/ant-wireless/antradio-library/com.dsi.ant.antradio_library.xml:system/etc/permissions/com.dsi.ant.antradio_library.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

# gps/location secuity configuration file
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilts/sec_config:system/etc/sec_config

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/gps/flp.conf:system/etc/flp.conf \
    $(LOCAL_PATH)/gps/gps.conf:system/etc/gps.conf \
    $(LOCAL_PATH)/gps/izat.conf:system/etc/izat.conf \
    $(LOCAL_PATH)/gps/quipc.conf:system/etc/quipc.conf \
    $(LOCAL_PATH)/gps/sap.conf:system/etc/sap.conf

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi/WCNSS_qcom_cfg.ini:system/etc/wifi/WCNSS_qcom_cfg.ini \
    $(LOCAL_PATH)/wifi/WCNSS_cfg.dat:system/etc/firmware/wlan/prima/WCNSS_cfg.dat \
    $(LOCAL_PATH)/wifi/WCNSS_qcom_wlan_nv.bin:system/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin

#wlan driver
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi/hostapd.accept:system/etc/hostapd/hostapd.accept \
    $(LOCAL_PATH)/wifi/hostapd.conf:system/etc/hostapd/hostapd_default.conf \
    $(LOCAL_PATH)/wifi/hostapd.deny:system/etc/hostapd/hostapd.deny \
    $(LOCAL_PATH)/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf
    
# ANT+ stack
PRODUCT_PACKAGES += \
    AntHalService \
    libantradio \
    antradio_app \
    com.dsi.ant.antradio_library

# Audio
PRODUCT_PACKAGES += \
    audiod \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    audio.primary.msm8909 \
    audio_policy.msm8909 \
    tinymix \
    libqcomvisualizer \
    libqcompostprocbundle \
    libqcomvoiceprocessing

# Camera
PRODUCT_PACKAGES += \
    camera.msm8909 \
    mm-qcamera-app \
    libmmjpeg_interface \
    libmm-omxcore \
    libqomx_core

# Charger
PRODUCT_PACKAGES += \
    charger_res_images

# Connectivity Engine support
PRODUCT_PACKAGES += \
    libcnefeatureconfig

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    setup_fs \
    e2fsck

# FM
PRODUCT_PACKAGES += \
    qcom.fmradio \
    libqcomfm_jni \
    FM2 \
    FMRecord

# Graphics
PRODUCT_PACKAGES += \
    copybit.msm8909 \
    gralloc.msm8909 \
    memtrack.msm8909 \
    hwcomposer.msm8909 \
    libtinyxml

# IPv6
PRODUCT_PACKAGES += \
    ebtables \
    ethertypes \
    libebtc

# Keystore
PRODUCT_PACKAGES += \
    keystore.msm8909

# Live Wallpapers
PRODUCT_PACKAGES += \
    librs_jni

# KEYPAD
PRODUCT_PACKAGES += \
    synaptics_rmi4_i2c.kl \
    synaptics_dsx.kl \
    ft5x06_ts.kl \
    gpio-keys.kl

# OMX
PRODUCT_PACKAGES += \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxCore \
    libOmxEvrcEnc \
    libOmxQcelp13Enc \
    libOmxVdec \
    libOmxVenc \
    libdivxdrmdecrypt \
    libstagefrighthw \
    libdashplayer \
    qcmediaplayer

# Power
PRODUCT_PACKAGES += \
    power.msm8909

# GPS
PRODUCT_PACKAGES += \
    gps.msm8909

# Sensors
PRODUCT_PACKAGES += \
    sensors.msm8909 \
    libcalmodule_akm \
    calmodule.cfg

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.qcom \
    init.qcom.power.rc \
    init.qcom.rc \
    init.qcom.usb.rc \
    init.qcom.usb.sh \
    init.recovery.qcom.rc \
    ueventd.qcom.rc

# Etc
PRODUCT_PACKAGES += \
    init.qcom.bt.sh \
    init.qcom.zram.sh

# Misc
PRODUCT_PACKAGES += \
    libbson \
    libxml2

# USB
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# WiFi
PRODUCT_PACKAGES += \
    libqsap_sdk \
    libQWiFiSoftApCfg \
    libwpa_client \
    hostapd \
    dhcpcd.conf \
    wpa_supplicant \
    wpa_supplicant.conf \
    wcnss_service

PRODUCT_BOOT_JARS += \
    qcmediaplayer

# System Properties
PRODUCT_PROPERTY_OVERRIDES += \
    drm.service.enabled=true

# Camera shutter sound property
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.camera-sound=1

PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapgrowthlimit=128m \
    dalvik.vm.heapminfree=6m \
    dalvik.vm.heapstartsize=14m \
    persist.radio.no_wait_for_card=1 \
    persist.radio.apm_sim_not_pwdn=1 \
    persist.radio.sib16_support=1 \
    ro.sf.lcd_density=240

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp \
    camera2.portability.force_api=1

# IO Scheduler
PRODUCT_PROPERTY_OVERRIDES += \
    sys.io.scheduler=bfq

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/huawei/y560/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_y560
PRODUCT_DEVICE := y560
