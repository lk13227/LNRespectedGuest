//
//  registeredViewController.h
//  LNRespectedGuest
//
//  Created by Barry on 15/11/23.
//  Copyright © 2015年 Yun. All rights reserved.
//注册页面

#import <UIKit/UIKit.h>

typedef void (^ReturnTextBlock)(NSString *showText);

@interface registeredViewController : UIViewController

@property (nonatomic, copy) ReturnTextBlock returnTextBlock;

- (void)returnText:(ReturnTextBlock)block;

@end
