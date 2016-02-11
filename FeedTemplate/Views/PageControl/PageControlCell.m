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

@interface PageControlCell()


@end


@implementation PageControlCell

- (void)awakeFromNib {

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat pageWidth = [UIScreen mainScreen].bounds.size.width;// CGRectGetWidth(scrollView.frame);
    NSInteger currentPage = (int)floor((scrollView.contentOffset.x-pageWidth/2)/pageWidth)+1;
    NSLog(@"Scrollview width = %f", pageWidth);
    
    self.pageControl.currentPage = currentPage;
    [self setPageImage:currentPage];
}

- (void)scrollViewSetupWithItems:(NSArray*)theItems {
    _items = theItems;
    CGFloat scrollViewWidth = [UIScreen mainScreen].bounds.size.width; // CGRectGetWidth(_scrollView.frame);
    CGFloat scrollViewHeight = CGRectGetHeight(_scrollView.frame);
    
    NSArray *subViews = [_scrollView subviews];
    for (id subView in subViews)
        [subView removeFromSuperview];
    
    for (int count = 0; count < _items.count; count++) {
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(scrollViewWidth * count, 0,
                                                                             scrollViewWidth,
                                                                             scrollViewHeight)];
        imgView.contentMode = UIViewContentModeScaleToFill;
        imgView.clipsToBounds = YES;

        imgView.tag = 1000 + count;
        [_scrollView addSubview:imgView];
        
        // Set Layout
//        [imgView setTranslatesAutoresizingMaskIntoConstraints:NO];
//        UILayoutGuide *margins = [_scrollView layoutMarginsGuide];
//        [[imgView leadingAnchor] constraintEqualToAnchor:margins.leadingAnchor].active = true;
//        [[imgView trailingAnchor] constraintEqualToAnchor:margins.trailingAnchor].active = true;
//        [[imgView topAnchor] constraintEqualToAnchor:margins.topAnchor].active = true;
//        [[imgView bottomAnchor] constraintEqualToAnchor:margins.bottomAnchor].active = true;
//        [[imgView widthAnchor] constraintEqualToAnchor:margins.widthAnchor].active = true;
//        [[imgView heightAnchor] constraintEqualToAnchor:margins.heightAnchor].active = true;
        
        NSLog(@"Scrollview width = %f", scrollViewWidth);
        
        ItemObject *object = [_items objectAtIndex:count];
        _lblOccation.text = object.desc;
    }
    
    _scrollView.contentSize = CGSizeMake(scrollViewWidth * _items.count, scrollViewHeight);
    [_scrollView setCanCancelContentTouches:YES];
    _scrollView.userInteractionEnabled = YES;
    
    _pageControl.numberOfPages = _items.count;
    _pageControl.currentPage = 0;
    
    [self setPageImage:0];
}

- (void)setPageImage:(NSUInteger)currentPage {
    CGFloat scrollViewWidth = [UIScreen mainScreen].bounds.size.width; // CGRectGetWidth(_scrollView.frame);
    CGFloat scrollViewHeight = CGRectGetHeight(_scrollView.frame);
    id obj = [_scrollView viewWithTag:1000 + currentPage];
    if ([obj isKindOfClass:[UIImageView class]]) {
        UIImageView *tempImgView = (UIImageView*)obj;
        [_scrollView scrollRectToVisible:CGRectMake(currentPage * scrollViewWidth, 0,
                                                    scrollViewWidth, scrollViewHeight) animated:NO];
        // TODO!!!
        if (tempImgView.tag == 1000) {
            _scrollView.contentOffset = CGPointMake(0, 0);
        }
        
        ItemObject *itemObject = [_items objectAtIndex:currentPage];
        NSLog(@"Set image for index = %ld", (long)currentPage);
        [tempImgView setImageWithURL:[NSURL URLWithString:itemObject.imgUrl] placeholderImage:[UIImage imageNamed:@"cart"]];
    }
}

@end
