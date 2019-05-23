//
//  HAJSubBreed.m
//  Dog-C
//
//  Created by Haley Jones on 5/22/19.
//  Copyright © 2019 HaleyJones. All rights reserved.
//

#import "HAJSubBreed.h"

@implementation HAJSubBreed
- (instancetype)initWithName:(NSString *)name
{
    self = [super init];
    if (self){
        _name = name;
    }
    return self;
}
@end
