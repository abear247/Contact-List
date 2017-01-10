//
//  main.m
//  Contact List
//
//  Created by Alex Bearinger on 2017-01-10.
//  Copyright © 2017 Alex Bearinger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InputCollector.h"
#import "Contact.h"
#import "ContactList.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        InputCollector *collector = [[InputCollector alloc]init];
        ContactList *contactList = [[ContactList alloc]init];
        while(YES){
            Contact *contact = [[Contact alloc]init];
            NSString *inputString = [collector inputFromPrompt:@"Enter command: new or quit: "];
            if ([inputString isEqualToString:@"new"]){
                contact.name = [collector inputFromPrompt:@"Enter your username:"];
                contact.email = [collector inputFromPrompt:@"Enter your email:"];
            }
            
        }
        
        
        
        
    }
    return 0;
}
