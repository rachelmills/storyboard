//
//  TaxiInfoTest.m
//  iTravelTool
//
//  Created by Rachel Mills on 28/10/2013.
//  Copyright (c) 2013 . All rights reserved.
//

#import "TaxiInfoTest.h"

@implementation TaxiInfoTest

@synthesize taxiCity = _taxiCity;
@synthesize taxiName = _taxiName;
@synthesize taxiNumber = _taxiNumber;

- (id)initWithTaxiCity:(NSString *)taxiCity andTaxiName:(NSString *)taxiName andTaxiNumber:(NSString *) taxiNumber
{
    if ((self = [super init])) {
        self.taxiCity = taxiCity;
        self.taxiName = taxiName;
        self.taxiNumber = taxiNumber;
    }
    
    return self;
}

@end
