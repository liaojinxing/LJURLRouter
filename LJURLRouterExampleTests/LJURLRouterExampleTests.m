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

- (void)testRoutableModel {
    [[LJURLRouter sharedRouter] registerURL:@"/model/:name/:json/" forClass:[RoutableModel class]];
    id instance = [[LJURLRouter sharedRouter] instanceWithRouteURL:@"/model/liao jinxing/{\"face\":\"handsome\"}"];
    XCTAssertTrue([instance isKindOfClass:[RoutableModel class]]);
    RoutableModel *model = (RoutableModel *)instance;
    XCTAssertEqualObjects(model.name, @"liao jinxing");
    XCTAssertEqual(model.dictFromJSON.allKeys.count, 1);
    XCTAssertEqualObjects([model.dictFromJSON objectForKey:@"face"], @"handsome");
}

@end
