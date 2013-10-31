//
//  CurrencyViewController.m
//  iTravelTool
//
//  Created by Marion Le Masson on 21/10/13.
//  Copyright (c) 2013 Marion Le Masson. All rights reserved.
//

#import "CurrencyViewController.h"

@interface CurrencyViewController ()

@end

@implementation CurrencyViewController

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
    _amount.keyboardType = UIKeyboardTypeDecimalPad;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)convert:(id)sender {
    NSError *error;
    NSURL *rateURL = [NSURL URLWithString:@"http://quote.yahoo.com/d/quotes.csv?f=l1&s=AUDEUR=X"];
    NSString *currentRate = [[NSString alloc] initWithContentsOfURL:rateURL encoding:NSUTF8StringEncoding error:&error];
    float exchangeRate = [currentRate floatValue];
    
    float x =[[_amount text] floatValue];
    float y = x*exchangeRate;
    [_EUR setText:[NSString stringWithFormat:@"%3.2f",y]];
    [_AUD setText:[NSString stringWithFormat:@"%3.2f",x]];
    [_amount resignFirstResponder];
    
}


@end
