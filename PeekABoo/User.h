//
//  User.h
//  PeekABoo
//
//  Created by Charles Northup on 4/5/14.
//  Copyright (c) 2014 MobileMakers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface User : NSManagedObject

@property (nonatomic, retain) NSString * cellNumber;
@property (nonatomic, retain) NSString * homeAddress;
@property (nonatomic, retain) NSString * homeNumber;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * personalEmail;
@property (nonatomic, retain) id photo;
@property (nonatomic, retain) NSString * workAddress;
@property (nonatomic, retain) NSString * workEmail;
@property (nonatomic, retain) NSString * workNumber;
@property (nonatomic, retain) NSString * blog;
@property (nonatomic, retain) NSString * github;

@end
