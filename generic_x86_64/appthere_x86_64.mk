# AppThere OS — generic x86_64 system image.
#
# Staging ground for the laptop target (HP Chromebook x360, Core i3-8130U,
# Kaby Lake-R). NOTE: this does NOT boot bare metal as-is. AOSP's x86_64
# support is emulator-oriented (goldfish); real-hardware boot additionally
# needs GRUB-EFI, a distro-class kernel with i915/iwlwifi, and Mesa.
# That is tracked as the Phase 5 bare-metal effort in docs/BUILD_PLAN.md.
$(call inherit-product, $(SRC_TARGET_DIR)/product/generic_system.mk)
$(call inherit-product, device/appthere/common/appthere_base.mk)

PRODUCT_NAME    := appthere_x86_64
PRODUCT_DEVICE  := generic_x86_64
PRODUCT_MODEL   := AppThere OS (x86_64)

PRODUCT_PRODUCT_PROPERTIES += \
    ro.appthere.target.class=generic
