#include "ShortCutView.h"
@implementation ShortCutView

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"ShortCutView" target:self];
	}
	return _specifiers;
}
@end