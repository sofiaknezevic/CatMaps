//
//  ViewController.m
//  CatMaps
//
//  Created by Sofia Knezevic on 2017-02-28.
//  Copyright © 2017 Sofia Knezevic. All rights reserved.
//

#import "ViewController.h"
#import "CatCollectionViewCell.h"
#import "URLManager.h"

@interface ViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *catCollectionView;
@property (nonatomic, strong) URLManager *vcURLManager;
@property (nonatomic, strong) NSMutableArray *catsArray;

@end

@implementation ViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.catsArray = [[NSMutableArray alloc] init];
    
    self.vcURLManager = [[URLManager alloc] init];
    
    [self getPictures];
    
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    CatCollectionViewCell *cell = [self.catCollectionView dequeueReusableCellWithReuseIdentifier:@"catCell" forIndexPath:indexPath];
    
    cell.photoCat = self.catsArray[indexPath.row];
    
    return cell;
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return self.catsArray.count;
}

- (void)getPictures
{
    [self.vcURLManager getCatPhotos:^(NSArray *photos) {
        self.catsArray = [photos mutableCopy];
        [self.catCollectionView reloadData];
        
    }];
}

@end

