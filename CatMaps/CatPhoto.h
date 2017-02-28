//
//  CatPhoto.h
//  CatMaps
//
//  Created by Sofia Knezevic on 2017-02-28.
//  Copyright © 2017 Sofia Knezevic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CatPhoto : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSURL *imageURL;

- (instancetype)initWithDictionary:(NSDictionary *)dictionaryOfCats;
+ (NSArray *)makePhotoArray:(NSArray *)catPhotoArray;


@end
