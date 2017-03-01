//
//  CatPhoto.h
//  CatMaps
//
//  Created by Sofia Knezevic on 2017-02-28.
//  Copyright © 2017 Sofia Knezevic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface CatPhoto : NSObject <MKAnnotation>

@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) NSURL *imageURL;

@property (nonatomic, strong) NSString *photoID;

@property(nonatomic) CLLocationCoordinate2D coordinate;

- (instancetype)initWithDictionary:(NSDictionary *)dictionaryOfCats;
+ (NSArray *)makePhotoArray:(NSArray *)catPhotoArray;


@end
