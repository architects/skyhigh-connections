//
//  ARMasterViewController.h
//  Architect Reader
//
//  Created by stephan.com on 3/15/14.
//  Copyright (c) 2014 stephan.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ARMasterViewController : UITableViewController <NSXMLParserDelegate>

@property (strong, nonatomic) IBOutlet UITableView *feedTable;

@end
