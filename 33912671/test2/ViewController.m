//
//  ViewController.m
//  test2
//
//  Created by Bartłomiej Wojdan on 25.11.2015.
//  Copyright © 2015 Bartłomiej Wojdan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIPageViewControllerDataSource>

@property (strong, nonatomic) UIViewController *vc1;
@property (strong, nonatomic) UIViewController *vc2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    UIPageViewController *pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    
    [self addChildViewController:pageViewController];
    [self.view addSubview:pageViewController.view];
    pageViewController.view.frame = self.view.bounds;
    [pageViewController didMoveToParentViewController:self];
    
    pageViewController.dataSource = self;
    
    UIViewController *vc1 = [[UIViewController alloc] init];
    vc1.view.frame = self.view.bounds;
    vc1.view.backgroundColor = [UIColor clearColor]; // <-------
    self.vc1 = vc1;
    
    UILabel *vc1label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    [self.vc1.view addSubview:vc1label];
    vc1label.text = @"c23";
    vc1label.center = self.vc1.view.center;
    
    UIViewController *vc2 = [[UIViewController alloc] init];
    vc2.view.frame = self.view.bounds;
    vc2.view.backgroundColor = [UIColor clearColor]; // <-------
    self.vc2 = vc2;
    
    UILabel *vc2label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    [self.vc2.view addSubview:vc2label];
    vc2label.text = @"c23";
    vc2label.center = self.vc2.view.center;
    
    [pageViewController setViewControllers:@[vc1] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    if (viewController == self.vc1) {
        return self.vc2;
    }
    return nil;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
    if (viewController == self.vc2) {
        return self.vc1;
    }
    return nil;
}

@end
