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
#import "VRGSavedCitiesTableViewCell.h"
#import <MagicalRecord/MagicalRecord.h>
#import "VRGSavedCitiesCellDelegate.h"
#import "ViewControllerWeather.h"

static NSString *cellIdentifier = @"Cell";

@interface ViewControllerSavedCities () <UITableViewDelegate, UITableViewDataSource, VRGSavedCitiesCellDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *cityArray;

@end

@implementation ViewControllerSavedCities

#pragma mark - viewDidLoad

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.navigationItem.title = @"Your saved cities";
    [self.tableView registerClass:[VRGSavedCitiesTableViewCell class] forCellReuseIdentifier:cellIdentifier];
    [self.tableView reloadData];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self fetchCities];
    [self.tableView reloadData];
}

- (void)fetchCities {
    self.cityArray = [City MR_findByAttribute:@"isFavorite" withValue:@YES];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cityArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80.f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    VRGSavedCitiesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    cell.cellDelegate = self;
    City *city = self.cityArray[indexPath.row];
    [cell updateWithCity:city];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    City *city = self.cityArray[indexPath.row];
    ViewControllerWeather *viewControllerWeather = [[ViewControllerWeather alloc] initWithCity:city];
    [self.navigationController pushViewController:viewControllerWeather animated:YES];
}

#pragma mark - VRGSavedCitiesCellDelegate

- (void)deleteButtonCliked:(UITableViewCell *)cell {
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    City *city = self.cityArray[indexPath.row];
    [city setIsFavorite:NO];
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
    self.cityArray = [City MR_findByAttribute:@"isFavorite" withValue:@YES];
    [self.tableView reloadData];
}

@end
