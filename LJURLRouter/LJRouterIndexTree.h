//
//  LJControllerIndexTree.h
//  LJControllerRouterExample
//
//  Created by Jinxing Liao on 12/14/15.
//  Copyright © 2015 Jinxing Liao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "LJRouterPath.h"

@interface LJRouterIndexTree : NSObject

- (void)insertNodeWithRoutePath:(LJRouterPath *)path forClass:(Class)clazz;

- (id)nodeWithRoutePath:(LJRouterPath *)path parsedParameters:(NSDictionary **)parameters;

@end
