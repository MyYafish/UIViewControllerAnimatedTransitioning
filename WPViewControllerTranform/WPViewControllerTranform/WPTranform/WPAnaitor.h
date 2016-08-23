//
//  WPAnaitor.h
//  WPViewControllerTranform
//
//  Created by 吴鹏 on 16/8/22.
//  Copyright © 2016年 wupeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum{
    
    PUSH = 0,
    POP     ,
    
} WPAnaitorStyle;

@interface WPAnaitor : NSObject<UIViewControllerAnimatedTransitioning>

- (id)initWithWPAnaitorStyle:(WPAnaitorStyle)style;

@end
