#include "FilzaProRootListController.h"
#include "BC.h"

@interface UIApplication (PrivateMethods)
- (BOOL)launchApplicationWithIdentifier:(NSString *)identifier suspended:(BOOL)suspend;
@end

@implementation FilzaProRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}
	return _specifiers;
}

@synthesize killButton;

- (instancetype)init {
    self = [super init];

    if (self) {
        HBAppearanceSettings *appearanceSettings = [[HBAppearanceSettings alloc] init];
        appearanceSettings.tintColor = [UIColor colorWithRed:0.8f green:0.1f blue:0.1f alpha:1];
        appearanceSettings.tableViewCellSeparatorColor = [UIColor
colorWithRed:0.8f green:0.3f blue:0.1f alpha:0.5];
        self.hb_appearanceSettings = appearanceSettings;
        self.killButton = [[UIBarButtonItem alloc] initWithTitle:@"Apply" 
                                    style:UIBarButtonItemStylePlain
                                    target:self 
                                    action:@selector(kill)];
        self.killButton.tintColor = [UIColor redColor];
        self.navigationItem.rightBarButtonItem = self.killButton;
    }
    return self;
}
-(void)kill {
BKSTerminateApplicationForReasonAndReportWithDescription(@"com.tigisoftware.Filza", 5, false, NULL);

    NSString *bundleID = @"com.tigisoftware.Filza";
    [[UIApplication sharedApplication]      launchApplicationWithIdentifier:bundleID suspended:FALSE];
}

-(void) twitter
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://mobile.twitter.com/DevTweak"]];
} 

-(void) github {

    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://github.com/SsS136/FilzaCodingPro"]];

}
-(void)howtouse{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://youtu.be/e_OFgZ_RtRY"]];
}

@end
