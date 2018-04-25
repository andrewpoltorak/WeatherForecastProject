//
//  VRGTableViewCell.h
//  
//
//  Created by Preferiti_mac on 20.11.17.
//
//

#import <UIKit/UIKit.h>
#import "City+CoreDataClass.h"
#import "VRGCellDelegate.h"

@interface VRGTableViewCell : UITableViewCell

@property (nonatomic, weak) id <VRGCellDelegate> cellDelegate;

- (void)updateWithCity: (City *) city;

@end
