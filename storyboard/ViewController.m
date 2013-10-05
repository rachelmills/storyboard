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
@property (weak, nonatomic) UIImage *weatherImage;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view, typically from a nib.
    
    NSURL *URL=[NSURL URLWithString:fullURL];
    NSURLRequest *request=[NSURLRequest requestWithURL:URL];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request
        success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
            NSDictionary *currentDaysInformation = [JSON objectForKey:@"currently"];
            NSString *icon = [currentDaysInformation objectForKey:@"icon"];
            NSLog(@"currently data is: %@", currentDaysInformation);
            NSInteger *number = [[currentDaysInformation objectForKey:@"temperature"] integerValue];
            NSLog(@"temperature is: %@", [NSString stringWithFormat:@"%@", [currentDaysInformation objectForKey:@"temperature"]]);
            NSLog(@"temperature is: %D", number);
            self.temperature.text = [NSString stringWithFormat:@"%d", number];
            
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
            
            [_weatherButton setImage:_weatherImage forState:UIControlStateNormal];
            
            NSLog(@"weather icon is: %@", _weatherImage);
        } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
             UIAlertView * av = [[UIAlertView alloc]initWithTitle:@"Error" message:[NSString stringWithFormat:@"%@",error]delegate: nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
             [av show];
            }];
    [operation start];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
