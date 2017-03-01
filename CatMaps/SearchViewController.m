//
//  SearchViewController.m
//  CatMaps
//
//  Created by Sofia Knezevic on 2017-02-28.
//  Copyright © 2017 Sofia Knezevic. All rights reserved.
//

#import "SearchViewController.h"
#import "URLManager.h"

@interface SearchViewController ()<CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *searchLocationManager;
@property (weak, nonatomic) IBOutlet UITextField *searchTextField;
@property (weak, nonatomic) IBOutlet UISwitch *locationSwitch;

@end

@implementation SearchViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    

}
- (IBAction)searchOnOrOff:(id)sender {
    
    if (![sender isOn]) {
        
        [self.searchLocationManager stopUpdatingLocation];
        
    }else if ([sender isOn]){
        
        [self searchItUp];
        
    }
    
    
}


- (void)searchItUp
{
    self.searchLocationManager = [[CLLocationManager alloc] init];
    
    if ([self.searchLocationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        
        [self.searchLocationManager requestWhenInUseAuthorization];
    }
    
    self.searchLocationManager.delegate = self;
    [self.searchLocationManager requestLocation];
    [self.searchLocationManager startUpdatingLocation];
    

    
    
}

- (IBAction)searchButtonClicked:(id)sender {
    
    NSString *taggedItems = self.searchTextField.text;
    taggedItems = [taggedItems stringByReplacingOccurrencesOfString:@" " withString:@"%2C+"];
    
    [URLManager getCatPhotos:taggedItems withBlock:^(NSArray *catPhotos) {
        
        [self.searchViewControllerDelegate getArrayOfSearchedPhotos:[catPhotos mutableCopy]];
        
    }];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    
    NSLog(@"%@", [locations lastObject]);
    
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"%@", error);
}

@end
