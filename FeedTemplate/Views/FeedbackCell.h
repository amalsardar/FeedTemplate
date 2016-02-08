//
//  FeedbackCell.h
//  FeedTemplate
//
//  Created by Amal on 07/02/16.
//  Copyright © 2016 Amal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeedbackCell : UITableViewCell<UICollectionViewDataSource, UICollectionViewDelegate>

@property(nonatomic, weak)IBOutlet UICollectionView *collectView;
@property(nonatomic, strong)NSArray *items;


+ (NSInteger)cellHeight;

@end
