//
//  TaxiInfoTest.h
//  iTravelTool
//
//  Created by Rachel Mills on 28/10/2013.
//  Copyright (c) 2013 . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TaxiInfo : NSObject

@property (strong) NSString *taxiCity;
@property (strong) NSString *taxiName;
@property (strong) NSString *taxiNumber;

- (id)initWithTaxiCity:(NSString *)taxiCity andTaxiName:(NSString *)taxiName andTaxiNumber:(NSString *) andTaxiNumber;

@end
