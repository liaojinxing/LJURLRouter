//
//  LNControllerRouter.m
//  LJControllerRouterExample
//
//  Created by Jinxing Liao on 12/14/15.
//  Copyright © 2015 Jinxing Liao. All rights reserved.
//

#import "LJURLRouter.h"
#import "LJRouterIndexTree.h"
#import "LJRouterPath.h"
#import <objc/runtime.h>

@interface LJURLRouter ()

@property (nonatomic, strong) LJRouterIndexTree *tree;

@property (nonatomic, strong) NSString *defaultSchema;

@end

@implementation LJURLRouter

+ (instancetype)sharedRouter {
    static LJURLRouter *_sharedRouter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedRouter = [[LJURLRouter alloc] init];
    });
    return _sharedRouter;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _tree = [[LJRouterIndexTree alloc] init];
    }
    return self;
}

- (void)registerDefaultSchema:(NSString *)schema {
    _defaultSchema = schema;
}

- (void)registerURL:(NSString *)routeURL forClass:(Class)clazz {
    LJRouterPath *path = [[LJRouterPath alloc] initWithRouterURL:routeURL];
    if (!path.schema && _defaultSchema) {
        path.schema = _defaultSchema;
    }
    [self.tree insertNodeWithRoutePath:path forClass:clazz];
}

- (id)instanceWithRouteURL:(NSString *)URL {
    LJRouterPath *path = [[LJRouterPath alloc] initWithRouterURL:URL];
    if (!path.schema && _defaultSchema) {
        path.schema = _defaultSchema;
    }
    return [self.tree nodeWithRoutePath:path];
}

@end


