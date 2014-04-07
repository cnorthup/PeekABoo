//
//  UserColletionViewCell.h
//  PeekABoo
//
//  Created by Charles Northup on 4/3/14.
//  Copyright (c) 2014 MobileMakers. All rights reserved.
//

#import "InfoTableView.h"
#import <UIKit/UIKit.h>

@interface UserColletionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIButton *infoButton;
@property (weak, nonatomic) IBOutlet UIImageView *userImage;
@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UIButton *fakeEditButton;
@property (weak, nonatomic) IBOutlet InfoTableView *userInfoTableView;

@end
