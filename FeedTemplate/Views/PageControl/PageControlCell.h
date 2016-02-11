//
//  PageControlCell.h
//  FeedTemplate
//
//  Created by Amal on 07/02/16.
//  Copyright © 2016 Amal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageControlCell : UITableViewCell<UIScrollViewDelegate>

@property (strong, nonatomic)NSArray *items;
@property (weak, nonatomic)IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic)IBOutlet UIPageControl *pageControl;
@property (weak, nonatomic)IBOutlet UILabel *lblOccation;
@property (weak, nonatomic)IBOutlet UILabel *lblDiscount;
@property (weak, nonatomic)IBOutlet UILabel *lblCondition;

- (void)scrollViewSetupWithItems:(NSArray*)theItems;

@end
