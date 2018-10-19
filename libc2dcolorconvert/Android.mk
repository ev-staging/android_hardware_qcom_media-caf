LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

ifeq ($(TARGET_USES_ALIGNED_YCBCR420P),true)
LOCAL_CFLAGS += -DUSE_ALIGNED_YCBCR420P
endif

LOCAL_SRC_FILES := \
        C2DColorConverter.cpp

# Allow implicit fallthrough in C2DColorConverter.cpp:554 until it is fixed.
LOCAL_CFLAGS += -Wno-error=implicit-fallthrough

LOCAL_C_INCLUDES := \
    $(TARGET_OUT_HEADERS)/qcom/display

LOCAL_C_INCLUDES += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/include

LOCAL_SHARED_LIBRARIES := liblog libdl

LOCAL_MODULE_TAGS := optional

LOCAL_MODULE := libc2dcolorconvert

LOCAL_VENDOR_MODULE := true

LOCAL_ADDITIONAL_DEPENDENCIES := $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr

include $(BUILD_SHARED_LIBRARY)
