//
//  ViewController.m
//  CatMaps
//
//  Created by Sofia Knezevic on 2017-02-28.
//  Copyright © 2017 Sofia Knezevic. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"
#import "CatCollectionViewCell.h"
#import "URLManager.h"
#import "SearchViewController.h"

@interface ViewController () <UICollectionViewDelegate, UICollectionViewDataSource, SearchViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *catCollectionView;
@property (nonatomic, strong) NSMutableArray *catsArray;

@property (nonatomic) NSIndexPath *selectedIndexPath;

@end

@implementation ViewController

-(void)viewDidLoad
{
    [super viewDidLoad];

    
    self.catsArray = [[NSMutableArray alloc] init];
    
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
    [URLManager getCatPhotos:@"Hello" withBlock:^(NSArray *photos) {
        self.catsArray = [photos mutableCopy];
        [self.catCollectionView reloadData];
        
    }];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedIndexPath = indexPath;
    [self performSegueWithIdentifier:@"showDetails" sender:self];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ([segue.identifier isEqualToString:@"showDetails"]) {
        
        CatPhoto *photo = [self.catsArray objectAtIndex:self.selectedIndexPath.item];
        DetailViewController *detailVC = segue.destinationViewController;
        detailVC.photoCat = photo;
        
    }else if ([segue.identifier isEqualToString:@"showSearch"]){
        
        SearchViewController *searchVC = segue.destinationViewController;
        searchVC.searchViewControllerDelegate = self;
        
    }
    
}

- (void)getArrayOfSearchedPhotos:(NSMutableArray *)arrayOfTaggedPhotos
{
    
    self.catsArray = arrayOfTaggedPhotos;
    [self.catCollectionView reloadData];
    
}


@end

