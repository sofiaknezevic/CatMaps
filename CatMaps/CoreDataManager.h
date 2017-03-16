//
//  CoreDataManager.h
//  CatMaps
//
//  Created by Sofia Knezevic on 2017-03-03.
//  Copyright © 2017 Sofia Knezevic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface CoreDataManager : NSObject

@property (nonatomic) NSManagedObjectContext *managedObjectContext;

+(instancetype)sharedInstance;

@end
