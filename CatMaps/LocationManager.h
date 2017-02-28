//
//  LocationManager.h
//  CatMaps
//
//  Created by Sofia Knezevic on 2017-02-28.
//  Copyright © 2017 Sofia Knezevic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CatPhoto.h"

@interface LocationManager : NSObject

+ (void)getPictureLocationData:(CatPhoto*)picture completion:(void (^)(CLLocationCoordinate2D))completion;

@end
