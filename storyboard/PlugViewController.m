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
	// Do any additional setup after loading the view.
    
    _plugImage.image = [UIImage imageNamed:@"AustralianPlug.png"];
    _plugType.text = @"Test";
    _voltage.text = @"240 volts";
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
