//
//  CoreDataManager.m
//  CatMaps
//
//  Created by Sofia Knezevic on 2017-03-03.
//  Copyright © 2017 Sofia Knezevic. All rights reserved.
//

#import "CoreDataManager.h"

@implementation CoreDataManager

+ (instancetype)sharedInstance
{
    static CoreDataManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[CoreDataManager alloc] init];
        
    });
    
    return sharedInstance;
}

@end
