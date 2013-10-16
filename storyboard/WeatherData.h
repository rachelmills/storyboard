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

- (id)initWithImage:(UIImage *)weatherImage;

@end
