//
//  FileMgr.m
//  FeedTemplate
//
//  Created by Amal on 07/02/16.
//  Copyright © 2016 Amal. All rights reserved.
//

#import "FileMgr.h"

@implementation FileMgr

- (NSArray*)feedObjects {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"f_one" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSArray *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    
    __block NSMutableArray *objects = [NSMutableArray array];
    [json enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSDictionary *dict = (NSDictionary*)obj;
        FeedObject *object = [[FeedObject alloc] initObjectWithDictionary:dict];
        [objects addObject:object];
    }];
    
    return [NSArray arrayWithArray:objects];
}

@end
