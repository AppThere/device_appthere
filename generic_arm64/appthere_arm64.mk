# AppThere OS — generic arm64 system image (GSI-style).
#
# Treble-compliant system image, flashable to any arm64 device with a
# conformant vendor partition. This is the staging ground for the Pixel 6a
# (bluejay) and tablet targets: get the system side right here, then add
# device-specific trees.
#
# !! VERIFY AFTER FIRST SYNC: generic_system.mk vs mainline_system.mk naming.
$(call inherit-product, $(SRC_TARGET_DIR)/product/generic_system.mk)
$(call inherit-product, device/appthere/common/appthere_base.mk)

PRODUCT_NAME    := appthere_arm64
PRODUCT_DEVICE  := generic_arm64
PRODUCT_MODEL   := AppThere OS (arm64)

PRODUCT_PRODUCT_PROPERTIES += \
    ro.appthere.target.class=generic
