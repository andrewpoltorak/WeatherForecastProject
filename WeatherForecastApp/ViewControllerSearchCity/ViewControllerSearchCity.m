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
#import "ViewControllerWeather.h"
#import "ViewControllerSevedCities.h"

static NSString *titleForHeader = @"City";

@interface ViewControllerSearchCity () <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, VRGServicesDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, weak) IBOutlet UISearchBar *searchBar;

@property (nonatomic, strong) NSArray *array;
@property (nonatomic, strong) VRGNetworkServices *services;

- (IBAction)saveButtonClicked:(UITableViewCell *) cell;

@end

@implementation ViewControllerSearchCity

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.searchBar.delegate = self;
    self.navigationItem.title = @"Search city";
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc]
                                   initWithTitle:@"Save"
                                   style:UIBarButtonItemStyleDone
                                   target:self
                                   action:@selector(saveButtonClicked:)];
    self.navigationItem.rightBarButtonItem = saveButton;
}

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
    NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    City *city = self.array[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@", city.name];
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    City *city = self.array[indexPath.row];
    ViewControllerWeather *viewControllerWeather = [[ViewControllerWeather alloc] initWithCity:city];
    [self.navigationController pushViewController:viewControllerWeather animated:YES];
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

- (IBAction)saveButtonClicked:(UITableViewCell *) cell {
    
    NSIndexPath * indexPath = [self.tableView indexPathForCell:cell];
    City *city = self.array[indexPath.row];
    ViewControllerSevedCities *viewControllerSaved = [[ViewControllerSevedCities alloc] initWithCityName:city];
    [self.navigationController pushViewController:viewControllerSaved animated:YES];
}

@end
