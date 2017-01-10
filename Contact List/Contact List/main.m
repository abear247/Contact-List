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
        ContactList *contacts = [[ContactList alloc]init];
        while(YES){
            Contact *contact = [[Contact alloc]init];
            NSString *inputString = [collector inputFromPrompt:@"new - New contact \nquit - Exits program  \nshow - Contact at index \nlist - List contacts \nEnter command: "];
            if ([inputString isEqualToString:@"quit"])
                break;
            if ([inputString isEqualToString:@"new"]){
                contact.name = [collector inputFromPrompt:@"Enter your full name:"];
                contact.email = [collector inputFromPrompt:@"Enter your email:"];
                [contacts addContact:contact];
            }
            if ([inputString isEqualToString:@"show"]){
                NSInteger index = [[collector inputFromPrompt:@"Enter contact id #:"] intValue];
                if (contacts.contactList[index]){
                    NSLog(@"\nName: %@ \nEmail: %@", contacts.contactList[index].name,contacts.contactList[index].email);
                }
                else
                    NSLog(@"not found");
            }
            if ([inputString isEqualToString:@"list"]){
                NSInteger i = 0;
                for (Contact *contact in contacts.contactList){
                    NSLog(@"%ld: <%@>()",(long)i,contact.name);
                    ++i;
                }
            }
          
            
        }
        
        
        
        
    }
    return 0;
}
