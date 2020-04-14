ARCHS = arm64 arm64e armv7 armv7s
INSTALL_TARGET_PROCESSES = Filza

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = FilzaCodingPro

FilzaCodingPro_FILES = Tweak.xm
FilzaCodingPro_CFLAGS = -fobjc-arc
FilzaCodingPro_EXTRA_FRAMEWORKS = Cephei

FilzaCodingPro_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += filzacodingpro
include $(THEOS_MAKE_PATH)/aggregate.mk
