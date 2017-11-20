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

@interface ViewControllerSavedCities () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) City *city;
@property (nonatomic, strong) NSMutableArray *cityArray;

- (IBAction)deleteCityButtonClicked:(id)sender;

@end

@implementation ViewControllerSavedCities

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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    self.city = [self.cityArray objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@", self.city.name];
    return cell;
}

- (IBAction)deleteCityButtonClicked:(id)sender {
    
}

@end