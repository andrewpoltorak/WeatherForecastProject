//
//  Temperature+CoreDataProperties.m
//  
//
//  Created by Preferiti_mac on 21.10.17.
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
