//
//  ViewControllerSearchCity.m
//  WeatherForecastApp
//
//  Created by Preferiti_mac on 20.10.17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import "ViewControllerSearchCity.h"
#import "VRGNetworkService.h"
#import "City+CoreDataClass.h"
#import "Day+CoreDataClass.h"
#import "Weather+CoreDataClass.h"
#import "Temperature+CoreDataClass.h"
#import "ViewControllerWeather.h"
#import "ViewControllerSavedCities.h"
#import "VRGTableViewCell.h"
#import <MagicalRecord/MagicalRecord.h>
#import "VRGCellDelegate.h"

static NSString *titleForHeader = @"City";
static NSString *cellIdentifier = @"Cell";

@interface ViewControllerSearchCity () <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, VRGServiceDelegate, VRGCellDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, weak) IBOutlet UISearchBar *searchBar;
@property (nonatomic, strong) NSArray *array;
@property (nonatomic, strong) VRGNetworkService *service;

@end

@implementation ViewControllerSearchCity

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.searchBar.delegate = self;
    [self.tableView registerClass:[VRGTableViewCell class] forCellReuseIdentifier:cellIdentifier];
    [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return titleForHeader;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.array.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.array.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80.f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    VRGTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    cell.cellDelegate = self;
    City *city = self.array[indexPath.row];
    [cell updateWithCity:city];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    City *city = self.array[indexPath.row];
    ViewControllerWeather *viewControllerWeather = [[ViewControllerWeather alloc] initWithCity:city];
    [self.navigationController pushViewController:viewControllerWeather animated:YES];
}

#pragma mark - SearchBarDelegate

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    self.service = [[VRGNetworkService alloc] init];
    self.service.delegate = self;
    [self.service GETRequestWithString:searchBar.text];
    [searchBar resignFirstResponder];
}

#pragma mark - VRGServiceDelegate

- (void)citiesLoaded:(NSArray *)array {
    self.array = array;
    [self.tableView reloadData];
}

#pragma mark - VRGCellDelegate

- (void)updateCityFromCell:(UITableViewCell *)cell {
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    City *city = self.array[indexPath.row];
    [city setIsFavorite:YES];
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
}

@end
