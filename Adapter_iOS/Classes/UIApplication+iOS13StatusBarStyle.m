//
//  UIApplication+iOS13StatusBarStyle.m
//  Adapter_iOS
//
//  Created by sungrow on 2019/10/14.
//

#import "UIApplication+iOS13StatusBarStyle.h"
#import <Adapter_iOS/SGSwizzle.h>

static const NSString *KSGAdapterStatusBarStyleDarkContent = @"KSGAdapterStatusBarStyleDarkContent";

@implementation UIApplication (iOS13StatusBarStyle)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *oldSelector = NSStringFromSelector(@selector(setStatusBarStyle:));
        NSString *newSelector = NSStringFromSelector(@selector(__sg_setStatusBarStyle:));
        __sg_swizzle_full(self, oldSelector, self, newSelector);
    });
}

- (void)__sg_setStatusBarStyle:(UIStatusBarStyle)statusBarStyle {
    UIStatusBarStyle style = statusBarStyle;
    if (@available(iOS 13.0, *)) {
        if (style == UIStatusBarStyleDefault) {
            style = UIStatusBarStyleDarkContent;
        }
    }
    [self __sg_setStatusBarStyle:style];
}

#pragma mark - associated property
- (BOOL)adapterStatusBarStyleDarkContent {
    NSNumber *number = (NSNumber *)objc_getAssociatedObject(self, &KSGAdapterStatusBarStyleDarkContent);
    if (!number) {
        self.adapterStatusBarStyleDarkContent = YES;
    }
    return [(NSNumber *)objc_getAssociatedObject(self, &KSGAdapterStatusBarStyleDarkContent) boolValue];
}

- (void)setAdapterStatusBarStyleDarkContent:(BOOL)adapterStatusBarStyleDarkContent {
    objc_setAssociatedObject(self, &KSGAdapterStatusBarStyleDarkContent, @(adapterStatusBarStyleDarkContent), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
