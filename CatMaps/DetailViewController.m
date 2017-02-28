//
//  DetailViewController.m
//  CatMaps
//
//  Created by Sofia Knezevic on 2017-02-28.
//  Copyright © 2017 Sofia Knezevic. All rights reserved.
//

#import "DetailViewController.h"
#import "LocationManager.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *detailCat;
@property (weak, nonatomic) IBOutlet UILabel *latitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *longitudeLabel;

@property (weak, nonatomic) IBOutlet MKMapView *catLocation;

@end

@implementation DetailViewController

- (void) viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = self.photoCat.photoTitle;
    
    [LocationManager getPictureLocationData:self.photoCat completion:^(CLLocationCoordinate2D coordinate) {
        
        
        
        
    }];
    
}


@end
