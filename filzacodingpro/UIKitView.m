#include "UIKitView.h"
@implementation UIKitView

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"UIKitView" target:self];
	}
	return _specifiers;
}
@end