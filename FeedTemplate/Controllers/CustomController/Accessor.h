//
//  Accessor.h
//  FeedTemplate
//
//  Created by Amal on 07/02/16.
//  Copyright © 2016 Amal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FileMgr.h"

@interface Accessor : NSObject

@property(nonatomic, strong)FileMgr *fileMgr;

+ (id)sharedInstance;

@end
