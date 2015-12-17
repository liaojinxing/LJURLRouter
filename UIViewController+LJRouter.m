//
//  UIViewController.m
//  LJURLRouterExample
//
//  Created by Jinxing Liao on 12/17/15.
//  Copyright © 2015 Jinxing Liao. All rights reserved.
//

#import "UIViewController+LJRouter.h"
#import "LJURLRouter.h"

@implementation UIViewController (LJRouter)

- (BOOL)canOpenURL:(NSString *)URL {
    return [self canOpenURL:URL withType:LJRouteTypePush];
}

- (BOOL)canOpenURL:(NSString *)URL withType:(LJRouteType)type {
    if (type == LJRouteTypePush && !self.navigationController) {
        return NO;
    }
    id controller = [[LJURLRouter sharedRouter] instanceWithRouteURL:URL];
    if (controller != nil && [controller isKindOfClass:[UIViewController class]]) {
        return YES;
    }
    return NO;
}

- (void)openURL:(NSString *)URL {
    [self openURL:URL withType:LJRouteTypePush];
}

- (void)openURL:(NSString *)URL withType:(LJRouteType)type {
    [self openURL:URL withType:type animated:YES];
}

- (void)openURL:(NSString *)URL withType:(LJRouteType)type animated:(BOOL)animated {
    if (![self canOpenURL:URL withType:type]) {
        return;
    }
    UIViewController *controller = [[LJURLRouter sharedRouter] instanceWithRouteURL:URL];
    if (type == LJRouteTypePresent) {
        [self presentViewController:controller animated:animated completion:nil];
    } else if (type == LJRouteTypePresentNavigation) {
        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:controller];
        [self presentViewController:navigationController animated:YES completion:nil];
    } else if (type == LJRouteTypePush) {
        if (self.navigationController) {
            [self.navigationController pushViewController:controller animated:animated];
        }
    }
}

@end
