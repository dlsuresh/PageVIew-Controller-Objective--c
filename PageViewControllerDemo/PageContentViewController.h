//
//  PageContentViewController.h
//  PageViewControllerDemo
//
//  Created by Suresh on 2/16/17.
//  Copyright © 2017 Suresh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageContentViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *screenImage;
@property (weak, nonatomic) IBOutlet UILabel *screenLabel;


@property NSUInteger pageIndex;
@property NSString *imgFile;
@property NSString *txtTitle;

@end
