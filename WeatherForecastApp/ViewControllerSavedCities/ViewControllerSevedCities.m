//
//  ViewControllerSevedCities.m
//  WeatherForecastApp
//
//  Created by Preferiti_mac on 20.10.17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import "ViewControllerSevedCities.h"
#import "City+CoreDataClass.h"
#import "ViewControllerSearchCity.h"

@interface ViewControllerSevedCities () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) City * cityFromCell;

- (IBAction)deleteCityButtonClicked:(id)sender;

@end

@implementation ViewControllerSevedCities

- (instancetype)initWithCityName:(City *)city {
    
    self = [super init];
    if (self) {
        self.cityFromCell = city;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.navigationItem.title = @"Your saved cities";
    UIBarButtonItem *deleteButton = [[UIBarButtonItem alloc]
                                   initWithTitle:@"Delete"
                                   style:UIBarButtonItemStyleDone
                                   target:self
                                   action:@selector(deleteCityButtonClicked:)];
    self.navigationItem.rightBarButtonItem = deleteButton;

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
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
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@", self.cityFromCell.name];
    return cell;
}

- (IBAction)deleteCityButtonClicked:(id)sender {
    
}

@end
