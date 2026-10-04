# AppThere OS — desktop window management.
#
# Desktop windowing lives in frameworks/base/libs/WindowManager/Shell
# (.../shared/desktopmode + .../wm/shell/desktopmode). On AOSP it is gated by
# three independent layers, and ALL THREE must be satisfied:
#
#   1. aconfig flags  (com.android.window.flags.*)  -- build-time
#   2. config_* resource booleans in core/res       -- per-device
#   3. persist.wm.debug.* sysprops                  -- runtime override
#
# Layer 2 is handled in common/overlay/.../config.xml. Layer 3 is below.
# Layer 1 is handled by the release config in vendor/appthere/release.
#
# !! VERIFY AFTER FIRST SYNC: flag and config names move between releases.
#    Run scripts/verify-feature-knobs.sh to check these against the synced
#    AOSP 17 tree before trusting this file.

# Freeform window management is the AOSP capability underneath desktop mode.
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.freeform_window_management.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.software.freeform_window_management.xml

# Runtime enablement. Set on the product partition so it can be overridden
# per-device without touching system.
PRODUCT_PRODUCT_PROPERTIES += \
    persist.wm.debug.desktop_mode_force_enable=1 \
    persist.wm.debug.desktop_mode=true

# Multi-display / external monitor support for the laptop + tablet targets.
PRODUCT_PRODUCT_PROPERTIES += \
    persist.wm.debug.desktop_mode_on_external_display=true
