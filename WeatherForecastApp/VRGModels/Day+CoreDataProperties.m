//
//  Day+CoreDataProperties.m
//  
//
//  Created by Preferiti_mac on 21.10.17.
//
//

#import "Day+CoreDataProperties.h"

@implementation Day (CoreDataProperties)

+ (NSFetchRequest<Day *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Day"];
}

@dynamic date;
@dynamic city;
@dynamic temperature;
@dynamic weathers;

@end
