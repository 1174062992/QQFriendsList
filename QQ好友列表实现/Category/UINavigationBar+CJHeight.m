//
//  UINavigationBar+CJHeight.m
//  QQ好友列表实现
//
//  Created by 曹记 on 2019/5/6.
//  Copyright © 2019 曹记. All rights reserved.
//

#import "UINavigationBar+CJHeight.h"

@implementation UINavigationBar (CJHeight)
/***重写导航栏高度**/
- (CGSize)sizeThatFits:(CGSize)size{
    
    return (CGSize){
        [UIScreen mainScreen].bounds.size.width,NavBarHeight
    };
}
@end
