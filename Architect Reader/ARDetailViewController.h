//
//  ARDetailViewController.h
//  Architect Reader
//
//  Created by stephan.com on 3/15/14.
//  Copyright (c) 2014 stephan.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ARDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
