//
//  WPCoustomNavigationViewController.m
//  WPViewControllerTranform
//
//  Created by 吴鹏 on 16/8/22.
//  Copyright © 2016年 wupeng. All rights reserved.
//

#import "WPCoustomNavigationViewController.h"
#import "WPAnaitor.h"

static NSString * PushSegueIdentifier = @"push segue identifier";

@interface WPCoustomNavigationViewController ()

@property (strong, nonatomic) UIPercentDrivenInteractiveTransition * percentDrivenTransition;

@end

@implementation WPCoustomNavigationViewController

- (id)initWithRootViewController:(UIViewController *)rootViewController
{
    self = [super initWithRootViewController:rootViewController];
    if(self)
    {
        UIScreenEdgePanGestureRecognizer *edgePanGestureRecognizer = [[UIScreenEdgePanGestureRecognizer alloc]initWithTarget:self action:@selector(edgePanGesture:)];
        edgePanGestureRecognizer.edges = UIRectEdgeLeft;
        [self.view addGestureRecognizer:edgePanGestureRecognizer];
        self.delegate = self;
    }
    return self;
}

- (void)edgePanGesture:(UIScreenEdgePanGestureRecognizer*)recognizer
{
    CGFloat progress = [recognizer translationInView:self.view].x / (self.view.bounds.size.width * 1.0);
    progress = MIN(1.0, MAX(0.0, progress));
    if (recognizer.state == UIGestureRecognizerStateBegan)
    {
        self.percentDrivenTransition = [[UIPercentDrivenInteractiveTransition alloc]init];
        [self popViewControllerAnimated:YES];
    }else if (recognizer.state == UIGestureRecognizerStateChanged)
    {
        [self.percentDrivenTransition updateInteractiveTransition:progress];
    }else if (recognizer.state == UIGestureRecognizerStateCancelled || recognizer.state == UIGestureRecognizerStateEnded)
    {
        if (progress > 0.5) {
            [self.percentDrivenTransition finishInteractiveTransition];
        }else{
            [self.percentDrivenTransition cancelInteractiveTransition];
        }
        
        self.percentDrivenTransition = nil;
    }
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    if (operation == UINavigationControllerOperationPush) {
        return [[WPAnaitor alloc]initWithWPAnaitorStyle:PUSH];
    }else if(operation == UINavigationControllerOperationPop)
    {
        return [[WPAnaitor alloc]initWithWPAnaitorStyle:POP];
    }
        return nil;
}

- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController
{
    return self.percentDrivenTransition;
}



@end
