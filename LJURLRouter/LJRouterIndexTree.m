//
//  LJControllerIndexTree.m
//  LJControllerRouterExample
//
//  Created by Jinxing Liao on 12/14/15.
//  Copyright © 2015 Jinxing Liao. All rights reserved.
//

#import "LJRouterIndexTree.h"

@interface LJRouterIndexTree ()

@property (nonatomic, strong) NSMutableDictionary *dict;

@end

static const NSString *kLJControllerRouterClassKey = @"ljrouter_class";

@implementation LJRouterIndexTree

- (instancetype)init {
    self = [super init];
    if (self) {
        _dict = [NSMutableDictionary dictionary];
    }
    return self;
}

- (void)insertNodeWithRoutePath:(LJRouterPath *)path forClass:(Class)clazz {
    NSMutableArray *array = [NSMutableArray arrayWithArray:path.components];
    if (path.schema) {
        [array insertObject:path.schema atIndex:0];
    }
    [self insertNodeWithPathComponents:[NSArray arrayWithArray:array] forClass:clazz intoTree:self];
}

- (void)insertNodeWithPathComponents:(NSArray *)components forClass:(Class)clazz intoTree:(LJRouterIndexTree *)tree {
    if (components.count <= 0) {
        return;
    }
    NSString *firstComponent = [components firstObject];
    LJRouterIndexTree *firstTree = [tree.dict objectForKey:firstComponent];
    if (!firstTree) {
        firstTree = [[LJRouterIndexTree alloc] init];
        [tree.dict setObject:firstTree forKey:firstComponent];
    }
    if (components.count == 1) {
        [firstTree.dict setObject:clazz forKey:kLJControllerRouterClassKey];
        return;
    }
    NSMutableArray *array = [NSMutableArray arrayWithArray:components];
    [array removeObject:firstComponent];
    [self insertNodeWithPathComponents:[NSArray arrayWithArray:array] forClass:clazz intoTree:firstTree];
}

- (id)nodeWithRoutePath:(LJRouterPath *)path {
    return [self nodeWithRouterPath:path inTree:self];
}

- (id)nodeWithRouterPath:(LJRouterPath *)path inTree:(LJRouterIndexTree *)tree {
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:path.params];
    id instance = nil;
    if (path.schema) {
        id obj = [tree.dict objectForKey:path.schema];
        if (obj && [obj isKindOfClass:[LJRouterIndexTree class]]) {
            tree = (LJRouterIndexTree *)obj;
        } else {
            return nil;
        }
    }
    
    NSString *currentKey;
    int length = 0;
    for (NSString *component in path.components) {
        currentKey = nil;
        if ([tree.dict objectForKey:component]) {
            currentKey = component;
        } else {
            NSArray *allKeys = [tree.dict allKeys];
            for (NSString *key in allKeys) {
                if ([key hasPrefix:@":"]) {
                    currentKey = key;
                    [params setObject:component forKey:[key substringFromIndex:1]];
                    break;
                }
            }
        }
        if (!currentKey) {
            return nil;
        }
        id obj = [tree.dict objectForKey:currentKey];
        if ([obj isKindOfClass:[LJRouterIndexTree class]]) {
            tree = (LJRouterIndexTree *)obj;
        }
        if (length == path.components.count - 1) {
            id obj = [tree.dict objectForKey:kLJControllerRouterClassKey];
            if (obj) {
                Class clazz = (Class)obj;
                SEL INIT_SELECTOR = sel_registerName("initWithRouterParams:");
                if ([clazz instancesRespondToSelector:INIT_SELECTOR]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
                    instance = [[clazz alloc] performSelector:INIT_SELECTOR withObject:[params copy]];
#pragma clang diagnostic pop
                } else {
                    instance = [[clazz alloc] init];
                }
                return instance;
            }
        }
        length++;
    }
    return instance;
}

@end
