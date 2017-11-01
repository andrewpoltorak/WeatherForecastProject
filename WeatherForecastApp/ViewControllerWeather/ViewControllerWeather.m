//
//  ViewControllerWeather.m
//
//
//  Created by Preferiti_mac on 20.10.17.
//
//

#import "ViewControllerWeather.h"
#import "VRGNetworkServices.h"
#import "City+CoreDataClass.h"
#import "Day+CoreDataClass.h"
#import "Weather+CoreDataClass.h"
#import "Temperature+CoreDataClass.h"
#import "ViewControllerSearchCity.h"

@interface ViewControllerWeather () <UITableViewDelegate, UITableViewDataSource, VRGServicesDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *array;
@property (nonatomic, strong) VRGNetworkServices *services;
@property (nonatomic, strong) City * name;

- (IBAction)buttonClicked:(id)sender;

@end

@implementation ViewControllerWeather

- (instancetype)initWithCity:(City *)city {
    
    self = [super init];
    if (self) {
        self.name = city;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self getWeatherForCity:self.name];
}

- (IBAction)buttonClicked:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
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

- (void) getWeatherForCity: (City *) city {
    self.services = [[VRGNetworkServices alloc] init];
    self.services.delegate = self;
    [self.services GETRequestWithString:city.name];
}

- (void)citiesLoaded:(NSArray *)array {
    self.array = array;
    [self.tableView reloadData];
}

@end
