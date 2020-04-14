#include <stdio.h>
#include "Tweak.h"
#import <UIKit/UIKit.h>     


static bool getPrefBool(NSString *key) {
	return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] boolValue];
} 

static NSString *getPrefString(NSString *key) {
    return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] stringValue];
}
//resultはressを参照
void check(int* result,NSMutableArray *arr,NSString *text) {
    if(*result == arr.count) {
         *result = 0;//init
    }
    st = arr[*result];
    if([st isEqualToString:text]) {
         *result = *result + 1;
    }else{
         *result = 0;//init
    }
}

/*
static TGTextEditorController *textView;
*/

%hook UIKeyboardImpl
- (void)insertText:(NSString *)text {
    %orig;
    if(getPrefBool(@"enabledd")) {
       
        NSString *getstr = getPrefString(@"checktext");
        NSMutableArray <NSString *> *arr = @[].mutableCopy;
        [getstr enumerateSubstringsInRange:NSMakeRange(0, getstr.length)         options:NSStringEnumerationByComposedCharacterSequences     usingBlock:^(NSString * _Nullable substring, NSRange substringRange, NSRange enclosingRange, BOOL * _Nonnull stop) {
              [arr addObject:substring];
          }];

        result = &ress;
        check(result,arr,text);
        NSString *std = arr[arr.count - 1];

        if([text isEqualToString:std] && ress == arr.count){

            UIViewController *view = [UIApplication sharedApplication].keyWindow.rootViewController;
            while (view.presentedViewController != nil && !view.presentedViewController.isBeingDismissed) {
                view = view.presentedViewController;
            }
            if(!enabled) {

                UIAlertController *alertController =
                [UIAlertController alertControllerWithTitle:@"Change Mode"
                message:@"Enable Cording Mode?"
                preferredStyle:UIAlertControllerStyleAlert];

                [alertController addAction:[UIAlertAction actionWithTitle:@"Yes"
                style:UIAlertActionStyleDefault

                handler:^(UIAlertAction *action) {
                    enabled = TRUE;
                    for(int i=0;i<arr.count;i++) {
                        [self deleteBackward];
                    }
                }]];

                [alertController addAction:[UIAlertAction actionWithTitle:@"Cancel"
                style:UIAlertActionStyleDefault

                handler:^(UIAlertAction *action) {
                }]];

                [view presentViewController:alertController animated:YES completion:nil];
            }else{

                UIAlertController *alertController =
                [UIAlertController alertControllerWithTitle:@"Change Mode"
                message:@"Enable Standard Mode??"
                preferredStyle:UIAlertControllerStyleAlert];

                [alertController addAction:[UIAlertAction actionWithTitle:@"Yes"
                style:UIAlertActionStyleDefault
                handler:^(UIAlertAction *action) {
                    enabled = FALSE;
                    for(int i=0;i<arr.count;i++) {
                        [self deleteBackward];
                    }
                }]];
            
                [alertController addAction:[UIAlertAction actionWithTitle:@"Cancel"
                style:UIAlertActionStyleDefault
                handler:^(UIAlertAction *action) {
                }]];

                [view presentViewController:alertController animated:YES completion:nil];

            }//endif(!enabled)
        }//endif(text isEqualToString)
        if([text isEqualToString:@" "] && enabled ) {
            arr2[arrnum] = @"    ";
        }else{
            arr2[arrnum] = text;
        }
        if(arrnum != 0){
            sss = arr2[arrnum - 1];
        }
        str2 = [arr2 componentsJoinedByString:@""];

            rang2 = [str2 rangeOfString:@"            "];
            range4 = [str2 rangeOfString:@"            if"];
            rang = [str2 rangeOfString:@"        "];
            range2 = [str2 rangeOfString:@"        if"]; 
            range = [str2 rangeOfString:@"    if"];
            range3 = [str2 rangeOfString:@"if"];
            elif = [str2 rangeOfString:@"elif"];
            elif1 = [str2 rangeOfString:@"1elif"];
            elif2 = [str2 rangeOfString:@"2elif"];
            elif3 = [str2 rangeOfString:@"3elif"];
            for0 = [str2 rangeOfString:@"for"];
            for1 = [str2 rangeOfString:@"1for"];
            for2 = [str2 rangeOfString:@"2for"];
            for3 = [str2 rangeOfString:@"3for"];
            do0 = [str2 rangeOfString:@"do"];
            do1 = [str2 rangeOfString:@"1do"];
            do2 = [str2 rangeOfString:@"2do"];
            do3 = [str2 rangeOfString:@"3do"];
            while0 = [str2 rangeOfString:@"while"];
            while1 = [str2 rangeOfString:@"1while"];
            while2 = [str2 rangeOfString:@"2while"];
            while3 = [str2 rangeOfString:@"3while"];
            switch0 = [str2 rangeOfString:@"switch"];
            switch1 = [str2 rangeOfString:@"1switch"];
            switch2 = [str2 rangeOfString:@"2switch"];
            switch3 = [str2 rangeOfString:@"3switch"];
            NSRange btnrange = [str2 rangeOfString:@"uibtn"];
            NSRange btnrange1 = [str2 rangeOfString:@"1uibtn"];
            NSRange btnrange2 = [str2 rangeOfString:@"2uibtn"];
            NSRange btnrange3 = [str2 rangeOfString:@"3uibtn"];
            NSRange lblrange = [str2 rangeOfString:@"uilbl"];
            NSRange lblrange1 = [str2 rangeOfString:@"1uilbl"];
            NSRange lblrange2 = [str2 rangeOfString:@"2uilbl"];
            NSRange lblrange3 = [str2 rangeOfString:@"3uilbl"];
            NSRange swchrange = [str2 rangeOfString:@"uiswch"];
            NSRange swchrange1 = [str2 rangeOfString:@"1uiswch"];
            NSRange swchrange2 = [str2 rangeOfString:@"2uiswch"];
            NSRange swchrange3 = [str2 rangeOfString:@"3uiswch"];
            NSRange tbrange = [str2 rangeOfString:@"uitb"];
            NSRange tbrange1 = [str2 rangeOfString:@"1uitb"];
            NSRange tbrange2 = [str2 rangeOfString:@"2uitb"];
            NSRange tbrange3 = [str2 rangeOfString:@"3uitb"];
            NSRange acrange = [str2 rangeOfString:@"uiac"];
            NSRange acrange1 = [str2 rangeOfString:@"1uiac"];
            NSRange acrange2 = [str2 rangeOfString:@"2uiac"];
            NSRange acrange3 = [str2 rangeOfString:@"3uiac"];
            NSRange tfrange = [str2 rangeOfString:@"uitf"];
            NSRange tfrange1 = [str2 rangeOfString:@"1uitf"];
            NSRange tfrange2 = [str2 rangeOfString:@"2uitf"];
            NSRange tfrange3 = [str2 rangeOfString:@"3uitf"];
            NSRange ifelserange = [str2 rangeOfString:@"+if"];
            NSRange ifelserange1 = [str2 rangeOfString:@"1+if"];
            NSRange ifelserange2 = [str2 rangeOfString:@"2+if"];
            NSRange ifelserange3 = [str2 rangeOfString:@"3+if"];
            NSRange ifelelrange = [str2 rangeOfString:@"+eif"];
            NSRange ifelelrange1 = [str2 rangeOfString:@"1+eif"];
            NSRange ifelelrange2 = [str2 rangeOfString:@"2+eif"];
            NSRange ifelelrange3 = [str2 rangeOfString:@"3+eif"];
            NSRange hookrange = [str2 rangeOfString:@"%ho"];
            NSRange interfacerange = [str2 rangeOfString:@"@in"];
            NSRange getboolrange = [str2 rangeOfString:@"cfgetbool"];
            NSRange getstringrange = [str2 rangeOfString:@"cfgetstring"];
            NSRange definerange = [str2 rangeOfString:@"cdpp"];
            NSRange getintrange = [str2 rangeOfString:@"cfgetint"];

        if (range.location != NSNotFound && enabled && rang.location == NSNotFound && rang2.location == NSNotFound && range4.location == NSNotFound && elif.location == NSNotFound && getPrefBool(@"kif") && ifelelrange.location == NSNotFound && ifelelrange1.location == NSNotFound && ifelelrange2.location == NSNotFound && ifelelrange3.location == NSNotFound && ifelserange.location == NSNotFound) {
            [arr2 removeAllObjects];
            arrnum = 0;
            %orig(@"() {\n        \n    }");
            goto label;
       }//1in
        else if(range2.location != NSNotFound && enabled && rang.location != NSNotFound && rang2.location == NSNotFound && elif.location == NSNotFound && getPrefBool(@"kif") && ifelelrange.location == NSNotFound && ifelelrange1.location == NSNotFound && ifelelrange2.location == NSNotFound && ifelelrange3.location == NSNotFound && ifelserange.location == NSNotFound) {
            [arr2 removeAllObjects];
            arrnum = 0;
            %orig(@"() {\n            \n        }");
            goto label;
        }//2in
        else if(range3.location != NSNotFound && enabled && rang2.location == NSNotFound && rang.location == NSNotFound && elif.location == NSNotFound && getPrefBool(@"kif") && ifelelrange.location == NSNotFound && ifelelrange1.location == NSNotFound && ifelelrange2.location == NSNotFound && ifelelrange3.location == NSNotFound && ifelserange.location == NSNotFound) {
            [arr2 removeAllObjects];
            arrnum = 0;
            %orig(@"() {\n    \n}");
            goto label;
        }//0in
        else if(rang2.location != NSNotFound && range4.location != NSNotFound && enabled && elif.location == NSNotFound && getPrefBool(@"kif") && ifelelrange.location == NSNotFound && ifelelrange1.location == NSNotFound && ifelelrange2.location == NSNotFound && ifelelrange3.location == NSNotFound && ifelserange.location == NSNotFound) {
            [arr2 removeAllObjects];
            arrnum = 0;
            %orig(@"() {\n                \n            }");
        }//3in
        else if(arrnum == 50) {//refresh
            arrnum = 0;
            [arr2 removeAllObjects];
        }

        //end ifshortcut
        //start else if short cut
        //str2 = [arr2 componentsJoinedByString:@""];
        else if(elif.location != NSNotFound && enabled && elif1.location == NSNotFound && elif2.location == NSNotFound && elif3.location == NSNotFound && getPrefBool(@"kelif") && ifelelrange.location == NSNotFound && ifelelrange1.location == NSNotFound && ifelelrange2.location == NSNotFound && ifelelrange3.location == NSNotFound && ifelserange.location == NSNotFound) {
            for(int b=0;b<4;b++){
                [self deleteBackward];
            }
            %orig(@"else if() {\n    \n}");            
            [arr2 removeAllObjects];
            arrnum = 0;
        }
        else if(elif1.location != NSNotFound && enabled && getPrefBool(@"kelif") && ifelelrange.location == NSNotFound && ifelelrange1.location == NSNotFound && ifelelrange2.location == NSNotFound && ifelelrange3.location == NSNotFound && ifelserange.location == NSNotFound) {
            for(int b=0;b<5;b++){
                [self deleteBackward];
            }
            %orig(@"else if() {\n        \n    }");            
            [arr2 removeAllObjects];
            arrnum = 0;
        }
        else if(elif2.location != NSNotFound && enabled && getPrefBool(@"kelif") && ifelelrange.location == NSNotFound && ifelelrange1.location == NSNotFound && ifelelrange2.location == NSNotFound && ifelelrange3.location == NSNotFound && ifelserange.location == NSNotFound) {
            for(int b=0;b<5;b++){
                [self deleteBackward];
            }
            %orig(@"else if() {\n            \n        }");            
            [arr2 removeAllObjects];
            arrnum = 0;
        }
        else if(elif3.location != NSNotFound && enabled && getPrefBool(@"kelif") && ifelelrange.location == NSNotFound && ifelelrange1.location == NSNotFound && ifelelrange2.location == NSNotFound && ifelelrange3.location == NSNotFound && ifelserange.location == NSNotFound) {
            for(int b=0;b<5;b++){
                [self deleteBackward];
            }
            %orig(@"else if() {\n                \n            }");            
            [arr2 removeAllObjects];
            arrnum = 0;
        }

//for shortcut

        else if(for0.location != NSNotFound && enabled && for1.location == NSNotFound && for2.location == NSNotFound && for3.location == NSNotFound && getPrefBool(@"kfor")) {
            %orig(@"(;;) {\n    \n}");            
            [arr2 removeAllObjects];
            arrnum = 0;
        }
        else if(for1.location != NSNotFound && enabled && getPrefBool(@"kfor")) {
            for(int b=0;b<4;b++){
                [self deleteBackward];
            }
            %orig(@"for(;;) {\n        \n    }");            
            [arr2 removeAllObjects];
            arrnum = 0;
        }
        else if(for2.location != NSNotFound && enabled && getPrefBool(@"kfor")) {
            for(int b=0;b<4;b++){
                [self deleteBackward];
            }
            %orig(@"for(;;) {\n            \n        }");            
            [arr2 removeAllObjects];
            arrnum = 0;
        }
        else if(for3.location != NSNotFound && enabled && getPrefBool(@"kfor")) {
            for(int b=0;b<4;b++){
                [self deleteBackward];
            }
            %orig(@"for(;;) {\n                \n            }");            
            [arr2 removeAllObjects];
            arrnum = 0;
        }

//do while shortcut
        else if(do0.location != NSNotFound && enabled  &&    do1.location == NSNotFound && do2.location == NSNotFound && do3.location == NSNotFound && getPrefBool(@"kdo")) {
            for(int b=0;b<2;b++) {
                [self deleteBackward];
            }
            %orig(@"do {\n    \n}while();");
            [arr2 removeAllObjects];
            arrnum = 0;
        }
        else if(do1.location != NSNotFound && enabled && getPrefBool(@"kdo")) {
            for(int b=0;b<3;b++) {
                [self deleteBackward];
            }
            %orig(@"do {\n        \n    }while();");
            [arr2 removeAllObjects];
            arrnum = 0;
        }
        else if(do2.location != NSNotFound && enabled && getPrefBool(@"kdo")) {
            for(int b=0;b<3;b++) {
                [self deleteBackward];
            }
            %orig(@"do {\n            \n        }while();");
            [arr2 removeAllObjects];
            arrnum = 0;
        }
        else if(do3.location != NSNotFound && enabled && getPrefBool(@"kdo")) {
            for(int b=0;b<3;b++) {
                [self deleteBackward];
            }
            %orig(@"do {\n                \n            }while();");
            [arr2 removeAllObjects];
            arrnum = 0;
        }

//while shortcut
        else if(while0.location != NSNotFound && enabled  &&    while1.location == NSNotFound && while2.location == NSNotFound && while3.location == NSNotFound && getPrefBool(@"kwhile")) {
            for(int b=0;b<5;b++) {
                [self deleteBackward];
            }
            %orig(@"while() {\n    \n}");
            [arr2 removeAllObjects];
            arrnum = 0;
        }
        else if(while1.location != NSNotFound && enabled && getPrefBool(@"kwhile")) {
            for(int b=0;b<6;b++) {
                [self deleteBackward];
            }
            %orig(@"while() {\n        \n    }");
            [arr2 removeAllObjects];
            arrnum = 0;
        }
        else if(while2.location != NSNotFound && enabled && getPrefBool(@"kwhile")) {
            for(int b=0;b<6;b++) {
                [self deleteBackward];
            }
            %orig(@"while() {\n            \n        }");
            [arr2 removeAllObjects];
            arrnum = 0;
        }
        else if(while3.location != NSNotFound && enabled && getPrefBool(@"kwhile")) {
            for(int b=0;b<6;b++) {
                [self deleteBackward];
            }
            %orig(@"while() {\n                \n            }");
            [arr2 removeAllObjects];
            arrnum = 0;
        }

//switch
        else if(switch0.location != NSNotFound && enabled  &&    switch1.location == NSNotFound && switch2.location == NSNotFound && switch3.location == NSNotFound && getPrefBool(@"kswitch")) {
            for(int b=0;b<6;b++) {
                [self deleteBackward];
            }
            %orig(@"switch () {\n    case :\n        break;\n    case :\n        break;\n    case :\n        break;\n    default:\n        break;\n}");
            [arr2 removeAllObjects];
            arrnum = 0;
        }
        else if(switch1.location != NSNotFound && enabled && getPrefBool(@"kswitch")) {
            for(int b=0;b<7;b++) {
                [self deleteBackward];
            }
            %orig(@"switch () {\n        case :\n            break;\n        case :\n            break;\n        case :\n            break;\n        default:\n            break;\n}");
            [arr2 removeAllObjects];
            arrnum = 0;
        }
        else if(switch2.location != NSNotFound && enabled && getPrefBool(@"kswitch")) {
            for(int b=0;b<7;b++) {
                [self deleteBackward];
            }
            %orig(@"switch () {\n            case :\n                break;\n            case :\n                break;\n            case :\n                break;\n            default:\n                break;\n        }");
            [arr2 removeAllObjects];
            arrnum = 0;
        }
        else if(switch3.location != NSNotFound && enabled && getPrefBool(@"kswitch")) {
            for(int b=0;b<7;b++) {
                [self deleteBackward];
            }
            %orig(@"switch () {\n                case :\n                    break;\n                case :\n                    break;\n                case :\n                    break;\n                default:\n                    break;\n            }");
            [arr2 removeAllObjects];
            arrnum = 0;
        }
//uikit uibutton
        else if(btnrange.location != NSNotFound && enabled  &&    btnrange1.location == NSNotFound && btnrange2.location == NSNotFound && btnrange3.location == NSNotFound && getPrefBool(@"kbtn")) {
            for(int b=0;b<5;b++) {
                [self deleteBackward];
            }

            %orig(@"UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];\nbtn.frame = CGRectMake(10, 10, 100, 30);\n[btn setTitle:@\"xxx\" forState:UIControlStateNormal];\n[btn addTarget:self action:@selector(hoge:) forControlEvents:UIControlEventTouchDown];\n[self.view addSubview:btn];");
            [arr2 removeAllObjects];
            arrnum = 0;

        }
        else if(btnrange1.location != NSNotFound && enabled && getPrefBool(@"kbtn")) {
            for(int b=0;b<6;b++) {
                [self deleteBackward];
            }
            %orig(@"UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];\n    btn.frame = CGRectMake(10, 10, 100, 30);\n    [btn setTitle:@\"xxx\" forState:UIControlStateNormal];\n    [btn addTarget:self action:@selector(hoge:) forControlEvents:UIControlEventTouchDown];\n    [self.view addSubview:btn];");
            [arr2 removeAllObjects];
            arrnum = 0;
        }

        else if(btnrange2.location != NSNotFound && enabled && getPrefBool(@"kbtn")) {
            for(int b=0;b<6;b++) {
                [self deleteBackward];
            }
            %orig(@"UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];\n        btn.frame = CGRectMake(10, 10, 100, 30);\n        [btn setTitle:@\"xxx\" forState:UIControlStateNormal];\n        [btn addTarget:self action:@selector(hoge:) forControlEvents:UIControlEventTouchDown];\n        [self.view addSubview:btn];");
            [arr2 removeAllObjects];
            arrnum = 0;
        }
        else if(btnrange3.location != NSNotFound && enabled && getPrefBool(@"kbtn")) {
            for(int b=0;b<6;b++) {
                [self deleteBackward];
            }
            %orig(@"UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];\n            btn.frame = CGRectMake(10, 10, 100, 30);\n            [btn setTitle:@\"xxx\" forState:UIControlStateNormal];\n            [btn addTarget:self action:@selector(hoge:) forControlEvents:UIControlEventTouchDown];\n            [self.view addSubview:btn];");
            [arr2 removeAllObjects];
            arrnum = 0;
        }
        //UILabel
        else if(lblrange.location != NSNotFound && enabled && lblrange1.location == NSNotFound && lblrange2.location == NSNotFound && lblrange3.location == NSNotFound && getPrefBool(@"klabel")) {
            for(int b=0;b<5;b++) {
                [self deleteBackward];
            }
            %orig(@"UILabel *label = [[UILabel alloc] init];\nlabel.frame = CGRectMake(10, 10, 100, 50);\nlabel.backgroundColor = [UIColor yellowColor];\nlabel.textColor = [UIColor blueColor];\nlabel.font = [UIFont fontWithName:@\"AppleGothic\" size:12];\nlabel.textAlignment = UITextAlignmentCenter;label.text = @\"hoge\";\n[self.view addSubview:label];");
            [arr2 removeAllObjects];
            arrnum = 0;

        }
        else if(lblrange1.location != NSNotFound && enabled && getPrefBool(@"klabel")) {
            for(int b=0;b<6;b++) {
                [self deleteBackward];
            }
            %orig(@"UILabel *label = [[UILabel alloc] init];\n    label.frame = CGRectMake(10, 10, 100, 50);\n    label.backgroundColor = [UIColor yellowColor];\n    label.textColor = [UIColor blueColor];\n    label.font = [UIFont fontWithName:@\"AppleGothic\" size:12];\n    label.textAlignment = UITextAlignmentCenter;label.text = @\"hoge\";\n    [self.view addSubview:label];");
            [arr2 removeAllObjects];
            arrnum = 0;
        }

        else if(lblrange2.location != NSNotFound && enabled && getPrefBool(@"klabel")) {
            for(int b=0;b<6;b++) {
                [self deleteBackward];
            }
            %orig(@"UILabel *label = [[UILabel alloc] init];\n        label.frame = CGRectMake(10, 10, 100, 50);\n        label.backgroundColor = [UIColor yellowColor];\n        label.textColor = [UIColor blueColor];\n        label.font = [UIFont fontWithName:@\"AppleGothic\" size:12];\n        label.textAlignment = UITextAlignmentCenter;label.text = @\"hoge\";\n        [self.view addSubview:label];");
            [arr2 removeAllObjects];
            arrnum = 0;
        }
        else if(lblrange3.location != NSNotFound && enabled && getPrefBool(@"klabel")) {
            for(int b=0;b<6;b++) {
                [self deleteBackward];
            }
            %orig(@"UILabel *label = [[UILabel alloc] init];\n            label.frame = CGRectMake(10, 10, 100, 50);\n            label.backgroundColor = [UIColor yellowColor];\n            label.textColor = [UIColor blueColor];\n            label.font = [UIFont fontWithName:@\"AppleGothic\" size:12];\n            label.textAlignment = UITextAlignmentCenter;label.text = @\"hoge\";\n            [self.view addSubview:label];");
            [arr2 removeAllObjects];
            arrnum = 0;
        }
        //UISwitch
        else if(swchrange.location != NSNotFound && enabled && swchrange1.location == NSNotFound && swchrange2.location == NSNotFound && swchrange3.location == NSNotFound && getPrefBool(@"kuswitch")) {
            for(int b=0;b<6;b++) {
                [self deleteBackward];
            }
            %orig(@"UISwitch *sw = [[[UISwitch alloc] init] autorelease];\nsw.center = CGPointMake(200, 300);\nsw.on = OFF;\n[sw addTarget:self action:@selector(hoge:) forControlEvents:UIControlEventValueChanged];\n[self.view addSubview:sw];");
            [arr2 removeAllObjects];
            arrnum = 0;

        }
        else if(swchrange1.location != NSNotFound && enabled && getPrefBool(@"kuswitch")) {
            for(int b=0;b<7;b++) {
                [self deleteBackward];
            }
            %orig(@"UISwitch *sw = [[[UISwitch alloc] init] autorelease];\n    sw.center = CGPointMake(200, 300);\n    sw.on = OFF;\n    [sw addTarget:self action:@selector(hoge:) forControlEvents:UIControlEventValueChanged];\n    [self.view addSubview:sw];");
            [arr2 removeAllObjects];
            arrnum = 0;
        }

        else if(swchrange2.location != NSNotFound && enabled && getPrefBool(@"kuswitch")) {
            for(int b=0;b<7;b++) {
                [self deleteBackward];
            }
            %orig(@"UISwitch *sw = [[[UISwitch alloc] init] autorelease];\n        sw.center = CGPointMake(200, 300);\n        sw.on = OFF;\n        [sw addTarget:self action:@selector(hoge:) forControlEvents:UIControlEventValueChanged];\n        [self.view addSubview:sw];");
            [arr2 removeAllObjects];
            arrnum = 0;
        }
        else if(swchrange3.location != NSNotFound && enabled && getPrefBool(@"kuswitch")) {
            for(int b=0;b<7;b++) {
                [self deleteBackward];
            }
            %orig(@"UISwitch *sw = [[[UISwitch alloc] init] autorelease];\n            sw.center = CGPointMake(200, 300);\n            sw.on = OFF;\n            [sw addTarget:self action:@selector(hoge:) forControlEvents:UIControlEventValueChanged];\n            [self.view addSubview:sw];");
            [arr2 removeAllObjects];
            arrnum = 0;
        }
        //UIToolBar
        else if(tbrange.location != NSNotFound && enabled && tbrange1.location == NSNotFound && tbrange2.location == NSNotFound && tbrange3.location == NSNotFound && getPrefBool(@"ktb")) {
            for(int b=0;b<4;b++) {
                [self deleteBackward];
            }
            %orig(@"[self.navigationController setToolbarHidden:NO animated:NO];\nself.navigationController.toolbar.tintColor = [UIColor blackColor];\nUIBarButtonItem *spacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];\nUIBarButtonItem *button = [[UIBarButtonItem alloc] initWithTitle:@\"Hoge\" style:UIBarButtonItemStyleBordered target:self action:@selector(hoge)];\nNSArray *items = [NSArray arrayWithObjects:spacer, button, spacer, nil];\nself.toolbarItems = items;");
            [arr2 removeAllObjects];
            arrnum = 0;

        }
        else if(tbrange1.location != NSNotFound && enabled && getPrefBool(@"ktb")) {
            for(int b=0;b<5;b++) {
                [self deleteBackward];
            }
            %orig(@"[self.navigationController setToolbarHidden:NO animated:NO];\n    self.navigationController.toolbar.tintColor = [UIColor blackColor];\n    UIBarButtonItem *spacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];\n    UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithTitle:@\"Hoge\" style:UIBarButtonItemStyleBordered target:self action:@selector(hoge)];\n    NSArray *items = [NSArray arrayWithObjects:spacer, button, spacer, nil];\n    self.toolbarItems = items;");
            [arr2 removeAllObjects];
            arrnum = 0;
        }

        else if(tbrange2.location != NSNotFound && enabled && getPrefBool(@"ktb")) {
            for(int b=0;b<5;b++) {
                [self deleteBackward];
            }
            %orig(@"[self.navigationController setToolbarHidden:NO animated:NO];\n        self.navigationController.toolbar.tintColor = [UIColor blackColor];\n        UIBarButtonItem *spacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];\n        UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithTitle:@\"Hoge\" style:UIBarButtonItemStyleBordered target:self action:@selector(hoge)];\n        NSArray *items = [NSArray arrayWithObjects:spacer, button, spacer, nil];\n        self.toolbarItems = items;");
            [arr2 removeAllObjects];
            arrnum = 0;
        }
        else if(tbrange3.location != NSNotFound && enabled && getPrefBool(@"ktb")) {
            for(int b=0;b<5;b++) {
                [self deleteBackward];
            }
            %orig(@"[self.navigationController setToolbarHidden:NO animated:NO];\n            self.navigationController.toolbar.tintColor = [UIColor blackColor];\n            UIBarButtonItem *spacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];\n            UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithTitle:@\"Hoge\" style:UIBarButtonItemStyleBordered target:self action:@selector(hoge)];\n            NSArray *items = [NSArray arrayWithObjects:spacer, button, spacer, nil];\n            self.toolbarItems = items;");
            [arr2 removeAllObjects];
            arrnum = 0;
        }
        //UIAlertController
        else if(acrange.location != NSNotFound && enabled && acrange1.location == NSNotFound && acrange2.location == NSNotFound && acrange3.location == NSNotFound && getPrefBool(@"kac")) {
            for(int b=0;b<4;b++) {
                [self deleteBackward];
            }
            %orig(@"UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@\"TITLE\" \nmessage:@\"MESSAGE\" \npreferredStyle:UIAlertControllerStyleAlert];\n\n[alertController addAction:[UIAlertAction actionWithTitle:@\"YES\" \nstyle:UIAlertActionStyleDefault \nhandler:^(UIAlertAction *action) {\n}]];\n\n[alertController addAction:[UIAlertAction actionWithTitle:@\"cancel\" \nstyle:UIAlertActionStyleDefault \nhandler:^(UIAlertAction *action) {\n}]];\n[self presentViewController:alertController animated:YES completion:nil];}");
            [arr2 removeAllObjects];
            arrnum = 0;

        }
        else if(acrange1.location != NSNotFound && enabled && getPrefBool(@"kac")) {
            for(int b=0;b<5;b++) {
                [self deleteBackward];
            }
            %orig(@"UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@\"TITLE\" \n    message:@\"MESSAGE\" \n    preferredStyle:UIAlertControllerStyleAlert];\n\n    [alertController addAction:[UIAlertAction actionWithTitle:@\"YES\" \n    style:UIAlertActionStyleDefault \n    handler:^(UIAlertAction *action) {\n    }]];\n\n    [alertController addAction:[UIAlertAction actionWithTitle:@\"cancel\" \n    style:UIAlertActionStyleDefault \n    handler:^(UIAlertAction *action) {\n    }]];\n    [self presentViewController:alertController animated:YES completion:nil];}");
            [arr2 removeAllObjects];
            arrnum = 0;
        }

        else if(acrange2.location != NSNotFound && enabled && getPrefBool(@"kac")) {
            for(int b=0;b<5;b++) {
                [self deleteBackward];
            }
            %orig(@"UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@\"TITLE\" \n        message:@\"MESSAGE\" \n        preferredStyle:UIAlertControllerStyleAlert];\n\n        [alertController addAction:[UIAlertAction actionWithTitle:@\"YES\" \n        style:UIAlertActionStyleDefault \n        handler:^(UIAlertAction *action) {\n        }]];\n\n        [alertController addAction:[UIAlertAction actionWithTitle:@\"cancel\" \n        style:UIAlertActionStyleDefault \n        handler:^(UIAlertAction *action) {\n        }]];\n        [self presentViewController:alertController animated:YES completion:nil];}");
            [arr2 removeAllObjects];
            arrnum = 0;
        }
        else if(acrange3.location != NSNotFound && enabled && getPrefBool(@"kac")) {
            for(int b=0;b<5;b++) {
                [self deleteBackward];
            }
            %orig(@"UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@\"TITLE\" \n        message:@\"MESSAGE\" \n        preferredStyle:UIAlertControllerStyleAlert];\n\n        [alertController addAction:[UIAlertAction actionWithTitle:@\"YES\" \n        style:UIAlertActionStyleDefault \n        handler:^(UIAlertAction *action) {\n        }]];\n\n        [alertController addAction:[UIAlertAction actionWithTitle:@\"cancel\" \n        style:UIAlertActionStyleDefault \n        handler:^(UIAlertAction *action) {\n        }]];\n        [self presentViewController:alertController animated:YES completion:nil];}");
            [arr2 removeAllObjects];
            arrnum = 0;
        }
        //UITaxtField
        else if(tfrange.location != NSNotFound && enabled && tfrange1.location == NSNotFound && tfrange2.location == NSNotFound && tfrange3.location == NSNotFound && getPrefBool(@"ktf")) {
            for(int b=0;b<4;b++) {
                [self deleteBackward];
            }
            %orig(@"UITextField *tf = [[[UITextField alloc] initWithFrame:CGRectMake(10, 10, 200, 30)] autorelease];\ntf.borderStyle = UITextBorderStyleRoundedRect;\ntf.textColor = [UIColor blueColor];\ntf.placeholder = @\"placeholder\";\ntf.clearButtonMode = UITextFieldViewModeAlways;\n[tf addTarget:self action:@selector(hoge:) forControlEvents:UIControlEventEditingDidEndOnExit];\n[self.view addSubview:tf];");
            [arr2 removeAllObjects];
            arrnum = 0;

        }
        else if(tfrange1.location != NSNotFound && enabled && getPrefBool(@"ktf")) {
            for(int b=0;b<5;b++) {
                [self deleteBackward];
            }
            %orig(@"UITextField *tf = [[[UITextField alloc] initWithFrame:CGRectMake(10, 10, 200, 30)] autorelease];\n    tf.borderStyle = UITextBorderStyleRoundedRect;\n    tf.textColor = [UIColor blueColor];\n    tf.placeholder = @\"placeholder\";\n    tf.clearButtonMode = UITextFieldViewModeAlways;\n    [tf addTarget:self action:@selector(hoge:) forControlEvents:UIControlEventEditingDidEndOnExit];\n    [self.view addSubview:tf];");
            [arr2 removeAllObjects];
            arrnum = 0;
        }

        else if(tfrange2.location != NSNotFound && enabled && getPrefBool(@"ktf")) {
            for(int b=0;b<5;b++) {
                [self deleteBackward];
            }
            %orig(@"UITextField *tf = [[[UITextField alloc] initWithFrame:CGRectMake(10, 10, 200, 30)] autorelease];\n        tf.borderStyle = UITextBorderStyleRoundedRect;\n        tf.textColor = [UIColor blueColor];\n        tf.placeholder = @\"placeholder\";\n        tf.clearButtonMode = UITextFieldViewModeAlways;\n        [tf addTarget:self action:@selector(hoge:) forControlEvents:UIControlEventEditingDidEndOnExit];\n        [self.view addSubview:tf];");
            [arr2 removeAllObjects];
            arrnum = 0;
        }
        else if(tfrange3.location != NSNotFound && enabled && getPrefBool(@"ktf")) {
            for(int b=0;b<5;b++) {
                [self deleteBackward];
            }
            %orig(@"UITextField *tf = [[[UITextField alloc] initWithFrame:CGRectMake(10, 10, 200, 30)] autorelease];\n            tf.borderStyle = UITextBorderStyleRoundedRect;\n            tf.textColor = [UIColor blueColor];\n            tf.placeholder = @\"placeholder\";\n            tf.clearButtonMode = UITextFieldViewModeAlways;\n            [tf addTarget:self action:@selector(hoge:) forControlEvents:UIControlEventEditingDidEndOnExit];\n            [self.view addSubview:tf];");
            [arr2 removeAllObjects];
            arrnum = 0;
        }
        //if+else
        else if(ifelserange.location != NSNotFound && enabled  &&    ifelserange1.location == NSNotFound && ifelserange2.location == NSNotFound && ifelserange3.location == NSNotFound && getPrefBool(@"ifelif")) {
            for(int b=0;b<3;b++) {
                [self deleteBackward];
            }
            %orig(@"if() {\n    \n}else{\n    \n}");
            [arr2 removeAllObjects];
            arrnum = 0;
        }
        else if(ifelserange1.location != NSNotFound && enabled && getPrefBool(@"ifelif")) {
            for(int b=0;b<4;b++) {
                [self deleteBackward];
            }
            %orig(@"if() {\n        \n    }else{\n        \n    }");
            [arr2 removeAllObjects];
            arrnum = 0;
        }
        else if(ifelserange2.location != NSNotFound && enabled && getPrefBool(@"ifelif")) {
            for(int b=0;b<4;b++) {
                [self deleteBackward];
            }
            %orig(@"if() {\n            \n        }else{\n            \n        }");
            [arr2 removeAllObjects];
            arrnum = 0;
        }
        else if(ifelserange3.location != NSNotFound && enabled && getPrefBool(@"ifelif")) {
            for(int b=0;b<4;b++) {
                [self deleteBackward];
            }
            %orig(@"if() {\n                \n            }else{\n                \n            }");
            [arr2 removeAllObjects];
            arrnum = 0;
        }
        //if+else if+else
        else if(ifelelrange.location != NSNotFound && enabled  &&    ifelelrange1.location == NSNotFound && ifelelrange2.location == NSNotFound && ifelelrange3.location == NSNotFound && getPrefBool(@"kifelel") && ifelserange.location == NSNotFound ) {
            for(int b=0;b<4;b++) {
                [self deleteBackward];
            }
            %orig(@"if() {\n    \n}\nelse if() {\n    \n}else{\n    \n}");
            [arr2 removeAllObjects];
            arrnum = 0;
        }
        else if(ifelelrange1.location != NSNotFound && enabled && getPrefBool(@"kifelel")) {
            for(int b=0;b<5;b++) {
                [self deleteBackward];
            }
            %orig(@"if() {\n        \n    }\n    else if() {\n        \n    }else{\n        \n    }");
            [arr2 removeAllObjects];
            arrnum = 0;
        }
        else if(ifelelrange2.location != NSNotFound && enabled && getPrefBool(@"kifelel")) {
            for(int b=0;b<5;b++) {
                [self deleteBackward];
            }
            %orig(@"if() {\n            \n        }\n        else if() {\n            \n        }else{\n            \n        }");
            [arr2 removeAllObjects];
            arrnum = 0;
        }
        else if(ifelelrange3.location != NSNotFound && enabled && getPrefBool(@"kifelel")) {
            for(int b=0;b<5;b++) {
                [self deleteBackward];
            }
            %orig(@"if() {\n                \n            }\n            else if() {\n                \n            }else{\n                \n            }");
            [arr2 removeAllObjects];
            arrnum = 0;
        }
        //hook
        else if(hookrange.location != NSNotFound && enabled && getPrefBool(@"khook")) {
            for(int b=0;b<3;b++) {
                [self deleteBackward];
            }
            %orig(@"%hook\n\n%end");
            [arr2 removeAllObjects];
            arrnum = 0;
        }
        else if(interfacerange.location != NSNotFound && enabled && getPrefBool(@"kinter")) {
            for(int b=0;b<3;b++) {
                [self deleteBackward];
            }
            %orig(@"@interface\n\n@end");
            [arr2 removeAllObjects];
            arrnum = 0;
        }
        else if(getboolrange.location != NSNotFound && enabled && getPrefBool(@"kcfgb")) {
            for(int b=0;b<9;b++) {
                [self deleteBackward];
            }
            %orig(@"inline bool getPrefBool(NSString *key) {\n    return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] boolValue];\n}");
            [arr2 removeAllObjects];
            arrnum = 0;
        }
        else if(getstringrange.location != NSNotFound && enabled && getPrefBool(@"kcfgs")) {
            for(int b=0;b<11;b++) {
                [self deleteBackward];
            }
            %orig(@"static NSString *getPrefString(NSString *key) {\n    return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] stringValue];\n}");
            [arr2 removeAllObjects];
            arrnum = 0;
        }
        else if(definerange.location != NSNotFound && enabled && getPrefBool(@"kcdpp")) {
            for(int b=0;b<4;b++) {
                [self deleteBackward];
            }
            %orig(@"#define PLIST_PATH @\"/private/var/mobile/Library/Preferences/com.XXX.XXX.plist\"");
            [arr2 removeAllObjects];
            arrnum = 0;
        }
        else if(getintrange.location != NSNotFound && enabled && getPrefBool(@"kcfgi")) {
            for(int b=0;b<8;b++) {
                [self deleteBackward];
            }
            %orig(@"inline int getPrefInt(NSString *key) {\n    return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] intValue];\n}");
            [arr2 removeAllObjects];
            arrnum = 0;
        }else{
            arrnum++; 
        }
        label:
        if([text isEqualToString:@" "] && indentm && enabled && ![sss isEqualToString:@"&"] && ![sss isEqualToString:@"|"] && ![sss isEqualToString:@"="] && ![sss isEqualToString:@")"] && ![sss isEqualToString:@"]"] && ![sss isEqualToString:@"+"] && ![sss isEqualToString:@"-"] && ![sss isEqualToString:@"/"] && ![sss isEqualToString:@"c"] && ![sss isEqualToString:@"a"] && ![sss isEqualToString:@"b"] && ![sss isEqualToString:@"d"] && ![sss isEqualToString:@"e"] && ![sss isEqualToString:@"f"] && ![sss isEqualToString:@"g"] && ![sss isEqualToString:@"h"] && ![sss isEqualToString:@"i"] && ![sss isEqualToString:@"j"] && ![sss isEqualToString:@"k"] && ![sss isEqualToString:@"l"] && ![sss isEqualToString:@"m"] && ![sss isEqualToString:@"n"] && ![sss isEqualToString:@"o"] && ![sss isEqualToString:@"p"] && ![sss isEqualToString:@"q"] && ![sss isEqualToString:@"r"] && ![sss isEqualToString:@"s"] && ![sss isEqualToString:@"t"] && ![sss isEqualToString:@"u"] && ![sss isEqualToString:@"v"] && ![sss isEqualToString:@"w"] && ![sss isEqualToString:@"x"] && ![sss isEqualToString:@"y"] && ![sss isEqualToString:@"z"]) {
            %orig(@"   ");
        }else{
            //path-through
        }
    }//endif(getprefbool)
}//endmethod
%end

%hook TGTextEditorController
-(void)viewDidLoad {
    %orig;
     UIButton *btn = [UIButton    buttonWithType:UIButtonTypeRoundedRect];
     btn.frame = CGRectMake(290, 66, 80, 20);
    [btn setTitle:@"Short Cut" forState:UIControlStateNormal];
     [btn addTarget:self action:@selector(hoge:)
     forControlEvents:UIControlEventTouchDown];
     btn.titleLabel.font = [UIFont systemFontOfSize:14];
     btn.titleLabel.adjustsFontSizeToFitWidth = YES;
     btn.titleLabel.minimumScaleFactor        = 0.5f;
     [btn.layer setBorderColor:[UIColor blueColor].CGColor];
     [btn.layer setBorderWidth:2.0];
     [btn.layer setCornerRadius:5.0];
     [self.view addSubview:btn];

     UIButton *btn2 = [UIButton    buttonWithType:UIButtonTypeRoundedRect];
     btn2.frame = CGRectMake(290, 90, 80, 20);
    [btn2 setTitle:@"Indent or Space " forState:UIControlStateNormal];
     [btn2 addTarget:self action:@selector(hoge2:)
     forControlEvents:UIControlEventTouchDown];
     btn2.titleLabel.font = [UIFont systemFontOfSize:14];
     btn2.titleLabel.adjustsFontSizeToFitWidth = YES;
     btn2.titleLabel.minimumScaleFactor        = 0.5f;
     [btn2.layer setBorderColor:[UIColor blueColor].CGColor];
     [btn2.layer setBorderWidth:2.0];
     [btn2.layer setCornerRadius:5.0];
     [self.view addSubview: btn2];

}
%new
-(void)hoge:(UIButton*)button{
    getPrefBool(@"kif") ? ifstatus = @"ON" : ifstatus = @"OFF";
    getPrefBool(@"kelif") ? elseifstatus = @"ON" : elseifstatus = @"OFF";
    getPrefBool(@"kfor") ? forstatus = @"ON" : forstatus = @"OFF";
    getPrefBool(@"kdo") ? dostatus = @"ON" : dostatus = @"OFF";
    getPrefBool(@"kwhile") ? whilestatus = @"ON" : whilestatus = @"OFF";
    getPrefBool(@"kswitch") ? switchstatus = @"ON" : switchstatus = @"OFF";
    enabled ? currentmode = @"Coding Mode" : currentmode = @"Standard Mode";
    alertString = @"             if: Key→if        Status→";
    alertString2 = @"\n    else if: Key→elif     Status→";
    alertString3 = @"\n         for: Key→for      Status→";
    alertString4 = @"\ndo while: Key→do      Status→";
    alertString5 = @"\n     while: Key→while   Status→";
    alertString6 = @"\n   switch: Key→switch Status→";
    alertString7 = @"\n\nCurrent Mode: ";
    resulttext = [NSString stringWithFormat:@"%@%@%@%@%@%@%@%@%@%@%@%@%@%@",alertString, ifstatus,alertString2, elseifstatus,alertString3,forstatus,alertString4,dostatus,alertString5,whilestatus,alertString6,switchstatus,alertString7,currentmode];

    getPrefBool(@"kbtn") ? btnstatus = @"ON" : btnstatus = @"OFF";
    getPrefBool(@"klabel") ? lblstatus = @"ON" : lblstatus = @"OFF";
    getPrefBool(@"kuswitch") ? swchstatus = @"ON" : swchstatus = @"OFF";
    getPrefBool(@"ktb") ? tbstatus = @"ON" : tbstatus = @"OFF";
    getPrefBool(@"kac") ? acstatus = @"ON" : acstatus = @"OFF";
    getPrefBool(@"ktf") ? tfstatus = @"ON" : tfstatus = @"OFF";
    enabled ? ucurrentmode = @"Coding Mode" : ucurrentmode = @"Standard Mode";
      ualertString = @"UIButton: Key→uibtn        Status→";
    ualertString2 = @"\nUILabel: Key→uilbl        Status→";
    ualertString3 = @"\nUISwitch: Key→uiswch      Status→";
    ualertString4 = @"\nUIToolBar: Key→uitb         Status→";
    ualertString5 = @"\nUIAlertController: Key→uiac Status→";
    ualertString6 = @"\nUITextField: Key→uitf Status→";
    ualertString7 = @"\n\nCurrent Mode: ";
    uresulttext = [NSString stringWithFormat:@"%@%@%@%@%@%@%@%@%@%@%@%@%@%@",ualertString, btnstatus,ualertString2, lblstatus,ualertString3, swchstatus,ualertString4, tbstatus,ualertString5, acstatus,ualertString6, tfstatus,ualertString7,ucurrentmode];

    getPrefBool(@"ifelif") ? ifelsestatus = @"ON" : ifelsestatus = @"OFF";
    getPrefBool(@"kifelel") ? ifelelstatus = @"ON" : ifelelstatus = @"OFF";
    getPrefBool(@"khook") ? hookstatus = @"ON" : hookstatus = @"OFF";
    getPrefBool(@"kinter") ? interfacestatus = @"ON" : interfacestatus = @"OFF";
    getPrefBool(@"kcfgb") ? getboolstatus = @"ON" : getboolstatus = @"OFF";
    getPrefBool(@"kcfgs") ? getstringstatus = @"ON" : getstringstatus = @"OFF";
    getPrefBool(@"kcdpp") ? definestatus = @"ON" : definestatus = @"OFF";
    getPrefBool(@"kcfgi") ? getintstatus =  @"ON" : getintstatus = @"OFF";
    enabled ? ocurrentmode = @"Coding Mode" : ocurrentmode = @"Standard Mode";
    oalertString = @"if+else:        Key→+if\nStatus→";
    oalertString2 = @"\nif+else if+else: Key→+eif\nStatus→";
    oalertString3 = @"\n%hook:       Key→%ho\nStatus→";
    oalertString4 = @"\n@interface:  Key→@in\nStatus→";
    oalertString5 = @"\ngetPrefBool: Key→cfgetbool\nStatus→";
    oalertString6 = @"\ngetPrefString: Key→cfgetstring\nStatus→";
    oalertString7 = @"\n#difine PLIST_PATH: Key→cdpp\nStatus→";
    oalertString8 = @"\ngetPrefInt: Key→cfgetint\nStatus→";
    oalertString9 = @"\n\nCurrent Mode: ";
    oresulttext = [NSString stringWithFormat:@"%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@",oalertString, ifelsestatus,oalertString2, ifelelstatus,oalertString3, hookstatus,oalertString4, interfacestatus,oalertString5, getboolstatus,oalertString6, getstringstatus,oalertString7,definestatus,oalertString8,getintstatus,oalertString9,ocurrentmode];

    UIViewController *view = [UIApplication sharedApplication].keyWindow.rootViewController;
        while (view.presentedViewController != nil && !view.presentedViewController.isBeingDismissed) {
            view = view.presentedViewController;
        }

        UIAlertController *alertController =
        [UIAlertController alertControllerWithTitle:@"Look Shortcut Keys And Status"
        message:@"Choose a basic syntax shortcut key or UIKit shortcut key"
        preferredStyle:UIAlertControllerStyleAlert];

        [alertController addAction:[UIAlertAction actionWithTitle:@"Basic Syntax Shortcut Key"
            style:UIAlertActionStyleDefault
            handler:^(UIAlertAction *action) {

                UIAlertController *alertController =
        [UIAlertController alertControllerWithTitle:@"Current Shortcut"
        message:resulttext
        preferredStyle:UIAlertControllerStyleAlert];

        [alertController addAction:[UIAlertAction actionWithTitle:@"OK"
            style:UIAlertActionStyleDefault
            handler:^(UIAlertAction *action) {
            }]];

        [view presentViewController:alertController animated:YES completion:nil];
            }]];
        [alertController addAction:[UIAlertAction actionWithTitle:@"UIKit Shortcut Key"
            style:UIAlertActionStyleDefault
            handler:^(UIAlertAction *action) {

                UIAlertController *alertController =
                [UIAlertController alertControllerWithTitle:@"Current Shortcut"
                message:uresulttext
                preferredStyle:UIAlertControllerStyleAlert];

                [alertController addAction:[UIAlertAction actionWithTitle:@"OK"
                    style:UIAlertActionStyleDefault
                    handler:^(UIAlertAction *action) {
                    }]];
                [view presentViewController:alertController animated:YES completion:nil];
            }]];
        [alertController addAction:[UIAlertAction actionWithTitle:@"Other Shortcut Key"
            style:UIAlertActionStyleDefault
            handler:^(UIAlertAction *action) {

                UIAlertController *alertController =
                [UIAlertController alertControllerWithTitle:@"Current Shortcut"
                message:oresulttext
                preferredStyle:UIAlertControllerStyleAlert];

                [alertController addAction:[UIAlertAction actionWithTitle:@"OK"
                style:UIAlertActionStyleDefault
                handler:^(UIAlertAction *action) {
                }]];
                    
                [view presentViewController:alertController animated:YES completion:nil];

         }]];
        [alertController addAction:[UIAlertAction actionWithTitle:@"Open The Preference to Change"
            style:UIAlertActionStyleDefault
            handler:^(UIAlertAction *action) {
            NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
            [[UIApplication sharedApplication] openURL:url];
            }]];
         [alertController addAction:[UIAlertAction actionWithTitle:@"Cancel"
            style:UIAlertActionStyleCancel
         handler:^(UIAlertAction *action) {
         }]];    

        [view presentViewController:alertController animated:YES completion:nil];

}
%new
-(void)hoge2:(UIButton*)button {
    UIViewController *view = [UIApplication sharedApplication].keyWindow.rootViewController;
        while (view.presentedViewController != nil && !view.presentedViewController.isBeingDismissed) {
            view = view.presentedViewController;
        }
    if(!indentm && enabled){
        UIAlertController *alertController =
        [UIAlertController alertControllerWithTitle:@"Change Mode"
        message:@"Enable Indent Mode??"
        preferredStyle:UIAlertControllerStyleAlert];

            [alertController addAction:[UIAlertAction actionWithTitle:@"Yes"
                style:UIAlertActionStyleDefault
                handler:^(UIAlertAction *action) {
                    indentm = YES;
                }]];

            [alertController addAction:[UIAlertAction actionWithTitle:@"Cancel"
                style:UIAlertActionStyleDefault
                handler:^(UIAlertAction *action) {
                }]];

        [view presentViewController:alertController animated:YES completion:nil];
    }
    else if(!enabled) {
        setting = getPrefString(@"checktext");
        ale = @"The setting cannot be changed because it is currently in standard mode.You can solve this problem by typing the keyword \"";
        ale2 = @"\" on your keyboard.";
        setresult = [NSString stringWithFormat:@"%@%@%@",ale,setting,ale2];
        UIAlertController *alertController =
        [UIAlertController alertControllerWithTitle:@"Note"
        message:setresult
        preferredStyle:UIAlertControllerStyleAlert];

        [alertController addAction:[UIAlertAction actionWithTitle:@"OK"
            style:UIAlertActionStyleDefault
            handler:^(UIAlertAction *action) {
            }]];

        [view presentViewController:alertController animated:YES completion:nil];
    }
    else if(enabled && indentm) {
        UIAlertController *alertController =
        [UIAlertController alertControllerWithTitle:@"Change Mode"
        message:@"Enable Space Mode??"
        preferredStyle:UIAlertControllerStyleAlert];

        [alertController addAction:[UIAlertAction actionWithTitle:@"Yes"
            style:UIAlertActionStyleDefault
            handler:^(UIAlertAction *action) {
                 indentm =  NO;
            }]];

        [alertController addAction:[UIAlertAction actionWithTitle:@"Cancel"
            style:UIAlertActionStyleDefault
            handler:^(UIAlertAction *action) {
           
            }]];

        [view presentViewController:alertController animated:YES completion:nil];

    }
}
%end
