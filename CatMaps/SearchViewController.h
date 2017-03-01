//
//  SearchViewController.h
//  CatMaps
//
//  Created by Sofia Knezevic on 2017-02-28.
//  Copyright © 2017 Sofia Knezevic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@protocol SearchViewControllerDelegate <NSObject>

- (void)getArrayOfSearchedPhotos:(NSMutableArray *)arrayOfTaggedPhotos;

@end

@interface SearchViewController : UIViewController

@property (nonatomic, weak) id <SearchViewControllerDelegate> searchViewControllerDelegate;


@end
