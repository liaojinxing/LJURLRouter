//
//  RoutableModel.h
//  LJURLRouterExample
//
//  Created by Jinxing Liao on 12/17/15.
//  Copyright © 2015 Jinxing Liao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LJURLRouter.h"

@interface RoutableModel : NSObject <LJURLRoutable>

@property (nonatomic, strong) NSString *name;

@property (nonatomic, strong) NSDictionary *dictFromJSON;

@end
