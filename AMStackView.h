//
// Created by Askar Mustafin on 6/6/16.
// Copyright (c) 2016 Crystal Spring. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface AMStackView : UIView

/**
*  Push view to scrollview with margintop
*
*/
- (void)pushView:(UIView *)view marginTop:(CGFloat)marginTop centered:(BOOL)centered;

/**
*  Push view to scrollview with margintop
*
*/
- (void)pushView:(UIView *)view marginTop:(CGFloat)marginTop centered:(BOOL)centered addSeparator:(BOOL)separator;

/**
*  Remove pushed views into scrollview instead of headerview and hmsegmentedcontrol
*
*/
- (void)removeAllPushsedViews;

@end