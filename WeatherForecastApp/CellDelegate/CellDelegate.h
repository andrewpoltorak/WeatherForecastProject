//
//  CellDelegate.h
//  WeatherForecastApp
//
//  Created by Preferiti_mac on 20.11.17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CellDelegate <NSObject>

- (void) switchChanged: (UITableViewCell *) cell switchState: (BOOL) state;

@end
