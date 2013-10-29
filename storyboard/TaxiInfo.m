//
//  TaxiInfo.m
//  iTravelTool
//
//  Created by Rachel Mills on 28/10/2013.
//  Copyright (c) 2013 . All rights reserved.
//

#import "TaxiInfo.h"


@implementation TaxiInfo

@dynamic taxiCity;
@dynamic taxiName;
@dynamic taxiNumber;

- (id)initWithTaxiCity:(NSString *)taxiCity andTaxiName:(NSString *)taxiName andTaxiNumber:(NSString *)taxiNumber {
    if ((self = [super init])) {
        self.taxiCity = taxiCity;
        self.taxiName = taxiName;
        self.taxiNumber = taxiNumber;
    }
         return self;
}

@end
