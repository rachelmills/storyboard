//
//  CurrencyViewController.h
//  iTravelTool
//
//  Created by Marion Le Masson on 21/10/13.
//  Copyright (c) 2013 Marion Le Masson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CurrencyViewController : UIViewController

@property (retain, nonatomic) IBOutlet UITextField *AUD;
@property (retain, nonatomic) IBOutlet UITextField *EUR;
@property (retain, nonatomic) IBOutlet UITextField *amount;
- (IBAction)convert:(id)sender;


@end