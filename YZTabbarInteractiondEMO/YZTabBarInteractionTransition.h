//
//  YZTabBarInteractionTransition.h
//  YZTabbarInteractiondEMO
//
//  Created by Lester 's Mac on 2021/8/30.
//

#import <UIKit/UIKit.h>
#import "TabBarViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface YZTabBarInteractionTransition : UIPercentDrivenInteractiveTransition

@property (nonatomic, assign) BOOL isInteractive;

- (instancetype)initWithVc:(TabBarViewController *)vc;

@end

NS_ASSUME_NONNULL_END
