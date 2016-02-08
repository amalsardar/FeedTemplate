//
//  FeedbackCell.m
//  FeedTemplate
//
//  Created by Amal on 07/02/16.
//  Copyright © 2016 Amal. All rights reserved.
//

#import "FeedbackCell.h"
#import "ItemCell.h"
#import "ItemObject.h"
#import "UIImageView+AFNetworking.h"

@implementation FeedbackCell

static NSString *itemCellId = @"ItemCellId";

- (void)awakeFromNib {

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

+ (NSInteger)cellHeight {
    return 150;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _items.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ItemCell *cell = (ItemCell*)[collectionView dequeueReusableCellWithReuseIdentifier:itemCellId
                                                                          forIndexPath:indexPath];
    
    ItemObject *object = [_items objectAtIndex:indexPath.row];
    [cell.imgView setImageWithURL:[NSURL URLWithString:object.imgUrl] placeholderImage:nil];
    cell.lblDesc.text = object.desc;
    
    return cell;
}


@end
