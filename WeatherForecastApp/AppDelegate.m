//
//  AppDelegate.m
//  WeatherForecastApp
//
//  Created by Preferiti_mac on 11.10.17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import "AppDelegate.h"
#import <MagicalRecord/MagicalRecord.h>
#import "ViewControllerSearchCity.h"
#import "ViewControllerSavedCities.h"
#import "ViewControllerWeather.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [MagicalRecord setupCoreDataStack];
    
    self.window = [UIWindow new];
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    
    ViewControllerSearchCity *viewControllerSearch = [ViewControllerSearchCity new];
    ViewControllerSavedCities *viewControllerSave = [ViewControllerSavedCities new];
    
    UINavigationController *navigationControllerSearch = [[UINavigationController alloc] initWithRootViewController:viewControllerSearch];
    UINavigationController *navigationControllerSave = [[UINavigationController alloc] initWithRootViewController:viewControllerSave];
    
    [navigationControllerSearch.tabBarItem setTitle: @"Search city tab"];
    [navigationControllerSave.tabBarItem setTitle:@"Save city tab"];
    
    navigationControllerSave.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -15);
    navigationControllerSearch.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -15);
    
    [tabBarController setViewControllers:@[navigationControllerSearch, navigationControllerSave]];
    
    self.window.rootViewController = tabBarController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    
}

- (void)applicationWillTerminate:(UIApplication *)application {
    [self saveContext];
}

#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"WeatherForecastApp"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end
