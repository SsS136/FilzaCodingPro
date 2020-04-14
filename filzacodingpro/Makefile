ARCHS = arm64 arm64e armv7 armv7s

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = FilzaCodingPro

FilzaCodingPro_FILES = FilzaProRootListController.m ShortCutView.m UIKitView.m OthersView.m
FilzaCodingPro_INSTALL_PATH = /Library/PreferenceBundles
FilzaCodingPro_FRAMEWORKS = UIKit
FilzaCodingPro_PRIVATE_FRAMEWORKS = BackBoardServices Preferences
FilzaCodingPro_EXTRA_FRAMEWORKS = Cephei CepheiPrefs
FilzaCodingPro_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/FilzaCodingPro.plist$(ECHO_END)
