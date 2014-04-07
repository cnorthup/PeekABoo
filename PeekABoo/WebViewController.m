//
//  WebViewController.m
//  PeekABoo
//
//  Created by Charles Northup on 4/6/14.
//  Copyright (c) 2014 MobileMakers. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *myWebView;

@end

@implementation WebViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewDidAppear:(BOOL)animated{
    NSURLRequest* request = [NSURLRequest requestWithURL:self.url];
    NSLog(@"%@",self.url);
    [self.myWebView loadRequest:request];
}

- (void)viewDidLoad
{
    self.myWebView.delegate = self;
    [super viewDidLoad];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
