//
//  TaxiTableViewCell.m
//  iTravelTool
//
//  Created by Rachel Mills on 29/10/2013.
//  Copyright (c) 2013 . All rights reserved.
//

#import "TaxiTableViewCell.h"

@implementation TaxiTableViewCell

@synthesize taxiNumber;
@synthesize taxiName;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
