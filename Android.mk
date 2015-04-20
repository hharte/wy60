LOCAL_PATH:= $(call my-dir)
# prebuilt libncurses
include $(CLEAR_VARS)

LOCAL_MODULE := ncurses
LOCAL_SRC_FILES := ../../android-libncurses/libs/$(TARGET_ARCH_ABI)/libncurses.so
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/../include/

include $(PREBUILT_SHARED_LIBRARY)

#========================== wy60 ====================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
	wy60.c

LOCAL_C_INCLUDES := \
	$(LOCAL_PATH)/. \
	bionic/libc/private \
	libc/kernel/common \
	../android-libncurses/jni/include

LOCAL_CFLAGS := \
	-std=gnu99 \
	-Werror=implicit

LOCAL_MODULE := wy60
LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)
LOCAL_MODULE_TAGS := eng
LOCAL_STATIC_LIBRARIES += libncurses libc
LOCAL_FORCE_STATIC_EXECUTABLE := true

CONFIG_DIR := /data/local
VERSION := 2.43-android
LOCAL_CFLAGS += -DCONFIG_DIR="\"$(CONFIG_DIR)\"" $(CURSES_DEF) \
        -DVERSION="\"$(VERSION)\""

include $(BUILD_EXECUTABLE)
