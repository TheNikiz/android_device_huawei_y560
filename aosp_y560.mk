
# Copyright (C) 2013 OmniROM Project
# Copyright (C) 2012 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/core.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)
$(call inherit-product, device/huawei/y560/device_y560.mk)
$(call inherit-product-if-exists, vendor/huawei/y560/y560-vendor.mk)

# Device identifier. This must come after all inclusions
PRODUCT_NAME := aosp_y560
PRODUCT_DEVICE := y560
PRODUCT_BRAND := HUAWEI
PRODUCT_MANUFACTURER := HUAWEI
PRODUCT_MODEL := HUAWEI Y560-L01

# Just so we can install stock updates
PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_PRODUCT=Y560-L01 \
	TARGET_DEVICE=HWY560-L


PRODUCT_PACKAGES += \
    Launcher3