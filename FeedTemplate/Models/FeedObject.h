//
//  FeedObject.h
//  FeedTemplate
//
//  Created by Amal on 07/02/16.
//  Copyright © 2016 Amal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ItemObject.h"

typedef enum Template {
    TEMPLATE_TYPE_1 = 1,
    TEMPLATE_TYPE_2,
    TEMPLATE_TYPE_3,
}TemplateType;

@interface FeedObject : NSObject

@property(nonatomic, strong)NSString *desc;
@property(nonatomic, strong)NSString *imgUrl;
@property(nonatomic, strong)NSArray *items;

@property(nonatomic, readwrite)TemplateType templateType;

- (instancetype)initObjectWithDictionary:(NSDictionary*)dict;

@end
