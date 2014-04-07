//
//  UserColletionViewCell.m
//  PeekABoo
//
//  Created by Charles Northup on 4/3/14.
//  Copyright (c) 2014 MobileMakers. All rights reserved.
//

#import "UserColletionViewCell.h"
#import "User.h"

@interface UserColletionViewCell()<UITableViewDelegate, UITableViewDataSource>
{
    BOOL infoShown;
}

@end

@implementation UserColletionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)viewDidLoad{
    infoShown = NO;
    [self reloadInputViews];
    //NSFetchRequest* request = [[NSFetchRequest alloc]initWithEntityName:@"User"];
    
    
}

- (IBAction)onInfoButtonPressed:(id)sender {
    
    //need to pass the Moc from RootViewController to the infoViewController
    
    infoShown =! infoShown;
    if (infoShown) {
        self.userInfoTableView.frame = CGRectMake(0, 244, self.userInfoTableView.frame.size.width, 239);
    }else{
        self.userInfoTableView.frame = CGRectMake(0, 483, self.userInfoTableView.frame.size.width, 0);
    }
    
}

#pragma mark -- 3 Table View Delegate Methods
-(void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    UITableViewHeaderFooterView *header = (UITableViewHeaderFooterView *)view;
    [header.textLabel setTextColor:[UIColor colorWithWhite:1.0 alpha:1.0]];
    [header.textLabel setAlpha:1.0];
    [header.textLabel setOpaque:NO];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"OverlayInfoCellID"];
    InfoTableView *tv = (InfoTableView *)tableView;
    
//    cell.textLabel.alpha = 1;
//    cell.detailTextLabel.alpha = 1;
    cell.textLabel.textColor = [UIColor colorWithWhite:1.0 alpha:1.0];
    cell.detailTextLabel.textColor = [UIColor colorWithRed:0.0 green:1.0 blue:0.0 alpha:1.0];
    
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = tv.userObject.name;
            cell.detailTextLabel.text = @"Name";
            break;
        case 1:
            cell.textLabel.text = tv.userObject.workEmail;
            cell.detailTextLabel.text = @"Work Email";
            break;
        case 2:
            cell.textLabel.text = tv.userObject.personalEmail;
            cell.detailTextLabel.text = @"Personal Email";
            break;
        case 3:
            cell.textLabel.text = tv.userObject.workAddress;
            cell.detailTextLabel.text = @"Work Address";
            break;
        case 4:
            cell.textLabel.text = tv.userObject.homeAddress;
            cell.detailTextLabel.text = @"Home Address";
            break;
        case 5:
            cell.textLabel.text = tv.userObject.cellNumber;
            cell.detailTextLabel.text = @"Cell Number";
            break;
        case 6:
            cell.textLabel.text = tv.userObject.workNumber;
            cell.detailTextLabel.text = @"Work Number";
            break;
        case 7:
            cell.textLabel.text = tv.userObject.homeNumber;
            cell.detailTextLabel.text = @"Home Number";
            break;
        case 8:
            cell.textLabel.text = tv.userObject.github;
            cell.detailTextLabel.text = @"GitHub Username";
            break;
        case 9:
            cell.textLabel.text = tv.userObject.blog;
            cell.detailTextLabel.text = @"Blog";
            break;
            
        default:
            break;
    }
    NSLog(@"%@", tv.userObject.personalEmail);
        return cell;
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell*cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.detailTextLabel.textColor = [UIColor whiteColor];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell*cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.textLabel.textColor = [UIColor blackColor];
    cell.detailTextLabel.textColor = [UIColor blackColor];
}


@end
