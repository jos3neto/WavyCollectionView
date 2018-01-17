//
//  ViewController.m
//  WavyCollectionView
//
//  Created by Jose on 15/1/18.
//  Copyright © 2018 Jose. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView* collectionView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.collectionView.dataSource = self;
    CustomLayout* customLayout = [CustomLayout new];
    [self.collectionView setCollectionViewLayout:customLayout];
    self.collectionView.backgroundColor = [UIColor groupTableViewBackgroundColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Data Source

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 18;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor magentaColor];
    return cell;
}

@end
