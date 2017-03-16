//
//  SearchViewController.m
//  CatMaps
//
//  Created by Sofia Knezevic on 2017-02-28.
//  Copyright © 2017 Sofia Knezevic. All rights reserved.
//

#import "SearchViewController.h"
#import "URLManager.h"
#import "LocationManager.h"
#import "CatPhoto.h"

@interface SearchViewController ()<CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *searchLocationManager;


@property (weak, nonatomic) IBOutlet UITextField *searchTextField;
@property (weak, nonatomic) IBOutlet UISwitch *locationSwitch;

@property (nonatomic, assign) BOOL isAroundMe;
@property (nonatomic, strong) NSMutableArray *imagesAroundMe;

@property (nonatomic) CLLocation *myLocation;

@end

@implementation SearchViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.imagesAroundMe = [[NSMutableArray alloc] init];
    

}
- (IBAction)searchOnOrOff:(id)sender {
    
    if (![sender isOn]) {
        
        [self.searchLocationManager stopUpdatingLocation];
        self.isAroundMe = NO;
        
    }else if ([sender isOn]){
        
        [self searchItUp];
        self.isAroundMe = YES;
        
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
    
    CLLocationCoordinate2D myCoordinate;
    
    if (self.isAroundMe == YES) {
        
        myCoordinate = self.myLocation.coordinate;
        
    }else if (self.isAroundMe == NO){
        
        myCoordinate = CLLocationCoordinate2DMake(0, 0);
        
    }
    
    [URLManager getCatPhotos:taggedItems andLatitude:myCoordinate.latitude andLongitude:myCoordinate.longitude withBlock:^(NSArray *allPhotos) {
        

        for (CatPhoto *photo in allPhotos) {
            
            [self.imagesAroundMe addObject:photo];
            
            [self.searchViewControllerDelegate getArrayOfSearchedPhotos:self.imagesAroundMe];
        }
        
        [self dismissViewControllerAnimated:YES completion:nil];
        
    }];
    
}


- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    [self.searchLocationManager stopUpdatingLocation];

    self.myLocation = [locations lastObject];
    
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"%@", error);
}

@end
