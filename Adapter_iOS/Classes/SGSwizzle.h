//
//  SGSwizzle.h
//  Adapter_iOS
//
//  Created by sungrow on 2019/10/14.
//

#ifndef SGSwizzle_h
#define SGSwizzle_h

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

static inline void __sg_swizzle_full(Class oldClass, NSString *oldSelectorName,
                                         Class newClass, NSString *newSelectorName) {
    Method old = class_getInstanceMethod(oldClass, NSSelectorFromString(oldSelectorName));
    Method new = class_getInstanceMethod(newClass, NSSelectorFromString(newSelectorName));
    method_exchangeImplementations(old, new);
}

#endif /* SGSwizzle_h */
