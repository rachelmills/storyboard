//
//  WeatherData.m
//  iTravelTool
//
//  Created by Rachel Mills on 16/10/13.
//  Copyright (c) 2013 . All rights reserved.
//

#import "WeatherData.h"

@implementation WeatherData

@synthesize weatherImage = _weatherImage;

- (id)initWithImage:(UIImage *)weatherImage {
    if ((self = [super init])) {
        self.weatherImage = weatherImage;
    }
    return self;
}

@end
