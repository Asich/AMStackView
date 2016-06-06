//
// Created by Askar Mustafin on 6/6/16.
// Copyright (c) 2016 Crystal Spring. All rights reserved.
//

#import <ConcisePureLayout/UIView+ConcisePureLayout.h>
#import "AMStackView.h"


@interface AMStackView() {}

@property (nonatomic, strong) NSMutableArray *items;
@property (nonatomic, strong) NSLayoutConstraint *lastViewBottom;

@end

@implementation AMStackView {

}

- (void)pushView:(UIView *)view marginTop:(CGFloat)marginTop centered:(BOOL)centered {

    if (!self.items) {
        self.items = [[NSMutableArray alloc] init];
    }

    UIView *lastView = [self.items lastObject];
    if (lastView) {
        [lastView removeConstraint:self.lastViewBottom];
        [self.lastViewBottom autoRemove];
        self.lastViewBottom = nil;
    }


    [self addSubview:view];

    if (centered) {
        [view aa_centerHorizontal];
    }


    if (!lastView) {
        [view aa_superviewTop:marginTop];
    } else {
        [view aa_pinUnderView:lastView offset:marginTop];
    }


    self.lastViewBottom = [view aa_superviewBottom:marginTop];


    [self.items addObject:view];
}

@end