//
//  WeatherData.h
//  iTravelTool
//
//  Created by Rachel Mills on 16/10/13.
//  Copyright (c) 2013 . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherData : NSObject

@property (strong) UIImage *weatherImage;
@property (strong) NSString *weatherSummary;
@property (strong) NSString *weatherTitle;
@property (strong) NSString *weatherTemp;
@property (strong) NSString *weatherPercentRain;

- (id)initWithImage:(UIImage *)weatherImage andTitle:(NSString *)weatherTitle andSummary:(NSString *) weatherSummary andTemp:(NSString *)weatherTemp andPercentRain:(NSString *)weatherPercentRain;

@end
