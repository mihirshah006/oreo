#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Inherit from msm8916-common
$(call inherit-product, device/motorola/msm8916-common/msm8916.mk)

# Screen density
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_platform_info.xml:system/etc/audio_platform_info.xml \
    $(LOCAL_PATH)/audio/mixer_paths.xml:system/etc/mixer_paths.xml

# Camera
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media_codecs_performance.xml:system/etc/media_codecs_performance.xml \
    $(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml

# Overlay
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Ramdisk
PRODUCT_PACKAGES += \
    init.qcom.bt.sh

PRODUCT_PACKAGES += \
    init.qcom.rc \
    init.qcom.power.rc \
    init.qcom.usb.rc \
    init.recovery.qcom.rc \
    ueventd.qcom.rc

# Init scripts
PRODUCT_PACKAGES += \
    fstab.qcom \
    init.target.rc \
    init.target.power.rc \
    init.qcom.usb.rc \
    init.qcom.mem.sh

# Sensor HAL
PRODUCT_PACKAGES += \
    android.hardware.sensors@1.0-impl \
    calmodule.cfg \
    libcalmodule_common \
    sensors.msm8916

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

# use 3 threads max for dex2oat
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sys.fw.dex2oat_thread_count=3

# relax sensor fusion mag field filter
PRODUCT_PROPERTY_OVERRIDES += \
    ro.fusion.magfield.max=250

# Camera
PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.4-impl \
    camera.device@3.2-impl \
    camera.msm8916 \
    Snap \
    libmm-qcamera \
    libshim_camera

PRODUCT_PROPERTY_OVERRIDES += \
    media.stagefright.legacyencoder=true \
    media.stagefright.less-secure=true

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml

# Disable the thumbnail encoding in order to reduce the power
PRODUCT_PROPERTY_OVERRIDES += \
    persist.camera.tn.disable=1

# System property for PIP support
PRODUCT_PROPERTY_OVERRIDES += \
    persist.camera.pip.support=0

# Disable all camera debug
PRODUCT_PROPERTY_OVERRIDES += \
    persist.camera.hal.debug.mask=0

# Recovery
PRODUCT_PACKAGES += \
    librecovery_updater_cm

# CNE and DPM symbol
PRODUCT_PACKAGES += \
    libshim_parcel

PRODUCT_PROPERTY_OVERRIDES += \
    persist.data.target=dpm1 \
    persist.data.qmi.adb_logmask=0

# Telephony-ext
PRODUCT_PACKAGES += telephony-ext ims-ext-common
PRODUCT_BOOT_JARS += telephony-ext

# RIL
PRODUCT_PACKAGES += \
    librmnetctl \
    libxml2

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/spn-conf.xml:system/etc/spn-conf.xml

# Properties
PRODUCT_PROPERTY_OVERRIDES += \
    persist.radio.multisim.config=dsds \
    persist.radio.custom_ecc=1 \
    persist.radio.ecc_hard_1=112,911,110,122,119,120,000,118 \
    persist.radio.ecc_hard_count=1 \
    rild.libpath=/system/vendor/lib/libril-qc-qmi-1.so \
    ril.subscription.types=RUIM \
    persist.radio.rat_on=combine \
    ro.ril.multi_rat_capable=true

# Wifi
PRODUCT_PACKAGES += \
    libqsap_sdk \
    libQWiFiSoftApCfg \
    libwpa_client \
    wificond \
    wifilogd \
    wpa_supplicant \
    wpa_supplicant.conf \
    libwcnss_qmi \
    wcnss_service \
    libwpa_client

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi/WCNSS_qcom_cfg.ini:system/vendor/etc/wifi/WCNSS_qcom_cfg.ini \
    $(LOCAL_PATH)/wifi/WCNSS_cfg.dat:system/etc/firmware/wlan/prima/WCNSS_cfg.dat \
    $(LOCAL_PATH)/wifi/WCNSS_qcom_wlan_nv.bin:system/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin \
    $(LOCAL_PATH)/wifi/WCNSS_wlan_dictionary.dat:system/etc/firmware/wlan/prima/WCNSS_wlan_dictionary.dat

# WiFi Display
ifneq ($(QCPATH),)
PRODUCT_BOOT_JARS += WfdCommon
endif

PRODUCT_PROPERTY_OVERRIDES += \
    persist.debug.wfd.enable=1
    persist.sys.wfd.virtual=0

# Thermal
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/thermal-engine.conf:system/etc/thermal-engine.conf

# IMS
PRODUCT_PACKAGES += \
    ims \
    imscmlibrary \
    imssettings \
    init.qti.ims.sh

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/ims/imscm.xml:system/etc/permissions/imscm.xml \
    $(LOCAL_PATH)/configs/ims/ims.xml:system/etc/permissions/ims.xml \
    $(LOCAL_PATH)/configs/ims/qti_permissions.xml:system/etc/permissions/qti_permissions.xml

# For android_filesystem_config.h
PRODUCT_PACKAGES += \
    fs_config_files

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.0-impl \

# USB HAL
PRODUCT_PACKAGES += \
    android.hardware.usb@1.0-service

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.usb.vid=2717 \
    ro.usb.id.midi=90BA \
    ro.usb.id.midi_adb=90BB \
    ro.usb.id.mtp=ff60 \
    ro.usb.id.mtp_adb=ff68 \
    ro.usb.id.ptp=ff10 \
    ro.usb.id.ptp_adb=ff18 \
    ro.usb.id.ums=ff20 \
    ro.usb.id.ums_adb=ff28

# Keymaster HAL
PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0-impl

# USB debugging at boot
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp,adb \
    ro.adb.secure=0 \
    ro.secure=0 \
    ro.debuggable=1

# Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator@1.0-impl

# WiFi HAL
PRODUCT_PACKAGES += \
    android.hardware.wifi@1.0-service

# Bluetooth
PRODUCT_PACKAGES += \
    libbt-vendor \
    android.hardware.bluetooth@1.0-impl

# Properties
PRODUCT_PROPERTY_OVERRIDES += \
    qcom.bluetooth.soc=smd \
    ro.bluetooth.dun=true \
    ro.bluetooth.hfp.ver=1.7 \
    ro.bluetooth.sap=true \
    ro.qualcomm.bt.hci_transport=smd

# HIDL
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/manifest.xml:system/vendor/manifest.xml
