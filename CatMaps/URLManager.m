//
//  URLManager.m
//  CatMaps
//
//  Created by Sofia Knezevic on 2017-02-28.
//  Copyright © 2017 Sofia Knezevic. All rights reserved.
//

#import "URLManager.h"
#import "CatPhoto.h"

#warning this class could be named better!!
@implementation URLManager

- (void)getCatPhotos:(void (^)(NSArray *))completion
{
    
    NSURL *catURL = [NSURL URLWithString:@"https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=0cc7ae9a26a7004b8b62ccf022169691&tags=cat&has_geo=1&extras=url_m&format=json&nojsoncallback=1"];
    
    NSURLRequest *requestURL = [NSURLRequest requestWithURL:catURL];
    
    NSURLSessionConfiguration *configure = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *configureSession = [NSURLSession sessionWithConfiguration:configure];
    
    NSURLSessionDataTask *dataTask = [configureSession
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
                                          
                                          NSArray *pictures = getThatJSON[@"photos"][@"photo"];
                                          
                                          NSArray *photosArray = [CatPhoto makePhotoArray:pictures];
                                          
                                          [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                                              completion(photosArray);
                                          }];
                                          
                                          
                                      }];
    
    
    [dataTask resume];
    
    
}

#warning this can be refactored better, possibly a category? definitely a class method if not.
- (void)downloadCatPhotos:(NSURL *)url completion:(void (^)(UIImage *))completion
{
    
    
    NSURLSessionConfiguration *configure = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *configureSession = [NSURLSession sessionWithConfiguration:configure];
    
    
    NSURLSessionDownloadTask *downloadCatPhotos = [configureSession
                                                   downloadTaskWithURL:url
                                                   completionHandler:^(NSURL * _Nullable location,
                                                                       NSURLResponse * _Nullable response,
                                                                       NSError * _Nullable error) {
                                                       
                                                       
                                                       if (error) {
                                                           
                                                           NSLog(@"%@", error.localizedDescription);
                                                           return;
                                                           
                                                       }
                                                       
                                                       NSData *pictureData = [NSData dataWithContentsOfURL:url];
                                                       UIImage *picture = [UIImage imageWithData:pictureData];
                                                       
                                                       [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                                                           
                                                           completion(picture);
                                                           
                                                       }];
                                                       
                                                   }];
    
    [downloadCatPhotos resume];
    
    
}

@end
