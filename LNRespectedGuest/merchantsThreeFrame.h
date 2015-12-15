//
//  merchantsThreeFrame.h
//  LNRespectedGuest
//
//  Created by 理念科技有限公司 on 15/12/15.
//  Copyright © 2015年 Yun. All rights reserved.
//行高模型

#define NameFont 15
#define TextFont 14

//#import <Foundation/Foundation.h>
//#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>

@class merchantsThreeModel;

@interface merchantsThreeFrame : NSObject

@property (nonatomic,strong)merchantsThreeModel *threeModel;

@property (nonatomic,assign, readonly) CGRect iconFrame;
@property (nonatomic,assign, readonly) CGRect nameFrame;
@property (nonatomic,assign, readonly) CGRect vipFrame;
@property (nonatomic,assign, readonly) CGRect textFrame;
@property (nonatomic,assign, readonly) CGRect pictureFrame;

@property (nonatomic,assign, readonly) CGFloat rowHeight;

@end
