//
//  ViewControllerWeather.m
//
//
//  Created by Preferiti_mac on 20.10.17.
//
//

#import "ViewControllerWeather.h"
#import "City+CoreDataClass.h"
#import "Day+CoreDataClass.h"
#import "Weather+CoreDataClass.h"
#import "Temperature+CoreDataClass.h"
#import "ViewControllerSearchCity.h"
#import "UIImageView+WebCache.h"

@interface ViewControllerWeather () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) City * foundCity;

@end

@implementation ViewControllerWeather

- (instancetype)initWithCity:(City *)city {
    
    self = [super init];
    if (self) {
        self.foundCity = city;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.title = @"Weathet details";
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.foundCity.days.count;
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
    Day *day = self.foundCity.days[indexPath.row];
    Weather *weather = [day.weathers anyObject];
    Temperature *temperature = day.temperature;
    NSString *icon = weather.icon;
    NSString *url = [NSString stringWithFormat:@"http://openweathermap.org/img/w/%@.png", icon];
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:url]
                      placeholderImage:[UIImage imageNamed:@"Weather.png"]];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterFullStyle];
    cell.textLabel.text = [formatter stringFromDate:day.date];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"weather: %@, min temp: %d, max temp: %d", weather.main, temperature.minimum, temperature.maximum];
    return cell;
}

@end
