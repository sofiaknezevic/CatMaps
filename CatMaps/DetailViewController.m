//
//  DetailViewController.m
//  CatMaps
//
//  Created by Sofia Knezevic on 2017-02-28.
//  Copyright © 2017 Sofia Knezevic. All rights reserved.
//

#import "DetailViewController.h"
#import "LocationManager.h"
#import "URLManager.h"

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
    
    self.navigationItem.title = self.photoCat.title;
    
    [LocationManager getPictureLocationData:self.photoCat completion:^(CLLocationCoordinate2D coordinate) {
        
        self.photoCat.coordinate = coordinate;
        
        self.latitudeLabel.text = [NSString stringWithFormat:@"Latitude: %f", self.photoCat.coordinate.latitude];
        self.longitudeLabel.text = [NSString stringWithFormat:@"Longitude: %f", self.photoCat.coordinate.longitude];
        
        [self setMapView];
  
    }];
  
    
    [self configureCell];
    
    
}


- (void) configureCell
{
    [URLManager downloadCatPhotos:self.photoCat.imageURL completion:^(UIImage *image) {
        
        self.detailCat.image = image;
        
    }];
    
}

- (void) setMapView
{
    MKCoordinateSpan span = MKCoordinateSpanMake(.5f, .5f);
    self.catLocation.region = MKCoordinateRegionMake(self.photoCat.coordinate, span);
    [self.catLocation addAnnotation:self.photoCat];
    
}



@end
