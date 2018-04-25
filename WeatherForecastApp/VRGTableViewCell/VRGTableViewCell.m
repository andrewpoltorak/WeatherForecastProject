//
//  VRGTableViewCell.m
//
//
//  Created by Preferiti_mac on 20.11.17.
//
//

#import "VRGTableViewCell.h"
#import "City+CoreDataClass.h"
#import <MagicalRecord/MagicalRecord.h>
#import "Masonry.h"

@interface VRGTableViewCell ()

@property (nonatomic, strong) UILabel *labelCity;
@property (nonatomic, strong) UIButton *saveButton;
@property (nonatomic, strong) City *city;

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
    self.labelCity = [[UILabel alloc] init];
    self.labelCity.font = [UIFont systemFontOfSize: 16];
    self.labelCity.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:self.labelCity];
    
    [self.labelCity mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(20));
        make.top.equalTo(@30);
    }];
    
    self.saveButton = [UIButton buttonWithType:UIButtonTypeContactAdd];
    [self.saveButton addTarget:self action:@selector(saveButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.saveButton];
    
    [self.saveButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@(-10));
        make.top.equalTo(@30);
    }];
}

- (void)updateWithCity: (City *)city {
    self.labelCity.text = city.name;
}

- (IBAction)saveButtonClicked {
    [self.cellDelegate updateCityFromCell:self];
}

@end
