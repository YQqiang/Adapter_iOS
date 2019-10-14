//
//  UIViewController+iOS13ModalStyle.m
//  Adapter_iOS
//
//  Created by sungrow on 2019/10/14.
//

#import "UIViewController+iOS13ModalStyle.h"
#import <Adapter_iOS/SGSwizzle.h>

static const NSString *KSGAdapterModalStyleFullScreen = @"KSGAdapterModalStyleFullScreen";
static const NSString *KSGCanPullDownToDismissWhenPageSheet = @"KSGCanPullDownToDismissWhenPageSheet";

@implementation UIViewController (iOS13ModalStyle)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *oldSelector = NSStringFromSelector(@selector(modalPresentationStyle));
        NSString *newSelector = NSStringFromSelector(@selector(__sg_modalPresentationStyle));
        __sg_swizzle_full(self, oldSelector, self, newSelector);
        
        if (@available(iOS 13.0, *)) {
            oldSelector = NSStringFromSelector(@selector(isModalInPresentation));
            newSelector = NSStringFromSelector(@selector(__sg_isModalInPresentation));
            __sg_swizzle_full(self, oldSelector, self, newSelector);
        }
    });
}

- (UIModalPresentationStyle)__sg_modalPresentationStyle {
    UIModalPresentationStyle style = [self __sg_modalPresentationStyle];
    if (@available(iOS 13.0, *)) {
        BOOL isAdapter = self.adapterModalStyleFullScreen;
        isAdapter = isAdapter && (style == UIModalPresentationAutomatic || style == UIModalPresentationPageSheet);
        if (isAdapter) {
            style = UIModalPresentationFullScreen;
        }
    }
    return style;
}

- (BOOL)__sg_isModalInPresentation {
    if (!self.canPullDownToDismissWhenPageSheet) {
        return YES;
    }
    return [self __sg_isModalInPresentation];
}

#pragma mark - associated property
- (BOOL)adapterModalStyleFullScreen {
    NSNumber *number = (NSNumber *)objc_getAssociatedObject(self, &KSGAdapterModalStyleFullScreen);
    if (!number) {
        self.adapterModalStyleFullScreen = YES;
    }
    return [(NSNumber *)objc_getAssociatedObject(self, &KSGAdapterModalStyleFullScreen) boolValue];
}

- (void)setAdapterModalStyleFullScreen:(BOOL)adapterModalStyleFullScreen {
    objc_setAssociatedObject(self, &KSGAdapterModalStyleFullScreen, @(adapterModalStyleFullScreen), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)canPullDownToDismissWhenPageSheet {
    NSNumber *number = (NSNumber *)objc_getAssociatedObject(self, &KSGCanPullDownToDismissWhenPageSheet);
    if (!number) {
        self.canPullDownToDismissWhenPageSheet = NO;
    }
    return [(NSNumber *)objc_getAssociatedObject(self, &KSGCanPullDownToDismissWhenPageSheet) boolValue];
}

- (void)setCanPullDownToDismissWhenPageSheet:(BOOL)canPullDownToDismissWhenPageSheet {
    objc_setAssociatedObject(self, &KSGCanPullDownToDismissWhenPageSheet, @(canPullDownToDismissWhenPageSheet), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
