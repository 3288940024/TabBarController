//
//  TabBar.m
//  TabBarController
//
//  Created by 杨英俊 on 18-1-10.
//  Copyright © 2018年 杨英俊. All rights reserved.
//

#import "TabBar.h"
#import "UIView+Extension.h"

@implementation TabBar
{
    UIButton *_button;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.backgroundColor = [UIColor clearColor];
        [_button setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [_button setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        [self addSubview:_button];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    // 设置自定义按钮的位子
    [_button setFrame:CGRectMake(self.frame.size.width*2/5, 0, self.frame.size.width/5, self.frame.size.height)];
    
    CGFloat w = self.frame.size.width / 5;
    // 重新布局tabbar自身的tabbarItem的位子
    NSInteger index = 0;
    for (UIControl *control in self.subviews) {
        if (![control isKindOfClass:[UIControl class]] || [control isKindOfClass:[UIButton class]]) continue;
        control.w = w;
        // 第一、二个不变，第三、四个变成第四、五个，所以索引+1
        control.x = index > 1 ? w * (index + 1) : w * index;
        index ++ ;
    }
}


@end
