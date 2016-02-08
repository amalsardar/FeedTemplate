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
@property (strong, nonatomic)IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic)IBOutlet UIPageControl *pageControl;

- (void)scrollViewSetupWithItems:(NSArray*)theItems;

@end
