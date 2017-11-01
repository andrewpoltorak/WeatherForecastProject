//
//  VRGNetworkServices.m
//  WeatherForecastApp
//
//  Created by Preferiti_mac on 11.10.17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import "VRGNetworkServices.h"
#import "AFNetworking.h"
#import <MagicalRecord/MagicalRecord.h>
#import "City+CoreDataClass.h"
#import "Day+CoreDataClass.h"
#import "Temperature+CoreDataClass.h"
#import "Weather+CoreDataClass.h"

@implementation VRGNetworkServices

- (void) GETRequestWithString:(NSString *)string {
    
    NSURL * url = [NSURL URLWithString:@"http://api.openweathermap.org/data/2.5/forecast"];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:[url absoluteString]
      parameters: @{ @"q" : string,
                     @"appid" : @"c8a748d3376c517affde7308e9128242" }
        progress:nil
         success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) {
             
             [[NSManagedObjectContext MR_defaultContext] MR_saveWithBlock:^(NSManagedObjectContext * _Nonnull localContext) {
                 NSDictionary *dictionary = responseObject;
                 City *city = [City MR_importFromObject: dictionary[@"city"] inContext:[NSManagedObjectContext MR_defaultContext]];
                 NSArray *dateArray = [Day MR_importFromArray: dictionary[@"list"] inContext:[NSManagedObjectContext MR_defaultContext]];
                 city.days = [NSOrderedSet orderedSetWithArray:dateArray];
                 
                 [(NSObject *)self.delegate performSelectorOnMainThread:@selector(citiesLoaded:)
                                                             withObject:@[city]
                                                          waitUntilDone:NO];
                 
             }];
             
         } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull failure) {
             NSLog(@"Error: %@", [failure localizedDescription]);
         }];
}

@end
