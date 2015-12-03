//
//  LoginViewController.h
//  LNRespectedGuest
//
//  Created by Barry on 15/11/23.
//  Copyright © 2015年 Yun. All rights reserved.
//登录

#import <UIKit/UIKit.h>

typedef void (^ReturnTextBlock)(NSString *showText);

@interface LoginViewController : UIViewController

@property (nonatomic, copy) ReturnTextBlock returnTextBlock;

- (void)returnUser:(ReturnTextBlock)block;

@end
