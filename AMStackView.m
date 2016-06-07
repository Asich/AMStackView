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


@implementation AMStackView {}

- (void)pushView:(UIView *)view
       marginTop:(CGFloat)marginTop
      sideMargin:(CGFloat)sideMargin
   textAlignment:(AMStackViewTextAlignment)textAlignment {

    if (!self.items) {
        self.items = [[NSMutableArray alloc] init];
    }

    UIView *lastView = [self.items lastObject];
//    if (lastView) {
        [lastView removeConstraint:self.lastViewBottom];
        [self.lastViewBottom autoRemove];
        self.lastViewBottom = nil;
//    }


    [self addSubview:view];

    if (textAlignment == AMStackViewTextAlignmentCenter) {
        [view aa_centerHorizontal];
    } else if (textAlignment == AMStackViewTextAlignmentLeft) {
        [view aa_superviewLeft:sideMargin];
    } else if (textAlignment == AMStackViewTextAlignmentRight) {
        [view aa_superviewRight:sideMargin];
    } else if (textAlignment == AMStackViewTextAlignmentDefault) {
        [view aa_superviewLeft:0];
        [view aa_superviewRight:0];
    }


    if (!lastView) {
        [view aa_superviewTop:marginTop];
    } else {
        [view aa_pinUnderView:lastView offset:marginTop];
    }


    self.lastViewBottom = [view aa_superviewBottom:marginTop];


    [self.items addObject:view];
}

- (void)removeAllPushsedViews {
    NSMutableArray *itemsToRemove = [[NSMutableArray alloc] init];
    for (UIView *view in self.items) {
        [view removeFromSuperview];
        [itemsToRemove addObject:view];
    }
    for (UIView *view in itemsToRemove) {
        [self.items removeObject:view];
    }
}


@end