//
//  ViewControllerSevedCities.m
//  WeatherForecastApp
//
//  Created by Preferiti_mac on 20.10.17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import "ViewControllerSavedCities.h"
#import "City+CoreDataClass.h"
#import "ViewControllerSearchCity.h"
#import <MagicalRecord/MagicalRecord.h>
#import "VRGTableViewCellSavedCities.h"

@interface ViewControllerSavedCities () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) City *city;
@property (nonatomic, strong) NSMutableArray *cityArray;

@end

@implementation ViewControllerSavedCities

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.navigationItem.title = @"Your saved cities";
}

-(void)fetchCities {
    //self.cityArray = [NSMutableArray arrayWithArray:[City MR_findAllSortedBy:@"name" ascending:YES]];
    self.cityArray = [NSMutableArray arrayWithArray:[City MR_findAll]];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self fetchCities];
    [self.tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.cityArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80.f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = @"Cell";
    VRGTableViewCellSavedCities *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[VRGTableViewCellSavedCities alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    City * city = [self.cityArray objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@", city.name];
    return cell;
}

@end
