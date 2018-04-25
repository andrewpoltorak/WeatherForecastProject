//
//  VRGNetworkService.h
//  WeatherForecastApp
//
//  Created by Preferiti_mac on 11.10.17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Day+CoreDataClass.h"

@protocol VRGServiceDelegate <NSObject>

- (void)citiesLoaded:(NSArray *)array;

@end

@interface VRGNetworkService : NSObject

@property (nonatomic, weak) id <VRGServiceDelegate> delegate;

- (void) GETRequestWithString:(NSString *)string;

@end
