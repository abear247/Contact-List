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
            NSString *inputString = [collector inputFromPrompt:@"new - New contact \nquit - Exits program  \nshow - Contact at index \nlist - List contacts \nfind 'search term' - find matches \nadd number - add phone number \nEnter command:"];
            if ([inputString isEqualToString:@"quit"])
                break;
            
            if ([inputString isEqualToString:@"new"]){
                bool broken = NO;
                contact.email = [collector inputFromPrompt:@"Enter email:"];
                for(Contact *currentContact in contacts.contactList){
                    if ([contact.email isEqualToString:currentContact.email]){
                        NSLog(@"already exists");
                        broken = YES;
                    }
                    
                }
                if(broken)
                    continue;
                contact.name = [collector inputFromPrompt:@"Enter full name:"];
                while(YES){
                    NSString *exit = [collector inputFromPrompt:@"Enter phone number? 'yes' to add or 'done' to exit:"];
                    if ([exit isEqualToString:@"done"])
                        break;
                    
                    NSString *phoneName = [collector inputFromPrompt:@"Enter phone name:"];
                    NSString *number = [collector inputFromPrompt:@"Enter phone number:"];
                    if([exit isEqualToString:@"yes"]){
                        if(!contact.phoneNumbers){
                            contact.phoneNumbers = [NSMutableDictionary dictionaryWithObjectsAndKeys:number,phoneName, nil];
                            
                        }
                    else
                        [contact.phoneNumbers setObject:number forKey:phoneName];
                    }
                    
                }
                
                [contacts addContact:contact];
                NSLog(@"\n");
                
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
                    NSLog(@"%ld: <%@,%@>",(long)i,contact.name,contact.email);
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
            
//            if ([inputString isEqualToString:@"add number"]){
//                NSString *mobile = [collector inputFromPrompt:@"Enter your full name:"];
//                NSString *number = [collector inputFromPrompt:@"Enter your email:"];
//                
//            }
          
            
        }
        
        
        
        
    }
    return 0;
}
