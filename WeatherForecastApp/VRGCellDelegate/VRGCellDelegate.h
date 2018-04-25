//
//  VRGCellDelegate.h
//  WeatherForecastApp
//
//  Created by Preferiti_mac on 31.01.18.
//  Copyright © 2018 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol VRGCellDelegate <NSObject>

- (void)updateCityFromCell: (UITableViewCell *)cell;

@end
