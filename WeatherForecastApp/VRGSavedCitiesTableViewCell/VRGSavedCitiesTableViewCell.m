//
//  VRGTableViewCellSavedCities.m
//  WeatherForecastApp
//
//  Created by Preferiti_mac on 23.11.17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import "VRGSavedCitiesTableViewCell.h"
#import "City+CoreDataClass.h"
#import <MagicalRecord/MagicalRecord.h>
#import "Masonry.h"

@interface VRGSavedCitiesTableViewCell ()

@property (nonatomic, strong) UILabel *labelCity;
@property (nonatomic, strong) UIButton *deleteButton;
@property (nonatomic, strong) NSMutableArray *cityArray;

@end

@implementation VRGSavedCitiesTableViewCell

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
    
    self.deleteButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.deleteButton setTitle:@"Delete" forState:UIControlStateNormal];
    self.deleteButton.backgroundColor = [UIColor grayColor];
    [self.deleteButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.deleteButton addTarget:self action:@selector(deleteButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.deleteButton];
    
    [self.deleteButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@(-10));
        make.top.equalTo(@30);
    }];
}

- (void)updateWithCity:(City *) city {
    if (city.isFavorite) {
        self.labelCity.text = city.name;
    }
}

- (IBAction)deleteButtonClicked {
    [self.cellDelegate deleteButtonCliked:self];
}

@end
