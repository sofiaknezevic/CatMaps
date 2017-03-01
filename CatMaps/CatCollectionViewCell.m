//
//  CatCollectionViewCell.m
//  CatMaps
//
//  Created by Sofia Knezevic on 2017-02-28.
//  Copyright © 2017 Sofia Knezevic. All rights reserved.
//

#import "CatCollectionViewCell.h"
#import "URLManager.h"

@interface CatCollectionViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *catImageView;
@property (weak, nonatomic) IBOutlet UILabel *catTitleLabel;



@end

@implementation CatCollectionViewCell

-(void)setPhotoCat:(CatPhoto *)photoCat
{
    _photoCat = photoCat;
    [self configureCell];
}

-(void)configureCell
{
    
    self.catTitleLabel.text = self.photoCat.title;
    
    [URLManager downloadCatPhotos:self.photoCat.imageURL completion:^(UIImage *image) {
        
        self.catImageView.image = image;
        
    }];
}


@end
