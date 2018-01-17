//
//  CustomLayout.m
//  WavyCollectionView
//
//  Created by Jose on 15/1/18.
//  Copyright © 2018 Jose. All rights reserved.
//

#import "CustomLayout.h"

@interface CustomLayout ()
@property (strong, nonatomic) NSMutableArray<UICollectionViewLayoutAttributes*>* allAttrsArray;
@end

@implementation CustomLayout

//collection view will fire this method once, in the beginning of the layout cycle
-(void) prepareLayout
{
    //stock layout, for the whole collection view
    //these are properties of the flow layout object
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.itemSize = CGSizeMake(100, 50);
    //set huge minimum interitem spacing to force items to be on their own line
    self.minimumInteritemSpacing = CGFLOAT_MAX;
    
    //init array for layout attributes
    self.allAttrsArray = [NSMutableArray new];
}

//custom layout provider method, for particular cells
// this method is called by the collectionView somewhat frequently.
//"rect" is usually the visible area.
-(NSArray<UICollectionViewLayoutAttributes*>*) layoutAttributesForElementsInRect:(CGRect)rect
{
    [self.allAttrsArray removeAllObjects];
    CGFloat maxY = CGRectGetMaxY(self.collectionView.frame);
    NSInteger nSections = self.collectionView.numberOfSections;
    
    //looping over each item of each section, adding attributes object to array
    for (int s = 0; s < nSections; s++)
    {
        NSInteger nItems = [self.collectionView numberOfItemsInSection:s];
        
        for (int i = 0; i < nItems; i++)
        {
            //need to get attributes from super to avoid cached frame mismatch
            UICollectionViewLayoutAttributes* attrs = [super layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:i inSection:s]];
            
            UICollectionViewLayoutAttributes* attrsCopy = attrs;
            
            if (CGRectIntersectsRect(attrs.frame, rect))
            {
                attrsCopy.center = CGPointMake(attrsCopy.center.x, arc4random_uniform(maxY-2*(self.itemSize.height/2))+self.itemSize.height/2);
                [self.allAttrsArray addObject:attrsCopy];
            }
            else
            {
                [self.allAttrsArray addObject:attrs];
            }
        }
    }
    
    return self.allAttrsArray;
}
@end
