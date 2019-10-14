//
//  UIViewController+iOS13ModalStyle.h
//  Adapter_iOS
//
//  Created by sungrow on 2019/10/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (iOS13ModalStyle)

/**
 适配模态方式为全屏展示
 YES: 在iOS13 下 UIModalPresentationAutomatic 会更改为 UIModalPresentationFullScreen
 NO: 不强制适配模态样式的全屏展示
 默认值为 YES
 设置时机: presentViewController: animated: completion 方法之前设置.
 */
@property (nonatomic, assign) BOOL adapterModalStyleFullScreen;

/**
 当模态方式为底部弹出时,是否可以下拉关闭页面
 YES: 可以下拉关闭页面
 NO: 不能下拉关闭页面
 默认值为: NO
 */
@property (nonatomic, assign) BOOL canPullDownToDismissWhenPageSheet;

@end

NS_ASSUME_NONNULL_END
