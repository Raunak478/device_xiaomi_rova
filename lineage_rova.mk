#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_n_mr1.mk)

# Inherit some common LineageOS stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from rova device
$(call inherit-product, device/xiaomi/rova/device.mk)

# GAPPS main flag
WITH_GAPPS := false
# Compiler will only build GMS playstore services, its dependencies, and Gboard app.
TARGET_CORE_GAPPS := false
# extra flag under TARGET_CORE_GAPPS. Extra packages for core build type (velvet and photos)
TARGET_CORE_GAPPS_EXTRAS := false

# Alpha internal properties
ALPHA_BUILD_TYPE := Official
TARGET_ENABLE_BLUR := false
TARGET_INCLUDE_MATLOG := false
TARGET_USE_GRAPHENE_CAMERA := true
TARGET_USE_PIXEL_LAUNCHER := false
TARGET_EXCLUDES_AUDIOFX := true
TARGET_FACE_UNLOCK_SUPPORTED := true
ALPHA_MAINTAINER := @maxx459

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := rova
PRODUCT_NAME := lineage_rova
BOARD_VENDOR := Xiaomi
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := Redmi 4A / 5A
PRODUCT_MANUFACTURER := Xiaomi
TARGET_VENDOR := Xiaomi

# Boot animation
TARGET_BOOT_ANIMATION_RES := 720

# Overlay
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay-lineage

PRODUCT_PACKAGES += \
    xiaomi_riva_overlay_lineage \
    xiaomi_rolex_overlay_lineage

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi
