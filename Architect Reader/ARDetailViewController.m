//
//  ARDetailViewController.m
//  Architect Reader
//
//  Created by stephan.com on 3/15/14.
//  Copyright (c) 2014 stephan.com. All rights reserved.
//

#import "ARDetailViewController.h"

@interface ARDetailViewController ()
@end

@implementation ARDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.navigationItem.title = self.title;

    NSURL *myURL = [NSURL URLWithString: [self.url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSURLRequest *request = [NSURLRequest requestWithURL:myURL];
    [self.articleView loadRequest:request];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
