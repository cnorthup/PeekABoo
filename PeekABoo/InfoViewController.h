//
//  InfoViewController.h
//  PeekABoo
//
//  Created by Charles Northup on 4/3/14.
//  Copyright (c) 2014 MobileMakers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
#import "InfoTableView.h"

@interface InfoViewController : UIViewController

@property User* myUser;
@property NSManagedObjectContext* editMOC;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;


@end
