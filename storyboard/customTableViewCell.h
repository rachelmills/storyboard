//
//  CustomTableViewCell.h
//  iTravelTool
//
//  Created by Rachel Mills on 22/10/13.
//  Copyright (c) 2013 . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *weatherImageLabel;
@property (weak, nonatomic) IBOutlet UILabel *weatherText;
@property (weak, nonatomic) IBOutlet UILabel *weatherDescription;
@property (weak, nonatomic) IBOutlet UILabel *weatherTemp;
@property (weak, nonatomic) IBOutlet UILabel *weatherPercentRain;

@end
