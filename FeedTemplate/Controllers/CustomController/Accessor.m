//
//  Accessor.m
//  FeedTemplate
//
//  Created by Amal on 07/02/16.
//  Copyright © 2016 Amal. All rights reserved.
//

#import "Accessor.h"

@implementation Accessor

+ (id)sharedInstance {
    static Accessor *instance = nil;
    static dispatch_once_t token;
    
    dispatch_once(&token, ^{
        instance = [[Accessor alloc] init];
    });
    
    return instance;
}

- (instancetype)init {
    if (self = [super init]) {
        _fileMgr = [[FileMgr alloc] init];
    }
    
    return self;
}

@end
