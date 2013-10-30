//
//  PlugViewController.h
//  iTravelTool
//
//  Created by Rachel Mills on 29/10/2013.
//  Copyright (c) 2013 . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlugInfo.h"

@interface PlugViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *plugImage;
@property (weak, nonatomic) IBOutlet UITextField *plugType;
@property (weak, nonatomic) IBOutlet UITextField *voltage;

@property (weak, nonatomic) PlugInfo *plug;

@end
