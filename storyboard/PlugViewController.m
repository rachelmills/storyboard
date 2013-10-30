//
//  PlugViewController.m
//  iTravelTool
//
//  Created by Rachel Mills on 29/10/2013.
//  Copyright (c) 2013 . All rights reserved.
//

#import "PlugViewController.h"


@interface PlugViewController ()

@end

@implementation PlugViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // load plug info from property list
    NSString *plugPath = [[NSBundle mainBundle]pathForResource:@"PlugPropertyList" ofType:@"plist"];
    NSData *plugPathXML = [[NSFileManager defaultManager] contentsAtPath:plugPath];
    NSString *errorDesc = nil;

    NSPropertyListFormat format;
    // convert static property list into array
    NSArray *temp = [NSPropertyListSerialization propertyListFromData:plugPathXML mutabilityOption:NSPropertyListMutableContainersAndLeaves format:&format errorDescription:&errorDesc];
    
    if (!temp)
    {
        NSLog(@"Error reading plist: %@, format: %d", errorDesc, format);
    }
    
    self.plug = [temp objectAtIndex:0];

    _plugImage.image = [UIImage imageNamed:[[temp objectAtIndex:0] objectForKey:@"plugImage"]];
    _plugType.text = [[temp objectAtIndex:0] objectForKey:@"plugType"];
    _voltage.text = [[temp objectAtIndex:0] objectForKey:@"voltage"];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
