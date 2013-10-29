//
//  MapViewController.h
//  iTravelTool
//
//  Created by Brian Lam on 10/22/13.
//  Copyright (c) 2013 . All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "MapPoint.h"

#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
#define kGOOGLE_API_KEY @"AIzaSyAJd5s0RhHKOMfjZAjgUMu6iajf3t2RXL8"

@interface MapViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>
{
    CLLocationManager *locationManager;
    CLLocationCoordinate2D currentCentre;
    CLLocationCoordinate2D pathPoint;
    int currentDist;
    BOOL firstLaunch;
}

@property (strong, nonatomic) IBOutlet MKMapView *mapView;

@end
