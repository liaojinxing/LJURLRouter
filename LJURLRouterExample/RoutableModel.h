//
//  RoutableModel.h
//  LJURLRouterExample
//
//  Created by Jinxing Liao on 12/17/15.
//  Copyright © 2015 Jinxing Liao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RoutableModel : NSObject

@property (nonatomic, strong) NSString *name;

@property (nonatomic, strong) NSDictionary *dictFromJSON;

- (void)setupWithParameters:(NSDictionary *)params;

@end
