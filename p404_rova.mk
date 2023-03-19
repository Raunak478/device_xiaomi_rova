#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_n_mr1.mk)

# Inherit some common P404 stuff.
$(call inherit-product, vendor/404/config/common.mk)

# Inherit some common device props
TARGET_SUPPORTS_QUICK_TAP := true
TARGET_FACE_UNLOCK_SUPPORTED := true
TARGET_SUPPORTS_CALL_RECORDING := true

# Inherit from rova device
$(call inherit-product, device/xiaomi/rova/device.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := rova
PRODUCT_NAME := p404_rova
BOARD_VENDOR := Xiaomi
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := Redmi 4A / 5A
PRODUCT_MANUFACTURER := Xiaomi
TARGET_VENDOR := Xiaomi

# Boot animation
TARGET_BOOT_ANIMATION_RES := 720


# Overlay
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay-p404

PRODUCT_PACKAGES += \
    xiaomi_riva_overlay_p404 \
    xiaomi_rolex_overlay_p404


PRODUCT_GMS_CLIENTID_BASE := android-xiaomi
