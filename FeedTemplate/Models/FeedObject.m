//
//  FeedObject.m
//  FeedTemplate
//
//  Created by Amal on 07/02/16.
//  Copyright © 2016 Amal. All rights reserved.
//

#import "FeedObject.h"

@implementation FeedObject

- (instancetype)initObjectWithDictionary:(NSDictionary*)dict {
    if (self = [super init]) {
        self.desc = [dict objectForKey:@"label"];
        self.imgUrl = [[dict objectForKey:@"image"] stringByReplacingOccurrencesOfString:@" " withString:@""];
        [self setTemplateTypeWithString:[dict objectForKey:@"template"]];
        [self parseItems:[dict objectForKey:@"items"]];
    }
    
    return self;
}

- (void)setTemplateTypeWithString:(NSString*)aTemplate {
    NSArray *components = [aTemplate componentsSeparatedByString:@"-"];
    switch (((NSString*)components.lastObject).integerValue) {
        case 1:
            self.templateType = TEMPLATE_TYPE_1;
            break;
            
        case 2:
            self.templateType = TEMPLATE_TYPE_2;
            break;
            
        case 3:
            self.templateType = TEMPLATE_TYPE_3;
            break;
            
        default:
            break;
    }
}

- (void)parseItems:(NSArray*)itemArr {
    __block NSMutableArray *tempItems = [[NSMutableArray alloc] init];
    [itemArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        ItemObject *itemObj = [[ItemObject alloc] initObjectWithDictionary:(NSDictionary*)obj];
        [tempItems addObject:itemObj];
    }];
    
    self.items = [NSArray arrayWithArray:tempItems];
}

@end
