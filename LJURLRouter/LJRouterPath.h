//
//  LJRouterPath.h
//  LJControllerRouterExample
//
//  Created by Jinxing Liao on 12/14/15.
//  Copyright © 2015 Jinxing Liao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LJRouterPath : NSObject

@property (nonatomic, strong) NSString *schema;

@property (nonatomic, strong) NSArray *components;

@property (nonatomic, strong) NSDictionary *params;

- (instancetype)initWithRouterURL:(NSString *)URL;

@end
