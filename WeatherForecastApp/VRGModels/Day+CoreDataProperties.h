//
//  Day+CoreDataProperties.h
//  
//
//  Created by Preferiti_mac on 21.10.17.
//
//

#import "Day+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Day (CoreDataProperties)

+ (NSFetchRequest<Day *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSDate *date;
@property (nullable, nonatomic, retain) City *city;
@property (nullable, nonatomic, retain) Temperature *temperature;
@property (nullable, nonatomic, retain) NSSet<Weather *> *weathers;

@end

@interface Day (CoreDataGeneratedAccessors)

- (void)addWeathersObject:(Weather *)value;
- (void)removeWeathersObject:(Weather *)value;
- (void)addWeathers:(NSSet<Weather *> *)values;
- (void)removeWeathers:(NSSet<Weather *> *)values;

@end

NS_ASSUME_NONNULL_END
