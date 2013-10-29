//
//  PlugInfo.h
//  iTravelTool
//
//  Created by Rachel Mills on 29/10/2013.
//  Copyright (c) 2013 . All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface PlugInfo : NSManagedObject

@property (nonatomic, retain) NSString * plugImage;
@property (nonatomic, retain) NSString * plugType;
@property (nonatomic, retain) NSString * voltage;

@end
