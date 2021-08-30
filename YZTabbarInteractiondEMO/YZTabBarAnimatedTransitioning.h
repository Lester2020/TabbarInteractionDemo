//
//  YZTabBarAnimatedTransitioning.h
//  YZTabbarInteractiondEMO
//
//  Created by Lester 's Mac on 2021/8/30.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    YZDirectionToLeft,
    YZDirectionToRight,
} YZDirection;

@interface YZTabBarAnimatedTransitioning : NSObject<UIViewControllerAnimatedTransitioning>

- (instancetype)initWithDirection:(YZDirection)direction;

@end

