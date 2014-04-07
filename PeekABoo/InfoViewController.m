//
//  InfoViewController.m
//  PeekABoo
//
//  Created by Charles Northup on 4/3/14.
//  Copyright (c) 2014 MobileMakers. All rights reserved.
//

#import "InfoViewController.h"
#import "MapViewController.h"
#import "PhotoViewController.h"
#import "WebViewController.h"


@interface InfoViewController ()<UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate, UIScrollViewDelegate, UITextFieldDelegate>
{
    BOOL editModeEnabled;
}
@property (weak, nonatomic) IBOutlet InfoTableView *myTableView;
@property (weak, nonatomic) IBOutlet UIToolbar *myToolBar;
@property (weak, nonatomic) IBOutlet UITextField *myTextField;
@property User* editedUser;
@property NSIndexPath* selectedRow;
@property NSURL* url;
@property CGRect keyBoardUp;
@property CGRect keyBoardDown;


@end

@implementation InfoViewController


- (void)viewDidLoad
{
    self.editedUser = self.myUser;
    [super viewDidLoad];
    editModeEnabled = NO;
    self.myTableView.scrollEnabled = NO;
    self.keyBoardUp = CGRectMake(self.myTableView.frame.origin.x, self.myTableView.frame.origin.y, self.myTableView.frame.size.width, self.myTableView.frame.size.height - 216);
    self.keyBoardDown = self.myTableView.frame;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark -- 3 Table View Delegate Methods

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    [self.myTableView setFrame:self.keyBoardUp];
    [self.myTableView reloadData];
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    [self.myTableView setFrame:self.keyBoardDown];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 11;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"TableViewCellID"];
    InfoTableView *tv = (InfoTableView *)tableView;
    tv.userObject = self.editedUser;
    
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
        case 10:
            cell.textLabel.text = @"Photo";
            cell.detailTextLabel.text = @"";
            break;
            
        default:
            break;
    }
    return cell;
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    
    if (self = [super initWithCoder:aDecoder]) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(keyBoardShown:)
                                                     name:UIKeyboardDidShowNotification
                                                   object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(keyBoardHidden:)
                                                     name:UIKeyboardDidHideNotification
                                                   object:nil];
    }
    return self;
}


-(void)keyBoardShown:(NSNotification*) notification{
    [self.myTableView setFrame:self.keyBoardUp];
    [self.myTableView reloadData];
    [self.myTableView scrollToRowAtIndexPath:self.selectedRow atScrollPosition:UITableViewScrollPositionBottom animated:YES];

    
}

-(void)keyBoardHidden:(NSNotification*) notification{
    [self.myTableView setFrame:self.keyBoardDown];
    [self.myTableView reloadData];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    NSLog(@"%f", self.myTableView.contentOffset.y);
    UITableViewCell* cell = [self.myTableView cellForRowAtIndexPath:self.selectedRow];
    if (self.myTableView.contentOffset.y < 0) {
        self.myToolBar.center = CGPointMake(cell.center.x, (cell.center.y + fabsf(self.myTableView.contentOffset.y)));
    }
    else{
        self.myToolBar.center = CGPointMake(cell.center.x, cell.center.y - fabsf(self.myTableView.contentOffset.y));
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
    
    if (editModeEnabled) {
        self.myTableView.scrollEnabled = YES;
        if (indexPath.row != 10) {
            self.selectedRow = indexPath;
            NSLog(@"%f", cell.frame.origin.y );
            NSLog(@"%f", cell.frame.origin.y-self.view.frame.origin.y);
            self.myToolBar.hidden = NO;
            if (self.myTableView.contentOffset.y < 0) {
                self.myToolBar.center = CGPointMake(cell.center.x, (cell.center.y + fabsf(self.myTableView.contentOffset.y)));
            }
            else{
                self.myToolBar.center = CGPointMake(cell.center.x, cell.center.y - fabsf(self.myTableView.contentOffset.y));
            }
            self.myTextField.text = cell.textLabel.text;
        }
        else{
            self.myToolBar.hidden = YES;

            [self performSegueWithIdentifier:@"PhotoSegue" sender:cell];
        }
        
    }
    else{
        if (indexPath.row == 3) {
            [self.myTextField endEditing:YES];
            [self performSegueWithIdentifier:@"AddressSegue" sender:cell];
            
        }
        else if(indexPath.row == 4){
            [self.myTextField endEditing:YES];
            [self performSegueWithIdentifier:@"AddressSegue" sender:cell];
        }
        else if (indexPath.row == 8){
            [self.myTextField endEditing:YES];
            self.url = [NSURL URLWithString:[NSString stringWithFormat:@"https://github.com/%@", cell.textLabel.text]];
            [self performSegueWithIdentifier:@"WebSegue" sender:cell];


        }
        else if (indexPath.row == 9){
            [self.myTextField endEditing:YES];
            self.url = [NSURL URLWithString:cell.textLabel.text];
            [self performSegueWithIdentifier:@"WebSegue" sender:cell];

        }
    }
}



- (IBAction)onSaveButtonPressed:(id)sender {
    
    
    self.editedUser = self.myUser;
    switch (self.selectedRow.row) {
        case 0:
            self.editedUser.name = self.myTextField.text;
            break;
        case 1:
            self.editedUser.workEmail = self.myTextField.text;
            break;
        case 2:
            self.editedUser.personalEmail = self.myTextField.text;
            break;
        case 3:
            self.editedUser.workAddress = self.myTextField.text;
            break;
        case 4:
            self.editedUser.homeAddress = self.myTextField.text;
            break;
        case 5:
            self.editedUser.cellNumber = self.myTextField.text;
            break;
        case 6:
            self.editedUser.workNumber = self.myTextField.text;
            break;
        case 7:
            self.editedUser.homeNumber = self.myTextField.text;
            break;
        case 8:
            self.editedUser.github = self.myTextField.text;
            break;
        case 9:
            self.editedUser.blog = self.myTextField.text;
            break;
            
            
        default:
            break;
    }
    [self.myTextField endEditing:YES];
    self.myToolBar.hidden = YES;
    self.myUser = self.editedUser;
    [self.myTableView reloadData];
    [self.editMOC save:nil];
}
#pragma mark -- NSFecthedResultsControllerDelegate Methods

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller
{
    [self.myTableView beginUpdates];
}

-(void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    [self.myTableView endUpdates];
}

- (IBAction)onEditPressed:(UIBarButtonItem*) realEditButton
{
    editModeEnabled =! editModeEnabled;
    if (editModeEnabled) {
        [realEditButton setTitle:@"Done"];
    }
    else
    {
        self.myToolBar.hidden = YES;
        self.myUser = self.editedUser;
        [self.myTableView reloadData];
        [self.editMOC save:nil];
        [realEditButton setTitle:@"Edit"];
        
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    UITableViewCell* cell = (UITableViewCell*) sender;
    if ([segue.identifier isEqualToString:@"PhotoSegue"]) {
        [self.myTextField endEditing:YES];
        PhotoViewController* pVC = segue.destinationViewController;
        pVC.photo = self.editedUser.photo;
    }
    else if ([segue.identifier isEqualToString:@"WebSegue"]){
        [self.myTextField endEditing:YES];
        WebViewController* wVC = segue.destinationViewController;
        wVC.url = self.url;
    }
    else if ([segue.identifier isEqualToString:@"AddUserUnwind"]){
        [self.myTextField endEditing:YES];
        self.myUser = self.editedUser;
    }
    else{
    MapViewController* mVC = segue.destinationViewController;
    mVC.address = cell.textLabel.text;
    }
}

-(IBAction)addPhoto:(UIStoryboardSegue *)segue sender:(id)sender{
    PhotoViewController* pVC = segue.sourceViewController;
    self.editedUser.photo = pVC.photo;
    [self.editMOC save:nil];
    [self.myTableView reloadData];
}




@end
