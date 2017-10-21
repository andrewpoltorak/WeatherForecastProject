//
//  Day+CoreDataClass.h
//  
//
//  Created by Preferiti_mac on 21.10.17.
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
