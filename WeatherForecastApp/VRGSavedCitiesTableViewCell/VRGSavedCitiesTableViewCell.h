//
//  VRGTableViewCellSavedCities.h
//  WeatherForecastApp
//
//  Created by Preferiti_mac on 23.11.17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "City+CoreDataClass.h"
#import "VRGSavedCitiesCellDelegate.h"

@interface VRGSavedCitiesTableViewCell : UITableViewCell

@property (nonatomic, weak) id <VRGSavedCitiesCellDelegate> cellDelegate;

- (void)updateWithCity:(City *) city;

@end
