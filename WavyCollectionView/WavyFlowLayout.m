//
//  WavyFlowLayout.m
//  WavyCollectionView
//
//  Created by Alejandro Zielinsky on 2018-04-25.
//  Copyright © 2018 Alejandro Zielinsky. All rights reserved.
//

#import "WavyFlowLayout.h"

@implementation WavyFlowLayout

- (void)prepareLayout {
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.itemSize = CGSizeMake(100, 50);
    // Set minimum interitem spacing to be huge to force all items to be on their own line
    self.minimumInteritemSpacing = CGFLOAT_MAX;
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSArray<UICollectionViewLayoutAttributes *> *superAttrs = [super layoutAttributesForElementsInRect:rect];

    // Need to copy attrs from super to avoid cached frame mismatch
    NSMutableArray<UICollectionViewLayoutAttributes *> *newAttrs = [[NSMutableArray alloc] init];

    // TODO: fill me in!
    CGFloat maxY = CGRectGetMaxY(self.collectionView.bounds);
    
    for(UICollectionViewLayoutAttributes *attribute in superAttrs)
    {
        UICollectionViewLayoutAttributes *attr = [attribute copy];
        int randY = arc4random_uniform(maxY);
        attr.frame = CGRectMake(attribute.center.x, randY, attribute.bounds.size.width,attribute.bounds.size.height +  randY);
        [newAttrs addObject:attr];
    }
    
    return newAttrs;
}

@end
