//
//  RootViewController.h
//  PageViewControllerDemo
//
//  Created by Suresh on 2/16/17.
//  Copyright © 2017 Suresh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PageContentViewController.h"

@interface RootViewController : UIViewController<UIPageViewControllerDataSource>



@property (nonatomic,strong) UIPageViewController *PageViewController;
@property (nonatomic,strong) NSArray *arrPageTitles;
@property (nonatomic,strong) NSArray *arrPageImages;

- (PageContentViewController *)viewControllerAtIndex:(NSUInteger)index;
- (IBAction)btnStartAgain:(id)sender;



@end
