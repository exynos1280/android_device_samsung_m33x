#
# Copyright (C) The LineageOS Project
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
#

# Inherit proprietary files
$(call inherit-product, vendor/samsung/m33x/m33x-vendor.mk)

# Inherit common makefile
$(call inherit-product, device/samsung/s5e8825-common/common.mk)

# Inherit Dalvik VM configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

DEVICE_PATH := device/samsung/m33x

# Audio - Configuration
PRODUCT_PACKAGES += \
    audio_board_info.xml \
    mixer_gains.xml \
    mixer_paths.xml

# FM Radio
PRODUCT_PACKAGES += \
    FMRadio \
    libfmjni

$(call soong_config_set,libfmjni,vendor,slsi)

# Init
PRODUCT_PACKAGES += \
    init.m33x.rc \
    init.m33x.unify.rc

# Nfc
PRODUCT_PACKAGES += android.hardware.nfc@1.2-service

# Nfc - Configuration
PRODUCT_PACKAGES += \
    libnfc-nci.conf \
    libnfc-nxp.conf \
    libnfc-nxp_RF.conf

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(DEVICE_PATH)/overlay

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += $(DEVICE_PATH)
