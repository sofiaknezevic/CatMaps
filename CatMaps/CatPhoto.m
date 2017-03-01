//
//  CatPhoto.m
//  CatMaps
//
//  Created by Sofia Knezevic on 2017-02-28.
//  Copyright © 2017 Sofia Knezevic. All rights reserved.
//

#import "CatPhoto.h"

@implementation CatPhoto

- (instancetype)initWithDictionary:(NSDictionary *)dictionaryOfCats
{
    self = [super init];
    if (self) {
        
        self.title = dictionaryOfCats[@"title"];
        self.photoID = dictionaryOfCats[@"id"];
        
                                        
        NSString *urlString = [NSString stringWithFormat:@"https://farm%@.staticflickr.com/%@/%@_%@.jpg",
                               dictionaryOfCats[@"farm"],
                               dictionaryOfCats[@"server"],
                               dictionaryOfCats[@"id"],
                               dictionaryOfCats[@"secret"]];
        
        self.imageURL = [NSURL URLWithString:urlString];
        
        
    }
    return self;
}


+ (NSArray *)makePhotoArray:(NSArray *)catPhotoArray
{
    NSMutableArray *theCats = [[NSMutableArray alloc] init];
    
    for (NSDictionary *information in catPhotoArray) {
        
        CatPhoto *photo = [[CatPhoto alloc] initWithDictionary:information];
        [theCats addObject:photo];
        
    }
    
    return theCats;
}



@end
