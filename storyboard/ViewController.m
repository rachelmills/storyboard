//
//  ViewController.m
//  storyboard
//
//  Created by . on 1/09/13.
//  Copyright (c) 2013 . All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *weatherIcon;
@property (weak, nonatomic) IBOutlet UILabel *temperature;
@property (weak, nonatomic) IBOutlet UIButton *weatherButton;
@property (weak, nonatomic) UIImage *weatherTomorrow;
@property (weak, nonatomic) UIImage *weatherCurrent;
@property (weak, nonatomic) IBOutlet UIImageView *weatherView;

@property (strong, nonatomic) CLLocationManager *locationManager;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view, typically from a nib.
    
    [self locateMe];
}

- (AFJSONRequestOperation *)getWeather:(CLLocation *)location
{
    NSString *latitude = [[NSString alloc] initWithFormat:@"/%f", location.coordinate.latitude];
    NSString *longitude = [[NSString alloc] initWithFormat:@",%f", location.coordinate.longitude];
    NSString *units = @"?units=si";
    
    NSString *entireURL = [NSString stringWithFormat:@"%@%@%@%@", fullURL, latitude,longitude, units];
        
    NSURL *URL=[NSURL URLWithString:entireURL];
    
    NSURLRequest *request=[NSURLRequest requestWithURL:URL];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request
                                                                                        success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
                NSDictionary *currentDaysInformation = [JSON objectForKey:@"currently"];
                
                NSString *icon = [currentDaysInformation objectForKey:@"icon"];
                NSLog(@"currently data is: %@", currentDaysInformation);
                NSNumber * number = [currentDaysInformation objectForKey:@"temperature"] ;
                NSLog(@"temperature is: %@", [NSString stringWithFormat:@"%@", [currentDaysInformation objectForKey:@"temperature"]]);
                NSLog(@"temperature is: %f", number.floatValue);
                float x = roundf(number.floatValue);
                self.temperature.text = [NSString stringWithFormat:@"%d C", (int) x];
                
                if ([icon isEqualToString:@"clear-day"]) {
                    NSLog (@"sunny");
                    _weatherCurrent = [UIImage imageNamed:@"Sun.png"];
                } else if ([icon isEqualToString:@"clear-night"]) {
                    NSLog(@"clear night");
                    _weatherCurrent = [UIImage imageNamed:@"Moon.png"];
                } else if ([icon isEqualToString:@"rain"]) {
                    NSLog(@"rain");
                    _weatherCurrent = [UIImage imageNamed:@"Umbrella.png"];
                } else if ([icon isEqualToString:@"snow"]) {
                    NSLog(@"snow");
                    _weatherCurrent = [UIImage imageNamed:@"Snowflake.png"];
                } else if ([icon isEqualToString:@"sleet"]) {
                    NSLog(@"sleet");
                    _weatherCurrent = [UIImage imageNamed:@"Sleet.png"];
                } else if ([icon isEqualToString:@"wind"]) {
                    NSLog(@"wind");
                    _weatherCurrent = [UIImage imageNamed:@"Wind.png"];
                } else if ([icon isEqualToString:@"fog"]) {
                    NSLog(@"fog");
                    _weatherCurrent = [UIImage imageNamed:@"Cloud-Fog.png"];
                } else if ([icon isEqualToString:@"cloudy"]) {
                    NSLog(@"cloudy");
                    _weatherCurrent = [UIImage imageNamed:@"Cloud.png"];
                } else if ([icon isEqualToString:@"partly-cloudy-day"]) {
                    NSLog(@"partly cloudy day");
                    _weatherCurrent = [UIImage imageNamed:@"Cloud-Sun.png"];
                } else if ([icon isEqualToString:@"partly-cloudy-night"]) {
                    NSLog(@"partly cloudy night");
                    _weatherCurrent = [UIImage imageNamed:@"Cloud-Moon.png"];
                }
                
                [_weatherButton setImage:_weatherCurrent forState:UIControlStateNormal];
                
                _weatherTomorrow = [UIImage imageNamed:@"Cloud-Moon.png"];
                
                [_weatherButton setTitle:@"Hello" forState:UIControlStateNormal];
                
                NSLog(@"weather icon is: %@", _weatherCurrent);
                
            } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
                UIAlertView * av = [[UIAlertView alloc]initWithTitle:@"Error" message:[NSString stringWithFormat:@"%@",error]delegate: nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [av show];
            }];
    return operation;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)locateMe {
    if (!self.locationManager) {
        self.locationManager = [[CLLocationManager alloc] init];
        
        self.locationManager.delegate = self;
        self.locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers;
        self.locationManager.distanceFilter = 1000;
    }
    [self.locationManager startUpdatingLocation];
}

//Delegate method
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    CLLocation* location = [locations lastObject];
    NSDate* eventDate = location.timestamp;
    NSTimeInterval howRecent = [eventDate timeIntervalSinceNow];
    NSLog(@"location is: %@ ", location);
    NSLog(@"update was:  %f ", howRecent);
    
    // Reverse Geocoding
    NSLog(@"Resolving the Address");
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];

    [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
        NSLog(@"Found placemarks: %@, error: %@", placemarks, error);
        if (error == nil && [placemarks count] > 0) {
            CLPlacemark *placemark = [placemarks objectAtIndex:0];
            placemark = [placemarks lastObject];
            
            _currentCity.text = [NSString stringWithFormat:@"%@",placemark.locality];
        } else {
            NSLog(@"%@", error.debugDescription);
        }
    } ];
    
    AFJSONRequestOperation *operation;
    operation = [self getWeather:location];
    [operation start];
   
}

- (IBAction)viewTomorrow:(id)sender {
    if (_weatherButton.currentImage == _weatherCurrent) {
        [_weatherButton setImage:_weatherTomorrow forState:UIControlStateNormal];
    } else {
        [_weatherButton setImage:_weatherCurrent forState:UIControlStateNormal];
    }
        [UIView transitionWithView:_weatherButton duration: 1.5 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{nil;
    }completion:nil];

    NSLog(@"Button has been tapped");
}
@end
