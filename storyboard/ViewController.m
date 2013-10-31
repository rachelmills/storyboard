//
//  ViewController.m
//  storyboard
//
//  Created by . on 1/09/13.
//  Copyright (c) 2013 . All rights reserved.
//

#import "ViewController.h"
#import "WeatherData.h"
#import "TaxiInfo.h"
#import "PlugInfo.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *mapButton;

@property (weak, nonatomic) IBOutlet UIButton *currencyButton;
@property (weak, nonatomic) IBOutlet UIImageView *weatherIcon;
@property (weak, nonatomic) IBOutlet UILabel *temperature;
@property (weak, nonatomic) IBOutlet UIButton *weatherButton;
@property (weak, nonatomic) UIImage *weatherNext;
@property (weak, nonatomic) UIImage *weatherCurrent;
@property (weak, nonatomic) UIImage *weather7;
@property (weak, nonatomic) IBOutlet UIImageView *weatherView;
@property (strong, nonatomic) NSMutableArray *weatherArray;
@property (strong, nonatomic) NSMutableArray *taxiArray;
@property (strong, nonatomic) NSMutableArray *taxiArray1;
@property (strong, nonatomic) PlugInfo *plug;



@property (strong, nonatomic) CLLocationManager *locationManager;

@end

@implementation ViewController

- (NSString *)getDate
{
    NSString *formatString = [NSDateFormatter dateFormatFromTemplate:@"dd/MM/yyyy HH:mm:ss" options:0
                                                              locale:[NSLocale currentLocale]];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatString];
    
    NSString *todayString = [dateFormatter stringFromDate:[NSDate date]];
    return todayString;
}

- (void)displayMapOnButton:(CLLocation *)location
{
    [_mapView setMapType:MKMapTypeStandard];
    MKCoordinateRegion region;
    
    region.center.latitude = _location.coordinate.latitude;
    region.center.longitude = _location.coordinate.longitude;
    region.span.latitudeDelta=0.5;
    region.span.longitudeDelta=0.5;

    [_mapView setRegion:region animated:YES];
    
    [_mapView setDelegate:self];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view, typically from a nib.
    CALayer * layer = [self.currencyButton layer];
    [layer setMasksToBounds:YES];
    [layer setCornerRadius:10.0]; //when radius is 0, the border is a rectangle
    [layer setBorderWidth:1.0];
    [layer setBorderColor:[[UIColor grayColor] CGColor]];
    self.currencyButton.backgroundColor = [UIColor colorWithRed: 172.0/255.0 green: 194/255.0 blue:239.0/255.0 alpha: 1.0];
    
    CALayer * layerMap = [self.mapButton layer];
    [layerMap setMasksToBounds:YES];
    [layerMap setCornerRadius:10.0]; //when radius is 0, the border is a rectangle
    [layerMap setBorderWidth:1.0];
    [layerMap setBorderColor:[[UIColor grayColor] CGColor]];
     layerMap.backgroundColor = [[UIColor clearColor] CGColor];
    
    NSString *dateNow =  self.getDate;
    NSLog(@"date now is %@", dateNow);
    
    _updateTime.text = [NSString stringWithFormat:@"Last update:  %@", dateNow];
      
    [self locateMe];
    
    // load taxi information from plist
    NSString *myListPath = [[NSBundle mainBundle] pathForResource:@"TaxiList" ofType:@"plist"];
    self.taxiArray = [[NSMutableArray alloc]initWithContentsOfFile:myListPath];
  }

- (UIImage *)createWeatherIcon:(NSString *)icon
{
    UIImage *_weatherImage;
    if ([icon isEqualToString:@"clear-day"]) {
        NSLog (@"sunny");
        _weatherImage = [UIImage imageNamed:@"Sun.png"];
    } else if ([icon isEqualToString:@"clear-night"]) {
        NSLog(@"clear night");
        _weatherImage = [UIImage imageNamed:@"Moon.png"];
    } else if ([icon isEqualToString:@"rain"]) {
        NSLog(@"rain");
        _weatherImage = [UIImage imageNamed:@"Umbrella.png"];
    } else if ([icon isEqualToString:@"snow"]) {
        NSLog(@"snow");
        _weatherImage = [UIImage imageNamed:@"Snowflake.png"];
    } else if ([icon isEqualToString:@"sleet"]) {
        NSLog(@"sleet");
        _weatherImage = [UIImage imageNamed:@"Sleet.png"];
    } else if ([icon isEqualToString:@"wind"]) {
        NSLog(@"wind");
        _weatherImage = [UIImage imageNamed:@"Wind.png"];
    } else if ([icon isEqualToString:@"fog"]) {
        NSLog(@"fog");
        _weatherImage = [UIImage imageNamed:@"Cloud-Fog.png"];
    } else if ([icon isEqualToString:@"cloudy"]) {
        NSLog(@"cloudy");
        _weatherImage = [UIImage imageNamed:@"Cloud.png"];
    } else if ([icon isEqualToString:@"partly-cloudy-day"]) {
        NSLog(@"partly cloudy day");
        _weatherImage = [UIImage imageNamed:@"Cloud-Sun.png"];
    } else if ([icon isEqualToString:@"partly-cloudy-night"]) {
        NSLog(@"partly cloudy night");
        _weatherImage = [UIImage imageNamed:@"Cloud-Moon.png"];
    }
    return _weatherImage;
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
        NSDictionary *current = [JSON objectForKey:@"currently"];
                                                                                            
        NSDictionary *next24hours = [JSON objectForKey:@"hourly"];
        NSDictionary *next7Days = [JSON objectForKey:@"daily"];
                                                                    
        NSString *currentSummary = [current objectForKey:@"summary"];
        NSString *currentIcon = [current objectForKey:@"icon"];
        NSNumber *currentTemp = [current objectForKey:@"temperature"] ;
        NSNumber *currentPercent = [current objectForKey:@"precipProbability"];
                                                                                            
        float x = roundf(currentTemp.floatValue);
        NSString * currentTemperature = [NSString stringWithFormat:@"%d ℃", (int) x];
        float percentValue = [currentPercent floatValue] * 100;
        currentPercent = [NSNumber numberWithFloat:percentValue];
        NSString *weatherPercentRain = [NSString stringWithFormat:@"%@ %%", currentPercent];

        NSString *next24Summary = [next24hours objectForKey:@"summary"];
        NSString *next24Icon = [next24hours objectForKey:@"icon"];
        NSArray *array24Hour = [next24hours objectForKey:@"data"];
        NSDictionary *item24Hour = [array24Hour objectAtIndex:0.0];
        NSNumber *next24Percent = [item24Hour objectForKey:@"precipProbability"];
        NSNumber *next24Temp = [item24Hour objectForKey:@"temperature"];
        float y = roundf(next24Temp.floatValue);
        NSString *next24Temperature = [NSString stringWithFormat:@"%d ℃", (int) y];
        float percentValue24 = [next24Percent floatValue] * 100;
        next24Percent = [NSNumber numberWithFloat:percentValue24];
        NSString *weatherPercentRainNext24 = [NSString stringWithFormat:@"%@ %%", next24Percent];
                                                                                            
        NSString *next7DaysSummary = [next7Days objectForKey:@"summary"];
        NSArray *array7Days = [next7Days objectForKey:@"data"];
        NSDictionary *item7Days = [array7Days objectAtIndex:0.0];
        NSString *next7DaysIcon = [next7Days objectForKey:@"icon"];
        NSNumber *next7DaysTemp = [item7Days objectForKey:@"temperatureMax"];
        NSNumber *next7DaysPercent = [item7Days objectForKey:@"precipProbability"];

        float z = roundf(next7DaysTemp.floatValue);
        NSString *next7Temperature = [NSString stringWithFormat:@"%d ℃", (int) z];
        float percentValue7 = [next7DaysPercent floatValue] * 100;
        next7DaysPercent = [NSNumber numberWithFloat:percentValue7];
        NSString *weatherPercentRainNext7 = [NSString stringWithFormat:@"%@ %%", next7DaysPercent];
                                                                                            
        self.temperature.text = [NSString stringWithFormat:@"%d ℃", (int) x];
                
                _weatherCurrent = [self createWeatherIcon:currentIcon];
                _weatherNext = [self createWeatherIcon:next24Icon];
                _weather7 = [self createWeatherIcon:next7DaysIcon];
                                                                                            
                
                [_weatherButton setImage:_weatherCurrent forState:UIControlStateNormal];
                                                                                                            
                WeatherData *weatherData1 = [[WeatherData alloc] initWithImage:_weatherCurrent andTitle: @"Right now"andSummary:currentSummary andTemp:currentTemperature andPercentRain:weatherPercentRain andBGColour:[UIColor greenColor]];
                WeatherData *weatherData2 = [[WeatherData alloc] initWithImage:_weatherNext andTitle: @"Next 24 hours" andSummary:next24Summary andTemp:next24Temperature andPercentRain:weatherPercentRainNext24 andBGColour:[UIColor grayColor]];
                WeatherData *weatherData3 = [[WeatherData alloc] initWithImage:_weather7 andTitle: @"Next 7 days" andSummary:next7DaysSummary andTemp:next7Temperature andPercentRain:weatherPercentRainNext7 andBGColour:[UIColor blueColor]];
                
                self.weatherArray = [[NSMutableArray alloc] init];
                
                self.weatherArray = [NSMutableArray arrayWithObjects:weatherData1,weatherData2, weatherData3, nil];

                
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

- (void)stopUpdatingCurrentLocation
{
    [self.locationManager stopUpdatingLocation];
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
    _location = [locations lastObject];
    NSDate* eventDate = _location.timestamp;
    NSTimeInterval howRecent = [eventDate timeIntervalSinceNow];
    NSLog(@"location is: %@ ", _location);
    NSLog(@"update was:  %f ", howRecent);
    
    // Reverse Geocoding
    NSLog(@"Resolving the Address");
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    
    [geocoder reverseGeocodeLocation:_location completionHandler:^(NSArray *placemarks, NSError *error) {
        NSLog(@"Found placemarks: %@, error: %@", placemarks, error);
        if (error == nil && [placemarks count] > 0) {
            CLPlacemark *placemark = [placemarks objectAtIndex:0];
            placemark = [placemarks lastObject];
            
            _currentCity.text = [NSString stringWithFormat:@"%@",placemark.locality];
            if (placemark.locality == NULL) {
                _currentCity.text = [NSString stringWithFormat:@"%@", placemark.country];
            }
            
        } else {
            NSLog(@"%@", error.debugDescription);
        }
    } ];
    
    AFJSONRequestOperation *operation;
    operation = [self getWeather:_location];
    [operation start];
    
    [self displayMapOnButton:_location];
    [self getLocation];
    [self stopUpdatingCurrentLocation];
}

- (CLLocation *) getLocation {
    [self locateMe];
    return _location;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"WeatherSegue"]) {
        WeatherViewController *weatherViewController = (WeatherViewController *)segue.destinationViewController;
        
        weatherViewController.weatherArray1 = [[NSMutableArray alloc] initWithArray:_weatherArray];
    } else if ([segue.identifier isEqualToString:@"TaxiSegue"]) {
        TaxiViewController *taxiViewController = (TaxiViewController *)segue.destinationViewController;
        taxiViewController.taxiArray = [[NSMutableArray alloc] initWithArray:_taxiArray];
    } else if ([segue.identifier isEqualToString:@"PlugSegue"]) {
        PlugViewController *plugViewController = (PlugViewController *)segue.destinationViewController;
        plugViewController.plug = self.plug;
    }
}
    
@end
