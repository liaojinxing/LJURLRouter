//
//  ViewController.m
//  LJControllerRouterExample
//
//  Created by Jinxing Liao on 12/14/15.
//  Copyright © 2015 Jinxing Liao. All rights reserved.
//

#import "ProfileViewController.h"


@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Profile";
    self.view.backgroundColor = [UIColor whiteColor];
    if (self.presentingViewController && [[self.navigationController.viewControllers firstObject] isEqual:self]) {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(dismissController)];
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if (self.params) {
        NSMutableString *string = [NSMutableString string];
        for (NSString *key in self.params) {
            [string appendString:[NSString stringWithFormat:@"%@ : %@\n", key, self.params[key]]];
        }
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"ProfileViewController parmas" message:string preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
        [alertController addAction:cancelAction];
        [self presentViewController:alertController animated:YES completion:nil];
    }
}

- (instancetype)initWithRouterParams:(NSDictionary *)params {
    self = [super init];
    if (self) {
        self.params = params;
    }
    return self;
}

- (void)dismissController {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
