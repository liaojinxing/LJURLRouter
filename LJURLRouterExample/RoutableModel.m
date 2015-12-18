//
//  RoutableModel.m
//  LJURLRouterExample
//
//  Created by Jinxing Liao on 12/17/15.
//  Copyright © 2015 Jinxing Liao. All rights reserved.
//

#import "RoutableModel.h"

@implementation RoutableModel

- (void)setupWithParameters:(NSDictionary *)params {
    _name = [params objectForKey:@"name"];
    NSString *json = [params objectForKey:@"json"];
    NSError *error;
    NSData *data = [json dataUsingEncoding:NSUTF8StringEncoding];
    if (data) {
        id obj = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        if (!error && obj) {
            _dictFromJSON = (NSDictionary *)obj;
        }
    }
}

@end
