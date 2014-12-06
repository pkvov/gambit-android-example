# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
LOCAL_PATH := $(call my-dir)

#include gambc as prebuild lib
include $(CLEAR_VARS)

LOCAL_MODULE := gambc-prebuild
LOCAL_SRC_FILES := ./depends/libgambc.a
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/depends
include $(PREBUILT_STATIC_LIBRARY)

#build ndk lib
include $(CLEAR_VARS)
LOCAL_MODULE    := gambit
LOCAL_C_INCLUDES := $(LOCAL_PATH) \
	            $(LOCAL_PATH)/depends
LOCAL_SRC_FILES := test-jni.c fib.c fib_.c
LOCAL_LDLIBS := -ldl -fno-short-enums
LOCAL_STATIC_LIBRARIES := gambc-prebuild
# LOCAL_CFLAGS := -I./depends -fno-short-enums
# LOCAL_LDLIBS := -ldl -fno-short-enums -lc -L./depends -lgambc

include $(BUILD_SHARED_LIBRARY)
