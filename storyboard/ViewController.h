//
//  ViewController.h
//  storyboard
//
//  Created by . on 1/09/13.
//  Copyright (c) 2013 . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

#define DarkSkyURL @"https://api.forecast.io/forecast/"
#define API @"84f8f82d46fd524ccf2a24a5c44c8e97"
#define LAT @"/42.7243"
#define LON @",-73.6927"
#define UNITS @"?units=si"
#define fullURL  (DarkSkyURL API LAT LON UNITS)

@end
