# AppThere OS — arm64, 64-bit ONLY.
#
# 64-bit-only is expressed by the ABSENCE of TARGET_2ND_ARCH. Defining any
# TARGET_2ND_* variable here reintroduces the 32-bit build and silently
# defeats core_64_bit_only.mk.

TARGET_ARCH         := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI      := arm64-v8a
TARGET_CPU_VARIANT  := generic

# Intentionally NOT set: TARGET_2ND_ARCH, TARGET_2ND_CPU_ABI, ...

TARGET_USES_64_BIT_BINDER := true
TARGET_NO_BOOTLOADER      := true
TARGET_NO_KERNEL          := true

# Treble
PRODUCT_FULL_TREBLE_OVERRIDE := true
BOARD_VNDK_VERSION           := current

# System-as-root / dynamic partitions
TARGET_USERIMAGES_USE_EXT4   := true
TARGET_USERIMAGES_USE_F2FS   := true
BOARD_BUILD_SYSTEM_ROOT_IMAGE := false
