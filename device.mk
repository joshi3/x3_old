
# Dalvik heap configurations
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-3072-dalvik-heap.mk)

# Call hwui memory config
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-3072-hwui-memory.mk)

# Vendor
$(call inherit-product, vendor/leeco/x3/x3-vendor-blobs.mk)

# Folder path
DEVICE_PATH := device/leeco/x3

# Overlay Folder
DEVICE_PACKAGE_OVERLAYS += $(DEVICE_PATH)/overlay

# Screen density
PRODUCT_AAPT_CONFIG := normal xxhdpi
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Recovery allowed devices
TARGET_OTA_ASSERT_DEVICE := x3,X500,X507,X509,X3,x500,x507,x509,X502,x502

# Power
PRODUCT_PACKAGES += \
	power.default \
	power.mt6795

# Camera
PRODUCT_PACKAGES += \
	Snap \
	libcamera_parameters_ext

# Charger
PRODUCT_PACKAGES += \
	charger \
	charger_res_images

# Torch
PRODUCT_PACKAGES += \
	Torch
     
# Other
PRODUCT_PACKAGES += \
	librs_jni \
	libnl_2 \
	com.android.future.usb.accessory

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	ro.allow.mock.location=0 \
	ro.debuggable=1 \
	ro.zygote=zygote64_32 \
	ro.dalvik.vm.native.bridge=0 \
	persist.sys.usb.config=,adb \
	persist.debug.xlog.enable=0 \
	camera.disable_zsl_mode=1 \
	ro.adb.secure=0 \
	persist.service.acm.enable=0 \
	ro.allow.mock.location=0 \
    ro.config.low_ram=false \
	ro.mount.fs=EXT4
	
# build.prop
PRODUCT_PROPERTY_OVERRIDES += \
    persist.media.treble_omx=false \
    persist.service.adb.enable=1 \
    persist.service.debuggable=1 \
    persist.sys.root_access=0

# extra log controls prop
PRODUCT_PROPERTY_OVERRIDES += \
    ro.disable.xlog=0

#ifeq (lineage_x3,$(TARGET_PRODUCT))	#this is included only in lineage atm as some other roms have issue with this
#PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
#	dalvik.vm.dex2oat-Xms=64m \
#	dalvik.vm.dex2oat-Xmx=64m \
#	dalvik.vm.image-dex2oat-Xms=64m \
#	dalvik.vm.image-dex2oat-Xmx=512m
#endif

# PRODUCT_PROPERTY_OVERRIDES
PRODUCT_PROPERTY_OVERRIDES += \
	ro.kernel.android.checkjni=0 \
	ro.telephony.ril.config=fakeiccid \
	persist.call_recording.enabled=true \
	persist.call_recording.src=1

# Audio
PRODUCT_PACKAGES += \
	audio.a2dp.default \
	audio.usb.default \
	audio.r_submix.default \
	audio_policy.default \
	libaudio-resampler \
	libaudiopolicymanagerdefault \
	libtinyalsa \
	libtinycompress \
	libtinyxml \
	audio_policy.stub \
	libtinymix \
	libfs_mgr

# Wifi
PRODUCT_PACKAGES += \
	libwpa_client \
	hostapd \
	wpa_supplicant \
	wpa_supplicant.conf \
	libwifi-hal-mt66xx \
	wifilogd \
	dhcpcd.conf \
	wificond

# Media
PRODUCT_COPY_FILES += \
	frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:system/etc/media_codecs_google_video_le.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml

# Filesystem management tools
PRODUCT_PACKAGES += \
	e2fsck \
	fibmap.f2fs \
	fsck.f2fs \
	mkfs.f2fs \
	make_ext4fs \
	resize2fs \
	setup_fs \
	ext4_resize \
	libext2_blkid \
	libext2_uuid_static \
	superumount

# exFAT
PRODUCT_PACKAGES += \
	mount.exfat \
	fsck.exfat \
	mkfs.exfat

# NTFS
PRODUCT_PACKAGES += \
	fsck.ntfs \
	mkfs.ntfs \
	mount.ntfs

PRODUCT_TAGS += dalvik.gc.type-precise
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/ramdisk/fstab.mt6795:root/fstab.mt6795 \
	$(DEVICE_PATH)/ramdisk/init.modem.rc:root/init.modem.rc \
	$(DEVICE_PATH)/ramdisk/init.mt6795.rc:root/init.mt6795.rc \
	$(DEVICE_PATH)/ramdisk/init.mt6795.usb.rc:root/init.mt6795.usb.rc \
	$(DEVICE_PATH)/ramdisk/ueventd.mt6795.rc:root/ueventd.mt6795.rc
	
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.compass.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml \
	frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
	frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
	frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
	frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/native/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml \
	frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
	frameworks/native/data/etc/android.hardware.camera.manual_sensor.xml:system/etc/permissions/android.hardware.camera.manual_sensor.xml \
	frameworks/native/data/etc/android.hardware.wifi.passpoint.xml:system/etc/permissions/android.hardware.wifi.passpoint.xml

PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/configs/media/media_codecs.xml:system/etc/media_codecs.xml \
	$(DEVICE_PATH)/configs/media/media_codecs.xml:system/etc/permissions/media_codecs.xml \
	$(DEVICE_PATH)/configs/media/media_codecs_ffmpeg.xml:system/etc/media_codecs_ffmpeg.xml \
	$(DEVICE_PATH)/configs/media/media_codecs_mediatek_audio.xml:system/etc/media_codecs_mediatek_audio.xml\
	$(DEVICE_PATH)/configs/media/media_codecs_mediatek_video.xml:system/etc/media_codecs_mediatek_video.xml \
	$(DEVICE_PATH)/configs/media/media_codecs_performance.xml:system/etc/media_codecs_performance.xml \
	$(DEVICE_PATH)/configs/media/media_profiles.xml:system/etc/media_profiles.xml \
	$(DEVICE_PATH)/configs/mtk_clear_motion.cfg:system/etc/mtk_clear_motion.cfg

PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/configs/audio/audio_device.xml:system/etc/audio_device.xml \
	$(DEVICE_PATH)/configs/audio/audio_effects.conf:system/etc/audio_effects.conf \
	$(DEVICE_PATH)/configs/audio/audio_em.xml:system/etc/audio_em.xml \
	$(DEVICE_PATH)/configs/audio/audio_policy.conf:system/etc/audio_policy.conf

PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/configs/permissions/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
	$(DEVICE_PATH)/configs/permissions/android.hardware.microphone.xml:system/etc/permissions/android.hardware.microphone.xml \
	$(DEVICE_PATH)/configs/permissions/com.android.location.provider.xml:system/etc/permissions/com.android.location.provider.xml \
	$(DEVICE_PATH)/configs/permissions/com.android.media.remotedisplay.xml:system/etc/permissions/com.android.media.remotedisplay.xml \
	$(DEVICE_PATH)/configs/permissions/com.android.mediadrm.signer.xml:system/etc/permissions/com.android.mediadrm.signer.xml \
	$(DEVICE_PATH)/configs/permissions/android.hardware.camera.manual_postprocessing.xml:system/etc/permissions/android.hardware.camera.manual_postprocessing.xml \
	$(DEVICE_PATH)/configs/permissions/android.hardware.camera.raw.xml:system/etc/permissions/android.hardware.camera.raw.xml

PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/hal/wifi/wifi/p2p_supplicant_overlay.conf:system/vendor/etc/wifi/p2p_supplicant_overlay.conf \
	$(DEVICE_PATH)/hal/wifi/wifi/wpa_supplicant.conf:system/vendor/etc/wifi/wpa_supplicant.conf \
	$(DEVICE_PATH)/hal/wifi/wifi/wpa_supplicant_overlay.conf:system/vendor/etc/wifi/wpa_supplicant_overlay.conf

PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/configs/bluetooth/auto_pair_blacklist.conf:system/etc/bluetooth/auto_pair_blacklist.conf \
	$(DEVICE_PATH)/configs/bluetooth/auto_pair_devlist.conf:system/etc/bluetooth/auto_pair_devlist.conf \
	$(DEVICE_PATH)/configs/bluetooth/btconfig.xml:system/etc/bluetooth/btconfig.xml \
	$(DEVICE_PATH)/configs/bluetooth/bt_did.conf:system/etc/bluetooth/bt_did.conf \
	$(DEVICE_PATH)/configs/bluetooth/bt_stack.conf:system/etc/bluetooth/bt_stack.conf \
	$(DEVICE_PATH)/configs/bluetooth/bt_stack.conf.debug:system/etc/bluetooth/bt_stack.conf.debug \
	$(DEVICE_PATH)/configs/bluetooth/bt_stack.conf.sqc:system/etc/bluetooth/bt_stack.conf.sqc

PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/configs/keylayout/mtk-kpd.kl:system/usr/keylayout/mtk-kpd.kl \
	$(DEVICE_PATH)/configs/keylayout/ACCDET.kl:system/usr/keylayout/ACCDET.kl\
	$(DEVICE_PATH)/configs/keylayout/mtk-tpd.kl:system/usr/keylayout/mtk-tpd.kl\
	$(DEVICE_PATH)/configs/keylayout/synaptics_dsx_i2c.kl:system/usr/keylayout/synaptics_dsx_i2c.kl

PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/configs/ril_conf/ecc_list.xml:system/etc/ecc_list.xml \
	$(DEVICE_PATH)/configs/ril_conf/spn-conf.xml:system/etc/spn-conf.xml

PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/hal/wifi/dhcpcd/dhcpcd-run-hooks:system/etc/dhcpcd/dhcpcd-run-hooks \
	$(DEVICE_PATH)/hal/wifi/dhcpcd/dhcpcd-hooks/20-dns.conf:system/etc/dhcpcd/dhcpcd-hooks/20-dns.conf \
	$(DEVICE_PATH)/hal/wifi/dhcpcd/dhcpcd-hooks/95-configured:system/etc/dhcpcd/dhcpcd-hooks/95-configured \
	$(DEVICE_PATH)/hal/wifi/wide-dhcpv6/dhcp6c.conf:system/etc/wide-dhcpv6/dhcp6c.conf \
	$(DEVICE_PATH)/hal/wifi/wide-dhcpv6/dhcp6c.script:system/etc/wide-dhcpv6/dhcp6c.script \
	$(DEVICE_PATH)/hal/wifi/wide-dhcpv6/dhcp6cctlkey:system/etc/wide-dhcpv6/dhcp6cctlkey \
	$(DEVICE_PATH)/hal/wifi/wide-dhcpv6/dhcp6cDNS.conf:system/etc/wide-dhcpv6/dhcp6cDNS.conf \
	$(DEVICE_PATH)/hal/wifi/wide-dhcpv6/dhcp6s.conf:system/etc/wide-dhcpv6/dhcp6s.conf

PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/configs/radvd/radvd.conf:system/etc/radvd/radvd.conf

PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/configs/slp_conf:system/etc/slp_conf \
	$(DEVICE_PATH)/configs/clatd.conf:system/etc/clatd.conf \
	$(DEVICE_PATH)/configs/custom.conf:system/etc/custom.conf \
	$(DEVICE_PATH)/configs/mtklog-config.prop:system/etc/mtklog-config.prop \
	$(DEVICE_PATH)/configs/mtk_omx_core.cfg:system/etc/mtk_omx_core.cfg \
	$(DEVICE_PATH)/configs/perfservboosttbl.txt:system/etc/perfservboosttbl.txt \
	$(DEVICE_PATH)/configs/perfservscntbl.txt:system/etc/perfservscntbl.txt

PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/configs/agps_profiles_conf2.xml:system/etc/agps_profiles_conf2.xml

PRODUCT_PACKAGES += \
        fingerprint.default
 
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.fingerprint.xml:system/etc/permissions/android.hardware.fingerprint.xml


PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/configs/hostapd/hostapd_default.conf:system/etc/hostapd/hostapd_default.conf \
	$(DEVICE_PATH)/configs/hostapd/hostapd.accept:system/etc/hostapd/hostapd.accept \
	$(DEVICE_PATH)/configs/hostapd/hostapd.deny:system/etc/hostapd/hostapd.deny


# MTK Helpers
PRODUCT_PACKAGES += \
	libccci_util

# Sensor Calibration
PRODUCT_PACKAGES += libem_sensor_jni

# Configure jemalloc for low memory
MALLOC_SVELTE := true

# Radio dependencies
PRODUCT_PACKAGES += \
	muxreport \
	terservice

# Display
PRODUCT_PACKAGES += \
	libion

# GPS
PRODUCT_PACKAGES += \
	gps.mt6795 \
	libcurl

# Mediaserver with system group
PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/etc/init/mediaserver.rc:system/etc/init/mediaserver.rc \
	$(DEVICE_PATH)/etc/init/cameraserver.rc:system/etc/init/cameraserver.rc \
	$(DEVICE_PATH)/etc/init/drmserver.rc:system/etc/init/drmserver.rc \
	$(DEVICE_PATH)/etc/init/mediacodec.rc:system/etc/init/mediacodec.rc \
	$(DEVICE_PATH)/etc/init/mediadrmserver.rc:system/etc/init/mediadrmserver.rc

PRODUCT_PACKAGES += \
	libbwc \
	libm4u

# Engineering mode
#PRODUCT_PACKAGES += \
#	EngineerMode

# Seccomp policy
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/seccomp/mediacodec.policy:system/vendor/etc/seccomp_policy/mediacodec.policy
    $(DEVICE_PATH)/seccomp/mediaextractor.policy:system/vendor/etc/seccomp_policy/mediaextractor.policy

#HIDl
PRODUCT_PACKAGES += \
    android.hardware.power@1.0-impl \
    android.hardware.wifi@1.0-service \
    android.hardware.audio@2.0-impl \
    android.hardware.audio@2.0-service \
    android.hardware.audio.effect@2.0-impl \
    android.hardware.broadcastradio@1.0-impl \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.allocator@2.0-service \
    android.hardware.graphics.composer@2.1-impl \
    android.hardware.graphics.mapper@2.0-impl \
    android.hardware.renderscript@1.0-impl \
    android.hardware.memtrack@1.0-imp \
    android.hardware.memtrack@1.0-impl \
    android.hardware.memtrack@1.0-service \
    camera.device@1.0-impl \
    camera.device@3.2-impl \
    android.hardware.camera.provider@2.4-impl \
    android.hardware.camera.provider@2.4-service \
    android.hardware.bluetooth@1.0-service.mtk \
    android.hardware.gnss@1.0-impl \
    android.hardware.usb@1.0-service \
    android.hardware.keymaster@3.0-impl \
    android.hardware.gatekeeper@1.0-impl \
    android.hardware.vibrator@1.0-impl \
    android.hardware.vibrator@1.0-service \
    android.hardware.light@2.0-impl \
    android.hardware.light@2.0-service \
    android.hardware.sensors@1.0-impl \
    android.hardware.sensors@1.0-service \
    android.hardware.drm@1.0-impl \
    android.hardware.drm@1.0-service \
    android.hardware.health@1.0-impl \
    android.hardware.health@1.0-service \
#    android.hardware.keymaster@3.0-service \
#    android.hardware.media.omx@1.0 \
#    android.hardware.biometrics.fingerprint@2.1-service
#    android.hardware.gatekeeper@1.0-service \
#    android.hardware.soundtrigger@2.0-impl \

#Manifest
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/manifest.xml:system/vendor/manifest.xml

PRODUCT_PACKAGES += \
    android.hardware.renderscript@1.0-impl \
	android.hardware.media.omx \
	android.hardware.usb@1.0-service

# OMX
PRODUCT_PACKAGES += \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxCore \
    libOmxVdec \
    libOmxVenc \
    libstagefrighthw