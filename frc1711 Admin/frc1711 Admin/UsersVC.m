//
//  UsersVC.m
//  frc1711 Admin
//
//  Created by Elijah Cobb on 2/1/17.
//  Copyright © 2017 Apollo Technology. All rights reserved.
//

#import "UsersVC.h"
#import "TableViewCell.h"
#import <Parse/Parse.h>
#import "UserDetailVC.h"

@interface UsersVC (){
    NSArray *users;
    UIRefreshControl *refreshControl;
}

@end

@implementation UsersVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(handleRefresh:) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:refreshControl];
    
    [self handleRefresh:nil];
    
}

- (void)handleRefresh:(id)sender{
    PFQuery *query = [PFUser query];
    [query addAscendingOrder:@"team"];
    [query addAscendingOrder:@"lastName"];
    [query addAscendingOrder:@"firstName"];
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        if (error) {
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error" message:error.localizedDescription preferredStyle:UIAlertControllerStyleAlert];
            [alertController addAction:[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil]];
            [self presentViewController:alertController animated:YES completion:nil];
        } else {
            users = objects;
            [self.tableView reloadData];
            [refreshControl endRefreshing];
            self.navigationItem.title = [NSString stringWithFormat:@"%i Users",(int)users.count];
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return users.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    PFUser *user = [users objectAtIndex:indexPath.row];
    cell.nameLabel.text = [NSString stringWithFormat:@"%@ %@",user[@"firstName"],user[@"lastName"]];
    cell.teamLabel.text = [NSString stringWithFormat:@"%@",user[@"team"]];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    PFUser *user = [users objectAtIndex:indexPath.row];
    UserDetailVC *newViewC = [self.storyboard instantiateViewControllerWithIdentifier:@"userDetail"];
    newViewC.user = user;
    [self.navigationController pushViewController:newViewC animated:YES];
}

@end
