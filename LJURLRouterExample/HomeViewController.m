//
//  GroupViewController.m
//  LJControllerRouterExample
//
//  Created by Jinxing Liao on 12/15/15.
//  Copyright © 2015 Jinxing Liao. All rights reserved.
//

#import "HomeViewController.h"
#import "UIViewController+LJRouter.h"
#import "RoutableModel.h"
#import "LJURLRouter.h"

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Home";
    
    UIButton *pushButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [pushButton setFrame:CGRectMake(10, 100, self.view.frame.size.width - 20, 40)];
    [pushButton setTitle:@"Route controller by push" forState:UIControlStateNormal];
    [pushButton setBackgroundColor:[UIColor lightGrayColor]];
    [pushButton.titleLabel setTextColor:[UIColor whiteColor]];
    [pushButton addTarget:self action:@selector(pushProfileController) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pushButton];
    
    UIButton *presentButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [presentButton setFrame:CGRectMake(10, 200, self.view.frame.size.width - 20, 40)];
    [presentButton setTitle:@"Route controller by present" forState:UIControlStateNormal];
    [presentButton setBackgroundColor:[UIColor lightGrayColor]];
    [presentButton.titleLabel setTextColor:[UIColor whiteColor]];
    [presentButton addTarget:self action:@selector(presentProfileController) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:presentButton];
    
    UIButton *instanceButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [instanceButton setFrame:CGRectMake(10, 300, self.view.frame.size.width - 20, 40)];
    [instanceButton setTitle:@"Route any instance" forState:UIControlStateNormal];
    [instanceButton setBackgroundColor:[UIColor lightGrayColor]];
    [instanceButton.titleLabel setTextColor:[UIColor whiteColor]];
    [instanceButton addTarget:self action:@selector(routeInstance) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:instanceButton];
}


- (void)pushProfileController {
    [self openURL:@"/profile/123?type=push"];
}

- (void)presentProfileController {
    [self openURL:@"lj://profile/456?type=presentNavigation" withType:LJRouteTypePresentNavigation];
}

- (void)routeInstance {
    NSDictionary *dict;
    id instance = [[LJURLRouter sharedRouter] instanceWithRouteURL:@"/model/liao jinxing/{\"face\":\"handsome\"}" parsedParameters:&dict];
    if ([instance isKindOfClass:[RoutableModel class]]) {
        [(RoutableModel *)instance setupWithParameters:dict];
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:NSStringFromClass([instance class])
                                                                                 message:[(RoutableModel *)instance name]
                                                                          preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
        [alertController addAction:cancelAction];
        [self presentViewController:alertController animated:YES completion:nil];
    }
}

@end
