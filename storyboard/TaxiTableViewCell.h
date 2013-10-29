//
//  TaxiTableViewCell.h
//  iTravelTool
//
//  Created by Rachel Mills on 29/10/2013.
//  Copyright (c) 2013 . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TaxiTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UITextView *taxiNumber;
@property (weak, nonatomic) IBOutlet UILabel *taxiName;

@end
