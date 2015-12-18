//
//  LJURLRouterExampleTests.m
//  LJURLRouterExampleTests
//
//  Created by Jinxing Liao on 12/17/15.
//  Copyright © 2015 Jinxing Liao. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LJURLRouter.h"
#import "HomeViewController.h"
#import "ProfileViewController.h"
#import "RoutableModel.h"

@interface LJURLRouterExampleTests : XCTestCase

@end

@implementation LJURLRouterExampleTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testRouteMapping {
    [[LJURLRouter sharedRouter] registerURL:@"/profile" forClass:[ProfileViewController class]];
    id instance = [[LJURLRouter sharedRouter] instanceWithRouteURL:@"/profile"];
    XCTAssertTrue([instance isKindOfClass:[ProfileViewController class]]);
}

- (void)testRouteParams {
    [[LJURLRouter sharedRouter] registerURL:@"/profile/:profile_id" forClass:[ProfileViewController class]];
    id instance = [[LJURLRouter sharedRouter] instanceWithRouteURL:@"/profile/123?param1=hello&param2=world"];
    XCTAssertTrue([instance isKindOfClass:[ProfileViewController class]]);
    ProfileViewController *controller = (ProfileViewController *)instance;
    XCTAssertEqual(controller.params.allKeys.count, 3);
    XCTAssertTrue([[controller.params objectForKey:@"profile_id"] isEqualToString:@"123"]);
    XCTAssertTrue([[controller.params objectForKey:@"param1"] isEqualToString:@"hello"]);
    XCTAssertTrue([[controller.params objectForKey:@"param2"] isEqualToString:@"world"]);
}

- (void)testRouteSchema {
    [[LJURLRouter sharedRouter] registerDefaultSchema:@"lj"];
    [[LJURLRouter sharedRouter] registerURL:@"/profile" forClass:[ProfileViewController class]];
    id instance = [[LJURLRouter sharedRouter] instanceWithRouteURL:@"lj://profile"];
    XCTAssertTrue([instance isKindOfClass:[ProfileViewController class]]);
}

- (void)testParsedParameters {
    [[LJURLRouter sharedRouter] registerURL:@"/model/:name/:json/" forClass:[RoutableModel class]];
    NSDictionary *dict;
    id instance = [[LJURLRouter sharedRouter] instanceWithRouteURL:@"/model/liao jinxing/{\"face\":\"handsome\"}" parsedParameters:&dict];
    XCTAssertTrue([instance isKindOfClass:[RoutableModel class]]);
    XCTAssertEqualObjects(dict[@"name"], @"liao jinxing");
    RoutableModel *model = (RoutableModel *)instance;
    [model setupWithParameters:dict];
    XCTAssertEqualObjects([model.dictFromJSON objectForKey:@"face"], @"handsome");
}

@end
