//
//  Day+CoreDataClass.h
//  
//
//  Created by Preferiti_mac on 30.01.18.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class City, Temperature, Weather;

NS_ASSUME_NONNULL_BEGIN

@interface Day : NSManagedObject

@end

NS_ASSUME_NONNULL_END

#import "Day+CoreDataProperties.h"
