//
//  Weather+CoreDataProperties.h
//  
//
//  Created by Preferiti_mac on 21.10.17.
//
//

#import "Weather+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Weather (CoreDataProperties)

+ (NSFetchRequest<Weather *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *descriptions;
@property (nullable, nonatomic, copy) NSString *icon;
@property (nullable, nonatomic, copy) NSString *main;
@property (nullable, nonatomic, retain) Day *day;

@end

NS_ASSUME_NONNULL_END
