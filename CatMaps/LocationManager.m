//
//  LocationManager.m
//  CatMaps
//
//  Created by Sofia Knezevic on 2017-02-28.
//  Copyright © 2017 Sofia Knezevic. All rights reserved.
//

#import "LocationManager.h"

@implementation LocationManager

+ (void)getPictureLocationData:(CatPhoto*)picture completion:(void (^)(CLLocationCoordinate2D))completion
{
    NSString *urlString = [NSString stringWithFormat:@"https://api.flickr.com/services/rest/?method=flickr.photos.geo.getLocation&api_key=0cc7ae9a26a7004b8b62ccf022169691&photo_id=%@&format=json&nojsoncallback=1", picture.photoID];
    
    NSURL *locationURL = [NSURL URLWithString:urlString];
    
    NSURLRequest *requestURL = [NSURLRequest requestWithURL:locationURL];
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *sessionConfiguration = [NSURLSession sessionWithConfiguration:configuration];
    
    NSURLSessionDataTask *dataTask = [sessionConfiguration
                                      dataTaskWithRequest:requestURL
                                      completionHandler:^
                                      (NSData * _Nullable data,
                                       NSURLResponse * _Nullable response,
                                       NSError * _Nullable error) {
                                          
                                          if (error) {
                                              
                                              NSLog(@"error: %@", error.localizedDescription);
                                              return;
                                              
                                          }
                                          
                                          NSError *jsonError = nil;
                                          
                                          NSDictionary *getThatJSON = [NSJSONSerialization
                                                                       JSONObjectWithData:data
                                                                       options:0
                                                                       error:&jsonError];
                                          
                                          if (jsonError) {
                                              
                                              NSLog(@"error: %@", jsonError.localizedDescription);
                                              return;
                                              
                                          }
                                          
                                          NSDictionary *photoDictionary = getThatJSON[@"photo"][@"photos"];
                                          
                                          NSDictionary *locationDictionary = photoDictionary[@"location"];
                                          
                                          double latitude = [locationDictionary[@"latitude"]doubleValue];
                                          double longitude = [locationDictionary[@"longitude"]doubleValue];
                                          
                                          NSLog(@"%f, %f", latitude, longitude);
                                          
                                      }];
    [dataTask resume];
}
@end
