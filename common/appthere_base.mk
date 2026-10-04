# AppThere OS — common product base.
#
# Inherited by every AppThere target. Establishes the three things that are
# true of all AppThere devices: 64-bit only, desktop windowing available,
# Linux development environment available.

# 64-bit only. core_64_bit_only.mk sets TARGET_SUPPORTS_32_BIT_APPS := false
# and TARGET_SUPPORTS_64_BIT_APPS := true, and drops the 32-bit zygote.
# Do NOT also inherit core_64_bit.mk -- that one keeps 32-bit app support.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)

# AppThere branding (ro.product.*, fingerprint, bootanimation).
$(call inherit-product-if-exists, vendor/appthere/config/branding.mk)

# Feature bundles.
$(call inherit-product, device/appthere/common/desktop.mk)
$(call inherit-product, device/appthere/common/terminal.mk)

PRODUCT_SHIPPING_API_LEVEL := 36

# Treat our res overlay as an RRO where possible rather than baking it in,
# so Settings/SystemUI stay closer to upstream and rebase cleanly.
PRODUCT_PACKAGE_OVERLAYS += device/appthere/common/overlay

PRODUCT_CHARACTERISTICS := nosdcard
