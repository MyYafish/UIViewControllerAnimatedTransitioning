//
//  WPAnaitor.m
//  WPViewControllerTranform
//
//  Created by 吴鹏 on 16/8/22.
//  Copyright © 2016年 wupeng. All rights reserved.
//

#import "WPAnaitor.h"

@interface WPAnaitor ()

@property (nonatomic) WPAnaitorStyle style;

@end

@implementation WPAnaitor

- (id)initWithWPAnaitorStyle:(WPAnaitorStyle)style;
{
    self = [super init];
    if(self)
    {
        self.style = style;
    }
    return self;
}

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return 1;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController* toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController* fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView * containerView = [transitionContext containerView];
    
    UIView * snapShotView = [fromViewController.navigationController.view snapshotViewAfterScreenUpdates:NO];

    if(self.style == PUSH)
    {
        toViewController.view.frame = CGRectMake(CGRectGetWidth([UIScreen mainScreen].bounds),
                                                 0,
                                                 CGRectGetWidth([UIScreen mainScreen].bounds),
                                                 CGRectGetHeight([UIScreen mainScreen].bounds));
        toViewController.navigationController.navigationBar.frame = CGRectMake(CGRectGetWidth([UIScreen mainScreen].bounds),
                                                                               20,
                                                                               CGRectGetWidth([UIScreen mainScreen].bounds),
                                                                               44);
    }else
    {
        toViewController.view.frame = CGRectMake(-CGRectGetWidth([UIScreen mainScreen].bounds),
                                                 0,
                                                 CGRectGetWidth([UIScreen mainScreen].bounds),
                                                 CGRectGetHeight([UIScreen mainScreen].bounds));
        toViewController.navigationController.navigationBar.frame = CGRectMake(toViewController.view.frame.origin.x,
                                                                               20,
                                                                               CGRectGetWidth([UIScreen mainScreen].bounds),
                                                                               44);
    }
    [containerView addSubview:snapShotView];
    [containerView addSubview:toViewController.view];
    
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                     animations:^{
         
                         toViewController.view.frame = CGRectMake(0,
                                                                  0,
                                                                  CGRectGetWidth([UIScreen mainScreen].bounds),
                                                                  CGRectGetHeight([UIScreen mainScreen].bounds));
                         toViewController.navigationController.navigationBar.frame = CGRectMake(0,
                                                                                                20,
                                                                                                CGRectGetWidth([UIScreen mainScreen].bounds),
                                                                                                44);
                         if(self.style == PUSH)
                         {
                             snapShotView.center = CGPointMake(0, CGRectGetHeight([UIScreen mainScreen].bounds)/2);
                         }else
                         {
                             snapShotView.center = CGPointMake(CGRectGetWidth([UIScreen mainScreen].bounds), CGRectGetHeight([UIScreen mainScreen].bounds)/2);
                         }
       
        
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        toViewController.navigationController.navigationBar.frame = CGRectMake(0,
                                                                               20,
                                                                               CGRectGetWidth([UIScreen mainScreen].bounds),
                                                                               44);
        [snapShotView removeFromSuperview];
        
    }];
}

@end
