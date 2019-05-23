//
//  HAJDogBreed.h
//  Dog-C
//
//  Created by Haley Jones on 5/22/19.
//  Copyright © 2019 HaleyJones. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HAJSubBreed.h"

NS_ASSUME_NONNULL_BEGIN

@interface HAJDogBreed : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSArray<HAJSubBreed *> *subBreeds;
@property (nonatomic, copy) NSArray<NSString *> *imageURLs;

-(instancetype)initWithName: (NSString *)name subBreeds:(NSArray<HAJSubBreed *> *)subBreeds;
-(instancetype)initFromDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
