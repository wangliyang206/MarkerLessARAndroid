#通过$(call 宏名)调用my-dir函数宏，将mk文件所在路径赋给LOCAL_PATH变量。
LOCAL_PATH := $(call my-dir)
#清除除了LOCAL_PATH外的所有LOCAL开头变量值，CLEAR_VARS是一个预定义变量，指向一个makefile文件。
include $(CLEAR_VARS)
MAIN_DIR:=$(LOCAL_PATH)
OPENCV_LIB_TYPE:=STATIC
ifeq ("$(wildcard $(OPENCV_MK_PATH))","")  
# try to load OpenCV.mk from default install location
include D:/OpenCV/OpenCV-2.4.9-android-sdk/sdk/native/jni/OpenCV.mk
else  
include $(OPENCV_MK_PATH)  
endif 
LOCAL_PATH:=$(MAIN_DIR)
# 本地库名字
LOCAL_MODULE:=OpenCV
# 编译动态so库
include $(BUILD_SHARED_LIBRARY)



include $(CLEAR_VARS)
OpenCV_CAMERA_MODULES:=on
OpenCV_INSTALL_MODULES:=off
OpenCV_LIB_TYPE:=STATIC

include D:/OpenCV/OpenCV-2.4.9-android-sdk/sdk/native/jni/OpenCV.mk

# 本地库名字
LOCAL_MODULE    := MarkerLessARAndroid
# 需要的头文件(编译标志)
LOCAL_C_INCLUDES += $(LOCAL_PATH)
# c源文件
LOCAL_SRC_FILES := $(LOCAL_PATH)/ARMarkerLessAndroid.cpp
# 依赖.so动态库
LOCAL_SHARED_LIBRARIES+=OpenCV
#需要的系统库
LOCAL_LDLIBS += -llog -ldl -DNDEBUG
LOCAL_LDFLAGS += -pthread -fopenmp 
#编译器配置
LOCAL_CFLAGS += -DNDEBUG -O1 -O2 -O3 -Os -Ofast -ffunction-sections -fdata-sections -mfloat-abi=softfp -mfpu=neon
LOCAL_CPPFLAGS := -std=c++11 -pthread -frtti -fexceptions -DNDEBUG -O1 -O2 -O3 -Os -Ofast -ffunction-sections -fdata-sections -mfloat-abi=softfp -mfpu=neon -fopenmp
LOCAL_ARM_NEON := true
LOCAL_ARM_MODE := arm
#LOCAL_SHORT_COMMANDS := true
#定义.so输出路径
#LOCAL_MODULE_PATH := $(LOCAL_PATH)/$(TARGET_ARCH_ABI)
# 指定要生成so库(编译动态so库)
include $(BUILD_SHARED_LIBRARY)
