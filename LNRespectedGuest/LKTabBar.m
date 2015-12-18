//
//  LKTabBar.m
//  LNRespectedGuest
//
//  Created by 理念科技有限公司 on 15/12/17.
//  Copyright © 2015年 Yun. All rights reserved.
//

#import "LKTabBar.h"

@interface LKTabBar()

/**
 *  当前选中的按钮
 */
@property(nonatomic,weak)LKTabBarButton *selectedBtn;

@end

@implementation LKTabBar

/**
 *  自定义控件
 *      1.初始化的方法，添加子控件
 *      2.layoutSubviews 布局子控件的frame
 */

/*
//调用控件init的方法时被调用 接着还会调用initWithFrame方法
- (instancetype)init{
    
}
//调用控件initWithFrame的方法时被调用
- (instancetype)initWithFrame:(CGRect)frame{
    
}
//调用控件的创建从xib/storybaord 的时候被调用
- (id)initWithFrame:(CGRect)frame
*/

- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        //初始化按钮
        //[self setupBtns];
    }
    
    return self;
}

#pragma mark - 初始化按钮
- (void)addTabbarBtnWithNormalImg:(NSString *)normalImg selImg:(NSString *)selImg{
    
    LKTabBarButton *btn = [LKTabBarButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundImage:[UIImage imageNamed:normalImg] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:selImg] forState:UIControlStateSelected];
    
    //监听事件
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    //绑定tag tag的绑定要在addSubview前
    btn.tag = self.subviews.count;
    [self addSubview:btn];
    
    //设置默认选中
    if (btn.tag == 0) {
        //btn.selected = YES;
        [self btnClick:btn];
    }
}

//- (void)setupBtns{
//    
//    //自定义的tabbar添加按钮
//    for (NSInteger i = 0; i < 5; i++) {
//        //获取普通状态的图片名称
//        NSString *normalImg = [NSString stringWithFormat:@"tab_%ld",i];
//        //获取选中图片的名称
//        NSString *selImg = [NSString stringWithFormat:@"tab_%ld",i];
//        
//        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//        [btn setBackgroundImage:[UIImage imageNamed:normalImg] forState:UIControlStateNormal];
//        [btn setBackgroundImage:[UIImage imageNamed:selImg] forState:UIControlStateSelected];
//        
//        //监听事件
//        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
//        //绑定tag
//        btn.tag = i;
//        [self addSubview:btn];
//        
//        //默认选中第一个按钮为选中
//        if (i == 0) {
//            btn.selected = YES;
//            self.selectedBtn = btn;
//        }
//        
//    }
//    
//}

//布局子控件
- (void)layoutSubviews{
    [super layoutSubviews];
    
    NSInteger count = self.subviews.count;
    
    //布局子控件
    //按钮宽度和高
    CGFloat btnW = self.bounds.size.width / count-20;
//    CGFloat btnH = self.bounds.size.height;
    
    for (NSInteger i = 0; i < count; i++) {
        //获取btn
        LKTabBarButton *btn = self.subviews[i];
        
        //设置按钮的frame
        btn.frame = CGRectMake((btnW+20) * i+20, 8, 30, 30);
    }
    
//    for (LKTabBarButton *btn in self.subviews) {
//        btn.frame = CGRectMake(btnW * btn.tag, 0, btnW, btnH);
//    }
    
}


- (void)btnClick:(LKTabBarButton *)btn{
    
    //一点击就通知代理
    if ([self.delegate respondsToSelector:@selector(tabbar:didSelectedFrom:to:)]) {
        [self.delegate tabbar:self didSelectedFrom:self.selectedBtn.tag to:btn.tag];
    }
    
    //取消之前选中
    self.selectedBtn.selected = NO;
    
    //设置当前选中
    btn.selected = YES;
    self.selectedBtn = btn;
    
}


@end

//实现自定义的按钮
@implementation LKTabBarButton

//图片高亮会调用
- (void)setHighlighted:(BOOL)highlighted{
    //只要不调用父类的方法，按钮就不会有高亮的效果
    //[super setHighlighted:highlighted];
    
}

@end