//
//  HAJBreedNetworkClient.h
//  Dog-C
//
//  Created by Haley Jones on 5/22/19.
//  Copyright © 2019 HaleyJones. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HAJDogBreed.h"
#import "HAJSubBreed.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HAJBreedNetworkClient : NSObject

-(void)fetchAllBreeds:(void (^) (NSMutableArray<HAJDogBreed *> *))completion;
-(void)fetchBreedImageURLs:(HAJDogBreed *)breed completion:(void (^) (NSArray<NSString *> *))completion;
-(void)fetchSubBreedImageURLs:(HAJDogBreed *)breed subBreed:(HAJSubBreed *)subBreed completion:(void (^) (NSArray<NSString *> *))completion;
-(void)fetchImageData:(NSURL *)url completion:(void (^) (NSData *))completion;

@end

NS_ASSUME_NONNULL_END
