//
//  TabBarViewController.m
//  TabBarController
//
//  Created by 杨英俊 on 18-1-10.
//  Copyright © 2018年 杨英俊. All rights reserved.
//

#import "TabBarViewController.h"
#import "ViewController.h"
#import "TabBar.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController

+ (void)initialize {
    
    UITabBarItem *appearance = [UITabBarItem appearance];
    [appearance setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor lightGrayColor]} forState:UIControlStateNormal];
    [appearance setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor darkGrayColor]} forState:UIControlStateSelected];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 替换tabbar
    [self setValue:[[TabBar alloc] init] forKey:@"tabBar"];
    
    // 初始化子控制器
    [self initChildViewController];
}

- (void)initChildViewController {
    ViewController *one = [[ViewController alloc] init];
    one.view.backgroundColor = [UIColor redColor];
    [self setupChildViewController:one title:@"首页" image:@"tabBar_essence_icon" highImage:@"tabBar_essence_click_icon"];
    
    ViewController *two = [[ViewController alloc] init];
    two.view.backgroundColor = [UIColor orangeColor];
    [self setupChildViewController:two title:@"朋友" image:@"tabBar_friendTrends_icon" highImage:@"tabBar_friendTrends_click_icon"];
    
    ViewController *three = [[ViewController alloc] init];
    three.view.backgroundColor = [UIColor yellowColor];
    [self setupChildViewController:three title:@"我" image:@"tabBar_me_icon" highImage:@"tabBar_me_click_icon"];
    
    ViewController *four = [[ViewController alloc] init];
    four.view.backgroundColor = [UIColor greenColor];
    [self setupChildViewController:four title:@"最新" image:@"tabBar_new_icon" highImage:@"tabBar_new_click_icon"];
}

- (void)setupChildViewController:(UIViewController *)vc title:(NSString *)title image:(NSString *)image highImage:(NSString *)highImage {
    vc.tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:[UIImage imageNamed:image] selectedImage:[UIImage imageNamed:highImage]];
    [self addChildViewController:vc];
}
@end
