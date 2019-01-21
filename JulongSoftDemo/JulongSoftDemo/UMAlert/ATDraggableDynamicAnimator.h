//
// Created by Alex Tkachenko on 6/2/15.
// Copyright (c) 2015 Alex Tkachenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 * Animator automatically removes view from superview when it's already behind the screen bounds
 */


@protocol SwipeDelegate <NSObject>

- (void)didFinishSwiping:(BOOL)isFinished;

@end

@interface ATDraggableDynamicAnimator : NSObject

@property (nonatomic, weak, readonly) UIView *view;
@property (nonatomic, readonly) UIDynamicAnimator *animator;
@property (nonatomic, weak, readonly) UIDynamicItemBehavior *dynamicItemBehavior;
@property (nonatomic, weak, readonly) UIGestureRecognizer *panGesture;

@property (nonatomic, weak) id <SwipeDelegate> delegate;

// View is strongly captured by internal UIKit animator object
- (instancetype)initWithView:(UIView *)view;

- (void)moveOutsideWithTheVelocity:(CGPoint)velocity;
@end
