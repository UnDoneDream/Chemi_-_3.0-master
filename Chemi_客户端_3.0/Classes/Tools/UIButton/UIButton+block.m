//
//  UIButton+block.m
//  Chemi_客户端_3.0
//
//  Created by ju on 16/10/11.
//  Copyright © 2016年 ju. All rights reserved.
//

#import "UIButton+block.h"

@implementation UIButton (block)

static char overviewKey;
static char buttonType;
@dynamic event;
@dynamic Type;

- (void)setType:(NSString *)Type {
    objc_setAssociatedObject(self, &buttonType, Type, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (NSString *)Type {
    NSString *Type = objc_getAssociatedObject(self, &buttonType);
    return Type;
}


- (void)handleControlEvent:(UIControlEvents)event withBlock:(ActionBlock)block {
    if (block) {
        objc_removeAssociatedObjects(self);
        objc_setAssociatedObject(self, &overviewKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
        [self addTarget:self action:@selector(callActionBlock:) forControlEvents:event];
    }
}

- (void)callActionBlock:(id)sender {
    ActionBlock block = (ActionBlock)objc_getAssociatedObject(self, &overviewKey);
    if (block) {
        block();
    }
}


@end
