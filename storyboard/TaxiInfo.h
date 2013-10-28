//
//  TaxiInfo.h
//  iTravelTool
//
//  Created by Rachel Mills on 28/10/2013.
//  Copyright (c) 2013 . All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface TaxiInfo : NSManagedObject

@property (nonatomic, retain) NSString * taxiCity;
@property (nonatomic, retain) NSString * taxiName;
@property (nonatomic, retain) NSString * taxiNumber;

@end
