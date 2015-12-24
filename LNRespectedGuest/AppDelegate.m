//
//  AppDelegate.m
//  LNRespectedGuest
//
//  Created by Barry on 15/11/17.
//  Copyright © 2015年 Yun. All rights reserved.
//

#import "AppDelegate.h"

#import "MerchantBusinessViewController.h"
#import "FriendsViewController.h"
#import "MessageViewController.h"
#import "FindViewController.h"
#import "PersonViewController.h"
//随便添加了点东西 做测试用 

@interface AppDelegate ()<UITabBarControllerDelegate,UIScrollViewDelegate>

@property(nonatomic,strong)MerchantBusinessViewController *merchantBusinessVC;
@property(nonatomic,strong)FriendsViewController *friendsVC;
@property(nonatomic,strong)MessageViewController *messageVC;
@property(nonatomic,strong)FindViewController *findVC;
@property(nonatomic,strong)PersonViewController *personVC;

@end

@implementation AppDelegate
//刘凯的修改

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //友盟
    [UMSocialData setAppKey:@"567a5007e0f55aff180021e7"];
    
    // Override point for customization after application launch.
    /*Bounds属性 拿到控件的宽高*/
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    /*添加分栏*/
    self.merchantBusinessVC = [[MerchantBusinessViewController alloc]init];
    self.merchantBusinessVC.title = @"贵人圈";
    self.merchantBusinessVC.tabBarItem.image = [UIImage imageNamed:@"tab_0"];
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60)
                                                         forBarMetrics:UIBarMetricsDefault];
    /*添加导航控制器*/
    UINavigationController *merchantBusinessNav = [[UINavigationController alloc]initWithRootViewController:self.merchantBusinessVC];
    merchantBusinessNav.navigationBar.tintColor = [UIColor whiteColor];//改变导航箭头颜色123456
    [merchantBusinessNav.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:19],
       NSForegroundColorAttributeName:[UIColor whiteColor]}];//改变导航标题颜色
    [merchantBusinessNav.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationBar_color"] forBarMetrics:UIBarMetricsDefault];
    
    /*导航栏风格--背景*/
    //businessNav.navigationBar.barStyle = UIBarStyleDefault;
    
    /*导航栏透明*/
    merchantBusinessNav.navigationBar.translucent = YES;
    
    self.friendsVC = [[FriendsViewController alloc]init];
    self.friendsVC.title = @"联系人";
    //self.merchantVC.tabBarItem.image = [[UIImage imageNamed:@"tab_1"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.friendsVC.tabBarItem.image = [UIImage imageNamed:@"tab_1"];
     //self.merchantVC.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
    UINavigationController *friendsNav = [[UINavigationController alloc]initWithRootViewController:self.friendsVC];
    friendsNav.navigationBar.tintColor = [UIColor whiteColor];//改变导航箭头颜色
    [friendsNav.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:19],
       NSForegroundColorAttributeName:[UIColor whiteColor]}];//改变导航标题颜色
    [friendsNav.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationBar_color"] forBarMetrics:UIBarMetricsDefault];
    /*导航栏透明*/
    friendsNav.navigationBar.translucent = YES;
    
    self.messageVC = [[MessageViewController  alloc]init];
    self.messageVC.title = @"消息";
    self.messageVC.tabBarItem.image = [UIImage imageNamed:@"tab_2"];
    UINavigationController *messageNav = [[UINavigationController alloc]initWithRootViewController:self.messageVC];
    messageNav.navigationBar.tintColor = [UIColor whiteColor];//改变导航箭头颜色
    [messageNav.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:19],
       NSForegroundColorAttributeName:[UIColor whiteColor]}];//改变导航标题颜色
    [messageNav.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationBar_color"] forBarMetrics:UIBarMetricsDefault];
    /*导航栏透明*/
    messageNav.navigationBar.translucent = YES;
    
    self.findVC = [[FindViewController alloc]init];
    self.findVC.title = @"发现";
    self.findVC.tabBarItem.image = [UIImage imageNamed:@"tab_3"];
    UINavigationController *findNav = [[UINavigationController alloc]initWithRootViewController:self.findVC];
    findNav.navigationBar.tintColor = [UIColor whiteColor];//改变导航箭头颜色
    [findNav.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:19],
       NSForegroundColorAttributeName:[UIColor whiteColor]}];//改变导航标题颜色
    [findNav.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationBar_color"] forBarMetrics:UIBarMetricsDefault];
    /*导航栏透明*/
    findNav.navigationBar.translucent = YES;
    
    self.personVC = [[PersonViewController alloc]init];
    self.personVC.title = @"我";
    self.personVC.tabBarItem.image = [UIImage imageNamed:@"tab_3"];
    UINavigationController *personNav = [[UINavigationController alloc]initWithRootViewController:self.personVC];
    personNav.navigationBar.tintColor = [UIColor whiteColor];//改变导航箭头颜色
    [personNav.navigationBar setTitleTextAttributes:
  @{NSFontAttributeName:[UIFont systemFontOfSize:19],
    NSForegroundColorAttributeName:[UIColor whiteColor]}];//改变导航标题颜色
    [personNav.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationBar_color"] forBarMetrics:UIBarMetricsDefault];
    /*导航栏透明*/
    personNav.navigationBar.translucent = YES;
    
    /*创建一个导航分栏控制器的对象*/
    UITabBarController *tbc = [[UITabBarController alloc]init];
    [tbc.tabBar setBackgroundImage:[UIImage imageNamed:@"navigationBar_color"]];
    
    /*把创建好的分栏添加给分栏控制器*/
    tbc.viewControllers = @[merchantBusinessNav,friendsNav,messageNav,findNav,personNav];
    /*设置分栏控制器的委托人属性*/
    tbc.delegate = self;
    self.window.rootViewController = tbc;
    [self.window makeKeyAndVisible];
    
    /*引导页*/
    NSString *stringKey = @"FirstLaunch";
    
    
    NSString *stringValue = [[NSUserDefaults standardUserDefaults]objectForKey:stringKey];
    //值为空为第一次启动
    if (stringValue == nil)
    {
        
        //隐藏状态栏
        [[UIApplication sharedApplication]setStatusBarHidden:YES];
        
        
        //加载引导页
        [self loadGuidePageView];
        //存值，下一次不加载引导页
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        
        [userDefaults setObject:@"1" forKey:stringKey];
        //同步
        [userDefaults synchronize];
    }

    
    
    return YES;
}
//加载 引导页
-(void)loadGuidePageView
{
    //引导页scrollView
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:self.window.bounds];
    //scrollView显示 内容区域
    scrollView.contentSize = CGSizeMake(self.window.frame.size.width * 4, self.window.frame.size.height);
    
    scrollView.delegate = self;
    //去掉水平滚动条
    scrollView.showsHorizontalScrollIndicator = NO;
    //去掉垂直方向的滚动条
    //scrollView.showsVerticalScrollIndicator = NO;
    
    //按页滚动
    scrollView.pagingEnabled = YES;
    scrollView.backgroundColor = [UIColor clearColor];
    
    //scrollView.backgroundColor = [UIColor redColor];
    
    //关闭弹性设置
    scrollView.bounces = NO;
    
    //添加UIImageView
    for (NSUInteger i = 0; i < 4; i++)
    {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(self.window.frame.size.width*i, 0, scrollView.frame.size.width, scrollView.frame.size.height)];
        //imageView.backgroundColor = [UIColor clearColor];
        //imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"w%ld.jpg",i+1]];
        [imageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"w%ld.jpg",i+1]]];
        
        [scrollView addSubview:imageView];
        
    }
    //放在window上,可以保证这个scrollView在self.window.rootviewcontroller这个VC上
    
    [self.window addSubview:scrollView];
    
    
    
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.x < scrollView.frame.size.width)
    {
        //关闭弹性设置
        scrollView.bounces = NO;
    }
    else
    {
        
        scrollView.bounces = YES;
    }
    if (scrollView.contentOffset.x > 3 * scrollView.frame.size.width + 40)
    {
        //显示状态栏
        [[UIApplication sharedApplication]setStatusBarHidden:NO];
        
        
        [UIView animateWithDuration:0.5 animations:^{
            //scrollView向左偏移出屏幕
            scrollView.frame = CGRectOffset(scrollView.frame, -scrollView.frame.size.width, 0);
            
        }completion:^(BOOL finished){
            [scrollView removeFromSuperview];
        }];
        [scrollView removeFromSuperview];
    }
    
    
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}


#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "LN.LNRespectedGuest" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"LNRespectedGuest" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"LNRespectedGuest.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

@end
