//
//  ViewController.h
//  storyboard
//
//  Created by . on 1/09/13.
//  Copyright (c) 2013 . All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "WeatherViewController.h"
#import "AppDelegate.h"

#import "TaxiViewController.h"

@interface ViewController : UIViewController <CLLocationManagerDelegate>

#define DarkSkyURL @"https://api.forecast.io/forecast/"
#define API @"84f8f82d46fd524ccf2a24a5c44c8e97"
#define fullURL (DarkSkyURL API)

@property (strong, nonatomic) CLLocation *location;
@property (weak, nonatomic) IBOutlet UILabel *currentCity;


- (CLLocation *) getLocation;

- (void)locateMe;


@end
