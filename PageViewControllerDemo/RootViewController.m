//
//  RootViewController.m
//  PageViewControllerDemo
//
//  Created by Suresh on 2/16/17.
//  Copyright © 2017 Suresh. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.arrPageTitles = @[@"Hello",@"Welcome to my app",@"let's start"];
    self.arrPageImages =@[@"image3.png",@"image2.jpg",@"image1.jpg"];
    
    
    self.PageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
    self.PageViewController.dataSource = self;
    
    PageContentViewController *startingViewController =[self viewControllerAtIndex:0];
    NSArray *viewCotrollers = @[startingViewController];
    [self.PageViewController setViewControllers:viewCotrollers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    
    
    self.PageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-100);
    [self addChildViewController:_PageViewController];
    [self.view addSubview:_PageViewController.view];
    [self.PageViewController didMoveToParentViewController:self];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)btnStartAgain:(id)sender {
    
    PageContentViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.PageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
}


- ( UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    NSUInteger index = ((PageContentViewController *)viewController).pageIndex;
    if ( index == NSNotFound) {
        return 0;
    }
    index--;
    if (index == -1) {
        index = _arrPageTitles.count - 1;
    }
    
    return [self viewControllerAtIndex:index];
    
}
- ( UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    NSUInteger index = ((PageContentViewController *)viewController).pageIndex;
    
    if (index == NSNotFound) {
        return 0;
    }
    index++;
    if (index > [_arrPageTitles count] - 1) {
        index = 0;
    }
    
    return [self viewControllerAtIndex:index];
    
    
}
- (PageContentViewController *)viewControllerAtIndex:(NSUInteger)index{
    PageContentViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"pageContentViewController"];
    pageContentViewController.imgFile = self.arrPageImages[index];
    pageContentViewController.txtTitle = self.arrPageTitles[index];
    
    pageContentViewController.pageIndex = index;
    
    return pageContentViewController;
}
-(NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController{
    return [self.arrPageTitles count];
}
-(NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController{
    return 0;
}

@end
