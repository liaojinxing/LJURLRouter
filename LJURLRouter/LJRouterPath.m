//
//  LJRouterPath.m
//  LJControllerRouterExample
//
//  Created by Jinxing Liao on 12/14/15.
//  Copyright © 2015 Jinxing Liao. All rights reserved.
//

#import "LJRouterPath.h"

@implementation LJRouterPath

- (instancetype)initWithRouterURL:(NSString *)URL {
    self = [super init];
    if (self) {
        URL = [URL stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        NSRange colonRange = [URL rangeOfString:@"://"];
        NSString *stringWithoutSchema = nil;
        if (colonRange.length == 0) {
            _schema = nil;
            stringWithoutSchema = URL;
        } else {
            _schema = [URL substringToIndex:colonRange.location];
            stringWithoutSchema = [URL substringFromIndex:colonRange.location + colonRange.length - 1];
        }
        
        NSRange markRange = [stringWithoutSchema rangeOfString:@"?"];
        NSString *componentString = nil;
        NSString *paramString = nil;
        if (markRange.length == 0) {
            componentString = stringWithoutSchema;
        } else {
            componentString = [stringWithoutSchema substringToIndex:markRange.location];
            paramString = [stringWithoutSchema substringFromIndex:markRange.location + markRange.length];
        }
        
        NSMutableArray *tempArray = [NSMutableArray array];
        NSArray *pathComponents = [componentString componentsSeparatedByString:@"/"];
        for (NSString *component in pathComponents) {
            if (component.length) {
                [tempArray addObject:component];
            }
        }
        _components = [NSArray arrayWithArray:tempArray];
        
        NSArray *queryComponents = [paramString componentsSeparatedByString:@"&"];
        NSMutableDictionary *tempDictionary = [NSMutableDictionary dictionary];
        for (NSString *queryComoponent in queryComponents) {
            NSArray *kv = [queryComoponent componentsSeparatedByString:@"="];
            if (kv.count == 2) {
                NSString *key = [kv objectAtIndex:0];
                NSString *value = [kv objectAtIndex:1];
                [tempDictionary setObject:value forKey:key];
            }
        }
        _params = [NSDictionary dictionaryWithDictionary:tempDictionary];
    }
    return self;
}

@end
