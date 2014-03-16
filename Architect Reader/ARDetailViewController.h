//
//  ARDetailViewController.h
//  Architect Reader
//
//  Created by stephan.com on 3/15/14.
//  Copyright (c) 2014 stephan.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ARDetailViewController : UIViewController

@property (copy, nonatomic) NSString *url;
@property (copy, nonatomic) NSString *title;
@property (strong, nonatomic) IBOutlet UIWebView *articleView;

@end
