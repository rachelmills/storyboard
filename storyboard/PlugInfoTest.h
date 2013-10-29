//
//  PlugInfoTest.h
//  iTravelTool
//
//  Created by Rachel Mills on 29/10/2013.
//  Copyright (c) 2013 . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PlugInfoTest : NSObject

@property (strong) NSString *plugImage;
@property (strong) NSString *plugType;
@property (strong) NSString *voltage;

- (id)initWithImage:(NSString *)plugImage andPlugType:(NSString *)plugType andVoltage:(NSString *) voltage;

@end
