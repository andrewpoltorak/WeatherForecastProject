//
//  City+CoreDataProperties.h
//  
//
//  Created by Preferiti_mac on 30.01.18.
//
//

#import "City+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface City (CoreDataProperties)

+ (NSFetchRequest<City *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *country;
@property (nonatomic) int64_t identifier;
@property (nullable, nonatomic, copy) NSString *name;
@property (nonatomic) BOOL isFavorite;
@property (nullable, nonatomic, retain) NSOrderedSet<Day *> *days;

@end

@interface City (CoreDataGeneratedAccessors)

- (void)insertObject:(Day *)value inDaysAtIndex:(NSUInteger)idx;
- (void)removeObjectFromDaysAtIndex:(NSUInteger)idx;
- (void)insertDays:(NSArray<Day *> *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeDaysAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInDaysAtIndex:(NSUInteger)idx withObject:(Day *)value;
- (void)replaceDaysAtIndexes:(NSIndexSet *)indexes withDays:(NSArray<Day *> *)values;
- (void)addDaysObject:(Day *)value;
- (void)removeDaysObject:(Day *)value;
- (void)addDays:(NSOrderedSet<Day *> *)values;
- (void)removeDays:(NSOrderedSet<Day *> *)values;

@end

NS_ASSUME_NONNULL_END
