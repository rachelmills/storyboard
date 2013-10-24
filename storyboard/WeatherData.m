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
@synthesize weatherTitle = _weatherTitle;
@synthesize weatherSummary = _weatherSummary;
@synthesize weatherPercentRain = _weatherPercentRain;
@synthesize weatherTemp = _weatherTemp;

- (id)initWithImage:(UIImage *)weatherImage andTitle:(NSString *)weatherTitle andSummary:(NSString *)weatherSummary andTemp:(NSString *)weatherTemp andPercentRain:(NSString *)weatherPercentRain;{
    if ((self = [super init])) {
        self.weatherImage = weatherImage;
        self.weatherSummary = weatherSummary;
        self.weatherTitle = weatherTitle;
        self.weatherTemp = weatherTemp;
        self.weatherPercentRain = weatherPercentRain;
    }
    
    return self;
}

@end
