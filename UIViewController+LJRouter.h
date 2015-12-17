//
//  UIViewController.h
//  LJURLRouterExample
//
//  Created by Jinxing Liao on 12/17/15.
//  Copyright © 2015 Jinxing Liao. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 Route type, will be used in `openURL`
 LJRouteTypePush: pushViewController in NavigationController
 LJRouteTypePresent: present the controller
 LJRouteTypePresentNavigation: present a navigation controller whose root controller match the url
 **/
typedef NS_ENUM(NSInteger, LJRouteType) {
    LJRouteTypePush,
    LJRouteTypePresent,
    LJRouteTypePresentNavigation,
};

@interface UIViewController (LJRouter)

/**
 1, check whether exists a controller class which match the URL format. return NO if not exists
 2, If exists, check whether the route type supported.
 **/
- (BOOL)canOpenURL:(NSString *)URL withType:(LJRouteType)type;

/**
 Same as [canOpenURL:URL withType:LJRouteTypePush]
 **/
- (BOOL)canOpenURL:(NSString *)URL;

/**
 Route to a controller which match the URL
 **/
- (void)openURL:(NSString *)URL withType:(LJRouteType)type animated:(BOOL)animated;

/**
 Same as [openURL:URL withType:type animated:YES]
 **/
- (void)openURL:(NSString *)URL withType:(LJRouteType)type;

/**
 Same as [openURL:URL withType:LJRouteTypePush animated:YES]
 **/
- (void)openURL:(NSString *)URL;

@end
