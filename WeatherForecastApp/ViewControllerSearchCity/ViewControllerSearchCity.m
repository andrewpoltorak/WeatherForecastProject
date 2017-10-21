//
//  ViewControllerSearchCity.m
//  WeatherForecastApp
//
//  Created by Preferiti_mac on 20.10.17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import "ViewControllerSearchCity.h"
#import "VRGNetworkServices.h"
#import "City+CoreDataClass.h"
#import "Day+CoreDataClass.h"
#import "Weather+CoreDataClass.h"
#import "Temperature+CoreDataClass.h"

@interface ViewControllerSearchCity () <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, VRGServicesDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, weak) IBOutlet UISearchBar *searchBar;

@property (nonatomic, strong) NSArray *array;
@property (nonatomic, strong) VRGNetworkServices *services;

@end

@implementation ViewControllerSearchCity

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.searchBar.delegate = self;
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    City *city = self.array[section];
    return city.name;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.array.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    City *city = self.array[section];
    return city.days.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80.f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    City *city = self.array[indexPath.section];
    Day *day = city.days[indexPath.row];
    Weather *weather = [day.weathers anyObject];
    Temperature *temperature = day.temperature;
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterFullStyle];
    cell.textLabel.text = [formatter stringFromDate:day.date];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"weather: %@, min temperature: %d, max temperature: %d", weather.main, temperature.minimum, temperature.maximum];
    return cell;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    self.services = [[VRGNetworkServices alloc] init];
    self.services.delegate = self;
    [self.services GETRequestWithString:searchBar.text];
    [searchBar resignFirstResponder];
}

- (void)citiesLoaded:(NSArray *)array {
    self.array = array;
    [self.tableView reloadData];
}

@end
