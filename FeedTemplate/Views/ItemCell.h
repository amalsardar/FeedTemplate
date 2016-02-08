//
//  ItemCell.h
//  FeedTemplate
//
//  Created by Amal on 07/02/16.
//  Copyright © 2016 Amal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemCell : UICollectionViewCell

@property(nonatomic, weak)IBOutlet UIImageView *imgView;
@property(nonatomic, weak)IBOutlet UIButton *btnCart;
@property(nonatomic, weak)IBOutlet UILabel *lblDesc;
@property(nonatomic, weak)IBOutlet UILabel *lblDiscountedPrice;
@property(nonatomic, weak)IBOutlet UILabel *lblActuatPrice;


@end
