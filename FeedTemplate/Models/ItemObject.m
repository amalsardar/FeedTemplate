//
//  ItemObject.m
//  FeedTemplate
//
//  Created by Amal on 07/02/16.
//  Copyright © 2016 Amal. All rights reserved.
//

#import "ItemObject.h"

@implementation ItemObject

- (instancetype)initObjectWithDictionary:(NSDictionary*)dict {
    if (self = [super init]) {
        self.desc = [dict objectForKey:@"label"];
        if ([dict objectForKey:@"image"] == nil)
            self.imgUrl = [[dict objectForKey:@"image_url"] stringByReplacingOccurrencesOfString:@" " withString:@""];
        else
            self.imgUrl = [[dict objectForKey:@"image"] stringByReplacingOccurrencesOfString:@" " withString:@""];

        self.webUrl = [[dict objectForKey:@"web-url"] stringByReplacingOccurrencesOfString:@" " withString:@""];
        
        NSLog(@"Image URL = %@", self.imgUrl);
    }
    
    return self;
}

@end
