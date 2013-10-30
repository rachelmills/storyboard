//
//  PlugInfoTest.m
//  iTravelTool
//
//  Created by Rachel Mills on 29/10/2013.
//  Copyright (c) 2013 . All rights reserved.
//

#import "PlugInfo.h"

@implementation PlugInfo

@synthesize plugImage = _plugImage;
@synthesize plugType = _plugType;
@synthesize voltage = _voltage;

- (id)initWithImage:(NSString *)plugImage andPlugType:(NSString *)plugType andVoltage:(NSString *)voltage
{
    if ((self = [super init])) {
        self.plugImage = plugImage;
        self.plugType = plugType;
        self.voltage = voltage;
    }
    
    return self;
}



@end
