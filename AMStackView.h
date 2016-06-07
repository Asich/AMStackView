//
// Created by Askar Mustafin on 6/6/16.
// Copyright (c) 2016 Crystal Spring. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSInteger, AMStackViewTextAlignment) {
    AMStackViewTextAlignmentDefault,
    AMStackViewTextAlignmentCenter,
    AMStackViewTextAlignmentLeft,
    AMStackViewTextAlignmentRight
};


@interface AMStackView : UIView


/**
 * Push view
 *
 * @param view
 * @param marginTop
 * @param sideMargin
 * @param textAligment
 *
 */
- (void)pushView:(UIView *)view marginTop:(CGFloat)marginTop sideMargin:(CGFloat)sideMargin textAlignment:(AMStackViewTextAlignment)textAlignment;


/**
 *  Remove pushed views
 *
 */
- (void)removeAllPushsedViews;

@end