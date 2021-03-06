//
//  TaxiViewController.m
//  iTravelTool
//
//  Created by Rachel Mills on 28/10/2013.
//  Copyright (c) 2013 . All rights reserved.
//

#import "TaxiViewController.h"
#import "TaxiInfo.h"
#import "TaxiTableViewCell.h"

@interface TaxiViewController ()

@end

@implementation TaxiViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"Array count:%d", [self.taxiArray count]);
    [self.tableView reloadData];
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.taxiArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
 
    TaxiTableViewCell *taxiCell = (TaxiTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
       taxiCell.taxiName.text = [[self.taxiArray objectAtIndex:indexPath.row] objectForKey:@"taxiName"];
    taxiCell.taxiNumber.text = [NSString stringWithFormat:@"tel: %@",[[self.taxiArray objectAtIndex:indexPath.row] objectForKey:@"taxiNumber"]];
    taxiCell.taxiNumber.dataDetectorTypes = UIDataDetectorTypePhoneNumber;
    
    return taxiCell;
}

@end
