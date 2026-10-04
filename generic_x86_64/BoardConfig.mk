# AppThere OS — x86_64, 64-bit ONLY.
# As with arm64: no TARGET_2ND_ARCH means no 32-bit build.

TARGET_ARCH         := x86_64
TARGET_ARCH_VARIANT := x86_64
TARGET_CPU_ABI      := x86_64

# Intentionally NOT set: TARGET_2ND_ARCH (would re-enable 32-bit x86).

TARGET_USES_64_BIT_BINDER := true
TARGET_NO_BOOTLOADER      := true
TARGET_NO_KERNEL          := true

PRODUCT_FULL_TREBLE_OVERRIDE := true
BOARD_VNDK_VERSION           := current

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
