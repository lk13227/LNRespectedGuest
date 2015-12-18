//
//  LKTabBar.h
//  LNRespectedGuest
//
//  Created by 理念科技有限公司 on 15/12/17.
//  Copyright © 2015年 Yun. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LKTabBar;

@protocol LKTabBarDelegate <NSObject>

- (void)tabbar:(LKTabBar *)tabbar didSelectedFrom:(NSInteger)form to:(NSInteger)to;

@end

@interface LKTabBar : UIView

@property(nonatomic,weak)id<LKTabBarDelegate> delegate;

/**
 *  传普通状态和选中状态的图片，内部就帮你添加一个按钮
 *
 *  @param normalImg 未选中时的图片
 *  @param selImg    选中时的图片
 */
- (void)addTabbarBtnWithNormalImg:(NSString *)normalImg selImg:(NSString *)selImg;

@end


//自定义按钮
@interface LKTabBarButton : UIButton

@end