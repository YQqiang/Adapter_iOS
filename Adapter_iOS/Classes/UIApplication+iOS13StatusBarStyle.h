//
//  UIApplication+iOS13StatusBarStyle.h
//  Adapter_iOS
//
//  Created by sungrow on 2019/10/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIApplication (iOS13StatusBarStyle)

/**
适配状态栏样式
iOS13以前: UIStatusBarStyleDefault 的样式为 黑色
iOS13: UIStatusBarStyleDefault 样式为自动 系统决定, 且新增了UIStatusBarStyleDarkContent枚举值
YES: (setStatusBarStyle执行时)强制把 UIStatusBarStyleDefault 适配为 UIStatusBarStyleDarkContent
NO: 不适配
默认值为 YES
*/
@property (nonatomic, assign) BOOL adapterStatusBarStyleDarkContent;

@end

NS_ASSUME_NONNULL_END
