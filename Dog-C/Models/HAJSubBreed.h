//
//  HAJSubBreed.h
//  Dog-C
//
//  Created by Haley Jones on 5/22/19.
//  Copyright © 2019 HaleyJones. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HAJSubBreed : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSArray<NSString *> *imageURLs;

-(instancetype)initWithName: (NSString *)name;
-(instancetype)initFromDictionary:(NSDictionary *)dictionary;
@end

NS_ASSUME_NONNULL_END
