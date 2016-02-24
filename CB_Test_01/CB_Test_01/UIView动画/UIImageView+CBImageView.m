//
//  UIImageView+CBImageView.m
//  CB_Test_01
//
//  Created by Elaine on 16--15.
//  Copyright © 2016年 yinuo. All rights reserved.
//

#import "UIImageView+CBImageView.h"
#import <objc/runtime.h>

@implementation UIImageView (CBImageView)


- (NSString *)cui
{
    return objc_getAssociatedObject(self, @selector(cui));
}

- (void)setCui:(NSString *)cui
{
    objc_setAssociatedObject(self, @selector(cui), cui, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
