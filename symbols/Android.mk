LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

include $(CLEAR_VARS)
LOCAL_SRC_FILES :=  \
	mtk_ui.cpp
LOCAL_SHARED_LIBRARIES := \
	libui \
	libgui
LOCAL_MODULE := libmtk_ui
LOCAL_C_INCLUDES += \
	frameworks/native/include \
	frameworks/av/media/libstagefright/include
LOCAL_MODULE_TAGS := optional
LOCAL_PROPRIETARY_MODULE := true
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_SRC_FILES :=  \
	mtkaudio.cpp
LOCAL_SHARED_LIBRARIES := libmedia
LOCAL_MODULE := libmtk_audio
LOCAL_MODULE_TAGS := optional
LOCAL_PROPRIETARY_MODULE := true
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_SRC_FILES :=  \
	mtk_xlog.cpp
LOCAL_SHARED_LIBRARIES := \
	liblog
LOCAL_C_INCLUDES += \	
	system/core/include/
LOCAL_MODULE := libmtk_xlog
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_PROPRIETARY_MODULE := true
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_SRC_FILES :=  \
	mtk_cam.cpp
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE := libmtk_cam
LOCAL_MODULE_TAGS := optional
LOCAL_PROPRIETARY_MODULE := true
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_SRC_FILES :=  \
	MediatekHacks.cpp
LOCAL_SHARED_LIBRARIES := libbinder
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE := libmtk_hacks
LOCAL_MODULE_TAGS := optional
LOCAL_PROPRIETARY_MODULE := true
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_SRC_FILES :=  \
	mtk_gui.cpp
LOCAL_SHARED_LIBRARIES := \
	libgui \
	libmedia
LOCAL_MODULE := libmtk_gui
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_PROPRIETARY_MODULE := true
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_SRC_FILES :=  \
	mtk_omx.cpp
LOCAL_SHARED_LIBRARIES := \
	libstagefright_foundation \
	libmedia
LOCAL_MODULE := libmtk_omx
LOCAL_C_INCLUDES += \
	frameworks/av/media/mtp/
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_PROPRIETARY_MODULE := true
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_SRC_FILES :=  \
	icu55.c
LOCAL_SHARED_LIBRARIES := \
	libicuuc \
	libicui18n
LOCAL_MODULE := libmtk_icu
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_PROPRIETARY_MODULE := true
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_SRC_FILES :=  \
	crypto.c
LOCAL_SHARED_LIBRARIES := \
	libcrypto
LOCAL_C_INCLUDES += \	
	frameworks/rs/server/
LOCAL_MODULE := libmtk_crypto
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_PROPRIETARY_MODULE := true
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_SRC_FILES :=  \
	ssl.c
LOCAL_SHARED_LIBRARIES := \
	libssl
LOCAL_C_INCLUDES += \	
	frameworks/rs/server/
LOCAL_MODULE := libmtk_ssl
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_PROPRIETARY_MODULE := true
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_SRC_FILES_32 :=  \
	mtk_string.cpp
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE := libmtk_string
LOCAL_MODULE_TAGS := optional
LOCAL_PROPRIETARY_MODULE := true
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_SRC_FILES_32 :=  \
	mtk_wvm32.cpp
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE := libmtk_wvm32
LOCAL_MODULE_TAGS := optional
LOCAL_PROPRIETARY_MODULE := true
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_SRC_FILES_64 :=  \
	mtk_wvm64.cpp
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE := libmtk_wvm64
LOCAL_MODULE_TAGS := optional
LOCAL_PROPRIETARY_MODULE := true
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_SRC_FILES_64 :=  \
	mtk_parcel.cpp
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE := libmtk_parcel
LOCAL_MODULE_TAGS := optional
LOCAL_PROPRIETARY_MODULE := true
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_SRC_FILES :=  \
	mtk_sensor.c
LOCAL_SHARED_LIBRARIES := \
	libsensor \
	libcam.utils.sensorlistener
LOCAL_MODULE := libmtk_sensor
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_PROPRIETARY_MODULE := true
include $(BUILD_SHARED_LIBRARY)

LOCAL_CLANG := true
LOCAL_CPPFLAGS := -std=c++1y
# LOCAL_SANITIZE := integer
LOCAL_CPPFLAGS += -Wno-exit-time-destructors
LOCAL_CPPFLAGS += -Wno-global-constructors
LOCAL_CPPFLAGS += -Wno-c++98-compat-pedantic
LOCAL_CPPFLAGS += -Wno-four-char-constants
LOCAL_CPPFLAGS += -Wno-padded

include $(BUILD_SHARED_LIBRARY)
