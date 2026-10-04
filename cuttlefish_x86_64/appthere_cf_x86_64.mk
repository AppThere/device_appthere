# AppThere OS on Cuttlefish (x86_64 virtual device).
#
# PRIMARY DEVELOPMENT TARGET. Boots under crosvm on this workstation, so the
# edit -> build -> boot -> test loop is minutes rather than a flash cycle.
# All desktop-windowing and Terminal work is validated here first.
#
# Cuttlefish supports arbitrary display geometry, which makes it the right
# place to develop large-screen desktop behaviour:
#   launch_cvd --config=tablet --x_res=2560 --y_res=1600 --dpi=200
#
# !! VERIFY AFTER FIRST SYNC: confirm this inherit path exists in AOSP 17.
#    Cuttlefish product makefiles have moved between releases.
$(call inherit-product, device/google/cuttlefish/vsoc_x86_64/phone/aosp_cf.mk)

# AppThere identity + features. Inherited AFTER the base so our values win.
$(call inherit-product, device/appthere/common/appthere_base.mk)

PRODUCT_NAME    := appthere_cf_x86_64
PRODUCT_DEVICE  := vsoc_x86_64
PRODUCT_MODEL   := AppThere OS on Cuttlefish (x86_64)

# Cuttlefish is itself a VM, so the AVF Terminal needs NESTED virtualization.
# On an Intel host: modprobe kvm_intel nested=1
PRODUCT_PRODUCT_PROPERTIES += \
    ro.appthere.target.class=virtual
