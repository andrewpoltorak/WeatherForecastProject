//
//  VRGTableViewCell.m
//  
//
//  Created by Preferiti_mac on 20.11.17.
//
//

#import "VRGTableViewCell.h"
#import "City+CoreDataClass.h"
#import "CellDelegate.h"

@interface VRGTableViewCell ()

@property (nonatomic, strong) UILabel * labelCity;
@property (nonatomic, strong) UISwitch * colorSwitch;

@end

@implementation VRGTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    
    CGRect frame = CGRectMake(5, 0, 100, 40);
    self.labelCity = [[UILabel alloc] initWithFrame:frame];
    self.labelCity.font = [UIFont systemFontOfSize: 16];
    self.labelCity.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:self.labelCity];
    
    self.colorSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(350, 20, 10, 10)];
    [self.colorSwitch addTarget:self action:@selector(switchDidChanged) forControlEvents:UIControlEventValueChanged];
    [self.contentView addSubview:self.colorSwitch];
}

- (void)updateWithCity: (City *) city {
    self.labelCity.text = city.name;
}

- (void) setStateSwitchInCell:(BOOL)stateSwitchInCell {
    
    _stateSwitchInCell = stateSwitchInCell;
    self.colorSwitch.on = _stateSwitchInCell;
}

- (void)switchDidChanged {
    
    [self.cellDelegate switchChanged:self switchState:self.colorSwitch.isOn];
}

@end
