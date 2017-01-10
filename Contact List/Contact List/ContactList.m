//
//  ContactList.m
//  Contact List
//
//  Created by Alex Bearinger on 2017-01-10.
//  Copyright © 2017 Alex Bearinger. All rights reserved.
//

#import "ContactList.h"

@implementation ContactList
@synthesize contactList;

-(instancetype)init{
    self = [super init];
    if (self){
        contactList = [[NSMutableArray alloc] init];
    }
        
    return self;
}

@end
