//
//  VRGTableViewCellSavedCities.m
//  WeatherForecastApp
//
//  Created by Preferiti_mac on 23.11.17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import "VRGTableViewCellSavedCities.h"
#import "City+CoreDataClass.h"
#import <MagicalRecord/MagicalRecord.h>

@interface VRGTableViewCellSavedCities ()

@property (nonatomic, strong) UILabel *labelCity;

@end

@implementation VRGTableViewCellSavedCities

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
    
    self.deleteButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.deleteButton.frame = CGRectMake(320, 30, 70, 35);
    [self.deleteButton setTitle:@"Delete" forState:UIControlStateNormal];
    self.deleteButton.backgroundColor = [UIColor grayColor];
    [self.deleteButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.contentView addSubview:self.deleteButton];
}

- (void)updateWithCity: (City *) city {
    self.labelCity.text = city.name;
}

@end
