//
//  VRGNetworkServices.h
//  WeatherForecastApp
//
//  Created by Preferiti_mac on 11.10.17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Day+CoreDataClass.h"

@protocol VRGServicesDelegate <NSObject>

- (void)citiesLoaded:(NSArray *)array;

@end

@interface VRGNetworkServices : NSObject

@property (nonatomic, weak) id <VRGServicesDelegate> delegate;

- (void) GETRequestWithString:(NSString *)string;

@end
