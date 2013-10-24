//
//  CustomTableViewCell.m
//  iTravelTool
//
//  Created by Rachel Mills on 22/10/13.
//  Copyright (c) 2013 . All rights reserved.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell

@synthesize weatherText;
@synthesize weatherDescription;
@synthesize weatherImageLabel;
@synthesize weatherTemp;
@synthesize weatherPercentRain;

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
