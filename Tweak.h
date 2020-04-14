#include <stdio.h>
#define PLIST_PATH @"/private/var/mobile/Library/Preferences/com.sss136.filzacodingpro.plist"

void check(int* result,NSMutableArray *arr,NSString *text);

@interface TGTextEditorController : UIViewController
@end

static int *result;
static int ress = 0;
static NSString *st;
static NSMutableArray *arr2 = [NSMutableArray array];
static int arrnum = 0;
static NSString *sss;
static NSString *str2;
static NSRange range;
static NSRange range2;
static NSRange range3;
static NSRange rang;
static NSRange rang2;
static NSRange range4;
static NSRange elif;
static NSRange elif1;
static NSRange elif2;
static NSRange elif3;
static NSRange for0;
static NSRange for1;
static NSRange for2;
static NSRange for3;
static NSRange do0;
static NSRange do1;
static NSRange do2;
static NSRange do3; 
static NSRange while0;
static NSRange while1;
static NSRange while2;
static NSRange while3;
static NSRange switch0;
static NSRange switch1;
static NSRange switch2;
static NSRange switch3;
static BOOL enabled = TRUE;
static BOOL indentm = YES;
static NSString *ifstatus;
static NSString *elseifstatus;
static NSString *forstatus;
static NSString *dostatus;
static NSString *whilestatus;
static NSString *switchstatus;
static NSString *currentmode;
static NSString *resulttext;
static NSString *alertString;
static NSString *alertString2;
static NSString *alertString3;
static NSString *alertString4;
static NSString *alertString5;
static NSString *alertString6;
static NSString *alertString7;
static NSString *setting;
static NSString *ale;
static NSString *ale2;
static NSString *setresult;
static NSString *btnstatus;
static NSString *lblstatus;
static NSString *swchstatus;
static NSString *tbstatus;
static NSString *acstatus;
static NSString *tfstatus;
static NSString *ucurrentmode;
static NSString *uresulttext;
static NSString *ualertString;
static NSString *ualertString2;
static NSString *ualertString3;
static NSString *ualertString4;
static NSString *ualertString5;
static NSString *ualertString6;
static NSString *ualertString7;

static NSString *ifelsestatus;
static NSString *ifelelstatus;
static NSString *hookstatus;
static NSString *interfacestatus;
static NSString *getboolstatus;
static NSString *getstringstatus;
static NSString *definestatus;
static NSString *getintstatus;

static NSString *ocurrentmode;
static NSString *oresulttext;
static NSString *oalertString;
static NSString *oalertString2;
static NSString *oalertString3;
static NSString *oalertString4;
static NSString *oalertString5;
static NSString *oalertString6;
static NSString *oalertString7;
static NSString *oalertString8;
static NSString *oalertString9;

@interface ICTextView : UITextView <NSTextStorageDelegate>
@property (nonatomic, retain) NSDictionary *highlightDefinition;
@property (nonatomic, retain) NSDictionary *highlightTheme;
+ (NSDictionary *)defaultHighlightDefinition;
+ (NSDictionary *)defaultHighlightTheme;
- (void)setupHighlighting;
- (void)highlightText;
@end

@interface TGFastTextEditViewController : UIViewController
@property (nonatomic, retain) ICTextView *textEditor;
@end

@interface UIKeyboardImpl : UIView
@property(readonly) UIResponder<UITextInput> * privateInputDelegate;
@property (nonatomic, retain) ICTextView *textEditor;
@property(readonly) UIResponder<UITextInput> * inputDelegate;
+ (id)sharedInstance;
- (id)delegateAsResponder;
- (void)deleteBackward;
@end
