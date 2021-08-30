//
//  TabBarViewController.m
//  YZTabbarInteractiondEMO
//
//  Created by Lester 's Mac on 2021/8/30.
//

#import "TabBarViewController.h"
#import "YZTabBarAnimatedTransitioning.h"
#import "YZTabBarInteractionTransition.h"

@interface TabBarViewController ()<UITabBarControllerDelegate>

@property (nonatomic, strong) YZTabBarInteractionTransition *interaction;

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    self.interaction = [[YZTabBarInteractionTransition alloc] initWithVc:self];
}

- (id<UIViewControllerAnimatedTransitioning>)tabBarController:(UITabBarController *)tabBarController animationControllerForTransitionFromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    NSInteger fromIndex = [tabBarController.viewControllers indexOfObject:fromVC];
    NSInteger toIndex = [tabBarController.viewControllers indexOfObject:toVC];
    
    return [[YZTabBarAnimatedTransitioning alloc] initWithDirection:fromIndex < toIndex ? YZDirectionToRight : YZDirectionToLeft];
}

- (id<UIViewControllerInteractiveTransitioning>)tabBarController:(UITabBarController *)tabBarController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController {
    return self.interaction.isInteractive ? self.interaction : nil;
}

@end
