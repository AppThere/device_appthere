# AppThere OS — Linux development environment (AVF Terminal).
#
# The "Linux terminal" is the Terminal app from
# packages/modules/Virtualization/android/TerminalApp, running a Debian guest
# under the Android Virtualization Framework (AVF).
#
# Hard requirements:
#   - arm64: pKVM or protected KVM in the device kernel
#   - x86_64: KVM (nested virt if the host is itself a VM -- matters for
#     Cuttlefish, which must then run with nested virtualization enabled)
#
# A device WITHOUT working KVM cannot run this; terminal.mk is therefore
# inherited per-target, not unconditionally, and each BoardConfig asserts
# its virtualization support.
#
# !! VERIFY AFTER FIRST SYNC: the AVF module/APEX names below.

# AVF runtime + the Terminal app itself.
PRODUCT_PACKAGES += \
    com.android.virt \
    VmTerminalApp

# Declare the platform feature so the app and SDK surface light up.
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.virtualization_framework.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.software.virtualization_framework.xml

PRODUCT_PRODUCT_PROPERTIES += \
    ro.appthere.terminal.enabled=true
