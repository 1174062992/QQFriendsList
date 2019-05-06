//
//  UIFont+runtime.m
//  QQ好友列表实现
//
//  Created by 曹记 on 2019/5/7.
//  Copyright © 2019 曹记. All rights reserved.
//

#import "UIFont+runtime.h"
#import <objc/runtime.h>

#define MyUIScreen 375//UI原型IPone6
@implementation UIFont (runtime)
+ (void)load {
    // 获取替换后的类方法
    Method newMethod = class_getClassMethod([self class], @selector(adjustFont:));
    // 获取替换前的类方法
    Method method = class_getClassMethod([self class], @selector(systemFontOfSize:));
    // 然后交换类方法，交换两个方法的IMP指针，(IMP代表了方法的具体的实现）
    method_exchangeImplementations(newMethod, method);
}

+ (UIFont *)adjustFont:(CGFloat)fontSize {
    UIFont *newFont = nil;
    newFont = [UIFont adjustFont:fontSize * [UIScreen mainScreen].bounds.size.width/MyUIScreen];
    return newFont;
}
@end
