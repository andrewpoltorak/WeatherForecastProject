//
//  City+CoreDataProperties.m
//  
//
//  Created by Preferiti_mac on 30.01.18.
//
//

#import "City+CoreDataProperties.h"

@implementation City (CoreDataProperties)

+ (NSFetchRequest<City *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"City"];
}

@dynamic country;
@dynamic identifier;
@dynamic name;
@dynamic isFavorite;
@dynamic days;

@end
