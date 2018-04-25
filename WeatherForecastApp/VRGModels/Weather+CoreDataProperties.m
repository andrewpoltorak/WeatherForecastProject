//
//  Weather+CoreDataProperties.m
//  
//
//  Created by Preferiti_mac on 30.01.18.
//
//

#import "Weather+CoreDataProperties.h"

@implementation Weather (CoreDataProperties)

+ (NSFetchRequest<Weather *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Weather"];
}

@dynamic descriptions;
@dynamic icon;
@dynamic main;
@dynamic day;

@end
