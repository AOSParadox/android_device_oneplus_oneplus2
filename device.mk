#
# Copyright (C) 2016 The AOSParadox Project
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

# Call the proprietary setup
$(call inherit-product-if-exists, vendor/oneplus/oneplus2/oneplus2-vendor.mk)


# Ramdisk
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,device/oneplus/oneplus2/ramdisk,root)

# Prebuilt
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,device/oneplus/oneplus2/prebuilt/system,system)

# Dalvik/HWUI
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapstartsize=8m \
    dalvik.vm.heapgrowthlimit=256m \
    dalvik.vm.heapsize=512m \
    dalvik.vm.heaptargetutilization=0.75 \
    dalvik.vm.heapminfree=512k \
    dalvik.vm.heapmaxfree=8m

PRODUCT_PROPERTY_OVERRIDES += \
    ro.hwui.texture_cache_size=96 \
    ro.hwui.layer_cache_size=64 \
    ro.hwui.path_cache_size=39 \
    ro.hwui.gradient_cache_size=1 \
    ro.hwui.drop_shadow_cache_size=7 \
    ro.hwui.r_buffer_cache_size=12 \
    ro.hwui.text_small_cache_width=2048 \
    ro.hwui.text_small_cache_height=2048 \
    ro.hwui.text_large_cache_width=3072 \
    ro.hwui.text_large_cache_height=4096

# Bootanimation
PRODUCT_COPY_FILES += \
    vendor/aosparadox/bootanimation/1080p_PNG_bootanimation.zip:system/media/bootanimation.zip

# Overlays
DEVICE_PACKAGE_OVERLAYS += device/oneplus/oneplus2/overlay
PRODUCT_PACKAGE_OVERLAYS += device/oneplus/oneplus2/overlay

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG += xxhdpi
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# CAF Branch
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.par.branch=LA.BF64.1.2.2-06140-8x94.0

# CodeAurora MSM8994 Device Tree
$(call inherit-product, device/qcom/msm8994/msm8994.mk)

# Haters gonna hate ..
PRODUCT_CHARACTERISTICS := nosdcard

# Camera
PRODUCT_PACKAGES += \
    libop2_cam

# USB
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

# Doze mode
PRODUCT_PACKAGES += \
    OneplusDoze

# Call the proprietary setup
$(call inherit-product-if-exists, vendor/oneplus/oneplus2/oneplus2-vendor.mk)
