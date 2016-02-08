//
//  ItemObject.h
//  FeedTemplate
//
//  Created by Amal on 07/02/16.
//  Copyright © 2016 Amal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ItemObject : NSObject

@property(nonatomic, strong)NSString *desc;
@property(nonatomic, strong)NSString *imgUrl;
@property(nonatomic, strong)NSString *webUrl;

- (instancetype)initObjectWithDictionary:(NSDictionary*)dict;

@end
