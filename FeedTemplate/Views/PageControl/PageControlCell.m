//
//  PageControlCell.m
//  FeedTemplate
//
//  Created by Amal on 07/02/16.
//  Copyright © 2016 Amal. All rights reserved.
//

#import "PageControlCell.h"
#import "ItemObject.h"
#import "UIImageView+AFNetworking.h"


@implementation PageControlCell

- (void)awakeFromNib {

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat pageWidth = CGRectGetWidth(scrollView.frame);
    NSInteger currentPage = (int)floor((scrollView.contentOffset.x-pageWidth/2)/pageWidth)+1;
    
    self.pageControl.currentPage = currentPage;
    [self setPageImage];
}

- (void)scrollViewSetupWithItems:(NSArray*)theItems {
    _items = theItems;
    CGFloat scrollViewWidth = _scrollView.bounds.size.width;
    CGFloat scrollViewHeight = _scrollView.bounds.size.height;
    
    for (int count = 0; count < _items.count; count++) {
        // ItemObject *object = [_items objectAtIndex:count];
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(scrollViewWidth * count, 0,
                                                                             scrollViewWidth,
                                                                             scrollViewHeight)];
        imgView.contentMode = UIViewContentModeScaleToFill;
        imgView.clipsToBounds = YES;
        // [imgView setTranslatesAutoresizingMaskIntoConstraints:NO];

        imgView.tag = 1000 + count;
        imgView.backgroundColor = [UIColor cyanColor];
        [_scrollView addSubview:imgView];
        
        // Set Layout
        UILayoutGuide *margins = [_scrollView layoutMarginsGuide];
        [[imgView leadingAnchor] constraintEqualToAnchor:margins.leadingAnchor].active = true;
        [[imgView trailingAnchor] constraintEqualToAnchor:margins.trailingAnchor].active = true;
        [[imgView topAnchor] constraintEqualToAnchor:margins.topAnchor].active = true;
        [[imgView bottomAnchor] constraintEqualToAnchor:margins.bottomAnchor].active = true;
        
//        [_scrollView addConstraint:[NSLayoutConstraint constraintWithItem:imgView
//                                                              attribute:NSLayoutAttributeWidth
//                                                              relatedBy:NSLayoutRelationEqual
//                                                                 toItem:_scrollView
//                                                              attribute:NSLayoutAttributeWidth
//                                                             multiplier:1.0
//                                                               constant:0]];
        
        if (!count)
            [self setPageImage];
    }
    
    _scrollView.contentSize = CGSizeMake(scrollViewWidth * _items.count, scrollViewHeight);
    _scrollView.delegate = self;
    _pageControl.numberOfPages = _items.count;
    _pageControl.currentPage = 0;
}

- (void)setPageImage {
    CGFloat scrollViewWidth = _scrollView.bounds.size.width;
    NSInteger currentPage = (int)floor((_scrollView.contentOffset.x-scrollViewWidth/2)/scrollViewWidth)+1;
    id obj = [_scrollView viewWithTag:1000+currentPage];
    if ([obj isKindOfClass:[UIImageView class]]) {
        UIImageView *tempImgView = (UIImageView*)obj;
        ItemObject *itemObject = [_items objectAtIndex:currentPage];
        NSLog(@"Set image for index = %ld", (long)currentPage);
        [tempImgView setImageWithURL:[NSURL URLWithString:itemObject.imgUrl] placeholderImage:nil];
    }
}

@end
