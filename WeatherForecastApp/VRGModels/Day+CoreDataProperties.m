//
//  Day+CoreDataProperties.m
//  
//
//  Created by Preferiti_mac on 30.01.18.
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
