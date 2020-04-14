#include "OthersView.h"
@implementation OthersView

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"OthersView" target:self];
	}
	return _specifiers;
}
@end