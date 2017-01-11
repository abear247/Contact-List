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
            NSString *inputString = [collector inputFromPrompt:@"new - New contact \nquit - Exits program  \nshow - Contact at index \nlist - List contacts \nfind 'search term' - find matches \nEnter command:"];
            if ([inputString isEqualToString:@"quit"])
                break;
            if ([inputString isEqualToString:@"new"]){
                bool broken = NO;
                contact.name = [collector inputFromPrompt:@"Enter your full name:"];
                contact.email = [collector inputFromPrompt:@"Enter your email:"];
                for(Contact *currentContact in contacts.contactList){
                    if ([contact.name isEqualToString:currentContact.name] && [contact.email isEqualToString:currentContact.email]){
                        NSLog(@"already exists");
                        broken = YES;
                    }
                    
                }
                if(!broken){
                [contacts addContact:contact];
                NSLog(@"\n");
                }
                
               
            }
            if ([inputString isEqualToString:@"show"]){
                NSInteger index = [[collector inputFromPrompt:@"Enter contact id #:"] intValue];
                id a;
                @try {
                    a = contacts.contactList[index];
                }
                @catch (NSException *exception) {
                    NSLog(@"not found");
                    continue;
                }
                
                NSLog(@"\nName: %@ \nEmail: %@", contacts.contactList[index].name,contacts.contactList[index].email);

            }
            if ([inputString isEqualToString:@"list"]){
                NSInteger i = 0;
                for (Contact *contact in contacts.contactList){
                    NSLog(@"%ld: <%@>()",(long)i,contact.name);
                    ++i;
                }
            }
            if ([inputString containsString:@"find"]){
                NSString *find = [inputString stringByReplacingOccurrencesOfString:@"find " withString:@""];
                for (Contact *contact in contacts.contactList){
                    if ([contact.name containsString:find] || [contact.email containsString:find])
                        NSLog(@"%@ \n%@",contact.name,contact.email);
                }
            }
          
            
        }
        
        
        
        
    }
    return 0;
}
