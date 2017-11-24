//
//  VRGTableViewCellSavedCities.h
//  WeatherForecastApp
//
//  Created by Preferiti_mac on 23.11.17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "City+CoreDataClass.h"

@interface VRGTableViewCellSavedCities : UITableViewCell

@property (nonatomic, strong) UIButton *deleteButton;
- (void)updateWithCity: (City *) city;

@end
