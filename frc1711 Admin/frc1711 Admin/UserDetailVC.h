//
//  UserDetailVC.h
//  frc1711 Admin
//
//  Created by Elijah Cobb on 2/1/17.
//  Copyright © 2017 Apollo Technology. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface UserDetailVC : UITableViewController {
    PFUser *user;
}

@property PFUser *user;

@end
