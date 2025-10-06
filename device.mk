#
# Copyright (c) 2020 Rockchip Electronics Co., Ltd
#

# Set system properties identifying the chipset
PRODUCT_VENDOR_PROPERTIES += ro.soc.model=RK3566
# GPU Profiling
PRODUCT_VENDOR_PROPERTIES += graphics.gpu.profiler.support=true

PRODUCT_PACKAGES += \
    displayd \
    libion

PRODUCT_PACKAGES += \
    RockchipPinnerService

# Disable partial updates
PRODUCT_PROPERTY_OVERRIDES += \
    debug.hwui.use_partial_updates=false

TARGET_SYSTEM_PROP += device/hardkernel/rk356x/rk356x.prop
# enable this for support f2fs with data partion
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs

# This ensures the needed build tools are available.
# TODO: make non-linux builds happy with external/f2fs-tool; system/extras/f2fs_utils
ifeq ($(HOST_OS),linux)
  TARGET_USERIMAGES_USE_F2FS := true
endif

PRODUCT_COPY_FILES += \
    vendor/rockchip/common/bin/$(TARGET_ARCH)/busybox:recovery/root/sbin/busybox

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init.rk356x.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.rk356x.rc \
    $(LOCAL_PATH)/wake_lock_filter.xml:system/etc/wake_lock_filter.xml \
    $(LOCAL_PATH)/package_performance.xml:$(TARGET_COPY_OUT_ODM)/etc/package_performance.xml \
    $(TARGET_DEVICE_DIR)/media_profiles_default.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml \
    $(LOCAL_PATH)/files/makebootini:$(TARGET_COPY_OUT_VENDOR)/bin/makebootini

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml

# copy xml files for Vulkan features.
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.compute-0.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level-0.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level-1.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_0_3.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version-1_0_3.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version-1_1.xml \
    frameworks/native/data/etc/android.software.vulkan.deqp.level-2019-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.vulkan.deqp.level-2019-03-01.xml \
    frameworks/native/data/etc/android.software.vulkan.deqp.level-2020-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.vulkan.deqp.level-2020-03-01.xml \
    frameworks/native/data/etc/android.software.vulkan.deqp.level-2021-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.vulkan.deqp.level-2021-03-01.xml \
    frameworks/native/data/etc/android.software.vulkan.deqp.level-2022-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.vulkan.deqp.level-2022-03-01.xml

# Get the long list of APNs
PRODUCT_COPY_FILES += vendor/rockchip/common/phone/etc/apns-full-conf.xml:system/etc/apns-conf.xml
PRODUCT_COPY_FILES += vendor/rockchip/common/phone/etc/spn-conf.xml:system/etc/spn-conf.xml
PRODUCT_PROPERTY_OVERRIDES += \
    ro.product.ota.host = 192.168.1.1:8888 \
    ro.vendor.sdkversion = $(CURRENT_SDK_VERSION) \
    vendor.gralloc.disable_afbc = 0

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/public.libraries.txt:vendor/etc/public.libraries.txt

#
# add Rockchip properties here
#
PRODUCT_PROPERTY_OVERRIDES += \
                ro.ril.ecclist=112,911 \
                ro.opengles.version=196610 \
                wifi.interface=wlan0 \
                ro.telephony.default_network=9 \
                rild.libpath=/vendor/lib64/libreference-ril-sim7600gh.so \
                rild.libargs=-d /dev/ttyUSB2 \
                ro.audio.monitorOrientation=true \
                debug.nfc.fw_download=false \
                debug.nfc.se=false \
                vendor.hwc.compose_policy=1 \
                sys.wallpaper.rgb565=0 \
                sf.power.control=2073600 \
                sys.rkadb.root=0 \
                ro.sf.fakerotation=false \
                ro.tether.denied=false \
                sys.resolution.changed=false \
                ro.default.size=100 \
                ro.product.usbfactory=rockchip_usb \
                wifi.supplicant_scan_interval=15 \
                ro.factory.tool=0 \
                ro.kernel.android.checkjni=0 \
                ro.build.shutdown_timeout=6 \
                persist.enable_task_snapshots=false \
                ro.vendor.frameratelock=true

# boblight
$(call inherit-product-if-exists, $(LOCAL_PATH)/boblight.mk)


PRODUCT_PACKAGES += \
    Telecom \
    TelephonyProvider \
    telephony-common  \
    TeleService \
    messaging \
    Dialer  \
    CarrierDefaultApp \
    CarrierConfig \
    rild \
    librk-ril \
    dhcpcd

PRODUCT_COPY_FILES += vendor/rockchip/common/phone/etc/apns-full-conf.xml:vendor/etc/apns-conf.xml

PRODUCT_PACKAGES += \
    android.hardware.radio@1.4 \
    android.hardware.radio@1.4.vendor \
    android.hardware.radio@1.4-impl \
    android.hardware.radio@1.4-service \
    android.hardware.radio@1.4-service-compat \
    libradiocompat \
    android.hardware.radio@1.0.vendor \
    android.hardware.radio@1.1.vendor \
    android.hardware.radio@1.2.vendor \
    android.hardware.radio@1.3.vendor \
    android.hardware.radio.deprecated@1.0 \
    android.hardware.radio.deprecated@1.0.vendor \
    android.hardware.radio.config@1.0-service


PRODUCT_PACKAGES += \
    libhidltransport.vendor \
    libhidlbase.vendor \
    libhwbinder.vendor

PRODUCT_PROPERTY_OVERRIDES += \
    ro.boot.noril=false \
    ro.telephony.default_network=9 \
    ro.control_privapp_permissions=log

DEVICE_MANIFEST_FILE += device/hardkernel/common/4g_modem/manifest.xml

PRODUCT_PROPERTY_OVERRIDES += \
    vendor.rild.libpath=/vendor/lib64/libreference-ril-sim7600gh.so

PRODUCT_COPY_FILES += \
    device/hardkernel/common/4g_modem/bin64/dhcpcd:vendor/bin/dhcpcd \
    device/hardkernel/common/4g_modem/lib64/libril.so:vendor/lib64/libril.so \
    device/hardkernel/common/4g_modem/lib64/librk-ril.so:vendor/lib64/librk-ril.so \
    device/hardkernel/common/4g_modem/lib64/libreference-ril-sim7600gh.so:vendor/lib64/libreference-ril-sim7600gh.so \
    device/hardkernel/common/permissions/com.tepari.macrostock.macrostock_starter.xml:system_ext/etc/permissions/com.tepari.macrostock.macrostock_starter.xml \
    device/hardkernel/common/default_permissions/macrostock_starter_default_permissions.xml:system_ext/etc/default-permissions/macrostock_starter_default_permissions.xml \
    device/tepari/common/sysconfig/update-ownership.xml:system_ext/etc/sysconfig/update-ownership.xml \
    device/tepari/common/bin/macrostock_wifi_approve.sh:system_ext/bin/macrostock_wifi_approve.sh \
    device/tepari/common/init/macrostock_wifi_approve.rc:system_ext/etc/init/macrostock_wifi_approve.rc



PRODUCT_COPY_FILES += \
    device/hardkernel/rk356x/kernelSU/ksu_preload.rc:system/etc/init/ksu_preload.rc \
    device/hardkernel/rk356x/kernelSU/ksu_preload.sh:system/etc/ksu_preload.sh \
    device/hardkernel/rk356x/kernelSU/ksu_allowlist.bin:system/etc/ksu_allowlist.bin

# PRODUCT_COPY_FILES += \
#     device/hardkernel/common/logcat-persist/prune_logs.sh:/system/etc/prune_logs.sh \
#     device/hardkernel/common/logcat-persist/prune_loop.sh:/system/etc/prune_loop.sh


PRODUCT_PACKAGES += \
    Macrostock \
    MacrostockStarter

PRODUCT_VENDOR_PROPERTIES += \
    wifi.module.path=/vendor/lib/modules/8821cu.ko \
    wifi.driver.module_path=/vendor/lib/modules/8821cu.ko \
    wifi.driver.module_name=8821cu \
    vendor.wifi.driver.module_path=/vendor/lib/modules/8821cu.ko