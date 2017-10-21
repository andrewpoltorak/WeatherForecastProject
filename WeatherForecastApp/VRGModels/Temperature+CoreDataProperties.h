//
//  Temperature+CoreDataProperties.h
//  
//
//  Created by Preferiti_mac on 21.10.17.
//
//

#import "Temperature+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Temperature (CoreDataProperties)

+ (NSFetchRequest<Temperature *> *)fetchRequest;

@property (nonatomic) int32_t maximum;
@property (nonatomic) int32_t minimum;
@property (nullable, nonatomic, retain) Day *day;

@end

NS_ASSUME_NONNULL_END
