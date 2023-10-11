#声明C++ 标准库。c++_static是libc++标准库的静态库，c++_shared是libc++标准库的动态库，当要编译动态库时用c++_shared，编译静态库时用c++_static。
APP_STL := gnustl_static
APP_CPPFLAGS := -frtti -fexceptions -mfloat-abi=softfp -mfpu=neon -std=gnu++0x -Wno-deprecated \
-ftree-vectorize -ffast-math -fsingle-precision-constant --std=c++11
#指定为clang编译器(默认值之前为4.9)
NDK_TOOLCHAIN_VERSION := 4.9
APP_CFLAGS := --std=c++11
#指定API平台，可选值有：armeabi-v7a、arm64-v8a、x86、x86_64、all，若指定多个平台，用空格分开
APP_ABI :=armeabi-v7a
#编译调试版本还是发布版本，发布版本会优化且信息少。可选值release 或 debug
APP_OPTIM := release
#APP_SHORT_COMMANDS := true
#声明库支持的最低API级别，对应于android的minSdkVersion
APP_PLATFORM := android-19

