//
//  YZTabBarInteractionTransition.m
//  YZTabbarInteractiondEMO
//
//  Created by Lester 's Mac on 2021/8/30.
//

#import "YZTabBarInteractionTransition.h"

@interface YZTabBarInteractionTransition ()<UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIPanGestureRecognizer *pan;
@property (nonatomic, strong) TabBarViewController *tabBarVc;

@end

@implementation YZTabBarInteractionTransition

- (UIPanGestureRecognizer *)pan {
    if (!_pan) {
        _pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGesture:)];
        _pan.delegate = self;
        _pan.maximumNumberOfTouches = 1;
    }
    return _pan;
}

- (instancetype)initWithVc:(TabBarViewController *)vc {
    if (self = [super init]) {
        self.tabBarVc = vc;
        [self.tabBarVc.view addGestureRecognizer:self.pan];
    }
    return self;
}

- (void)panGesture:(UIPanGestureRecognizer *)pan {
    CGFloat translationX = [pan translationInView:pan.view].x;
    CGFloat velocityX = [pan velocityInView:pan.view].x;
    CGFloat progress = fabs(translationX / UIScreen.mainScreen.bounds.size.width);
    
    switch (pan.state) {
        case UIGestureRecognizerStateBegan:
        {
            self.isInteractive = YES;
            if (velocityX < 0) {
                if (self.tabBarVc.selectedIndex <= self.tabBarVc.viewControllers.count - 2) {
                    self.tabBarVc.selectedIndex += 1;
                }
                
            } else if (velocityX > 0) {
                if (self.tabBarVc.selectedIndex >= 1) {
                    self.tabBarVc.selectedIndex -= 1;
                }
            }
        }
            break;
        case UIGestureRecognizerStateChanged:
        {
            [self updateInteractiveTransition:progress];
        }
            break;
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled:
        {
            self.isInteractive = NO;
            if (progress > 0.5) {
                [self finishInteractiveTransition];
            } else {
                [self cancelInteractiveTransition];
            }
        }
            break;
        default:
            break;
    }
}

@end
