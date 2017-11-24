//
//  VRGTableViewCell.h
//  
//
//  Created by Preferiti_mac on 20.11.17.
//
//

#import <UIKit/UIKit.h>
#import "City+CoreDataClass.h"

@interface VRGTableViewCell : UITableViewCell

@property (nonatomic, strong) UIButton *saveButton;
- (void)updateWithCity: (City *) city;

@end
