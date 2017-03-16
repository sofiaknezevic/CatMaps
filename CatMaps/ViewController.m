//
//  ViewController.m
//  CatMaps
//
//  Created by Sofia Knezevic on 2017-02-28.
//  Copyright © 2017 Sofia Knezevic. All rights reserved.
//

#import "ViewController.h"
#import "URLManager.h"
#import "DetailViewController.h"
#import "CatCollectionViewCell.h"
#import "SearchViewController.h"
#import "ShowAllViewController.h"

@interface ViewController () <UICollectionViewDelegate, UICollectionViewDataSource, SearchViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *catCollectionView;
@property (nonatomic, strong) NSMutableArray *catsArray;

@property (nonatomic) NSIndexPath *selectedIndexPath;

@property (nonatomic, strong) ShowAllViewController *vcShowAll;

@end

@implementation ViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self performSegueWithIdentifier:@"showSearch" sender:self];
    self.catsArray = [[NSMutableArray alloc] init];
    
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
        
    }else if ([segue.identifier isEqualToString:@"showAll"]){
        
        ShowAllViewController *showAllVC = segue.destinationViewController;
        showAllVC.arrayOfShowAllPhotos = self.catsArray;
        
    }
        
}

- (void)getArrayOfSearchedPhotos:(NSMutableArray *)arrayOfTaggedPhotos
{
    self.catsArray = arrayOfTaggedPhotos;
    
    [self.catCollectionView reloadData];
    
}



@end

