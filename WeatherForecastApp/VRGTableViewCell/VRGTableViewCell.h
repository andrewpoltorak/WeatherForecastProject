//
//  VRGTableViewCell.h
//  
//
//  Created by Preferiti_mac on 20.11.17.
//
//

#import <UIKit/UIKit.h>
#import "City+CoreDataClass.h"
#import "CellDelegate.h"

@interface VRGTableViewCell : UITableViewCell

@property (nonatomic, weak) id <CellDelegate> cellDelegate;
@property (nonatomic, assign) BOOL stateSwitchInCell;
- (void)updateWithCity: (City *) city;

@end
