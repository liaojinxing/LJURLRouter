//
//  ViewController.h
//  LJControllerRouterExample
//
//  Created by Jinxing Liao on 12/14/15.
//  Copyright © 2015 Jinxing Liao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LJURLRouter.h"

@interface ProfileViewController : UIViewController <LJURLRoutable>

@property (nonatomic, strong) NSDictionary *params; // for test

@end

