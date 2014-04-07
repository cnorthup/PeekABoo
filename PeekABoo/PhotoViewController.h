//
//  PhotoViewController.h
//  PeekABoo
//
//  Created by Charles Northup on 4/6/14.
//  Copyright (c) 2014 MobileMakers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoViewController : UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property UIImage* photo;

@end
