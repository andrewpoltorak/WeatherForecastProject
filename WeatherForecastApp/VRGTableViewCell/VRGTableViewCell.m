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

@interface VRGTableViewCell ()

@property (nonatomic, strong) UILabel *labelCity;
@property (nonatomic, strong) UIButton *saveButton;

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
    
    self.saveButton = [UIButton buttonWithType:UIButtonTypeContactAdd];
    [self.saveButton addTarget:self action:@selector(saveButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    self.saveButton.frame = CGRectMake(380, 30, 20, 20);
    [self.contentView addSubview:self.saveButton];
}

- (void)updateWithCity: (City *) city {
    self.labelCity.text = city.name;
}

- (void)saveButtonClicked {
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
}

@end
