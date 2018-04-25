//
//  Temperature+CoreDataProperties.m
//  
//
//  Created by Preferiti_mac on 30.01.18.
//
//

#import "Temperature+CoreDataProperties.h"

@implementation Temperature (CoreDataProperties)

+ (NSFetchRequest<Temperature *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Temperature"];
}

@dynamic maximum;
@dynamic minimum;
@dynamic day;

@end
