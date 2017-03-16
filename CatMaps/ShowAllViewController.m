//
//  ShowAllViewController.m
//  CatMaps
//
//  Created by Sofia Knezevic on 2017-03-01.
//  Copyright © 2017 Sofia Knezevic. All rights reserved.
//

#import "ShowAllViewController.h"
#import "LocationManager.h"
#import "CatPhoto.h"

@interface ShowAllViewController ()

@property (weak, nonatomic) IBOutlet MKMapView *photosLocation;

@end

@implementation ShowAllViewController

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    [self getCoordinates:self.arrayOfShowAllPhotos];
    
}

- (void)getCoordinates:(NSMutableArray *)arrayOfPictures
{
    for (CatPhoto *photo in self.arrayOfShowAllPhotos) {
        
        [LocationManager getPictureLocationData:photo completion:^(CLLocationCoordinate2D coordinates) {
            
            photo.coordinate = coordinates;
            [self addAnnotationToMap:photo];
            
        }];
        
    }
    //[self setUpMapView];
}
-(void)addAnnotationToMap: (CatPhoto *)thisCat
{
    [self.photosLocation addAnnotation:thisCat];
    
    
}

@end
