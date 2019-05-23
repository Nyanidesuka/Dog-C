//
//  BreedListTableViewController.m
//  Dog-C
//
//  Created by Haley Jones on 5/22/19.
//  Copyright © 2019 HaleyJones. All rights reserved.
//

#import "BreedListTableViewController.h"

@interface BreedListTableViewController ()
@property(nonatomic) NSArray *breeds;
@end

@implementation BreedListTableViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[HAJBreedNetworkClient new]fetchAllBreeds:^(NSArray<HAJDogBreed *> * _Nullable fetchedBreeds) {
        self.breeds = fetchedBreeds;
        NSLog(@"Got doggles%@", self.breeds);
     //o no how do i main
        [self.tableView reloadData];
    }];
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _breeds.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"breedCell" forIndexPath:indexPath];
    
    HAJDogBreed *breed = _breeds[indexPath.row];
    cell.textLabel.text = breed.name;
    
    return cell;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
