//
//  HAJDogBreed.m
//  Dog-C
//
//  Created by Haley Jones on 5/22/19.
//  Copyright © 2019 HaleyJones. All rights reserved.
//

#import "HAJDogBreed.h"

@implementation HAJDogBreed

- (instancetype)initWithName:(NSString *)name subBreeds:(NSArray<HAJSubBreed *> *)subBreeds
{
    self = [super init];
    if (self){
        _name = name;
        _subBreeds = subBreeds;
    }
    return self;
}

@end
