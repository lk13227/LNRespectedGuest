//
//  HeadView.h
//  LNRespectedGuest
//
//  Created by Barry on 15/11/29.
//  Copyright © 2015年 Yun. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HeadView;

@protocol HeadViewDelegate <NSObject>
/*选择的头视图*/
-(void)selectdWith:(HeadView *)view;
@end

@interface HeadView : UIView

/*分段*/
@property(nonatomic,assign)NSUInteger section;
/*展开*/
@property(nonatomic)BOOL isOpen;
/*返回按钮*/
@property(nonatomic,strong)UIButton *backButton;
/*设置一个委托人*/
@property(nonatomic,weak)id<HeadViewDelegate> delegate;

@end
