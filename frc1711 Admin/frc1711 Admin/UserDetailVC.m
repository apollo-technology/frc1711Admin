//
//  UserDetailVC.m
//  frc1711 Admin
//
//  Created by Elijah Cobb on 2/1/17.
//  Copyright © 2017 Apollo Technology. All rights reserved.
//

#import "UserDetailVC.h"

@interface UserDetailVC (){
    IBOutlet UILabel *firstNameLabel;
    IBOutlet UILabel *lastNameLabel;
    IBOutlet UILabel *teamLabel;
    IBOutlet UILabel *phoneLabel;
}

@end

@implementation UserDetailVC

@synthesize user;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    firstNameLabel.text = user[@"firstName"];
    lastNameLabel.text = user[@"lastName"];
    teamLabel.text = user[@"team"];
    phoneLabel.text = user[@"username"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
