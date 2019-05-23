//
//  HAJBreedNetworkClient.m
//  Dog-C
//
//  Created by Haley Jones on 5/22/19.
//  Copyright © 2019 HaleyJones. All rights reserved.
//

#import "HAJBreedNetworkClient.h"

static NSString * const baseURLString = @"https://dog.ceo/api";

@implementation HAJBreedNetworkClient


- (void)fetchAllBreeds:(void (^)(NSMutableArray<HAJDogBreed *> * _Nullable))completion
{
    
    NSURL *breedsURL = [NSURL URLWithString:@"https://dog.ceo/api/breeds/list/all"];
    [[[NSURLSession sharedSession]dataTaskWithURL:breedsURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error){
            NSLog(@"There was an error in %s: %@, %@", __PRETTY_FUNCTION__, error, [error localizedDescription]);
            completion(nil);
            return;
        }
        
        if (!data){
            NSLog(@"There was an error in %s", __PRETTY_FUNCTION__);
            completion(nil);
            return;
        }
        NSDictionary *dogBreedsTLD = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        NSMutableArray *breedsArray = [NSMutableArray new];
        NSDictionary *dogDictionary = dogBreedsTLD[@"message"];
        for (NSString *key in dogDictionary){
            NSMutableArray *subBreeds = dogDictionary[key];
            NSMutableArray *dogSubBreeds = [NSMutableArray new];
            for (NSString *subBreed in subBreeds){
                HAJSubBreed *newSub = [[HAJSubBreed alloc]initWithName:subBreed];
                [dogSubBreeds addObject:newSub];
            }
            HAJDogBreed *newBreed = [[HAJDogBreed alloc]initWithName:key subBreeds:dogSubBreeds];
            [breedsArray addObject:newBreed];
        }
        completion(breedsArray);
    }]resume];
}

- (void)fetchBreedImageURLs:(HAJDogBreed *)breed completion:(void (^)(NSArray<NSString *> * _Nullable))completion
{
    NSURL *baseUrl = [NSURL URLWithString:baseURLString];
    baseUrl = [baseUrl URLByAppendingPathComponent:@"breed"];
    baseUrl = [baseUrl URLByAppendingPathComponent:breed.name];
    NSURL *finalURL = [baseUrl URLByAppendingPathComponent:@"images"];
    NSLog(@"%@", [finalURL absoluteString]);
    
    //actually get out there and do the things
    [[[NSURLSession sharedSession]dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error){
            NSLog(@"There was an error in %s: %@, %@", __PRETTY_FUNCTION__, error, [error localizedDescription]);
            completion(nil);
            return;
        }
        if (!data){
            NSLog(@"There was an error in %s", __PRETTY_FUNCTION__);
            completion(nil);
            return;
        }
        NSDictionary *jsonTLD = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        NSArray *imageUrls = jsonTLD[@"message"];
        completion(imageUrls);
    }]resume];
}

- (void)fetchSubBreedImageURLs:(HAJDogBreed *)breed subBreed:(HAJSubBreed *)subBreed completion:(void (^)(NSArray<NSString *> * _Nullable))completion
{
    NSURL *baseUrl = [NSURL URLWithString:baseURLString];
    baseUrl = [baseUrl URLByAppendingPathComponent:@"breed"];
    baseUrl = [baseUrl URLByAppendingPathComponent:breed.name];
    baseUrl = [baseUrl URLByAppendingPathComponent:subBreed.name];
    NSURL *finalURL = [baseUrl URLByAppendingPathComponent:@"images"];
    NSLog(@"%@", [finalURL absoluteString]);
    
    //actually get out there and do the things
    [[[NSURLSession sharedSession]dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error){
            NSLog(@"There was an error in %s: %@, %@", __PRETTY_FUNCTION__, error, [error localizedDescription]);
            completion(nil);
            return;
        }
        if (!data){
            NSLog(@"There was an error in %s", __PRETTY_FUNCTION__);
            completion(nil);
            return;
        }
        NSDictionary *jsonTLD = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        NSArray *imageUrls = jsonTLD[@"message"];
        completion(imageUrls);
    }]resume];
}

- (void)fetchImageData:(NSURL *)url completion:(void (^)(NSData * _Nullable))completion
{
    [[[NSURLSession sharedSession]dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error){
            NSLog(@"There was an error in %s: %@, %@", __PRETTY_FUNCTION__, error, [error localizedDescription]);
            completion(nil);
            return;
        }
        if (!data){
            NSLog(@"There was an error in %s", __PRETTY_FUNCTION__);
            completion(nil);
            return;
        }
        completion(data);
    }]resume];
}

@end
