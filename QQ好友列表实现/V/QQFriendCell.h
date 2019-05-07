//
//  QQFriendCell.h
//  QQ好友列表实现
//
//  Created by 曹记 on 2019/5/7.
//  Copyright © 2019 曹记. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface QQFriendCell : UITableViewCell
- (void)configCellWithData:(NSDictionary *)dic row:(NSInteger)row;
@end

NS_ASSUME_NONNULL_END
