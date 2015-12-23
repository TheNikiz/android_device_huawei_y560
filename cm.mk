# Release name
PRODUCT_RELEASE_NAME := y560

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/huawei/y560/device_y560.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := y560
PRODUCT_NAME := cm_y560
PRODUCT_BRAND := huawei
PRODUCT_MODEL := y560
PRODUCT_MANUFACTURER := huawei
