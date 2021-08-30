//
//  YZTabBarAnimatedTransitioning.m
//  YZTabbarInteractiondEMO
//
//  Created by Lester 's Mac on 2021/8/30.
//

#import "YZTabBarAnimatedTransitioning.h"

@interface YZTabBarAnimatedTransitioning ()

@property (nonatomic, assign) YZDirection direction;

@end

@implementation YZTabBarAnimatedTransitioning

- (instancetype)initWithDirection:(YZDirection)direction {
    if (self = [super init]) {
        self.direction = direction;
    }
    return self;
}



- (void)animateTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext {
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toView];
    
    CGFloat width = containerView.frame.size.width;
    CGFloat offsetX = (self.direction == YZDirectionToRight) ? width : -width;
    toView.frame = CGRectMake(offsetX, 0, containerView.frame.size.width, containerView.frame.size.height);
    toView.alpha = 0;
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        fromView.alpha = 0;
        CGFloat offsetX = (self.direction == YZDirectionToRight) ? -width : width;
        fromView.frame = CGRectMake(offsetX, 0, containerView.frame.size.width, containerView.frame.size.height);
        toView.alpha = 1.0;
        toView.frame = CGRectMake(0, 0, containerView.frame.size.width, containerView.frame.size.height);
        
        
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
    
}

- (NSTimeInterval)transitionDuration:(nullable id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.5;
}

@end
