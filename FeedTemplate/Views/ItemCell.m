//
//  ItemCell.m
//  FeedTemplate
//
//  Created by Amal on 07/02/16.
//  Copyright © 2016 Amal. All rights reserved.
//

#import "ItemCell.h"

@implementation ItemCell

- (void)awakeFromNib {
    self.layer.cornerRadius = 3;
    self.layer.masksToBounds = YES;
    
//    self.layer.shadowRadius = 2;
//    self.layer.shadowOpacity = 1.0f;
//    self.layer.shadowColor = [UIColor redColor].CGColor;
//    self.layer.shadowOffset = CGSizeMake(0, -2);
}

@end
