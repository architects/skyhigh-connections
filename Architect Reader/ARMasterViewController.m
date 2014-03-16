//
//  ARMasterViewController.m
//  Architect Reader
//
//  Created by stephan.com on 3/15/14.
//  Copyright (c) 2014 stephan.com. All rights reserved.
//

#import "ARMasterViewController.h"

#import "ARDetailViewController.h"

@interface ARMasterViewController () {
    
    NSXMLParser *parser;
    NSMutableArray *feeds;
    NSMutableDictionary *item;
    NSMutableString *title;
    NSMutableString *link;
    NSString *element;

}
@end

@implementation ARMasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

	// Do any additional setup after loading the view, typically from a nib.
    
    self.navigationItem.title = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"Main Title"];

    feeds = [[NSMutableArray alloc] init];
    
    NSURL *url = [NSURL URLWithString:[[NSBundle mainBundle] objectForInfoDictionaryKey:@"RSS URL"]];
    parser = [[NSXMLParser alloc] initWithContentsOfURL:url];

    [parser setDelegate:self];
    [parser setShouldResolveExternalEntities:NO];
    [parser parse];
    
//    self.navigationItem.leftBarButtonItem = self.editButtonItem;
//
//    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
//    self.navigationItem.rightBarButtonItem = addButton;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return feeds.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    cell.textLabel.text = [[feeds objectAtIndex:indexPath.row] objectForKey:@"title"];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        NSString *url = [feeds[indexPath.row] objectForKey:@"link"];
        [[segue destinationViewController] setUrl:url];

        NSString *heading = [feeds[indexPath.row] objectForKey:@"title"];
        [[segue destinationViewController] setTitle:heading];
    }
}

#pragma mark - Parser delegates

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    
    element = elementName;
    
    if ([element isEqualToString:@"item"]) {
        item  = [[NSMutableDictionary alloc] init];
        title = [[NSMutableString alloc]     init];
        link  = [[NSMutableString alloc]     init];
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    if ([element isEqualToString:@"title"]) {
        [title appendString:string];
    } else if ([element isEqualToString:@"link"]) {
        [link appendString:string];
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    if ([elementName isEqualToString:@"item"]) {
        [item setObject:title forKey:@"title"];
        [item setObject:link forKey:@"link"];
        [feeds addObject:[item copy]];
    }
}

- (void)parserDidEndDocument:(NSXMLParser *)parser {
    [self.feedTable reloadData];
}

@end
