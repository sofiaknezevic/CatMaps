//
//  ShowAllViewController.h
//  CatMaps
//
//  Created by Sofia Knezevic on 2017-03-01.
//  Copyright © 2017 Sofia Knezevic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ShowAllViewController : UIViewController <MKAnnotation>

@property (nonatomic) CLLocationCoordinate2D coordinate;
@property (nonatomic, strong) NSMutableArray *arrayOfShowAllPhotos;

@end
